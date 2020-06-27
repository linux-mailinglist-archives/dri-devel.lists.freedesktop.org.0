Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C670820C056
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 10:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15ADC6E0AA;
	Sat, 27 Jun 2020 08:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BC56E0AA
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 08:42:34 +0000 (UTC)
IronPort-SDR: Y7oIdVXxl6aCrBK9F1GVG5kGxlsHaGUkYnVpeiwb9GSCpukbpG8mc6PjEYDCGGsN3d/EMfBUw3
 YkeaA/MFWkgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9664"; a="133028276"
X-IronPort-AV: E=Sophos;i="5.75,287,1589266800"; 
 d="gz'50?scan'50,208,50";a="133028276"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2020 01:42:33 -0700
IronPort-SDR: 1LccKSNXepJyxOH+Bw1HxIBW4cQQg8MRVbSJpGJm0qY3GEEb87D5N6hSwETYGXNgyvv9xT5Cm5
 BEuqVQxKbbhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,287,1589266800"; 
 d="gz'50?scan'50,208,50";a="453623178"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 27 Jun 2020 01:42:30 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jp6Pt-0002jW-VX; Sat, 27 Jun 2020 08:42:29 +0000
Date: Sat, 27 Jun 2020 16:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: B K Karthik <bkkarthik@pesu.pes.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jan Sebastian =?iso-8859-1?Q?G=F6tte?= <linux@jaseg.net>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbtft-bus.c:
Message-ID: <202006271657.80qBR58X%lkp@intel.com>
References: <20200627045004.a46jbqtbiintu2nt@pesu-pes-edu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <20200627045004.a46jbqtbiintu2nt@pesu-pes-edu>
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


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi K,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on v5.8-rc2 next-20200626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/B-K-Karthik/fbtft-bus-c/20200627-125213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 92cd1b5d65f5c67147c7da39a3c2ad7e6ff81027
config: i386-randconfig-a005-20200624 (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/staging/fbtft/fbtft-bus.c:65:53: error: macro "define_fbtft_write_reg" requires 4 arguments, but only 3 given
    define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
                                                        ^
>> drivers/staging/fbtft/fbtft-bus.c:15:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'void'
    void func(struct fbtft_par *par, int len, ...)                                \
    ^
>> drivers/staging/fbtft/fbtft-bus.c:66:1: note: in expansion of macro 'define_fbtft_write_reg'
    define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft-bus.c:67:57: error: macro "define_fbtft_write_reg" requires 4 arguments, but only 3 given
    define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
                                                            ^
   drivers/staging/fbtft/fbtft-bus.c:69:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'void'
    void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
    ^~~~

vim +15 drivers/staging/fbtft/fbtft-bus.c

c296d5f9957c03 Thomas Petazzoni   2014-12-31   7  
c296d5f9957c03 Thomas Petazzoni   2014-12-31   8  /*****************************************************************************
c296d5f9957c03 Thomas Petazzoni   2014-12-31   9   *
c296d5f9957c03 Thomas Petazzoni   2014-12-31  10   *   void (*write_reg)(struct fbtft_par *par, int len, ...);
c296d5f9957c03 Thomas Petazzoni   2014-12-31  11   *
c296d5f9957c03 Thomas Petazzoni   2014-12-31  12   *****************************************************************************/
c296d5f9957c03 Thomas Petazzoni   2014-12-31  13  
8d8825b420ffb3 Alfonso Lima Astor 2017-10-17  14  #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
c296d5f9957c03 Thomas Petazzoni   2014-12-31 @15  void func(struct fbtft_par *par, int len, ...)                                \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  16  {                                                                             \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  17  	va_list args;                                                         \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  18  	int i, ret;                                                           \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  19  	int offset = 0;                                                       \
8d8825b420ffb3 Alfonso Lima Astor 2017-10-17  20  	buffer_type *buf = (buffer_type *)par->buf;                           \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  21  									      \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  22  	if (unlikely(par->debug & DEBUG_WRITE_REGISTER)) {                    \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  23  		va_start(args, len);                                          \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  24  		for (i = 0; i < len; i++) {                                   \
cc1c0eea8527bd Renato Soma        2018-04-17  25  			buf[i] = modifier((data_type)va_arg(args,             \
cc1c0eea8527bd Renato Soma        2018-04-17  26  							    unsigned int));   \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  27  		}                                                             \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  28  		va_end(args);                                                 \
cc1c0eea8527bd Renato Soma        2018-04-17  29  		fbtft_par_dbg_hex(DEBUG_WRITE_REGISTER, par,                  \
cc1c0eea8527bd Renato Soma        2018-04-17  30  				  par->info->device, buffer_type, buf, len,   \
cc1c0eea8527bd Renato Soma        2018-04-17  31  				  "%s: ", __func__);                          \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  32  	}                                                                     \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  33  									      \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  34  	va_start(args, len);                                                  \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  35  									      \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  36  	if (par->startbyte) {                                                 \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  37  		*(u8 *)par->buf = par->startbyte;                             \
8d8825b420ffb3 Alfonso Lima Astor 2017-10-17  38  		buf = (buffer_type *)(par->buf + 1);                          \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  39  		offset = 1;                                                   \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  40  	}                                                                     \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  41  									      \
8d8825b420ffb3 Alfonso Lima Astor 2017-10-17  42  	*buf = modifier((data_type)va_arg(args, unsigned int));               \
cc1c0eea8527bd Renato Soma        2018-04-17  43  	ret = fbtft_write_buf_dc(par, par->buf, sizeof(data_type) + offset,   \
cc1c0eea8527bd Renato Soma        2018-04-17  44  				 0);                                          \
e70065fdc11d86 Heiner Kallweit    2017-03-02  45  	if (ret < 0)							      \
e70065fdc11d86 Heiner Kallweit    2017-03-02  46  		goto out;						      \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  47  	len--;                                                                \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  48  									      \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  49  	if (par->startbyte)                                                   \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  50  		*(u8 *)par->buf = par->startbyte | 0x2;                       \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  51  									      \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  52  	if (len) {                                                            \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  53  		i = len;                                                      \
e70065fdc11d86 Heiner Kallweit    2017-03-02  54  		while (i--)						      \
cc1c0eea8527bd Renato Soma        2018-04-17  55  			*buf++ = modifier((data_type)va_arg(args,             \
cc1c0eea8527bd Renato Soma        2018-04-17  56  							    unsigned int));   \
e70065fdc11d86 Heiner Kallweit    2017-03-02  57  		fbtft_write_buf_dc(par, par->buf,			      \
8d8825b420ffb3 Alfonso Lima Astor 2017-10-17  58  				   len * (sizeof(data_type) + offset), 1);    \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  59  	}                                                                     \
e70065fdc11d86 Heiner Kallweit    2017-03-02  60  out:									      \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  61  	va_end(args);                                                         \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  62  }                                                                             \
c296d5f9957c03 Thomas Petazzoni   2014-12-31  63  EXPORT_SYMBOL(func);
c296d5f9957c03 Thomas Petazzoni   2014-12-31  64  
31b9aef1a7ba07 B K Karthik        2020-06-27 @65  define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
8d8825b420ffb3 Alfonso Lima Astor 2017-10-17 @66  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
31b9aef1a7ba07 B K Karthik        2020-06-27  67  define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
c296d5f9957c03 Thomas Petazzoni   2014-12-31  68  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--jRHKVT23PllUwdXP
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICPj69l4AAy5jb25maWcAjDzJdty2svt8RR9nkyySq8mK33lHC5AE2UgTBA2QrW5teGS5
7asTW/LTcBP//asCOABgsX2zcMSqQmEq1IRC//zTzyv2+vL49fbl/u72y5fvq8+Hh8PT7cvh
4+rT/ZfD/64ytapUs+KZaH4H4vL+4fWff92fv7tcvf393e8nvz3dna42h6eHw5dV+vjw6f7z
K7S+f3z46eefUlXloujStNtybYSquobvmqs3n+/ufvtj9Uv74fXh5XX1x+9vgc3lq/06+9V9
v/EaC9MVaXr1fQAVE8OrP07enpwMiDIb4WfnFyf2v5FPyapiRJ947FNWdaWoNlMHHrAzDWtE
GuDWzHTMyK5QjSIRooKm3EOpyjS6TRulzQQV+n13rbTXb9KKMmuE5F3DkpJ3RulmwjZrzVkG
zHMF/wCJwaawzD+vCrtnX1bPh5fXb9PCi0o0Ha+2HdOwOEKK5ur8DMjHYclaQDcNN83q/nn1
8PiCHMbVVCkrhwV784YCd6z1l8COvzOsbDz6NdvybsN1xcuuuBH1RO5jEsCc0ajyRjIas7tZ
aqGWEBcTIhzTuCr+gPxViQlwWMfwu5vjrdVx9AWxIxnPWVs2dl+9FR7Aa2Waikl+9eaXh8eH
w69vJrbmmtUEQ7M3W1F70t0D8P9pU07wWhmx6+T7lrechk5Nxk6vWZOuO4sl55pqZUwnuVR6
37GmYemapGsNL0VCDJ+1oJSinWYa+rQIHBArvUlEUHty4BCunl8/PH9/fjl8nU5OwSuuRWrP
aK1V4k3aR5m1uqYxPM952ggcUJ530p3ViK7mVSYqqwhoJlIUGrQPHD9vjjoDlIEd7TQ3wIFu
mq79k4aQTEkmKgrWrQXXuG77hWGwRsM+w6rB0QcdRlPhaPTWDreTKuNhT7nSKc96HQaT9kSu
ZtrwfhHGPfc5Zzxpi9yEsnF4+Lh6/BTt36TsVboxqoU+nRRmyuvRiohPYs/Td6rxlpUiYw3v
SmaaLt2nJSEJVmNvZ+I2oC0/vuVVY44iu0QrlqXQ0XEyCTvGsj9bkk4q07U1DnmQ8Ob+6+Hp
mRJysGubTlUcpNg/RTcgmFqozFq9cUMqhRiRlZw4iBbpsRDFGuXBrow1eeN+zUYz9VBrzmXd
ALOK1hcDwVaVbdUwvSdG0tN4OqpvlCpoMwO7s2XXKa3bfzW3z3+tXmCIq1sY7vPL7cvz6vbu
7hE8k/uHz9HKQYOOpZavE+hxoCi0VigmNDkhk67tmeBashKHZEyr6bknJkNFlAIJcqXsNToE
6K14UoYgOD4l29tG/hgtahezmtbaCPK8/RerNJ4jWB9hVMn8VdZpuzKEKMJ2dICb71sAhI+O
70A8vZ00AYVlFIFwXWzT/pQQqBmozTgFbzRL+XxMsOxlif6U9HU1YioOO2x4kSal8A8s4nJW
qda6ZDNgV3KWX51e+phEqZiDBbkNvvL8YNuxShPcgnjPvTl01p+UCbnR4UaNqnzj/vCU+2bc
MBUoDLFZA3s4/qRric5iDvZT5M3V2YkPR7GRbOfhT88moRBVAz45y3nE4/Q88AJacLidC22P
mFWfgwiau38fPr5+OTytPh1uX16fDs8W3M+bwAZ245pVTZegTQG+bSVZ3TVl0uVla9aeDSm0
amvjrwf4OSmtBpJy0zeg3SSLcjM5RlCLzBzD62zBYe3xORydG65pkhqcsOYo+4xvRbrg6DkK
YLKob4Y5cJ0fwyf1UbT1FCj7BF4x+BmgPf0dacGYVpR4Wt1d+aEauMT+NyyGDgCw9u57spe8
iZhPg13zdFMrEGU0kuBQ0avmRBcjrGXZAKcjNzBt0JbgmoXyMSgDqx2mGK1Ei7C1Po/2nEf7
zSRwc66PF1/oLArcABDFawAJwzQA+NGZxavo+8JfL1BlaKTxb2ISEFwrsNZS3HB0Ja2cKLCa
Vcp9JjGZgT/osCeIbpzKENnpZRAJAQ1Ym5RbN8GpzahNnZp6A6MBG4fD8Va5zv1xOZtFjCTq
VEIYJ1C4vHEUvMHwoZv5l27vZ+B8zaqsnEVpoysWqNL4u6uk8ON5T9HzMof90T7jxdkzcOjz
NhhV2/Bd9AmnxmNfq2ByoqhYmXsCaifgA6w77APMGnSs5+YLT+CE6lodxB0s2wrDh/XzVgaY
JExr4e/CBkn20swhXbD4I9QuAR49jAEDuZjvGG64jeD9yVhjgwmlaTjQskqjPYDQKYibgJhn
GakInMRCV10cjFggjKLbShvkDZayT+vVh6dPj09fbx/uDiv+n8MDuHsMjGWKDh8485MXRzK3
OpnqYjS5/2U3A8OtdH04lz4QalO2iesw0ApK1gyMtt7QOrRkVHIBeflckAw2Qxd8SLiQjYAI
DSl6e52Gk6jkjMmIx2AeXFLaqpt1m+fgwdQMehxj74UZtNbXA1rdCFYuRE8qF2UUioxeM+g2
a5GCYC1MKw7Eu3eX3bmn+21o32V7MLIQgeaRngRq38i4PCjq04ynKvPPGLi9NXi+Vq83V28O
Xz6dn/2GiWY/9bgBW9eZtq6D1Cg4e+nG+bUznJRtdKokOm26AiMmXDh99e4Ynu08RzwkGCTr
B3wCsoDdmOYwrMt8+zkgAhXsuEIw1xufLs/SeRNQLiLRmLTIQtM/qhQUFdRNOwrHwO3A1De3
1pOgACmCU9fVBUhUnH0DJ9F5cS46hgBjIrCh0ICyegpYaUyrrFs/+x7QWeknydx4RMJ15ZJO
YOeMSMp4yKY1mGhbQlt/3i4dhODrFqxtmcw4WJEygyqDIQ06LDgSnZH1UtPWZhE9VZWDTeZM
l/sU82W+3aoLF7qUoOXALo2BTX/BYBhuDQo8rj9PXULO6uv66fHu8Pz8+LR6+f7NRedeiNOz
uVHQPpC1YNg4lZyzptXcuc0hStY2XRek6lSZ5cLQuVvNGzDsYiGjgxydMIKzpUtCMyFFIgo3
xKAd3zWwrSgqvf+x2AOoNUyp14Z2x5GEyYnPsUhGKJNDxCwWRgoyILQI4gDnxSspQLOBfw3H
FtVsGGYNJ2gPUg9OCTiuRcv9WB/WnG2FDhI4A2we9MxJTC0qm9Uket2APY26cwnSusVsH8hc
2fS+2cR4S+/22OGR7FdMOsTmU6B88e7S7Ej+iKIRb48gGpMu4qRc6OlyiSEoE/DRpRA/QB/H
09I6YC9o7GZhSJs/FuDvaHiqW6NoAZc8z0H4VUVsmbwWFd4rpJfBdvXQc9qNkWBnKhpTcHAA
it3pEWxXLmxPutdit7jIW8HS846+vrPIhQVD33qhFThfyxqmN70LWsGe9wpn44yry1i99UnK
02UcmPOikujw+qEiYtCfrsEKuIyCaWWITmW9S9fF5UWkwiHUl620ijcHn63cT/0JBioM1X8X
BMjYbCt3S4YBOYGlc4p2DgblOgeu94WfKx3AKcyTtXqOAO+uMpI3LPA9B+zNmqmdf7u1rrnT
QjqCcYix0TfSjWe/Mz/qraznYdB7B98j4QXwPaOReP12eRHj+vDAS+z2GA/izIKRvhNrQTKd
Ww+ZYniuFsTLXsh3rBaRQwIhbw8MZFVzDZ62y48kWm145XIveKu4KOAytIfO2/Dita+PD/cv
j0/BJYkXDfYmuK2iBMKMQrO6PIZP8YJjgYO14era7vgYwiwMMlg/XrB0D/LtRyrhF5KdXib+
LaF1QUwNbpwvj27d6xL/4X5KpFFwshPP6RLvNvOdwY0Ajm1NGWqIrrRKg5vVERQfvQkRHL4J
DD6b00s5C1NodrcN5Z70zprw+FUKr/qc9zpy6EEXtNWHU6PyHOKEq5N/0pOwRgd7qNlsOGnN
XBmOaURKrYz1V3I41tAtnElGBAHWa11G8xIc6aEUAW+vvbUUJUpIOThueCfc8quTcIw18naS
tLR0qKPBl1UGUzi6HS4fAzYoAOgZyWEsE6ljsMDcXb7jpci1p5Bko3VgquEb4wfRiBvSA3Ub
EHuCYGYMRCV4fNFGxUmqMcvhMTEQ+ka2SooI4k50Y3Z2wVEq4tWIKWg/gqDEpDlJy3PaYzA8
xSCdxK1vutOTE8pfv+nO3p4Eon/TnYekEReazRWwCa3AWuMVs896w3eccjDq9d4INABwQjQe
qtP+THkhmM0dodgfa2/dDGh/FhzJNchj2RbxTeIkpx4BNTkXMvtERGZumxl6u1KZ2UwEdEcF
h7DXIt93ZdZ4SdVJ9R+JhgMBdioBdEQJQVqNVqTx7wvrx78PTyswIbefD18PDy+WE0trsXr8
hoWO7vpw2D6XbaAWOlCStVy8rAJUWnqJjuv3zqx11jUX6AgOHsZCsgEH5+FmX4PJszJhQGmo
TRtnLiRo8aYvqcImtZ9qshBY8gaUnhubtcvGy76NM7W0dq4FqXMcrzrVbjizpnivnBvXzVJz
zbed2nKtRcb9RE/IiadUKZFPweI5JqwBlb+PoW3ThLrbgrfQO+WkWWTO5g0yRSp0i7Peueaw
98ZE3fd1IOC/xe5QhBbBPVCInA1G1JJKa1jcghaIumNFoUGwoiy1T9uXuhBJRYe257CtC82y
eOAxjpAvUoW4MaYgYqWiMvZusRVEHaBodNTpMG+hYk/aSW1Ce8yu7UJe33XYGognwcg3a7V4
V+NEsube6Q3h/W1dyBoRZMdZ3eTzY+RpJIG3p7CDYsHQDksFf5NHyPlBcdRlcnE1lVit8qfD
/70eHu6+r57vbr+4gMEvM7BCv1R6RLQeGYuPXw5ezTkWH2WhEhhgXaG2XcmyjFQoARWE3e0i
i4YvWC2faEifkZvsUEOqzTde44y83KP1ceIKvMnc/dBM2aVKXp8HwOoXOBerw8vd77/6m4CH
pVDoqNJyYtFSus8jJJnQnCxUc2hWeWoVQdhjCHEcQtjQseefu7sTDHYDoB9Zo1cTf691LKrg
Au383a548/btCZ2fKrgizQi4D1Vwb2jd4b3J6TKrhe1wW3X/cPv0fcW/vn65HRyN0HGyoefE
a0Yfqg3QOHjVpJxvbrvI75++/n37dFhlT/f/Ce5yeeZftWdZ75/3gFxoec00xzAlcPUzKfwA
ET5dnUIEwucVEoIJdO4qiG3ALwcLWZYJSz3PJ7/u0rwYGYxL6sMHH5HeJKWKko+jJfYLOx6u
YYZFaQ6fn25Xn4al+WiXxq8RWyAY0LNFDbZhsw0cQcyBtyB4N/YSi5IoMI7b3dtTL8uAt0Br
dtpVIoadvb2MoeCnt2asBh6udG+f7v59/3K4Q3f4t4+HbzB01BmTRxv5/0Gmys5DuQtlz04P
EDRL49GaAhh3A0bM8M9W1qCPEz/ods9uIOrZG4zO8ya4oLADmNzhtrLBC1ZLpeiLzONX+zSl
EVWX4EuIiJFQmuNVLXGfuYmv7RwUb7UohKppeM8GItjZ/bjF5xBa2xgfXFj026o/eRrX/W95
WJwzvXawHNfgxEdIVIro2YiiVS1Re25g2a2dclX5hFeWgy+PEVZfEjYnMHzImiwgnQrv5GzR
3cjdkyZXFNBdr0XDwzLZ8YrWjAUGtnDZtYjozs8SCOBAT3WzRyFGYrDYv1qKdwdcHjhjVeZu
VXsZCs2Jo3O1NuTG4QurxYbr6y6BibqavwgnxQ7kdkIbO5yIyNYbgtC1ugJ1CVsSFCfFhT2E
nGClCca0tkbSXRrbFhQTov+hekf3S5S1ktxP6iRTWKIySsq2g9gBAoTe1ccqGRKNlcsUSS93
7py4GuH+BiQeTK8serHDnGRE0bdzqfUFXKbahWoCrBZ1j1qG13PEYvQZp76agqTApS5BLiLk
7O5/8An6+oAAbV9TBGqVbBs1gpVR1WzZ7ARFA0a7FwN7oR3LCvH4IRZ5hSLl56UDXVZhshbV
OlZjEJvj9hlwWEsWpy3sBlgkJnLAIuq4OeiBISfMUzhJXsgPqBYTImgwsNxRcypUtRib8wzq
Y6axBfVDsdHagYoi9W3Y6l0oc6reD8qy8WsV0fdN2kjnpCWWeKArBU5P5lFj0t+Ios9Rnc8Q
LDI6o5eJehX3lFLyDZiSZni3qK93vlAtouLmbuXJ5hRqWmuIV8vzsyHHGSr30fiDhQos/OiT
oEr0iwkXLxf6QsyOV6ne2+dFzptK1fa3D7fPh4+rv1wR47enx0/3X4J7MCTqF4FYAIsdHKfw
/dgcM1XmHek4WCR8K40OnKjIyr4fuIEDKw3bgBW7/mG3Fa4Gqzmn19T9AfKXuN8+VyRYKrZQ
JeCo2uoYxWC+j3EwOh3fJpd0IeRAuRC89miUfXyQdYwGq8CuwYIbg884x0cGnZA2D0vVe1cg
j3DW9jJRQc1xr3ns86U4H5v02ejxE/yf1GDW831YtzPU9iemIIGlSOZwTCsUWjTkG4Ee1TWn
Qd5+IMBaMip9ZV+09Ll7awl13Po6oTIDji/eGIQBn50yllHVC8WtSOBe3Q9HNAqmXCb/9unl
HiV71Xz/5tfE2bpZ58dlW3xUkIVpNQV+10hD58bE7gcUWDlGUgwcJCjgiSIYQMO0ONoYYmm6
qTSZMj8YWZnJH1CY4nj3bWlfCPsjGFq2FT2wDdOS/aBbDM5/MLC92V6+Ozo2Tw69UQxJs0gi
fEGU7zHhFJ4KgGHA7r8sQLC923HvydX0gswTMGgnlLvay8CIhz8P4SE3+8R3Bgdwkr/3Rx12
MsX61enUtK3684C1f1axpnHx7HRf5DJDWnqP2a2+d43hWKjrIDmurw0YwwWkNaoLuNEk218F
yKbCxIlkGRM31td00xl8NLaYasJ7opLVNapslmWo4zurtinvZHhw0SU8x/9hDBQ+bvdo7Q1k
d62BOR9rcvk/h7vXl9sPXw7291RWthrlxRONRFS5bNCr9PJtZR5WytgxYNQ1/tgDeqH9A0tP
Fh0vk2rhv4HuwWCo0pBlH8eNgrU0WDsTefj6+PR9JacM8yxbdLSOYijQkKxqWVBOOlVnOBxx
ivvGIbfOFtW5dp69nNjFP97iYnZ8yl/4BrYfr/9YeWRl74TtfbAr4bqIGiXoBISqzbrN6YI6
shUwmuPBCyIj4rceUpu76aJac7ywt4LbNd3lRVCTlIAP68uxK8VVGCFMwI3xVnGQJht8uB8W
yPTVxcn/XE7ToUIySs9CqOoKRLwZ+GXm8EG8zRmA5I0SYvERgbn6YwDd1EoFwnOTtJQLcnOe
Q1QTEBr39IggHjJiNhM85AM9NZwN73Aw1bYJ9s0VdW+HeHq6A+HaFifig3w6N43PWcFZWUum
qVtgxBcchc+W9diyKkLtINpGsiwIEJYP68Ch4p7k4GtVmJYOkqdmk7gq+yFpZtVAdXj5+/Hp
L4g0qPoHEPwNJ186VsIL4PAL1FSQCbewTDDygVIZ+IPweaxKH9GNooR0l/tFefgFx6tQEaiN
HFYLNG3S4VMGusALKdwR5vOWZO2af8uEeW66timrO4M//UFGEyLYQ1G796P9L4hM94b16NV2
tvSTuvUEorqqA2bw3WXrtI54IdiW/9APJByBZpr6vSErZrVfCOYgBVo3LttdjOiatnJxc7Bc
tgU9C+mqW+PfYhgx4RSFNLLbnlLAs8BC7StgqTaCvMBwQ9o2Ihx+m3nj9+C5ameAaa6BoOMO
d4x+bGFxEHEuI0UdF7X52PnSWvDSCUxrNEiFHyHFqCSskRjhaQuYYzyvIYy9VoriuW7SmgKb
Bfg+KRkB3/KCGQJebckRoyu3UDA30pQ12XTLK6oIaMTvOVsTAxEleOtKUGPMUnquaVZQm5AE
umuw8NEOzPC4zscJcGWPUtg1Pkox7PNRIjvdoxQwcbLUsJ8pvQCa3pcBPazf1ZsPH57e+Ksq
s7dGhL/vU28vaTUw3H1M8XcdTWaixd/+w2sAtP+hPqibGn+v0BiR7wOMbQIOoE3GglmR9f9T
9mTLjeNI/opjHjZmImZiRUqypY3oB5AERZR4maAkul4YLlvd7WhPudZ27fbnLxK8kGBC6n2o
biszcRJH3kC8iKIYzQnmedlHbA47d6YXCd/ez3CvK57/8/zuSuM4VTTjFCYUzIHA0ZwWChK3
oP5BWoE815wVNVFxlxVmOM/NcoBQtSpOgL5Y497DkZ7/vltNRzOwN40Wfz5unt7+/e3l+/n5
5t9vIGd/UPPQgGGz2ttFPx/ffzt/IrYIlalZBYyd6v2Vjg2UeZwW1Gc2SKh1NCNSSzGTs5Eq
Ce/p9wsDhCR+IBbUDyV31N8RddyRyYVeXFiIaZCczgujUEc5W7Ci/K+/sF7jnnWC/bqylg7Y
6ZsHjXGtnQgimiw8XnuKyTEmpIP1bU3AioMx34KrYSmUEtKHtYfgtk2wg/YfsavPRirBeZdy
G1qxE9IbXZg2Q5daiUiJOqo4D+b7ZyIru27SbFgUhqOTEfx9E4Yi+nB9qr5AC0T+KCQSyKUD
7CpTx1XYIrU3wkziaD9Dzq5OA+mzVSSPT38gM89QMV2nVcooJMMaMRLwu42CXVsEX8Kc3hUd
zXAbar60TUAHrO4q4ns4ycGLaN42QejMyadL/MUeXGq5iuhETCXmKMG0nnHFogJz7SjQav2/
IdNpILC1hvhcZ+iHum5xFtgBBqkNReiIDAGilOUUlwiooPJvNyvcTgdT331+Uad+TeZorU1T
kN6b9u9W7DK1kPKiKK1MhD3+qHrZnyquXIQ9ZUbKbZ1XBQgH2q0SyWIKRJTQLW4Wvoey00zQ
dnes6Ek1aLIj2ZuIh53ga/B4AHFLt2lqKNDUD9OXrmZmsAVYtVhZphyD0xovxLAgQ/REGUWW
vKwAYJIi0+82/tpogpXGMVUmBRbuOecwKWt0kU3QNk/7P3SuKQHxwqQi1SjS3Y6GCpKFYxPG
B5Z9zJc+Au9/nn+e1Qn2n70BAh2BPXUbBvf2KgFwUlN5dkZsbGqnB2i3UWdVOcJhB7TWg5B9
qEh75YCVcTDvgozv58Ca38+0Ehoe0AnqpqlxK4EAr7iqi/ia2UOfkewqR+TBQBBJW+U4I1H/
59mFiYqqaj4n2T30jZoVuQ+udjtMij2ZW7bH31OfIexNDLPa4vsOd7lJdrFFqsEkicn1KC5V
BA4YVClaqzfOsR3kNVzM8f0vhHzrHu5AoRbyRby6k+JCm0cuyMl9737526///bdeenx9/Ph4
+fXlaS4vqisUS4kAAM8REc7BdSjyiNsO+BqlD3aSEe8J4hNV7LD0L5Sp5LGc9wKgt1RlSgY7
OVcTEFxI4TmOHKevJFqYye4ao+Urlz+LVgNqiottMzIWY1zr6tOjVRUG9FrJwUFVFvACAM1H
qBObaT8KorWi5PlRnoTq6zTzx17BPYdYTNsIThWjgyMFOqM8VRVGUHqEXi3h0Htmpb2EAdLu
JJouDYNVSie76ZKBGmNOpH1+6klR3If9+dMlZI8HOdul5rivaorn0W2GEgWIwe+24Bk4RWjj
krryiaJVaQy5inXGaVOJ3eDMtn3yVa25cp3yBk2n2XJdwxVk/pUPLU4HGeDbFtIofhGu9Qz7
qH/uAtusbj7PH58zjqXc1zue488RVUXZqoUiBqteL8vNKrIQplVsYp6zikX6Yuy9kJ7+OH/e
VI/PL2/gtvf59vT2irRFTDGG9CwyyqQcmCZgyHPII+xvpWY1hoVPlm2DnJe4AgWAnCNzEWVA
gh9l0Trlf0WWCMwIA4i67AJIdY1aT3kkrZKZjOHhGLp4bz22igwxIzPVUfD68/z59vb5+83z
+X9enoboHdMho7azacCwwwz9rmqMT0IR1AcZ2GPuwTojgTs23KQMsFXURGU1pSE1KchuyQj5
K2nogVU1BWuTFQkOQjn7nj2K1cmS5iYNIj2j14jY7rZp3CMMM3+xbGbjK5m3mEPj7mMg4DEJ
hb20qiMlJQX9sGzqeg+TiccxRN+5Fpaxr2N1vFUlbYhRyH1IbVFZV5xlkx9lDz6JiqedFn46
H+IdSHDebNWPiO/n8/PHzefbzbez6jgogJ/By+eml/08w2Wth4D5GjwNEp2VXeeEXEx9yMwk
kvpn78Cpsxf+sjE0PPFekGGwcN5uLU5sW05+dug63BJJvo3jUVD8VcjLpFcCTqQ9DBzI6/rh
Qp0DITieXeV+8pjM0SGZYhC4PRYRU0JDepobZgeYg4GMIDsm9rzZQVYwntq8C7BB6jhF0kjM
RFocyYOc10ldFOncqtPFMvTX8Kjn7db9LJS0IxZYdQS/XZom5HZp/+gfrUHrXoG1R5XiHKjp
V1gmywxVoyGGjIXq0jgdKi9Vf8gvjcnAl/IvEU95y52EbVnTmeZ0+LOkkjQA5v4gqr09K5eS
Q0JOhPpAqWQABR5vcLz0Af92vaKgmVHAKSbQjWM066ebtI2nQ/ApxEXbJxrAnt6+f76/vcJj
DdMt3i/Fj5ffvp8gCBcItR1K/vzx4+390wzkvUTW+Ty+fVP1vrwC+uys5gJVd/o+Pp8hAZlG
T52GZ3BmdV2nHX2X6RkYZ4d/f/7x9vL903BzV5OsGBArDNGEjukd7O/N1Va3+SnUk7G1sf2P
/335fPqd/kh4FZ568afmobN+d23TOEJWRbjjWSioUwYIO6fIvrf/enp8f7759v7y/NsZ9e8B
9KjkeoWqx7fBpluOlcLiEKa465en/nC8KWzP2UMXhZTwtDQveQSG1FwJevftWGcliq3vIUp0
Qa8dqSs8j1iKQgHVxafrHkP59et9v9iJAV7f1IJ8nzoan3QUj9nJEaR9JCN4lWVCKr69YmMj
Ru+nUjqwdBz5dC9RBGOWAPKEmYrQ4Tt2gH4/uJF/YTq30tH0jR64Mx3qQ+MsqKFXA0YoqgR9
ufZofqxwxFQHh83Wl1UsB4RMkiPWZEz7qffEekkSzY3pwSExt5JGHM/aAfp4SCEfdiBSUQvT
PF3xHXKM7X63wg9nMGlGJPawLDMFkaGw+fodhKzroE29imJzlQEq5uriHF/iwNFs88015jvp
GHK0r7ME0jjRy8MsMp4YheK/Zj6+VRH2Mdfkx9nlrvixmtbQFxR3Z6fj6qKLcZL7CTB1rgO1
JcmR9kjWbDZ329tZRa3nm5bLAZoXUJ8BN11Gtb+oXruZ2njqJJjOV0rJofg/VYJmFPLSTj8z
YXA6sz4SDclpfXBafkhT+EFLnT1RTH+IAQ38mJSR+mCiXPoNnYx4ID5knGbcBgLQW14kiKrg
cn/yK3jZ0CmfB3zF6B6GUVVkoAkLo6MjbZWSAkFKAJmAttt2mtZrE35thJXEs9zp744ZNxiv
QaBR0OE5lPlMQRFSRINS2kAI16mbJDllZACHRsYsUIelKVxpaGgBOpcdEqgXA41xVKPgfRnc
0cm5izzN0Nx1TO3Lx5NxJg48As9lUUkl68plelz4OAQyWvtrJdqXZA41dfFlD/YLniLIIO8G
vcETddM68mnXIs70V6WM16HcLn25Whge2+pKSAt4N7GFFKjCeuMrURdMSiblKyO53Sx8Zjlc
y9TfLhZLsmsd0qcTfA7zVyui9foyTZB4d3dUusyBQPdua6q1kiy8Xa6RU3okvdsNna68BKtj
cqBtOCmrazVPLQ/LJfHk1tRb12mBJIa5VNBTNfDaTNPKKLbZ+qGaY8lyQeNCHy6c2UHAubpz
M0NuGhaBhqtDykf+EROYckrqsV0yTGNBdeCMNbebu/UMvl2GzS0BbZrVLdG2iOp2s01K7njS
oCfj3FssVuQGtsZszFFw5y1mW6VPYfXn48eN+P7x+f7z3/oppY/fFcP7fPP5/vj9A+q5eX35
fr55VkfByw/403zctO0DSMZ0V//vyqhDpWcTpzMFrAc6s3NJa4a7hHeZI53hiG0dB/1EUDc0
xbETfI4ZoV8Q3z/PrzeZWp7/cfN+fn38VOM1xfWhiqJ08pGXqjAWQJjQJjMI11STFEKqntDx
0AGQVJD2+DrFQdKnQcIClrOW0e+9orsCKekETsOpfs7mELIUDNrw2ZbVKQwyM+ajYiKCd8DR
i16dBdMsg9+uAYjmw+OR3dTN9u11uX//rpbmH/+8+Xz8cf7nTRj9S+2nfxgGn4F5Mp8pSKoO
VlPMBZkffSyCAxwHqMM8rwcw3mHUlQAE6m+Q4WvraRkJerrdjjY6a7TOtKflQzQ79bBzcfJi
XQJyiMJHcHc3Dq9RCP3fGRFqBxLbzT+2hqcikGw+VkDBI/eQucxZbVWO1U6Pulpjns3hSZsr
3OOJEnJ3UAscscyUQ4Gxyob1hHL0d29+dmm6EBjC+VmFQLBlFjOIN4fMiVZr/IxLRDPFE1pr
yh9QPWF6kLaJWBsiKJPaIONkQzK++TxEyPQZuXNk60pibB4ayLt8KeARr2TQSiuy6Q0ClSiJ
payENEMFI62ml0KNDNRB6itarcDjwpUoSU9ChR4yBE0QmbMSP7KugDqPljq5jgLCay2/XajG
nkcTeaqEWh6XKHhA7TxAVPZ4dL4omjgTkJAQ9RuCHEAhZ+VMUBhYVVbVX3lFBl1l02JDVYzQ
9j51IPCJjFAJ7bmWjQ/hobVycPCtCgeP4bpwnUqWbidO2Z4/oI4rkbnLrWPW0QH1/+KHtiqK
WhtYJfn27USvGGmrok5v7uoqfCq9UhxRedmU4Ydot5crcSKKOlSFrIREAIMkVaZyD2AlvrwH
r61JKjYEKzhkOzit2D1IKqEPODPfeMvt6ubv8cv7+aT+/YPi0mJRcbCX03X3yDYv5AN5zF9s
xjhCWajms5BJr4p1OHd2geu2X6StxijyyOWqr8VtEgPD2B1YRatY+L1ONOsyXWsNgxNVc4cw
qEZ9dD3xJUon6ti4MKCJdmi7A8WuW4EfUzFHRLrqn3QIoGpcwFgVdkbtYQ0f6A4qeHvUH60q
pGJWHMLFFUVZ7ljqeZq5ckxVYU7mVoDAkn7JIQELwM61AlhXoG0f2GLLBAaW524cbKjOacVJ
8pU5bNyAzAW8a0CvUsArkfruzl/Tmg8gYFnApGSR47lcIEmKSnx1zTO0QYc66+HBI3GLBf3V
dd1ulFprxTycMXpRovXLt58gIMrOzsmMxHzIbjpYrv9iEcOTAzIQWik/1E2mJqldhviVYp7S
+q9luPZox8RjUdWcVnDUD2VS0JrUqQcsYmWNb7cepN+1iQUpGpkVKFYPHaC89pYe5UxmFkpZ
qBmpBIkaqQgL6fLMH4vW3H4ChLuUWb2mo5bXBpGxr0VOfqLuGa+pxizaeJ7nVManFzxMVK1L
eu/k4pb+vJDVvtmRZkWzj+p+yWvB6AFUIQ2HhVlY51bq2tspnYwfEK5Nl3quj3JtdRwU64t4
5Q7S5sFmQ77kZBQOqoJF1rYKVnSscRBmcOfR10GQN/RkhK7VVotdkdMbGCqjd2n3mI+tczUL
urytpwGH1sssQU7Jv0YZKJDj5+fUbe0KEhsLHYX50qWJSngqsVDYg9qaXjgjmp6vEU1/uAl9
dMV1DD1TctQBu2rKzfbPK4soVHwxGo19whBFdF4xtGrDplWiokOeoRkKo8IIn8pd4phUuLL7
DKV6d8GpodSn7YLykEf2YTWvD17txKFBAfev9p1/hYdpyaXSvQxBopIDO3FBosTGXzcNjepd
xqdvRT8aB+CFTedgJsSOVtkq+JEOExSNq4h9fE+YlbN1+nz5kl35WBmrjhw/GJ0ds5nf9LAA
9ju6fbl/cIVvDQ2pVlheoHWRpc1K7RNaFEib9cxeYmLl6SI6Pl3pjwgrvAj2crNZ0ec3oNb0
qdShVIu0RnIvv6paZzp/uj9FvwWMMyT0N19uaQOlQjb+SmFptJrtu9Xyyr2pW5UcP02VyTBs
i5CnRU0oLYhKHipcXv32Fo6VEnOW5ld6lbPa7lMPolkhuVlu/CvnM0TJVlZeW+k71vmxIdMm
4uqqIi8y+ljKcd+FYsh4r+TUj0PbHMS8hs1yu8Bnub9wfGiF2jttSpDtlxaPTtFm8efyyiiP
IhLogtK5wSNO6p2NgsUezQCYuF1nGjyrduWi7BIVqlnbidxyGWD6ZSKy4gcOfoCxuCLOlDyX
8EIA+SHv02KHE6Xdp2zZOJyL7lMno6fqbHjeutD3zlD3oSMHsC5miEe9D8EYbYUFjtgqu7rI
qggNrbpdrK7sooqDfIS4BebQ5Wy85dahsgBUXdBbr9p4t9trnVCrgEnyg1UQO4qMHB3kco2S
ZYq3QVp9CZewLbMRJTm/JzsC+WmrWP1DLLN0aO0UHLxlw2uytxQpfptShlt/sfSulcL2OSG3
jrNEobztlTUgM4nfPc/CrbeluW5eitBztaXq2XqeQ8YB5OraoS6LUB3pvKFVJbLW1xvqa51B
Rpvrn/WQ42OmLB8y7khoD0vH4U0YQvisQ/2Wi8OVTjzkRamEPcSbn8K2SXd0LLBRtubJoUZn
cAe5UgqXgJdNFZsFSeykw+Jap2SYq1HnEV8g6mdbJa5H4AB7hPdBaDOHUe1JfM2xYaKDtKe1
a8GNBMtrGoHOHcqsvHeQYo1wn7g9TZqquXbRxFFErwbF+ZWOdQKxYIH9IPXEbSlm/VKCXfX1
UkELGh0PDCzsdrvOaDahtOTHCVHScEkLnBDx2kVrz3TfgFJCLz1hgNwrIc+hPAN0Cbksbb8e
A1/V6cZzePlNeJrzBzxw0hvHlQ949c+lEQK0KBP6vDl1Z7nxa1KxZt0tS+HqBF+/yaUXdetk
PWMOyUozM4jaRBnaMQI7qD0IlBWYbaMqdZehM7YA7zJ6qVVCZmsqp4hZ6STKUkhIROac04rh
kEmEG1keCmkaTU2E+dSLCa8d9F8fIpOjMVFaU8tzrSjSZoXTS8aaG7Bsvp4/Pm6C97fH52/w
giwRO9GF+Qp/tVhkc7ey3kBxtUKjPvK4NxJVEfvbwMZsz1OH1mOiYvXmtor9Jb1lDcJMUa2+
rK7ShaG/drgCo2ZdfncmURTf+Q41gdki2/je9f6Hlb+gz12DKjlJQbMXx6wBCwF90xy+iFoe
WodDQWfcdlWsDcxErPHUPRk5HO4NVuyYtWWQImlhgM3PrN6T88fPT6cbosjLg5lnDX4OOSgQ
LI7hyYcU5b3tMJCqpItBQeDuGYo9fklAYzIGz+XsjXd4Dx/n91fYHS/fP8/vvz5aO64vVsDj
UY4sMB3Jl+LBIkBofiT6yY9dwkpjslyR3F2BPX8Iii7UsocPELWSy7XaFUgFhnAbOj7FIqKE
tYmk3gcR2cJ97S3WFBuGKO7o7t3Xvnd7sXDU5wmqbjdrYuzpvuuXDd+VpmMMAuulw+nB1CG7
XXm3l6dLEW1W3uZSr7vFRvU32yz9pQOxpBDqRL9brrdkd7OQsphO6LLyfI+oM+en2rR5jgjI
FQXKWEk210vXl5qUdXFiJ+z3NSEP+d4RiTRNbua3dXEIE+t1hhndKV0tlgtiDE1NLwlQkLY8
nJ0LRfdS88RMA6AtJX01dFjJK0FmeuzQXTJLGMW84iDM1ts7WsruKMIHVtJ3SYfnwFMInxIc
OwI1MCsuse9WLRp3p0FDFmTETISetygZpdfqCI6yaRpmWKA7MN6C/bw95KyERznsuAQbbV3g
9nkLD3ug62iAtSxnVo5vgmZJDWZCRwZvN0LDIsCG6RGzi30qRdCEr0x7GAK3GYk5CHVCZfjZ
zBGreW4rsdycSoqInyC3H6UxG6nqLAqJDgitHXYiWpTmx0b6S59AnlhVCdOrdcRkbKdNSgRK
u7sWVUDOg0YGrgR9Exmkh7syCycRqR9EB74mPE8O9GePAurGnD4iy3hYUKOqD1VQ7CoWNwSS
yfXC88gGgc84kE74I0lTmk/cIrDipVwYzHkZnyzdq5Wm7m66P6XUpaVD3THRNZXDqDlQxFKw
WwfHrre8TolOKcF7NBy1Mqy4mVLOAILLd8krHFdv4jebMtvcLpCmyMSzSN5tVtT7E5jqbnN3
R7egcVt3/YC1D/VLpK5ZR6SgDGgz0osE0R0UUySaUFR034ODEoG8pavzGu1vr3YHjKLwSLII
8816QTs9IfqHTVhnzHOIhXPSnedRvCQmrGtZ2v7VcwKUXYHAd5kWHH0BipXbqG0SR2y7WFIK
EUQE12JV0B1KWFbKRLjGw7mpqUCYHUshuZhmZVyD4U24XJBaVpOqF1HpdnZFEQnnzkrUPcXJ
rPIGkUiF77l3p7yVD3e3lO0E9eOQf3VN0r6Ofc93bF1umWowjnx3yKA4MbDunTYLM356TmDx
QyaBkgA8b7Og3RYQYaguj6sfK8uk563ovqjzIoZXt0XpIhi4Wuor5bwRjlWa7e8837kG6rDk
lBYCHeE8txLsoO8Q1W1cr5vFLY3Xf1eQz+MC/iQc10f9f4xdyXbcuJLd91do190Ld3Emc1EL
JslM0SKYNMEcpE0elaVX1mm75GOrXrv+vhEABwCMILXwkHEvQQDEEBgiorymzPfDy7XjxLiw
NH6e8y6JLxd6UJEb5wfWHHjZEU2UZa4fJz79vOrONN6k9ceSKD3gPqOxslsAC6nP0PhCvwM4
ZxnUqm4sN3t9u9DqJCG393ZnmQBPO2l1XUlof+h0BxE2/BGcAi98QzEaLIAeMRAD+HAP11DK
pbQ7cDcRhIbubZMWeqBMI+X3CzUg/192nks0M/GZ5HRxoDqyIHgzi3qSh7kHmLOIQbnJUuJD
tezaEWoeL6sizanc85K/SwPjnesRl7lNGtuhvuYN0rENiJYvoJ1Y4fimVyeDcUkiMzaFUX0N
j0Inxq5o6bSHoos8j/jiD9ZC0Kjnwy3rdT9SNSw/8ZA4cOt3X0pO3Xop5yqU3C29ffzxJB2J
lb8dbgZz6v6poXX2PxEvThZD/ryWiRN4tlD8bfp7UuKsS7wsdo39TIU0aUttb/WErLS2lQy4
KrcCtt+nwkkZot60QZHtd3APbDMXciEqxd7dMnC1R6pn5GhVGixtzaoZJNeah2GCyCujmY7i
gh1d5w7XbEbSjs2Un/68C2sKkyMI5ARC7e9/efzx+Bmicc388XS6rfVJK2CmTNZUXGYVsFp3
eN8NhEl2e57LBG8SQ4Tw3AglCMF4N8m16cyrIspXihQjH63KpcuKY3cAL3y/Dw4Hnn+8PH6d
+9lW2r6KuZwZQbcVkHjhrGX34mteNC1cai9gn1jWANGGhgeUpzI0LTcKQye9nlIhojy56fwd
7Hphu2w6aVbfRu4NDxZ6LnVftzpQXNKWyj+TKhm2R6mz6vYKPra1AOY62gpttmTFEkVGgs7N
wwojG2kNXvtbdJ7RidK/n+n2z/y0nYyXZ3qTMjKLeg420jgbMd9MiEy285IEm6J0UtUYEbL1
8pdji69f//oAMpGIbPrSEQliltw/LhZVPm4sYBAus/fC16oMNd0CyGY4EsZm4VoMc1tCE2pp
2gX5SLj76uEKrMPwEDQ9g2dZfUFdewy4G5Uc1i9o9kaYRsyFzwy19lJ6XHSNbdHmKWHp27P6
qfBjl4IJNj3tTVSbZpLK3SW6RNgQCFefl581rO0mGdkeABNNQXZf0RTsF7YNrmP28I6Lj9us
FVqyynpXFZflzMOA9uD6IVJy3ti27YMnFnOSsVPMurYaToHsNGvlWye3zOZ7Un3dczME2eHh
QBkNgMfJrsPtraXXUjpEnYK5ZTbVZxF8oxC+zVt5BmPM0c3wmTF+Y3nL7K3R6SfKhpVCZa3z
ygxJysATEzgYh8BTFtAItWTmOUUh4PHtSrnQUKnKe4fqbGln+BiRsBnRRol4SZhDAXqG0Eg5
GmxXZQkcuB92OyvZ7SwjSAJChWrhor+2JzGKZJBmoayyAkWtq2wTkOregCbxvjiY5pUTdEKd
XOt4H0qhR/LOvEADZ8RlRvhj5If6ntjgZ2fL4f3wSPZLrJatU9cmS2I/+mVJa6EwmhJR66rG
xtcIyR3Dw9Gd2tSgihUK4nBZT4k0cb1t0FMd0fL32W0BZ2XwOY3VZSb+NIQXy6LKwEsKCl7K
qrqnvMbNlwT/MRZONav2CPEemqNZcA3bHg6d8oM9vwzlZcgdKH1OBP+6IBGKdVvsS10xB6m8
wCBGcWMkBQA2DVO0UwModD7z6pEQsuNl0JjY31/fXr5/ff4lig1ZzL68fEfzCQ9ZDWaQVl0W
+E5k5wugJks3YYCv7UzOL6IAwBDVgSXOqkvWVPi0tFguPf3euzmsncySpdX+sNU3SwehyO9Q
e5DyuP4E79VTzfX+7W84A/mX159vKw75VfKlG/r4qdiIR4SP1AG/LOAsj0P8ZlMPg3ODJfzK
CI0E8JI6oJAg5YhPgYwIQy7Apiwv+H4ioLXcnqIzpczeRNM9khRe8jDc0NUu8Ii6v6rgTURs
cAn4RLg06bGmnQctgKGAaiM8Y4jTTBhd/vn59vzt5g9woq4evfmvb6Ldff3n5vnbH89PT89P
N7/1rA9iofRZdIn/tlPPxOgouznRHfOCl/taeu80VwIWyCsxQ5EoqCkQjsXu1TqFsIEEWrH3
HLq5FKw4YTtbgNma6CBTPvaEavBR+ponnr4rWFPlZqkOw1U5vcFmqV5Eo6kw4/AAZKN9inK0
+0vMQH8JjVpAv6nB4/Hp8fsbPWjk5QEugx2JXWuZIeVGnihWe9geut3x4eF6EPqcmbkuhQtz
p9mX6sr6nvRsqlq2GFblnDVrrIe3L2pU7suntVhzyoF6tKIXyTaqLvFdVWgmXHdSilBqB9Mc
9gWpcdvqaniUHgnN27cU9W6F5w0b/COStwEmCkwwKxTS662mYWjP+dgdQeM4ARyPyqRNkYp+
acmkgqh2F8UQxR5/QsPMpoltdnNZejWVq24zJTC+gn+VHbCJiWl3m9ZWdrbHDpYDlXGtFIDe
mQleSm1IsZ/Lz7AfiDcfBVNjUA9DVA0Sry/NFVbc1h0djWEqUyCpWOxcq6oxpQfV2+zsN5eU
iosAMFjKwmUb4uU8cxMxqzmenawYAUrCCZxsAJeSMHoVYCd0o6rc7WCfhCRdiICYEhuGQk32
cF9/Ys11/8neIoJGxOaji2yXmvaHbf9BQY7zaAfw6BAyo2/bP+3nxB/KEkB+wtHXYoH6xJTV
VBWRd3FmNV8Ri7qGaZ31lps/jHWBOhvjeniqMTKXFH99ATfiWoQ4cHF8q/u2bcwQs+In6Qu2
7pqerpTdhg8vwCodUhKtAzwm3MkVHbpJMnLkkYaRrQHBQq5MqK27jFn7E2LVPL69/phr6V0j
Mv76+X/nCx8BXd0wSa5Z73lTzdEyfuNNb4wJ1iN10Z0P7Z20roXC8S5lDbiRfHsVuXi+ETOe
mMafXiA+jpjb5dt+/g/1Hug/WtFN7M6cjC20zLvEa3x8CTDnZkScAZN4Ymd0xplXnJZEWcPe
H/KR4QsZpwS9QAZAl+5kVQjh0PV0xtWMPzM8VLafTF9DapK0FT2ZAr/nO2wvT4J9HCbzDcry
wpmWy8/fXn/8c/Pt8ft3oU3LtoZoZSq7LG+wEUCC+TlttrP8wWETfgyqZXDULGlmSQy/qkTb
JOLojQAFF/WDugVnPna6JCG+QpKwGrlpHJaOOztbw1qdrlTVP0XL+tCjcMhrVbv+ml3sJsll
lvmyS2I6bxz1iTNAvuvOEzyXNTiKpR47czfKgkQ+NvSVpUKMazgpff71XYwpaJuaW3LNG6uD
NWHvgkvN40B17A/7Mb7N76Uof5eE8byOuqbMvMS2m9SUVauwqoPt8nklzKrAs8uYSqeiqSXd
5pswdtn5ZMntdZwUVo2/CfyZMInnVZFWTLfv7UvLozCJbK4Ub1w7v73Ys8W2QdMgBWculvTM
ks0m0JsYUndjTMi1hrWw86OqsqOM5lVrqq7lYWHQoRTCHiyvELvxShjdDaRCsTx8L0iy2jzz
PdsLiRbMEqse0PpWqkeeA28I7yZa18OuHys48/0ksT9hU/IDb2cd59LCfXcfLQSSWWXHKpbi
K4XAV+RjykgKdiPZ79tin3aEd19VUKEvHLFFx1m7+Xx24dhrmFPdD//30i/DEZ1bcNVCVNpT
HrB5a6Lk3As2jvEiDUk8HHHPhkY1QbYuiVD4Hg/fghRKLyz/+vhv/c6RSFBtH4BTVmZkU8m5
dTQzAlAwwo7C5GCzhsHQb3yaj0YE4BFPJE5I5pXYRzU5WD8yGVReff+a6UfwJphQ2QodomGN
jDhx8FTjxKVSTQriHqxJcuOlJtQ3lXE1IKNepydjlSadh2UNuqSS/LbgugtqTQh/d2k7A/mx
acy9Fl1OrgkNkozkpyWcpwrXUxUDZ7LxQgUQJ3q8W4C3KewL3Y/mWygJ1rgQkwS0ByfC57kh
oezsOYS37YECnx01WdcJeoMx5C4h9+ZyvjV91/bF4Fv8ttwQeoXCh2S3n7yY8ns3ZgmskrAy
ppfGg6Whyss8z2CqEhv6ioUYe04G5qGOw4dSC0VTfDy96w9IyRtIeA7I1uX4WB2CaufFC6+z
l5BTmrKSF9tZ1flRiI1iWsbcINQNBTUkjqMNUkrx1QI3vBCA6WJSh7wQX/zonNjHbuJrjDDB
X8DZ1g+WqlFdQd8gzWGfHvcFnB57mwDpE20XOj766dpuExCL0YEizwiEStPgd7HHguWbzQZ1
RmSNXfKnUKFyW9Tv7KstCHUJ8fFNrOqwa7d9iMlt2R33x1YzlZtBRrFHNI99F59QNErwHgqm
DEwE5jq6ywgTCCkgooANAfguXkrmujHeYjXOxkPdW06MLr7oyy4d8O2b+xMUoNajJoPItoAi
/Ea9xojpN8d4ix453F+OXMqzOPLwvF3K6y6tQekWKjRxYtZz7xJwR79McZ1Vzi5lbni7MG2P
eWM5eNBt95injykqa1MVnGXI55TO9NBC86ZAHbGOhO7SIK0855GHtBuI+Yp1iryoKjEIMiwL
ZXgHIVGWKyp2hbqMebHXGYm322Nv2MWhH4fU1XnF6a0GRSNDTwKHlHh2y3L0HZ1Y6Ry71Ipm
ZbH2VegmHK0GAXkOeUO55wh9Cr9cPuLevPJvy9vI9ZGvVW5Zqt/+0+SN6c5++lYhcRNc4XB2
C60eSbNL4rn0YxYgGRb9oXU9rH3JGIP7AsuamiGXRwfFiUnbNZtHuQ4weKjzWI0htBGkRwDg
ucg0IQEPqRUJBNQTEVZbEkAHO2kp7WK6l86InCikno5czKmHwYiSeZ4A2CAtQW4exZ5HvE5g
xJpYI0Vi7FnOUxT5G+INURQszUuSESKVLAG6RBvskazxHXwS6rIoXNNMMupAe/jsLMKcnE9w
jLUVFvuoFGtwLI7RLsjiJZWpYgn64gTV44R8pTMz4rhiIix3TaEdYdnZENnZhJ6//Gkkh7jH
aXKwZcQ4+smbyOhsDVDgLZe67jK1P1Zyag9ypGad6KP4KajOieOl/AqGWMUjVQnAxgmwgtRN
xuILbs00FHWXhBtt4GzY1gxRMzIZbnugq8pejI5j26K6Njv0OsE0FV6z3a5B31zWvDmKdXXD
m6UMlK0fenh3F1DiRMutqmwbHgbEndGRxKsoERrMYnv3QidC1h9yFosTtNUrCO4WHytyT1tj
+4m71Fb6SQVtE2rKWCmnIHnOO6YCQSKil5jDc7KSWz8IArQrwp5JRLiLHFvmpRDT5NIYJJb9
gRNgs71AQj+KkVXhMcs3joOMpAB4uJp/yZtCaFSLuX2oIsrMTxH4beei3UgA3nJlC4aP3V3X
8AztIMilY3tpwQqhGyDzbyFU+sBBJjUBeC4BRLCtOUfAN38QMzyLPbZZUh8UaetjioJYU4SR
NBpkzDQ01nAPnXEl5GPetkZG1/EYU0DFaiyK0G2KzPWSPHER5U069/IoIMZ2Q0SVJtiKsKxT
z0F1MUAWpwZB8D0szS6LA0R6yzJMcetY42LTlpQjrUPKkbILeYC1GZATSh5rQndJRYOYAFlz
7FdSs+cFHCXR0kLw1LkevgNz6hLPX+6s58SPYx/3DKlzEpdy4TBxNu/heEsbEJKBfA4pR9qv
ksNODtysQvFKDPsdp6CoRjcRBCg64e3SHoSiFLe7YZOTslAYewcYM71j96e7cwiHbaDoWT7J
lAgCk3YlOA1EHav0pIIV7b6owWdCb2aogpFfGf/dscnDZu/sVRDEG9wOXiHuPL7NMlDzQtkQ
7A8nkcOiuZ5LNOwoxt+lZavM87FM6Exww6G8Xi4kPUsSwccs4jDcv772l7BnGXp3RiB6oPST
8fvo5frt+SvchvzxDfNMIU0z1QfLqtQcIhTGD9k17/jwBv3dU7sUVD9wLsh79NSAgqUzHsAu
pmVnDEzDlxLDSz4UfDCVnT7GILHMbEZxfTin9wfdg/oIKZthaYx4LWpovjnCAjfP8q4qJOLM
YHlXcvhs58e3z1+eXv+8aX48v718e379++1m/ypK8NerdVtjeLxpiz5taC2zzzQmOHN4Pg0R
h12HmhBPp51F/eBEm2XSOU87cL6GtNI+xItW9+NTD2XZwvn8YtK94cGSnXN+Rj5tf8sLfTHs
ufiXy/KLRd0el96aZp+OZVtAsae3pvkJQk+IZqrEY2ppVTKwOrRrySDEruMS1Vhss6tYHQV2
unJnOynIZHkDwX2EaoPZmnGR6K7smsxDq6k4toehLMjT5TYWKRvFhx1h867VOd2JIYzKXRn5
jlPwLU0oQLMlUVEsKnOd0Ce9nV1dICaTu22Wvre6z2iWlwtdd6yDqc6VXRSeMbkH4/r2M/XJ
/kYjFDkLVSA+odAaZi/T8dgLqMwIJTG0SsTA9Zy6kDsrl8D8eBsvVGH3iYl1LQmDYkphg4JE
ZFXASRzvzNwK4WYmhPiGD7O8i6ZeNGKR5C/3+rrcOD5d3XWZxY6bEHkE1x6p5/bvVnMxTz/8
8fjz+WkajbPHH0/adNxk6BBVggnPGdd+rbcP90+pF43PgVu0bGUg7yx7rOHi40op4BZANh+F
OfjDPHBebi2XOqjX+W3GUp2uic1fMvSRvNKKs0ccEwvtxhIrnwo9f8yjhPiuSjl2c11/EILL
XTNWz54ecNzUV1EKLT6JNKn6199/fQYTlsGl2kyBY7t8UFim9gIyHlJ27QDD2TZ6ZNOwMsNi
m8iH0s5LYmchcLAgyUgLDrrolvD8hrhM+tJ4utunSWa6bJBF661RLfcuADHwBIEtZmWx5AWr
i/0MSEOPPJ/TKNRR30ih6xvgiIhtMcD45nkPUxHYJFzV2H6RrJDMhXirZgX2QtMmVQfsMBE7
6YUg8rBTutsOrJ15mWnrapCJNNSVfyMZpbp/Oqbt3WgKjparajLSqgYw0rfBuGiBT/4OyjW7
7c7vJeZgGUp+B8UHv2lyNf4eHmXwKmmfeOThx3MAf0zrBzHQHHJ0PAGGbXUBMnlp05l1bSXG
9kZHNLL75/xGXS8dbtNZXVPIkwDbqurhZOPM04KrqkhSyWaDH11NOL6fLvEu8omo4AO8lHpR
7zx3y7C7HcXDxfKRC09MdgCmHFYVpmR+4XKQwF4qIrWvTMpk5yYZOjq75CelWdiFCfVxeJFZ
q2IpLYM4uqCzD2chapohsbv7RLQbb/4M4ZQ23V5CZz7r6I/e80zf7QaZ4T3cqDxAbdsjJUvi
JJmlUjH7Iw3WSJOm2/DIdUK8r6rrmPiWW+8s2K4KJU+wvfgJ3sw6MciTAL2zNpTFsq4aUzPs
qEapYUalSWffbpBTAZJ0imVV3mNiTEKNEIal+7z5DUh6zA3v28p2C3ngXLle7CNAxfxw3iVW
XCFKilzhkPDMglNXbmz7OU04V3kGAKm7jAdxRVhoyVIzsein1AMA7W8szdxiRJbYrxbSgAqr
q2DfvSxqTT1lSfcCSugsNCzELG9Jcx4eHY+h9VKNwoWgsBNnV14K8ZUPVZfu8UYyccEx3VH6
Fa35kRGb9BMdNnvlXu97HxBT9D4hfCIZLJj938OKHHwKnGhp1iVJhOu8GisPfWIu1khS1V8h
jUuHFZ5S89dJVIRRi4QfcGmtIK3FSovQ/ScaqelOlJJXG58wLTNYkRe7uB+ViSYGtWi1FmAa
jNcKKEn42kUnJTGhrJqk1YpS0/Aaqct8K3gmwYpifICeWIMe+w5aSIz2BiuJgrWMSRahgpqs
zWo37JXk97CIKN0GSyrv76El3mpdqHvQ72Alm9WcNUkSrlar0NxX+6tS39ZIGRFMW6coHXyN
tjs+FO7qmNucksRZbRGSlbyLtVljSRNGcHWzwlMLhhUS91iTEvetTBZf/UA8ZEkcrTX7YRmx
Rqv2cOixVhlwRcqNiPgiBi3yqLWjSQsdb63SsFghJG31e0qa+64ihF7wrpeuKxTDMuF9tNW8
KZV+haUUPkQbbLPZYlSIGNGTq5IIkNhmvavnlhglst5fMmESWoD3y0wsmcEoF3cCqDg9rqna
uliol5XhDm5At3l7ku5TeVEV2Xi6wJ6fXh4Hbfftn+9mXO0+VykDb+xIxiyiCuh67U6rhcjL
fdmB5/iTVh4rtTYFNxKr1ZG3dBKDD5535F2aL6O00f3NrKaGnJzKvDhcDf+9fc0dpCWX4Rk8
P22HBier+vTy9PwaVC9//f3r5vU7LD60jXqV8imotGtik8zectUQ+OCF+ODEGkkx0/xEWogr
hlqssLKGIT2t97oLTcXojrVeOincHnfgBgmRnlhaVYdMX3dh5deapuaNd1Y7diVD3RpLOioF
mX7+8ufL2+PXm+6kpTzWEHwmZo0CGlTrdvqSm15EfaaN6Hz8dzcyE4KokLAZLCsSuw4lSQV4
S+aic5aH+lodOIc4z/r3BdaxKrBlZl9ipEx6Nx/PgVQF9O5n//Xy9e35x/PTzeNPkdrX589v
8P+3m//cSeDm2/+zdmVNbuNI+q/oadodOx2mqLN2wg+8RKGLlwlQh18Yclm2K7oOj6q82/73
iwR44EjIPTP74HApPwDEmUgkEplq5l/M7odgZeMClNY9T6eH5y9vP42VAa8lVgSfbhI2nmbR
qVL7mW/OWwnW2OFepogO/myq3mBo5FZ1PaEjcgbpMzxferruW6VDDrUa5tRCWy4GUg0O1xFM
/54DmYQQ2lN9WdlDgaGXV7LAf45njWYqfE9TUnkr1DK7T9HkrPVUnVAPRAfZTqtMASAhwI1k
+Y12wzfWiO8fO6zcXbXy0NctagIfKTKt1hW9telFueO7A/zpY99jDJDr3ceY73m4X+s+DcQ8
DnAZdxjpzY3nOOf3SaqI7bh0i6uVhursfVy3NwwNEQ99W+YjHc92i6mHDHTwYempUVmH/kmi
bUFoMPSgORxor0JbHc491CSoN4QhQXGkSYKW3izxVxFqYzykMVHCBXl0uSXRdIk9PRtmV7Ze
Tu0CszzxF9i6yQ/ZdDqlGxupWeavD4cGGZtdyM83Nv1DPJ3pccEBERO3DZs4TXC5aEzEBVuk
aTSn8rP1Tv9m6Ee+cKoblZXN5kwU43kBlYbx0gjx/PHu9Ph3YKZvTtrO8qvBXQ0GneS+4Q1N
OhJ7/vwqPEp/On++f+Jb3eX06f4ZZ9RiMpCaVpqLHaBug+i2xmyxxehR4i+M+1IpkEbkpxKt
fIXRx23re+Hu+fER9NJiF3YJirCLzafWtsd2g7vrjh4dqzrhAsaG1HnndNkQ1XzjymOkI9Ko
oOdJXlamfChzDFKfBcVgIZO6Z8iVuWP6ws7hsU5QlG0esx1GrzW5UxeJ9CGASNecf0QkywJw
7yNOT/qR6fR0d//wcLr8QKxr5GGIsUD4h5VWXLXwpdgN3+n76/Nvg6j18cfkl4BTJMEu+Rdz
mEndSf6i6NN3Pn3/PvkfkKOFl1s5n8fPvfwb3xuPJqJI8Q2+PO6edV+Pw7RbrMUrtcFT3//D
12U/Q2GB9KyvLfHoEPvrtSedfNe7K0c2rQR9jPrDiyiYfX8avff/+0OklAxxBCrVskzFWBys
ffVxtgWuDk5wytGpE71Zq64OVJAzJi24uYZxKeXg+CRgS0ddBTbDsfdsqomFKnaIfE8V/HVs
ob0w1LG5E+PbJs+4oNfQlaU76dBoPqdrz9ESeNI5VZ+rqeAm4r3qX8EchcqRdOVM3O3cRHzF
ueZOE9w4B5lvTNOFY3LUa98bznBwrNlc+NEZ1tJ/upLhavXllTOS0+XT5M3L6fX88HD/ev51
8rn7gnE2oiz01jfK09OOuLRET8p23o33p0VcTqcmNV+vYzqTL+uwat0Jb+H/NeF84nJ+eYV4
ec4KxvXBOCr0izLy49ioDdEnjqhLsV7PVz5GnCkj8Bv9K73F2e98qjp5FIWx2dQony6207mP
dKCvGrAMRLv/Ra9i/e/ZfeF566VBFZOMsHjqWRkEJNoxnVllrf2lcV6TKZcI0Wweo5zJeGqX
ssmbvzLCvDR/5flYw+ZGbYoDW1pN4v2/MHJ/yPjkWxjtcxztY/E2wqvMJvJNz/dMbSJQ51NT
ySgOCjMPI/ooEXSpyNQ15oaQzdtNYrRNnDFAh1Ua01+eq2WGYRCibrk5u1/2tDmp5bxcDXom
RnlBxfPl9eskeDxf7u9OT29vny/n09OEjWP8NhIrm0uFzs/xIeRHdGNcwyifWYezLI3ZbGYm
7agLlLoMTDLvVaPYoFkvfB+jtZo0q9C5HD5IlzT+yxMbHMsHvke1vDqf+du/VCCLwM55OK71
ui8l6+T56eHH5BXkq5e3VZbp+TkB4wagdPJWo1DJz6CdJrc/pk0+P18kl9QLBFuHuW+ctiVx
Zo4EXacHYywDFvKtwlw4hMu43sIYCZ6u5gzGG2oZyVMavCK8fD7dnSdvkmLh+f70VzysnDq3
K98+ntinDPGZ9HL69vX+Dg3gEaSYznqX8hNJreo2JUHordOq0XXWANI9YdE2qUvMUDhWvR/z
H21OQA4PiU6NKz5ZD0p0w1G5AKjwyYhGmRlhmmQbuJvRC77lhzoZEtCmb0IU2ogLEfWpqwWW
u6SWJ1XOe/S6QrjIlstK8XBkxnUmstERqjABME3yVrwjcVTehUE+uuVHbBTdDeGe4Nx1fhLH
tAlfHV/PD9/4XxBDTp1uPIuMOsn3mKU5LDIAWjZdYrelfQKImwQnjRs9jIMFmw8QlLgCrmpK
1l7nmmKnf+urkPWv1gE/iRbOQQny2BVaEOCibHZJ4MbJDepVRvR9akRjBRofSmdZu3yfbvAr
cjHSebBwWB4A3MS4Y0jRSOrQ5MECTYPUv1Lu+4O73LCMtuitVd3HzgUWok/JKiiSbNwTXr49
nH5MqtPT+UEbUANRSwhrEqcJUuqIaIWPTDe83H/6cjYmvLxqIAf+x2G11pi+isaVyoXdZes9
lLAi2BHcxhDwiNR1Q9v3nP1cGfip38x8fIggtBgk2h7Ws8UKf9TXpyEZufEdtl1qmpnDU5ia
Zo7ak/cpcsLPDrP3CnPukTqpgsoIB9xBlK1cFnFKktVs4YhRDJMuLA9C9eSYlFmSBtHRXJUs
vrLs6qmPmw92i8ddF0fcUNGOYGcY+apz5iANNsCEhW9wFJvpZQ3RssSG1cJj8VsjFYRWGgJs
i9WwuZwez5OP3z9/hjB/pj6b741RHmdaKL8N3HExsjmqJLXv+h1P7H9IY6BQ/m9DsqyWpiU6
EJXVkWcPLIDkvHfCjOhZ6JHiZQGAlgWAWtZY8xC6NyFp0SZFTIICr734oqa73sC1xCap6yRu
1XcCQraImlD/PkSSy0i61avLT0JJt1vrJTOSiZry2Z6iw/a1j3mJeMSArhPMBJ10HK1y/DYS
Mh7DpPZddm08QeAwbgKIiwS8A/ENRowlZU6Qy5OOoDEc5DsvxZcQ5DQwZc5KD8/KwKSBMfbg
O0PEfXUM+zTu3zmquWQkYleFarJzYmQ1d3Ztlqy9xQpnMTBZrKgp2kfdwg0MDTu6mJdEXRDF
bQ0BsRiXhhLn7HNxQ+jXpORrlDhn2O2xxm3dOTZzsW74ZFnGZYlvZQCz9dJhVAlrkYsSiXtW
BzUeoV6sM2ehERdTOYt1wWnCOYNjSuY0ajYHbV5ziU/7DR4h0wObL1SVk+h68VhE50EJn1ZF
mSfGHAclgCssqRhguLdwovnKNMrsxCV08xHcKzzd/fFw/+Xr6+RvkyyKezs6K5Ijx9ooCyjt
rCXH1gCSzTee5899pmrpBZBTLoikGz2ijUDYbrbw3u+Q/gZYykoHM5cQj3zMRABQFpf+PDfz
7NLUn8/8ADs2AW6HmgZqkNPZ8maTqtF7uhYtvOntxmypFADNb5csn3GRD2OVw+bk6NcRt0Ir
jpD92G3E7JczVhLkSe4ICq/x6Fwb0wiz832W4ILvmI4G2wB9yq98zoxMp0Hr9dIN6VEBRhCL
aWMlsl/pat0r/ULbuUC4qwP8u5g1uz2qxmNf5as73g+rDDd0HpOF8XLqYX5dld6po0NUFOrJ
6ScLvi9jG4uouZ3y7Onl+YFLPd2hq7sst3gEaKf4n7RUr1Y5kf8l3VHRCOxBoXo/wzmn+5C8
W85/kgpEOEIZBK6Vnrra8Nj7exs/kcdIveImz48/IfP/syYv6Lu1h+N1uafv/MXA2OsgT8Jm
A46RrJIRkFeVcWG6rWouJdfauQhLXZfyxIHzf7T4TlRmwW0CSjR0c/jJ8A5MrkwVgRt+gdP9
5sDl6QIHhHSpccQRi7KG+eZD165Clha1L5uWTaHHWCjsANZbfhaypuaWaPn4zzFGFKuTImW4
AwqesA72yBprkBI7Pm0bNn0734G2HWpmqZghYzAHa7yxDwUtqpsDQmo3G/O7FqNWsYYfyjK9
nDDJbkmh00CjXB9NGuG/jubnuOROA4IrASTepI5AvADnQRRkGRauRGQWF9/WJ6VZlCMPH6K0
LGrNGeNIkx2mJE9AF23SsiRS7bAE7cNtYvRImuQhUR0/COKmzq2pkJU1KVHv4wDzglnZiCHX
st0e8Q0XsH2QsRLfEwDekWRPy4JgCm5Ro2Nt6NeBSsAJn1kLwty1+D0Ia/wkASjbk2KLnuZl
qwvKj9bMrEQW9WHtVGJira8sKcodploSYJkSexX1VPhRVQYvksgGMxYEtG5yvqNUQexr0wWg
9GbuWcT9NkkyiqxPcbrK+Wxwd2vOB7cuXR2XB0fhrEpvG2fsYpLr1JyARyW+T1q1KAvO7xLX
wsv5lknQSVnoTnIUpKxZcqt/nstF4MaTT39t+BQy3uEib8KC7FgYXK/iTIgLKihRKsQQOqL5
UWFneXzWURyJSG12DD84wAuXwvCkq6eBrR0TQAHkbFR2oJaF8qNHU2DG9wKFsEx8D7WzsSTA
gwR1KJ+cfHtClS4iRVNUmR5IQcyy3DX6aZ1woYsSNWx0T7IYLOUCDvu9PHaf6PdvhWplYWRX
mrXhHJAmjtOGwLecwbh7gW3rhjIZe9bRqgY2/LaiM70ye0Lyklms8kCK3MWRPiR1qTe3p1hN
/XCM+eZuLmXp5bndNiFKj3hT4NGv+GXJBJnpb7mPgIwII0MIZF120u2qibvXKxNTYiKrRQ43
oaiMBveTvVSlXEdqaXtAK1WpZbmNSAsqXC79Ss3y2HX6gyiFOLjX1xqcgdxcE2wdipc1WUVa
I/CILKwoXG4BhdV6DbtRQNutyoM0a3z5YoTohKAouPQbJW2R7PsXq/0BLb9/uTs/PJyezs/f
X0SvIw/npEm/dIXdnZvQARXpnO/itGQlw52qdFi733L+ll37EPBb0csQTRI8TeIG+PJxCCtp
w9lfEUtX5O98Fc5HL9li2j2/vMLJpjftiE25W4zVcnXwvG4ktHodYB5xuqMuSQfrQySoNbiN
5ku2ZQxBGYPxo1zaxvIabioH+oZmP6kIosQSg3Bo/Km3rey6QsjX6fJgAxs+cDyPDYiYJ/7U
Bkq0M8qhZuZMLpE6a21urnd+M5359vdotp5OsaEcAN5m16Ks18FyubhZ2cVCPt1LaU8VD5Ph
Lkmddp0/7ujh9PJin/XENI6MMeISQsH0G9lG+E3GtzHxdiu3D5kF353+eyIazMoaLgk+nb+B
Udjk+WlCI0omH7+/TsLsFphHS+PJ4+lHbwd8enh5nnw8T57O50/nT//ghZ61krbnh2/CqOvx
+XKe3D99ftbb1KWzel6SnU+Z1TRwStWEyY4gln1lTZGh6IAFmwDzOKum2nCxRDveqSChsREb
R0X534GLI/VpaBzX3g1eOmCLBY793uQV3ZbM9e0gC5oYU5qqicoi6aV2BL0NanPu9lD/1Ij3
YBS6qpAUvAvCpe/wVyqWo+5+ZVgK5PH05f7pC/52K4+jtXpNImhwctHmAKeSynjvJGk7jOeM
9Bb2EfpujYAFF6gi+m6qQ+A+2OgDyNDE+K2YhN1excTmEheOezzRWMFGYvSptHwMGs3MQQGa
kDuu5MFaIoE0cL4oHNLE4NSsLnVtknRC/XB65RzgcZI+fO/jDUyoKcINBVlMX9YtUO/yO7KP
1NYXzbAqkZ4+fTm/vo2/nx5+u4DK8vH503lyOf/z+/3lLAUfmaSXDSevgq+dn8DQ+JNVTx8E
IVJtwboQrQXaH3Yyl9/XsZyrM0UkYTUotHNCKZc7+fkdO6aJabUlXNxOArO+Pb1t0Di1WpJu
jmCQNXADktPcgYz3U1qNRFR53bvOwBzE4KD7Y0Ppyjc4A5xbVSXmSFPU7Dr/kiiikbUTDY/B
sBICUkdwsXC9iKC+nWnvHhTM1Laqld/O1MjtCiIk520S2HuDxOGdPRcloiRLrojM/WcqLtAd
8Bp0m0C+RuEkr5IURTYsJrznShTcEeNEqmCkCt5fry6p8bpw9mWf3QywZQSv7nrqq68rdGgx
w3snFfYCzobsnSu6T9I015t6mxxpFRRtFZubtIY7anCbUddW0KcoQ8IneIR3Wh6xtnF1i7BQ
wJGSrla+LTEp6HTRVkH985kJieUDVQQ7NM7hLoJdbh3tJVRl/ky9m1egkpHlerF2VPx9FDSY
ok5NwrcDUBY4SqBVVK0PuH2nmixAA4tqHCmp62BPar68KUXbQo95WFqbVgeiCltt1YdJ/bu8
hsXyHzjTKzHzf5VD7R0DIN/H41BeEOmgB/sqZIxQHbhaNVB3tTk+LfaEbsOySPAeo80UkfO7
kWXYZb2SoKni1XoDAUbRwrVYD7DB6SoZxF4QMic5cYQR6FAfM/IVp8i4YY3FtHY0Sc0GZkla
MmcgOZEiwjV7Yo/v9ofouIocIQ1kMhG7y1FZEovLD0PPABtIktnMTdxmxlx4yALcQE4kaPMN
aTcBZfCGBTXlFV1CKP9vl1rS0gC0keM+XfSMSwXBhbUiSnYkrE2fw6K95T6oa1JiKmaRO7FF
9GRLEyZ1ChtyYA3qHV1KVXCtsdnrvXnkGYzpkHwQ3Xww2Duopvj//mJ6MFSOW0oi+GO28Kyj
R4/Nlx5mRiU6ixS3LR+zpG71d0FSVgxKKq9T9cFmOSofVl9/vNzfnR4m2ekH9jAL8lZb5Xa2
6JyWHKKE7MyvgDq23eHBoFmw3ZWQSs00EGVcmdGoxDko1eDKRdF9O1qh5pSnMr2zJG3gKXpT
JLaDEASO+0SzCDDaRm997IQUrQj0HFyo73WNa4f2qoKiyVtpf0J5unEkz5f7b1/PF94LozpW
H8he5diofv3FF+qOprWtV9Y5WlQdAl93wg/UfGcejCx45lrtEA73xjqmhnF0tcggjxeL2dJ9
HOM7oe+vrHI7MnhgcZYt0jg8x4qOK2/x9yyCMaS+59YDSDWvd+UYKU2gek2rOt3RobauR/if
G1xl1B3ev13Od8+P354hKtXd89Pn+y/fLyf0PgMu1NztdNj0iA5qi8itX5Uze+O++Ng0hfAG
eCVJDjadvQL1J8uUwRbmHpK0kzKuJOiUyFeUUeBNNa9K6jLu6HqlvHUYiks8iPLW8YROJhBm
BFdw1zWiROMwxS1cJLxPwshxxy0YQ7BHtVzKFP35DBv2hWOVaKxHEFoWVZiYI8EmovoFDv/d
RpFD8wOgM7KQLHAbzyid+a63Z7JGwhvv2vanBe1lP76df4ukR41vD+c/z5e38Vn5NaH/e/96
9xW79JWlg+vLisxALPAWpjtipWP/1Q+ZNQzAo+XT6fU8yUGnhwjMsj7wcjljuWGoj1XFUaJ2
7QNGkvI9tbXJcIh2sZ3gMhAZ81z1DcF/tGFWqpatA6m7Rn23Hj9BwYVuE7g83/KcIENZQ8qB
tzR+C7mv3HBq5bguXwCj8Va/cRyI7lBWQwpz6tpFZGyT46Vv4P8ZZsYPafYhjc18jGxyuLVy
1skVdIRjUbhy+LQGdCecFecOV5siRQOuQByVbejWmAYNbxtZ8gnkmY2I3m+vdOuWvnfPhpJu
SRiYw6KkyJkx9WRPH5JCi6WU5BD5+9amGOEKz4/Plx/09f7uD2wtDpmaArQZLT8jNjkaz4lW
dWktDDpQrI/9lVndf1zMCcduNCT6XVwrFe1s7Qi+1iesFzeYDgDMLXSrMGGzIN5sYLS2t9Qb
viCwsIZjWwFn6e0ejkNFmti2y/CQwjrriPxK0Da94MDxel6CdLacL/ANXSQQ70fwtTHiuIpi
xLFAYz26nPtWlYHsoSHNBMyF2/n6YLd0X6NenwVWRcHNQtVkqtT+qYUKma8vZMUgjhj6TKhH
F+YnsmqxOBwQE6IB9bFAWCM6QzM51EIdvl44gjP0uBFyRZ+kCT/a5gHJsM5aHHAq1oUALWdm
BjssZ0eOpv6cemtcPSrSDEEBXHUPY37osedTF9mRzl1+FORakO+LXGV34U2M1rAogKAOJjWL
FjeaG+thMSz+NIgl80c3NOP6FuYUHx/un/54M5XuUus0nHQPqb4/gf8NxFJv8mY0cvzV4BAh
KGByq3Py7AChO939whPwjnfjELzKjULY5HWIs1bZVyLmXrdA3Mloms+mc/uyEHqEXe6/fLFZ
Ymc2ZnLh3pqMkVy1KdewkjNiw/BCw7cJF83CBLX80BL+H2NX1ty2jqz/iitPM1U5c7QvtyoP
EElJjLiZpGTZLywdW0lUsS2XJNck8+tvN0CQWBpyHrKou7ESS6PR+JrwM9b4HoffoAthcITc
hCXlkK3JkUuVZEqPPr1vedcd3i547X2+uYj+a0dWsr8IbPn68HPzL+zmy+4EZyNzWDXdmbOk
QNADZ1VEOIqPWpOxRL8q1riw9vsBDddh5IKPd66Mp6aT174jUhfenmKE6TAKHS+xQ/g7Aa0r
oQxDAaxoFSxW6CZZeLnqo8tZROwLpBM55aWHeBFteiTAcjQYTboTm2NoHkhaeqAf3tNE+a70
0+ny2PmkCgCzTFXlVSG6UxnovkhKNnHQ4FwA4eYgUVk0vQ1FYameYxmke0MjADqjUS1O1gJ5
qNRqHQYcQUpnY2SV2hTdeB5j9SwNSwrbkXE1jq59SRabzYYPgcPVpxUK0gcq4HIrsJ1QBftF
t98ZU+UKTuXBlFzn9ABWRcdkjJ1WYKRbIiXnWvy2WiRm29GUPB8pEno4YI3RG9qMvBh6fRWH
UzLCIur2OhMXo0ck2QJ9SLUt8+aToSuukyrjiuatCfVHlB6siahovBpjQjDiQbecdKh6C051
51PbkxSa3fZ7K6I4K9xtM1OIGFGUiBZGVnIKOAZMO8xmzGFb7xMJchjuVEZAH066VP0whSsw
Xi0SxP1OzxFqTOayARFKOW4FJhrWcNPCYUzVqvBhEk6svRfNEfpSQ37F6bUhwwUGzqlPHVY1
AWJaIX3Qd2U5oK5UVIEp8cH47Nef+TZdOR27gsg133QAX/va19jW0LZ2UlwhBn+yMjnilLXz
r9ftXf0OXjaeGp2Jb1VAL6hD+DafHCHZP9xl/KKvOd3o9Gp5F6sWG72exBrKR/TUI1dvwRNZ
WmO0cem8WlsvTsnlAsZDzxU/sxUZuuIDKiLDa52PO9NkWM1ZHEb35IAGtqN+I1dI0VZk3HMc
SFWZwR/ITCYUDqGWC/nJe4POgFhsylV3XDJim4sHk3JCzjbk9K9XFEWG17SQuIhHPaqis9vB
pEPQ82zoqZDmko7jjlgsbKyNZpjlaVEFTeyE4+tfcHT6aAmdl/A/Ohh7WyLLiF70JMBUAxlQ
7F/PcCQn54Ifs/bFlUWzL+oV3sayvwtsxJjZIHAYcyNIFhoIHNKaaNNLliRBpFeC2+HVwvHZ
RI7uugvXDbKwl4TAHg1IgcxbOq+fs2hr8moOx4JZYrZVvFA9tFqGUvM7zMUO8VjTyaJlGtoI
vizWlSiivWWBo4RR16b3vefD/vWi9D4r7hOvKrdmJvCTvIsB+mw9tyO+8GzQ5aJtbHHHqdod
U52cbCdnVXG6CWoEwGtiEojXAWwqhJYBc7wHNZrR9MZ6W/tgtc1Y+oPBWFdJwxg7zgtD04tM
jhbhBdqgjjZkBFGsmV86BjlPefcNlUHHGcJqXsVwbHddqqM3GH//HVXpnO5dVYRyNlT4xqN7
oxG1oPZVHbYGnMGw8ISbgIwyKLBa25xr7NY4SDTrUU2mh3/NnCFOcppYeYVJti6JzOLYVWU/
oyb5hjtEWTXj1MThwyC4/A2am70pUo/GdBN83CCK+k1vjSNqX48eHk/H8/Hb5Wb5+21/+mtz
8/19f75Qt9vL+yxwRaf5IJc2k0Ue3NNeZUXJFgJFsh13KUKbOPbnaNKd9uiLHGBGIR0tMC+L
IRyGSZ7AgxvaFtXibb/7+f6Gpj8O+3N+2+8ffyjrVxaw1VrZNGsCLmHlErabpCz0VdbiZ2RY
Ml0sS2GgOgtZ+1mZuwuZJfRqp0v5gVdG9JiyBIMtPXYtwT9omw+luuu+Cu7/II9I5EHyTHQP
g5ut0vWfNKbcZqR/vtEY9Pb6onh6OcaPMfIrC8enDpGVrfu4a6ytcXk+PlaPu5f9aQc0rosZ
YVHZ69PpeHjSMPU59Dqt5Ji3DRKpvM5FsReXQQW60tgVRntRVPNswWZp6nDRSsLivigyRt1b
IZTlXMefhd8VQ1Dp0WAFW4zFm/mjEZzFBxYDIQYHnZl2zaiyHPDTisiQ9HFUBca+VSxiLnZV
05VC7/c6DvqQqKUAt6bUdU2gS2Y50M1CGodyk68FMs+fDAcDImnOJpMxfWCqJYqR3+kxyj7R
CnS7PapeRZDB2nw992W327lS86Lw4Yg9pTIvMKoLdeDUBEaupP1rTUKBIdmkK+DfishkSmF6
1gIIJK6B70h6VEx6Heorrb3uyGFEaCUMO5PBz3zIYtyxJ9Qdv0VKSz1COdc20FcyCRKHVr0q
xvSxMwsH/SZQ1GJ3/rm/UOESDI7SpDCIfO5u7bgFu40cmu92MmrDqhMR7WUFY3Fr1fZFPPeV
03ej2+agrjQZFiYHxCOWlWocyIaRoderdqhrWOUspra+tvg2iSChoY3W4mu+y+9L8iNyr5Vc
OGqUqVXsasaBoNrL3Ss5tCFUzIIx4YzlNodbBFRX+6YtHMlHg/tpWHhlZpOlk6pKXhezzG+R
49txHUQRS9Jt81GpMzSDI6enah7wAy/Y4Eyh6YRSEHowgI1POevWUVI9XQVqqWiUnbosaopY
EQ5dcRAMqeGfSA1oS4ci5PleMO7QFk1VjMcVqjzaT1kttBdnhWPlQn55F406DlxyJRtxYUNK
Le9g9CeRcW4S+tHz8fHnTXF8Pz3ubXsW5FvkMLcmPTXqGVCDTWlS+c9Kd+ADyVnkN5ItkihV
qjICWRjNUuqCKYT2rs1o9Yv9K4YOu+HMm2z3fc/9GRTUgXY9/UBUVQuxpHoKWt2W71+Ol/3b
6fhIGMQDBACrr6abkokUIqe3l/N30naZxYU8fZMKqp5SUd4R/BTfhNonutS7+Vfx+3zZv9yk
rzfej8Pbv1Etfzx8gz7xDS365fn4HcjFUTetSvWYYIt0qOc/OZPZXAEvfjrunh6PL650JF/g
2Wyzv+en/f78uIMPeXs8hbeuTD4SFd4w/4m3rgwsHmfevu+eMbqzKxXJb45BqSfeovMU28Pz
4fWXlZHcukGJTbbVxluTA4JK3BzG/ujTK4Y0rhvM84B6gw9nYK9F0Qp+XeCIJxGNLPwsIVyx
bSaiVLZeLoIxLxgs85SOVAuYbk01uTZOJ2V/MKWU41oMdpHuYDgeEzngC6b+kNKOW4HxeDTt
E2mvrLZSokyG3eGVduXlZDruK6buml7Ew6F6hVKT5ftEiuFRmhGG83b4e4QOW15S0vajDah4
M0fEkuzOfpkZ5rc8FphmUJNQfSZPqVaG0Ca0oSwP8N0r/CgR1FuHwRK8We7FRTnDXx6jcNCE
WBmikqSM32x5D+v/P2c+OdpxW0OC6K9HZ15crdKE8ZexNavtieU9PiqsepMk5g9hKbValcFM
FKsxsPgNiHhHa+assJw514igRMYlkOAA2jFzFbMosF411B9L7xslKT4U90g361gHiYKf7jci
wDP0bvFF9ie8b969PiJyz+vhcjxRI+maWPPNdR8WfJlsFdfai2oplvh5qsN216RqFiY+BsHN
6P4ijEbhLNn4IR0kkSmOXNI5Tv3ZqPPtDBXkLIZR7DN75i3vbi6n3SPiaVm4mUWpeabAT3Gu
gfOLMaQIGfQQJI2AINGa/hQiqCG5F0jcHUfKWqhxo3VkMkfQIyoPMXxL7RmFpDmHXSPgfFTX
SBhw7ya7KJVbn4YKc5CgZiriTENtr4QlYKn9AZVTf+aIY1YG9GG/CB0xiYoojF0rOn8hCv9P
Ao82ZHqgYdLAuLEEFZOXhrpSICJlHdAYzFcU9U7bY94yqO4Q+Fl43Go2YRaFPithJBR4G1iQ
hQMPtHb1Gh92yJ72WL0mVFtW6tcGkoEPX7dQAWr/kDJF4K3zsLzXsu1X+kStSXSGlpTMki51
YOc9+KO8B3+St+Go+3Xmay5C+Nv5OBCyj2f8yym+E0EI3wc4asc3RBD1VgQdz0voSK2pekpW
4pMRVfgqS2pr/GHXfHV0iybgxmLjyTHEBj4Io+fQlteKviaYF72K9GtOPcFqu0dSqrTnzQgy
vrkoQGtCG8u6KNV3DI0M1lTrH8Gpg/eyYhWldDNVOUdbZmVuNVTuVGFktmbeM0YFJ2D9KLFm
khrk5tNqRuCaefWrciE+AF3t4RJhWrn2G1EMf0gRJl8Dr0YwsqqBZmHEw3EGYcGHTpSBw2hf
M0/R3qEvZIJSPxzWYx+GUcANMcbFcgxKDL6autck6EoEiZffGwBNGrli0UIbVcDdBI51Zl6Y
ASp9kxAKAh/RSpHMtk9KWr1NIDQjoiFCnahheLtOS+WMxX+iAwJHoeE73Zyp0bQ4QEItdsfy
RPShltpYMAWxzAPNlH07j8tqQ902CE7PyMArle+NWLbzYqDNCkEzlrr5GuOWkGsJfIyI3eur
SUPDmBAhxuesfBVFjxJg0R3j4TWjKL0jRVEl1l48KLwEB83WBHijJOMAOiHNbGcNb/f4Q38g
Mi/4lkNq4LW0EPf/ytP4b3/jc6XD0jnCIp2ORh2tj76mUaji7DyEiLHZ/l77c/kNZIl0KcL3
Ky3+nrPy72CLfyclXY+5XADbqVpASvrDbubmcsnK5nWXl/pBhgjLg/6Y4ocp3kPAMfjLp8P5
OJkMp391P6lTqxVdl3PaYYS3xbWAJiWx8Ull8FpniIPfef/+dLz5RnUSVxD0XuKkFXoGUudh
ZOJJX51YnIgdhDDwoQHJxZneMoz8PKAcvkRijJmA0Py4bakxG1ZBnqifxbiJKeNMrzwnfKCn
CBlL82kN++sFrGQzcpzAOZFf2MGpSrt1wX/adUQepe2OVwZjWAhHRXzzFTje0cOSCrr7yiUn
pVSnVPjRxGAjhyMKyBFdwYimM2xFxv2xnnvLGQ8dnMmw4+T0nBzNacHgfVhNEaHQkXxEXwQZ
QiQAgS7Sd1V+NLhSOmUNNURGzoynDs6070ozdfb+tO/q/elg6m4A+XoNRWAZx/FVTZxpuz3S
WmvKdM0MuFvrB6VaiSSDfnOiSlCPHlT+QO8mSbZGqGRQtnKVP3YlpN4DaG3su1J2P/ooXWN2
rtJwUuUEba3T0Mkb9l4VYFSSvSAq9ffDLQe0vrUDD6wRylM435ERyhqR+zyMIrqMBQsi0krb
CIC6uKJShh5iXdIOWo1Msg4pW5zWJSHVK+U6X4U66giyzL1eKumRZjCEn9cAypPQo8Miw3nq
7lbdbTQLkLiZ3D++nw6X37aXPCIbq5XA36Cc3q4RAZNQA+Ve3Qb8hBSg0y+o7ag+zgQ+VUzl
LzEAuYiG53AjrU+blR8HBb9gKPPQI82kls2oSXsHf/OQpMs0XRW2wJygye1W0WxweRL5wKyK
mHkyNVNW2znp2dHIZUw1bkZFXMUxyxCiqmK+n38ZIWihZHM3D+7hkkBn4hkOVfkKfcy9Gvm0
kTSErrBAHzWjwM7hJIFnP2EY1s3F0GaPp0XUr2UQZaSVsGlgEfAIo0Tn1pwKPTkzlrP4iowf
FtjpZFc3MsEmiFLqssQSZRuvMdi4ZLgFA6YAGubRMroO2pcRlnAR+jAqMJDUspqFkO/0mmgP
BrCYVSKwbm84otoFS4nDXVqKlGmc3tNLbCPDMujcmERxaWSilPlZSI/kmgezGEaF5zCAS+F7
Rr5FatvE5ng9qN/6KEV5Kz+9S3AeOC4EFvX01szoC5F3uEiYCdVLyCEGBX1ODh2PrIINea9U
H+GIod4u5qYMjTkB7f3yCb11no7/ff38e/ey+/x83D29HV4/n3ff9iB5ePqMMA7fcfn+fN4/
H17ff30+v+wef36+HF+Ov4+fd29vu9PL8fT5n7dvn8R6v9qfXvfPNz92p6f9K951tOu+gvR1
c3g9XA6758P/OOaicnCHsxtOE29VJQLGW+nNEEFOxNLjQD2xhDHuj1NWvvagqyTZ7hY1Lhjm
Hidbs01zYcZTrT38dZge0UbQ4FznqaumoG7VNVaQsluTkrPQH8Eu5aWaHyLsgGh1FyaT0++3
y/HmEeM3HU83P/bPbyoKrxBG2x/LQjOPmtyz6QHzSaItWqw8HmfFybCTLLW3VwrRFs1VY15L
IwXt8OCy4s6aMFflV1lmS6+yzM4BDce2KKhzsL3b+dZ07b6mZploTGRCuXtx9JPCyn4x7/Ym
GlpKzUjWEU2kapLxf9114f8Q42NdLoPEIzI0X1kaAyWMfTmas/d/ng+Pf/3c/7555AP7O0YM
/22N57xgVvm+PagCzyNo/pKoY+DlfkGv2bLZ63wT9IbDrnauEg4J75cf+9fL4XF32T/dBK+8
7rBk3Pz3cPlxw87n4+OBs/zdZWc1xlMDx8kvSdC8JezzrNfJ0ui+RoEw68iCRYjP96/0dnCr
w6g37V8yWF03Vttm3PUT4zGd7ZrPqM/tzamwbZJZ2rPCI4Zy4M0sWpTfEcWlc9oHqhnNM9pR
nHO3+k2bnOnBvYlJaPU0Plcs19RuLltQFLynhZvH7vzD1YmgnNnLoSCapW6vNmYjEglD9uH7
/nyxC8u9fs8uTpCFlwPNpKnQu5FYb6yabnFFv9aDs4itgt7VbydEqINgW4my2/HDuT2ByF1G
mTrG+uoPCBohF8I8CSL8196DYnzWQ5JHHYoMyjrRc8Dok2iGcgYvWdfKDYgiN4s87BKb9pL1
iZKLmEZDkmy8Mpul1AWkXOgXeXdqF3eXiUoIhYUjydvTgAXUTAQqHfRG4SehY+CyZD0L7aWF
5Z79sUGfu5uHxJCRjBYJ1BiCDN9fhPZ+5DHx3MiAD1W4lO1WYduf0yf7aP7Bfr1asgdCnytY
VLCePTDlNmMnCAIilyDPDOxAnVMVRdCrhg5EmWbkOV5xSAWCOgpK5l1Kfria7vpukj3koCti
aB5f3k7781kcXcxKgHoZsZKyl8nt6SG1SpkM7OkQPdjDD2hLasF/KEobTDjfvT4dX26S95d/
9ifxRMI4bzUTAGHqM0qL9vPZQr72JziO/UfwPljYuZBH+v4oEla5X0N8sxegv7B6XFLU44o6
w0gGfaxouM5zSiNB9VLDrE9E6pHr+fDPaQcHzNPx/XJ4JTb2KJzVqxpBF2uQ2XXI+nDTQyEx
SakAjZbQtU/FpUi91pbzHU2Reyoo5WiB6l4TuV5fKfZhjQ1F+Hq9m63RzGpJh/mDo3eMMfJC
jxuV8SWe7eKwP13wIQYo9WcO+Hs+fH/dXd7hEP74Y//48/D6XcWNwdtV/K746rBoDNyKxdCU
4NY//N+XT58Ux4U/KFVmOQsTlt8L75i5HLmRc8gKS4NqgZCUagaHOlgOVNt1FCYBy0EkWeg7
Er4HoF2UZiFoD4iSothHpMc+KBaJh9bjnHvMq5NUFYmCxMFNAnR/CNW7asmah4kPf+UY7ClU
bQNp7qs6HHRUzEMdzTTgYXGZoIYobZ4ZeKHpvSpZBpl7H8AX5VHNRByVLArVdnAJ9AyCoQeL
dpKW4g5DnW8enBPDUrNueN2RLmHrwlCZcl3pqXRlHrV4iTSkTxLOiUIvmN3TjiWaCHVlWAuw
/E74NBgpZw7jKXBHjuy0ndNT4bvDWXO2UTOijsLibKJ0P5pxqbUJBrifxkoHEZnBDt94D7ZZ
ItUPbPoDrkhhwjUJpfIPKZEHUqk8QFcgpUGDoOlkLtsHJJu/8bW5ReOPRzJbNmSjgUVkeUzR
yiVMLYuB2Bp2vjPvq/oVaqqj/9u2VYuHUJl2CmMGjB7JiR407LKWsX1wyKcOutITch0gbtPg
BIVBoKNUh4JUqJircohkRZF6ISwHmwC6MddQuxj3n1cfoQgSB+bSliCkayhtCS9R4MzBurpQ
rw45j4O9sYzfbakm7VwgyPErxaqsRgNtVS3uwrSMlO+Moh4vWFgl9t92788XhJi5HL6/YwTN
F2Gm3532O9jP/rf/P0WPgsSoU1Tx7B6+fntp1jCyIEfvAHSg6yjTXrILPKnztPQ6o8q1WX0s
G4ckvpgmoj4VQg6LwkUS41FJiRbEexLUS5e7frGIxChS8srW6AOOKGj8QkXjVLn22f1bdeOK
0pn+S1335bePdB9uL3rAS2p1Oob5LWpq1IOLOAs1VHN+yyxnw8YvUnuOLIIS8fzTua8ObTVN
pe5XGqPkW7bqWZniebN5bK5QdSdcFJv8oraGmqXD3nLi6JcLrAS541+kzwznZaArRVielScD
LSQxa6KLwFALq8Ev+vQsK0YC7yCv2/nVnVj9k5ANBHq396tHOzhxCTiedUe/+pQvW4FPDNPI
WCj4AL1jGuAVrBfaGEUPjGShqyC1vmupq/pVpFSzOfXtdHi9/OQ4vU8v+/N32zGFq8IrPmg0
lVWQPYaPVKlZLd7DVVG6iNAtoLlmGjslbtfokTxoZoWANbRzGLS1QM8FWRU/MALkytl8nzAM
SmC4s2tk4wZSBJMGZpDnIKXCj3Jp+FMHHFX73dmXjZXk/ys7st3GbeCv5LEPbbDZLhbtwz7I
Em0Jto7oiJwnI80aQbDNgcQp9vM7ByXxGDLZt4QzpngM5+LM8P7f4x+n+wdtd7wS6i23v/gr
z9/SuUJeG0auD6my7vEN6CRilRxiZWB2oFXLGsKMko1Ju7YM7022wlceiiZQEEhVdN9WDujM
wzgO6ai1sLSUfPDt4tNnY1eRthsQ4ZgXKobXtirJqH/AMUeVQzvYITBoOEIiq+VJdZzRghG/
ZcKP3U2fdiA0vENdmbWWedxNTVkV/vJTkMZhVMkWhSOKFzmA/6P0YNX+0Kc4O/7zdneH1+/F
4+vp5e3BLt1aJpuCgsJbwzI1GucYAN6mb8DullmYeP47m/ZUO0doEfvaAnGYy4L/C13M9t2w
6pIKzJ2q6FENSHb2M+4IFVfwQ2tiDxiD102Pt04OK7r5AkiHP8ydGYwQmZHa96rqnJgz7gXh
pHTIgXr463qsRGZJQCCorrbzcOz2Q1XzKl0HMfD9V3d2hNKqtdve1lmCCT2WIjNvCuOMe3+e
o5TPNZv3fTaUjSUoqEWqMOP0W68w0SwQgLgbVhOapEMS3IknI4LU2w7a/g4OpD+ZCRIZF8ff
DMESux3wt0xjqSoLsjvu7ar0B3FV0h1kMMhzxmqlczRDmw3Yx5suuJm6bLZLB4FmLqtBoUMe
RTFbQ0NHXm9aDMx5WnMulbSiE1jSHVIa9TZBvrD4FyZ2Qs2sxF94cUvLwXVYfl4QM9T2FCCd
1U/Pr7+f7Z5uf7w9M+/Nbx7vrAysBh9nwsipum7E6nEm3I1RZCCp6YNR1BkjoAY8ED2Qu2nk
YhnTIHCO0TTRGv121Ls4emgGl8cgVOdjAdpD4CHHchs9GFAi0niJpQPTPAtk2CKP0fMWOXl8
PzhyGkTk9zd6AdNnzXwEHQWPG91Ua2olTiGORPqMS764o1ulGsdj64qDVqmy8cuk4/wMWfXb
6/P9I8aKwNQf3k7Hn0f443i6PT8/N18eq6cHSamWrPCWVtNidXQh13XGoD5w5kEegu6PoVd7
q6w/nx5dV81jEjO6KyRGhgFnrkcMsY6sVDt2chYVg2ncjjVPcaqq8b+rAcHOpgfKdir0a1xf
uvmKlpGnQcGZwWjXkIttWQPJSPsFMlhsPuB5lLJtDp00VFgffHtWqQxonv2vkRXfsqz1aJPP
4Q/Wp77fnG7OUJG6xasSzy6haxZfCcLmmDCNHRnKdy6ckvCLrUfC/0BKC5hr7UD52RF+EpiH
PY0UzChV9aDldpN0aNNBYjLmblve7nRAibgOkQHCnd8aEJSjZKzMguLzhd13KEcfYerSfG1j
Kphnjd87mZfaQmkF28S2conIQePFwH4xUALGnoPI2bFM79VUt8pcHnTZV+l1L+YF0EXxQta+
E6qqG16A1lE01kPFllocummTJpdxJgfAejpRYeBhLPocn2P11B0BTeeTo2fERddoJRWWoQDl
NnNQMJOXqAExycb0OsG7/munMdW9cdcLkGeObtWDM00eSmpzdfIprYb12lwtdYXxKIhvGSe4
10gc/F68t8ZGV8S9R0A0HVhaPqJbVJyr973JxHA/pBEFB6bHKlFBIu+n/o3klPDoanHmSUQV
cTi5hPU+TX2AnPzR6OdBxPQSMkqkBVPT+gNr2mzsvB7YEtAf1+EJzj91OmaNy1+4fAQmIHS3
uBzKog6WItGcgc9F55F2V4EVwm/XyoDZXLHpbwVSEshWr56XXzG162tlrH5MPwjciax2W3p4
U6qpsrgyoNOV4vMk6jt6+xnBJeQQ25jo33YP01sFbkc5BkkYzwQvCjp9gA86F3yR9fj5oC7h
DZJkMo6+GQbhfS7Z0WUZLrT4vU1aX8074RdHW86CppE+ATHbeIJ4EafGwN5FNhgUuZbDmMZi
I5cKI1rrH8kxRWW+yNShztPi4s+/v9CFF1ri8ueTstmJxc0NBwDV0ys6ZsVmQCKncmqMpbmo
PQgpRz//+ioqR7QBsFbkgvB5MVZj1y5z4sJm7Wy859EhNxaVmO2HbLWRA8stLKwbuc/EYG9t
u+1W691gRjGQ+JwZkGRa4djxzhoLIkoRDQvjrDWlfNqLhV4NuO23nwGDd4nh4yCnimltdCWC
XoDA7W2TBO9NuYdJv3C187KIT5/XifzCAb2yGTARDW2w4BCGauTSk76XXau3NgWad1v98fWE
xhS6DtKn/44vN3dH05uzHSo5n1zbHXjdU7dWxatp4KWMZCiq9FB3EGthVXZRrbD3qwNpA9xP
C2vz+WcQAqTDwD7wwzL221O7bdbLxh+7YZAHdaFCRYSCuc/4QFoYI/j71aLKA6lEOPEKo+Ij
cDO0I3zgkDZQisQ7wxgFkP8B+4xdAl+/iOFcZkJhsH9aklzt0dEdWTO+seWEbflsTnhd2shM
gBC2gNGLZeMJPMcumo3z9bHdFTTTCxvhjw1DEYHuKbYmDJecvDZGizFllM8fWdpQ5DRBiyxU
KxSpfRs5CjD72n0F0IRfleH7HF4cNF/dYl7ONxr51T0GYuRqjpfgoedNKA4TxhnVt6ivddGW
Y2LeYjM1TZWhnJGHBY0mQqoygOUiIoRY1hHasG4XIsxGlSlYB9GDQ+GxAe1n6sRFmEwLVbqu
t6i08PKcOVzif7AksnxfCQIA

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--jRHKVT23PllUwdXP--
