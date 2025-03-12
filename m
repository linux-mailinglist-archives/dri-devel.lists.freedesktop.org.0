Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FB8A5D8D5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 10:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D0210E733;
	Wed, 12 Mar 2025 09:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="e9zdoH5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010011.outbound.protection.outlook.com
 [52.103.68.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6484C10E733
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 09:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAADVHF/0GAON4/L3+eIEFMMjelSetNPng2pUTMjtMVFlfh8TUrO+3AO1Lv8N6yA9Gn5jZhOTfXodJ3/VdzocoYkoXGvXB/J+Y511o5hwiUk53apFopH3L30Ywcjh9/0zTYQG2ENzYPhIT9H35hyfmBHmqglFW+tnBOS+3HR4FjM06mX7E6aZ9WyfB58coZcH6mJF7JqZuyw3VFFSNjwuOo/pejllf6OS9En+fKIBC606LsB3cxjdRQnZYCQSv5iglfqwy9YiYJqfMYEa3Onwo9WZ5NC4tZs0kT6t9j+MSZ8UbEY2j+TIDkkocl8UBbpf+bcZnLydUm26LfSP5sp1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pJqLbtD6xmyotjrr7f0gCRaeWGyq1wlx5kC8RQdDGs=;
 b=UEctUOoPbHZ4NNrFv0pZrz+rNbY64NZ+QpdplHpx8eWqhdIptjfQVaQcy1YUJVndHFhyNsw+Y2g10eeJa7iFY+YrUUAT8dbGNEEvA2o3ZGMIS6cqa9zCTHob/naSQxMRbbaFEadUlmV40l0QBpLD3WlbCggZSNkvU8unS0/KLRupECa8bAFTbLDXPHJIrY96rVv7XC9VaxfLuX5cz/L8zrnKKjfyXJ9IaVtFTGUs8VngqWiU3g55mdQerBNAIvYURAdHmaOWXfFjWzkCVrwJbLeIqlYEODrH8rBfTRI5Lh+u/PLKMchmUD0OBENdl8qwharwy1LY+W3S0PNHgPZIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pJqLbtD6xmyotjrr7f0gCRaeWGyq1wlx5kC8RQdDGs=;
 b=e9zdoH5XzXCVVpnKpqNu6crHkGZHPJ1fZFZaq77K6m0iwxQPZ15X/9NTvLayUJO7iKVwsw8tkrDst4R1kjD2JWMqlJzyIeZWQgfELLIyfJuwULTiCW4nZB3APeyYzHLyIr41hOYyqLYG1vjJQvntRx5tiLx6l4hlEljcsyeEymphqtlqswiqxVrTMkxK3yGJxWNSg2AkGE9UribiuvfM/sAr1RKSQ5PVEAHkYa5IwEsrd4jaw85P1rNbRBxfINORdnRJKzbSbBtjmtsF6r5UitFeahxLEL1Z+R6bl/2HZSR2QuM5PkvY9ub6HIoHHaJvB+p1jVvLb75ngXvwmzZdnQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB9981.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:151::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 09:05:38 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 09:05:38 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>, 
 Maxime Ripard <mripard@kernel.org>, "airlied@redhat.com"
 <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, Petr
 Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Asahi Linux Mailing List
 <asahi@lists.linux.dev>
Subject: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Topic: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Index: AQHbky3sVCTho9z6wEy4WLvGD6MYHw==
Date: Wed, 12 Mar 2025 09:05:38 +0000
Message-ID: <376C9BD3-2F41-4511-BE52-1B8468FE2CB3@live.com>
References: <ABAEA9D0-97CB-4ADD-9606-A12D5815335A@live.com>
In-Reply-To: <ABAEA9D0-97CB-4ADD-9606-A12D5815335A@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB9981:EE_
x-ms-office365-filtering-correlation-id: 4b5430d8-f1a8-4979-8dfb-08dd61450ef0
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|7092599003|19110799003|8060799006|8062599003|461199028|41001999003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?us-ascii?Q?w7St64aj0MRXZgXY0f8JbBpC3cMAe8lz0sGePf/HoJz+yo5HA88nuPPBTRVA?=
 =?us-ascii?Q?mEFk1FLiyZLLpGF695wNqccXxNgu0W07jNhKPT035y6oNbekEFmLca2MESQJ?=
 =?us-ascii?Q?tRBof+jmQOzvrGd3brM9NXJY66hQVdjwsUV1ftn3I2zeLPwWIC7eDDeG4A+Z?=
 =?us-ascii?Q?26IBavpNwyG2cKexxYbZ1Mxvd/jloxJm7eWSB7PQV344NLh1iEmylQKkSR9r?=
 =?us-ascii?Q?kLTFZ/r3oJTWHj3DxOag38dgIDqBSbj0ZHnBCVrhDUvSJBY7KZoKizrrXJ1Y?=
 =?us-ascii?Q?r8DB5CfhtSPYaT/9NN/bC4DCOqFYXAlMjKZukb6apRVQCmUnyMwgMGCGX17c?=
 =?us-ascii?Q?JzPV4HsSqI0Z1G0GWzdhfeKuDXJqKfJvdcYwyE+NiWdCSvZyHK+tfWzSbERS?=
 =?us-ascii?Q?D7RytaONXDhVQxcDsJFE89jVk646GfgZejCcdILTT8ZDl54bcDoit6v7hC3q?=
 =?us-ascii?Q?RpyXfSCbA06jcyMB7OSf7Ywg3HsBsJxJDzXNMNFQr1iJYlsTbXW0+cYMYodw?=
 =?us-ascii?Q?mMr6BXcBJXhz8LSoF+3DcF97i6UpxWYlrUdUBwn86Vd5Vb7E3QjMSPALbHfF?=
 =?us-ascii?Q?hLAmRis/yGRzsu/7IUtrqvVM6QZoLYsirtClXfa9au7oLRuwoQwiZ1vOvvHE?=
 =?us-ascii?Q?DzgzGLPsjKOH+bHnFkaDlN9KXm+MU6Q4ghqO6mi6C0PEEP2E6LWRT1zDSshq?=
 =?us-ascii?Q?o6iF0COhJ1aNCThqidRb7qfF1AqM2/xv+PsSbPRCLMssXQhmr+XqFmoyQqGo?=
 =?us-ascii?Q?hPDBPhmWEdvK5DkzymNqE8FUQYb38PKL3QkLs+5eskJjDjxVsBt7CrJG3YOM?=
 =?us-ascii?Q?eTWTwhXRHu788Rwa/a+u9TCWPpf6A0MWWCQwxwFAoF3k+VYEZmXSeFT/QiuH?=
 =?us-ascii?Q?DR9pGNpojzwGdCYMGjQKXPwGGcHLHqIbwqM5h7kAuLzzaey+uPJgkfkdw/CG?=
 =?us-ascii?Q?IgHvbMnygIdwvGsU1uQpXM8P24MpU7mVLPjGgA6plvPeB6HvlkWxRZigpSWe?=
 =?us-ascii?Q?X3p/5gSUMYVEQsx/QpTJdKRRzxKS5hKIHHKkm45292Lp1hKWc23T9R0csmS6?=
 =?us-ascii?Q?xOmgCj45+LKNVQ+hbjxXLhPmqXTDCkR9gFjM3CWVo+2f1mMTSw4=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jg/Q5TVww4cetzIzkLvOyzEq1lNlaNfP2ZV4bkta1g8RGtgI8gCofYEx44M0?=
 =?us-ascii?Q?Mh0iaxR6NdDmr6Qjfr8zHu9dSLE2Zs5ZQwiV808B/BtiaxiLUn8vT16UnktW?=
 =?us-ascii?Q?1NIg4ldWOSQUJifXnTYtrVGzDfBD6v5KTSfZWLx3v8fdzlSfV1wKi2ZzViMe?=
 =?us-ascii?Q?1d5otG1qEjUB/DdhNU2tnEoFKQEu9yDm0XJeUeosgESFndOaqOYRxTS/WeOj?=
 =?us-ascii?Q?J6vUpyyCZ+jSZ4tzl2HMHe6dmKWdqftI9lFDiyIvLNnghaENMcoDi2kr3/46?=
 =?us-ascii?Q?CpPrXQScB/M5nwBJpCu4VeXR/tEVfbCaGLA0A8a8UXEKbU8drihkWw6vB+AP?=
 =?us-ascii?Q?CjHtI7nO40+dwJSNBAle3NdYaKGLYdh/yzCwcwpNe2+Yl7Dqh6B9OoFbBfpY?=
 =?us-ascii?Q?DFclJcnZaixPH/1QigrDEiclkoChHS75ZtSabxdfDtGI+TR7wVXQD2Sobb0C?=
 =?us-ascii?Q?kCYiFeoi9quONo/t2IzkM2qOwg9S2nS9lJA0PyHre+C6QcRIk9f5r+x++JN8?=
 =?us-ascii?Q?qkjVsQV10ndmJVdQO9EtQauUOfXJHihI9og+ovSaznaX+iuAHid1DJR1xTAB?=
 =?us-ascii?Q?hID0gGsEjKhxPZ3LBzHthV8QCV4dqke9JXw0fPO9zmdvTTg38Jlr4oILH8HD?=
 =?us-ascii?Q?/+j4pDuT3xwb4tocJ/hAnUQuGl65hy8fknnW1e71DmskjbitUbcM+8Ae2Tnb?=
 =?us-ascii?Q?TInsVpwpWUBHSHl5m/4tXZWZw/lUs45TvOyUo7IbivskejHwYEqPDjQ6a8TO?=
 =?us-ascii?Q?6WlpBabrvy0EPaRtY09xMofq2bKadfBuYlQEY+CLQA0bw422aDvgajDpuflz?=
 =?us-ascii?Q?kn1WuLtJFpoSzgY7uO2yEiPohio5zLJ/vOT2xSwyP7/cykC2LQPkn4xZM5Vi?=
 =?us-ascii?Q?Qc1SuA5IPWZZ7k6TN53RvRyCYvQX7LpDB1OTbNZagPp5NUJdH4hROEm6UT/g?=
 =?us-ascii?Q?imKvas/qMPZ6q/7Pc0AEav8KzFFE6jDThRWniFyuQvTBLxhLh2N66ZWvhT3G?=
 =?us-ascii?Q?IOQlYrcFnk5F+BFEZGvSTmZHRF+RH/kd9pZOUNzDZWjYIF9xuihnMocUCKVO?=
 =?us-ascii?Q?b+n2ZyyaeKUcqQqB8zu8QhEHbZE4iDskrM7/hGZA+RBCg2rXhx9n2nOc2mcZ?=
 =?us-ascii?Q?s4Gl3pDIyJo0rjMUNqUbq/c9mp7DMfFU1vuceyNEyMl1phb+ZXarblhHgVL7?=
 =?us-ascii?Q?k0He709UNSsL4rdnYDj6XMSSGf7a+Yv3QwytJMae4ff0aASdC1ro4jVayDbY?=
 =?us-ascii?Q?2drUgURs93XX7cf6MDk+dqHhxiPstA9a55DSsMpcQE9OSZBUEad8fSkbMnr0?=
 =?us-ascii?Q?AFrUTg98kxXzTWFZHQ7MwDel?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0039A4A56758C047BDB11B805171E318@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5430d8-f1a8-4979-8dfb-08dd61450ef0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 09:05:38.7676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9981
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

%p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
it's useful to be able to print generic 4-character codes formatted as
an integer. Extend it to add format specifiers for printing generic
32-bit FourCCs with various endian semantics:

%p4ch	Host byte order
%p4cn	Network byte order
%p4cl	Little-endian
%p4cb	Big-endian

The endianness determines how bytes are interpreted as a u32, and the
FourCC is then always printed MSByte-first (this is the opposite of
V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
allow printing LSByte-first FourCCs stored in host endian order
(other than the hex form being in character order, not the integer
value).

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++
 lib/test_printf.c                         | 39 +++++++++++++++++++----
 lib/vsprintf.c                            | 35 ++++++++++++++++----
 scripts/checkpatch.pl                     |  2 +-
 4 files changed, 94 insertions(+), 14 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core=
-api/printk-formats.rst
index ecccc0473..bd420e8aa 100644
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
+	%p4c[hnlb]	gP00 (0x67503030)
+
+Print a generic FourCC code, as both ASCII characters and its numerical
+value as hexadecimal.
+
+The generic FourCC code is always printed in the big-endian format,
+the most significant byte first. This is the opposite of V4L/DRM FourCCs.
+
+The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
+endianness is used to load the stored bytes. The data might be interpreted
+using the host byte order, network byte order, little-endian, or big-endia=
n.
+
+Passed by reference.
+
+Examples for a little-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cn	00Pg (0x30305067)
+	%p4cl	gP00 (0x67503030)
+	%p4cb	00Pg (0x30305067)
+
+Examples for a big-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cn	00Pg (0x30305067)
+	%p4cl	00Pg (0x30305067)
+	%p4cb	gP00 (0x67503030)
+
 Rust
 ----
=20
diff --git a/lib/test_printf.c b/lib/test_printf.c
index 59dbe4f9a..b9e8afc01 100644
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
+	static const struct fourcc_struct try_cc[] =3D {
 		{ 0x3231564e, "NV12 little-endian (0x3231564e)", },
 		{ 0xb231564e, "NV12 big-endian (0xb231564e)", },
 		{ 0x10111213, ".... little-endian (0x10111213)", },
 		{ 0x20303159, "Y10  little-endian (0x20303159)", },
 	};
-	unsigned int i;
+	static const struct fourcc_struct try_ch[] =3D {
+		{ 0x41424344, "ABCD (0x41424344)", },
+	};
+	static const struct fourcc_struct try_cn[] =3D {
+		{ 0x41424344, "DCBA (0x44434241)", },
+	};
+	static const struct fourcc_struct try_cl[] =3D {
+		{ (__force u32)cpu_to_le32(0x41424344), "ABCD (0x41424344)", },
+	};
+	static const struct fourcc_struct try_cb[] =3D {
+		{ (__force u32)cpu_to_be32(0x41424344), "ABCD (0x41424344)", },
+	};
=20
-	for (i =3D 0; i < ARRAY_SIZE(try); i++)
-		test(try[i].str, "%p4cc", &try[i].code);
+	fourcc_pointer_test(try_cc, ARRAY_SIZE(try_cc), "%p4cc");
+	fourcc_pointer_test(try_ch, ARRAY_SIZE(try_ch), "%p4ch");
+	fourcc_pointer_test(try_cn, ARRAY_SIZE(try_cn), "%p4cn");
+	fourcc_pointer_test(try_cl, ARRAY_SIZE(try_cl), "%p4cl");
+	fourcc_pointer_test(try_cb, ARRAY_SIZE(try_cb), "%p4cb");
 }
=20
 static void __init
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 56fe96319..56511a994 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1781,27 +1781,50 @@ char *fourcc_string(char *buf, char *end, const u32=
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
+		break;
+	case 'n':
+		orig =3D swab32(orig);
+		break;
+	case 'l':
+		orig =3D (__force u32)cpu_to_le32(orig);
+		break;
+	case 'b':
+		orig =3D (__force u32)cpu_to_be32(orig);
+		break;
+	case 'c':
+		/* Pixel formats are printed LSB-first */
+		pixel_fmt =3D true;
+		break;
+	default:
+		return error_string(buf, end, "(%p4?)", spec);
+	}
+
+	val =3D pixel_fmt ? swab32(orig & ~BIT(31)) : orig;
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
index 7b28ad331..5595a0898 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6904,7 +6904,7 @@ sub process {
 					    ($extension eq "f" &&
 					     defined $qualifier && $qualifier !~ /^w/) ||
 					    ($extension eq "4" &&
-					     defined $qualifier && $qualifier !~ /^cc/)) {
+					     defined $qualifier && $qualifier !~ /^c[hnlbc]/)) {
 						$bad_specifier =3D $specifier;
 						last;
 					}
--=20
2.47.1

