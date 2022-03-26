Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFC84E8318
	for <lists+dri-devel@lfdr.de>; Sat, 26 Mar 2022 18:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B767510E410;
	Sat, 26 Mar 2022 17:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01olkn2045.outbound.protection.outlook.com [40.92.53.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65E710EF2D
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Mar 2022 11:53:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6LFBtbaX3zq62+RbvVpsbxNiv/+u549AQGY4PLaZ2qmaVBwlPg6GHTjRVB0+uQ5n2uWdy5ssX3Y1vQbF+z+vn/vdzKj29FoMxGqJJPUgTEiHntZiQ7Yt18elWksUl6xo0WshaWHqSKPKxiRRQLGp8w2/vYK7RzBvj9xTDl14N/Q82FnBPeEQROaiX/hMMsWcwdVLCM4jvLk+eIqTHQDIVN7kXLTTmbTPmHSz0CUoQWpBQGHqDRIx2DKoqFKMm3Rl4RvIO8rcrS5oJ7/l+72Vang1notB9I/I86ycdzAbp3Dt5ovlAG5sARfbKiBPh1z9lkZL+viBVVfToy4rD0WYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bECebAFmMLdZAQcUx9tEkI1yMPp55kWCKSjoebiyLKY=;
 b=c8MDDaN3tdZoQQvvW12yMh4qWkzRGR/y6eNe4K4C3yhFp3wVeFfpC3fbLHzs5k6+XX3liA9xlwIqxYSUrxaM8UIWH35Phxex+bqQuvOYx0lcu3F12DA+PTrQr4Zls0d18VGCEfygwiKvdpGTj/+kyjhOtZn6ghstqqQl2JMLt+7jpeD9ypuSYjt4PRNw9c4IT7hkwaMfVgDKldJt3521e3TUr40JmU7LN5yKxp22UD0d4jOKqipakwgVaCvuq11ilJ5VAyanz66a54WPtJR9F7k71L41Ktx4JSxfWXw7hegaoHTGFgpr2r0z+XUH0v/bOB2XJgtpcwSzq7CgFDeiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bECebAFmMLdZAQcUx9tEkI1yMPp55kWCKSjoebiyLKY=;
 b=q2ivSCkVd91+VR/Yp0V1Limsix/kGok4noy2ph9xi2snGu6nd7LTUHoOKGIqrt2DJhO8xzVvcmULuiecD3DBDZ7TiOmkF67LXhcbEDWOZllqND6nG5IKW5HXb49g0bPLsRpCLi0NVfl6GE+6YMzzXeWtawtvlfO5ULcd53650RX+UvfK2iBGPaR6G6kB7Z7Bv0GbNCMhqm5ppWLqPrnX9vCeAkNT8IiIvFVkIJziB9o3IZAtW8JJm7iMA7jl7lBF3UsVCGEhdk00bTXGXjT9FN4uLKiR2i1QaPg2Tr0NPwK1UTj8b0E4Uv98iB/+0bZ+4cc/et86o4IJtDNQG4XIhA==
Received: from TYZPR01MB3935.apcprd01.prod.exchangelabs.com
 (2603:1096:400:8::7) by SEZPR01MB4303.apcprd01.prod.exchangelabs.com
 (2603:1096:101:40::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Sat, 26 Mar
 2022 11:53:07 +0000
Received: from TYZPR01MB3935.apcprd01.prod.exchangelabs.com
 ([fe80::8dd1:e105:311a:ce51]) by TYZPR01MB3935.apcprd01.prod.exchangelabs.com
 ([fe80::8dd1:e105:311a:ce51%3]) with mapi id 15.20.5102.022; Sat, 26 Mar 2022
 11:53:06 +0000
Message-ID: <TYZPR01MB3935D1963BFD458E85412E4DF81B9@TYZPR01MB3935.apcprd01.prod.exchangelabs.com>
Subject: [ PATCH ] Documentation: fixed doc-build warnings
From: kushagra765@outlook.com
To: linux-doc@vger.kernel.org, corbet@lwn.net
Date: Sat, 26 Mar 2022 17:22:55 +0530
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN: [a/aKdxfKdbxXCxC4LG8d4rkf3FOqm/28MeRsBjj/rQA=]
X-ClientProxiedBy: BM1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::26) To TYZPR01MB3935.apcprd01.prod.exchangelabs.com
 (2603:1096:400:8::7)
X-Microsoft-Original-Message-ID: <eeb064c760454aee4faf4c7bb08381d2065b0ceb.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc1d3b77-875d-4d90-552e-08da0f1f310f
X-MS-TrafficTypeDiagnostic: SEZPR01MB4303:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dvJTQ08deoDJoOp4hhK81arpUgTUWwNZep2NKTyWXf1S6ssKLGecJmjn8tH/kzpFWrCj1cMftTpmMpMJigTXZ35UfYMhRmKHfVyvVfLoHiIh6yiLfpK7GQ0zTfOEWlIj/o+AWyaDqmVFfR8ZWnRcvqqIbPX/glIAE2ctP+8Wqm+PHq5m/ohLd2o/WMZm6X1Ow2yipWdTlSfIwNrXoy3OC+concHPu0j17bkEdha1opSv2Qf51664yD0z80SVtcotbq0eguYS4ppY23NCRw2gHIg2TrBEyA78Zi04GWcROID8Z7bBzX0SIZaZhw5Vst0Pz9x1X22Uz4dFp2ay/gLRxubAN6xkBNdyO6DOjNvRIZClTSbQalkiHt8P4GbYUznOrlePKixRTKSpF6Gtsc8R6F7XMoug8EFZSYqKdhkL7V8I33iI1FNcSJkrgTv3G1zMIz+CvwsiJmjjGkdutk2BOYVXvdpiPEqUFJrhupVgfam7WlLxyxJ5S9s7ypTr9xq4fL0Ns1MGuGjsxgBwi22ZNC26MeR7QMifnafuHIyLYOfPjT/7u9aoY5o1QgkUh5LavByK265HoWthOsUG1OokMQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUVHV3RVb1VCWHBpR1NUd3dWL2s4NnJiZWNGbFd4OWFlalY0ZklGdDF6V2lz?=
 =?utf-8?B?Q3phVnIzVisxQnh4dDhlYXNhNXVOdlhDckpoS21aTXRyNDM0d3I5dFA2a3ZX?=
 =?utf-8?B?UkhxcEx4cGZ3aGxSRnJGRDByVzJpUkwzMmtzaUdMWXR1N0lkd1gxQXQ1eEZl?=
 =?utf-8?B?ZGZCZEs0MkJ2TXU0bCtialZ2VmNkbmpRNS9mQXRvZS9NWGVCNkUzMjRaMFhC?=
 =?utf-8?B?OHd6VG85TVpPUEh2ckJmUjlsT3pmMng0VHJVU2ovWEJzMi9zVkd6RXR6MFBY?=
 =?utf-8?B?WDBzVXF6cVExVVFyZkJWYll1ZzdFbVFGVlJ0TzhwVU9RVkdwMm1QZG9iTnlK?=
 =?utf-8?B?d3BQL1F0ZElLdC9CcG44SHpWcGtJb1NnVGJmMnBhRU8vVEJvUUZBRjNya2lS?=
 =?utf-8?B?OGo3SnhXZGRXTWRzeXZOMVVVNDErMy9Kek9sMG84Z2dCTXlvU2ZxbWt0K1Zv?=
 =?utf-8?B?Q3cyTm9lcks2bDBCVjJ6bitWZlIyMzdXOTMrZjQ0Zm4yWXAzbU12ZmNFdlZi?=
 =?utf-8?B?eGFqcnpnUnlBWi91RXJLMjdhOVc4ZzZTbXprUVpDdThMdUQvZHN1N00veHB6?=
 =?utf-8?B?eDd1RlhIL21xSzYrN1dwVmtGeVV4T1J5YWROdVVBL1ZrTlZEckpGWjJmQVlY?=
 =?utf-8?B?WVVUL2R6bFQ0TnBUMS91OFMwYmZIZ1pkS1RvakpNREY4OVRCdk81aHJNOS8r?=
 =?utf-8?B?N2ZTdzhoblVOeVJVL1YwZlZCNmw3dCtJN1dGVzZCVW81TzBma08xTFZHNlU4?=
 =?utf-8?B?ZklkMCtmZmNwbXNRbkJTamErRnJFaWp3a1Bpd01Tc0J1MGROTGkzdjlpNTFw?=
 =?utf-8?B?Ni9TdlFtNEhoSmZhL25lUk9EMXFjczdCSnpUd2pOT3Jab0doTTRjYkRTbEdT?=
 =?utf-8?B?ZEtjKzk3QzVZUEoyME9SRDFMeG1UVTVlaWxURnpIRmlVUFVnZ2M5T1JvV2hH?=
 =?utf-8?B?bXkrL280YjNXN3FKczBldjk0Rm9XQUwraXlWWWRaTnBFc2RlNTlsdURzR001?=
 =?utf-8?B?UVZmcjVwMWlqNkxvNlVsUnZMVDZwcXVDVlhsZ3R4akVPby9FWVp6UVp1RGJz?=
 =?utf-8?B?NTYvRTk0bWYweHE4amQxUENTY3hMb29lazJtdU1sNk5pb3diNkx6RVp3MTJZ?=
 =?utf-8?B?OHFObEJMZ3MxY2pOaFlURmhGMFU4cUViTzZzRWhCTlBnWi9CcTdMM1ZEM3Bj?=
 =?utf-8?B?bXFZelBjTlUyZHNEZWtFRzRGQ0tKNkc0VEg3Q285d1V0Vk1QdUJ1TERTL1Bv?=
 =?utf-8?B?RzM2UHhqTyt6TXBJbHkzTGJPUEcxdnQ3RlJ3WFZ1S1BKaDJ0NWFIczlKWmtj?=
 =?utf-8?B?RWVxaUtQTktOTGhYMGNvUFJQNmx5dnlMVHd4dFVUWUZZV1RkcWJ4RkVZSmpJ?=
 =?utf-8?B?Q2VxWG9xVS9LT201dU0wQkkwdng2SEIzNUxUUnR2ejJ0UjdxZ0I1MWhwOEpj?=
 =?utf-8?B?Y3Y1eFJFTFh4VVdMVlZsQU9kTnlEcklXQlNzRDl0WC9lVkNtM05Kb1ZpVWNK?=
 =?utf-8?B?WkpSemxxaTY4aGFtU2RlWWMvODk3RGVmM043WXl6eC9qcWZCQVp6SFJuMnI5?=
 =?utf-8?B?VTNrbDNSYXV4a1U0bmtRZVk1MnR6VUJMVzhGcEk3dVdBMjBzWmN0cEUzZmM5?=
 =?utf-8?B?UTJzTkVmNWFEWmc3dWR4ZTlVSk1DQ096M3k1Sk5VT1VQRnN4WUdJdUJDRWFG?=
 =?utf-8?B?TmowNG5Kcnd4WGlscjdnRkhTTnNValV3VW5xNit4NFhCV2NKQTBHWE1XWUE4?=
 =?utf-8?B?dWRyTkk0c3d3MzdRcE5FL1FUYjR1ZjhQcGFTaTBkeDNzUCtkTE1hVUEzOGww?=
 =?utf-8?B?amdndnFtT2cxUml1SFM1ZCtzMG1aODZldW1sczlod3ZCQnUrck1wTjM2UldM?=
 =?utf-8?B?eEFVOE1IMFA0QUtqZ0FvMXRYeUNJeE5RWmRzZHN1NFBuOUZWNHNjZDRxS0Fl?=
 =?utf-8?Q?Y1thZ5rdMunFQgpbXRr+rwBW5iqc0Af0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1d3b77-875d-4d90-552e-08da0f1f310f
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB3935.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2022 11:53:06.9255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB4303
X-Mailman-Approved-At: Sat, 26 Mar 2022 17:48:05 +0000
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
Cc: balbi@kernel.org, tzimmermann@suse.de, arnd@arndb.de, airlied@linux.ie,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com,
 mcgrof@kernel.org, linux-cachefs@redhat.com, viro@zeniv.linux.org.uk,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From 9a9918b051d5709b5e14ca8afa29f3ef644b8688 Mon Sep 17 00:00:00 2001
From: Kushagra Verma <kushagra765@outlook.com>
Date: Sat, 26 Mar 2022 16:43:15 +0530
Subject: [PATCH] Documentation: fixed doc-build warnings

   This patch fixes the following (and 2 other) doc-build warnings:
      1. ./include/linux/dcache.h:308: warning: expecting prototype for dget, dget_dlock(). Prototype was for dget_dlock() instead

      2. ./include/linux/fscache.h:268: warning: Excess function parameter 'object' description in 'fscache_use_cookie'

      3 ./include/linux/fscache.h:285: warning: Excess function parameter 'object' description in 'fscache_unuse_cookie'

      4. ./drivers/gpu/drm/drm_format_helper.c:640: warning: Excess function parameter 'src' description in 'drm_fb_xrgb8888_to_mono_reversed'

Signed-off-by: Kushagra Verma <kushagra765@outlook.com>
---
 drivers/gpu/drm/drm_format_helper.c | 1 -
 drivers/usb/dwc3/core.c             | 1 -
 drivers/usb/dwc3/gadget.c           | 3 +--
 include/linux/dcache.h              | 2 +-
 include/linux/fscache.h             | 2 --
 5 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index bc0f49773868..d753b34950c9 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -624,7 +624,6 @@ static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, unsigned
  * drm_fb_xrgb8888_to_mono_reversed - Convert XRGB8888 to reversed monochrome
  * @dst: reversed monochrome destination buffer
  * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @src: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f4c09951b517..63e2ccbb7c33 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -343,7 +343,6 @@ static void dwc3_frame_length_adjustment(struct dwc3 *dwc)
  *		from the default, this will set clock period in DWC3_GUCTL
  *		register.
  * @dwc: Pointer to our controller context structure
- * @ref_clk_per: reference clock period in ns
  */
 static void dwc3_ref_clk_period(struct dwc3 *dwc)
 {
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a0c883f19a41..ee98004434df 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -660,7 +660,6 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 /**
  * dwc3_gadget_calc_tx_fifo_size - calculates the txfifo size value
  * @dwc: pointer to the DWC3 context
- * @nfifos: number of fifos to calculate for
  *
  * Calculates the size value based on the equation below:
  *
@@ -693,7 +692,7 @@ static int dwc3_gadget_calc_tx_fifo_size(struct dwc3 *dwc, int mult)
 }
 
 /**
- * dwc3_gadget_clear_tx_fifo_size - Clears txfifo allocation
+ * dwc3_gadget_clear_tx_fifos - Clears txfifo allocation
  * @dwc: pointer to the DWC3 context
  *
  * Iterates through all the endpoint registers and clears the previous txfifo
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index f5bba51480b2..fa35ac489a42 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -297,7 +297,7 @@ extern char *dentry_path(const struct dentry *, char *, int);
 /* Allocation counts.. */
 
 /**
- *	dget, dget_dlock -	get a reference to a dentry
+ *	dget_dlock - get a reference to a dentry
  *	@dentry: dentry to get a reference to
  *
  *	Given a dentry or %NULL pointer increment the reference count
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index d44ff747a657..9e29494241ea 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -256,7 +256,6 @@ struct fscache_cookie *fscache_acquire_cookie(struct fscache_volume *volume,
 
 /**
  * fscache_use_cookie - Request usage of cookie attached to an object
- * @object: Object description
  * @will_modify: If cache is expected to be modified locally
  *
  * Request usage of the cookie attached to an object.  The caller should tell
@@ -272,7 +271,6 @@ static inline void fscache_use_cookie(struct fscache_cookie *cookie,
 
 /**
  * fscache_unuse_cookie - Cease usage of cookie attached to an object
- * @object: Object description
  * @aux_data: Updated auxiliary data (or NULL)
  * @object_size: Revised size of the object (or NULL)
  *
-- 
2.25.1


