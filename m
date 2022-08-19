Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA165A01FE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12783113641;
	Wed, 24 Aug 2022 19:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC58910E117
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 21:43:46 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-47-4RE9sXC-OQ6fYpbHD6dEYg-1; Fri, 19 Aug 2022 22:43:43 +0100
X-MC-Unique: 4RE9sXC-OQ6fYpbHD6dEYg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.38; Fri, 19 Aug 2022 22:43:42 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.040; Fri, 19 Aug 2022 22:43:42 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Hamza Mahfooz' <hamza.mahfooz@amd.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/amd/display: fix i386 frame size warning
Thread-Topic: [PATCH] drm/amd/display: fix i386 frame size warning
Thread-Index: AQHYsyK3bLhoYPUGX0aEEgc6M/SYOq22wp5Q
Date: Fri, 19 Aug 2022 21:43:42 +0000
Message-ID: <f9f6fa60ae8c4e949ef9cce5b47f95bd@AcuMS.aculab.com>
References: <20220818164848.68729-1-hamza.mahfooz@amd.com>
In-Reply-To: <20220818164848.68729-1-hamza.mahfooz@amd.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: =?iso-8859-1?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra_Canal?= <mairacanal@riseup.net>,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, David Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bing Guo <Bing.Guo@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hamza Mahfooz
> Sent: 18 August 2022 17:49
>=20
> Addresses the following warning:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:=
3596:6: error: stack frame
> size (2092) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurat=
ionFull' [-Werror,-Wframe-
> larger-than]
> void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib =
*mode_lib)
>      ^
>=20
> UseMinimumDCFCLK() is eating away at
> dml30_ModeSupportAndSystemConfigurationFull()'s stack space, so use a
> pointer to struct vba_vars_st instead of passing lots of large arrays
> as parameters by value.
>=20
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  .../dc/dml/dcn30/display_mode_vba_30.c        | 295 ++++--------------
>  1 file changed, 63 insertions(+), 232 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30=
.c
> b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> index 876b321b30ca..b7fa003ffe06 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> @@ -396,64 +396,10 @@ static void CalculateUrgentBurstFactor(
>=20
>  static void UseMinimumDCFCLK(
>  =09=09struct display_mode_lib *mode_lib,
> -=09=09int MaxInterDCNTileRepeaters,
> +=09=09struct vba_vars_st *v,

You should probably add 'const' in there.
Thinks will likely break if v->xxx gets changed.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

