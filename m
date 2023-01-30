Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5298A68163F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 17:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2389610E0F4;
	Mon, 30 Jan 2023 16:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B20C10E0ED
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 16:24:30 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id i185so13054613vsc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 08:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TNjcl9ue4Yo+C3qXNF3I2IXLdPdV2VfDLb5UgrGwaNI=;
 b=WtpdVSeOyj3NqmS8x1J7iyhRv/V7ha9AnHL68DNjFluRRqNbJK88sYdxcMnhkY8t6X
 IFa4EfhuyatIkNKRKGkm9n+gDO0OX36QOSZ+tNcPWDzSffM3emrKCn8Da45DzuF8dJUT
 ZmZlwopPfGtyO1AJaR6YCWLepNYkHtk3IFMrqL8qZfnPi86PsUI6yQ0X3Z9Lf7Fdgw4B
 J6p5P3SBEf8maYUzvmVH64dIuvoot3NyC4rVF+MRJ+jiqD9lVJN7osAxX7oQ5ZEChSJX
 Fisw6C68uToeMVoQj26/eL1mp7XloiMme5kZB+/UcvnYm07/ovfa4VCRT31K7f3vvLZJ
 BrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TNjcl9ue4Yo+C3qXNF3I2IXLdPdV2VfDLb5UgrGwaNI=;
 b=nuIJX5ysnB6mrqLuGioC5MKDMBpLOrW5tcRwhCzhaslRYAbdeuFF1AeA1E4icYElUs
 rQ4cEFRbSWEj+RBB7zB0heVcG7cDFJE0wLUf8Nh/7TR4c08rzzTwwnqRUP50q5CSVASP
 i9+xfSwIhCvu/GAn+cQu54Wnkb5PzdYYOA1z+SPUA9PlLoPIqyE2PziFb1R2+UfFs13u
 xA81aSO6jDyvPXJC5lpst9lfHavxj3XfXNfFZlrsrC7qsTgBxXSFghe9VvaL5PzyZWN7
 Efson/zOAHP+mJfVWI9+2vLGXQ8dIWkbY6yUE0iwG8bipTDBY5ptRZPcojjhKsLRFhkI
 7VMA==
X-Gm-Message-State: AFqh2kohoifmfcWJfM7zn3GMr2tuhLCLqICDzNeY7sCLYAKAt6fHCcGn
 eU0Qwir4/2KvjvkbtVI7FpizhASsbw1vb6DRCw9Bjw==
X-Google-Smtp-Source: AMrXdXvS2Xawh4TMY7nGcG42X6+jgpIxV+dRdppy1YUwAh+MSFiMtT/oSRraGGu4VgjT0QR7HOIsuVThWjRInNDG+YU=
X-Received: by 2002:a05:6102:5587:b0:3d1:2167:11ad with SMTP id
 dc7-20020a056102558700b003d1216711admr6493306vsb.2.1675095869214; Mon, 30 Jan
 2023 08:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20230125-tfp410_i2c-v1-4-66a4d4e390b7@criticallink.com>
 <202301290803.ouS19eab-lkp@intel.com>
In-Reply-To: <202301290803.ouS19eab-lkp@intel.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 30 Jan 2023 11:24:18 -0500
Message-ID: <CADL8D3bxCOwXU7NJ+jvN530LQByJCMRCGrH+HrGzCxR3+imZ2Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] DRM: BRIDGE: TFP410: If connected, use I2C for polled
 HPD status.
To: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Bob Duke <bduke@criticallink.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 oe-kbuild-all@lists.linux.dev,
 Michael Williamson <michael.williamson@criticallink.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 28, 2023 at 7:47 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Jonathan,
>
> Thank you for the patch! Perhaps something to improve:
Good bot.
>
> [auto build test WARNING on 93f875a8526a291005e7f38478079526c843cbec]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cormier/dt-bindings-display-bridge-tfp410-Add-tfp410-i2c-example/20230128-183627
> base:   93f875a8526a291005e7f38478079526c843cbec
> patch link:    https://lore.kernel.org/r/20230125-tfp410_i2c-v1-4-66a4d4e390b7%40criticallink.com
> patch subject: [PATCH 4/4] DRM: BRIDGE: TFP410: If connected, use I2C for polled HPD status.
> config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20230129/202301290803.ouS19eab-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/c4659fa4c02b62087c095ca99978e5eac8b490de
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Jonathan-Cormier/dt-bindings-display-bridge-tfp410-Add-tfp410-i2c-example/20230128-183627
>         git checkout c4659fa4c02b62087c095ca99978e5eac8b490de
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/bridge/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/gpu/drm/bridge/ti-tfp410.c:111:6: warning: unused variable 'val' [-Wunused-variable]
>            u32 val;
>                ^
>    1 warning generated.
This has already been fixed in V2 of the patch series.
>
>
> vim +/val +111 drivers/gpu/drm/bridge/ti-tfp410.c
>
>    106
>    107  static enum drm_connector_status
>    108  tfp410_connector_detect(struct drm_connector *connector, bool force)
>    109  {
>    110          struct tfp410 *dvi = drm_connector_to_tfp410(connector);
>  > 111          u32 val;
>    112          unsigned int ret;
>    113
>    114          if (dvi->i2c) {
>    115                  ret = regmap_test_bits(dvi->regmap, TFP410_REG_CTL_2_MODE, TFP410_BIT_HTPLG);
>    116                  if (ret < 0)
>    117                          dev_err(dvi->dev, "%s failed to read HTPLG bit : %d\n", __func__, ret);
>    118                  else
>    119                          return ret ? connector_status_connected : connector_status_disconnected;
>    120          }
>    121
>    122          return drm_bridge_detect(dvi->next_bridge);
>    123  }
>    124
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
