Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6234FBA83
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 13:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AF410E3DB;
	Mon, 11 Apr 2022 11:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E1710E277
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 11:08:10 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id h11so19644791ljb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 04:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=faBBlyWvdU7yWxcYTLif+sdsFzOCEToIOx9hvvHptcQ=;
 b=bKtcLKsVNv/AnDUlN7XBfbv28lbGbwcpV24AYOZZR49Y7t8W9yiE6J81v0axX9Hlt+
 zHk8G4MDDbtAMLQ5bh7Jhc2p5bzSmsjtHYVcpclXp5hGUvmBW5QjmJb3J0pxJ4QVzQ1p
 gMuVPRdKXpPwxW3GWBDhpdcd/hBuyIsa9RcVniFb8KPC6aGvUkpQ65ivSkdMDSCrlCfF
 uKaY/NFLQ+ZjxZskiKDIltI0irbwD0D+xs534Ba5tLrLR3lbUyDa+9UYkRqEsrbCq8em
 TGHkIAkQ/+oVhy1cpqkeyS8le9sj/+N45KEQTmgZbxsIbXg+SgoLGOBmeMGo4AHKCqAg
 Kzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=faBBlyWvdU7yWxcYTLif+sdsFzOCEToIOx9hvvHptcQ=;
 b=Kz8sewLwcMFHNfdWkWnXuo/9zZGtF+b0GNbBweBtLicKziJOcogPWypae1MYdmMbQ5
 hTbhI0HIkjdA76jh0OujOA4WNEnDvjcMx6XlDub4SOW/c/EJI0CKUryEsF3JaXcLwX3T
 sXz/ioHis7g8Dn+l2QnKYOcix36WJhXFYp74NclFfoY9lCyaUPI73r9kWx/fY4q8qIFF
 WkNsEeRJdpMSr+weK2yNx6tFjBb9j3wh3PzfpBg2Ek84tWOiCzlxYh2+Jbt54yTmgaFd
 UuyJG5ih7L2LHRZhwlFNb1WwA1Sy0Zef6yW3kQf8ieTbstWtN+mwlHHtUfOKpq/Jw1NT
 +13w==
X-Gm-Message-State: AOAM531sRXHWER3Ecqatja9O2pHlXae4ZmUHQ4mdjF2Xvf6gdG6YAj5r
 O2vYdTNi25LUqNdAFrfqpvY=
X-Google-Smtp-Source: ABdhPJyIDqXD/37WNNPE4CEUiXkndnW/9dwYG4nxizIei1KKVdssg7C6CA8N3ii5HMAAGRoc5f8ydg==
X-Received: by 2002:a2e:9c94:0:b0:24b:3df5:64c with SMTP id
 x20-20020a2e9c94000000b0024b3df5064cmr13872145lji.324.1649675288917; 
 Mon, 11 Apr 2022 04:08:08 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 j29-20020a056512029d00b0046ba6e0cc32sm259161lfp.300.2022.04.11.04.08.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Apr 2022 04:08:08 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20220411090800.GR4012@pengutronix.de>
Date: Mon, 11 Apr 2022 13:07:56 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <5929E7A7-776E-4BCB-92C8-A1CE05774FE3@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220401125205.GL4012@pengutronix.de>
 <5420D26D-34FD-4637-B602-F6271E38BB8D@gmail.com>
 <BA4C591F-D115-43D2-BF59-A75B29889E50@gmail.com>
 <20220408080748.GA2387@pengutronix.de> <20220408120021.GO4012@pengutronix.de>
 <B3E76A7A-9B62-4E6F-9472-00B6298689C5@gmail.com>
 <20220411090800.GR4012@pengutronix.de>
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
<s.hauer@pengutronix.de> w dniu 11.04.2022, o godz. 11:08:
>=20
> Ok, so #37 for video, #43 for GUI.
>=20
> Where is the OSD rendered? Is it rendered on the GUI layer?

Yes

>=20
>> .......
>>=20
>>=20
>> playback:
>> .....
>> 2022-04-08 17:48:55.457823 I DRMVideo: Using Plane #37 for video
>> .....
>>=20
>> DRI state with zpos=3D0, kms_id=3D0 and ongoing playback:
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
> Base plane.
>=20
>> plane[37]: Esmart0-win0
>>        crtc=3Dvideo_port0
>>        fb=3D65
>>                allocated by =3D mythfrontend
>>                refcount=3D2
>>                format=3DNV12 little-endian (0x3231564e)
>>                modifier=3D0x0
>>                size=3D1920x1080
>>                layers:
>>                        size[0]=3D1920x1080
>>                        pitch[0]=3D1920
>>                        offset[0]=3D0
>>                        obj[0]:
>>                                name=3D0
>>                                refcount=3D3
>>                                start=3D00000000
>>                                size=3D3657728
>>                                imported=3Dyes
>>                        size[1]=3D960x540
>>                        pitch[1]=3D1920
>>                        offset[1]=3D2088960
>>                        obj[1]:
>>                                name=3D0
>>                                refcount=3D3
>>                                start=3D00000000
>>                                size=3D3657728
>>                                imported=3Dyes
>>        crtc-pos=3D1920x1080+0+0
>>        src-pos=3D1920.000000x1080.000000+0.000000+0.000000
>>        rotation=3D1
>>        normalized-zpos=3D1
>>        color-encoding=3DITU-R BT.601 YCbCr
>>        color-range=3DYCbCr limited range
>=20
> Video plane, rendered full screen above the base plane without alpha.
>=20
>> plane[43]: Cluster0-win0
>>        crtc=3D(null)
>>        fb=3D0
>>        crtc-pos=3D0x0+0+0
>>        src-pos=3D0.000000x0.000000+0.000000+0.000000
>>        rotation=3D1
>>        normalized-zpos=3D0
>>        color-encoding=3DITU-R BT.601 YCbCr
>>        color-range=3DYCbCr limited range
>=20
> Here should be the GUI, but this plane is not active.

I suspect this is because above DRI state report was with user-forced Qt =
vars.
This was because to get UI non-black screen.
I done this by request to provide DRI state with video playback. (to get =
playback I need UI to navigate)
By this DRI state report might misleading as i'm manually forcing Qt =
KMS_Index/Zpos.=20

>=20
> With this state I would expect to see a full screen video without
> anything on it. Is that the case? If yes, then fine.

yes. this is a case.
so this is fine.

So I think non-visible OSD issue is side effect of other, root cause =
issue: issue causing user to force Qt vars to get UI on VOP2

Context: (my view):

We have stack of 3 components interacting:
1.player (draws video to DRM plane)
2.Qt (draws UI to GL to DRM plane)
3.DRM (mixing planes+displaying)=20

Stack coperation:
a. DRM reports available planes+attributes to player
b. player - accordingly to above report - sets Qt (KMS/Zpos, etc).
c. user starting player. player uses Qt for drawing UI=20
d. user asks for playback
e. player draws (by Qt) OSD  and directly video (accordingly to Qt setup =
in (b)

With VOP2 i have issue at (c): screen is black.
Above procedure works fully automated on all other platforms i =
have/supporting.=20

For me most probable hypothesis:

1\
- In steep (b) Qt is set (or configured to use DRM) in way that UI =
resulting with black screen
- this is because in (a) player receives (wrong?) DRM report - and by =
this Qt is wrongly set
This may explain we have issue at (c)

2\
- In steep (b) Qt is set & using DRM in way that UI should work ok
- but VOP2 draws black screen (by some reason)
This may explain we have issue at (c)


Alternative hypothesis:
DRM properly realises (a)
Player wrongly realises (b)
This hypothesis is way less probable (for me) because:
1. procedure (a)...(e) works well on all other SoC. No need from user to =
overwrite automatically detected/set of Qt vars.
2. vop2 is single requiring from user overwrite of autodetected Qt vars. =
to get non-black screen UI.

I'm a bit out of ideas how to progress with this.

As (a)...(e) concept works ok (and afaik also is used by other players =
exploiting DRM planes rendering) - i'm not sure should I play with (b) =
because of VOP2 black-screen?


  =20
BTW:
this is DRI state when there is no any Qt.vars overwrites.
(so all is autodetected/setup like in other  working SoCs; VOP2 gives =
here black screen UI):

2022-04-08 17:47:57.035668 I /dev/dri/card0 Qt EGLFS/KMS Fd:5 Crtc id:49 =
Connector id:51 Atomic: 1
2022-04-08 17:47:57.035806 I /dev/dri/card0: Authenticated
2022-04-08 17:47:57.145447 I /dev/dri/card0: Found 3 planes; 3 for this =
CRTC
2022-04-08 17:47:57.145469 I /dev/dri/card0: Selected Plane #37 Overlay =
for video
2022-04-08 17:47:57.145515 I /dev/dri/card0: Supported DRM video =
formats: NV12,NV16,NV24,YVYU,VYUY
2022-04-08 17:47:57.145523 I /dev/dri/card0: Selected Plane #43 Overlay =
for GUI
2022-04-08 17:47:57.145567 I /dev/dri/card0: DRM device retrieved from =
Qt
2022-04-08 17:47:57.145574 I /dev/dri/card0: Multi-plane setup: =
Requested: 1 Setup: 1

plane[31]: Smart0-win0
        crtc=3Dvideo_port0
        fb=3D53
                allocated by =3D [fbcon]
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
                                refcount=3D3
                                start=3D00000000
                                size=3D8294400
                                imported=3Dno
        crtc-pos=3D1920x1080+0+0
        src-pos=3D1920.000000x1080.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
plane[37]: Esmart0-win0
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
plane[43]: Cluster0-win0
        crtc=3Dvideo_port0
        fb=3D58
                allocated by =3D mythfrontend
                refcount=3D2
                format=3DAR24 little-endian (0x34325241)
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
crtc[49]: video_port0
        enable=3D1
        active=3D1
        self_refresh_active=3D0
        planes_changed=3D1
        mode_changed=3D0
        active_changed=3D0
        connectors_changed=3D0
        color_mgmt_changed=3D0
        plane_mask=3D5
        connector_mask=3D1
        encoder_mask=3D1
        mode: "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089 =
1125 0x48 0x5
connector[51]: HDMI-A-1
        crtc=3Dvideo_port0
        self_refresh_aware=3D0 =20



