Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1C08086C4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 12:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB9F10E1F9;
	Thu,  7 Dec 2023 11:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id 19E1010E1F9
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 11:31:46 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id 9F85524E317;
 Thu,  7 Dec 2023 19:31:44 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 7 Dec
 2023 19:31:44 +0800
Received: from [192.168.60.132] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 7 Dec
 2023 19:31:46 +0800
Message-ID: <580e13ab-a73e-4ce7-999a-8a8685faf2dd@starfivetech.com>
Date: Thu, 7 Dec 2023 19:31:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 4/6] drm/vs: Add KMS crtc&plane
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-5-keith.zhao@starfivetech.com>
 <7acd5af8fd4c5bf6ee0614f72cf6cb6751c89dc3.camel@icenowy.me>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <7acd5af8fd4c5bf6ee0614f72cf6cb6751c89dc3.camel@icenowy.me>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 William Qiu <william.qiu@starfivetech.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/12/7 16:41, Icenowy Zheng wrote:
> =E5=9C=A8 2023-12-04=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 20:33 +0800=EF=
=BC=8CKeith Zhao=E5=86=99=E9=81=93=EF=BC=9A
> *snip*
>=20
>> +static void update_cursor_plane(struct vs_dc *dc, struct vs_plane
>> *plane,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_plane *drm_plane,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_atomic_state *drm_st=
ate)
>> +{
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_plane_state *sta=
te =3D
>> drm_atomic_get_new_plane_state(drm_state,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> =C2=A0 drm_plane);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct vs_plane_state *plan=
e_state =3D
>> to_vs_plane_state(state);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_framebuffer *drm=
_fb =3D state->fb;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dc_hw_cursor cursor;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cursor.address =3D plane_st=
ate->dma_addr[0];
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cursor.x =3D state->crtc_x;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cursor.y =3D state->crtc_y;
>=20
> From my experiments on poking with registers on T-Head TH1520 (also
> uses DC8200 display controller and a similar driver), the DC8200
> hardware have a different definition of cursor position X and Y with
> the CRTC plane state.
>=20
> For CRTC plane state, hot_x and hot_y are only provided as reference,
> and the cursor should be displayed with its (0,0) drawn to (crtc_x,
> crtc_y) ([XY]_crtc are values specified in CRTC state, the right part
> of the assignments here), when the cursor is moved to (0,0) but the hot
> point is not (0,0), it could be negative.
>=20
> However, for DC8200 registers definition, cursor XY position could not
> be negative -- the cursor will disappear then; because in its
> definition, the cursor XY position should be where the cursor is
> pointing to, instead of its (0,0). DC8200 will draw (0,0) of the cursor
> to (x - hot_x, y - hot_y). So to met the expectation of the KMS plane
> settings, the DC8200 position should be set to (crtc_x + hot_x, crtc_y
> + hot_y) instead. Thus these two lines of code should be:
>=20
> ```
>         cursor.x =3D state->crtc_x + drm_fb->hot_x;
>         cursor.y =3D state->crtc_y + drm_fb->hot_y;
> ```
>=20
>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cursor.hot_x =3D drm_fb->ho=
t_x;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cursor.hot_y =3D drm_fb->ho=
t_y;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cursor.display_id =3D to_vs=
_display_id(dc, state->crtc);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0update_cursor_size(state, &=
cursor);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cursor.enable =3D true;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dc_hw_update_cursor(&dc->hw=
, cursor.display_id, &cursor);
>> +}
> *snip
hello Icenowy:
you are deep understanding on dc8200.
by the way of practice
I tested this change on the debian desktop, is there a way to compare the=
 cursor behavior change?
Thanks



