Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43F176D7A9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 21:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AD210E57F;
	Wed,  2 Aug 2023 19:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3329310E57E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 19:23:17 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9c0391749so2583171fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 12:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691004195; x=1691608995;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JI2K3/PcSU16SfdP5G82uId5N2ZoQeoXguPyrHWGg6g=;
 b=tkMu6S6U09q5cbMC2faJ6XMuyy/++wbqdEdZQuxFKXozCoiSofPMmmKu56DsNj3dte
 QDALUCNMAFVjAmv5bKBAry1F8F0lI0ksk7I6Axl3c2nhJV280O04ioXZbvsKW2t0Dj+o
 puVbk8MXW29h67qAbAu1hfjjwUQkneRNaP6J7odNXeIMQ3dg8rGT4avdUpwS5HpUvmOg
 2vGRDLsMxaoqsd/fcivVzvMBerknFUFR0FHbBaPRAIDUnksH1liS7pAoKK39M83IsShU
 LJqqVxajJzIAUaudL6lNmlSBTWCBm90yZfqFcCbAPO41ymMZ8fMttR93kDAg425LPfeP
 03zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691004195; x=1691608995;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JI2K3/PcSU16SfdP5G82uId5N2ZoQeoXguPyrHWGg6g=;
 b=KhESqfTTJdyO1k3P6aA7tXcHcMfSbaM2unxd7sH9WU5eqANo/ulbLos6VmCPvl+115
 K+1IEsElXWgyKkmB47TX44vpCsib/q0izftGPhPwZxrbz8inkAzE4P2Tq/ZsKNG4dQox
 ezPreq3EMwwicHjK3s87vPPPzhnJfZ0EuM0EXXlE4cDwnoZo86mDTW3nDNsF95AaVam4
 UjnXC7OTQGXMn+cwYrD6CgcSp4wDL47r4FDNW614QC96plutuEk5Aq0dsk6KWPu9wU2c
 c9+ySFuMzDxUlj+8dSoz+lRi6B8frUwszYLfWomnBNZkCkHtOup7vIF6LU1Ux4DDpm6H
 RuWQ==
X-Gm-Message-State: ABy/qLbO8bnRUErYSpxqilpV36e/U7eYopdY3Rg1is1CB/w/GHWrJv2/
 dKRs1nASeIhbvTBBoVqxTIw4Wg==
X-Google-Smtp-Source: APBJJlGtKeD676HvToSidDuUv88oPdXG/NhYmfpmAPpdeFYZVFMNg6R4XBWpqpRFoiNXESjcvPqjbw==
X-Received: by 2002:a19:4f4c:0:b0:4fb:9168:1fc7 with SMTP id
 a12-20020a194f4c000000b004fb91681fc7mr5082939lfk.51.1691004195381; 
 Wed, 02 Aug 2023 12:23:15 -0700 (PDT)
Received: from [127.0.0.1] (85-76-68-36-nat.elisa-mobile.fi. [85.76.68.36])
 by smtp.gmail.com with ESMTPSA id
 d25-20020ac24c99000000b004f86d3e52c0sm3043962lfl.4.2023.08.02.12.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 12:23:14 -0700 (PDT)
Date: Wed, 02 Aug 2023 22:23:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/4] drm/uapi: document the USB subconnector type
User-Agent: K-9 Mail for Android
In-Reply-To: <20230802191351.GA1407@pendragon.ideasonboard.com>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <20230729004913.215872-4-dmitry.baryshkov@linaro.org>
 <20230802185547.GC32500@pendragon.ideasonboard.com>
 <a32ce695-038f-0ef8-3584-5bd1ba528131@linaro.org>
 <20230802191351.GA1407@pendragon.ideasonboard.com>
Message-ID: <DE2B4523-D16C-4AFC-8352-212B23548DD5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

2 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2023 =D0=B3=2E 22:13:51 GMT+03=
:00, Laurent Pinchart <laurent=2Epinchart@ideasonboard=2Ecom> =D0=BF=D0=B8=
=D1=88=D0=B5=D1=82:
>On Wed, Aug 02, 2023 at 10:01:19PM +0300, Dmitry Baryshkov wrote:
>> On 02/08/2023 21:55, Laurent Pinchart wrote:
>> > Hi Dmitry,
>> >=20
>> > Thank you for the patch=2E
>> >=20
>> > On Sat, Jul 29, 2023 at 03:49:12AM +0300, Dmitry Baryshkov wrote:
>> >> To properly define the USB-C DP altmode connectors, add the USB
>> >> subconnector type=2E
>> >>
>> >> Suggested-by: Simon Ser <contact@emersion=2Efr>
>> >> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> >> ---
>> >>   drivers/gpu/drm/drm_connector=2Ec | 1 +
>> >>   include/uapi/drm/drm_mode=2Eh     | 1 +
>> >>   2 files changed, 2 insertions(+)
>> >>
>> >> diff --git a/drivers/gpu/drm/drm_connector=2Ec b/drivers/gpu/drm/drm=
_connector=2Ec
>> >> index a6066e4a5e9a=2E=2E9e96b038f5d0 100644
>> >> --- a/drivers/gpu/drm/drm_connector=2Ec
>> >> +++ b/drivers/gpu/drm/drm_connector=2Ec
>> >> @@ -1050,6 +1050,7 @@ static const struct drm_prop_enum_list drm_dp_=
subconnector_enum_list[] =3D {
>> >>   	{ DRM_MODE_SUBCONNECTOR_DisplayPort, "DP"        }, /* DP */
>> >>   	{ DRM_MODE_SUBCONNECTOR_Wireless,    "Wireless"  }, /* DP */
>> >>   	{ DRM_MODE_SUBCONNECTOR_Native,	     "Native"    }, /* DP */
>> >> +	{ DRM_MODE_SUBCONNECTOR_USB,	     "USB"       }, /* DP */
>> >=20
>> > Should this be DRM_MODE_SUBCONNECTOR_USB_C and "USB-C", in case we ge=
t
>> > another USB type later ?
>>=20
>> Hmm, which id should I use for micro-USB then? (consider anx7808,=20
>> SlimPort)=2E I thought about using DRM_MODE_SUBCONNECTOR_USB for both o=
f=20
>> them=2E But maybe I should add another subtype for SlimPort=2E
>
>I suppose it depends on whether userspace needs a way to differentiate
>those=2E Do you have a good visibility on the userspace use cases ?

No=2E I'm not even sure, which userspace handles subtypes properly=2E

For the reference, SlimPort is mostly legacy hardware, think about Nexus 4=
, 5, 6, 7 (2013)


>
>> >>   };
>> >>  =20
>> >>   DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
>> >> diff --git a/include/uapi/drm/drm_mode=2Eh b/include/uapi/drm/drm_mo=
de=2Eh
>> >> index 92d96a2b6763=2E=2E0f74918b011c 100644
>> >> --- a/include/uapi/drm/drm_mode=2Eh
>> >> +++ b/include/uapi/drm/drm_mode=2Eh
>> >> @@ -398,6 +398,7 @@ enum drm_mode_subconnector {
>> >>   	DRM_MODE_SUBCONNECTOR_HDMIA       =3D 11, /*            DP */
>> >>   	DRM_MODE_SUBCONNECTOR_Native      =3D 15, /*            DP */
>> >>   	DRM_MODE_SUBCONNECTOR_Wireless    =3D 18, /*            DP */
>> >> +	DRM_MODE_SUBCONNECTOR_USB         =3D 20, /*            DP */
>> >>   };
>> >>  =20
>> >>   #define DRM_MODE_CONNECTOR_Unknown	0
>

