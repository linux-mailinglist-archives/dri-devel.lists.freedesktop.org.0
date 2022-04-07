Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EDF4F8259
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 17:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481DA10E441;
	Thu,  7 Apr 2022 15:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AF510E441
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 15:02:42 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 17so7847157lji.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=y0f+Yu3Bpr5dxm0vLBTScFhvDFwOgu8Ul3zj8DwXFvI=;
 b=MI+BMCKmiyEUYsaqRiYUuOTpjzzmk50hLgB8MvB/eXZBiLlQcJOfnDDY8GxZ+e5h3t
 IgbFl0VC05MtzBWAFU7fLpaHIo+9uOg8vrFgVzLiyJZ21n07adq2+Wtj81GFDWaVRUeC
 DOZLMp3TmTrZZVcIhWCsE8HGEPdbq+cZ1VU6wHjEQMtkKLXbijkj0BzsX2HXSmbU79l2
 lrmnQLrbxpa4vKG5N4TM2cuiB9dXkC6j9Oeij5Tdf/oXvcwh+ML1QvxXLC1idsLB/ws7
 +K6/ut2++ORoaPKiYVJnDB6nvnShL+rdgTuoF7L5B9zFJdWVr13pTtgG07MYTKR39t95
 f52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=y0f+Yu3Bpr5dxm0vLBTScFhvDFwOgu8Ul3zj8DwXFvI=;
 b=BkqEl72FMUVQmb0NfO3UuripvyriUFxgPZanonqGBbILXVSq+mffXx+grjPyClZUGy
 2eg52fwygf/i4jpeFssMo2Mo3MJHZYp+FpwBQrwgrbEXax4n+gyOPBTxcW88CEd1UxTR
 rBbE3jum5BoDbmi56OYLUkUx3pLnVfqwSSqeBxz6jpnYoEhzTjvVwj5EyDz0J6u7HglZ
 aVEjpjVn4ER6Ul7cf5l1Dx0q/8Pu83Lk4D9mp+F5LH0Nw0GRRn/36zTSkYwGiIZRu5Nl
 8iNXCSwyVuc6lHrwI6VId/ouazqgNWe5wy0FGjaSwFEVVHGORTRMgLDgm6K/esGipQEd
 /gVA==
X-Gm-Message-State: AOAM531ceyr6hAD7XV585MhFoH+P/E79wmHs8/ObVSsnR9LSyE5tN0lM
 92aM6n6yBTAiHNulCN4oO7E=
X-Google-Smtp-Source: ABdhPJxCMJJTwHYUQon8+nPlhvp8RZX3B2bkoMvlFBC2Tnnw3b7tmTlX82Qt3xh9n2CaSH6+MgcAGQ==
X-Received: by 2002:a05:651c:150a:b0:249:a0b1:2e15 with SMTP id
 e10-20020a05651c150a00b00249a0b12e15mr9039980ljf.182.1649343760989; 
 Thu, 07 Apr 2022 08:02:40 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 bi2-20020a0565120e8200b0044826a117bcsm2191087lfb.44.2022.04.07.08.02.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Apr 2022 08:02:40 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20220407101642.GE4012@pengutronix.de>
Date: Thu, 7 Apr 2022 17:02:36 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <BF7F3C19-1BB6-4A2B-AA36-DEC25C443E24@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220401125205.GL4012@pengutronix.de>
 <5420D26D-34FD-4637-B602-F6271E38BB8D@gmail.com>
 <BA4C591F-D115-43D2-BF59-A75B29889E50@gmail.com>
 <20220406145847.GX4012@pengutronix.de>
 <1A6985CC-CBEB-44B2-AA61-3005D204C023@gmail.com>
 <20220407101642.GE4012@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Sascha Hauer =
<s.hauer@pengutronix.de> w dniu 07.04.2022, o godz. 12:16:
>=20
>=20
> Yes, and it raises a few more ;)

pls see at end of email: DRI state with playback

>=20
>>=20
>> player:
>>=20
>> 2022-04-06 17:52:26.424487 I Display: Geometry: 1920x1080+0+0 =
Size(Qt): 930mmx530mm
>> 2022-04-06 17:52:26.424922 I /dev/dri/card0 Qt EGLFS/KMS Fd:5 Crtc =
id:49 Connector id:51 Atomic: 1
>> 2022-04-06 17:52:26.425061 I /dev/dri/card0: Authenticated
>> 2022-04-06 17:52:26.534362 I /dev/dri/card0: Found 3 planes; 3 for =
this CRTC
>> 2022-04-06 17:52:26.534384 I /dev/dri/card0: Selected Plane #37 =
Overlay for video
>> 2022-04-06 17:52:26.534430 I /dev/dri/card0: Supported DRM video =
formats: NV12,NV16,NV24,YVYU,VYUY
>> 2022-04-06 17:52:26.534437 I /dev/dri/card0: Selected Plane #43 =
Overlay for GUI
>> 2022-04-06 17:52:26.534480 I /dev/dri/card0: DRM device retrieved =
from Qt
>> 2022-04-06 17:52:26.534489 I /dev/dri/card0: Multi-plane setup: =
Requested: 1 Setup: 1
>>=20
>> so:
>> plane #37 is where video is drawing
>> plane #43 is GUI/OSD
>>=20
>>=20
>> dri state:
>>=20
>> root@Myth-Frontend-06c7e973c2f1:~ # cat /sys/kernel/debug/dri/0/state
>> plane[31]: Smart0-win0
>>        crtc=3Dvideo_port0
>>        fb=3D58
>>                allocated by =3D mythfrontend
>>                refcount=3D2
>>                format=3DXR24 little-endian (0x34325258)
>>                modifier=3D0x0
>>                size=3D1920x1080
>>                layers:
>>                        size[0]=3D1920x1080
>>                        pitch[0]=3D7680
>>                        offset[0]=3D0
>>                        obj[0]:
>>                                name=3D0
>>                                refcount=3D4
>>                                start=3D00000000
>>                                size=3D8294400
>>                                imported=3Dno
>>        crtc-pos=3D1920x1080+0+0
>>        src-pos=3D1920.000000x1080.000000+0.000000+0.000000
>>        rotation=3D1
>>        normalized-zpos=3D0
>>        color-encoding=3DITU-R BT.601 YCbCr
>>        color-range=3DYCbCr limited range
>=20
> Ok, this seems to be the base plane.
>=20
>> plane[37]: Esmart0-win0
>>        crtc=3D(null)
>=20
> crtc=3Dnull? Did you capture the state without a video playing? =
Otherwise
> I would expect a crtc associated here.

Indeed. This was from player sitting in UI (no playback).
Pls see at bottom of email state with video playback
(it has crtc=3Dvideo_port0) =20

>=20
>>        fb=3D0
>>        crtc-pos=3D1920x1080+0+0
>>        src-pos=3D1920.000000x1080.000000+0.000000+0.000000
>>        rotation=3D1
>>        normalized-zpos=3D0
>>        color-encoding=3DITU-R BT.601 YCbCr
>>        color-range=3DYCbCr limited range
>> plane[43]: Cluster0-win0
>>        crtc=3D(null)
>=20
> This plane is selected for OSD by your application. The cluster =
windows
> can't show a regular linear framebuffer, they can only do AFBC. You'll
> see that in modetest:
>=20
> 	in_formats blob decoded:
>                 XR24:  ARM_BLOCK_SIZE=3D16x16,
> 			 ARM_BLOCK_SIZE=3D16x16,MODE=3DSPARSE
> 			 ARM_BLOCK_SIZE=3D16x16,MODE=3DYTR
> 			 ARM_BLOCK_SIZE=3D16x16,MODE=3DCBR
> 			 ARM_BLOCK_SIZE=3D16x16,MODE=3DYTR|SPARSE
> 			 ARM_BLOCK_SIZE=3D16x16,MODE=3DSPARSE|CBR
> 			 ARM_BLOCK_SIZE=3D16x16,MODE=3DYTR|CBR
> 			 ARM_BLOCK_SIZE=3D16x16,MODE=3DYTR|SPARSE|CBR
> 			 ARM_BLOCK_SIZE=3D16x16,MODE=3DYTR|SPLIT|SPARSE
> 		...
>=20
> The other windows show "XR24: LINEAR" here. Does your application use
> the GPU to render the OSD?

Yes.

> Otherwise I doubt your application can
> handle this format, so it should not use this layer.
>=20
>>        fb=3D0
>>        crtc-pos=3D0x0+0+0
>>        src-pos=3D0.000000x0.000000+0.000000+0.000000
>>        rotation=3D1
>>        normalized-zpos=3D0
>=20
> I would be interested in this output when the player is actually =
playing
> something.

Pls see at bottom.

> This normalized-zpos puzzles me a bit.

I'm not surprised :-).
You are puzzled probably because rk35xx current VOP2 code requires - =
from me - to force Z-position =3D 0 in Qt if I want to have GUI visible =
on screen.
Without this screen is black.=20
This seems to be i think - another issue to resolve (no any other SoC =
requires this....).
I'm not sure where issue is - but as i need to do this only on VOP2 - i =
think there is somewhere something not right in VOP2 code.       =20

> Normally it should be
> unique over all enabled planes for a CRTC. Maybe 0 is ok here because
> it's currently not associated to any CRTC.

It is because of me setting it to 0 (see explanations above) =20

>=20
>=20

DRI state with video playback:

root@Myth-Frontend-06c7e973c2f1:~ # cat /sys/kernel/debug/dri/0/state
plane[31]: Smart0-win0
        crtc=3Dvideo_port0
        fb=3D55
                allocated by =3D mythfrontend
                refcount=3D2
                format=3DXR24 little-endian (0x34325258)
                modifier=3D0x0
                size=3D1920x1080
                layers:
                        size[0]=3D1920x1080
                        pitch[0]=3D7680
                        offset[0]=3D0
                        obj[0]:
                                name=3D0
                                refcount=3D4
                                start=3D00000000
                                size=3D8294400
                                imported=3Dno
        crtc-pos=3D1920x1080+0+0
        src-pos=3D1920.000000x1080.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D1
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
plane[37]: Esmart0-win0
        crtc=3Dvideo_port0
        fb=3D65
                allocated by =3D mythfrontend
                refcount=3D2
                format=3DNV12 little-endian (0x3231564e)
                modifier=3D0x0
                size=3D1920x1080
                layers:
                        size[0]=3D1920x1080
                        pitch[0]=3D1920
                        offset[0]=3D0
                        obj[0]:
                                name=3D0
                                refcount=3D3
                                start=3D00000000
                                size=3D3657728
                                imported=3Dyes
                        size[1]=3D960x540
                        pitch[1]=3D1920
                        offset[1]=3D2088960
                        obj[1]:
                                name=3D0
                                refcount=3D3
                                start=3D00000000
                                size=3D3657728
                                imported=3Dyes
        crtc-pos=3D1920x1080+0+0
        src-pos=3D1920.000000x1080.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
plane[43]: Cluster0-win0
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
crtc[49]: video_port0
        enable=3D1
        active=3D1
        self_refresh_active=3D0
        planes_changed=3D1
        mode_changed=3D0
        active_changed=3D0
        connectors_changed=3D0
        color_mgmt_changed=3D0
        plane_mask=3D3
        connector_mask=3D1
        encoder_mask=3D1
        mode: "1920x1080": 50 148500 1920 2448 2492 2640 1080 1084 1089 =
1125 0x40 0x5
connector[51]: HDMI-A-1
        crtc=3Dvideo_port0
        self_refresh_aware=3D0=
