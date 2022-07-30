Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE1F585A85
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 15:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5551810EB3B;
	Sat, 30 Jul 2022 13:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C9210EB3B;
 Sat, 30 Jul 2022 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659186673; x=1690722673;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8WinKOkiACvMCIL7j4JUfw0p1az0NmOrR3j3M1UjeuM=;
 b=DC7bfGe4cnGPsf+dSnSCIdGCVMgk6TSIzwGXl8WsJ02SduxTW1DbfVDi
 stc6E2layfG30hrtNX23jsOdYrv46SDzT7pP7mlOU0I26680Xk/PlwcMi
 E9QveI3ubKDBfgJyESpktlQG9KqZQLG4A2FBIRtu+gqQ4t4INgoQ+GzuN
 xkLBSQ8xKU4YW+qC51zNfg3Dx9/cxKk6AVTdT69V4YLXJQ+8YA1rMU5QW
 3AEd3TTHhGGeAnK8f/ptzffHUI2zT79cAB5VRsv834uLk0ymtsfr3doYb
 O2FZWzZAy3eMbeZ/5b2ptepthAyErCg9WG5Lsb18qXmIMLhkweeNNv8xN w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10424"; a="286472113"
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; d="scan'208";a="286472113"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2022 06:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; d="scan'208";a="728001021"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 30 Jul 2022 06:11:08 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oHmFI-000Cqf-0W;
 Sat, 30 Jul 2022 13:11:08 +0000
Date: Sat, 30 Jul 2022 21:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/5] clk: qcom: Allow custom reset ops
Message-ID: <202207302137.mPbHPaHz-lkp@intel.com>
References: <20220730144713.2.I4b69f984a97535179acd9637426a1331f84f6646@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220730144713.2.I4b69f984a97535179acd9637426a1331f84f6646@changeid>
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
Cc: kbuild-all@lists.01.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Akhil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next drm-misc/drm-misc-next drm-tip/drm-tip linus/master v5.19-rc8 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/clk-qcom-Support-gdsc-collapse-polling-using-reset-inteface/20220730-171922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: ia64-randconfig-r031-20220729 (https://download.01.org/0day-ci/archive/20220730/202207302137.mPbHPaHz-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/971a03493e9854ff4a227ee4d80b533997959891
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Akhil-P-Oommen/clk-qcom-Support-gdsc-collapse-polling-using-reset-inteface/20220730-171922
        git checkout 971a03493e9854ff4a227ee4d80b533997959891
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/clk/qcom/reset.c: In function 'qcom_reset':
>> drivers/clk/qcom/reset.c:17:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
      17 |         const struct qcom_reset_map *map = &rst->reset_map[id];
         |         ^~~~~


vim +17 drivers/clk/qcom/reset.c

    13	
    14	static int qcom_reset(struct reset_controller_dev *rcdev, unsigned long id)
    15	{
    16		struct qcom_reset_controller *rst = to_qcom_reset_controller(rcdev);
  > 17		const struct qcom_reset_map *map = &rst->reset_map[id];
    18	
    19		if (map->op)
    20			return map->op(map);
    21	
    22		rcdev->ops->assert(rcdev, id);
    23		udelay(1);
    24		rcdev->ops->deassert(rcdev, id);
    25		return 0;
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
