Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 251AA20CB30
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 02:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716F76E3D6;
	Mon, 29 Jun 2020 00:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E5E6E3D2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 00:30:02 +0000 (UTC)
IronPort-SDR: 9Z3z33c4Cx7DZhLV492OYuuidkPUD0tTAp9gyQ0RRrvBbCeJEo8bXtmCFXQ1QG+HnMFkcLcCrL
 uZqXBL9SzIaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="163900265"
X-IronPort-AV: E=Sophos;i="5.75,293,1589266800"; 
 d="gz'50?scan'50,208,50";a="163900265"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2020 17:30:02 -0700
IronPort-SDR: t2P5U7hyLXnkbjZ6a4shqOdH5lxoNK/V5Xx6nrrS+JnqtcfOPFhrJtuFDVGnt4F6dyd2P0iCYY
 lDH6rfhXjTtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,293,1589266800"; 
 d="gz'50?scan'50,208,50";a="302896915"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.3])
 by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2020 17:29:59 -0700
Date: Mon, 29 Jun 2020 08:29:33 +0800
From: kernel test robot <lkp@intel.com>
To: B K Karthik <bkkarthik@pesu.pes.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jan Sebastian =?utf-8?B?R8O2dHRl?= <linux@jaseg.net>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbtft-bus.c: Removing that prohibited space before ')'
Message-ID: <20200629002932.GA5535@shao2-debian>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="anW2uJ7hcMI/vMa8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200627045150.ysqvd47o52f4a6rc@pesu-pes-edu>
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
Cc: kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--anW2uJ7hcMI/vMa8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi K,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on v5.8-rc2 next-20200626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/B-K-Karthik/fbtft-bus-c-Removing-that-prohibited-space-before/20200627-125315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 92cd1b5d65f5c67147c7da39a3c2ad7e6ff81027
config: ia64-randconfig-s031-20200624 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-dirty
        # save the attached .config to linux build tree
        make W=1 C=1 ARCH=ia64 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/staging/fbtft/fbtft-bus.c:65:1: sparse: sparse: macro "define_fbtft_write_reg" requires 4 arguments, but only 3 given
   drivers/staging/fbtft/fbtft-bus.c:67:1: sparse: sparse: macro "define_fbtft_write_reg" requires 4 arguments, but only 3 given
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got void
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ) in function declarator
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got (
>> drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ) in function declarator
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got =
>> drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Trying to use reserved word 'for' as identifier
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got <
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got ++
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got +=
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got +=
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got +=
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got +=
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got }
>> drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got {
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ) in function declarator
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got ->
>> drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got +=
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got +=
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got +=
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got +=
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ) in function declarator
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got <
>> drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got --
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ) in function declarator
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got ->
>> drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Trying to use reserved word 'if' as identifier
>> drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got :
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:66:1: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:69:1: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:69:1: sparse: sparse: got void
   drivers/staging/fbtft/fbtft-bus.c:76:13: sparse: sparse: Expected ) in function declarator
   drivers/staging/fbtft/fbtft-bus.c:76:13: sparse: sparse: got (
   drivers/staging/fbtft/fbtft-bus.c:76:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/staging/fbtft/fbtft-bus.c:78:24: sparse: sparse: Expected ) in function declarator
   drivers/staging/fbtft/fbtft-bus.c:78:24: sparse: sparse: got =
   drivers/staging/fbtft/fbtft-bus.c:78:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   drivers/staging/fbtft/fbtft-bus.c:78:31: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:78:31: sparse: sparse: got <
   drivers/staging/fbtft/fbtft-bus.c:78:39: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:78:39: sparse: sparse: got ++
   drivers/staging/fbtft/fbtft-bus.c:79:50: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:79:50: sparse: sparse: got +=
   drivers/staging/fbtft/fbtft-bus.c:79:50: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:79:50: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:81:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/staging/fbtft/fbtft-bus.c:81:17: sparse: sparse: Expected ; at end of declaration
   drivers/staging/fbtft/fbtft-bus.c:81:17: sparse: sparse: got {
   drivers/staging/fbtft/fbtft-bus.c:81:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:81:17: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:84:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/staging/fbtft/fbtft-bus.c:84:9: sparse: sparse: got }
   drivers/staging/fbtft/fbtft-bus.c:88:16: sparse: sparse: Expected ) in function declarator
   drivers/staging/fbtft/fbtft-bus.c:88:16: sparse: sparse: got ->
   drivers/staging/fbtft/fbtft-bus.c:88:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/staging/fbtft/fbtft-bus.c:93:24: sparse: sparse: Expected ) in function declarator
   drivers/staging/fbtft/fbtft-bus.c:93:24: sparse: sparse: got =
>> drivers/staging/fbtft/fbtft-bus.c:93:17: sparse: sparse: too many errors

# https://github.com/0day-ci/linux/commit/f9a954fc5ae43b8fb5195dbb7152976581d80a1a
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout f9a954fc5ae43b8fb5195dbb7152976581d80a1a
vim +/define_fbtft_write_reg +65 drivers/staging/fbtft/fbtft-bus.c

c296d5f9957c03 Thomas Petazzoni   2014-12-31   64  
f9a954fc5ae43b B K Karthik        2020-06-27  @65  define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
8d8825b420ffb3 Alfonso Lima Astor 2017-10-17  @66  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
f9a954fc5ae43b B K Karthik        2020-06-27   67  define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
c296d5f9957c03 Thomas Petazzoni   2014-12-31   68  
c296d5f9957c03 Thomas Petazzoni   2014-12-31   69  void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
c296d5f9957c03 Thomas Petazzoni   2014-12-31   70  {
c296d5f9957c03 Thomas Petazzoni   2014-12-31   71  	va_list args;
c296d5f9957c03 Thomas Petazzoni   2014-12-31   72  	int i, ret;
c296d5f9957c03 Thomas Petazzoni   2014-12-31   73  	int pad = 0;
c296d5f9957c03 Thomas Petazzoni   2014-12-31   74  	u16 *buf = (u16 *)par->buf;
c296d5f9957c03 Thomas Petazzoni   2014-12-31   75  
c296d5f9957c03 Thomas Petazzoni   2014-12-31   76  	if (unlikely(par->debug & DEBUG_WRITE_REGISTER)) {
c296d5f9957c03 Thomas Petazzoni   2014-12-31   77  		va_start(args, len);
c296d5f9957c03 Thomas Petazzoni   2014-12-31   78  		for (i = 0; i < len; i++)
c296d5f9957c03 Thomas Petazzoni   2014-12-31   79  			*(((u8 *)buf) + i) = (u8)va_arg(args, unsigned int);
c296d5f9957c03 Thomas Petazzoni   2014-12-31   80  		va_end(args);
c296d5f9957c03 Thomas Petazzoni   2014-12-31  @81  		fbtft_par_dbg_hex(DEBUG_WRITE_REGISTER, par,
333c7b940526be Leonardo Brás      2018-08-07   82  				  par->info->device, u8, buf, len, "%s: ",
333c7b940526be Leonardo Brás      2018-08-07   83  				  __func__);
c296d5f9957c03 Thomas Petazzoni   2014-12-31   84  	}
c296d5f9957c03 Thomas Petazzoni   2014-12-31   85  	if (len <= 0)
c296d5f9957c03 Thomas Petazzoni   2014-12-31   86  		return;
c296d5f9957c03 Thomas Petazzoni   2014-12-31   87  
c296d5f9957c03 Thomas Petazzoni   2014-12-31   88  	if (par->spi && (par->spi->bits_per_word == 8)) {
c296d5f9957c03 Thomas Petazzoni   2014-12-31   89  		/* we're emulating 9-bit, pad start of buffer with no-ops
b2ac4a927034d0 Anson Jacob        2016-08-25   90  		 * (assuming here that zero is a no-op)
b2ac4a927034d0 Anson Jacob        2016-08-25   91  		 */
c296d5f9957c03 Thomas Petazzoni   2014-12-31   92  		pad = (len % 4) ? 4 - (len % 4) : 0;
c296d5f9957c03 Thomas Petazzoni   2014-12-31  @93  		for (i = 0; i < pad; i++)
c296d5f9957c03 Thomas Petazzoni   2014-12-31   94  			*buf++ = 0x000;
c296d5f9957c03 Thomas Petazzoni   2014-12-31   95  	}
c296d5f9957c03 Thomas Petazzoni   2014-12-31   96  
c296d5f9957c03 Thomas Petazzoni   2014-12-31   97  	va_start(args, len);
c296d5f9957c03 Thomas Petazzoni   2014-12-31   98  	*buf++ = (u8)va_arg(args, unsigned int);
c296d5f9957c03 Thomas Petazzoni   2014-12-31   99  	i = len - 1;
c296d5f9957c03 Thomas Petazzoni   2014-12-31  100  	while (i--) {
c296d5f9957c03 Thomas Petazzoni   2014-12-31  101  		*buf = (u8)va_arg(args, unsigned int);
c296d5f9957c03 Thomas Petazzoni   2014-12-31  102  		*buf++ |= 0x100; /* dc=1 */
c296d5f9957c03 Thomas Petazzoni   2014-12-31  103  	}
c296d5f9957c03 Thomas Petazzoni   2014-12-31  104  	va_end(args);
c296d5f9957c03 Thomas Petazzoni   2014-12-31  105  	ret = par->fbtftops.write(par, par->buf, (len + pad) * sizeof(u16));
c296d5f9957c03 Thomas Petazzoni   2014-12-31  106  	if (ret < 0) {
c296d5f9957c03 Thomas Petazzoni   2014-12-31  107  		dev_err(par->info->device,
aed1c72e447f0a Haneen Mohammed    2015-03-06  108  			"write() failed and returned %d\n", ret);
c296d5f9957c03 Thomas Petazzoni   2014-12-31  109  		return;
c296d5f9957c03 Thomas Petazzoni   2014-12-31  110  	}
c296d5f9957c03 Thomas Petazzoni   2014-12-31  111  }
c296d5f9957c03 Thomas Petazzoni   2014-12-31  112  EXPORT_SYMBOL(fbtft_write_reg8_bus9);
c296d5f9957c03 Thomas Petazzoni   2014-12-31  113  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--anW2uJ7hcMI/vMa8
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
p4ZkrAEA

--anW2uJ7hcMI/vMa8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org

--anW2uJ7hcMI/vMa8
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--anW2uJ7hcMI/vMa8--
