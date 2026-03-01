Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JIbLl5HpGk0cQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596141D0136
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7A010E3E5;
	Sun,  1 Mar 2026 14:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h8FJWwRV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011060.outbound.protection.outlook.com
 [40.93.194.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E485C10E2FD;
 Sun,  1 Mar 2026 14:04:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puzINy0SFmUbzlhgzwLxrHDu+3GV6rGRJde3/mtEXWnayLabBbBObiKJE02sub2WBOTSjx3trDaZ4TNghCXVAzGvG3im/iNRbg22RPbX2RHZnH16VBCuYDVaP9sCmo33HbYefyGgY71XIftooCRrnolAIXeEldIBkpDvdMUm9B8daszaM4fyCMfUWwKiJ9orT5aygQd8BVMhh1Ww1DQotsDO/+AkASaM/6pUdJaraTKofMbNzfvYOEtY6Bj6cFQFUc0p1JdmC5kJXaCsAHDY96gwNrxSYqOPwGzP5xRzNukdrUhyFqJWYm8OPLOytAlBaohZ6TxVv9wiqkK8CXMmnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0BBaOGVayVHPRxD95cED7HkcT8xlGsqKNcdDfJDDPs=;
 b=gonHpKlOVmGyHoyK4O8eNEfjObX24XaS1s2NiyzmRcjmceQDe4emlTyWy6+5aIG+zXuCSfRwOAtY6GiYD07Kj3hBA0g4oGGgo9rOugyrDZQuXUzEq+zASu0UtFSD8olPNQsCc7NTDaJLc7KsiXXmjhWaDMDlYPmMt9ka+2SA9Zebwb0y1bB09JP8YNnYdB+dmY4NS/pbRfVTo6N4OyiwA93uP9a8yQQx4k7I376cczvO4N/aXGvnnjljYp63x2EEsRlPTnVHpJQ8i/ZTyr5KN3jxA+f3Okps9gnIL9FcH255PEDSIi8M5nogJcd+t/Pchfcy+XXz5yDqFkYBM//CzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0BBaOGVayVHPRxD95cED7HkcT8xlGsqKNcdDfJDDPs=;
 b=h8FJWwRVQDJqlRjqpshOa1MgI5pTgVC+I6wR172zyhw82qYKswiyRV9qtrAfUG6Jt0cF2QTy9gGLc3ZTjJDwcv8pLJOTCgUVMYVhKe6tYWNUz8qAUQEKJ0tC9WgyYktf6up4cEWzrm8dt7j+R5uYOKK1bjlS/nwEyy3DJTfHFRPp//PWoiKH1X8SV/FCLhOluzSYOcgCg2irjSESr4P38x1Bf5VVv5LifZOAaW7rX4BV4bssBcee4GyHgpMsdZb8A+JJVVWn4vTUIf/NrnUXQrQOTP/yRy2CaMslG5NrsfX0KTldSwp1uSUO1BAWLvvMXi4AskHlUFq4bcO4KN4wlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.19; Sun, 1 Mar 2026 14:04:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 14:04:03 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Mar 2026 23:03:44 +0900
Subject: [PATCH v10 01/10] gpu: nova-core: create falcon firmware DMA
 objects lazily
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-turing_prep-v10-1-dde5ee437c60@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b9d19f-23f2-48ef-5bc1-08de779b64d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: zlKLgxjdJwmddbb1LGh+40w4XdNsMAN3Z0l9oMFsiRK2fsotK1mxKky0O9z690n14MEpS7K0Y/XzY4if58+j4VB42exBqtAIuY0jLsfsn3MYza28P6VxXs5ZTn2AahkFJIC/L9W4pouHrGBBzsPUdY3QkTf8e0zoetqBXaZ2Z/pNdC+ROoGq9NN6Xt61m45P8KFAOqs7CbG8cv2s4xGpm/9kO8prCS83qKp8VUVDBzRpVVea7jaLIox/Q31+YfSU5bmd3fgcEnp/PeIPx1YxUa+DXch55CuoXieHVWKNvMnuvWW/Ubqi07qFcvPv158MC0J02tZt9lraHD+PYlQ8eiV1bdpPOuFQwoXX0V4nfUEuON/PVhIL+uN0yjDeeaAhvw2/sJ1hFHibdMBtYST09rH/kcv+nkRcqhYmmSWOh18ydrcEIuQfVLtj26L9ER4Au1XcXw43ZaFHZ7p8Fhle4r+RgYdwwFNxEHaHw6iVJ7+8Z/iipGZF0K0awd9rRE/hZ8whiwo+JuBvo+fVbADdFFbHcEGKJ3JtIx28KcNNoqKfmQZVMmcuUF1FWeqCGEfcOQ1lsLCYSYHHmt7PqHcNXvJ8ivPTtqF7E6D1bamvBcL/U7NQQu/U/0utD57o6VReQ4iQTb+/2WBQAPg+kRU8dXgUD3F/vhCloY19p1mARzBSCHm+qsO/iSlKIfUgF5tz8imSLuvIv/jFzlp3Y2oDM8VvguNJUHPQRqR5qITIq14=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUNYaW9ZL01ZMThCN1ZzT3cwRDJrQXNzVjVLZE42N25YVVZRTnZsWnpBTGVW?=
 =?utf-8?B?NWJ5SGhvTEZNUDJWVHR6VGdsWWQxVkVvTkpHbm1JY0hya1hQemlKNzE4U0tl?=
 =?utf-8?B?UzhqdWx4NFBTeGw0d2QxNzlFQ0hESUMxUW8yQlpFd040YXY2cTkvWUFQVmpy?=
 =?utf-8?B?WUlUakRlNy9wWXdjZENvbFN6YmlFOXpHVWovV1BjaVdkZlZrQVFFNlhLYVdp?=
 =?utf-8?B?WjJpcS9Ddlp0SEhJSFdlM0t3Zm4zRENoS2h5NG9adUxBM1hBdm4ybEZDVEdN?=
 =?utf-8?B?bVNLbXErUSttUkxJK2lWYVZwVmhoUm1BbWFwWkpzYThsTDJPcXUvanU2UnB2?=
 =?utf-8?B?QmhDdE44dmR6MzQ1c2dTTFVUcFNqOEh4ZVZaV3pwdTJqZXFZTXhtQmdXQU9X?=
 =?utf-8?B?RVRHdTdGMmhnTllDTmcwMUI2cGI2bk84bExFRzd0ZmpCMG54bGpZbjBhdzdo?=
 =?utf-8?B?bTFCNlJha1RqcThXSnAvb0Z5QzBveTZqMUk2K0lRekl5UzJPMnhtSmh2cE1Z?=
 =?utf-8?B?R1htY1BRZE40SnVPMS95azdnbm9JcE5Ramg2eXd5MUJKMk5scExCZkg1TXVz?=
 =?utf-8?B?dStqb1Z1bTIrSFFyS29KOHRVV0tBYUtJZTRDWHphcDNlanEvMFRFSHplZnZ2?=
 =?utf-8?B?M2RiWjMwZnErNEpWZDRmMEl6UHVoUkdjNGNkZm1nenV4NFVLS2pPQlUxT0Zv?=
 =?utf-8?B?RXFwL25qMG5pd0FMWEZQZmJ6VW1pZGVENFd2WUI1SXFjc3VTQi83Qkt2Q0M1?=
 =?utf-8?B?VHhKbUVPQTBhdVdTazltRGRNQzNreWcvM1MwTGVldWVKc25ZUnNyd1dxM3hm?=
 =?utf-8?B?M0Jyakg0eUVKc0hKTkM5U0hBNWd2MGl1MlJDUDlHYUo3N05pWCtURjVTYWFG?=
 =?utf-8?B?cDlSbGVQc0p5Vm5obFpRWFFra3QxZ01LT1g2MEI4WThiYWNJUVpyTlpRWVpt?=
 =?utf-8?B?L2N5Rm9WZ2xKbTVFc05PNTNWUUI4SGdESlBxRnBGQVNUd09GNmZvM2FWVm44?=
 =?utf-8?B?QWcvelAyWUwxYmo1Rm52MEFWbVB4K2xaMWI2U0xQRlE5RFdRRmNhbFdCbExV?=
 =?utf-8?B?enMwaC9SZlM4b0kvU3JzYTBybWUvdndrSkZyYzNRMC9pVlpaUFBiSTRCWGR2?=
 =?utf-8?B?R0ZWN2pQNzRNL09NanZSWlhtNnlGR25pN00zdUNyMXEzYUJqYXNmVk9HelYv?=
 =?utf-8?B?RUNaMVlUU2NVeGs4T0RSdGxBY09iUmEvcHpFNTVmanR4U05vU2h2aHZndENX?=
 =?utf-8?B?MnV4RmxCNHNVSVU3ejg3dGs0WWJNeHY5TFF5UmQvZ1R5eHZZVmxXS0ExZnpn?=
 =?utf-8?B?V2NoZUpZV3ZPVWpNbVAxaG5EWDZ5YURIWEJ0U29EcHpNQXA3Wmx6VDkydXJU?=
 =?utf-8?B?cDEvb1E5KzlFaDZRb09CUFQrbCtWSUMzbVN3eTlweEp5cm1tN09ya3dtZ1Nk?=
 =?utf-8?B?cFRaMUt1WDQwMmhLaWhoTGY5YVZ0dUpHcVBiVmw3VVgzZ093VC9kS1N0Zk9n?=
 =?utf-8?B?ZGJ2bzZSVlg3dmFnL1VYZ1Q5Yy9OcWJoQ3lleDR3TVRrTFl4UUQ3OWZaWDM4?=
 =?utf-8?B?YzlSRENXT0VFQ3E1SDBGTlllbWhKT1F1TU5WOVNydjBPT1N0dnFNdi9RR0du?=
 =?utf-8?B?ZE5Wb3BIVkhjcEZ0Z0pnVDNZWHUxamF3ditUSHFXZHhWZm1FY2t1N3RtMFBQ?=
 =?utf-8?B?ODVWeHUwS2pTTXdhZXhGdzBZZ3REWTNGZWYrNVBzYkJRWVlUV3diM1JWclNl?=
 =?utf-8?B?SVZDb0FIM0k3emgydDRDNmZjcUhKcXduZXpNSXMwZ2NoOXZtTGZPRzNBMGxF?=
 =?utf-8?B?Zy9SQTF6V1FXVXV2NkxEdlRnWUdZVXJFbXlSMWZCUlQ2dzhzQlZCbCtJOGVZ?=
 =?utf-8?B?T2J4RjBYa1hDZUlWUkFzWUpQdEh0OVdtWFdueDk5TVI4RmcrVW90TkZuSDZt?=
 =?utf-8?B?UVJReXRzcVRWQmZZWGxnZkRDUFMwZnA1NmpGZmdiem52blF3cEk2UFdQcEQ4?=
 =?utf-8?B?QTJ6bUxkQlQxRjEzMUNGUkhQU3RFaENKZU94SWcrK1NDeENNczc0c3ZrSFZl?=
 =?utf-8?B?VjZ0eWU4MVhGS2pVT2M3V2RLL2NkNGVTaXAxU0FrTStFQXZvSzI5ZVFrOTNn?=
 =?utf-8?B?Y2NUOHNDQlJUSkovdzUxYUdqL2JMcXFWSXJ5WXBjNmxKN1ZOUG9IVUZKUHU1?=
 =?utf-8?B?TFBMWUpwd05EK2Q3TmNSbzVORXpLUEhVbGpQcTMydmlzdW5jczlxL1U0WVVT?=
 =?utf-8?B?Qm1UQUx0L3RsaHVwUCt2cEJXK2JzanVNTGNYdEloeXBTU0NPak9iNTFxUzgx?=
 =?utf-8?B?U0MyZjJtdGpGL1BnMmoxdDczVW5YZWowZ0dkVHFNTkhwbTVJSjZ5dmZtVk1P?=
 =?utf-8?Q?Esyzi9g/60wKqyOtE+n8y+QVVfOmyXU1ngHi3vHVU9Wry?=
X-MS-Exchange-AntiSpam-MessageData-1: mxtBP5StKzovsA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b9d19f-23f2-48ef-5bc1-08de779b64d9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 14:04:03.0471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FDua+MK9OoP5zGKOyR9W++b2lZP/YSkrU60qmr6pgwl/1bcLHMPBFCnIE7A6EAbK6UVnRYDK+JGfeJ8x7KgNw==
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
X-Rspamd-Queue-Id: 596141D0136
X-Rspamd-Action: no action

When DMA was the only loading option for falcon firmwares, we decided to
store them in DMA objects as soon as they were loaded from disk and
patch them in-place to avoid having to do an extra copy.

This decision complicates the PIO loading patch considerably, and
actually does not even stand on its own when put into perspective with
the fact that it requires 8 unsafe statements in the code that wouldn't
exist if we stored the firmware into a `KVVec` and copied it into a DMA
object at the last minute.

The cost of the copy is, as can be expected, imperceptible at runtime.
Thus, switch to a lazy DMA object creation model and simplify our code
a bit. This will also have the nice side-effect of being more fit for
PIO loading.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 57 ++++++++++++-------
 drivers/gpu/nova-core/firmware.rs        | 38 ++++++-------
 drivers/gpu/nova-core/firmware/booter.rs | 33 +++++------
 drivers/gpu/nova-core/firmware/fwsec.rs  | 96 ++++++++++----------------------
 drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
 5 files changed, 99 insertions(+), 127 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37bfee1d0949..8d444cf9d55c 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -2,12 +2,13 @@
 
 //! Falcon microprocessor base support
 
-use core::ops::Deref;
-
 use hal::FalconHal;
 
 use kernel::{
-    device,
+    device::{
+        self,
+        Device, //
+    },
     dma::{
         DmaAddress,
         DmaMask, //
@@ -15,9 +16,7 @@
     io::poll::read_poll_timeout,
     prelude::*,
     sync::aref::ARef,
-    time::{
-        Delta, //
-    },
+    time::Delta,
 };
 
 use crate::{
@@ -351,6 +350,9 @@ pub(crate) struct FalconBromParams {
 
 /// Trait for providing load parameters of falcon firmwares.
 pub(crate) trait FalconLoadParams {
+    /// Returns the firmware data as a slice of bytes.
+    fn as_slice(&self) -> &[u8];
+
     /// Returns the load parameters for Secure `IMEM`.
     fn imem_sec_load_params(&self) -> FalconLoadTarget;
 
@@ -370,9 +372,8 @@ pub(crate) trait FalconLoadParams {
 
 /// Trait for a falcon firmware.
 ///
-/// A falcon firmware can be loaded on a given engine, and is presented in the form of a DMA
-/// object.
-pub(crate) trait FalconFirmware: FalconLoadParams + Deref<Target = DmaObject> {
+/// A falcon firmware can be loaded on a given engine.
+pub(crate) trait FalconFirmware: FalconLoadParams {
     /// Engine on which this firmware is to be loaded.
     type Target: FalconEngine;
 }
@@ -415,10 +416,10 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
     /// `target_mem`.
     ///
     /// `sec` is set if the loaded firmware is expected to run in secure mode.
-    fn dma_wr<F: FalconFirmware<Target = E>>(
+    fn dma_wr(
         &self,
         bar: &Bar0,
-        fw: &F,
+        dma_obj: &DmaObject,
         target_mem: FalconMem,
         load_offsets: FalconLoadTarget,
     ) -> Result {
@@ -430,11 +431,11 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
             FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
-                (load_offsets.src_start, fw.dma_handle())
+                (load_offsets.src_start, dma_obj.dma_handle())
             }
             FalconMem::Dmem => (
                 0,
-                fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
+                dma_obj.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
             ),
         };
         if dma_start % DmaAddress::from(DMA_LEN) > 0 {
@@ -466,7 +467,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
                 dev_err!(self.dev, "DMA transfer length overflow\n");
                 return Err(EOVERFLOW);
             }
-            Some(upper_bound) if usize::from_safe_cast(upper_bound) > fw.size() => {
+            Some(upper_bound) if usize::from_safe_cast(upper_bound) > dma_obj.size() => {
                 dev_err!(self.dev, "DMA transfer goes beyond range of DMA object\n");
                 return Err(EINVAL);
             }
@@ -515,7 +516,12 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
     }
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
-    fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+    fn dma_load<F: FalconFirmware<Target = E>>(
+        &self,
+        dev: &Device<device::Bound>,
+        bar: &Bar0,
+        fw: &F,
+    ) -> Result {
         // The Non-Secure section only exists on firmware used by Turing and GA100, and
         // those platforms do not use DMA.
         if fw.imem_ns_load_params().is_some() {
@@ -523,14 +529,22 @@ fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result
             return Err(EINVAL);
         }
 
+        // Create DMA object with firmware content as the source of the DMA engine.
+        let dma_obj = DmaObject::from_data(dev, fw.as_slice())?;
+
         self.dma_reset(bar);
         regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(bar, fw, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
-        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params())?;
+        self.dma_wr(
+            bar,
+            &dma_obj,
+            FalconMem::ImemSecure,
+            fw.imem_sec_load_params(),
+        )?;
+        self.dma_wr(bar, &dma_obj, FalconMem::Dmem, fw.dmem_load_params())?;
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
 
@@ -641,9 +655,14 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
     }
 
     // Load a firmware image into Falcon memory
-    pub(crate) fn load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+    pub(crate) fn load<F: FalconFirmware<Target = E>>(
+        &self,
+        dev: &Device<device::Bound>,
+        bar: &Bar0,
+        fw: &F,
+    ) -> Result {
         match self.hal.load_method() {
-            LoadMethod::Dma => self.dma_load(bar, fw),
+            LoadMethod::Dma => self.dma_load(dev, bar, fw),
             LoadMethod::Pio => Err(ENOTSUPP),
         }
     }
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 815e8000bf81..09b12ad546c2 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -15,7 +15,6 @@
 };
 
 use crate::{
-    dma::DmaObject,
     falcon::{
         FalconFirmware,
         FalconLoadTarget, //
@@ -292,7 +291,7 @@ impl SignedState for Unsigned {}
 struct Signed;
 impl SignedState for Signed {}
 
-/// A [`DmaObject`] containing a specific microcode ready to be loaded into a falcon.
+/// Microcode to be loaded into a specific falcon.
 ///
 /// This is module-local and meant for sub-modules to use internally.
 ///
@@ -300,34 +299,33 @@ impl SignedState for Signed {}
 /// before it can be loaded (with an exception for development hardware). The
 /// [`Self::patch_signature`] and [`Self::no_patch_signature`] methods are used to transition the
 /// firmware to its [`Signed`] state.
-struct FirmwareDmaObject<F: FalconFirmware, S: SignedState>(DmaObject, PhantomData<(F, S)>);
+struct FirmwareObject<F: FalconFirmware, S: SignedState>(KVVec<u8>, PhantomData<(F, S)>);
 
 /// Trait for signatures to be patched directly into a given firmware.
 ///
 /// This is module-local and meant for sub-modules to use internally.
 trait FirmwareSignature<F: FalconFirmware>: AsRef<[u8]> {}
 
-impl<F: FalconFirmware> FirmwareDmaObject<F, Unsigned> {
-    /// Patches the firmware at offset `sig_base_img` with `signature`.
+impl<F: FalconFirmware> FirmwareObject<F, Unsigned> {
+    /// Patches the firmware at offset `signature_start` with `signature`.
     fn patch_signature<S: FirmwareSignature<F>>(
         mut self,
         signature: &S,
-        sig_base_img: usize,
-    ) -> Result<FirmwareDmaObject<F, Signed>> {
+        signature_start: usize,
+    ) -> Result<FirmwareObject<F, Signed>> {
         let signature_bytes = signature.as_ref();
-        if sig_base_img + signature_bytes.len() > self.0.size() {
-            return Err(EINVAL);
-        }
+        let signature_end = signature_start
+            .checked_add(signature_bytes.len())
+            .ok_or(EOVERFLOW)?;
+        let dst = self
+            .0
+            .get_mut(signature_start..signature_end)
+            .ok_or(EINVAL)?;
 
-        // SAFETY: We are the only user of this object, so there cannot be any race.
-        let dst = unsafe { self.0.start_ptr_mut().add(sig_base_img) };
+        // PANIC: `dst` and `signature_bytes` have the same length.
+        dst.copy_from_slice(signature_bytes);
 
-        // SAFETY: `signature` and `dst` are valid, properly aligned, and do not overlap.
-        unsafe {
-            core::ptr::copy_nonoverlapping(signature_bytes.as_ptr(), dst, signature_bytes.len())
-        };
-
-        Ok(FirmwareDmaObject(self.0, PhantomData))
+        Ok(FirmwareObject(self.0, PhantomData))
     }
 
     /// Mark the firmware as signed without patching it.
@@ -335,8 +333,8 @@ fn patch_signature<S: FirmwareSignature<F>>(
     /// This method is used to explicitly confirm that we do not need to sign the firmware, while
     /// allowing us to continue as if it was. This is typically only needed for development
     /// hardware.
-    fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
-        FirmwareDmaObject(self.0, PhantomData)
+    fn no_patch_signature(self) -> FirmwareObject<F, Signed> {
+        FirmwareObject(self.0, PhantomData)
     }
 }
 
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index ab374026b1f4..2b7166eaf283 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -4,10 +4,7 @@
 //! running on [`Sec2`], that is used on Turing/Ampere to load the GSP firmware into the GSP falcon
 //! (and optionally unload it through a separate firmware image).
 
-use core::{
-    marker::PhantomData,
-    ops::Deref, //
-};
+use core::marker::PhantomData;
 
 use kernel::{
     device,
@@ -16,7 +13,6 @@
 };
 
 use crate::{
-    dma::DmaObject,
     driver::Bar0,
     falcon::{
         sec2::Sec2,
@@ -28,7 +24,7 @@
     },
     firmware::{
         BinFirmware,
-        FirmwareDmaObject,
+        FirmwareObject,
         FirmwareSignature,
         Signed,
         Unsigned, //
@@ -269,12 +265,15 @@ pub(crate) struct BooterFirmware {
     // BROM falcon parameters.
     brom_params: FalconBromParams,
     // Device-mapped firmware image.
-    ucode: FirmwareDmaObject<Self, Signed>,
+    ucode: FirmwareObject<Self, Signed>,
 }
 
-impl FirmwareDmaObject<BooterFirmware, Unsigned> {
-    fn new_booter(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
-        DmaObject::from_data(dev, data).map(|ucode| Self(ucode, PhantomData))
+impl FirmwareObject<BooterFirmware, Unsigned> {
+    fn new_booter(data: &[u8]) -> Result<Self> {
+        let mut ucode = KVVec::new();
+        ucode.extend_from_slice(data, GFP_KERNEL)?;
+
+        Ok(Self(ucode, PhantomData))
     }
 }
 
@@ -328,7 +327,7 @@ pub(crate) fn new(
         let ucode = bin_fw
             .data()
             .ok_or(EINVAL)
-            .and_then(|data| FirmwareDmaObject::<Self, _>::new_booter(dev, data))?;
+            .and_then(FirmwareObject::<Self, _>::new_booter)?;
 
         let ucode_signed = {
             let mut signatures = hs_fw.signatures_iter()?.peekable();
@@ -400,6 +399,10 @@ pub(crate) fn new(
 }
 
 impl FalconLoadParams for BooterFirmware {
+    fn as_slice(&self) -> &[u8] {
+        self.ucode.0.as_slice()
+    }
+
     fn imem_sec_load_params(&self) -> FalconLoadTarget {
         self.imem_sec_load_target.clone()
     }
@@ -425,14 +428,6 @@ fn boot_addr(&self) -> u32 {
     }
 }
 
-impl Deref for BooterFirmware {
-    type Target = DmaObject;
-
-    fn deref(&self) -> &Self::Target {
-        &self.ucode.0
-    }
-}
-
 impl FalconFirmware for BooterFirmware {
     type Target = Sec2;
 }
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index df3d8de14ca1..9349c715a5a4 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -10,10 +10,7 @@
 //! - The command to be run, as this firmware can perform several tasks ;
 //! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
 
-use core::{
-    marker::PhantomData,
-    ops::Deref, //
-};
+use core::marker::PhantomData;
 
 use kernel::{
     device::{
@@ -28,7 +25,6 @@
 };
 
 use crate::{
-    dma::DmaObject,
     driver::Bar0,
     falcon::{
         gsp::Gsp,
@@ -40,7 +36,7 @@
     },
     firmware::{
         FalconUCodeDesc,
-        FirmwareDmaObject,
+        FirmwareObject,
         FirmwareSignature,
         Signed,
         Unsigned, //
@@ -174,52 +170,21 @@ fn as_ref(&self) -> &[u8] {
 
 impl FirmwareSignature<FwsecFirmware> for Bcrt30Rsa3kSignature {}
 
-/// Reinterpret the area starting from `offset` in `fw` as an instance of `T` (which must implement
-/// [`FromBytes`]) and return a reference to it.
-///
-/// # Safety
-///
-/// * Callers must ensure that the device does not read/write to/from memory while the returned
-///   reference is live.
-/// * Callers must ensure that this call does not race with a write to the same region while
-///   the returned reference is live.
-unsafe fn transmute<T: Sized + FromBytes>(fw: &DmaObject, offset: usize) -> Result<&T> {
-    // SAFETY: The safety requirements of the function guarantee the device won't read
-    // or write to memory while the reference is alive and that this call won't race
-    // with writes to the same memory region.
-    T::from_bytes(unsafe { fw.as_slice(offset, size_of::<T>())? }).ok_or(EINVAL)
-}
-
-/// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
-/// implement [`FromBytes`]) and return a reference to it.
-///
-/// # Safety
-///
-/// * Callers must ensure that the device does not read/write to/from memory while the returned
-///   slice is live.
-/// * Callers must ensure that this call does not race with a read or write to the same region
-///   while the returned slice is live.
-unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
-    fw: &mut DmaObject,
-    offset: usize,
-) -> Result<&mut T> {
-    // SAFETY: The safety requirements of the function guarantee the device won't read
-    // or write to memory while the reference is alive and that this call won't race
-    // with writes or reads to the same memory region.
-    T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
-}
-
 /// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
 ///
 /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
 pub(crate) struct FwsecFirmware {
     /// Descriptor of the firmware.
     desc: FalconUCodeDesc,
-    /// GPU-accessible DMA object containing the firmware.
-    ucode: FirmwareDmaObject<Self, Signed>,
+    /// Object containing the firmware binary.
+    ucode: FirmwareObject<Self, Signed>,
 }
 
 impl FalconLoadParams for FwsecFirmware {
+    fn as_slice(&self) -> &[u8] {
+        self.ucode.0.as_slice()
+    }
+
     fn imem_sec_load_params(&self) -> FalconLoadTarget {
         self.desc.imem_sec_load_params()
     }
@@ -245,23 +210,15 @@ fn boot_addr(&self) -> u32 {
     }
 }
 
-impl Deref for FwsecFirmware {
-    type Target = DmaObject;
-
-    fn deref(&self) -> &Self::Target {
-        &self.ucode.0
-    }
-}
-
 impl FalconFirmware for FwsecFirmware {
     type Target = Gsp;
 }
 
-impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
-    fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
+impl FirmwareObject<FwsecFirmware, Unsigned> {
+    fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
         let desc = bios.fwsec_image().header()?;
-        let ucode = bios.fwsec_image().ucode(&desc)?;
-        let mut dma_object = DmaObject::from_data(dev, ucode)?;
+        let mut ucode = KVVec::new();
+        ucode.extend_from_slice(bios.fwsec_image().ucode(&desc)?, GFP_KERNEL)?;
 
         let hdr_offset = desc
             .imem_load_size()
@@ -269,8 +226,9 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             .map(usize::from_safe_cast)
             .ok_or(EINVAL)?;
 
-        // SAFETY: we have exclusive access to `dma_object`.
-        let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
+        let hdr = FalconAppifHdrV1::from_bytes_prefix(&ucode[hdr_offset..])
+            .ok_or(EINVAL)?
+            .0;
 
         if hdr.version != 1 {
             return Err(EINVAL);
@@ -284,8 +242,9 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
                 .and_then(|o| o.checked_add(i.checked_mul(usize::from(hdr.entry_size))?))
                 .ok_or(EINVAL)?;
 
-            // SAFETY: we have exclusive access to `dma_object`.
-            let app: &FalconAppifV1 = unsafe { transmute(&dma_object, entry_offset) }?;
+            let app = FalconAppifV1::from_bytes_prefix(&ucode[entry_offset..])
+                .ok_or(EINVAL)?
+                .0;
 
             if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
                 continue;
@@ -298,9 +257,10 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
                 .map(usize::from_safe_cast)
                 .ok_or(EINVAL)?;
 
-            let dmem_mapper: &mut FalconAppifDmemmapperV3 =
-                // SAFETY: we have exclusive access to `dma_object`.
-                unsafe { transmute_mut(&mut dma_object, dmem_mapper_offset) }?;
+            let dmem_mapper =
+                FalconAppifDmemmapperV3::from_bytes_mut_prefix(&mut ucode[dmem_mapper_offset..])
+                    .ok_or(EINVAL)?
+                    .0;
 
             dmem_mapper.init_cmd = match cmd {
                 FwsecCommand::Frts { .. } => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS,
@@ -314,9 +274,9 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
                 .map(usize::from_safe_cast)
                 .ok_or(EINVAL)?;
 
-            let frts_cmd: &mut FrtsCmd =
-                // SAFETY: we have exclusive access to `dma_object`.
-                unsafe { transmute_mut(&mut dma_object, frts_cmd_offset) }?;
+            let frts_cmd = FrtsCmd::from_bytes_mut_prefix(&mut ucode[frts_cmd_offset..])
+                .ok_or(EINVAL)?
+                .0;
 
             frts_cmd.read_vbios = ReadVbios {
                 ver: 1,
@@ -340,7 +300,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             }
 
             // Return early as we found and patched the DMEMMAPPER region.
-            return Ok(Self(dma_object, PhantomData));
+            return Ok(Self(ucode, PhantomData));
         }
 
         Err(ENOTSUPP)
@@ -357,7 +317,7 @@ pub(crate) fn new(
         bios: &Vbios,
         cmd: FwsecCommand,
     ) -> Result<Self> {
-        let ucode_dma = FirmwareDmaObject::<Self, _>::new_fwsec(dev, bios, cmd)?;
+        let ucode_dma = FirmwareObject::<Self, _>::new_fwsec(bios, cmd)?;
 
         // Patch signature if needed.
         let desc = bios.fwsec_image().header()?;
@@ -429,7 +389,7 @@ pub(crate) fn run(
             .reset(bar)
             .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
         falcon
-            .load(bar, self)
+            .load(dev, bar, self)
             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
         let (mbox0, _) = falcon
             .boot(bar, Some(0), None)
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index c56029f444cb..78957ed8814f 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -178,7 +178,7 @@ pub(crate) fn boot(
         );
 
         sec2_falcon.reset(bar)?;
-        sec2_falcon.load(bar, &booter_loader)?;
+        sec2_falcon.load(dev, bar, &booter_loader)?;
         let wpr_handle = wpr_meta.dma_handle();
         let (mbox0, mbox1) = sec2_falcon.boot(
             bar,

-- 
2.53.0

