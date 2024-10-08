Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19CC994106
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 10:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405DB10E16A;
	Tue,  8 Oct 2024 08:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jpv0nGoS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CDC10E16A;
 Tue,  8 Oct 2024 08:18:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 492EE5C5AE1;
 Tue,  8 Oct 2024 08:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC95C4CEC7;
 Tue,  8 Oct 2024 08:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728375532;
 bh=uItnrWW+h9WOCfW4wij5jD8dv3TkJwtdgaE9MbkHG6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jpv0nGoSFK0PdwSL8uQ+RajvrVTanhQezKnKbD8ZuyLyvpKWdWpe2ewSxvUlkQpj5
 LCf4lLw6GxpFr4KkjWO15oX9tkkRoI04dXHNIL1wvjA9WUlWb2bXEk5DY4DGMk3I0g
 ewERSvKa2Uh9LFEweuV+47nRDQa8ouM51DGPmIIBhefPzZhxH+miJfhEXuD2IdPylT
 NNiEqgBHUkSsyqxonISb2sn9dfzFLvXe85jW/vH9LcoHgtvQJ56jJBw5oe/JJMaA+y
 GyRLD82MEshSpXE69WlnIfs8+JuZBVPx7/yKdC2PNpjRxHbCmjHMrbNEmIBWLL1XJQ
 2U/R1oUbjgnLA==
Date: Tue, 8 Oct 2024 10:18:49 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 quic_abhinavk@quicinc.com, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 16/22] drm/msm/dpu: Configure CWB in writeback encoder
Message-ID: <20241008-bouncy-sawfish-of-temperance-2e9e5f@houat>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-16-7849f900e863@quicinc.com>
 <b9e50652-4556-4eed-a013-8e417eccdb69@linaro.org>
 <866ef212-a00e-48c4-9cf1-d1d4ee78d0ae@quicinc.com>
 <a58abb00-f941-48e0-b2a0-3c401e5220a7@linaro.org>
 <4e0ccd07-fdd1-4e92-bda7-ea6ec9d54c80@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="yyzazgzbhs7ae6h2"
Content-Disposition: inline
In-Reply-To: <4e0ccd07-fdd1-4e92-bda7-ea6ec9d54c80@linaro.org>
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


--yyzazgzbhs7ae6h2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2024 at 10:00:57AM GMT, Neil Armstrong wrote:
> Hi,
>=20
> On 01/10/2024 09:37, neil.armstrong@linaro.org wrote:
> > Hi,
> >=20
> > On 30/09/2024 21:19, Jessica Zhang wrote:
> > >=20
> > >=20
> > > On 9/30/2024 7:17 AM, neil.armstrong@linaro.org wrote:
> > > > On 25/09/2024 00:59, Jessica Zhang wrote:
>=20
> <snip>
>=20
> > > >=20
> > > > When running igt-test on QRD8650, I get:
> > > > # IGT_FRAME_DUMP_PATH=3D$PWD FRAME_PNG_FILE_NAME=3Dpwet /usr/libexe=
c/igt- gpu-tools/kms_writeback -d
> > >=20
> > > Hi Neil,
> > >=20
> > > Thanks for reporting this. Unfortunately, I'm not able to recreate th=
is on the MTP8650.
> > >=20
> > > How many/which non-WB outputs are you testing with?
> >=20
> > Here's the modetest output:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Encoders:
> > id=A0=A0=A0 crtc=A0=A0=A0 type=A0=A0=A0 possible crtcs=A0=A0=A0 possibl=
e clones
> > 32=A0=A0=A0 103=A0=A0=A0 DSI=A0=A0=A0 0x00000007=A0=A0=A0 0x00000005
> > 34=A0=A0=A0 0=A0=A0=A0 TMDS=A0=A0=A0 0x00000007=A0=A0=A0 0x00000006
> > 37=A0=A0=A0 0=A0=A0=A0 Virtual=A0=A0=A0 0x00000007=A0=A0=A0 0x00000007
> >=20
> > Connectors:
> > id=A0=A0=A0 encoder=A0=A0=A0 status=A0=A0=A0=A0=A0=A0=A0 name=A0=A0=A0=
=A0=A0=A0=A0 size (mm)=A0=A0=A0 modes=A0=A0=A0 encoders
> > 33=A0=A0=A0 32=A0=A0=A0 connected=A0=A0=A0 DSI-1=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 71x157=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0 32
> >  =A0 modes:
> >  =A0=A0=A0=A0index name refresh (Hz) hdisp hss hse htot vdisp vss vse v=
tot
> >  =A0 #0 1080x2400 144.00 1080 1100 1102 1122 2400 2420 2422 2440 394225=
 flags: ; type: preferred, driver
> >  =A0 props:
> >  =A0=A0=A0=A01 EDID:
> >  =A0=A0=A0=A0=A0=A0=A0 flags: immutable blob
> >  =A0=A0=A0=A0=A0=A0=A0 blobs:
> >=20
> >  =A0=A0=A0=A0=A0=A0=A0 value:
> >  =A0=A0=A0=A02 DPMS:
> >  =A0=A0=A0=A0=A0=A0=A0 flags: enum
> >  =A0=A0=A0=A0=A0=A0=A0 enums: On=3D0 Standby=3D1 Suspend=3D2 Off=3D3
> >  =A0=A0=A0=A0=A0=A0=A0 value: 0
> >  =A0=A0=A0=A05 link-status:
> >  =A0=A0=A0=A0=A0=A0=A0 flags: enum
> >  =A0=A0=A0=A0=A0=A0=A0 enums: Good=3D0 Bad=3D1
> >  =A0=A0=A0=A0=A0=A0=A0 value: 0
> >  =A0=A0=A0=A06 non-desktop:
> >  =A0=A0=A0=A0=A0=A0=A0 flags: immutable range
> >  =A0=A0=A0=A0=A0=A0=A0 values: 0 1
> >  =A0=A0=A0=A0=A0=A0=A0 value: 0
> >  =A0=A0=A0=A04 TILE:
> >  =A0=A0=A0=A0=A0=A0=A0 flags: immutable blob
> >  =A0=A0=A0=A0=A0=A0=A0 blobs:
> >=20
> >  =A0=A0=A0=A0=A0=A0=A0 value:
> > 35=A0=A0=A0 0=A0=A0=A0 disconnected=A0=A0=A0 DP-1=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0x0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0 34
> >  =A0 props:
> >  =A0=A0=A0=A01 EDID:
> >  =A0=A0=A0=A0=A0=A0=A0 flags: immutable blob
> >  =A0=A0=A0=A0=A0=A0=A0 blobs:
> >=20
> >  =A0=A0=A0=A0=A0=A0=A0 value:
> >  =A0=A0=A0=A02 DPMS:
> >  =A0=A0=A0=A0=A0=A0=A0 flags: enum
> >  =A0=A0=A0=A0=A0=A0=A0 enums: On=3D0 Standby=3D1 Suspend=3D2 Off=3D3
> >  =A0=A0=A0=A0=A0=A0=A0 value: 0
> >  =A0=A0=A0=A05 link-status:
> >  =A0=A0=A0=A0=A0=A0=A0 flags: enum
> >  =A0=A0=A0=A0=A0=A0=A0 enums: Good=3D0 Bad=3D1
> >  =A0=A0=A0=A0=A0=A0=A0 value: 0
> >  =A0=A0=A0=A06 non-desktop:
> >  =A0=A0=A0=A0=A0=A0=A0 flags: immutable range
> >  =A0=A0=A0=A0=A0=A0=A0 values: 0 1
> >  =A0=A0=A0=A0=A0=A0=A0 value: 0
> >  =A0=A0=A0=A04 TILE:
> >  =A0=A0=A0=A0=A0=A0=A0 flags: immutable blob
> >  =A0=A0=A0=A0=A0=A0=A0 blobs:
> >=20
> >  =A0=A0=A0=A0=A0=A0=A0 value:
> >  =A0=A0=A0=A036 subconnector:
> >  =A0=A0=A0=A0=A0=A0=A0 flags: immutable enum
> >  =A0=A0=A0=A0=A0=A0=A0 enums: Unknown=3D0 VGA=3D1 DVI-D=3D3 HDMI=3D11 D=
P=3D10 Wireless=3D18 Native=3D15
> >  =A0=A0=A0=A0=A0=A0=A0 value: 0
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > and dri state:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > # cat /sys/kernel/debug/dri/0/state
> > plane[43]: plane-0
> >  =A0=A0=A0=A0crtc=3Dcrtc-0
> >  =A0=A0=A0=A0fb=3D106
> >  =A0=A0=A0=A0=A0=A0=A0 allocated by =3D [fbcon]
> >  =A0=A0=A0=A0=A0=A0=A0 refcount=3D2
> >  =A0=A0=A0=A0=A0=A0=A0 format=3DXR24 little-endian (0x34325258)
> >  =A0=A0=A0=A0=A0=A0=A0 modifier=3D0x0
> >  =A0=A0=A0=A0=A0=A0=A0 size=3D1080x2400
> >  =A0=A0=A0=A0=A0=A0=A0 layers:
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 size[0]=3D1080x2400
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pitch[0]=3D4352
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 offset[0]=3D0
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 obj[0]:
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 name=3D0
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 refcount=3D1
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 start=3D0010102d
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 size=3D10444800
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 imported=3Dno
> >  =A0=A0=A0=A0crtc-pos=3D1080x2400+0+0
> >  =A0=A0=A0=A0src-pos=3D1080.000000x2400.000000+0.000000+0.000000
> >  =A0=A0=A0=A0rotation=3D1
> >  =A0=A0=A0=A0normalized-zpos=3D0
> >  =A0=A0=A0=A0color-encoding=3DITU-R BT.601 YCbCr
> >  =A0=A0=A0=A0color-range=3DYCbCr limited range
> >  =A0=A0=A0=A0color_mgmt_changed=3D0
> >  =A0=A0=A0=A0stage=3D1
> >  =A0=A0=A0=A0sspp[0]=3Dsspp_0
> >  =A0=A0=A0=A0multirect_mode[0]=3Dnone
> >  =A0=A0=A0=A0multirect_index[0]=3Dsolo
> >  =A0=A0=A0=A0src[0]=3D1080x2400+0+0
> >  =A0=A0=A0=A0dst[0]=3D1080x2400+0+0
> > plane[49]: plane-1
> >  =A0=A0=A0=A0crtc=3D(null)
> >  =A0=A0=A0=A0fb=3D0
> >  =A0=A0=A0=A0crtc-pos=3D0x0+0+0
> >  =A0=A0=A0=A0src-pos=3D0.000000x0.000000+0.000000+0.000000
> >  =A0=A0=A0=A0rotation=3D1
> >  =A0=A0=A0=A0normalized-zpos=3D0
> >  =A0=A0=A0=A0color-encoding=3DITU-R BT.601 YCbCr
> >  =A0=A0=A0=A0color-range=3DYCbCr limited range
> >  =A0=A0=A0=A0color_mgmt_changed=3D0
> >  =A0=A0=A0=A0stage=3D0
> >  =A0=A0=A0=A0sspp[0]=3Dsspp_1
> >  =A0=A0=A0=A0multirect_mode[0]=3Dnone
> >  =A0=A0=A0=A0multirect_index[0]=3Dsolo
> >  =A0=A0=A0=A0src[0]=3D0x0+0+0
> >  =A0=A0=A0=A0dst[0]=3D0x0+0+0
> > plane[55]: plane-2
> >  =A0=A0=A0=A0crtc=3D(null)
> >  =A0=A0=A0=A0fb=3D0
> >  =A0=A0=A0=A0crtc-pos=3D0x0+0+0
> >  =A0=A0=A0=A0src-pos=3D0.000000x0.000000+0.000000+0.000000
> >  =A0=A0=A0=A0rotation=3D1
> >  =A0=A0=A0=A0normalized-zpos=3D0
> >  =A0=A0=A0=A0color-encoding=3DITU-R BT.601 YCbCr
> >  =A0=A0=A0=A0color-range=3DYCbCr limited range
> >  =A0=A0=A0=A0color_mgmt_changed=3D0
> >  =A0=A0=A0=A0stage=3D0
> >  =A0=A0=A0=A0sspp[0]=3Dsspp_2
> >  =A0=A0=A0=A0multirect_mode[0]=3Dnone
> >  =A0=A0=A0=A0multirect_index[0]=3Dsolo
> >  =A0=A0=A0=A0src[0]=3D0x0+0+0
> >  =A0=A0=A0=A0dst[0]=3D0x0+0+0
> > plane[61]: plane-3
> >  =A0=A0=A0=A0crtc=3D(null)
> >  =A0=A0=A0=A0fb=3D0
> >  =A0=A0=A0=A0crtc-pos=3D0x0+0+0
> >  =A0=A0=A0=A0src-pos=3D0.000000x0.000000+0.000000+0.000000
> >  =A0=A0=A0=A0rotation=3D1
> >  =A0=A0=A0=A0normalized-zpos=3D0
> >  =A0=A0=A0=A0color-encoding=3DITU-R BT.601 YCbCr
> >  =A0=A0=A0=A0color-range=3DYCbCr limited range
> >  =A0=A0=A0=A0color_mgmt_changed=3D0
> >  =A0=A0=A0=A0stage=3D0
> >  =A0=A0=A0=A0sspp[0]=3Dsspp_3
> >  =A0=A0=A0=A0multirect_mode[0]=3Dnone
> >  =A0=A0=A0=A0multirect_index[0]=3Dsolo
> >  =A0=A0=A0=A0src[0]=3D0x0+0+0
> >  =A0=A0=A0=A0dst[0]=3D0x0+0+0
> > plane[67]: plane-4
> >  =A0=A0=A0=A0crtc=3D(null)
> >  =A0=A0=A0=A0fb=3D0
> >  =A0=A0=A0=A0crtc-pos=3D0x0+0+0
> >  =A0=A0=A0=A0src-pos=3D0.000000x0.000000+0.000000+0.000000
> >  =A0=A0=A0=A0rotation=3D1
> >  =A0=A0=A0=A0normalized-zpos=3D0
> >  =A0=A0=A0=A0color-encoding=3DITU-R BT.601 YCbCr
> >  =A0=A0=A0=A0color-range=3DYCbCr limited range
> >  =A0=A0=A0=A0color_mgmt_changed=3D0
> >  =A0=A0=A0=A0stage=3D0
> >  =A0=A0=A0=A0sspp[0]=3Dsspp_8
> >  =A0=A0=A0=A0multirect_mode[0]=3Dnone
> >  =A0=A0=A0=A0multirect_index[0]=3Dsolo
> >  =A0=A0=A0=A0src[0]=3D0x0+0+0
> >  =A0=A0=A0=A0dst[0]=3D0x0+0+0
> > plane[73]: plane-5
> >  =A0=A0=A0=A0crtc=3D(null)
> >  =A0=A0=A0=A0fb=3D0
> >  =A0=A0=A0=A0crtc-pos=3D0x0+0+0
> >  =A0=A0=A0=A0src-pos=3D0.000000x0.000000+0.000000+0.000000
> >  =A0=A0=A0=A0rotation=3D1
> >  =A0=A0=A0=A0normalized-zpos=3D0
> >  =A0=A0=A0=A0color-encoding=3DITU-R BT.601 YCbCr
> >  =A0=A0=A0=A0color-range=3DYCbCr limited range
> >  =A0=A0=A0=A0color_mgmt_changed=3D0
> >  =A0=A0=A0=A0stage=3D0
> >  =A0=A0=A0=A0sspp[0]=3Dsspp_9
> >  =A0=A0=A0=A0multirect_mode[0]=3Dnone
> >  =A0=A0=A0=A0multirect_index[0]=3Dsolo
> >  =A0=A0=A0=A0src[0]=3D0x0+0+0
> >  =A0=A0=A0=A0dst[0]=3D0x0+0+0
> > plane[79]: plane-6
> >  =A0=A0=A0=A0crtc=3D(null)
> >  =A0=A0=A0=A0fb=3D0
> >  =A0=A0=A0=A0crtc-pos=3D0x0+0+0
> >  =A0=A0=A0=A0src-pos=3D0.000000x0.000000+0.000000+0.000000
> >  =A0=A0=A0=A0rotation=3D1
> >  =A0=A0=A0=A0normalized-zpos=3D0
> >  =A0=A0=A0=A0color-encoding=3DITU-R BT.601 YCbCr
> >  =A0=A0=A0=A0color-range=3DYCbCr limited range
> >  =A0=A0=A0=A0color_mgmt_changed=3D0
> >  =A0=A0=A0=A0stage=3D0
> >  =A0=A0=A0=A0sspp[0]=3Dsspp_10
> >  =A0=A0=A0=A0multirect_mode[0]=3Dnone
> >  =A0=A0=A0=A0multirect_index[0]=3Dsolo
> >  =A0=A0=A0=A0src[0]=3D0x0+0+0
> >  =A0=A0=A0=A0dst[0]=3D0x0+0+0
> > plane[85]: plane-7
> >  =A0=A0=A0=A0crtc=3D(null)
> >  =A0=A0=A0=A0fb=3D0
> >  =A0=A0=A0=A0crtc-pos=3D0x0+0+0
> >  =A0=A0=A0=A0src-pos=3D0.000000x0.000000+0.000000+0.000000
> >  =A0=A0=A0=A0rotation=3D1
> >  =A0=A0=A0=A0normalized-zpos=3D0
> >  =A0=A0=A0=A0color-encoding=3DITU-R BT.601 YCbCr
> >  =A0=A0=A0=A0color-range=3DYCbCr limited range
> >  =A0=A0=A0=A0color_mgmt_changed=3D0
> >  =A0=A0=A0=A0stage=3D0
> >  =A0=A0=A0=A0sspp[0]=3Dsspp_11
> >  =A0=A0=A0=A0multirect_mode[0]=3Dnone
> >  =A0=A0=A0=A0multirect_index[0]=3Dsolo
> >  =A0=A0=A0=A0src[0]=3D0x0+0+0
> >  =A0=A0=A0=A0dst[0]=3D0x0+0+0
> > plane[91]: plane-8
> >  =A0=A0=A0=A0crtc=3D(null)
> >  =A0=A0=A0=A0fb=3D0
> >  =A0=A0=A0=A0crtc-pos=3D0x0+0+0
> >  =A0=A0=A0=A0src-pos=3D0.000000x0.000000+0.000000+0.000000
> >  =A0=A0=A0=A0rotation=3D1
> >  =A0=A0=A0=A0normalized-zpos=3D0
> >  =A0=A0=A0=A0color-encoding=3DITU-R BT.601 YCbCr
> >  =A0=A0=A0=A0color-range=3DYCbCr limited range
> >  =A0=A0=A0=A0color_mgmt_changed=3D0
> >  =A0=A0=A0=A0stage=3D0
> >  =A0=A0=A0=A0sspp[0]=3Dsspp_12
> >  =A0=A0=A0=A0multirect_mode[0]=3Dnone
> >  =A0=A0=A0=A0multirect_index[0]=3Dsolo
> >  =A0=A0=A0=A0src[0]=3D0x0+0+0
> >  =A0=A0=A0=A0dst[0]=3D0x0+0+0
> > plane[97]: plane-9
> >  =A0=A0=A0=A0crtc=3D(null)
> >  =A0=A0=A0=A0fb=3D0
> >  =A0=A0=A0=A0crtc-pos=3D0x0+0+0
> >  =A0=A0=A0=A0src-pos=3D0.000000x0.000000+0.000000+0.000000
> >  =A0=A0=A0=A0rotation=3D1
> >  =A0=A0=A0=A0normalized-zpos=3D0
> >  =A0=A0=A0=A0color-encoding=3DITU-R BT.601 YCbCr
> >  =A0=A0=A0=A0color-range=3DYCbCr limited range
> >  =A0=A0=A0=A0color_mgmt_changed=3D0
> >  =A0=A0=A0=A0stage=3D0
> >  =A0=A0=A0=A0sspp[0]=3Dsspp_13
> >  =A0=A0=A0=A0multirect_mode[0]=3Dnone
> >  =A0=A0=A0=A0multirect_index[0]=3Dsolo
> >  =A0=A0=A0=A0src[0]=3D0x0+0+0
> >  =A0=A0=A0=A0dst[0]=3D0x0+0+0
> > crtc[103]: crtc-0
> >  =A0=A0=A0=A0enable=3D1
> >  =A0=A0=A0=A0active=3D1
> >  =A0=A0=A0=A0self_refresh_active=3D0
> >  =A0=A0=A0=A0planes_changed=3D1
> >  =A0=A0=A0=A0mode_changed=3D0
> >  =A0=A0=A0=A0active_changed=3D0
> >  =A0=A0=A0=A0connectors_changed=3D0
> >  =A0=A0=A0=A0color_mgmt_changed=3D0
> >  =A0=A0=A0=A0plane_mask=3D1
> >  =A0=A0=A0=A0connector_mask=3D1
> >  =A0=A0=A0=A0encoder_mask=3D1
> >  =A0=A0=A0=A0mode: "1080x2400": 144 394225 1080 1100 1102 1122 2400 242=
0 2422 2440 0x48 0x0
> >  =A0=A0=A0=A0lm[0]=3D0
> >  =A0=A0=A0=A0ctl[0]=3D2
> > crtc[104]: crtc-1
> >  =A0=A0=A0=A0enable=3D0
> >  =A0=A0=A0=A0active=3D0
> >  =A0=A0=A0=A0self_refresh_active=3D0
> >  =A0=A0=A0=A0planes_changed=3D0
> >  =A0=A0=A0=A0mode_changed=3D0
> >  =A0=A0=A0=A0active_changed=3D0
> >  =A0=A0=A0=A0connectors_changed=3D0
> >  =A0=A0=A0=A0color_mgmt_changed=3D0
> >  =A0=A0=A0=A0plane_mask=3D0
> >  =A0=A0=A0=A0connector_mask=3D0
> >  =A0=A0=A0=A0encoder_mask=3D0
> >  =A0=A0=A0=A0mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
> > crtc[105]: crtc-2
> >  =A0=A0=A0=A0enable=3D0
> >  =A0=A0=A0=A0active=3D0
> >  =A0=A0=A0=A0self_refresh_active=3D0
> >  =A0=A0=A0=A0planes_changed=3D0
> >  =A0=A0=A0=A0mode_changed=3D0
> >  =A0=A0=A0=A0active_changed=3D0
> >  =A0=A0=A0=A0connectors_changed=3D0
> >  =A0=A0=A0=A0color_mgmt_changed=3D0
> >  =A0=A0=A0=A0plane_mask=3D0
> >  =A0=A0=A0=A0connector_mask=3D0
> >  =A0=A0=A0=A0encoder_mask=3D0
> >  =A0=A0=A0=A0mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
> > connector[33]: DSI-1
> >  =A0=A0=A0=A0crtc=3Dcrtc-0
> >  =A0=A0=A0=A0self_refresh_aware=3D0
> >  =A0=A0=A0=A0max_requested_bpc=3D0
> >  =A0=A0=A0=A0colorspace=3DDefault
> > connector[35]: DP-1
> >  =A0=A0=A0=A0crtc=3D(null)
> >  =A0=A0=A0=A0self_refresh_aware=3D0
> >  =A0=A0=A0=A0max_requested_bpc=3D0
> >  =A0=A0=A0=A0colorspace=3DDefault
> > connector[42]: Writeback-1
> >  =A0=A0=A0=A0crtc=3D(null)
> >  =A0=A0=A0=A0self_refresh_aware=3D0
> >  =A0=A0=A0=A0max_requested_bpc=3D0
> >  =A0=A0=A0=A0colorspace=3DDefault
> > resource mapping:
> >  =A0=A0=A0=A0pingpong=3D103 # # # # # # # # # -
> >  =A0=A0=A0=A0mixer=3D103 # # # # # -
> >  =A0=A0=A0=A0ctl=3D# # 103 # # #
> >  =A0=A0=A0=A0dspp=3D# # # #
> >  =A0=A0=A0=A0dsc=3D# # # # # #
> >  =A0=A0=A0=A0cdm=3D-
> >  =A0=A0=A0=A0cwb=3D# # # #
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > I pasted all the kms_writeback log, I have nothing more.
> >=20
> > If I specify `--run-subtest dump-valid-clones` I get:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > IGT_FRAME_DUMP_PATH=3D$PWD FRAME_PNG_FILE_NAME=3Dout.png /usr/libexec/i=
gt-gpu-tools/kms_writeback -d --run-subtest dump-valid-clones
> > [=A0=A0 33.250236] Console: switching to colour dummy device 80x25
> > IGT-Version: 1.29-1.28 (aarch64) (Linux: 6.12.0-rc1-00022-ge581f752bf79=
 aarch64)
> > Using IGT_SRANDOM=3D1709054789 for randomisation[=A0=A0 33.256171] [IGT=
] kms_writeback: executing
> >=20
> > Opened device: /dev/dri/card0
> > [=A0=A0 33.360023] [IGT] kms_writeback: starting subtest dump-valid-clo=
nes
> > Starting subtest: dump-valid-clones
> > [=A0=A0 34.063316] [drm:dpu_encoder_virt_atomic_disable:1314] [dpu erro=
r]enc32 timeout pending
> > [=A0=A0 34.244272] Unable to handle kernel NULL pointer dereference at =
virtual address 0000000000000010
> > [=A0=A0 34.253385] Mem abort info:
> > [=A0=A0 34.256328]=A0=A0 ESR =3D 0x0000000096000006
> > [=A0=A0 34.260272]=A0=A0 EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > [=A0=A0 34.265816]=A0=A0 SET =3D 0, FnV =3D 0
> > [=A0=A0 34.269043]=A0=A0 EA =3D 0, S1PTW =3D 0
> > [=A0=A0 34.272332]=A0=A0 FSC =3D 0x06: level 2 translation fault
> > [=A0=A0 34.277430] Data abort info:
> > [=A0=A0 34.280460]=A0=A0 ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0x0000=
0000
> > [=A0=A0 34.286170]=A0=A0 CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> > [=A0=A0 34.291438]=A0=A0 GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =
=3D 0
> > [=A0=A0 34.296975] user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000088=
24fc000
> > [=A0=A0 34.303673] [0000000000000010] pgd=3D08000008dc4e0003, p4d=3D080=
00008dc4e0003, pud=3D08000008dd4af003, pmd=3D0000000000000000
> > [=A0=A0 34.314647] Internal error: Oops: 0000000096000006 [#1] PREEMPT =
SMP
> > [=A0=A0 34.321144] Modules linked in: snd_soc_wsa884x q6prm_clocks q6ap=
m_dai
> > q6apm_lpass_dais snd_q6dsp_common q6prm 8021q garp mrp stp llc usb_f_fs
> > libcomposite qrtr_mhi snd_q6apm rpmsg_ctrl fastrpc apr qrtr_smd
> > rpmsg_char snd_soc_hdmi_codec ath12k mac80211 libarc4 mhi
> > panel_visionox_vtdr6130 qcom_pd_mapper goodix_berlin_spi ucsi_glink
> > pmic_glink_altmode pci_pwrctl_pwrseq pci_pwrctl_core typec_ucsi
> > aux_hpd_bridge qcom_battmgr nb7vpq904m wcd939x_usbss goodix_berlin_core
> > crct10dif_ce phy_qcom_eusb2_repeater msm sm3_ce sm3 qcom_q6v5_pas
> > sha3_ce hci_uart sha512_ce sha512_arm64 leds_qcom_lpg ocmem
> > qcom_pil_info qcom_q6v5 qcom_pbs btqca ipa btbcm drm_exec qcom_sysmon
> > pwrseq_qcom_wcn snd_soc_sc8280xp led_class_multicolor snd_soc_qcom_sdw
> > qrtr qcom_common gpu_sched snd_soc_wcd939x drm_dp_aux_bus
> > qcom_spmi_temp_alarm snd_soc_qcom_common qcom_glink_smem
> > snd_soc_wcd939x_sdw rtc_pm8xxx drm_display_helper
> > pinctrl_sm8650_lpass_lpi regmap_sdw cfg80211 bluetooth qcom_pon
> > pmic_glink ecdh_generic pdr_interface phy_qcom_qmp_combo ecc rfkill
> > [=A0=A0 34.321268]=A0 nvmem_qcom_spmi_sdam qcom_stats spi_geni_qcom pwr=
seq_core i2c_qcom_geni aux_bridge phy_qcom_snps_eusb2 dispcc_sm8550 drm_kms=
_helper gpi soundwire_qcom snd_soc_lpass_va_macro pinctrl_lpass_lpi snd_soc=
_wcd_mbhc snd_soc_lpass_tx_macro snd_soc_lpass_rx_macro snd_soc_lpass_wsa_m=
acro llcc_qcom snd_soc_lpass_macro_common slimbus snd_soc_wcd_classh mdt_lo=
ader qcom_pdr_msg qcrypto gpucc_sm8650 icc_bwmon qmi_helpers authenc phy_qc=
om_qmp_ufs libdes soundwire_bus ufs_qcom nvmem_reboot_mode phy_qcom_qmp_pci=
e typec qcom_rng rmtfs_mem socinfo fuse drm backlight ipv6
> > [=A0=A0 34.464862] CPU: 5 UID: 0 PID: 513 Comm: kms_writeback Tainted: =
G S=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 6.12.0-rc1-00022-ge581f=
752bf79 #2
> > [=A0=A0 34.475812] Tainted: [S]=3DCPU_OUT_OF_SPEC
> > [=A0=A0 34.479905] Hardware name: Qualcomm Technologies, Inc. SM8650 QR=
D (DT)
> > [=A0=A0 34.486667] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSB=
S BTYPE=3D--)
> > [=A0=A0 34.493880] pc : dpu_encoder_helper_phys_setup_cwb+0xb8/0x1ec [m=
sm]
> > [=A0=A0 34.500441] lr : dpu_encoder_helper_phys_setup_cwb+0x88/0x1ec [m=
sm]
> > [=A0=A0 34.506969] sp : ffff800085fc37e0
> > [=A0=A0 34.510437] x29: ffff800085fc3810 x28: ffffb8c93c953068 x27: fff=
f5af315c90880
> > [=A0=A0 34.517826] x26: ffff5af359c55780 x25: ffff800085fc3878 x24: fff=
f5af35a956e80
> > [=A0=A0 34.525217] x23: 0000000000000000 x22: ffff5af355dc2080 x21: fff=
f5af35a956e80
> > [=A0=A0 34.532607] x20: ffff5af315c90880 x19: ffff5af315c90c80 x18: 000=
0000000000001
> > [=A0=A0 34.539997] x17: 0000000000000018 x16: ffffb8c95c9c8c64 x15: 000=
0000000000038
> > [=A0=A0 34.547385] x14: 0000001971602a24 x13: 00000000000000e1 x12: 000=
000000000000b
> > [=A0=A0 34.554774] x11: 0000000000000000 x10: e7125de8a27ae014 x9 : 5ae=
f79bd13b1e2a7
> > [=A0=A0 34.562162] x8 : ffff5af355dc2718 x7 : 0000000000000004 x6 : fff=
f5af356374d98
> > [=A0=A0 34.569550] x5 : 0000000000000002 x4 : ffff800085fc37f8 x3 : fff=
f5af315c90950
> > [=A0=A0 34.576938] x2 : 0000000000000002 x1 : 0000000000000000 x0 : 000=
0000000000001
> > [=A0=A0 34.584328] Call trace:
> > [=A0=A0 34.586905]=A0 dpu_encoder_helper_phys_setup_cwb+0xb8/0x1ec [msm]
> > [=A0=A0 34.593075]=A0 dpu_encoder_helper_phys_cleanup+0x328/0x3c4 [msm]
> > [=A0=A0 34.599165]=A0 dpu_encoder_phys_wb_disable+0x80/0xac [msm]
> > [=A0=A0 34.604713]=A0 dpu_encoder_virt_atomic_disable+0xb4/0x160 [msm]
> > [=A0=A0 34.610711]=A0 disable_outputs+0x108/0x32c [drm_kms_helper]
> > [=A0=A0 34.616351]=A0 drm_atomic_helper_commit_modeset_disables+0x1c/0x=
4c [drm_kms_helper]
> > [=A0=A0 34.624110]=A0 msm_atomic_commit_tail+0x188/0x514 [msm]
> > [=A0=A0 34.629396]=A0 commit_tail+0xa4/0x18c [drm_kms_helper]
> > [=A0=A0 34.634570]=A0 drm_atomic_helper_commit+0x17c/0x194 [drm_kms_hel=
per]
> > [=A0=A0 34.640990]=A0 drm_atomic_commit+0xb8/0xf4 [drm]
> > [=A0=A0 34.645690]=A0 drm_mode_atomic_ioctl+0xad4/0xd88 [drm]
> > [=A0=A0 34.650889]=A0 drm_ioctl_kernel+0xc0/0x128 [drm]
> > [=A0=A0 34.655564]=A0 drm_ioctl+0x218/0x49c [drm]
> > [=A0=A0 34.659697]=A0 __arm64_sys_ioctl+0xac/0xf0
> > [=A0=A0 34.663804]=A0 invoke_syscall+0x48/0x10c
> > [=A0=A0 34.667755]=A0 el0_svc_common.constprop.0+0xc0/0xe0
> > [=A0=A0 34.672648]=A0 do_el0_svc+0x1c/0x28
> > [=A0=A0 34.676117]=A0 el0_svc+0x34/0xd8
> > [=A0=A0 34.679330]=A0 el0t_64_sync_handler+0x120/0x12c
> > [=A0=A0 34.683864]=A0 el0t_64_sync+0x190/0x194
> > [=A0=A0 34.687699] Code: 910063e1 f8607822 f8607861 b9401042 (b9401021)
> > [=A0=A0 34.694014] ---[ end trace 0000000000000000 ]---
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Anything I can try to get past the crash ?

The call to dpu_kms_get_existing_global_state in
dpu_encoder_helper_phys_setup_cwb looks suspicious to me, can you check
whether the returned global state is NULL?

Maxime

--yyzazgzbhs7ae6h2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZwTq6QAKCRAnX84Zoj2+
dlixAYDxDfW7La4zSTBTDOT6FWKqC5AujJFMJtQ+PdJf+OArWTo94IXV/ox04Rjl
XI6x+xMBf1ToVB7mEXGkeik31TeryLrQlCbmjN8jwM/ua1vrM6LcEAo5Pj7eaZKU
5dcsMa1lcg==
=tSgD
-----END PGP SIGNATURE-----

--yyzazgzbhs7ae6h2--
