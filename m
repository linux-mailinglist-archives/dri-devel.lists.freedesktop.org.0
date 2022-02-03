Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07F74A8308
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 12:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026EB10F144;
	Thu,  3 Feb 2022 11:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8AF10F144
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 11:20:59 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so2654363pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 03:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ucE+DrYg0uEmROtbKPi2y05nsvEWkkwdys5WSJHmXnE=;
 b=NuRxXSXxSevZ1wAJEMCf/SQ0CZY5RpM+g1eAAcSCDbrEsK8jQn9d2dYHOaRVOOc54n
 yrhsVRexXYQytWxjkWflHwXe4l050KIKktDRoTsxSbTtQtKckp75ghLx8h2IRMaOJRQ8
 1duXOQAp6ly3Me3o9wjdjg4HwGtOWiIxCR3ICKjn912lSHxajPOcifs0XcR4HWg3gctV
 g8lSwwx8ews9hi+gjiEwbw8RlEZ4rkZ9qF6RKMUgQge/vsTeWvFRy3i0GcnxlSXFPLm9
 keRJjc2yXSCZTiK3ypinmnHkXdt4QZNeYrYz9nKnnIs03CpMCB1joPbR8Im3O7+INx6k
 yJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ucE+DrYg0uEmROtbKPi2y05nsvEWkkwdys5WSJHmXnE=;
 b=VgaNv8X25T4/CLHKaEtYv04j5VSThIsNO1fw4HVNB1lE8h4wR6JKOgug9RAr/Dvdq4
 /z5PQjZRrGRPvRBhxVOXjKl/gLPoZCFyN9OEZfQ0BttPkyWoZKgGzmOsdu/90mODVEhc
 RpdVA0fj/mS7cbJYwwMKTFMGV1gJ2OzJ77o9qEuY/w7TcHPKyGwen0A4+HLkEwNSDZMz
 cGqCha90OtS+s1ko3Rqj2mbYG+vD0W1kCi3D5O13G9wS73vIaX2LUGMrmACN8cNYU9Mw
 3ZhyhPiKboopS2+WNyV20IxF0bv3IW/Ut6yy0o6VzJ5LM2Trq8WhrOHC11AeP35X/ngD
 FnxQ==
X-Gm-Message-State: AOAM531kSjj7HymhcglxNY0tITcA6rjigxa3k9pOHCJBCqo+LU8N02JM
 ETT1B8TgXt9gNfecS8zlKfH3rqltj3jewJ+NIeP7Gg==
X-Google-Smtp-Source: ABdhPJxuBoqZIyOgWJjSuX76t/fl+6OeNsXkQ0CPhiEuDu9BuJVhqVZZ6+i0akLR5nHK4kfHNluVUUeK8wwsKGyfwm0=
X-Received: by 2002:a17:90b:4a86:: with SMTP id
 lp6mr13400826pjb.152.1643887259390; 
 Thu, 03 Feb 2022 03:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20220202160602.440792-3-hsinyi@chromium.org>
 <202202031234.X27Z4zTL-lkp@intel.com>
In-Reply-To: <202202031234.X27Z4zTL-lkp@intel.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 3 Feb 2022 12:20:47 +0100
Message-ID: <CAG3jFysV5NzXD+-i9rnDh9r8WDMg68QUp_F1ZZS_+Pi2T6GoPw@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 3/4] drm/bridge: anx7625: Support reading edid
 through aux channel
To: kernel test robot <lkp@intel.com>
Content-Type: multipart/alternative; boundary="00000000000025af2a05d71b543e"
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000025af2a05d71b543e
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022, 05:42 kernel test robot <lkp@intel.com> wrote:

> Hi Hsin-Yi,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on drm/drm-next]
> [also build test ERROR on next-20220202]
> [cannot apply to robh/for-next drm-intel/for-linux-next v5.17-rc2]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:
> https://github.com/0day-ci/linux/commits/Hsin-Yi-Wang/drm-bridge-anx7625-send-DPCD-command-to-downstream/20220203-001041
> base:   git://anongit.freedesktop.org/drm/drm drm-next
> config: s390-randconfig-r044-20220130 (
> https://download.01.org/0day-ci/archive/20220203/202202031234.X27Z4zTL-lkp@intel.com/config
> )
> compiler: s390-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         #
> https://github.com/0day-ci/linux/commit/f706d1336c4d5a5984565b964370868113710354
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review
> Hsin-Yi-Wang/drm-bridge-anx7625-send-DPCD-command-to-downstream/20220203-001041
>         git checkout f706d1336c4d5a5984565b964370868113710354
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross
> O=build_dir ARCH=s390 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    s390-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function
> `anx7625_i2c_probe':
> >> anx7625.c:(.text+0x5d02): undefined reference to
> `devm_of_dp_aux_populate_ep_devices'
>

Hsin-Yi, can you have a look at this? Presumably some kconfig depedency is
not represented properly.


> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>

--00000000000025af2a05d71b543e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Feb 3, 2022, 05:42 kernel test robot &lt;<a hr=
ef=3D"mailto:lkp@intel.com">lkp@intel.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hi Hsin-Yi,<br>
<br>
Thank you for the patch! Yet something to improve:<br>
<br>
[auto build test ERROR on drm/drm-next]<br>
[also build test ERROR on next-20220202]<br>
[cannot apply to robh/for-next drm-intel/for-linux-next v5.17-rc2]<br>
[If your patch is applied to the wrong git tree, kindly drop us a note.<br>
And when submitting patch, we suggest to use &#39;--base&#39; as documented=
 in<br>
<a href=3D"https://git-scm.com/docs/git-format-patch" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://git-scm.com/docs/git-format-patch</a>]<b=
r>
<br>
url:=C2=A0 =C2=A0 <a href=3D"https://github.com/0day-ci/linux/commits/Hsin-=
Yi-Wang/drm-bridge-anx7625-send-DPCD-command-to-downstream/20220203-001041"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/0day-ci=
/linux/commits/Hsin-Yi-Wang/drm-bridge-anx7625-send-DPCD-command-to-downstr=
eam/20220203-001041</a><br>
base:=C2=A0 =C2=A0git://<a href=3D"http://anongit.freedesktop.org/drm/drm" =
rel=3D"noreferrer noreferrer" target=3D"_blank">anongit.freedesktop.org/drm=
/drm</a> drm-next<br>
config: s390-randconfig-r044-20220130 (<a href=3D"https://download.01.org/0=
day-ci/archive/20220203/202202031234.X27Z4zTL-lkp@intel.com/config" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://download.01.org/0day-ci/ar=
chive/20220203/202202031234.X27Z4zTL-lkp@intel.com/config</a>)<br>
compiler: s390-linux-gcc (GCC) 11.2.0<br>
reproduce (this is a W=3D1 build):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wget <a href=3D"https://raw.githubusercontent.c=
om/intel/lkp-tests/master/sbin/make.cross" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross</a> -O ~/bin/make.cross<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod +x ~/bin/make.cross<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # <a href=3D"https://github.com/0day-ci/linux/c=
ommit/f706d1336c4d5a5984565b964370868113710354" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://github.com/0day-ci/linux/commit/f706d1336c4d5a=
5984565b964370868113710354</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git remote add linux-review <a href=3D"https://=
github.com/0day-ci/linux" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/0day-ci/linux</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git fetch --no-tags linux-review Hsin-Yi-Wang/d=
rm-bridge-anx7625-send-DPCD-command-to-downstream/20220203-001041<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git checkout f706d1336c4d5a5984565b964370868113=
710354<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # save the config file to linux build tree<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir build_dir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dg=
cc-11.2.0 make.cross O=3Dbuild_dir ARCH=3Ds390 SHELL=3D/bin/bash<br>
<br>
If you fix the issue, kindly add following tag as appropriate<br>
Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" target=
=3D"_blank" rel=3D"noreferrer">lkp@intel.com</a>&gt;<br>
<br>
All errors (new ones prefixed by &gt;&gt;):<br>
<br>
=C2=A0 =C2=A0s390-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in f=
unction `anx7625_i2c_probe&#39;:<br>
&gt;&gt; anx7625.c:(.text+0x5d02): undefined reference to `devm_of_dp_aux_p=
opulate_ep_devices&#39;<br></blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Hsin-Yi, can you have a look at this? Presumably som=
e kconfig depedency is not represented properly.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
---<br>
0-DAY CI Kernel Test Service, Intel Corporation<br>
<a href=3D"https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://lists.01.org/hyperkit=
ty/list/kbuild-all@lists.01.org</a><br>
</blockquote></div></div></div>

--00000000000025af2a05d71b543e--
