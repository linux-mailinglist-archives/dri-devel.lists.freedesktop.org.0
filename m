Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ADA4AA54D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 02:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421CC10E193;
	Sat,  5 Feb 2022 01:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C28110E193
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 01:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644024488; x=1675560488;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XdxtJJTIZE+WWUJgQ9TXZkuAz5xg8F2S74fBeUfPYaU=;
 b=ad6bowM+wnz6l3btNpN1LdXivBi+x2qFmEXC4CZ0ByqjqzEWdiybzOAa
 Zq09de7JRWaMsMhfDkibMgAag8L2aKnFv8ZcWxUE0JTaq+tchD9Q5fe+A
 bz0+4fOe8WZPs/tvmHyALBMAqMode646DlbaBCEDj4PlzqgsgESDmfBrN
 G6UsMDzTFSKO5RkQrdbV+Yn6C2CxMbo0O32koKP76eVihDnjfR+8AQNZs
 L/NQG5/egkG2+bf+iRqUIFftX6syI+iiR6+HEeyVUDb59WHpjOpG0GC08
 lRkaAijlHmjC/EdkXr97Lf+UElbZsX2mkz5agyBtqxTIy9wix2/GP3AfN Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="311772934"
X-IronPort-AV: E=Sophos;i="5.88,344,1635231600"; d="scan'208";a="311772934"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 17:28:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,344,1635231600"; d="scan'208";a="584300475"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 04 Feb 2022 17:28:04 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nG9rw-000YQN-9r; Sat, 05 Feb 2022 01:28:04 +0000
Date: Sat, 5 Feb 2022 09:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v6 3/4] drm/bridge: anx7625: Support reading edid through
 aux channel
Message-ID: <202202050942.C6c0MD0r-lkp@intel.com>
References: <20220203141023.570180-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203141023.570180-3-hsinyi@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[cannot apply to robh/for-next drm-intel/for-linux-next v5.17-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hsin-Yi-Wang/drm-bridge-anx7625-send-DPCD-command-to-downstream/20220203-221108
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm64-randconfig-c023-20220130 (https://download.01.org/0day-ci/archive/20220205/202202050942.C6c0MD0r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/45f3728b61c8cb8d53d13d88c33c4f58630dcea6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hsin-Yi-Wang/drm-bridge-anx7625-send-DPCD-command-to-downstream/20220203-221108
        git checkout 45f3728b61c8cb8d53d13d88c33c4f58630dcea6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: ID map text too big or misaligned
   aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_bridge_detach':
>> anx7625.c:(.text+0x5e0): undefined reference to `drm_dp_aux_unregister'
   aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_bridge_attach':
>> anx7625.c:(.text+0x674): undefined reference to `drm_dp_aux_register'
   aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_i2c_probe':
>> anx7625.c:(.text+0x1b48): undefined reference to `drm_dp_aux_init'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
