Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CJcFmJHpGk0cQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28C41D014E
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC26210E3ED;
	Sun,  1 Mar 2026 14:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VXLlVLJK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899B410E3E3;
 Sun,  1 Mar 2026 14:04:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vbl098fM0v1+PZ6bz+zsgjcaWt+SKsVvezJ2zEtwO5wsVXiBB+GSIEoSNWL4dpraRs4hMSj1h/X0/qKH4YF8mFGorySGtGigmByNh5gMknGqjbHT7Xrb7BgSFmDtQNKxNxiZ39xXf7GGPET2B1nzgB758rnz51NYz+eXmvqgm5VwI4WPdBIQqPF7Fld/Uul7TXYyB5ABzv0lA4R+HAqvnBrojiPrlEQJHxPS1+KXnlvpZ0BLPBjc+v1WRTBHTsPTD9fkVU2aUqnT0wNKN1/+0HqFDXuzm0+bxctr1BlG/2C0h9SnSrdcEPEfxsoLTYXUzRYnYnuJ3uROUKYw06fZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYuunDNfKDzpQu1lHJv0PNN3py0bop0d5/vlzm00ic8=;
 b=DvRQcEUOkzgdB+6xSmADCYbIzC5uX2xTfoLQgplH/z8OfjIEDAKlU0z64NSeixfnXzXyq/Kr2+EBJcNEMdxDRi234AyYYWSsH+SFtwjWzQkdcfkrcqWpwJbcKuvyLD4woezxmAARkmUlG1tHvd7fYh9wpq5eGGd3Jti8Ni4DcpJ3DWOlq+sLpGpcghcAcBph0hPhUsiXK4IdccTG/LnQYg6IS/Tt2GU/htTAie4BUxMRcFeYAzgmhjRbKatPAmYW5H4jSAZSHrYU72BubM6nHMN7u+tRILI4f9VYT8qKbL4IqU54MSBAtdPfxL6Eh1XBKca6ylkhkWJJakZdXEkujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYuunDNfKDzpQu1lHJv0PNN3py0bop0d5/vlzm00ic8=;
 b=VXLlVLJKYecIgVM66NrcDPCbVW4zxqmnLZHTA3ss4D+yy3ZSTJxI68tFEP7F7L044L1CLcu/+pfiWfAFL016uK4aFBzan+JJZtlmywu/8ZqScpdPO2Jvldxw5Z+e9FWE76DzqoO7uRI6U57RS2mr3GyQAM/oFl76adg8RKGetCuFgimurix5cyXRn85AgRDxN1cWKpVQ8XkeZ8Q1CLTMJU3zy+ddGHpuDwY51UbVizKzO3csMWmTCpYm2p+9wqoka5/z5Cz/E6l4X/PxdXWV1wWiVvWZ+nA4WY5iFFWKrSpnsxp/FvmI0jSbJLgYZVBR8BePnkLGZGy7MSQKlRf+Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.19; Sun, 1 Mar 2026 14:04:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 14:04:10 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Mar 2026 23:03:46 +0900
Subject: [PATCH v10 03/10] gpu: nova-core: falcon: rename load parameters
 to reflect DMA dependency
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-turing_prep-v10-3-dde5ee437c60@nvidia.com>
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0050.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: ca79bbbe-1196-46f5-3a26-08de779b6945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: sIzIRUcpoD3UDwltZcMX26HYbQeLHprxbTH8MKkd0oOpsH144KiqAH0ffF3OkPDPa/6DTfpgClNOQFjayJ35e8vv5NIPlbqUh24L6KnP1XxDezc6D/HaycXz8/9gnzRzJczQ7aJs3pjWfKTcWEg/ROHgC2ER1V8GRxxcyFtgRLqG01bfzym4lDRO0Ho7FMPUR8xDWddbhx8tMpKSe5eHMzTnjLvn5hTreWPrYdJ0sMy//QJRx+199YGVrRJhxsSpamxxzdf8sco9sRqFwftdAKpkKXM6RYHPGMlkjslRFlo/Op3/AXdgFNoeO7Aq/A5h8bL4FIR0eVm45oN4s8qXyUuA2DS2C/hl62zDmhmuwxYEAheOi73HhXsBQC3fdM0JzFsPwXD6xpIMZNWzf+O2XtFJCfE6ip0Tk+AzkavGpscfyvHg6io+umrXjNcqKFHCS5hvF/MRsWeEalM5DcldsZzSbQ+Vtpjwdt9/9TABgzH1yD3DgU0QMgLJXFV9MuF33Nx2kTQ1OGDaEDfdA7Z43Il3ERO7j4WZ13YgO2E0U767hxfR87pv+pLySNgkygJyrqb2adcpxIbjkoLt90H54StVaAdVbLFytjJlGY6VOrR+B9By8qB+0qHNoG0Z/JRXDQroGi+lLPCG6YNKCFvEGeZ7d8hM3Al/RSt5XMS9wfimh0TmUh3nkpQixKO1e2dBibNeHICOl0oH4uPHVR7GCagDEL4zGfD2RPWKoXnSNWk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmdrQzBqL0dRYnRwUHJDTjdqN1YyQTdSWWZNQVlJY3pKV2xBa3Z0WGliVkM3?=
 =?utf-8?B?cHRkclJqaWRIeEU3RFRQdmhwVEU5dDZEMGNGTVJYRWNMdXpzYVlsL1BGbkxs?=
 =?utf-8?B?b01SNWc2TGtyN2NVTHpIdXdaa0taODJ0OGNUc01teFRqbGlJQVFPTE5qM3Z5?=
 =?utf-8?B?S1ZYQ3Q4NmM0TUV1V1NaaXpMNnRINFZMNXpsUWlsTHFuVEt2VW1zTHZ2cG41?=
 =?utf-8?B?aStsRXcvN1QwdklKUFM5RnNlcmtEZzBRRGdwdG9qTHR6QzBqUmlUQlRYTnNy?=
 =?utf-8?B?ODJJOGFKMlprS2NtakRDMW1xbEtyYVJwSmF1ME8ybUxHUWh6M25VWjZaNENG?=
 =?utf-8?B?dXNqYmVROXRCSlZEcmZHUjlZSXVqOFNOd2NjNlllcCsxVXFJUWVid3FiOFc1?=
 =?utf-8?B?c3NGVlJST2kxWUVMZEdDcDZyRGU0VVU2RTZvZ3U5ZFNJQlRYK2JVYkpZWENR?=
 =?utf-8?B?R0ZUUzNxVXZFYWFYWTBhNlVra0Y4ZUVJWnVheHl1SmoxS3lZMFdFcVNhUGd6?=
 =?utf-8?B?a0hUTjZEdlRLSUpBWThjTVNJKys3amhqOUlvcGI4Nm5NQW9TWU9yeEJ1bUxk?=
 =?utf-8?B?MXVoNHYzSDR2TTh4blR6Z3h3UGpYRzVkbTRqNG9NUE9JWDFBZTUzeXoyelFo?=
 =?utf-8?B?bXZ3MjMvK2xsS09VYmJSTU9TTlhBL3ZxZHhIWnhNVFBXWkxLTlo1QUc0WXk0?=
 =?utf-8?B?ZzVmMVJPK1QrZGlkTno5WVhocTNOZlpjU1l1czdXRCtBSm1ReWszY3hFQk1P?=
 =?utf-8?B?L0ZqczNSc0tyV2FhbTJaVlpCUEdDb1llQVlKOWI0UkV4NGFrNko3dzR4dExC?=
 =?utf-8?B?U0FsSmFIMlhrcHRqdW9ob28xQ3RsY1RrTzJQeCsyVEF6TmhsbVZhZTg5TExJ?=
 =?utf-8?B?aHBWSm5DRTAxWVFhclN6N09tVmFsTnkxdmRtYlZhRFpvUXRscDlrMkw5NCtN?=
 =?utf-8?B?MjZZcE1lNkZoR2M3amkweC9wcHh4TnY0d2hXMFhMaHJVRVJsMGMwOEJnbml0?=
 =?utf-8?B?bVh3aTk1UWhJaXZZcU9KMnp0d3BISXIwRThiVTN4d0o0U0JmN2hYRGs4aWJW?=
 =?utf-8?B?RC9KbE16VlpaUWdVVVFlVFFoUkROS1RkSURwNys4NUJEY004R2ZTamQ4L3ZQ?=
 =?utf-8?B?dlVjYm1hT2pNYnZTRTVTU3oybjZ3Zmdpa0tkMThDUW9LMkp3cDQ2Y3h5WEwr?=
 =?utf-8?B?WE4xci82YlB2c1ZsL3NYcDFxZmRRTEZ5U2RRNk55QS92VEtVOXZzL0FQVk01?=
 =?utf-8?B?WFdJbXg0RklpOWs0Nm5FTjYybHdPR3NwOGF3elRNTFlONVVGMHFSVHhiZ1B2?=
 =?utf-8?B?TTdreVEvWU5ZaGJib2ZJaGpOeTI2WHkvTnJVdHlrOUhLQWRWYWRSQlBJdXQy?=
 =?utf-8?B?MWp4bnRVNmg3dGhpTXJzQmwvM1c5djVwdFB4c0RTNjNGeG1UMWNKcSs1TVZ0?=
 =?utf-8?B?QWljczBscy9LWUE3c0RVOXg3cmd5blpJM2FOTUF1QjBCWG9ZQU1PVWNINnFB?=
 =?utf-8?B?R21OME1zRG1aRlMranJPZ01OalhxdlpEUHk0VFlodmdrUnAycWR2Z01GaHMx?=
 =?utf-8?B?Q2swN2dUbGw4c29FVG5KTGpqN2JFZFRCZUx2akVaUjN6N2t4eWZ2eU4yUnJR?=
 =?utf-8?B?bGtjNlRuWmxmaXFVMUpuQ3VsZVVrMDJEM0lmOGhDc0dUWU13bEljbWN6ZTlv?=
 =?utf-8?B?L1JCWFpweFd5a3ZKM0FWbVN4ZlhMRWgzcDJIY2tZMTB3dUhOL29FUklFUFYv?=
 =?utf-8?B?OE5xTUhJNXNYL3JEeXR2cG5STUw4V0dtSTc1Njl2eUR4S25PdURrQ1QvVFBB?=
 =?utf-8?B?U3ZFSnlkYzFiS1JkQjNHLys0Z0U4bDh2Y2tDZVU4UUFpWEtwM2xadERhN28z?=
 =?utf-8?B?YlRCSEltbHY1ZmF3TUNnS0sxT2JHRDR0aFpkbGFwR21TUG9qK1djcHRjbHRo?=
 =?utf-8?B?ckpCanN5Z3FHd2E4Umticy9od2ZwZjRtWWxtZVVTSllHN2tDVGZQZmZhaEpS?=
 =?utf-8?B?T1BNUHhmVHM3U1p2aDVlOWRUSkdBVnFZN1F0ZllUV3JWRSt3VTAyZERDUWQ5?=
 =?utf-8?B?RHpJZGRlb2svUXBMQ3I1VU1yUWY2VDhkVUJEVVhtb2RBZVdzcWMrLzk1VTBR?=
 =?utf-8?B?azBHZ2I0Vml1N1JJSWFuYXpONEpBNXhvdUR2SkpRODVSUTQzc0ZHR0tFV3Zn?=
 =?utf-8?B?b2xjQXJ6Wm41WUZQWk1zeXdnUndGMHZGUGFFcmo5WW9sMXhTbEx0aUhoTEpn?=
 =?utf-8?B?a2RybDU1Kzd1c2tmYU5yYnY1RW1XOTBCZTZRSEp6enhwNStHMEtsNEJPdGdM?=
 =?utf-8?B?aUtsVTVzV3BBZUhESlcyR25Xc1F2YkwvcHFnRDhac2xLaUVTd1BJR2R5cWxP?=
 =?utf-8?Q?4cKJzDiUP01s3gtzWYU7fbQlD5EfvUMvNAYrog+stMmpG?=
X-MS-Exchange-AntiSpam-MessageData-1: IkU6kr9v+mfbMg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca79bbbe-1196-46f5-3a26-08de779b6945
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 14:04:10.6325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FllgaYLdfDmCMifaIhpfo1FIKGms2Ak62cdIbu0S2AjA7clbHwW8s5YqImYrVY7yKeqoQUxMw8z2Toq7uem2AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: F28C41D014E
X-Rspamd-Action: no action

The current `FalconLoadParams` and `FalconLoadTarget` types are fit for
DMA loading, but not so much for PIO loading which will require its own
types. Start by renaming them to something that indicates that they are
indeed DMA-related.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 19 ++++++++++---------
 drivers/gpu/nova-core/firmware.rs        | 30 +++++++++++++++---------------
 drivers/gpu/nova-core/firmware/booter.rs | 24 ++++++++++++------------
 drivers/gpu/nova-core/firmware/fwsec.rs  | 12 ++++++------
 4 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 31217cd3a795..9eb827477e5e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -330,9 +330,10 @@ pub(crate) trait FalconEngine:
     const ID: Self;
 }
 
-/// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
+/// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM)
+/// using DMA.
 #[derive(Debug, Clone)]
-pub(crate) struct FalconLoadTarget {
+pub(crate) struct FalconDmaLoadTarget {
     /// Offset from the start of the source object to copy from.
     pub(crate) src_start: u32,
     /// Offset from the start of the destination memory to copy into.
@@ -352,20 +353,20 @@ pub(crate) struct FalconBromParams {
     pub(crate) ucode_id: u8,
 }
 
-/// Trait for providing load parameters of falcon firmwares.
-pub(crate) trait FalconLoadParams {
+/// Trait implemented by falcon firmwares that can be loaded using DMA.
+pub(crate) trait FalconDmaLoadable {
     /// Returns the firmware data as a slice of bytes.
     fn as_slice(&self) -> &[u8];
 
     /// Returns the load parameters for Secure `IMEM`.
-    fn imem_sec_load_params(&self) -> FalconLoadTarget;
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget;
 
     /// Returns the load parameters for Non-Secure `IMEM`,
     /// used only on Turing and GA100.
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget>;
 
     /// Returns the load parameters for `DMEM`.
-    fn dmem_load_params(&self) -> FalconLoadTarget;
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget;
 
     /// Returns the parameters to write into the BROM registers.
     fn brom_params(&self) -> FalconBromParams;
@@ -377,7 +378,7 @@ pub(crate) trait FalconLoadParams {
 /// Trait for a falcon firmware.
 ///
 /// A falcon firmware can be loaded on a given engine.
-pub(crate) trait FalconFirmware: FalconLoadParams {
+pub(crate) trait FalconFirmware: FalconDmaLoadable {
     /// Engine on which this firmware is to be loaded.
     type Target: FalconEngine;
 }
@@ -425,7 +426,7 @@ fn dma_wr(
         bar: &Bar0,
         dma_obj: &DmaObject,
         target_mem: FalconMem,
-        load_offsets: FalconLoadTarget,
+        load_offsets: FalconDmaLoadTarget,
     ) -> Result {
         const DMA_LEN: u32 = num::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT }>();
 
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 09b12ad546c2..6d47a6364c79 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -17,7 +17,7 @@
 use crate::{
     falcon::{
         FalconFirmware,
-        FalconLoadTarget, //
+        FalconDmaLoadTarget, //
     },
     gpu,
     num::{
@@ -170,9 +170,9 @@ fn size(&self) -> usize {
         ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
     }
 
-    fn imem_sec_load_params(&self) -> FalconLoadTarget;
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
-    fn dmem_load_params(&self) -> FalconLoadTarget;
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget;
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget>;
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget;
 }
 
 impl FalconUCodeDescriptor for FalconUCodeDescV2 {
@@ -204,24 +204,24 @@ fn signature_versions(&self) -> u16 {
         0
     }
 
-    fn imem_sec_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
+        FalconDmaLoadTarget {
             src_start: 0,
             dst_start: self.imem_sec_base,
             len: self.imem_sec_size,
         }
     }
 
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
-        Some(FalconLoadTarget {
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
+        Some(FalconDmaLoadTarget {
             src_start: 0,
             dst_start: self.imem_phys_base,
             len: self.imem_load_size.checked_sub(self.imem_sec_size)?,
         })
     }
 
-    fn dmem_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget {
+        FalconDmaLoadTarget {
             src_start: self.dmem_offset,
             dst_start: self.dmem_phys_base,
             len: self.dmem_load_size,
@@ -258,21 +258,21 @@ fn signature_versions(&self) -> u16 {
         self.signature_versions
     }
 
-    fn imem_sec_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
+        FalconDmaLoadTarget {
             src_start: 0,
             dst_start: self.imem_phys_base,
             len: self.imem_load_size,
         }
     }
 
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
         // Not used on V3 platforms
         None
     }
 
-    fn dmem_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget {
+        FalconDmaLoadTarget {
             src_start: self.imem_load_size,
             dst_start: self.dmem_phys_base,
             len: self.dmem_load_size,
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 2b7166eaf283..d569151982d1 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -19,8 +19,8 @@
         Falcon,
         FalconBromParams,
         FalconFirmware,
-        FalconLoadParams,
-        FalconLoadTarget, //
+        FalconDmaLoadable,
+        FalconDmaLoadTarget, //
     },
     firmware::{
         BinFirmware,
@@ -256,12 +256,12 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
 /// The `Booter` loader firmware, responsible for loading the GSP.
 pub(crate) struct BooterFirmware {
     // Load parameters for Secure `IMEM` falcon memory.
-    imem_sec_load_target: FalconLoadTarget,
+    imem_sec_load_target: FalconDmaLoadTarget,
     // Load parameters for Non-Secure `IMEM` falcon memory,
     // used only on Turing and GA100
-    imem_ns_load_target: Option<FalconLoadTarget>,
+    imem_ns_load_target: Option<FalconDmaLoadTarget>,
     // Load parameters for `DMEM` falcon memory.
-    dmem_load_target: FalconLoadTarget,
+    dmem_load_target: FalconDmaLoadTarget,
     // BROM falcon parameters.
     brom_params: FalconBromParams,
     // Device-mapped firmware image.
@@ -370,7 +370,7 @@ pub(crate) fn new(
         let (imem_sec_dst_start, imem_ns_load_target) = if chipset <= Chipset::GA100 {
             (
                 app0.offset,
-                Some(FalconLoadTarget {
+                Some(FalconDmaLoadTarget {
                     src_start: 0,
                     dst_start: load_hdr.os_code_offset,
                     len: load_hdr.os_code_size,
@@ -381,13 +381,13 @@ pub(crate) fn new(
         };
 
         Ok(Self {
-            imem_sec_load_target: FalconLoadTarget {
+            imem_sec_load_target: FalconDmaLoadTarget {
                 src_start: app0.offset,
                 dst_start: imem_sec_dst_start,
                 len: app0.len,
             },
             imem_ns_load_target,
-            dmem_load_target: FalconLoadTarget {
+            dmem_load_target: FalconDmaLoadTarget {
                 src_start: load_hdr.os_data_offset,
                 dst_start: 0,
                 len: load_hdr.os_data_size,
@@ -398,20 +398,20 @@ pub(crate) fn new(
     }
 }
 
-impl FalconLoadParams for BooterFirmware {
+impl FalconDmaLoadable for BooterFirmware {
     fn as_slice(&self) -> &[u8] {
         self.ucode.0.as_slice()
     }
 
-    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
         self.imem_sec_load_target.clone()
     }
 
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
         self.imem_ns_load_target.clone()
     }
 
-    fn dmem_load_params(&self) -> FalconLoadTarget {
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget {
         self.dmem_load_target.clone()
     }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 9349c715a5a4..2ba70e0c5a30 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -31,8 +31,8 @@
         Falcon,
         FalconBromParams,
         FalconFirmware,
-        FalconLoadParams,
-        FalconLoadTarget, //
+        FalconDmaLoadable,
+        FalconDmaLoadTarget, //
     },
     firmware::{
         FalconUCodeDesc,
@@ -180,20 +180,20 @@ pub(crate) struct FwsecFirmware {
     ucode: FirmwareObject<Self, Signed>,
 }
 
-impl FalconLoadParams for FwsecFirmware {
+impl FalconDmaLoadable for FwsecFirmware {
     fn as_slice(&self) -> &[u8] {
         self.ucode.0.as_slice()
     }
 
-    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
         self.desc.imem_sec_load_params()
     }
 
-    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+    fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
         self.desc.imem_ns_load_params()
     }
 
-    fn dmem_load_params(&self) -> FalconLoadTarget {
+    fn dmem_load_params(&self) -> FalconDmaLoadTarget {
         self.desc.dmem_load_params()
     }
 

-- 
2.53.0

