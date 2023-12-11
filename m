Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F25480C65A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 11:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCA510E391;
	Mon, 11 Dec 2023 10:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1532A10E391
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 10:24:44 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id AD49D24E2D5;
 Mon, 11 Dec 2023 18:24:36 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Dec
 2023 18:24:36 +0800
Received: from [192.168.1.115] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Dec
 2023 18:24:36 +0800
Message-ID: <2dc5ea49-9a5f-484a-98dc-1b35b79d0945@starfivetech.com>
Date: Mon, 11 Dec 2023 18:24:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 5/6] drm/vs: Add hdmi driver
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Andy Yan <andyshrk@163.com>
References: <20231204123315.28456-6-keith.zhao@starfivetech.com>
 <esetsiqgqpk35zue4c6aq7l6zn4kezhxkqqa7ompaz2vhdy3lr@4d5awfqgs2ss>
 <94a1f9fc-82fb-4a04-a44b-f9b20c2bdfdd@starfivetech.com>
 <abdl6kmighvpwojvafq443q7grn6w3abwpvw7zwbna4jvtsvjf@fa42rv46n2wh>
 <40cdd3c7-174e-4611-9ea6-22cb56d1f62b@starfivetech.com>
 <e90142d.44b1.18c43833b63.Coremail.andyshrk@163.com>
 <e0b84511-dbb4-46fa-9465-713369232f6f@starfivetech.com>
 <43e42269.314.18c46dbb4c5.Coremail.andyshrk@163.com>
 <e1c362dc-8aac-4d13-9356-8b7ccae4727f@starfivetech.com>
 <5a79a4b9.1bd7.18c4773c1ea.Coremail.andyshrk@163.com>
 <xevxqusbizjfs4qt5rufhntd3vd656o2smocvivvulzceh3aeu@uuihphhat5wi>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <xevxqusbizjfs4qt5rufhntd3vd656o2smocvivvulzceh3aeu@uuihphhat5wi>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 William Qiu <william.qiu@starfivetech.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi Maxime:
hi Andy:

On 2023/12/8 17:14, Maxime Ripard wrote:
> Hi,
>=20
> On Fri, Dec 08, 2023 at 11:23:37AM +0800, Andy Yan wrote:
>> =E5=9C=A8 2023-12-08 11:00:31=EF=BC=8C"Keith Zhao" <keith.zhao@starfiv=
etech.com> =E5=86=99=E9=81=93=EF=BC=9A
>> >
>> >
>> >On 2023/12/8 8:37, Andy Yan wrote:
>> >> Hi Keth=EF=BC=9A
>> >>=20
>> >>=20
>> >>=20
>> >>=20
>> >>=20
>> >>=20
>> >> =E5=9C=A8 2023-12-07 18:48:13=EF=BC=8C"Keith Zhao" <keith.zhao@star=
fivetech.com> =E5=86=99=E9=81=93=EF=BC=9A
>> >>>
>> >>>
>> >>>On 2023/12/7 17:02, Andy Yan wrote:
>> >>>>=20
>> >>>>=20
>> >>>>=20
>> >>>>=20
>> >>>> Hi Keith=EF=BC=9A
>> >>>>=20
>> >>>>=20
>> >>>>=20
>> >>>>=20
>> >>>>=20
>> >>>>=20
>> >>>>=20
>> >>>>=20
>> >>>>=20
>> >>>>=20
>> >>>>=20
>> >>>> At 2023-12-06 22:11:33, "Keith Zhao" <keith.zhao@starfivetech.com=
> wrote:
>> >>>>>
>> >>>>>
>> >>>>>On 2023/12/6 20:56, Maxime Ripard wrote:
>> >>>>>> On Wed, Dec 06, 2023 at 08:02:55PM +0800, Keith Zhao wrote:
>> >>>>>>> >> +static const struct of_device_id starfive_hdmi_dt_ids[] =3D=
 {
>> >>>>>>> >> +	{ .compatible =3D "starfive,jh7110-inno-hdmi",},
>> >>>>>>> >=20
>> >>>>>>> > So it's inno hdmi, just like Rockchip then?
>> >>>>>>> >=20
>> >>>>>>> > This should be a common driver.
>> >>>>>>>
>> >>>>>>> Rockchip has a inno hdmi IP. and Starfive has a inno hdmi IP.
>> >>>>>>> but the harewawre difference of them is big , it is not easy t=
o use the common driver
>> >>>>>>> maybe i need the inno hdmi version here to make a distinction
>> >>>>>>=20
>> >>>>>> I just had a look at the rockchip header file: all the register=
s but the
>> >>>>>> STARFIVE_* ones are identical.
>> >>>>>>=20
>> >>>>>> There's no need to have two identical drivers then, please use =
the
>> >>>>>> rockchip driver instead.
>> >>>>>>=20
>> >>>>>> Maxime
>> >>>>>
>> >>>>>ok, have a simple test , edid can get . i will continue=20
>> >>>>=20
>> >>>> Maybe you can take drivers/gpu/drm/bridge/synopsys/dw-hdmi as a r=
eference=EF=BC=8C this
>> >>>> is also a hdmi ip used by rockchip/meson/sunxi/jz/imx=E3=80=82
>> >>>> We finally make it share one driver=E3=80=82
>> >>>>>
>> >>>hi Andy:
>> >>>
>> >>>dw_hdmi seems a good choice , it can handle inno hdmi hardware by d=
efine its dw_hdmi_plat_data.
>> >>>does it means i can write own driver files such as(dw_hdmi-starfive=
.c) based on dw_hdmi instead of add plat_data in inno_hdmi.c
>> >>>
>> >>=20
>> >> I think the process maybe like this=EF=BC=9A
>> >>=20
>> >> 1. split the inno_hdmi.c under rockchip to  inno_hdmi.c(the common =
part), inno_hdmi-rockchip.c(the soc specific part)
>> >> 2. move the common part inno_hdmi.c to drivers/gpu/drm/bridge/innos=
ilicon/
>> >> 3. add startfive specific part, inno_hdmi-startfive.c
>> >>=20
>> >> bellow git log from kernel three show how we convert  dw_hdmi to a =
common driver:=20
>> >>=20
>> >>=20
>> >>=20
>> >> 12b9f204e804 drm: bridge/dw_hdmi: add rockchip rk3288 support
>> >> 74af9e4d03b8 dt-bindings: Add documentation for rockchip dw hdmi
>> >> d346c14eeea9 drm: bridge/dw_hdmi: add function dw_hdmi_phy_enable_s=
pare
>> >> a4d3b8b050d5 drm: bridge/dw_hdmi: clear i2cmphy_stat0 reg in hdmi_p=
hy_wait_i2c_done
>> >> 632d035bace2 drm: bridge/dw_hdmi: add mode_valid support
>> >> 0cd9d1428322 drm: bridge/dw_hdmi: add support for multi-byte regist=
er width access
>> >> cd152393967e dt-bindings: add document for dw_hdmi
>> >> b21f4b658df8 drm: imx: imx-hdmi: move imx-hdmi to bridge/dw_hdmi
>> >> aaa757a092c2 drm: imx: imx-hdmi: split phy configuration to platfor=
m driver
>> >> 3d1b35a3d9f3 drm: imx: imx-hdmi: convert imx-hdmi to drm_bridge mod=
e
>> >> c2c3848851a7 drm: imx: imx-hdmi: return defer if can't get ddc i2c =
adapter
>> >> b587833933de drm: imx: imx-hdmi: make checkpatch happy
>> >>=20
>> >hi Andy:
>> >I got you means,=20
>> >as I don't have a rockchip board on hand , to split the inno_hdmi.c c=
an not be tested.
>> >
>> >how adout this idea:
>> >1=E3=80=81split the starfive_hdmi.c under verisilicion to  inno_hdmi.=
c(the common part), inno_hdmi-starfive.c(the soc specific part)
>> >2. move the common part inno_hdmi.c to drivers/gpu/drm/bridge/innosil=
icon/
>> >3. In the future, inno hdmi.c under rockchip will reuse the public dr=
iver.
>>=20
>> I am not sure if drm maintainers are happy with this=E3=80=82
>=20
> Not really, no.
>=20
> Because we would still have two drivers for the same controller, and a
> common one that haven't really been tested on anything but a single
> platform. So arguably a worse situation than what you were suggesting i=
n
> the first place.
>=20
> The best solution would be to find someone with a Rockchip board to tes=
t
> your changes, or to get one if it's doable so you can test yourself.

ok I will also try to buy a Rockchip 3036 board for self-test.
According to the commit log idea provided by Andy before, make the inno_h=
dmi driver common module.

would the steps be ok? (if I tested rockchip and starifve pass)
1. split the inno_hdmi.c under rockchip to  inno_hdmi.c(the common part),=
 inno_hdmi-rockchip.c(the soc specific part)
2. move the common part inno_hdmi.c to drivers/gpu/drm/bridge/innosilicon=
/
3. add startfive specific part, inno_hdmi-startfive.c

Thanks
>=20
> Maxime
