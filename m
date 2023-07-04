Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B349A74695D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 08:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C7210E078;
	Tue,  4 Jul 2023 06:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id DFBC810E078
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 06:09:43 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 11EE08131;
 Tue,  4 Jul 2023 14:09:31 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 14:09:31 +0800
Received: from [192.168.60.135] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 14:09:29 +0800
Message-ID: <9da07912-0a18-26f7-eaa6-cce076387cc8@starfivetech.com>
Date: Tue, 4 Jul 2023 14:09:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/9] drm/verisilicon: Add basic drm driver
To: Shengyu Qu <wiagn233@outlook.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-4-keith.zhao@starfivetech.com>
 <TY3P286MB2611AF9B43017A0AE3C938249829A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <TY3P286MB2611AF9B43017A0AE3C938249829A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
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



On 2023/7/4 2:42, Shengyu Qu wrote:
> Hello Keith,
>=20
> While compiling this driver as a module, a error happens:
>=20
> drivers/gpu/drm/verisilicon/vs_drm: struct of_device_id is 200 bytes.=C2=
=A0 The last of 1 is:
> 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0=
x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00=
 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x=
00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x76 0x65 0x72 0x69 0x73 0x69 0x6c 0x69 0x6=
3 0x6f 0x6e 0x2c 0x64 0x69 0x73 0x70 0x6c 0x61 0x79 0x2d 0x73 0x75 0x62 0=
x73 0x79 0x73 0x74 0x65 0x6d 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00=
 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x=
00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 =
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x0=
0 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0=
x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00=
 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x=
00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
> 0x00 0x00
> FATAL: modpost: drivers/gpu/drm/verisilicon/vs_drm: struct of_device_id=
 is not terminated with a NULL entry!
>=20
>> +
>> +static const struct of_device_id vs_drm_dt_ids[] =3D {
>> +=C2=A0=C2=A0=C2=A0 { .compatible =3D "verisilicon,display-subsystem",=
 },
>> +};
>> +
>=20
> So, this should be:
>=20
> static const struct of_device_id vs_drm_dt_ids[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "verisilicon,display-subsyste=
m", },
> =C2=A0=C2=A0=C2=A0=C2=A0{ },
> };
>=20
> After fixing this problem, another error happens:
>=20
> ERROR: modpost: module vs_drm uses symbol dma_buf_mmap from namespace D=
MA_BUF, but does not import it.
>=20
> Please fix.
>=20
> Best regards,
> Shengyu

hello Shengyu ,=20

I can reproduce the error generated by compiling ko , and add MODULE_IMPO=
RT_NS(DMA_BUF) at the beginning of vs_gem.c ,
it can fix the error message,=20
I will add this in my next patch , thanks
