Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14720A2F650
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 19:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047B210E0F6;
	Mon, 10 Feb 2025 18:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="WXB+MrIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazolkn19010012.outbound.protection.outlook.com [52.103.43.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83FE10E391
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 16:30:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/VgBDxVKneZAZe7xdeqRNHuE0O2Nx/mu/QtYG9qttRsn1qCtIQ1u3kwxiBMJeATe2He+pT+anTd/6/qAqvVvFbmZZ+LxDuYpSLTtyxjkx5CXTd6GpsI9eW2+1vCOSTejRCrBKR4HDfCxEV7FnBIHBp4T/rSace4QtOuntn3PW+kN+D14d9sTRV7Fgco7vJhvHEkIqW5F0yjpkNdfaXtms+UgcfYsWWtlTqLwjllfGyDRXHo1ebtm0olSAjlZrEUY+7NLOS1TWh9cAoJJVassc/raraenM1/4Ga2TyfSy3GwCbiuwxgdUoi1bJ9dvh7mMZNnEiMRlUGu3P3Qf92eJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1zY11woGQRG2oaHo2EdQbQSyOyFfxWJmnMwlvi100o=;
 b=aOa677Tnq9eXy3dArM64qXjfy5fwbxMW5gfmBAGHLISNB3dFd8dhkN+8f5DKx3nVyRJ0wA8uAIzFn45mHnHihth3/pBkS9bOfz6phA3+WXS7CYDxO9t0NcpMvmYbAT+pb1Yhq7oyKbEI1GRpon4hxrSZ/DF/hTGfMiC+xx/V1cPqS31LXFEp62We+eckz1LYvSJfPgwRdMM+BtIlwfFhbgsWutJdprH7DUeiVLj96XjeJSb9Vje7l0oprjNDiLWX4+kcUnPsbPCaRF3O9bVY7kAxDIHp3OuywRBKo1NvVBBxh97CkH+lXOc2vdxWS7GzCz+9d0XnJkOY6BdbKxTzDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1zY11woGQRG2oaHo2EdQbQSyOyFfxWJmnMwlvi100o=;
 b=WXB+MrIjNSXD3XMm5zQv3gLTaGv4qZn41hurWZuxOjLF+QKSEIO2x9sElX3GMuuXwsP4qZpEX7knCnxRCygsdhxDpxu5eP1rbRgzNcrphsWPsU9t+gHGdmm/89tu8fHz2ed1UIRAZRkV1F8JX6Z52KyD6dHPUyCkeVgI6qspriJqzNZESIgOVHEv0cBUjgHYqxeXCyEm8L8DA2PIspOJEpD19hl+Pq30ic7VIj7rsTPvHNpjJ35Ltk8vpSRtqO4iwRH2NZUML7HsLPuTs3S3eO6iOsx223vCoOL4oMe6UQ2mWfWcj2kOh5fq7IRyvof6fblEz9tpe/6NWAkbOQKdYg==
Received: from TYWPR01MB11707.jpnprd01.prod.outlook.com
 (2603:1096:400:3ff::13) by TYRPR01MB12584.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 16:30:08 +0000
Received: from TYWPR01MB11707.jpnprd01.prod.outlook.com
 ([fe80::1558:1bff:2918:d3b1]) by TYWPR01MB11707.jpnprd01.prod.outlook.com
 ([fe80::1558:1bff:2918:d3b1%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 16:30:07 +0000
From: =?iso-2022-jp?B?GyRCTXsbKEIgGyRCQC8bKEI=?= <qs315490@outlook.com>
To: "airlied@gmail.com" <airlied@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?iso-2022-jp?B?GyRCTXsbKEIgGyRCQC8bKEI=?= <qs315490@outlook.com>
Subject: [PATCH] drm/i915/quirks: Add no dpio-common-bc powerwell init quirk
 for xiaomi-latte
Thread-Topic: [PATCH] drm/i915/quirks: Add no dpio-common-bc powerwell init
 quirk for xiaomi-latte
Thread-Index: AQHbe9kMxeMNwg3o6Emn7xPold8JWg==
Date: Mon, 10 Feb 2025 16:30:07 +0000
Message-ID: <20250210162950.4102846-1-qs315490@outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11707:EE_|TYRPR01MB12584:EE_
x-ms-office365-filtering-correlation-id: bd46354c-98ea-4117-a51d-08dd49f02e96
x-microsoft-antispam: BCL:0;
 ARA:14566002|38102599003|15080799006|8062599003|8060799006|19110799003|461199028|7092599003|440099028|3412199025|41001999003|30101999003|3430499032|102099032|1710799026;
x-microsoft-antispam-message-info: =?iso-2022-jp?B?a1VRZnk1ZWhuVkVlUnpOekdoNlFXdk0yK25IMlZ3aXhXODZqZ21nQ2lo?=
 =?iso-2022-jp?B?QVZBL1ZwQ09UUVdyYjJmVHhMbEo3VkRmS3BRdGFwQmtJaE45ZGl1R1Mx?=
 =?iso-2022-jp?B?bk5QaU9ZZmtpSEhJMnBTQ1JEU25FbmxTby9jTXh2RDR0emdnWVFva1FK?=
 =?iso-2022-jp?B?aFp2emE5L2E2dnhYeCtqWkpWdWRxUHEwWFd2VUx6Ulh1d1JsS1c4eFIw?=
 =?iso-2022-jp?B?NU05bFk1aW8veWtraVd4eitJc2YwaFJydzJpTTR3elBCNGNpUUZXbXF1?=
 =?iso-2022-jp?B?MDkxckczNFZqSmUyeW0xdlN4cVZnK2xHbkYyWXJqQ3kwRFNzaFRnMC9q?=
 =?iso-2022-jp?B?aExsNXczMFpwMEhlL21kSWFYbnRLUUVyRCs0M2VwTW5DdmtHdXJkY2w5?=
 =?iso-2022-jp?B?V1RUeTFmMk5taytnRkZNaityNXdJcWpZblkwT3VMY21aQnZxY04ydEFw?=
 =?iso-2022-jp?B?bjlTWHMwdE94dFFLZDBJaFFUd3BIR01DQXkzVUpFeUI0U0ZjcXlyRjc3?=
 =?iso-2022-jp?B?TERwNWV5OUkxVUJJbGx2c1dXS0JqYlUrYW5kNnJVMmNyKzc1OHArUE5l?=
 =?iso-2022-jp?B?bHdiQi94a2o0Nit0cW5SUWF0S2l5alNjZGdZTWprdk5nenBPMmlRTmtt?=
 =?iso-2022-jp?B?UFo3U3EvM3cyZHcyMmZsaVRINm92WGhLcWVXUityVnp4RjRDdmdvY0Jv?=
 =?iso-2022-jp?B?MENpek9NUlc4Qkk5WllTcGhjTmRGQnMzdzlvMElDK2c4cHM0VUlhS3Zz?=
 =?iso-2022-jp?B?aHBmMjZxR2YwZVVQY3hnZ1dnKzF6WUhZOWxsbTVwbzZZZkxmM3JHdEln?=
 =?iso-2022-jp?B?YTNHOWkzUGpCeUczS1RZVlNvVlZ2RlBjTStIYWZmbUNzTkV2bFFDamUy?=
 =?iso-2022-jp?B?enZmcVVJTkh6VmFQQWlId2puNUFsM25oZTgzVnpvUFJleS92RS81Sy95?=
 =?iso-2022-jp?B?bWxkZmJCb0dSM2trVGNIdVBvaGVZbjZnRm1CMlhKOVFlVW5GVnQ2RkQ1?=
 =?iso-2022-jp?B?VUlnYXA0UWVBR0UvcHF0Tm1qMEZuSiszZFYvUDlWVnVnRFBvZ05aWncx?=
 =?iso-2022-jp?B?Tnd1bzF4T0VCYzU4VXcvN1NEejVaVHkwZmxSd1IzdFdFKzgwRXJ3dFVu?=
 =?iso-2022-jp?B?Y0hwMW9mN1hmMVlCVWVxZk1tY042SU1EaGZDOG14d3NScmZhanVEbUlQ?=
 =?iso-2022-jp?B?VWprd2I3VHZNQVJVQXY4OEZrK0d1Y0tQNUQ5eDJLck5nTnpPczdVQWNi?=
 =?iso-2022-jp?B?WTA1bkV0UVc1M3o4WHlvK1MydXFMQkc4clRmWVo5OEtyLy8zL0dSeXhp?=
 =?iso-2022-jp?B?TWkrRWZqTzM3dmp0bnZXbUtyaXVWNEpxelZENkhEYnRTUFRLZjU2WjJy?=
 =?iso-2022-jp?B?amhPeFVrZDh3bThsMTkrUHhyZjVXYy9WcVg0YXpPT1ZRWkxNV0VkL0pS?=
 =?iso-2022-jp?B?d1YwV0VSZGhMY21hVmpVRXRPeldSMDlHQm1PSUZiL1JtUGs0bTBENGJM?=
 =?iso-2022-jp?B?czkxUExxQk45TWtwZHM1UDF2Y25Ua0lKWTI4N3dpSEVENklJWFRtbnB5?=
 =?iso-2022-jp?B?cmdpT21pZHBucndWT0QyNE54T1ZVZ1g1Vk5GM1gzQlNlSVFOLzJ5ZmR1?=
 =?iso-2022-jp?B?RmRvQUYyOXBzTmlOckZ4OW9IN3Z0MU5GcmdUY2Z5dXkzSEcrcXZMMzFh?=
 =?iso-2022-jp?B?VnZpdDZDdlhrQWJOREUrU005dHFTWDNYZmwyUEFvYldQUjNHWGVma21q?=
 =?iso-2022-jp?B?WUs2VFZZMXo0UktSNHlLVFNDNnc9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?WkpsTGVDWjVtWnBEQlpUV2JpNzFHNDc3cE5Cb0hGWFNVQXRiSWdlRDcv?=
 =?iso-2022-jp?B?K280OFVpM2V3Z0NldGFHcFFwaTNYL1VVNlpyZVRNN09jdzZqVDJGVisy?=
 =?iso-2022-jp?B?Rmd4eWphUElEaVlCMmNTbE1LbVNUWndzQnI0K2ovVzhOUGFybStPQTZT?=
 =?iso-2022-jp?B?R0cxVTVaZkVDZ05hZ09rUHdMYmkyMHpsZjV2dFlJc0FQOFpoc0wyN0hm?=
 =?iso-2022-jp?B?UUtwaUtZSXR1aXJIQ0sxbWR6ajlaaEZIYmhJZTRpUnk5enFLbGVvdkZO?=
 =?iso-2022-jp?B?S3piOVAzVDNiL0JJVEFxaXhScUtxRmkzL2FvUlp5RkNzRTF3bm5GRzA0?=
 =?iso-2022-jp?B?Q3AyeE5BR1ljck1QNEpYZVZaeWJwbGxEQW9BQWF1OUF5ZXZERjNNNUlY?=
 =?iso-2022-jp?B?RGVWa3lyU1BpcXhrTjhJWUNEUlJ5ZUFZQklnRVdJK0dMT0drWkN5UGtR?=
 =?iso-2022-jp?B?MnNZeFhOY1JVQW1wU0toRjQvblNSeFNUc3VnaTBvK3gyZDFidGxiUXQx?=
 =?iso-2022-jp?B?SmZUL2Z0V01pQTlSVXZqU3JvL2lSeUtiSkQyd2ZQWEJwVjRCZkh0dys2?=
 =?iso-2022-jp?B?b3lRSFpqZ3d5RmhuRzBNUVVTZHltdk10V2VVSDN3WWFtenV6N1dZTUpa?=
 =?iso-2022-jp?B?YzRtNmxCa1ZwRWh1S2NWVzJrbW1XUVJ3UDUveTluQ0kyMUQyQTlvcEV6?=
 =?iso-2022-jp?B?S2xGbm1heEFSc285UHNuYjdwOTY1Ty9Fb3VXL29hZnJjMjVMTjRXQTV1?=
 =?iso-2022-jp?B?ZGRzclA2NzlRaExod2kwR0grNFFmSjJiYUJ6TTRIMjJmTXAybTlCUGNQ?=
 =?iso-2022-jp?B?TURvby9uVXhmODc2Zmx5REJGOXlvU3RLSmdlVFhWSnovK1dnRTVRWWRl?=
 =?iso-2022-jp?B?dk1GSWJoS1JDTmlhdC8xWU1jbVNDRmVYeGZWS0Rkb3pHWEwvaVZrTUh5?=
 =?iso-2022-jp?B?Y0ZaSCtKa05ZRmY5cDFNdTdlY1VpWFY3OUplZUp5UWF0cGF0bzIyZG0x?=
 =?iso-2022-jp?B?NmRjNU9MUHU0OVJuSkphRC9EdWVqTFM0QUlsRzlVaFdoeVMrdkgyQ054?=
 =?iso-2022-jp?B?Q0xZUXFIbFFRTWQxdHQzNVd2UmxkN2IxVEVwZUpjYWJvOWxIUXhYR0ln?=
 =?iso-2022-jp?B?YjJnemxla1BpSUcvTmR4TkJPbFlBZ0Y4MzY2Y1NVQlVVdnNtNkJFdFZo?=
 =?iso-2022-jp?B?TUVQVVNLV3dQRXBDbmNYK2RQRG5NQU9TOURWcXE4VGhhY0dxY3h4TkFp?=
 =?iso-2022-jp?B?aUFIRzF4VjZRNGpDdlA4SHRIUTdsUWltSFpvZnY3MWFyMnphOFNJc0tl?=
 =?iso-2022-jp?B?YkpLWHFoTDlMckM4NzdLdE0rS0JxY2tLMlNvaVZ0cjVMYlNiNW1PaEtx?=
 =?iso-2022-jp?B?eUFucDV2R0dCTFNLd3F1YTdmcGp3cnNMbTI2ZkZsczlseEx4MUdURldx?=
 =?iso-2022-jp?B?UHpXalhpaVU0R2x3SG0zUndUZExwUUJXMTBEeFVnMlRBSnFpNnhlYk02?=
 =?iso-2022-jp?B?dGpXdTFMQ2RDL2VMMDlaMFUzY2ZNZnBwM3hYTHdLVG4rcmlxL2RlQUQz?=
 =?iso-2022-jp?B?M042R0d0N2tIdEVmU3hJeEs3Sm0rZUxURHo4SzByM1cyT3J3ek5kWXoz?=
 =?iso-2022-jp?B?cWI5cHBjMVFyS3lZSWM2U1FQVmN3RFRrU3BPV0dpVkZXbVVjcFQxZXRa?=
 =?iso-2022-jp?B?bURpaWt5SjBYUkdOcDN5S2dsV0w4andqQ04rWkVQUDN3ZVhtY2xNY202?=
 =?iso-2022-jp?B?Q1U3b2JhZDN1aTh2UjdOYisrWWc9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11707.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bd46354c-98ea-4117-a51d-08dd49f02e96
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 16:30:07.8455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12584
X-Mailman-Approved-At: Mon, 10 Feb 2025 18:03:28 +0000
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

This tablet does not have dpio-common-bc powerwell init.

i915 0000:00:02.0: [drm] *ERROR* timeout setting power well state 00000000 =
(fffff3ff)
i915 0000:00:02.0: [drm] *ERROR* Display PHY 0 is not power up

Signed-off-by: Qs315490 <qs315490@outlook.com>
---
 .../drm/i915/display/intel_display_driver.c   |  4 ++--
 .../drm/i915/display/intel_display_power.c    | 21 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.c   |  8 +++++++
 drivers/gpu/drm/i915/display/intel_quirks.h   |  1 +
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/=
gpu/drm/i915/display/intel_display_driver.c
index 50ec0c3c7..36338e12f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -226,6 +226,8 @@ int intel_display_driver_probe_noirq(struct intel_displ=
ay *display)
 	if (ret)
 		goto cleanup_bios;
=20
+	intel_init_quirks(display);
+
 	/* FIXME: completely on the wrong abstraction layer */
 	ret =3D intel_power_domains_init(display);
 	if (ret < 0)
@@ -267,8 +269,6 @@ int intel_display_driver_probe_noirq(struct intel_displ=
ay *display)
 	if (ret)
 		goto cleanup_vga_client_pw_domain_dmc;
=20
-	intel_init_quirks(display);
-
 	intel_fbc_init(display);
=20
 	return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/g=
pu/drm/i915/display/intel_display_power.c
index d3b8453a1..c589836cb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -23,6 +23,7 @@
 #include "intel_pcode.h"
 #include "intel_pmdemand.h"
 #include "intel_pps_regs.h"
+#include "intel_quirks.h"
 #include "intel_snps_phy.h"
 #include "skl_watermark.h"
 #include "skl_watermark_regs.h"
@@ -482,6 +483,12 @@ intel_display_power_grab_async_put_ref(struct intel_di=
splay *display,
 	return ret;
 }
=20
+static const struct i915_power_well_instance *
+i915_power_well_instance(const struct i915_power_well *power_well)
+{
+    return &power_well->desc->instances->list[power_well->instance_idx];
+}
+
 static void
 __intel_display_power_get_domain(struct intel_display *display,
 				 enum intel_display_power_domain domain)
@@ -493,7 +500,14 @@ __intel_display_power_get_domain(struct intel_display =
*display,
 		return;
=20
 	for_each_power_domain_well(display, power_well, domain)
+	{
+		if (domain =3D=3D POWER_DOMAIN_INIT &&
+		    intel_has_quirk(display, QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT) &&
+		    i915_power_well_instance(power_well)->id =3D=3D VLV_DISP_PW_DPIO_CMN=
_BC)
+			continue;
+
 		intel_power_well_get(display, power_well);
+	}
=20
 	power_domains->domain_use_count[domain]++;
 }
@@ -589,7 +603,14 @@ __intel_display_power_put_domain(struct intel_display =
*display,
 	power_domains->domain_use_count[domain]--;
=20
 	for_each_power_domain_well_reverse(display, power_well, domain)
+	{
+		if (domain =3D=3D POWER_DOMAIN_INIT &&
+			intel_has_quirk(display, QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT) &&
+			i915_power_well_instance(power_well)->id =3D=3D VLV_DISP_PW_DPIO_CMN_BC=
)
+			continue;
+
 		intel_power_well_put(display, power_well);
+	}
 }
=20
 static void __intel_display_power_put(struct intel_display *display,
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/=
i915/display/intel_quirks.c
index 8b30e9fd9..af2fa6b67 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -78,6 +78,12 @@ static void quirk_fw_sync_len(struct intel_dp *intel_dp)
 	drm_info(display->drm, "Applying Fast Wake sync pulse count quirk\n");
 }
=20
+static void quirk_no_vlv_disp_pw_dpio_cmn_bc_init(struct intel_display *di=
splay)
+{
+	intel_set_quirk(display, QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT);
+	drm_info(display->drm, "Applying no dpio-common-bc powerwell init quirk\n=
");
+}
+
 struct intel_quirk {
 	int device;
 	int subsystem_vendor;
@@ -229,6 +235,8 @@ static struct intel_quirk intel_quirks[] =3D {
 	{ 0x3184, 0x1019, 0xa94d, quirk_increase_ddi_disabled_time },
 	/* HP Notebook - 14-r206nv */
 	{ 0x0f31, 0x103c, 0x220f, quirk_invert_brightness },
+	/* Xiaomi Pad 2 - xiaomi-latte */
+	{ 0x22b0, 0x1d72, 0x1502, quirk_no_vlv_disp_pw_dpio_cmn_bc_init },
 };
=20
 static const struct intel_dpcd_quirk intel_dpcd_quirks[] =3D {
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/=
i915/display/intel_quirks.h
index cafdebda7..6e7ea8c13 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -20,6 +20,7 @@ enum intel_quirk_id {
 	QUIRK_LVDS_SSC_DISABLE,
 	QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
 	QUIRK_FW_SYNC_LEN,
+	QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT,
 };
=20
 void intel_init_quirks(struct intel_display *display);
--=20
2.39.5

