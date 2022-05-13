Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C560F52608E
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 13:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C73B10E46A;
	Fri, 13 May 2022 11:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB3810E391
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 11:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652439823; x=1683975823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TLKqQ2wymwAEhGiToADns1nYw8QR22hogOXokBFX7Cc=;
 b=kkxHsaE/dln+K6ADfeLHo1ZDOUh8gra0AN7erW7WU+HI2LwG/awB6prc
 AfkTVQ9wmEBy0k17f5w5uUq/PapdVli4r5FQImQgCzQB5VeN3gkRM80PJ
 KD/Hm9bUK+A8HmWr8fzEX7ydaxn1IJg7FWIYq/T5JmN1c3s3Pn697LR/1
 6W/VtQ1pnYZ9H4YlM3rZQ3Jb8Zq5+fJfMGVlp2zWeehVyq6dKIzaVSFI+
 fCkKHtjpN+xl0iI0a3xY1uqXGYiOZzNURRft8tc2KHygngRr6hjW7jhdo
 YBU80AKDvxrP2TMRqcH8HZrPcNxF0jcJ++ZJg9G6YiePxsxqZCnWKfZ06 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="295538833"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="295538833"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 04:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="815340352"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 13 May 2022 04:03:36 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npT55-000LfU-DL;
 Fri, 13 May 2022 11:03:35 +0000
Date: Fri, 13 May 2022 19:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 1/3] usb: gadget: add Aspeed ast2600 udc driver
Message-ID: <202205131836.QEUySDoN-lkp@intel.com>
References: <20220513065728.857722-2-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513065728.857722-2-neal_liu@aspeedtech.com>
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
 linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com,
 Neal Liu <neal_liu@aspeedtech.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neal,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on robh/for-next v5.18-rc6 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Neal-Liu/add-Aspeed-udc-driver-for-ast2600/20220513-150314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220513/202205131836.QEUySDoN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/272ae26f9fe89f60d584cf445431d0fa566eb24b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Neal-Liu/add-Aspeed-udc-driver-for-ast2600/20220513-150314
        git checkout 272ae26f9fe89f60d584cf445431d0fa566eb24b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/usb/gadget/udc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/udc/aspeed_udc.c: In function 'ast_udc_ep0_out':
>> drivers/usb/gadget/udc/aspeed_udc.c:790:13: warning: variable 'buf' set but not used [-Wunused-but-set-variable]
     790 |         u8 *buf;
         |             ^~~
   drivers/usb/gadget/udc/aspeed_udc.c: In function 'ast_udc_ep0_handle_setup':
>> drivers/usb/gadget/udc/aspeed_udc.c:1099:60: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1099 |                 SETUP_DBG(udc, "No gadget for request !\n");
         |                                                            ^
>> drivers/usb/gadget/udc/aspeed_udc.c:1034:13: warning: variable 'ep_num' set but not used [-Wunused-but-set-variable]
    1034 |         u16 ep_num = 0;
         |             ^~~~~~


vim +/buf +790 drivers/usb/gadget/udc/aspeed_udc.c

   783	
   784	static void ast_udc_ep0_out(struct ast_udc_dev *udc)
   785	{
   786		struct device *dev = &udc->pdev->dev;
   787		struct ast_udc_ep *ep = &udc->ep[0];
   788		struct ast_udc_request *req;
   789		u16 rx_len;
 > 790		u8 *buf;
   791	
   792		if (list_empty(&ep->queue))
   793			return;
   794	
   795		req = list_entry(ep->queue.next, struct ast_udc_request, queue);
   796	
   797		buf = req->req.buf;
   798		rx_len = EP0_GET_RX_LEN(ast_udc_read(udc, AST_UDC_EP0_CTRL));
   799		req->req.actual += rx_len;
   800	
   801		SETUP_DBG(udc, "req %p (%d/%d)\n", req,
   802			  req->req.actual, req->req.length);
   803	
   804		if ((rx_len < ep->ep.maxpacket) ||
   805		    (req->req.actual == req->req.length)) {
   806			ast_udc_ep0_tx(udc);
   807			if (!ep->dir_in)
   808				ast_udc_done(ep, req, 0);
   809	
   810		} else {
   811			if (rx_len > req->req.length) {
   812				// Issue Fix
   813				dev_warn(dev, "Something wrong (%d/%d)\n",
   814					 req->req.actual, req->req.length);
   815				ast_udc_ep0_tx(udc);
   816				ast_udc_done(ep, req, 0);
   817				return;
   818			}
   819	
   820			ep->dir_in = 0;
   821	
   822			/* More works */
   823			ast_udc_ep0_queue(ep, req);
   824		}
   825	}
   826	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
