Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7214292B127
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 09:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D8610E494;
	Tue,  9 Jul 2024 07:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="J/Od+a7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2022.outbound.protection.outlook.com [40.92.103.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228CE10E1FB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 06:11:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbBpn8vtvMB2+6Rf1acLezXbc0kBiyLpvQwosMzQhyxM7G4jGJ65fBDTPwgvL4ztEMr2WEYu5Rds+OVNtyQJCOvfk54W7iYP50D5cHvYvN+wacLFOMNg1GaS6nuoiqOxnpdQYYsRqr7EbLUvy5/fazm5Ulo2j539V3i7oqj37fsnGj7pIkJAY6r23IUB8ne8iYwUn9IfuNIkQBg+Bs+ky4EYwEQqEEka1blofSz/ZKojyNOPCKNuOcRnAnhcJvDHC9rI+gHKeUbzVcJuW2H3zOWaDyLkGHpmM5nWStfltlBoFFHmp48j3IZtuC3WKiOnkV2rZD739qCviauAVOfmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zv/lMjlqw7Vjb0Sl3CyS/M7PzNw0oJ6KFU/noLs+Fg=;
 b=H3M0F7bcLWjFSH9qQ/MS11jkWQZXFdSoahuOSmP27pn+IghmnlctR/Q58eyAlk42ugKoa9rHUCuJLJ9g3rTD3QDJWx9MeR1P6g6Wvxn76yukEA9LtVfsdRmejyiyGARledGJCj/jwslMjwYKmAIaggs1520uq7FbCilwbUux8bbKd2JP325JQanXSfaezubhQ4RwtUgj5Ianm0TEbJv6dXPRa+DPZN2xQZIVASoYDsU4DVT/f85p0K48/uhEwEGJxkg+kLj8FoA/qHz/NMMGLBvI2osOGMd4YZ8p2S66sIcXVTVTWVAVz66cmqzZt6RqeNx4dTpke9XBO4rQ8nWr3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zv/lMjlqw7Vjb0Sl3CyS/M7PzNw0oJ6KFU/noLs+Fg=;
 b=J/Od+a7+lKj6VAhEZtD9OyWipv+gxmfjHGLs+2pP3UzcFSSNVzMrNLveiJU69EEQukUioZ/vj2znQ1Y71Sg1MrzAejooH/nZ52MSUJ1yl4qO7hql7kccrhbeY0usQ79u9dfForrzZM06uaBwnCtbOFeqk3JzCOi3T4erHXzDwQO8cRNmSIA2/XmQP5Hxi46G4/gAkdFVs0NOivdtpTIq8D11PlQ7K+MTtDLSOHWha+1o4V3APkBIIIxHwQTariXskdke1kSnskcQquaicaZ8B87ozhdG/cqLWMNSTAvx5CYAIuyQ5mUnVWTyohdM4rOiM/7QN5DZDPYCrAUGrJJAlQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MAZP287MB0438.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:d5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.36; Tue, 9 Jul 2024 06:10:55 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 06:10:55 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/format-helper: Add conversion from XRGB8888 to BGR888
Thread-Topic: [PATCH] drm/format-helper: Add conversion from XRGB8888 to BGR888
Thread-Index: AQHazs/npPFVDGRE/UGzA9O2q3QhPLHsc8+AgAF7QL0=
Date: Tue, 9 Jul 2024 06:10:55 +0000
Message-ID: <MA0P287MB0217A11382BDB18F82A7D442B8DB2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
References: <4C98332B-4E56-4314-8BDA-709AD3974899@live.com>
 <37c0df72-498b-44ad-9a47-d69f0515edd7@suse.de>
In-Reply-To: <37c0df72-498b-44ad-9a47-d69f0515edd7@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [KmJsU+TjGxwRKqSU/fKpx4VvfBZVR83Z]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MAZP287MB0438:EE_
x-ms-office365-filtering-correlation-id: feacebf3-f527-44d6-8347-08dc9fdde487
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|19110799003|8060799006|4302099013|3412199025|440099028|1602099012|102099032;
x-microsoft-antispam-message-info: 5m6hz+K80MQxmenOdC1gEng8+tjXAtxW/iz5FXISoZgUBm7K+S0LfhU6H1VF5+ZXf/fcuKBETWpZ3u9MJEs3c26/61qTFbbKl7o6yfu1MGf9Jr6b4evRpRF+bepcT0K4Ukr11qjqERppmy090eaMfV/oBGekeDucNcLSR40UMKxPnDjXbmsnazZ00tWtj+qotwndauztYlLN7Ij6o6DF+zO+VbTa90+oIByO2QJjrnB4Zq3k4bgOm4/K5/FN30k7VOjvZB4J+eRDVcJo3xxmsTOqp+CCc7wmvY/fKvs+6N79fD6kaZZIXNEoi5twnM/WFA9W9zonik3p0peC5jbfExq+pSJPBnXMJMIr+C1sipaJl7toIDMIQkUdawtL5QoLaNH99bCmN7FTfsFSu1XPWIdwDhDxhTMFKpoRFtfnbVB2Tih0yP7ZoByRReS/tPWFy28jvSCXUZwmik4D4s3jDcxhDnMeVCnYTOiWpx413myZohobvY1WBCX7QObg2ohV006rMtGiDkjfVySRP46M5yGYm3jrobKbjisT2ddhGKJIPNVZWhlZ7o1Bhyl4SrNSko6IG1jLT4fEqyDr51X3/h4+ourbpT7Aqs9VVK9FG1oA9RZIkocFbkQRy61BSDVddqtPjwUr0SKfblidH+QgtRMlRp6DIa5LNRcpUP5hUf8chlJJCt5/Z67O6r6rcF0UVEFaiNnMdwXxLhcN5J6ba2jiSonbelj6fSUNSWngf2ypT2X8GL2Lpo5+lE2MsRbu
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VVp0C4I0jLORlGwJqTomc99ebSg86AOqHAU9Eqh5dR3Hs5PxbkGh2dDtHGMo?=
 =?us-ascii?Q?wiuIjqt0+5jbnphizvSvjN4jRue3u05FUh9la3K26VESxniA0kC++tbTeHnC?=
 =?us-ascii?Q?5gvOY6kqAjt0QltHxcKG++GSAtfosntzDxBgnieSxwkEHdcTt9qhYwcZUjeD?=
 =?us-ascii?Q?PQjKz5EadWU+j5FfBVrlOPFF0B/R2vYv0zJ4SBtFKf4Va5RlGUEzZ2cSOM0M?=
 =?us-ascii?Q?B7LMlxo8wPQ4amBNQXh9NPqh0wYjFr/DiM0a/FWPO//vkBb6c2Be9JHYtiOn?=
 =?us-ascii?Q?ZCaVaykBJaLJ78JCevkYhwSDhtzOpukmgUXP0pJGe1qCC8q9Ezuk1DcU1xR1?=
 =?us-ascii?Q?ZxohcFCpPd5oLvhonaiYsf5wDFwF+gSDI7RbSZ1ybwG6UN2GnJwkriVrjEeh?=
 =?us-ascii?Q?IWWqSJXrEKXvgbQ/R6lXgmkVQxOG67Wl6ZAIHsHvN1glvQ3Hw0zqsGdCE+aQ?=
 =?us-ascii?Q?xgoyWSnfUkWN3XX8Ci2AiO6sWE+wGcBs8U3kaSlJITIVobxmK8iTWJAxrURP?=
 =?us-ascii?Q?iBLsD1Cz6xuHYecsJ42IlwfPHROrhQ+szBnLdJE6Uc//Sngti4SQvt1ap8Ux?=
 =?us-ascii?Q?/zfIBpkEwPk5VZN/CTSdZwUpffDWYihTgC18DnmDFVvoSu0B5n4mwPXGPYXG?=
 =?us-ascii?Q?Wgtsy7lHNr6QUYR7P1ZMLqOGb2DpAfIXl0sKE5frEU8WJlIvpjfSJiA5YqjC?=
 =?us-ascii?Q?2UhOWrvMTHSEM3eZU8IMdaJ7Ha5Pqyeq1C/+cR1HXwGhyKOP19kzlhK+g4Ut?=
 =?us-ascii?Q?oGqvf89eWbKBtBgeQBRJW4AQb29hnLbMHnGnkg9qNIpEf0Qq8Z2f5kofiEuC?=
 =?us-ascii?Q?EZwHwDqGeJ7S/OPGvGNzkJjwgwNuGzdb77Pnrnwq+YO9B2Tx2yqsVooVjit7?=
 =?us-ascii?Q?jG0uswRX6wqWaBsoMUdILgUKRZnY3NQ69g5ZH7i9RgkQewnFU4MmWkmMIlUq?=
 =?us-ascii?Q?/P2oA94eLGQgtkhHR9zZLjzETPDyP98nqbV7l2JRmFnGPoW0U3Pg0SGixfVO?=
 =?us-ascii?Q?Kkp4zWewFImDyqIf5iz/7HP6Jh8YSoU+UL99PmOGLCy8/spP4ZZ4R4xgRbDn?=
 =?us-ascii?Q?yyFCoqMkG4dxf/mo1trH1C6kuqdZQMQ6qlx0Gz98ur6rfxoAp5AvnLdGY0wC?=
 =?us-ascii?Q?nJ8hz5Sg1Uzzr1oYsouZ/si+UQoAzS8wYdAaqTT3F/7UX54Tmae5orM9zzYn?=
 =?us-ascii?Q?Lqa72qO7DnN35q/JC/+mua3uIpTuMmubQjeb7RCoCZvWtL6f+bpR6VIRhyI?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: feacebf3-f527-44d6-8347-08dc9fdde487
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 06:10:55.0382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0438
X-Mailman-Approved-At: Tue, 09 Jul 2024 07:34:09 +0000
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

Hi Thomas

I found upstreamed drivers which may be using this routine.

https://elixir.bootlin.com/linux/latest/A/ident/DRM_FORMAT_BGR888

I guess the same logic was used to upstream all these:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/gpu/drm/drm_format_helper.c?h=3Dv6.10-rc7&id=3D10cd592e639edcea50d78=
1a07edcf3470d1f222e

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/gpu/drm/drm_format_helper.c?h=3Dv6.10-rc7&id=3D56119bfb39142090fb84a=
c08a3f14dd48410e961

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/gpu/drm/drm_format_helper.c?h=3Dv6.10-rc7&id=3D175073d694cd9db4c4ca9=
7c978a447acc6b5cb33


My apologies if I am wrong somewhere.

________________________________________
From: Thomas Zimmermann <tzimmermann@suse.de>
Sent: 08 July 2024 13:00
To: Aditya Garg; maarten.lankhorst@linux.intel.com; mripard@kernel.org; air=
lied@gmail.com; daniel@ffwll.ch
Cc: Orlando Chamberlain; Kerem Karabay; dri-devel@lists.freedesktop.org; Li=
nux Kernel Mailing List
Subject: Re: [PATCH] drm/format-helper: Add conversion from XRGB8888 to BGR=
888

Hi

Am 05.07.24 um 13:38 schrieb Aditya Garg:
> From: Kerem Karabay <kekrby@gmail.com>
>
> Add XRGB8888 emulation helper for devices that only support BGR888.

Nothing wrong with that, but it needs a caller. Do you have a driver
that uses this routine?

Best regards
Thomas

>
> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>   drivers/gpu/drm/drm_format_helper.c           | 54 +++++++++++++
>   .../gpu/drm/tests/drm_format_helper_test.c    | 81 +++++++++++++++++++
>   include/drm/drm_format_helper.h               |  3 +
>   3 files changed, 138 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_fo=
rmat_helper.c
> index b1be458ed..28c0e76a1 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -702,6 +702,57 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst=
, const unsigned int *dst_pi
>   }
>   EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
>
> +static void drm_fb_xrgb8888_to_bgr888_line(void *dbuf, const void *sbuf,=
 unsigned int pixels)
> +{
> +     u8 *dbuf8 =3D dbuf;
> +     const __le32 *sbuf32 =3D sbuf;
> +     unsigned int x;
> +     u32 pix;
> +
> +     for (x =3D 0; x < pixels; x++) {
> +             pix =3D le32_to_cpu(sbuf32[x]);
> +             /* write red-green-blue to output in little endianness */
> +             *dbuf8++ =3D (pix & 0x00FF0000) >> 16;
> +             *dbuf8++ =3D (pix & 0x0000FF00) >> 8;
> +             *dbuf8++ =3D (pix & 0x000000FF) >> 0;
> +     }
> +}
> +
> +/**
> + * drm_fb_xrgb8888_to_bgr888 - Convert XRGB8888 to BGR888 clip buffer
> + * @dst: Array of BGR888 destination buffers
> + * @dst_pitch: Array of numbers of bytes between the start of two consec=
utive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to =
each other.
> + * @src: Array of XRGB8888 source buffers
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + * @state: Transform and conversion state
> + *
> + * This function copies parts of a framebuffer to display memory and con=
verts the
> + * color format during the process. Destination and framebuffer formats =
must match. The
> + * parameters @dst, @dst_pitch and @src refer to arrays. Each array must=
 have at
> + * least as many entries as there are planes in @fb's format. Each entry=
 stores the
> + * value for the format's respective color plane at the same index.
> + *
> + * This function does not apply clipping on @dst (i.e. the destination i=
s at the
> + * top-left corner).
> + *
> + * Drivers can use this function for BGR888 devices that don't natively
> + * support XRGB8888.
> + */
> +void drm_fb_xrgb8888_to_bgr888(struct iosys_map *dst, const unsigned int=
 *dst_pitch,
> +                            const struct iosys_map *src, const struct dr=
m_framebuffer *fb,
> +                            const struct drm_rect *clip, struct drm_form=
at_conv_state *state)
> +{
> +     static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] =3D {
> +             3,
> +     };
> +
> +     drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, stat=
e,
> +                 drm_fb_xrgb8888_to_bgr888_line);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_bgr888);
> +
>   static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sb=
uf, unsigned int pixels)
>   {
>       __le32 *dbuf32 =3D dbuf;
> @@ -1035,6 +1086,9 @@ int drm_fb_blit(struct iosys_map *dst, const unsign=
ed int *dst_pitch, uint32_t d
>               } else if (dst_format =3D=3D DRM_FORMAT_RGB888) {
>                       drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, =
clip, state);
>                       return 0;
> +             } else if (dst_format =3D=3D DRM_FORMAT_BGR888) {
> +                     drm_fb_xrgb8888_to_bgr888(dst, dst_pitch, src, fb, =
clip, state);
> +                     return 0;
>               } else if (dst_format =3D=3D DRM_FORMAT_ARGB8888) {
>                       drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb=
, clip, state);
>                       return 0;
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu=
/drm/tests/drm_format_helper_test.c
> index 08992636e..e54f0f6e7 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -60,6 +60,11 @@ struct convert_to_rgb888_result {
>       const u8 expected[TEST_BUF_SIZE];
>   };
>
> +struct convert_to_bgr888_result {
> +     unsigned int dst_pitch;
> +     const u8 expected[TEST_BUF_SIZE];
> +};
> +
>   struct convert_to_argb8888_result {
>       unsigned int dst_pitch;
>       const u32 expected[TEST_BUF_SIZE];
> @@ -107,6 +112,7 @@ struct convert_xrgb8888_case {
>       struct convert_to_argb1555_result argb1555_result;
>       struct convert_to_rgba5551_result rgba5551_result;
>       struct convert_to_rgb888_result rgb888_result;
> +     struct convert_to_bgr888_result bgr888_result;
>       struct convert_to_argb8888_result argb8888_result;
>       struct convert_to_xrgb2101010_result xrgb2101010_result;
>       struct convert_to_argb2101010_result argb2101010_result;
> @@ -151,6 +157,10 @@ static struct convert_xrgb8888_case convert_xrgb8888=
_cases[] =3D {
>                       .dst_pitch =3D TEST_USE_DEFAULT_PITCH,
>                       .expected =3D { 0x00, 0x00, 0xFF },
>               },
> +             .bgr888_result =3D {
> +                     .dst_pitch =3D TEST_USE_DEFAULT_PITCH,
> +                     .expected =3D { 0xFF, 0x00, 0x00 },
> +             },
>               .argb8888_result =3D {
>                       .dst_pitch =3D TEST_USE_DEFAULT_PITCH,
>                       .expected =3D { 0xFFFF0000 },
> @@ -217,6 +227,10 @@ static struct convert_xrgb8888_case convert_xrgb8888=
_cases[] =3D {
>                       .dst_pitch =3D TEST_USE_DEFAULT_PITCH,
>                       .expected =3D { 0x00, 0x00, 0xFF },
>               },
> +             .bgr888_result =3D {
> +                     .dst_pitch =3D TEST_USE_DEFAULT_PITCH,
> +                     .expected =3D { 0xFF, 0x00, 0x00 },
> +             },
>               .argb8888_result =3D {
>                       .dst_pitch =3D TEST_USE_DEFAULT_PITCH,
>                       .expected =3D { 0xFFFF0000 },
> @@ -330,6 +344,15 @@ static struct convert_xrgb8888_case convert_xrgb8888=
_cases[] =3D {
>                               0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
>                       },
>               },
> +             .bgr888_result =3D {
> +                     .dst_pitch =3D TEST_USE_DEFAULT_PITCH,
> +                     .expected =3D {
> +                             0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00,
> +                             0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00,
> +                             0x00, 0x00, 0xFF, 0xFF, 0x00, 0xFF,
> +                             0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF,
> +                     },
> +             },
>               .argb8888_result =3D {
>                       .dst_pitch =3D TEST_USE_DEFAULT_PITCH,
>                       .expected =3D {
> @@ -468,6 +491,17 @@ static struct convert_xrgb8888_case convert_xrgb8888=
_cases[] =3D {
>                               0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>                       },
>               },
> +             .bgr888_result =3D {
> +                     .dst_pitch =3D 15,
> +                     .expected =3D {
> +                             0x0E, 0x44, 0x9C, 0x11, 0x4D, 0x05, 0xA8, 0=
xF3, 0x03,
> +                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                             0x6C, 0xF0, 0x73, 0x0E, 0x44, 0x9C, 0x11, 0=
x4D, 0x05,
> +                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                             0xA8, 0x03, 0x03, 0x6C, 0xF0, 0x73, 0x0E, 0=
x44, 0x9C,
> +                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                     },
> +             },
>               .argb8888_result =3D {
>                       .dst_pitch =3D 20,
>                       .expected =3D {
> @@ -914,6 +948,52 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct ku=
nit *test)
>       KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>
> +static void drm_test_fb_xrgb8888_to_bgr888(struct kunit *test)
> +{
> +     const struct convert_xrgb8888_case *params =3D test->param_value;
> +     const struct convert_to_bgr888_result *result =3D &params->bgr888_r=
esult;
> +     size_t dst_size;
> +     u8 *buf =3D NULL;
> +     __le32 *xrgb8888 =3D NULL;
> +     struct iosys_map dst, src;
> +
> +     struct drm_framebuffer fb =3D {
> +             .format =3D drm_format_info(DRM_FORMAT_XRGB8888),
> +             .pitches =3D { params->pitch, 0, 0 },
> +     };
> +
> +     dst_size =3D conversion_buf_size(DRM_FORMAT_BGR888, result->dst_pit=
ch,
> +                                    &params->clip, 0);
> +     KUNIT_ASSERT_GT(test, dst_size, 0);
> +
> +     buf =3D kunit_kzalloc(test, dst_size, GFP_KERNEL);
> +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
> +     iosys_map_set_vaddr(&dst, buf);
> +
> +     xrgb8888 =3D cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
> +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
> +     iosys_map_set_vaddr(&src, xrgb8888);
> +
> +     /*
> +      * BGR888 expected results are already in little-endian
> +      * order, so there's no need to convert the test output.
> +      */
> +     drm_fb_xrgb8888_to_bgr888(&dst, &result->dst_pitch, &src, &fb, &par=
ams->clip,
> +                               &fmtcnv_state);
> +     KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +
> +     buf =3D dst.vaddr; /* restore original value of buf */
> +     memset(buf, 0, dst_size);
> +
> +     int blit_result =3D 0;
> +
> +     blit_result =3D drm_fb_blit(&dst, &result->dst_pitch, DRM_FORMAT_BG=
R888, &src, &fb, &params->clip,
> +                               &fmtcnv_state);
> +
> +     KUNIT_EXPECT_FALSE(test, blit_result);
> +     KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +}
> +
>   static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
>   {
>       const struct convert_xrgb8888_case *params =3D test->param_value;
> @@ -1851,6 +1931,7 @@ static struct kunit_case drm_format_helper_test_cas=
es[] =3D {
>       KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb1555, convert_xrgb8888=
_gen_params),
>       KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgba5551, convert_xrgb8888=
_gen_params),
>       KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888, convert_xrgb8888_g=
en_params),
> +     KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_bgr888, convert_xrgb8888_g=
en_params),
>       KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888=
_gen_params),
>       KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8=
888_gen_params),
>       KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8=
888_gen_params),
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_hel=
per.h
> index f13b34e0b..b53cf85ca 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -95,6 +95,9 @@ void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst,=
 const unsigned int *dst_
>   void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned in=
t *dst_pitch,
>                              const struct iosys_map *src, const struct dr=
m_framebuffer *fb,
>                              const struct drm_rect *clip, struct drm_form=
at_conv_state *state);
> +void drm_fb_xrgb8888_to_bgr888(struct iosys_map *dst, const unsigned int=
 *dst_pitch,
> +                            const struct iosys_map *src, const struct dr=
m_framebuffer *fb,
> +                            const struct drm_rect *clip, struct drm_form=
at_conv_state *state);
>   void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned =
int *dst_pitch,
>                                const struct iosys_map *src, const struct =
drm_framebuffer *fb,
>                                const struct drm_rect *clip, struct drm_fo=
rmat_conv_state *state);

--
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

