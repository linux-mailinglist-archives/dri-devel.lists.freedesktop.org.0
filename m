Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0CBB8C3FD
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 10:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7744B10E29A;
	Sat, 20 Sep 2025 08:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBjQ1R9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE18310E29A
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 08:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758357456; x=1789893456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LlzRi6bk10r8Z/aQ0b6CxVImRK79Ze9lOeWEQTrLmNI=;
 b=fBjQ1R9+xXwGDSgKI3o7YRZXkUb8daO23gYX/AbtT4rnZVTpFWP47R4G
 oTdHlsqMUozE7NPIEU4ykSD6uB/RWyHREd+3a4tRNqSQEyCf0j7h57APi
 r+9Ol9UUxEXbOZnPnmq967TCvhGcQTgeaN5WvGEK6wl+WZhfOaddhuq6C
 6+GbHAsrdGrOQ0O8oSagVQPXvkqViX2/TCBIz/zsjfNr6sXlT6oKyndw1
 lfQ5l+LzKhgR8MpqewfzcY1chrN9RAOWd5rypGEbW1pSyIgfNY5mjfls8
 /sHGkVApN+hWfDNec/20OYrT4dBQcs82kod9jcx0Qcz4HSLzcAMZDQck2 Q==;
X-CSE-ConnectionGUID: JIUZoZM2Sw+9ZXXd4JDvfw==
X-CSE-MsgGUID: nly6E1/wTHqTej7SwW0n/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="64512823"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; d="scan'208";a="64512823"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2025 01:37:35 -0700
X-CSE-ConnectionGUID: Dfw/SjHRRkqqAwhq4X36bA==
X-CSE-MsgGUID: 9VeOsDXBTFy6vTS6xHtZHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; d="scan'208";a="199748111"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 20 Sep 2025 01:37:33 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uzt63-0005B1-0s;
 Sat, 20 Sep 2025 08:37:31 +0000
Date: Sat, 20 Sep 2025 16:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: DeepanshuPratik <deepanshu.pratik@gmail.com>, andy@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, DeepanshuPratik <deepanshu.pratik@gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix macro usage and style warnings
Message-ID: <202509201601.hTKUjeIe-lkp@intel.com>
References: <20250919212938.822374-1-deepanshu.pratik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919212938.822374-1-deepanshu.pratik@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi DeepanshuPratik,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/DeepanshuPratik/staging-fbtft-fix-macro-usage-and-style-warnings/20250920-053248
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250919212938.822374-1-deepanshu.pratik%40gmail.com
patch subject: [PATCH] staging: fbtft: fix macro usage and style warnings
config: x86_64-buildonly-randconfig-002-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201601.hTKUjeIe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201601.hTKUjeIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201601.hTKUjeIe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/fbtft/fbtft-bus.c:15:2: error: '#' is not followed by a macro parameter
      15 | #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
         |  ^
>> drivers/staging/fbtft/fbtft-bus.c:66:47: error: unexpected type name 'u8': expected identifier
      66 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, NOOP)
         |                                               ^
   drivers/staging/fbtft/fbtft-bus.c:66:51: error: unexpected type name 'u8': expected identifier
      66 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, NOOP)
         |                                                   ^
>> drivers/staging/fbtft/fbtft-bus.c:66:51: error: redefinition of parameter 'u8'
>> drivers/staging/fbtft/fbtft-bus.c:67:1: error: expected function body after function declarator
      67 | define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
         | ^
   5 errors generated.


vim +15 drivers/staging/fbtft/fbtft-bus.c

c296d5f9957c039 Thomas Petazzoni   2014-12-31   7  
c296d5f9957c039 Thomas Petazzoni   2014-12-31   8  /*****************************************************************************
c296d5f9957c039 Thomas Petazzoni   2014-12-31   9   *
c296d5f9957c039 Thomas Petazzoni   2014-12-31  10   *   void (*write_reg)(struct fbtft_par *par, int len, ...);
c296d5f9957c039 Thomas Petazzoni   2014-12-31  11   *
c296d5f9957c039 Thomas Petazzoni   2014-12-31  12   *****************************************************************************/
c296d5f9957c039 Thomas Petazzoni   2014-12-31  13  
49f31092c55579e DeepanshuPratik    2025-09-20  14  #define NOOP(x) (x)                                                           \
8d8825b420ffb37 Alfonso Lima Astor 2017-10-17 @15  #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  16  void func(struct fbtft_par *par, int len, ...)                                \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  17  {                                                                             \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  18  	va_list args;                                                         \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  19  	int i, ret;                                                           \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  20  	int offset = 0;                                                       \
8d8825b420ffb37 Alfonso Lima Astor 2017-10-17  21  	buffer_type *buf = (buffer_type *)par->buf;                           \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  22  									      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  23  	if (unlikely(par->debug & DEBUG_WRITE_REGISTER)) {                    \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  24  		va_start(args, len);                                          \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  25  		for (i = 0; i < len; i++) {                                   \
cc1c0eea8527bd2 Renato Soma        2018-04-17  26  			buf[i] = modifier((data_type)va_arg(args,             \
cc1c0eea8527bd2 Renato Soma        2018-04-17  27  							    unsigned int));   \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  28  		}                                                             \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  29  		va_end(args);                                                 \
cc1c0eea8527bd2 Renato Soma        2018-04-17  30  		fbtft_par_dbg_hex(DEBUG_WRITE_REGISTER, par,                  \
cc1c0eea8527bd2 Renato Soma        2018-04-17  31  				  par->info->device, buffer_type, buf, len,   \
cc1c0eea8527bd2 Renato Soma        2018-04-17  32  				  "%s: ", __func__);                          \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  33  	}                                                                     \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  34  									      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  35  	va_start(args, len);                                                  \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  36  									      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  37  	if (par->startbyte) {                                                 \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  38  		*(u8 *)par->buf = par->startbyte;                             \
8d8825b420ffb37 Alfonso Lima Astor 2017-10-17  39  		buf = (buffer_type *)(par->buf + 1);                          \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  40  		offset = 1;                                                   \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  41  	}                                                                     \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  42  									      \
8d8825b420ffb37 Alfonso Lima Astor 2017-10-17  43  	*buf = modifier((data_type)va_arg(args, unsigned int));               \
cc1c0eea8527bd2 Renato Soma        2018-04-17  44  	ret = fbtft_write_buf_dc(par, par->buf, sizeof(data_type) + offset,   \
cc1c0eea8527bd2 Renato Soma        2018-04-17  45  				 0);                                          \
e70065fdc11d86f Heiner Kallweit    2017-03-02  46  	if (ret < 0)							      \
e70065fdc11d86f Heiner Kallweit    2017-03-02  47  		goto out;						      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  48  	len--;                                                                \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  49  									      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  50  	if (par->startbyte)                                                   \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  51  		*(u8 *)par->buf = par->startbyte | 0x2;                       \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  52  									      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  53  	if (len) {                                                            \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  54  		i = len;                                                      \
e70065fdc11d86f Heiner Kallweit    2017-03-02  55  		while (i--)						      \
cc1c0eea8527bd2 Renato Soma        2018-04-17  56  			*buf++ = modifier((data_type)va_arg(args,             \
cc1c0eea8527bd2 Renato Soma        2018-04-17  57  							    unsigned int));   \
e70065fdc11d86f Heiner Kallweit    2017-03-02  58  		fbtft_write_buf_dc(par, par->buf,			      \
8d8825b420ffb37 Alfonso Lima Astor 2017-10-17  59  				   len * (sizeof(data_type) + offset), 1);    \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  60  	}                                                                     \
e70065fdc11d86f Heiner Kallweit    2017-03-02  61  out:									      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  62  	va_end(args);                                                         \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  63  }                                                                             \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  64  EXPORT_SYMBOL(func);
c296d5f9957c039 Thomas Petazzoni   2014-12-31  65  
49f31092c55579e DeepanshuPratik    2025-09-20 @66  define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, NOOP)
8d8825b420ffb37 Alfonso Lima Astor 2017-10-17 @67  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
49f31092c55579e DeepanshuPratik    2025-09-20  68  define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, NOOP)
c296d5f9957c039 Thomas Petazzoni   2014-12-31  69  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
