Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C41CC3D09DB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 09:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895026E423;
	Wed, 21 Jul 2021 07:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882EB6E423
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 07:39:57 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id u7so1345044ion.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 00:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OOvvFl7W/npbtRfiMMZP7Yo/sIDp7oHI35KNqHVdthA=;
 b=lfB0pgyux+hnxoWgpFscsYJj4Kz5XcUMP7q8c4RPDNFJwZMEvCnOeDHk8s8IQOGpXj
 ly4h1gSN688SBs5B4idNmabNB8ru5/vQDQujpY32PXcAhHhv9M66kbiKiCLC85mv1zyi
 3QXmyuzas1mVeK2rxbgCaZi0iOOkW0BTauVSbldna8RV1XcvUpmpkY7rv5uH0pe3k1PD
 Ygi1f8NG1FygkJOqIbe/Nzc2qU6bAn/zk1fsMt9q4pmbmEwoeVyOMuQIHChTyD4QGV8v
 0Gpi9KCuQib+xGY5orveNS57AQc+YekUphKD5ukY2cS/decJEtCiT7c/3WCV0B4Aj4kW
 SJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OOvvFl7W/npbtRfiMMZP7Yo/sIDp7oHI35KNqHVdthA=;
 b=q0Qn+SQcVr67lSaSUf9xF4UyJim/8eKrt3gjg1HEYjy8+anR4DN9CxGqdKXQWOk6Zx
 /k+iFgEMXLlWziZ8t0A7Iz7t0WUGx9DUD8irnjPXeB5r/rZI7ChaMeddaREnc4CIMxCk
 4byaKsac6GhNxuSfu18OfoXV1E+8C9ce/0xFJc9DKT/qb+bloTmHxxtwx/jYHwsNMt2+
 u6vl4p8vX+YlH1OWFWvb3D+YhLE52lxY2khbS/VMZDedl/HOUbDXrqQsMCFUtq1B3/a5
 7hhcN4OWo/eDuCZM89Pce1iH1RPgHghoOTAzUUIlxjdv53ZMq9msd5s9Zdy3G5vx6/Af
 J4NA==
X-Gm-Message-State: AOAM5332+LiukuXd+ukCn2Ph9aGw/fqoEQMys3nGVK4EZtfz9qwtF6Nk
 sZAP2oDZByjiOipwhRm+37mdsdBFU+fYzxiABAY=
X-Google-Smtp-Source: ABdhPJxaukYYXw2bkG1PIsn+tuTUpnKzRtB9SKFS+2QlvhhsPD59R5j290mOG3OeHSNqpOoxGw0WzxXwNAbKOTArq+U=
X-Received: by 2002:a6b:1642:: with SMTP id 63mr16444184iow.68.1626853196821; 
 Wed, 21 Jul 2021 00:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <1626430843-23823-2-git-send-email-dillon.minfei@gmail.com>
 <202107201305.FPUQWvWk-lkp@intel.com>
In-Reply-To: <202107201305.FPUQWvWk-lkp@intel.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Wed, 21 Jul 2021 15:39:20 +0800
Message-ID: <CAL9mu0LVdt1wtKzBa=201AJ-Eb4BdKtVx18hzQfaB0-Ga0jx9g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add ilitek ili9341 panel
 bindings
To: kernel test robot <lkp@intel.com>
Content-Type: multipart/alternative; boundary="000000000000e5f82105c79d4649"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, kbuild-all@lists.01.org,
 Dave Airlie <airlied@linux.ie>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, thierry.reding@gmail.com,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000e5f82105c79d4649
Content-Type: text/plain; charset="UTF-8"

Hi Kernel test robot,

Thanks for your time to test my patch.

I did the dtbs_check on my side, and got the same warnings.

But I guess these warnings do not come from this submission,
So, I will not be going to fix it at this time, but will at other
submissions
to fix these, add arm,armv7m-nvic.yaml ... to describe compatibles, etc.

by the way, i did find a warning from the stm32f429-disco.dts and fixt it
in "[PATCH v2 2/3] ARM: dts: stm32: fix dtbs_check warning on ili9341
dts binding",

the warning:
arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
['st,sf-tc240t-9370-t'] is too short

my make command:
make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml

Best regards
thanks

Dillon

On Tue, 20 Jul 2021 at 14:12, kernel test robot <lkp@intel.com> wrote:

> Hi,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on robh/for-next]
> [also build test WARNING on linus/master v5.14-rc2 next-20210719]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:
> https://github.com/0day-ci/linux/commits/dillon-minfei-gmail-com/Add-ilitek-ili9341-panel-driver/20210718-103113
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
> for-next
> compiler: arm-linux-gnueabi-gcc (GCC) 10.3.0
> reproduce: make ARCH=arm dtbs_check
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0:
> /interrupt-controller@e000e100: failed to match any schema with
> compatible: ['arm,armv7m-nvic']
>    arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /timer@e000e010: failed
> to match any schema with compatible: ['arm,armv7m-systick']
>    arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/i2c@40005c00
> /stmpe811@41: failed to match any schema with compatible: ['st,stmpe811']
>    arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/i2c@40005c00
> /stmpe811@41/stmpe_touchscreen: failed to match any schema with
> compatible: ['st,stmpe-ts']
>    arch/arm/boot/dts/stm32f429-disco.dt.yaml: l3gd20@0:
> 'spi-max-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'
>         From schema:
> Documentation/devicetree/bindings/iio/st,st-sensors.yaml
> >> arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
> ['st,sf-tc240t-9370-t'] is too short
>         From schema:
> Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
>    arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/crc@40023000:
> failed to match any schema with compatible: ['st,stm32f4-crc']
>    arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/rcc@40023800:
> failed to match any schema with compatible: ['st,stm32f42xx-rcc',
> 'st,stm32-rcc']
>    arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/rcc@40023800:
> failed to match any schema with compatible: ['st,stm32f42xx-rcc',
> 'st,stm32-rcc']
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>

--000000000000e5f82105c79d4649
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Kernel test robot,<div><br></div>=
<div>Thanks for your time to test my patch.</div><div><br></div><div>I did =
the dtbs_check on my side, and got the same warnings.</div><div><br></div><=
div>But I guess these warnings do not come from this submission,</div><div>=
So, I will not be going to fix it at this time, but will at other submissio=
ns</div><div>to fix these, add arm,armv7m-nvic.yaml ... to describe=C2=A0co=
mpatibles, etc.</div></div><div><br></div>by the way, i did find a warning =
from the stm32f429-disco.dts and fixt it<div>in &quot;[PATCH v2 2/3] ARM: d=
ts: stm32: fix dtbs_check warning on ili9341</div><div>dts binding&quot;,</=
div><div><br><div>the=C2=A0warning:<div>arch/arm/boot/dts/stm32f429-disco.d=
t.yaml: display@1: compatible:</div><div>[&#39;st,sf-tc240t-9370-t&#39;] is=
 too short</div><div><br></div><div>my make command:</div><div>make ARCH=3D=
arm dtbs_check=C2=A0

DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/display/panel/ilitek,il=
i9341.yaml</div><div><br></div><div>Best regards</div><div>thanks</div><div=
><br></div><div>Dillon</div><div><br></div><div><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 20 Jul 2021 at 14:12, kernel =
test robot &lt;<a href=3D"mailto:lkp@intel.com">lkp@intel.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Thank you for the patch! Perhaps something to improve:<br>
<br>
[auto build test WARNING on robh/for-next]<br>
[also build test WARNING on linus/master v5.14-rc2 next-20210719]<br>
[If your patch is applied to the wrong git tree, kindly drop us a note.<br>
And when submitting patch, we suggest to use &#39;--base&#39; as documented=
 in<br>
<a href=3D"https://git-scm.com/docs/git-format-patch" rel=3D"noreferrer" ta=
rget=3D"_blank">https://git-scm.com/docs/git-format-patch</a>]<br>
<br>
url:=C2=A0 =C2=A0 <a href=3D"https://github.com/0day-ci/linux/commits/dillo=
n-minfei-gmail-com/Add-ilitek-ili9341-panel-driver/20210718-103113" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/0day-ci/linux/commits/dill=
on-minfei-gmail-com/Add-ilitek-ili9341-panel-driver/20210718-103113</a><br>
base:=C2=A0 =C2=A0<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/gi=
t/robh/linux.git" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.o=
rg/pub/scm/linux/kernel/git/robh/linux.git</a> for-next<br>
compiler: arm-linux-gnueabi-gcc (GCC) 10.3.0<br>
reproduce: make ARCH=3Darm dtbs_check<br>
<br>
If you fix the issue, kindly add following tag as appropriate<br>
Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" target=
=3D"_blank">lkp@intel.com</a>&gt;<br>
<br>
<br>
dtcheck warnings: (new ones prefixed by &gt;&gt;)<br>
=C2=A0 =C2=A0arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /interrupt-cont=
roller@e000e100: failed to match any schema with compatible: [&#39;arm,armv=
7m-nvic&#39;]<br>
=C2=A0 =C2=A0arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /timer@e000e010=
: failed to match any schema with compatible: [&#39;arm,armv7m-systick&#39;=
]<br>
=C2=A0 =C2=A0arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/i2c@40005c=
00/stmpe811@41: failed to match any schema with compatible: [&#39;st,stmpe8=
11&#39;]<br>
=C2=A0 =C2=A0arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/i2c@40005c=
00/stmpe811@41/stmpe_touchscreen: failed to match any schema with compatibl=
e: [&#39;st,stmpe-ts&#39;]<br>
=C2=A0 =C2=A0arch/arm/boot/dts/stm32f429-disco.dt.yaml: l3gd20@0: &#39;spi-=
max-frequency&#39; does not match any of the regexes: &#39;pinctrl-[0-9]+&#=
39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 From schema: Documentation/devicetree/bindings/=
iio/st,st-sensors.yaml<br>
&gt;&gt; arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible: =
[&#39;st,sf-tc240t-9370-t&#39;] is too short<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 From schema: Documentation/devicetree/bindings/=
display/panel/ilitek,ili9341.yaml<br>
=C2=A0 =C2=A0arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/crc@400230=
00: failed to match any schema with compatible: [&#39;st,stm32f4-crc&#39;]<=
br>
=C2=A0 =C2=A0arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/rcc@400238=
00: failed to match any schema with compatible: [&#39;st,stm32f42xx-rcc&#39=
;, &#39;st,stm32-rcc&#39;]<br>
=C2=A0 =C2=A0arch/arm/boot/dts/stm32f429-disco.dt.yaml:0:0: /soc/rcc@400238=
00: failed to match any schema with compatible: [&#39;st,stm32f42xx-rcc&#39=
;, &#39;st,stm32-rcc&#39;]<br>
<br>
---<br>
0-DAY CI Kernel Test Service, Intel Corporation<br>
<a href=3D"https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org" re=
l=3D"noreferrer" target=3D"_blank">https://lists.01.org/hyperkitty/list/kbu=
ild-all@lists.01.org</a><br>
</blockquote></div></div></div></div></div>

--000000000000e5f82105c79d4649--
