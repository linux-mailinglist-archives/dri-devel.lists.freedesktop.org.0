Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96358A3E0FC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0540110E9B6;
	Thu, 20 Feb 2025 16:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="U+miU9ib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010011.outbound.protection.outlook.com
 [52.103.67.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6C910E9D9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 16:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYV6x3Po6JdL+4yK0ALIlIrpDx5p86/2/hkmMz1VmNmFFir39bCNBif8iz3I6kFnm2teqMgX+M5F0sF/7qrRqACWd8phP9+olHvCX6y0lffVijTLgRpmWUNUjI/ogXnT9Xet6PqPtIEKqnJNKhlynqUKAVArChANzMD8UkEdWTk+jyNckSbOG9r2xVn0cFyBdl6MxbNz7vR7dxtLBNMjTRm76b2uG3ajLaWthCaybyqO1+lqsxkz7bJUtlhxnmQjx7am5JiQ2XDS4SQ0VTBW7lP3XWVLlNp37LWgSlh6u9I7ZrETv0cYeAx4x+8e5O6EdcLm29zzFAsuxlSV9nYB6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xG7hGQLRiBYKlH9UOgXW4Djmx9kxWyvom7PRdyuhKzA=;
 b=lJ/IbMkzuEogs0ZfjJ7/X1l5FAnbDcMFiisNXXucj6uGFqpgRV+AKNrM3GAD8n05xBAG3DN5XRrN05IT1T7psnJPjwiwTW8snf1muK+KyyjvDHzegJsv4uZBTemtnIf2sShTng0/5I1pYWGIDOe4sHnQffG0HZoJKnisrmqB3dFQFNUOS7OrJBGmD8hbKogn28d2rOgZymM0wEFGZrVHns3SUgL3z98hxLBAUe/oJDROdPy2ZPf4OMDFXT+gU+kn2kuWnbpczR8eGSFOLVulhXrM0DR+BuxkebbtwZiRE7kVtRgNjoRgxUkfhtiqMvAiiUNeXAG2n8x/VCJkxJj6nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xG7hGQLRiBYKlH9UOgXW4Djmx9kxWyvom7PRdyuhKzA=;
 b=U+miU9ib2o947qg26/DyjN7wxAy4dE5nxUpyc+u2PDd7BbH+iBKWQaHrDG3UunQZjEgiboZZ78OISl5IrJpq1nE2T0SYmPjj82kja+aXKKrtN5nREzxuOYA1SDux7Pc550KpShoXMz+q9GIze0qZ27+ESTu3UbjwqLzPpPFi2tBYHjOU5MT3bJF1ui21vWHPzQKGcu4rIDWXQLr2Nk6ERdKBjlsVKMPO4/46tVBQk/4HL8+gO3ME9H3pbb3ppeQN33Vk1I80t9D7R34HM1sn5785g2GeNajkrZRTn5oawGk2N6hU/NAnIVTcdPvB6IQWVMCgU+wVM1Nw8HtpGdjRNg==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN3PR01MB5548.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Thu, 20 Feb
 2025 16:39:23 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 16:39:23 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "linux@rasmusvillemoes.dk"
 <linux@rasmusvillemoes.dk>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
CC: "kekrby@gmail.com" <kekrby@gmail.com>, "admin@kodeit.net"
 <admin@kodeit.net>, Orlando Chamberlain <orlandoch.dev@gmail.com>,
 "evepolonium@gmail.com" <evepolonium@gmail.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "asahi@lists.linux.dev"
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Topic: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Index: AQHbg7X/aqXgA+m6ckGovV62HIljEQ==
Date: Thu, 20 Feb 2025 16:39:23 +0000
Message-ID: <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
In-Reply-To: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN3PR01MB5548:EE_
x-ms-office365-filtering-correlation-id: 6e605b4c-a9ea-4258-19e7-08dd51cd21e1
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|19110799003|15080799006|461199028|7092599003|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?OibTCOEwF+48tuApgDrq6NUZntelurFqA+XgLsHQeErHCUCSfvOFafIVqsuf?=
 =?us-ascii?Q?bbnS0AM+xisvkm4hMiI2Rg4VYj7d6gUpTYMFM7mS/c1UvZ0rprymUCoHavYY?=
 =?us-ascii?Q?Nerso59BUGwLV0Bu5Eb+hcJPAtro/rdd4Rd0y+SnzA2ubdDgnpk4jgFEesoM?=
 =?us-ascii?Q?Vq8akWnZNwwv/Ur3sBXlIH8NJLdR//k9Cuz/EXEWWkclCcC1li0Cr30tuvV4?=
 =?us-ascii?Q?PIV5gdsolP6w/qQSvW2qsMPl0tlPVvlsm1MvSkwNxQ/BYIMlYeirLjQjlOJO?=
 =?us-ascii?Q?qXnRB1cA4UlhtzdDMnfqg30D0RsBq6dIfNzQZFTqzBEgA2f2yArrl+mfrYDD?=
 =?us-ascii?Q?CRSWkwQaUOaAGBXwzkncCbYOs5cCWifB7gJaR/AXcL4B3soqwfCjFstuSqLY?=
 =?us-ascii?Q?LsY1h7vL77Vv0A+CCZqkkdHoYZgC9i1pLpunDmHE65coakul10TGeiPLNmqj?=
 =?us-ascii?Q?mXyLUIC6bje/nSlihEMRmh/ZjcyDwzL99gfXWSVVL1TawcQuChOswWGPEBbS?=
 =?us-ascii?Q?UUs9CSxFpsdZe7tGOnh4WNEP2z0DccW60AzCAM3QjBTnPSooBPgdMbz/UXBL?=
 =?us-ascii?Q?Q6r4XfR5rJP7/nF5TQMX7GhXV6vXmYew726yxVBEXlGf6JN9PbYLD/qgkPfp?=
 =?us-ascii?Q?SHHABZAOZtHurVSXoD2pegrUQRFAXwKzYlDZwlZrSekOqp+wCwHU2R82StMJ?=
 =?us-ascii?Q?gnZq6jtPBfP8EkK06tl1EA2e4mxN75/qVZ0qkoNCDblz9yEjx+H8HiyDRBYz?=
 =?us-ascii?Q?GmvGANN4KRYf9hmhT9By/8voDrAW/fzmgHN0Nu9tW1MIbqmk8PlOwQ9oDXxo?=
 =?us-ascii?Q?OVfY5j4CtJhhm9lWunxRWKHSAbhe4QczqAvcXbhV9zLLv6dBsMvLblUtcS4C?=
 =?us-ascii?Q?I6ptelHiaV5l/thv7BFjyx4tJ0Z4q7/uhXq/sbq6emcJsMiyyx4TPEd4Y8vG?=
 =?us-ascii?Q?ut0KPkePgqG4ICdPomOSXVVgCZYp+bjNURKD+uXTOyYwOuS2dwCEL4aRIdpw?=
 =?us-ascii?Q?dzfhNE93LFT20opYMZgSPSO9wLOXgfCiTxxV1qLHRlsz0sSgpiPKf0SZJwGv?=
 =?us-ascii?Q?DnWWv60vd1vhB0SHSzmOaJNWgOTaPhhPqaJgvH0yZHHCBP+lEG0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0vpySTIn8cVZxZ1U7hAuvi49hWUi3MNpWjoIfXijIPXc80JW1JgwF7Q+RFws?=
 =?us-ascii?Q?0ZWutztE8w7Ay2wEZZ/5RldvuElDsxAZo6GB/kzyPFg6cel1bULW6xKvp32A?=
 =?us-ascii?Q?2xGw2mqHwOMuFd0EdJVPoIWDsg4PbUYiNZyjgn0tDQe7jM9cevLzQArEM7K1?=
 =?us-ascii?Q?zKSBYSLZMIvH+TGR3G5NP9XNeigtIHnt5UCg1OPfRwuhtfpReUy5nVO1+XsC?=
 =?us-ascii?Q?AiW4ySf9pBw8lTIlMQbZry24z/4MUH1SSszioBnOqhxJ61tdJkUtzYq7lCus?=
 =?us-ascii?Q?45O+o5ZK5lKzWTRsqp+MSFcjSd7RcPLD/0AylgsDIRDPK/Quw9rCQZ1B27UW?=
 =?us-ascii?Q?WSPlwUNAcBDHB0fH2fRk2EOFreL/uzgDpIHOGIQbhM12KikPH/ueYDXBLuaY?=
 =?us-ascii?Q?mqPKeiOVZguTONTu6ZOobmfPZCO7iMIhmC2wMotDkocNsjFCshkakkbBpQv+?=
 =?us-ascii?Q?Z1ybax2eQ67Shx9MmSYdWiMDYlYmoXG/uwyP+xOUw2wJdKAq+1rMUvLE0CbM?=
 =?us-ascii?Q?dbwqCIsirO0NaPY047e9tk/pY9P0e02g04EvAixEPGCQNJqGb96uALSkziWF?=
 =?us-ascii?Q?3SIU4L69V5kqD7I+vqbQukYrYt4NdISkQIG93QZUDI0d4u5/2QSpJvOVzV0r?=
 =?us-ascii?Q?Hjh83LnEb9vCYWOxwxX7YqxdqLdn7E6KAZ4ZmszrYeP8v7zVHfoXMfHP1o4L?=
 =?us-ascii?Q?7vz8tXwOndArHxbR/eVvd5hHm83Zgggj4VgFucV9WgPIXKgD68NOommbvRaX?=
 =?us-ascii?Q?I4HhF6kYVugmf95EaaaEOdymoXcINx159wJsBAiAwY8zYKXxY1HYzl64dxx3?=
 =?us-ascii?Q?z0Unr0Qzcw91b2J4DzyXcnXQ9p5swJbI7puAijPD0DkDFvONkyKbvsl97V/A?=
 =?us-ascii?Q?C6Wud3UCpOf4s5yV1us/5cXFTieUOOMlaf9PUPkQSaUBU0jGj7OykHO/x4aP?=
 =?us-ascii?Q?jyk0ut4AzJfnViDWdUpxFOk2CBK2L3qrenRCNAFsSV2JCBezxGoKt5rGfHMz?=
 =?us-ascii?Q?O7eCj+0HINWIck+stxMP6pK/S10yST92Y1fbuw6ZKvBkpuogarZfO9BAI2v8?=
 =?us-ascii?Q?vByksU1Cw6Qeqk3WiHY6WanlUPMVEGBALZPworVlfc1gyYqmz1BnwCu4Qr4W?=
 =?us-ascii?Q?Np7jOfg5GIgevl4QoYNm/KqzlzMu2+Twvvz8/Ub6gvZsjKXJ1Z4lpcmhPLXq?=
 =?us-ascii?Q?dLxeYMMAtPjD28wquSUMYRalwEXBFSrOKf7qWPCFPRjvfoP/El0D12brhTda?=
 =?us-ascii?Q?a1ueJ/eZLL+rqbuGQdq7Xt6jq9JLHLeDVeVsXubkdwJD00nPTPp5nxfk3IXJ?=
 =?us-ascii?Q?lCfIDDPZUujpc42BXYhorRvZ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F32FCB7BA2DEEB408045925D331C258D@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e605b4c-a9ea-4258-19e7-08dd51cd21e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 16:39:23.4448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB5548
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hector Martin <marcan@marcan.st>

%p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
it's useful to be able to print generic 4-character codes formatted as
an integer. Extend it to add format specifiers for printing generic
32-bit FOURCCs with various endian semantics:

%p4ch   Host-endian
%p4cl	Little-endian
%p4cb	Big-endian
%p4cr	Reverse-endian

The endianness determines how bytes are interpreted as a u32, and the
FOURCC is then always printed MSByte-first (this is the opposite of
V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
allow printing LSByte-first FOURCCs stored in host endian order
(other than the hex form being in character order, not the integer
value).

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
v2 -> Add this patch
 Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++
 lib/test_printf.c                         | 39 +++++++++++++++++++----
 lib/vsprintf.c                            | 38 ++++++++++++++++++----
 scripts/checkpatch.pl                     |  2 +-
 4 files changed, 97 insertions(+), 14 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core=
-api/printk-formats.rst
index ecccc0473..9982861fa 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -648,6 +648,38 @@ Examples::
 	%p4cc	Y10  little-endian (0x20303159)
 	%p4cc	NV12 big-endian (0xb231564e)
=20
+Generic FourCC code
+-------------------
+
+::
+	%p4c[hrbl]	gP00 (0x67503030)
+
+Print a generic FourCC code, as both ASCII characters and its numerical
+value as hexadecimal.
+
+The additional ``h``, ``r``, ``b``, and ``l`` specifiers are used to speci=
fy
+host, reversed, big or little endian order data respectively. Host endian
+order means the data is interpreted as a 32-bit integer and the most
+significant byte is printed first; that is, the character code as printed
+matches the byte order stored in memory on big-endian systems, and is reve=
rsed
+on little-endian systems.
+
+Passed by reference.
+
+Examples for a little-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cr	00Pg (0x30305067)
+	%p4cb	00Pg (0x30305067)
+	%p4cl	gP00 (0x67503030)
+
+Examples for a big-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cr	00Pg (0x30305067)
+	%p4cb	gP00 (0x67503030)
+	%p4cl	00Pg (0x30305067)
+
 Rust
 ----
=20
diff --git a/lib/test_printf.c b/lib/test_printf.c
index 59dbe4f9a..ee860327e 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -776,21 +776,46 @@ static void __init fwnode_pointer(void)
 	software_node_unregister_node_group(group);
 }
=20
+struct fourcc_struct {
+	u32 code;
+	const char *str;
+};
+
+static void __init fourcc_pointer_test(const struct fourcc_struct *fc, siz=
e_t n,
+				       const char *fmt)
+{
+	size_t i;
+
+	for (i =3D 0; i < n; i++)
+		test(fc[i].str, fmt, &fc[i].code);
+}
+
 static void __init fourcc_pointer(void)
 {
-	struct {
-		u32 code;
-		char *str;
-	} const try[] =3D {
+	struct fourcc_struct const try_cc[] =3D {
 		{ 0x3231564e, "NV12 little-endian (0x3231564e)", },
 		{ 0xb231564e, "NV12 big-endian (0xb231564e)", },
 		{ 0x10111213, ".... little-endian (0x10111213)", },
 		{ 0x20303159, "Y10  little-endian (0x20303159)", },
 	};
-	unsigned int i;
+	struct fourcc_struct const try_ch =3D {
+		0x41424344, "ABCD (0x41424344)",
+	};
+	struct fourcc_struct const try_cr =3D {
+		0x41424344, "DCBA (0x44434241)",
+	};
+	struct fourcc_struct const try_cl =3D {
+		le32_to_cpu(0x41424344), "ABCD (0x41424344)",
+	};
+	struct fourcc_struct const try_cb =3D {
+		be32_to_cpu(0x41424344), "ABCD (0x41424344)",
+	};
=20
-	for (i =3D 0; i < ARRAY_SIZE(try); i++)
-		test(try[i].str, "%p4cc", &try[i].code);
+	fourcc_pointer_test(try_cc, ARRAY_SIZE(try_cc), "%p4cc");
+	fourcc_pointer_test(&try_ch, 1, "%p4ch");
+	fourcc_pointer_test(&try_cr, 1, "%p4cr");
+	fourcc_pointer_test(&try_cl, 1, "%p4cl");
+	fourcc_pointer_test(&try_cb, 1, "%p4cb");
 }
=20
 static void __init
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 56fe96319..13733a4da 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1781,27 +1781,53 @@ char *fourcc_string(char *buf, char *end, const u32=
 *fourcc,
 	char output[sizeof("0123 little-endian (0x01234567)")];
 	char *p =3D output;
 	unsigned int i;
+	bool pixel_fmt =3D false;
 	u32 orig, val;
=20
-	if (fmt[1] !=3D 'c' || fmt[2] !=3D 'c')
+	if (fmt[1] !=3D 'c')
 		return error_string(buf, end, "(%p4?)", spec);
=20
 	if (check_pointer(&buf, end, fourcc, spec))
 		return buf;
=20
 	orig =3D get_unaligned(fourcc);
-	val =3D orig & ~BIT(31);
+	switch (fmt[2]) {
+	case 'h':
+		val =3D orig;
+		break;
+	case 'r':
+		orig =3D swab32(orig);
+		val =3D orig;
+		break;
+	case 'l':
+		orig =3D le32_to_cpu(orig);
+		val =3D orig;
+		break;
+	case 'b':
+		orig =3D be32_to_cpu(orig);
+		val =3D orig;
+		break;
+	case 'c':
+		/* Pixel formats are printed LSB-first */
+		val =3D swab32(orig & ~BIT(31));
+		pixel_fmt =3D true;
+		break;
+	default:
+		return error_string(buf, end, "(%p4?)", spec);
+	}
=20
 	for (i =3D 0; i < sizeof(u32); i++) {
-		unsigned char c =3D val >> (i * 8);
+		unsigned char c =3D val >> ((3 - i) * 8);
=20
 		/* Print non-control ASCII characters as-is, dot otherwise */
 		*p++ =3D isascii(c) && isprint(c) ? c : '.';
 	}
=20
-	*p++ =3D ' ';
-	strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
-	p +=3D strlen(p);
+	if (pixel_fmt) {
+		*p++ =3D ' ';
+		strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
+		p +=3D strlen(p);
+	}
=20
 	*p++ =3D ' ';
 	*p++ =3D '(';
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7b28ad331..21516f753 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6904,7 +6904,7 @@ sub process {
 					    ($extension eq "f" &&
 					     defined $qualifier && $qualifier !~ /^w/) ||
 					    ($extension eq "4" &&
-					     defined $qualifier && $qualifier !~ /^cc/)) {
+					     defined $qualifier && $qualifier !~ /^c[chlbr]/)) {
 						$bad_specifier =3D $specifier;
 						last;
 					}
--=20
2.43.0

