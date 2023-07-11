Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F32374E3A6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 03:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9A510E199;
	Tue, 11 Jul 2023 01:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9127210E199
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 01:44:26 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5D45A24DE03;
 Tue, 11 Jul 2023 09:44:16 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Jul
 2023 09:44:16 +0800
Received: from [192.168.60.133] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Jul
 2023 09:44:15 +0800
Message-ID: <560ca37f-74c3-8f36-c118-eb17f92e20b3@starfivetech.com>
Date: Tue, 11 Jul 2023 09:44:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/9] drm/verisilicon: Add drm plane funcs
Content-Language: en-US
To: Shengyu Qu <wiagn233@outlook.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-8-keith.zhao@starfivetech.com>
 <TY3P286MB261191B29FB384110094181C9830A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <TY3P286MB261191B29FB384110094181C9830A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Rob
 Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/11 0:46, Shengyu Qu wrote:
> Hello Keith,
>> +
>> +static void vs_plane_atomic_update(struct drm_plane *plane,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_atomic_state *state)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct drm_plane_state *new_state =3D drm_atomic_g=
et_new_plane_state(state,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 plane);
>> +=C2=A0=C2=A0=C2=A0 unsigned char i, num_planes;
>> +=C2=A0=C2=A0=C2=A0 struct drm_framebuffer *fb;
>> +=C2=A0=C2=A0=C2=A0 struct vs_plane *vs_plane =3D to_vs_plane(plane);
>> +=C2=A0=C2=A0=C2=A0 //struct drm_plane_state *state =3D plane->state;
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc *vs_crtc =3D to_vs_crtc(new_state->=
crtc);
>> +=C2=A0=C2=A0=C2=A0 struct vs_plane_state *plane_state =3D to_vs_plane=
_state(new_state);
>> +=C2=A0=C2=A0=C2=A0 //struct drm_format_name_buf *name =3D &plane_stat=
e->status.format_name;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!new_state->fb || !new_state->crtc)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +
>> +=C2=A0=C2=A0=C2=A0 fb =3D new_state->fb;
>> +
>> +=C2=A0=C2=A0=C2=A0 num_planes =3D vs_get_plane_number(fb);
>> +
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < num_planes; i++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vs_gem_object *vs_o=
bj;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_obj =3D vs_fb_get_gem_o=
bj(fb, i);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_plane->dma_addr[i] =3D =
vs_obj->iova + fb->offsets[i];
>=20
> There is a dcache flush operation here in downstream driver. Is that a =
cache coherence problem?
>=20
> Best regards,
>=20
> Shengyu
>=20
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 plane_state->status.src =3D drm_plane_state_src(ne=
w_state);
>> +=C2=A0=C2=A0=C2=A0 plane_state->status.dest =3D drm_plane_state_dest(=
new_state);
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_plane->funcs->update(vs_crtc->dev, vs_plane, pl=
ane, state);
>> +}
>>yes , You can find that the current situation is very professional.=20
This problem exists at present, but the dma interface is not perfect at n=
ow,=20
and the dma_sync_single_for_device interface needs to be implemented late=
r.=20
I will consider repairing this problem in the form of patch
