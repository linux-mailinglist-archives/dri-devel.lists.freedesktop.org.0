Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAA052F772
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 03:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529C610E127;
	Sat, 21 May 2022 01:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531FD10E127
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 01:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653098309; x=1684634309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DrWDg9joVp2dABARq0RhykWRXTcxvZJXfd8ePCmsTW0=;
 b=AbRDIbsP/ZFjQyR1HZiP5O6wSAsvD4fA1ATy58GfuARHa6gOEorHM47V
 1F8CZOSegp8ymwdhhQEFl7QTdIKlc7ADwAWmvp2FW/TxNSw9Wlob8M409
 Xb9TBAalPGO9gjkxVFTP734PuDwuzLEU9l2KggDWWmsoYOtvWsY7Kd1sy
 VLT3qolI7DLq0EcgJPN72g7SfbRkqSCn2ynMerS9RPM7a2jB5pFQyguxc
 z8OLeoUt8qWdmqxuK0crxC23xS7erRp5BZD5QjGSZ9uLx1dgArwQ4+9ok
 yo/I8C056AtiqA+Uvo+da5z8rgjtNcAO+mDQzuPRxUxdYh9ZaEgNHT6Ah A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="298102843"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="298102843"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 18:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="546969294"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 20 May 2022 18:58:23 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nsENq-0005lm-Q8;
 Sat, 21 May 2022 01:58:22 +0000
Date: Sat, 21 May 2022 09:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH v4 1/3] usb: gadget: add Aspeed ast2600 udc driver
Message-ID: <202205210945.hUK3CONa-lkp@intel.com>
References: <20220520090617.2225080-2-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520090617.2225080-2-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 kbuild-all@lists.01.org, linux-aspeed@lists.ozlabs.org,
 Neal Liu <neal_liu@aspeedtech.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neal,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on robh/for-next v5.18-rc7 next-20220520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Neal-Liu/add-Aspeed-udc-driver-for-ast2600/20220520-170904
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220521/202205210945.hUK3CONa-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/19f3e863ea1b55f570db57febb96c6e8cb39c145
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Neal-Liu/add-Aspeed-udc-driver-for-ast2600/20220520-170904
        git checkout 19f3e863ea1b55f570db57febb96c6e8cb39c145
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/clk/ drivers/usb/gadget/udc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/udc/aspeed_udc.c:310:11: warning: comparison of address of 'ep->queue' equal to a null pointer is always false [-Wtautological-pointer-compare]
           if (&ep->queue == NULL)
                ~~~~^~~~~    ~~~~
>> drivers/usb/gadget/udc/aspeed_udc.c:967:7: warning: variable 'len' is uninitialized when used here [-Wuninitialized]
                   if (len < ep->ep.maxpacket) {
                       ^~~
   drivers/usb/gadget/udc/aspeed_udc.c:908:9: note: initialize the variable 'len' to silence this warning
           u16 len;
                  ^
                   = 0
>> drivers/usb/gadget/udc/aspeed_udc.c:1011:7: warning: variable 'epnum' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case USB_RECIP_INTERFACE:
                ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/usb/ch9.h:67:30: note: expanded from macro 'USB_RECIP_INTERFACE'
   #define USB_RECIP_INTERFACE             0x01
                                           ^~~~
   drivers/usb/gadget/udc/aspeed_udc.c:1021:16: note: uninitialized use occurs here
           ep = &udc->ep[epnum];
                         ^~~~~
   drivers/usb/gadget/udc/aspeed_udc.c:1007:7: warning: variable 'epnum' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case USB_RECIP_DEVICE:
                ^~~~~~~~~~~~~~~~
   include/uapi/linux/usb/ch9.h:66:27: note: expanded from macro 'USB_RECIP_DEVICE'
   #define USB_RECIP_DEVICE                0x00
                                           ^~~~
   drivers/usb/gadget/udc/aspeed_udc.c:1021:16: note: uninitialized use occurs here
           ep = &udc->ep[epnum];
                         ^~~~~
   drivers/usb/gadget/udc/aspeed_udc.c:1002:11: note: initialize the variable 'epnum' to silence this warning
           u16 epnum;
                    ^
                     = 0
>> drivers/usb/gadget/udc/aspeed_udc.c:1096:6: warning: variable 'rc' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (udc->driver) {
               ^~~~~~~~~~~
   drivers/usb/gadget/udc/aspeed_udc.c:1108:6: note: uninitialized use occurs here
           if (rc >= 0)
               ^~
   drivers/usb/gadget/udc/aspeed_udc.c:1096:2: note: remove the 'if' if its condition is always true
           if (udc->driver) {
           ^~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/aspeed_udc.c:1039:8: note: initialize the variable 'rc' to silence this warning
           int rc;
                 ^
                  = 0
   5 warnings generated.


vim +310 drivers/usb/gadget/udc/aspeed_udc.c

   304	
   305	static void ast_udc_nuke(struct ast_udc_ep *ep, int status)
   306	{
   307		int count = 0;
   308	
   309		/* Sanity check */
 > 310		if (&ep->queue == NULL)
   311			return;
   312	
   313		while (!list_empty(&ep->queue)) {
   314			struct ast_udc_request *req;
   315	
   316			req = list_entry(ep->queue.next, struct ast_udc_request,
   317					 queue);
   318			ast_udc_done(ep, req, status);
   319			count++;
   320		}
   321	
   322		if (count)
   323			EP_DBG(ep, "Nuked %d request(s)\n", count);
   324	}
   325	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
