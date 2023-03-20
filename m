Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CAA6C1F29
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 19:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E9810E640;
	Mon, 20 Mar 2023 18:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A0510E1F3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679335867; x=1710871867;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KGgMVkVYkzc5hGwH7fgh8riyDfxHum9YPyo5UnckO5Q=;
 b=FkTaA4vTMNNZ0vksnDfuOwHqoO2HaadSePmutyNlVb0eiLeUGL2chVDw
 xAxx7LCOPjntBIdRn3yUJp+RCFFYpd0h31e83IUgYz8alBpqVnS65dKD7
 /409JVzXqPPK3RNA5DuJfKgoxE8++hAnNeLbcyY0gpAyZzmji07lzK3Js
 MNjBr7Se51737qRZvD+8AhlvUxvD+q7QTkm1I4Oml4Mh4OJVPjE+aE8o5
 SkEoiGx0W2B31A+NiIiOlQexp2s/BcdV0PcJ32hDnod2hrw7VSQgiWVkl
 R6A7Ckmxw5dCsOorACkmGPymIGRXN2/XqZOsS650MmquOYNKcqHXmT+wo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="338764984"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="338764984"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 11:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="927063951"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="927063951"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 20 Mar 2023 11:10:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1peJy8-000BDZ-1J;
 Mon, 20 Mar 2023 18:10:52 +0000
Date: Tue, 21 Mar 2023 02:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, ogabbay@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, jacek.lawrynowicz@linux.intel.com,
 stanislaw.gruszka@linux.intel.com
Subject: Re: [PATCH v4 6/8] accel/qaic: Add mhi_qaic_cntl
Message-ID: <202303210148.859DLhtz-lkp@intel.com>
References: <1679325074-5494-7-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679325074-5494-7-git-send-email-quic_jhugo@quicinc.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, dafna@fastmail.com,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jeffrey,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on lwn/docs-next linus/master v6.3-rc3 next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Hugo/accel-qaic-Add-documentation-for-AIC100-accelerator-driver/20230320-231611
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/1679325074-5494-7-git-send-email-quic_jhugo%40quicinc.com
patch subject: [PATCH v4 6/8] accel/qaic: Add mhi_qaic_cntl
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210148.859DLhtz-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/accel/qaic/mhi_qaic_ctrl.c: 9 linux/version.h not needed.
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra-cbb.c: 19 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra194-cbb.c: 26 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra234-cbb.c: 27 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 289: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 60: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 49: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
