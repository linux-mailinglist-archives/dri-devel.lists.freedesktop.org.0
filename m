Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC892610DC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B956E7F5;
	Tue,  8 Sep 2020 11:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC686E7F5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:56 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113754euoutp0213a9f49012134056d54eea625a3fa561~yy-XvuGrW3236032360euoutp02d
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200908113754euoutp0213a9f49012134056d54eea625a3fa561~yy-XvuGrW3236032360euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599565074;
 bh=TJaBlzPnIyee50AHlvKK3v6tw4oGjjo780wGL8fRelk=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=nOpJfVq2zApW1eH/T8dWOWgvOk55ikGt5ruAGAMsUANlzqb7bz+t4tSo/wHJTRxWm
 8jJuTE1j0HxBqDaW0t7TfqtzKScmlpQfNCTw7fTg8LQBG7EmFlNBnt9RFs4CfEmU0c
 /1c/7lAEPL14SDBuOJ8fO85oCs/mhyyXeUI2nZ74=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200908113754eucas1p2c3c2800af18241550baf2921f2404c4e~yy-XkSseh0080100801eucas1p2y;
 Tue,  8 Sep 2020 11:37:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E1.C5.06318.21D675F5; Tue,  8
 Sep 2020 12:37:54 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113754eucas1p1ee7485b9b4f7aafb82b0071aaf765011~yy-XJBYA-0741007410eucas1p1n;
 Tue,  8 Sep 2020 11:37:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200908113754eusmtrp2e4b7b96f4a7cefcc1701287ca9abe16e~yy-XITKkH3046530465eusmtrp2L;
 Tue,  8 Sep 2020 11:37:54 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-dc-5f576d12dc92
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 6D.C4.06017.21D675F5; Tue,  8
 Sep 2020 12:37:54 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113753eusmtip1631dc89599658878d688eb37c967f86a~yy-Wl2agl0553105531eusmtip1M;
 Tue,  8 Sep 2020 11:37:53 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] fbdev: remove mbx framebuffer driver
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <c7d3d24d-66a8-5dcb-dea0-c7df5fde00d8@samsung.com>
Date: Tue, 8 Sep 2020 13:37:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200830115524.431278-1-rppt@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRmVeSWpSXmKPExsWy7djP87pCueHxBjvXKlr8nXSM3eLJgXZG
 iytf37NZLGxbwmJxou8Dq8XlXXPYLI6s385kcWNKA5sDh8fvX5MYPTat6mTzmLDoAKPH/e7j
 TB6L+yazenzeJBfAFsVlk5Kak1mWWqRvl8CVMXX6C8aCrz9YKno3vWBsYFzQyNLFyMkhIWAi
 sfrqVjYQW0hgBaPE3nMpXYxcQPYXRom1Z56xQiQ+M0o8ulcK07DgQQsbRNFyRomt+1ayQjhv
 GSXajraCjWITsJKY2L6KEcQWFrCUuPbvAtgkEQFlie+L9zGDNDALPAFa1/8YrIhXwE7i/Z3Z
 QDYHB4uAisTJhUIgYVGBCIlPDw6zQpQISpyc+QTsbE4BM4nea7fYQWxmAXGJW0/mM0HY8hLb
 384Bmy8hcIpdYtn9OWAzJQRcJFqarCE+EJZ4dXwLO4QtI/F/J0gvSP06Rom/HS+gmrczSiyf
 /I8Nospa4s65X2wgg5gFNCXW79KHCDtK3JsJsgxkPp/EjbeCEDfwSUzaNh0qzCvR0SYEUa0m
 sWHZBjaYtV07VzJPYFSaheSzWUi+mYXkm1kIexcwsqxiFE8tLc5NTy02zkst1ytOzC0uzUvX
 S87P3cQITEyn/x3/uoNx35+kQ4wCHIxKPLwevmHxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUms
 rEotyo8vKs1JLT7EKM3BoiTOa7zoZayQQHpiSWp2ampBahFMlomDU6qBcakZ9+lHNSZ7xX1m
 1rsfcHSpT1z25/UrozdyXXGHf7YYJ1kGaOWe+ls+i7/TJyPJaILhZ0N2/eQTfg3L5GoyFtnd
 e+m26oN70AK57TPPs3Nu4pz4MGq5huWdi4UiAu+NGZds3HhEuGUi4+qYcwf3VN1/dls8aj2H
 2CrBq6vvMk14lF9pFuNyRImlOCPRUIu5qDgRAPjSr8BIAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xu7pCueHxBj/amS3+TjrGbvHkQDuj
 xZWv79ksFrYtYbE40feB1eLyrjlsFkfWb2eyuDGlgc2Bw+P3r0mMHptWdbJ5TFh0gNHjfvdx
 Jo/FfZNZPT5vkgtgi9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnN
 ySxLLdK3S9DLmDr9BWPB1x8sFb2bXjA2MC5oZOli5OSQEDCRWPCghQ3EFhJYyiixtMW/i5ED
 KC4jcXx9GUSJsMSfa11AJVxAJa8ZJeZ9ewvWyyZgJTGxfRUjiC0sYClx7d8FVhBbREBZ4vvi
 fcwgDcwCTxglZnY+YIHo7mSUWLzpBVgVr4CdxPs7sxlBtrEIqEicXCgEEhYViJA4vGMWI0SJ
 oMTJmU/AlnEKmEn0XrvFDmIzC6hL/Jl3iRnCFpe49WQ+E4QtL7H97RzmCYxCs5C0z0LSMgtJ
 yywkLQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIExuK2Yz+37GDsehd8iFGAg1GJh/eD
 V1i8EGtiWXFl7iFGCQ5mJRFep7On44R4UxIrq1KL8uOLSnNSiw8xmgL9NpFZSjQ5H5gm8kri
 DU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MG6dILPR4hjvruzpyVd2
 1JavMH5b8z8v4OyXPRF5v9n86lc+XcnQ8Zl18ia3fxo+9T+u6F2ynbQ8WeHk1pqHlyQi38yP
 u+GRfSP2wTOvk4vNzZ27j6aynmOPvSq6NkjF3PhS+R27r2EHY/wP8S6f7PVuwapjk/9XTLZt
 eWky8+Lh17ZmV2coP/2pxFKckWioxVxUnAgA4q1lnNsCAAA=
X-CMS-MailID: 20200908113754eucas1p1ee7485b9b4f7aafb82b0071aaf765011
X-Msg-Generator: CA
X-RootMTR: 20200830115537eucas1p2ccea5557491f5a06727492748922f9fd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200830115537eucas1p2ccea5557491f5a06727492748922f9fd
References: <CGME20200830115537eucas1p2ccea5557491f5a06727492748922f9fd@eucas1p2.samsung.com>
 <20200830115524.431278-1-rppt@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/30/20 1:55 PM, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The only in-tree user for mbx driver for Intel 2700G graphics chip was
> cm-x270 platform. Since this platform was removed by the commit
> 9d3239147d6d ("ARM: pxa: remove Compulab pxa2xx boards") there is no
> point to keep the obsolete framebuffer driver.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  .../userspace-api/ioctl/ioctl-number.rst      |    2 -
>  drivers/video/fbdev/Kconfig                   |   19 -
>  drivers/video/fbdev/Makefile                  |    1 -
>  drivers/video/fbdev/mbx/Makefile              |    4 -
>  drivers/video/fbdev/mbx/mbxdebugfs.c          |  232 ----
>  drivers/video/fbdev/mbx/mbxfb.c               | 1053 -----------------
>  drivers/video/fbdev/mbx/reg_bits.h            |  614 ----------
>  drivers/video/fbdev/mbx/regs.h                |  196 ---
>  include/video/mbxfb.h                         |   99 --
>  9 files changed, 2220 deletions(-)
>  delete mode 100644 drivers/video/fbdev/mbx/Makefile
>  delete mode 100644 drivers/video/fbdev/mbx/mbxdebugfs.c
>  delete mode 100644 drivers/video/fbdev/mbx/mbxfb.c
>  delete mode 100644 drivers/video/fbdev/mbx/reg_bits.h
>  delete mode 100644 drivers/video/fbdev/mbx/regs.h
>  delete mode 100644 include/video/mbxfb.h
> 
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 2a198838fca9..a20102f7db69 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -356,8 +356,6 @@ Code  Seq#    Include File                                           Comments
>  0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                   ChromeOS EC driver
>  0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                     sisfb (in development)
>                                                                       <mailto:thomas@winischhofer.net>
> -0xF4  00-1F  video/mbxfb.h                                           mbxfb
> -                                                                     <mailto:raph@8d.com>
>  0xF6  all                                                            LTTng Linux Trace Toolkit Next Generation
>                                                                       <mailto:mathieu.desnoyers@efficios.com>
>  0xFD  all    linux/dm-ioctl.h
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index b2c9dd4f0cb5..e36578258b5b 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1775,25 +1775,6 @@ config PXA3XX_GCU
>  
>  	  If you compile this as a module, it will be called pxa3xx_gcu.
>  
> -config FB_MBX
> -	tristate "2700G LCD framebuffer support"
> -	depends on FB && ARCH_PXA
> -	select FB_CFB_FILLRECT
> -	select FB_CFB_COPYAREA
> -	select FB_CFB_IMAGEBLIT
> -	help
> -	  Framebuffer driver for the Intel 2700G (Marathon) Graphics
> -	  Accelerator
> -
> -config FB_MBX_DEBUG
> -	bool "Enable debugging info via debugfs"
> -	depends on FB_MBX && DEBUG_FS
> -	help
> -	  Enable this if you want debugging information using the debug
> -	  filesystem (debugfs)
> -
> -	  If unsure, say N.
> -
>  config FB_FSL_DIU
>  	tristate "Freescale DIU framebuffer support"
>  	depends on FB && FSL_SOC
> diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
> index cad4fb64442a..2ff8849ffde6 100644
> --- a/drivers/video/fbdev/Makefile
> +++ b/drivers/video/fbdev/Makefile
> @@ -31,7 +31,6 @@ obj-$(CONFIG_FB_VIA)		  += via/
>  obj-$(CONFIG_FB_KYRO)             += kyro/
>  obj-$(CONFIG_FB_SAVAGE)		  += savage/
>  obj-$(CONFIG_FB_GEODE)		  += geode/
> -obj-$(CONFIG_FB_MBX)		  += mbx/
>  obj-$(CONFIG_FB_NEOMAGIC)         += neofb.o
>  obj-$(CONFIG_FB_3DFX)             += tdfxfb.o
>  obj-$(CONFIG_FB_CONTROL)          += controlfb.o
> diff --git a/drivers/video/fbdev/mbx/Makefile b/drivers/video/fbdev/mbx/Makefile
> deleted file mode 100644
> index 3e8e7ff41f18..000000000000
> --- a/drivers/video/fbdev/mbx/Makefile
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -# Makefile for the 2700G controller driver.
> -
> -obj-y 			+= mbxfb.o
> diff --git a/drivers/video/fbdev/mbx/mbxdebugfs.c b/drivers/video/fbdev/mbx/mbxdebugfs.c
> deleted file mode 100644
> index 09af721638fb..000000000000
> --- a/drivers/video/fbdev/mbx/mbxdebugfs.c
> +++ /dev/null
> @@ -1,232 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <linux/debugfs.h>
> -#include <linux/slab.h>
> -
> -#define BIG_BUFFER_SIZE	(1024)
> -
> -static char big_buffer[BIG_BUFFER_SIZE];
> -
> -struct mbxfb_debugfs_data {
> -	struct dentry *dir;
> -	struct dentry *sysconf;
> -	struct dentry *clock;
> -	struct dentry *display;
> -	struct dentry *gsctl;
> -	struct dentry *sdram;
> -	struct dentry *misc;
> -};
> -
> -static ssize_t write_file_dummy(struct file *file, const char __user *buf,
> -				size_t count, loff_t *ppos)
> -{
> -	return count;
> -}
> -
> -static ssize_t sysconf_read_file(struct file *file, char __user *userbuf,
> -				 size_t count, loff_t *ppos)
> -{
> -	char * s = big_buffer;
> -
> -	s += sprintf(s, "SYSCFG = %08x\n", readl(SYSCFG));
> -	s += sprintf(s, "PFBASE = %08x\n", readl(PFBASE));
> -	s += sprintf(s, "PFCEIL = %08x\n", readl(PFCEIL));
> -	s += sprintf(s, "POLLFLAG = %08x\n", readl(POLLFLAG));
> -	s += sprintf(s, "SYSRST = %08x\n", readl(SYSRST));
> -
> -	return  simple_read_from_buffer(userbuf, count, ppos,
> -					big_buffer, s-big_buffer);
> -}
> -
> -
> -static ssize_t gsctl_read_file(struct file *file, char __user *userbuf,
> -			       size_t count, loff_t *ppos)
> -{
> -	char * s = big_buffer;
> -
> -	s += sprintf(s, "GSCTRL = %08x\n", readl(GSCTRL));
> -	s += sprintf(s, "VSCTRL = %08x\n", readl(VSCTRL));
> -	s += sprintf(s, "GBBASE = %08x\n", readl(GBBASE));
> -	s += sprintf(s, "VBBASE = %08x\n", readl(VBBASE));
> -	s += sprintf(s, "GDRCTRL = %08x\n", readl(GDRCTRL));
> -	s += sprintf(s, "VCMSK = %08x\n", readl(VCMSK));
> -	s += sprintf(s, "GSCADR = %08x\n", readl(GSCADR));
> -	s += sprintf(s, "VSCADR = %08x\n", readl(VSCADR));
> -	s += sprintf(s, "VUBASE = %08x\n", readl(VUBASE));
> -	s += sprintf(s, "VVBASE = %08x\n", readl(VVBASE));
> -	s += sprintf(s, "GSADR = %08x\n", readl(GSADR));
> -	s += sprintf(s, "VSADR = %08x\n", readl(VSADR));
> -	s += sprintf(s, "HCCTRL = %08x\n", readl(HCCTRL));
> -	s += sprintf(s, "HCSIZE = %08x\n", readl(HCSIZE));
> -	s += sprintf(s, "HCPOS = %08x\n", readl(HCPOS));
> -	s += sprintf(s, "HCBADR = %08x\n", readl(HCBADR));
> -	s += sprintf(s, "HCCKMSK = %08x\n", readl(HCCKMSK));
> -	s += sprintf(s, "GPLUT = %08x\n", readl(GPLUT));
> -
> -	return  simple_read_from_buffer(userbuf, count, ppos,
> -					big_buffer, s-big_buffer);
> -}
> -
> -static ssize_t display_read_file(struct file *file, char __user *userbuf,
> -				 size_t count, loff_t *ppos)
> -{
> -	char * s = big_buffer;
> -
> -	s += sprintf(s, "DSCTRL = %08x\n", readl(DSCTRL));
> -	s += sprintf(s, "DHT01 = %08x\n", readl(DHT01));
> -	s += sprintf(s, "DHT02 = %08x\n", readl(DHT02));
> -	s += sprintf(s, "DHT03 = %08x\n", readl(DHT03));
> -	s += sprintf(s, "DVT01 = %08x\n", readl(DVT01));
> -	s += sprintf(s, "DVT02 = %08x\n", readl(DVT02));
> -	s += sprintf(s, "DVT03 = %08x\n", readl(DVT03));
> -	s += sprintf(s, "DBCOL = %08x\n", readl(DBCOL));
> -	s += sprintf(s, "BGCOLOR = %08x\n", readl(BGCOLOR));
> -	s += sprintf(s, "DINTRS = %08x\n", readl(DINTRS));
> -	s += sprintf(s, "DINTRE = %08x\n", readl(DINTRE));
> -	s += sprintf(s, "DINTRCNT = %08x\n", readl(DINTRCNT));
> -	s += sprintf(s, "DSIG = %08x\n", readl(DSIG));
> -	s += sprintf(s, "DMCTRL = %08x\n", readl(DMCTRL));
> -	s += sprintf(s, "CLIPCTRL = %08x\n", readl(CLIPCTRL));
> -	s += sprintf(s, "SPOCTRL = %08x\n", readl(SPOCTRL));
> -	s += sprintf(s, "SVCTRL = %08x\n", readl(SVCTRL));
> -	s += sprintf(s, "DLSTS = %08x\n", readl(DLSTS));
> -	s += sprintf(s, "DLLCTRL = %08x\n", readl(DLLCTRL));
> -	s += sprintf(s, "DVLNUM = %08x\n", readl(DVLNUM));
> -	s += sprintf(s, "DUCTRL = %08x\n", readl(DUCTRL));
> -	s += sprintf(s, "DVECTRL = %08x\n", readl(DVECTRL));
> -	s += sprintf(s, "DHDET = %08x\n", readl(DHDET));
> -	s += sprintf(s, "DVDET = %08x\n", readl(DVDET));
> -	s += sprintf(s, "DODMSK = %08x\n", readl(DODMSK));
> -	s += sprintf(s, "CSC01 = %08x\n", readl(CSC01));
> -	s += sprintf(s, "CSC02 = %08x\n", readl(CSC02));
> -	s += sprintf(s, "CSC03 = %08x\n", readl(CSC03));
> -	s += sprintf(s, "CSC04 = %08x\n", readl(CSC04));
> -	s += sprintf(s, "CSC05 = %08x\n", readl(CSC05));
> -
> -	return  simple_read_from_buffer(userbuf, count, ppos,
> -					big_buffer, s-big_buffer);
> -}
> -
> -static ssize_t clock_read_file(struct file *file, char __user *userbuf,
> -			       size_t count, loff_t *ppos)
> -{
> -	char * s = big_buffer;
> -
> -	s += sprintf(s, "SYSCLKSRC = %08x\n", readl(SYSCLKSRC));
> -	s += sprintf(s, "PIXCLKSRC = %08x\n", readl(PIXCLKSRC));
> -	s += sprintf(s, "CLKSLEEP = %08x\n", readl(CLKSLEEP));
> -	s += sprintf(s, "COREPLL = %08x\n", readl(COREPLL));
> -	s += sprintf(s, "DISPPLL = %08x\n", readl(DISPPLL));
> -	s += sprintf(s, "PLLSTAT = %08x\n", readl(PLLSTAT));
> -	s += sprintf(s, "VOVRCLK = %08x\n", readl(VOVRCLK));
> -	s += sprintf(s, "PIXCLK = %08x\n", readl(PIXCLK));
> -	s += sprintf(s, "MEMCLK = %08x\n", readl(MEMCLK));
> -	s += sprintf(s, "M24CLK = %08x\n", readl(M24CLK));
> -	s += sprintf(s, "MBXCLK = %08x\n", readl(MBXCLK));
> -	s += sprintf(s, "SDCLK = %08x\n", readl(SDCLK));
> -	s += sprintf(s, "PIXCLKDIV = %08x\n", readl(PIXCLKDIV));
> -
> -	return  simple_read_from_buffer(userbuf, count, ppos,
> -					big_buffer, s-big_buffer);
> -}
> -
> -static ssize_t sdram_read_file(struct file *file, char __user *userbuf,
> -			       size_t count, loff_t *ppos)
> -{
> -	char * s = big_buffer;
> -
> -	s += sprintf(s, "LMRST = %08x\n", readl(LMRST));
> -	s += sprintf(s, "LMCFG = %08x\n", readl(LMCFG));
> -	s += sprintf(s, "LMPWR = %08x\n", readl(LMPWR));
> -	s += sprintf(s, "LMPWRSTAT = %08x\n", readl(LMPWRSTAT));
> -	s += sprintf(s, "LMCEMR = %08x\n", readl(LMCEMR));
> -	s += sprintf(s, "LMTYPE = %08x\n", readl(LMTYPE));
> -	s += sprintf(s, "LMTIM = %08x\n", readl(LMTIM));
> -	s += sprintf(s, "LMREFRESH = %08x\n", readl(LMREFRESH));
> -	s += sprintf(s, "LMPROTMIN = %08x\n", readl(LMPROTMIN));
> -	s += sprintf(s, "LMPROTMAX = %08x\n", readl(LMPROTMAX));
> -	s += sprintf(s, "LMPROTCFG = %08x\n", readl(LMPROTCFG));
> -	s += sprintf(s, "LMPROTERR = %08x\n", readl(LMPROTERR));
> -
> -	return  simple_read_from_buffer(userbuf, count, ppos,
> -					big_buffer, s-big_buffer);
> -}
> -
> -static ssize_t misc_read_file(struct file *file, char __user *userbuf,
> -			       size_t count, loff_t *ppos)
> -{
> -	char * s = big_buffer;
> -
> -	s += sprintf(s, "LCD_CONFIG = %08x\n", readl(LCD_CONFIG));
> -	s += sprintf(s, "ODFBPWR = %08x\n", readl(ODFBPWR));
> -	s += sprintf(s, "ODFBSTAT = %08x\n", readl(ODFBSTAT));
> -	s += sprintf(s, "ID = %08x\n", readl(ID));
> -
> -	return  simple_read_from_buffer(userbuf, count, ppos,
> -					big_buffer, s-big_buffer);
> -}
> -
> -
> -static const struct file_operations sysconf_fops = {
> -	.read = sysconf_read_file,
> -	.write = write_file_dummy,
> -	.open = simple_open,
> -	.llseek = default_llseek,
> -};
> -
> -static const struct file_operations clock_fops = {
> -	.read = clock_read_file,
> -	.write = write_file_dummy,
> -	.open = simple_open,
> -	.llseek = default_llseek,
> -};
> -
> -static const struct file_operations display_fops = {
> -	.read = display_read_file,
> -	.write = write_file_dummy,
> -	.open = simple_open,
> -	.llseek = default_llseek,
> -};
> -
> -static const struct file_operations gsctl_fops = {
> -	.read = gsctl_read_file,
> -	.write = write_file_dummy,
> -	.open = simple_open,
> -	.llseek = default_llseek,
> -};
> -
> -static const struct file_operations sdram_fops = {
> -	.read = sdram_read_file,
> -	.write = write_file_dummy,
> -	.open = simple_open,
> -	.llseek = default_llseek,
> -};
> -
> -static const struct file_operations misc_fops = {
> -	.read = misc_read_file,
> -	.write = write_file_dummy,
> -	.open = simple_open,
> -	.llseek = default_llseek,
> -};
> -
> -static void mbxfb_debugfs_init(struct fb_info *fbi)
> -{
> -	struct mbxfb_info *mfbi = fbi->par;
> -	struct dentry *dir;
> -
> -	dir = debugfs_create_dir("mbxfb", NULL);
> -	mfbi->debugfs_dir = dir;
> -
> -	debugfs_create_file("sysconf", 0444, dir, fbi, &sysconf_fops);
> -	debugfs_create_file("clock", 0444, dir, fbi, &clock_fops);
> -	debugfs_create_file("display", 0444, dir, fbi, &display_fops);
> -	debugfs_create_file("gsctl", 0444, dir, fbi, &gsctl_fops);
> -	debugfs_create_file("sdram", 0444, dir, fbi, &sdram_fops);
> -	debugfs_create_file("misc", 0444, dir, fbi, &misc_fops);
> -}
> -
> -static void mbxfb_debugfs_remove(struct fb_info *fbi)
> -{
> -	struct mbxfb_info *mfbi = fbi->par;
> -
> -	debugfs_remove_recursive(mfbi->debugfs_dir);
> -}
> diff --git a/drivers/video/fbdev/mbx/mbxfb.c b/drivers/video/fbdev/mbx/mbxfb.c
> deleted file mode 100644
> index 6dc287c819cb..000000000000
> --- a/drivers/video/fbdev/mbx/mbxfb.c
> +++ /dev/null
> @@ -1,1053 +0,0 @@
> -/*
> - *  linux/drivers/video/mbx/mbxfb.c
> - *
> - *  Copyright (C) 2006-2007 8D Technologies inc
> - *  Raphael Assenat <raph@8d.com>
> - *  	- Added video overlay support
> - *  	- Various improvements
> - *
> - *  Copyright (C) 2006 Compulab, Ltd.
> - *  Mike Rapoport <mike@compulab.co.il>
> - *  	- Creation of driver
> - *
> - *   Based on pxafb.c
> - *
> - * This file is subject to the terms and conditions of the GNU General Public
> - * License.  See the file COPYING in the main directory of this archive for
> - * more details.
> - *
> - *   Intel 2700G (Marathon) Graphics Accelerator Frame Buffer Driver
> - *
> - */
> -
> -#include <linux/delay.h>
> -#include <linux/fb.h>
> -#include <linux/init.h>
> -#include <linux/module.h>
> -#include <linux/platform_device.h>
> -#include <linux/uaccess.h>
> -#include <linux/io.h>
> -
> -#include <video/mbxfb.h>
> -
> -#include "regs.h"
> -#include "reg_bits.h"
> -
> -static void __iomem *virt_base_2700;
> -
> -#define write_reg(val, reg) do { writel((val), (reg)); } while(0)
> -
> -/* Without this delay, the graphics appears somehow scaled and
> - * there is a lot of jitter in scanlines. This delay is probably
> - * needed only after setting some specific register(s) somewhere,
> - * not all over the place... */
> -#define write_reg_dly(val, reg) do { writel((val), reg); udelay(1000); } while(0)
> -
> -#define MIN_XRES	16
> -#define MIN_YRES	16
> -#define MAX_XRES	2048
> -#define MAX_YRES	2048
> -
> -#define MAX_PALETTES	16
> -
> -/* FIXME: take care of different chip revisions with different sizes
> -   of ODFB */
> -#define MEMORY_OFFSET	0x60000
> -
> -struct mbxfb_info {
> -	struct device *dev;
> -
> -	struct resource *fb_res;
> -	struct resource *fb_req;
> -
> -	struct resource *reg_res;
> -	struct resource *reg_req;
> -
> -	void __iomem *fb_virt_addr;
> -	unsigned long fb_phys_addr;
> -
> -	void __iomem *reg_virt_addr;
> -	unsigned long reg_phys_addr;
> -
> -	int (*platform_probe) (struct fb_info * fb);
> -	int (*platform_remove) (struct fb_info * fb);
> -
> -	u32 pseudo_palette[MAX_PALETTES];
> -#ifdef CONFIG_FB_MBX_DEBUG
> -	struct dentry *debugfs_dir;
> -#endif
> -
> -};
> -
> -static const struct fb_var_screeninfo mbxfb_default = {
> -	.xres = 640,
> -	.yres = 480,
> -	.xres_virtual = 640,
> -	.yres_virtual = 480,
> -	.bits_per_pixel = 16,
> -	.red = {11, 5, 0},
> -	.green = {5, 6, 0},
> -	.blue = {0, 5, 0},
> -	.activate = FB_ACTIVATE_TEST,
> -	.height = -1,
> -	.width = -1,
> -	.pixclock = 40000,
> -	.left_margin = 48,
> -	.right_margin = 16,
> -	.upper_margin = 33,
> -	.lower_margin = 10,
> -	.hsync_len = 96,
> -	.vsync_len = 2,
> -	.vmode = FB_VMODE_NONINTERLACED,
> -	.sync = FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
> -};
> -
> -static const struct fb_fix_screeninfo mbxfb_fix = {
> -	.id = "MBX",
> -	.type = FB_TYPE_PACKED_PIXELS,
> -	.visual = FB_VISUAL_TRUECOLOR,
> -	.xpanstep = 0,
> -	.ypanstep = 0,
> -	.ywrapstep = 0,
> -	.accel = FB_ACCEL_NONE,
> -};
> -
> -struct pixclock_div {
> -	u8 m;
> -	u8 n;
> -	u8 p;
> -};
> -
> -static unsigned int mbxfb_get_pixclock(unsigned int pixclock_ps,
> -				       struct pixclock_div *div)
> -{
> -	u8 m, n, p;
> -	unsigned int err = 0;
> -	unsigned int min_err = ~0x0;
> -	unsigned int clk;
> -	unsigned int best_clk = 0;
> -	unsigned int ref_clk = 13000;	/* FIXME: take from platform data */
> -	unsigned int pixclock;
> -
> -	/* convert pixclock to KHz */
> -	pixclock = PICOS2KHZ(pixclock_ps);
> -
> -	/* PLL output freq = (ref_clk * M) / (N * 2^P)
> -	 *
> -	 * M: 1 to 63
> -	 * N: 1 to 7
> -	 * P: 0 to 7
> -	 */
> -
> -	/* RAPH: When N==1, the resulting pixel clock appears to
> -	 * get divided by 2. Preventing N=1 by starting the following
> -	 * loop at 2 prevents this. Is this a bug with my chip
> -	 * revision or something I dont understand? */
> -	for (m = 1; m < 64; m++) {
> -		for (n = 2; n < 8; n++) {
> -			for (p = 0; p < 8; p++) {
> -				clk = (ref_clk * m) / (n * (1 << p));
> -				err = (clk > pixclock) ? (clk - pixclock) :
> -					(pixclock - clk);
> -				if (err < min_err) {
> -					min_err = err;
> -					best_clk = clk;
> -					div->m = m;
> -					div->n = n;
> -					div->p = p;
> -				}
> -			}
> -		}
> -	}
> -	return KHZ2PICOS(best_clk);
> -}
> -
> -static int mbxfb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
> -			   u_int trans, struct fb_info *info)
> -{
> -	u32 val, ret = 1;
> -
> -	if (regno < MAX_PALETTES) {
> -		u32 *pal = info->pseudo_palette;
> -
> -		val = (red & 0xf800) | ((green & 0xfc00) >> 5) |
> -			((blue & 0xf800) >> 11);
> -		pal[regno] = val;
> -		ret = 0;
> -	}
> -
> -	return ret;
> -}
> -
> -static int mbxfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
> -{
> -	struct pixclock_div div;
> -
> -	var->pixclock = mbxfb_get_pixclock(var->pixclock, &div);
> -
> -	if (var->xres < MIN_XRES)
> -		var->xres = MIN_XRES;
> -	if (var->yres < MIN_YRES)
> -		var->yres = MIN_YRES;
> -	if (var->xres > MAX_XRES)
> -		return -EINVAL;
> -	if (var->yres > MAX_YRES)
> -		return -EINVAL;
> -	var->xres_virtual = max(var->xres_virtual, var->xres);
> -	var->yres_virtual = max(var->yres_virtual, var->yres);
> -
> -	switch (var->bits_per_pixel) {
> -		/* 8 bits-per-pixel is not supported yet */
> -	case 8:
> -		return -EINVAL;
> -	case 16:
> -		var->green.length = (var->green.length == 5) ? 5 : 6;
> -		var->red.length = 5;
> -		var->blue.length = 5;
> -		var->transp.length = 6 - var->green.length;
> -		var->blue.offset = 0;
> -		var->green.offset = 5;
> -		var->red.offset = 5 + var->green.length;
> -		var->transp.offset = (5 + var->red.offset) & 15;
> -		break;
> -	case 24:		/* RGB 888   */
> -	case 32:		/* RGBA 8888 */
> -		var->red.offset = 16;
> -		var->red.length = 8;
> -		var->green.offset = 8;
> -		var->green.length = 8;
> -		var->blue.offset = 0;
> -		var->blue.length = 8;
> -		var->transp.length = var->bits_per_pixel - 24;
> -		var->transp.offset = (var->transp.length) ? 24 : 0;
> -		break;
> -	}
> -	var->red.msb_right = 0;
> -	var->green.msb_right = 0;
> -	var->blue.msb_right = 0;
> -	var->transp.msb_right = 0;
> -
> -	return 0;
> -}
> -
> -static int mbxfb_set_par(struct fb_info *info)
> -{
> -	struct fb_var_screeninfo *var = &info->var;
> -	struct pixclock_div div;
> -	ushort hbps, ht, hfps, has;
> -	ushort vbps, vt, vfps, vas;
> -	u32 gsctrl = readl(GSCTRL);
> -	u32 gsadr = readl(GSADR);
> -
> -	info->fix.line_length = var->xres_virtual * var->bits_per_pixel / 8;
> -
> -	/* setup color mode */
> -	gsctrl &= ~(FMsk(GSCTRL_GPIXFMT));
> -	/* FIXME: add *WORKING* support for 8-bits per color */
> -	if (info->var.bits_per_pixel == 8) {
> -		return -EINVAL;
> -	} else {
> -		fb_dealloc_cmap(&info->cmap);
> -		gsctrl &= ~GSCTRL_LUT_EN;
> -
> -		info->fix.visual = FB_VISUAL_TRUECOLOR;
> -		switch (info->var.bits_per_pixel) {
> -		case 16:
> -			if (info->var.green.length == 5)
> -				gsctrl |= GSCTRL_GPIXFMT_ARGB1555;
> -			else
> -				gsctrl |= GSCTRL_GPIXFMT_RGB565;
> -			break;
> -		case 24:
> -			gsctrl |= GSCTRL_GPIXFMT_RGB888;
> -			break;
> -		case 32:
> -			gsctrl |= GSCTRL_GPIXFMT_ARGB8888;
> -			break;
> -		}
> -	}
> -
> -	/* setup resolution */
> -	gsctrl &= ~(FMsk(GSCTRL_GSWIDTH) | FMsk(GSCTRL_GSHEIGHT));
> -	gsctrl |= Gsctrl_Width(info->var.xres) |
> -		Gsctrl_Height(info->var.yres);
> -	write_reg_dly(gsctrl, GSCTRL);
> -
> -	gsadr &= ~(FMsk(GSADR_SRCSTRIDE));
> -	gsadr |= Gsadr_Srcstride(info->var.xres * info->var.bits_per_pixel /
> -				 (8 * 16) - 1);
> -	write_reg_dly(gsadr, GSADR);
> -
> -	/* setup timings */
> -	var->pixclock = mbxfb_get_pixclock(info->var.pixclock, &div);
> -
> -	write_reg_dly((Disp_Pll_M(div.m) | Disp_Pll_N(div.n) |
> -		Disp_Pll_P(div.p) | DISP_PLL_EN), DISPPLL);
> -
> -	hbps = var->hsync_len;
> -	has = hbps + var->left_margin;
> -	hfps = has + var->xres;
> -	ht = hfps + var->right_margin;
> -
> -	vbps = var->vsync_len;
> -	vas = vbps + var->upper_margin;
> -	vfps = vas + var->yres;
> -	vt = vfps + var->lower_margin;
> -
> -	write_reg_dly((Dht01_Hbps(hbps) | Dht01_Ht(ht)), DHT01);
> -	write_reg_dly((Dht02_Hlbs(has) | Dht02_Has(has)), DHT02);
> -	write_reg_dly((Dht03_Hfps(hfps) | Dht03_Hrbs(hfps)), DHT03);
> -	write_reg_dly((Dhdet_Hdes(has) | Dhdet_Hdef(hfps)), DHDET);
> -
> -	write_reg_dly((Dvt01_Vbps(vbps) | Dvt01_Vt(vt)), DVT01);
> -	write_reg_dly((Dvt02_Vtbs(vas) | Dvt02_Vas(vas)), DVT02);
> -	write_reg_dly((Dvt03_Vfps(vfps) | Dvt03_Vbbs(vfps)), DVT03);
> -	write_reg_dly((Dvdet_Vdes(vas) | Dvdet_Vdef(vfps)), DVDET);
> -	write_reg_dly((Dvectrl_Vevent(vfps) | Dvectrl_Vfetch(vbps)), DVECTRL);
> -
> -	write_reg_dly((readl(DSCTRL) | DSCTRL_SYNCGEN_EN), DSCTRL);
> -
> -	write_reg_dly(DINTRE_VEVENT0_EN, DINTRE);
> -
> -	return 0;
> -}
> -
> -static int mbxfb_blank(int blank, struct fb_info *info)
> -{
> -	switch (blank) {
> -	case FB_BLANK_POWERDOWN:
> -	case FB_BLANK_VSYNC_SUSPEND:
> -	case FB_BLANK_HSYNC_SUSPEND:
> -	case FB_BLANK_NORMAL:
> -		write_reg_dly((readl(DSCTRL) & ~DSCTRL_SYNCGEN_EN), DSCTRL);
> -		write_reg_dly((readl(PIXCLK) & ~PIXCLK_EN), PIXCLK);
> -		write_reg_dly((readl(VOVRCLK) & ~VOVRCLK_EN), VOVRCLK);
> -		break;
> -	case FB_BLANK_UNBLANK:
> -		write_reg_dly((readl(DSCTRL) | DSCTRL_SYNCGEN_EN), DSCTRL);
> -		write_reg_dly((readl(PIXCLK) | PIXCLK_EN), PIXCLK);
> -		break;
> -	}
> -	return 0;
> -}
> -
> -static int mbxfb_setupOverlay(struct mbxfb_overlaySetup *set)
> -{
> -	u32 vsctrl, vscadr, vsadr;
> -	u32 sssize, spoctrl, shctrl;
> -	u32 vubase, vvbase;
> -	u32 vovrclk;
> -
> -	if (set->scaled_width==0 || set->scaled_height==0)
> -		return -EINVAL;
> -
> -	/* read registers which have reserved bits
> -	 * so we can write them back as-is. */
> -	vovrclk = readl(VOVRCLK);
> -	vsctrl = readl(VSCTRL);
> -	vscadr = readl(VSCADR);
> -	vubase = readl(VUBASE);
> -	vvbase = readl(VVBASE);
> -	shctrl = readl(SHCTRL);
> -
> -	spoctrl = readl(SPOCTRL);
> -	sssize = readl(SSSIZE);
> -
> -	vsctrl &= ~(	FMsk(VSCTRL_VSWIDTH) |
> -					FMsk(VSCTRL_VSHEIGHT) |
> -					FMsk(VSCTRL_VPIXFMT) |
> -					VSCTRL_GAMMA_EN | VSCTRL_CSC_EN |
> -					VSCTRL_COSITED );
> -	vsctrl |= Vsctrl_Width(set->width) | Vsctrl_Height(set->height) |
> -				VSCTRL_CSC_EN;
> -
> -	vscadr &= ~(VSCADR_STR_EN | FMsk(VSCADR_VBASE_ADR) );
> -	vubase &= ~(VUBASE_UVHALFSTR | FMsk(VUBASE_UBASE_ADR));
> -	vvbase &= ~(FMsk(VVBASE_VBASE_ADR));
> -
> -	switch (set->fmt) {
> -	case MBXFB_FMT_YUV16:
> -		vsctrl |= VSCTRL_VPIXFMT_YUV12;
> -
> -		set->Y_stride = ((set->width) + 0xf ) & ~0xf;
> -		break;
> -	case MBXFB_FMT_YUV12:
> -		vsctrl |= VSCTRL_VPIXFMT_YUV12;
> -
> -		set->Y_stride = ((set->width) + 0xf ) & ~0xf;
> -		vubase |= VUBASE_UVHALFSTR;
> -
> -		break;
> -	case MBXFB_FMT_UY0VY1:
> -		vsctrl |= VSCTRL_VPIXFMT_UY0VY1;
> -		set->Y_stride = (set->width*2 + 0xf ) & ~0xf;
> -		break;
> -	case MBXFB_FMT_VY0UY1:
> -		vsctrl |= VSCTRL_VPIXFMT_VY0UY1;
> -		set->Y_stride = (set->width*2 + 0xf ) & ~0xf;
> -		break;
> -	case MBXFB_FMT_Y0UY1V:
> -		vsctrl |= VSCTRL_VPIXFMT_Y0UY1V;
> -		set->Y_stride = (set->width*2 + 0xf ) & ~0xf;
> -		break;
> -	case MBXFB_FMT_Y0VY1U:
> -		vsctrl |= VSCTRL_VPIXFMT_Y0VY1U;
> -		set->Y_stride = (set->width*2 + 0xf ) & ~0xf;
> -			break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	/* VSCTRL has the bits which sets the Video Pixel Format.
> -	 * When passing from a packed to planar format,
> -	 * if we write VSCTRL first, VVBASE and VUBASE would
> -	 * be zero if we would not set them here. (And then,
> -	 * the chips hangs and only a reset seems to fix it).
> -	 *
> -	 * If course, the values calculated here have no meaning
> -	 * for packed formats.
> -	 */
> -	set->UV_stride = ((set->width/2) + 0x7 ) & ~0x7;
> -		set->U_offset = set->height * set->Y_stride;
> -		set->V_offset = set->U_offset +
> -						set->height * set->UV_stride;
> -	vubase |= Vubase_Ubase_Adr(
> -			(0x60000 + set->mem_offset + set->U_offset)>>3);
> -	vvbase |= Vvbase_Vbase_Adr(
> -			(0x60000 + set->mem_offset + set->V_offset)>>3);
> -
> -
> -	vscadr |= Vscadr_Vbase_Adr((0x60000 + set->mem_offset)>>4);
> -
> -	if (set->enable)
> -		vscadr |= VSCADR_STR_EN;
> -
> -
> -	vsadr = Vsadr_Srcstride((set->Y_stride)/16-1) |
> -		Vsadr_Xstart(set->x) | Vsadr_Ystart(set->y);
> -
> -	sssize &= ~(FMsk(SSSIZE_SC_WIDTH) | FMsk(SSSIZE_SC_HEIGHT));
> -	sssize = Sssize_Sc_Width(set->scaled_width-1) |
> -			Sssize_Sc_Height(set->scaled_height-1);
> -
> -	spoctrl &= ~(SPOCTRL_H_SC_BP | SPOCTRL_V_SC_BP |
> -			SPOCTRL_HV_SC_OR | SPOCTRL_VS_UR_C |
> -			FMsk(SPOCTRL_VPITCH));
> -	spoctrl |= Spoctrl_Vpitch((set->height<<11)/set->scaled_height);
> -
> -	/* Bypass horiz/vert scaler when same size */
> -	if (set->scaled_width == set->width)
> -		spoctrl |= SPOCTRL_H_SC_BP;
> -	if (set->scaled_height == set->height)
> -		spoctrl |= SPOCTRL_V_SC_BP;
> -
> -	shctrl &= ~(FMsk(SHCTRL_HPITCH) | SHCTRL_HDECIM);
> -	shctrl |= Shctrl_Hpitch((set->width<<11)/set->scaled_width);
> -
> -	/* Video plane registers */
> -	write_reg(vsctrl, VSCTRL);
> -	write_reg(vscadr, VSCADR);
> -	write_reg(vubase, VUBASE);
> -	write_reg(vvbase, VVBASE);
> -	write_reg(vsadr, VSADR);
> -
> -	/* Video scaler registers */
> -	write_reg(sssize, SSSIZE);
> -	write_reg(spoctrl, SPOCTRL);
> -	write_reg(shctrl, SHCTRL);
> -
> -	/* Clock */
> -	if (set->enable)
> -		vovrclk |= 1;
> -	else
> -		vovrclk &= ~1;
> -
> -	write_reg(vovrclk, VOVRCLK);
> -
> -	return 0;
> -}
> -
> -static int mbxfb_ioctl_planeorder(struct mbxfb_planeorder *porder)
> -{
> -	unsigned long gscadr, vscadr;
> -
> -	if (porder->bottom == porder->top)
> -		return -EINVAL;
> -
> -	gscadr = readl(GSCADR);
> -	vscadr = readl(VSCADR);
> -
> -	gscadr &= ~(FMsk(GSCADR_BLEND_POS));
> -	vscadr &= ~(FMsk(VSCADR_BLEND_POS));
> -
> -	switch (porder->bottom) {
> -	case MBXFB_PLANE_GRAPHICS:
> -		gscadr |= GSCADR_BLEND_GFX;
> -		break;
> -	case MBXFB_PLANE_VIDEO:
> -		vscadr |= VSCADR_BLEND_GFX;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	switch (porder->top) {
> -	case MBXFB_PLANE_GRAPHICS:
> -		gscadr |= GSCADR_BLEND_VID;
> -		break;
> -	case MBXFB_PLANE_VIDEO:
> -		vscadr |= GSCADR_BLEND_VID;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	write_reg_dly(vscadr, VSCADR);
> -	write_reg_dly(gscadr, GSCADR);
> -
> -	return 0;
> -
> -}
> -
> -static int mbxfb_ioctl_alphactl(struct mbxfb_alphaCtl *alpha)
> -{
> -	unsigned long vscadr, vbbase, vcmsk;
> -	unsigned long gscadr, gbbase, gdrctrl;
> -
> -	vbbase = Vbbase_Glalpha(alpha->overlay_global_alpha) |
> -				Vbbase_Colkey(alpha->overlay_colorkey);
> -
> -	gbbase = Gbbase_Glalpha(alpha->graphics_global_alpha) |
> -				Gbbase_Colkey(alpha->graphics_colorkey);
> -
> -	vcmsk = readl(VCMSK);
> -	vcmsk &= ~(FMsk(VCMSK_COLKEY_M));
> -	vcmsk |= Vcmsk_colkey_m(alpha->overlay_colorkey_mask);
> -
> -	gdrctrl = readl(GDRCTRL);
> -	gdrctrl &= ~(FMsk(GDRCTRL_COLKEYM));
> -	gdrctrl |= Gdrctrl_Colkeym(alpha->graphics_colorkey_mask);
> -
> -	vscadr = readl(VSCADR);
> -	vscadr &= ~(FMsk(VSCADR_BLEND_M) | VSCADR_COLKEYSRC | VSCADR_COLKEY_EN);
> -
> -	gscadr = readl(GSCADR);
> -	gscadr &= ~(FMsk(GSCADR_BLEND_M) | GSCADR_COLKEY_EN | GSCADR_COLKEYSRC);
> -
> -	switch (alpha->overlay_colorkey_mode) {
> -	case MBXFB_COLORKEY_DISABLED:
> -		break;
> -	case MBXFB_COLORKEY_PREVIOUS:
> -		vscadr |= VSCADR_COLKEY_EN;
> -		break;
> -	case MBXFB_COLORKEY_CURRENT:
> -		vscadr |= VSCADR_COLKEY_EN | VSCADR_COLKEYSRC;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	switch (alpha->overlay_blend_mode) {
> -	case MBXFB_ALPHABLEND_NONE:
> -		vscadr |= VSCADR_BLEND_NONE;
> -		break;
> -	case MBXFB_ALPHABLEND_GLOBAL:
> -		vscadr |= VSCADR_BLEND_GLOB;
> -		break;
> -	case MBXFB_ALPHABLEND_PIXEL:
> -		vscadr |= VSCADR_BLEND_PIX;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	switch (alpha->graphics_colorkey_mode) {
> -	case MBXFB_COLORKEY_DISABLED:
> -		break;
> -	case MBXFB_COLORKEY_PREVIOUS:
> -		gscadr |= GSCADR_COLKEY_EN;
> -		break;
> -	case MBXFB_COLORKEY_CURRENT:
> -		gscadr |= GSCADR_COLKEY_EN | GSCADR_COLKEYSRC;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	switch (alpha->graphics_blend_mode) {
> -	case MBXFB_ALPHABLEND_NONE:
> -		gscadr |= GSCADR_BLEND_NONE;
> -		break;
> -	case MBXFB_ALPHABLEND_GLOBAL:
> -		gscadr |= GSCADR_BLEND_GLOB;
> -		break;
> -	case MBXFB_ALPHABLEND_PIXEL:
> -		gscadr |= GSCADR_BLEND_PIX;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	write_reg_dly(vbbase, VBBASE);
> -	write_reg_dly(gbbase, GBBASE);
> -	write_reg_dly(vcmsk, VCMSK);
> -	write_reg_dly(gdrctrl, GDRCTRL);
> -	write_reg_dly(gscadr, GSCADR);
> -	write_reg_dly(vscadr, VSCADR);
> -
> -	return 0;
> -}
> -
> -static int mbxfb_ioctl(struct fb_info *info, unsigned int cmd,
> -				unsigned long arg)
> -{
> -	struct mbxfb_overlaySetup	setup;
> -	struct mbxfb_planeorder 	porder;
> -	struct mbxfb_alphaCtl 		alpha;
> -	struct mbxfb_reg			reg;
> -	int res;
> -	__u32 tmp;
> -
> -	switch (cmd)
> -	{
> -		case MBXFB_IOCX_OVERLAY:
> -			if (copy_from_user(&setup, (void __user*)arg,
> -						sizeof(struct mbxfb_overlaySetup)))
> -				return -EFAULT;
> -
> -			res = mbxfb_setupOverlay(&setup);
> -			if (res)
> -				return res;
> -
> -			if (copy_to_user((void __user*)arg, &setup,
> -						sizeof(struct mbxfb_overlaySetup)))
> -				return -EFAULT;
> -
> -			return 0;
> -
> -		case MBXFB_IOCS_PLANEORDER:
> -			if (copy_from_user(&porder, (void __user*)arg,
> -					sizeof(struct mbxfb_planeorder)))
> -				return -EFAULT;
> -
> -			return mbxfb_ioctl_planeorder(&porder);
> -
> -		case MBXFB_IOCS_ALPHA:
> -			if (copy_from_user(&alpha, (void __user*)arg,
> -					sizeof(struct mbxfb_alphaCtl)))
> -				return -EFAULT;
> -
> -			return mbxfb_ioctl_alphactl(&alpha);
> -
> -		case MBXFB_IOCS_REG:
> -			if (copy_from_user(&reg, (void __user*)arg,
> -						sizeof(struct mbxfb_reg)))
> -				return -EFAULT;
> -
> -			if (reg.addr >= 0x10000) /* regs are from 0x3fe0000 to 0x3feffff */
> -				return -EINVAL;
> -
> -			tmp = readl(virt_base_2700 + reg.addr);
> -			tmp &= ~reg.mask;
> -			tmp |= reg.val & reg.mask;
> -			writel(tmp, virt_base_2700 + reg.addr);
> -
> -			return 0;
> -		case MBXFB_IOCX_REG:
> -			if (copy_from_user(&reg, (void __user*)arg,
> -						sizeof(struct mbxfb_reg)))
> -				return -EFAULT;
> -
> -			if (reg.addr >= 0x10000)	/* regs are from 0x3fe0000 to 0x3feffff */
> -				return -EINVAL;
> -			reg.val = readl(virt_base_2700 + reg.addr);
> -
> -			if (copy_to_user((void __user*)arg, &reg,
> -						sizeof(struct mbxfb_reg)))
> -				return -EFAULT;
> -
> -			return 0;
> -	}
> -	return -EINVAL;
> -}
> -
> -static const struct fb_ops mbxfb_ops = {
> -	.owner = THIS_MODULE,
> -	.fb_check_var = mbxfb_check_var,
> -	.fb_set_par = mbxfb_set_par,
> -	.fb_setcolreg = mbxfb_setcolreg,
> -	.fb_fillrect = cfb_fillrect,
> -	.fb_copyarea = cfb_copyarea,
> -	.fb_imageblit = cfb_imageblit,
> -	.fb_blank = mbxfb_blank,
> -	.fb_ioctl = mbxfb_ioctl,
> -};
> -
> -/*
> -  Enable external SDRAM controller. Assume that all clocks are active
> -  by now.
> -*/
> -static void setup_memc(struct fb_info *fbi)
> -{
> -	unsigned long tmp;
> -	int i;
> -
> -	/* FIXME: use platform specific parameters */
> -	/* setup SDRAM controller */
> -	write_reg_dly((LMCFG_LMC_DS | LMCFG_LMC_TS | LMCFG_LMD_TS |
> -		LMCFG_LMA_TS),
> -	       LMCFG);
> -
> -	write_reg_dly(LMPWR_MC_PWR_ACT, LMPWR);
> -
> -	/* setup SDRAM timings */
> -	write_reg_dly((Lmtim_Tras(7) | Lmtim_Trp(3) | Lmtim_Trcd(3) |
> -		Lmtim_Trc(9) | Lmtim_Tdpl(2)),
> -	       LMTIM);
> -	/* setup SDRAM refresh rate */
> -	write_reg_dly(0xc2b, LMREFRESH);
> -	/* setup SDRAM type parameters */
> -	write_reg_dly((LMTYPE_CASLAT_3 | LMTYPE_BKSZ_2 | LMTYPE_ROWSZ_11 |
> -		LMTYPE_COLSZ_8),
> -	       LMTYPE);
> -	/* enable memory controller */
> -	write_reg_dly(LMPWR_MC_PWR_ACT, LMPWR);
> -	/* perform dummy reads */
> -	for ( i = 0; i < 16; i++ ) {
> -		tmp = readl(fbi->screen_base);
> -	}
> -}
> -
> -static void enable_clocks(struct fb_info *fbi)
> -{
> -	/* enable clocks */
> -	write_reg_dly(SYSCLKSRC_PLL_2, SYSCLKSRC);
> -	write_reg_dly(PIXCLKSRC_PLL_1, PIXCLKSRC);
> -	write_reg_dly(0x00000000, CLKSLEEP);
> -
> -	/* PLL output = (Frefclk * M) / (N * 2^P )
> -	 *
> -	 * M: 0x17, N: 0x3, P: 0x0 == 100 Mhz!
> -	 * M: 0xb, N: 0x1, P: 0x1 == 71 Mhz
> -	 * */
> -	write_reg_dly((Core_Pll_M(0xb) | Core_Pll_N(0x1) | Core_Pll_P(0x1) |
> -		CORE_PLL_EN),
> -	       COREPLL);
> -
> -	write_reg_dly((Disp_Pll_M(0x1b) | Disp_Pll_N(0x7) | Disp_Pll_P(0x1) |
> -		DISP_PLL_EN),
> -	       DISPPLL);
> -
> -	write_reg_dly(0x00000000, VOVRCLK);
> -	write_reg_dly(PIXCLK_EN, PIXCLK);
> -	write_reg_dly(MEMCLK_EN, MEMCLK);
> -	write_reg_dly(0x00000001, M24CLK);
> -	write_reg_dly(0x00000001, MBXCLK);
> -	write_reg_dly(SDCLK_EN, SDCLK);
> -	write_reg_dly(0x00000001, PIXCLKDIV);
> -}
> -
> -static void setup_graphics(struct fb_info *fbi)
> -{
> -	unsigned long gsctrl;
> -	unsigned long vscadr;
> -
> -	gsctrl = GSCTRL_GAMMA_EN | Gsctrl_Width(fbi->var.xres) |
> -		Gsctrl_Height(fbi->var.yres);
> -	switch (fbi->var.bits_per_pixel) {
> -	case 16:
> -		if (fbi->var.green.length == 5)
> -			gsctrl |= GSCTRL_GPIXFMT_ARGB1555;
> -		else
> -			gsctrl |= GSCTRL_GPIXFMT_RGB565;
> -		break;
> -	case 24:
> -		gsctrl |= GSCTRL_GPIXFMT_RGB888;
> -		break;
> -	case 32:
> -		gsctrl |= GSCTRL_GPIXFMT_ARGB8888;
> -		break;
> -	}
> -
> -	write_reg_dly(gsctrl, GSCTRL);
> -	write_reg_dly(0x00000000, GBBASE);
> -	write_reg_dly(0x00ffffff, GDRCTRL);
> -	write_reg_dly((GSCADR_STR_EN | Gscadr_Gbase_Adr(0x6000)), GSCADR);
> -	write_reg_dly(0x00000000, GPLUT);
> -
> -	vscadr = readl(VSCADR);
> -	vscadr &= ~(FMsk(VSCADR_BLEND_POS) | FMsk(VSCADR_BLEND_M));
> -	vscadr |= VSCADR_BLEND_VID | VSCADR_BLEND_NONE;
> -	write_reg_dly(vscadr, VSCADR);
> -}
> -
> -static void setup_display(struct fb_info *fbi)
> -{
> -	unsigned long dsctrl = 0;
> -
> -	dsctrl = DSCTRL_BLNK_POL;
> -	if (fbi->var.sync & FB_SYNC_HOR_HIGH_ACT)
> -		dsctrl |= DSCTRL_HS_POL;
> -	if (fbi->var.sync & FB_SYNC_VERT_HIGH_ACT)
> -		dsctrl |= DSCTRL_VS_POL;
> -	write_reg_dly(dsctrl, DSCTRL);
> -	write_reg_dly(0xd0303010, DMCTRL);
> -	write_reg_dly((readl(DSCTRL) | DSCTRL_SYNCGEN_EN), DSCTRL);
> -}
> -
> -static void enable_controller(struct fb_info *fbi)
> -{
> -	u32 svctrl, shctrl;
> -
> -	write_reg_dly(SYSRST_RST, SYSRST);
> -
> -	/* setup a timeout, raise drive strength */
> -	write_reg_dly(0xffffff0c, SYSCFG);
> -
> -	enable_clocks(fbi);
> -	setup_memc(fbi);
> -	setup_graphics(fbi);
> -	setup_display(fbi);
> -
> -	shctrl = readl(SHCTRL);
> -	shctrl &= ~(FMsk(SHCTRL_HINITIAL));
> -	shctrl |= Shctrl_Hinitial(4<<11);
> -	writel(shctrl, SHCTRL);
> -
> -	svctrl = Svctrl_Initial1(1<<10) | Svctrl_Initial2(1<<10);
> -	writel(svctrl, SVCTRL);
> -
> -	writel(SPOCTRL_H_SC_BP | SPOCTRL_V_SC_BP | SPOCTRL_VORDER_4TAP
> -			, SPOCTRL);
> -
> -	/* Those coefficients are good for scaling up. For scaling
> -	 * down, the application has to calculate them. */
> -	write_reg(0xff000100, VSCOEFF0);
> -	write_reg(0xfdfcfdfe, VSCOEFF1);
> -	write_reg(0x170d0500, VSCOEFF2);
> -	write_reg(0x3d372d22, VSCOEFF3);
> -	write_reg(0x00000040, VSCOEFF4);
> -
> -	write_reg(0xff010100, HSCOEFF0);
> -	write_reg(0x00000000, HSCOEFF1);
> -	write_reg(0x02010000, HSCOEFF2);
> -	write_reg(0x01020302, HSCOEFF3);
> -	write_reg(0xf9fbfe00, HSCOEFF4);
> -	write_reg(0xfbf7f6f7, HSCOEFF5);
> -	write_reg(0x1c110700, HSCOEFF6);
> -	write_reg(0x3e393127, HSCOEFF7);
> -	write_reg(0x00000040, HSCOEFF8);
> -
> -}
> -
> -#ifdef CONFIG_PM
> -/*
> - * Power management hooks.  Note that we won't be called from IRQ context,
> - * unlike the blank functions above, so we may sleep.
> - */
> -static int mbxfb_suspend(struct platform_device *dev, pm_message_t state)
> -{
> -	/* make frame buffer memory enter self-refresh mode */
> -	write_reg_dly(LMPWR_MC_PWR_SRM, LMPWR);
> -	while (readl(LMPWRSTAT) != LMPWRSTAT_MC_PWR_SRM)
> -		; /* empty statement */
> -
> -	/* reset the device, since it's initial state is 'mostly sleeping' */
> -	write_reg_dly(SYSRST_RST, SYSRST);
> -	return 0;
> -}
> -
> -static int mbxfb_resume(struct platform_device *dev)
> -{
> -	struct fb_info *fbi = platform_get_drvdata(dev);
> -
> -	enable_clocks(fbi);
> -/* 	setup_graphics(fbi); */
> -/* 	setup_display(fbi); */
> -
> -	write_reg_dly((readl(DSCTRL) | DSCTRL_SYNCGEN_EN), DSCTRL);
> -	return 0;
> -}
> -#else
> -#define mbxfb_suspend	NULL
> -#define mbxfb_resume	NULL
> -#endif
> -
> -/* debugfs entries */
> -#ifndef CONFIG_FB_MBX_DEBUG
> -#define mbxfb_debugfs_init(x)	do {} while(0)
> -#define mbxfb_debugfs_remove(x)	do {} while(0)
> -#else
> -#include "mbxdebugfs.c"
> -#endif
> -
> -#define res_size(_r) (((_r)->end - (_r)->start) + 1)
> -
> -static int mbxfb_probe(struct platform_device *dev)
> -{
> -	int ret;
> -	struct fb_info *fbi;
> -	struct mbxfb_info *mfbi;
> -	struct mbxfb_platform_data *pdata;
> -
> -	dev_dbg(&dev->dev, "mbxfb_probe\n");
> -
> -	pdata = dev_get_platdata(&dev->dev);
> -	if (!pdata) {
> -		dev_err(&dev->dev, "platform data is required\n");
> -		return -EINVAL;
> -	}
> -
> -	fbi = framebuffer_alloc(sizeof(struct mbxfb_info), &dev->dev);
> -	if (!fbi)
> -		return -ENOMEM;
> -
> -	mfbi = fbi->par;
> -	fbi->pseudo_palette = mfbi->pseudo_palette;
> -
> -
> -	if (pdata->probe)
> -		mfbi->platform_probe = pdata->probe;
> -	if (pdata->remove)
> -		mfbi->platform_remove = pdata->remove;
> -
> -	mfbi->fb_res = platform_get_resource(dev, IORESOURCE_MEM, 0);
> -	mfbi->reg_res = platform_get_resource(dev, IORESOURCE_MEM, 1);
> -
> -	if (!mfbi->fb_res || !mfbi->reg_res) {
> -		dev_err(&dev->dev, "no resources found\n");
> -		ret = -ENODEV;
> -		goto err1;
> -	}
> -
> -	mfbi->fb_req = request_mem_region(mfbi->fb_res->start,
> -					  res_size(mfbi->fb_res), dev->name);
> -	if (mfbi->fb_req == NULL) {
> -		dev_err(&dev->dev, "failed to claim framebuffer memory\n");
> -		ret = -EINVAL;
> -		goto err1;
> -	}
> -	mfbi->fb_phys_addr = mfbi->fb_res->start;
> -
> -	mfbi->reg_req = request_mem_region(mfbi->reg_res->start,
> -					   res_size(mfbi->reg_res), dev->name);
> -	if (mfbi->reg_req == NULL) {
> -		dev_err(&dev->dev, "failed to claim Marathon registers\n");
> -		ret = -EINVAL;
> -		goto err2;
> -	}
> -	mfbi->reg_phys_addr = mfbi->reg_res->start;
> -
> -	mfbi->reg_virt_addr = devm_ioremap(&dev->dev,
> -						   mfbi->reg_phys_addr,
> -						   res_size(mfbi->reg_req));
> -	if (!mfbi->reg_virt_addr) {
> -		dev_err(&dev->dev, "failed to ioremap Marathon registers\n");
> -		ret = -EINVAL;
> -		goto err3;
> -	}
> -	virt_base_2700 = mfbi->reg_virt_addr;
> -
> -	mfbi->fb_virt_addr = devm_ioremap(&dev->dev, mfbi->fb_phys_addr,
> -						  res_size(mfbi->fb_req));
> -	if (!mfbi->fb_virt_addr) {
> -		dev_err(&dev->dev, "failed to ioremap frame buffer\n");
> -		ret = -EINVAL;
> -		goto err3;
> -	}
> -
> -	fbi->screen_base = (char __iomem *)(mfbi->fb_virt_addr + 0x60000);
> -	fbi->screen_size = pdata->memsize;
> -	fbi->fbops = &mbxfb_ops;
> -
> -	fbi->var = mbxfb_default;
> -	fbi->fix = mbxfb_fix;
> -	fbi->fix.smem_start = mfbi->fb_phys_addr + 0x60000;
> -	fbi->fix.smem_len = pdata->memsize;
> -	fbi->fix.line_length = mbxfb_default.xres_virtual *
> -					mbxfb_default.bits_per_pixel / 8;
> -
> -	ret = fb_alloc_cmap(&fbi->cmap, 256, 0);
> -	if (ret < 0) {
> -		dev_err(&dev->dev, "fb_alloc_cmap failed\n");
> -		ret = -EINVAL;
> -		goto err3;
> -	}
> -
> -	platform_set_drvdata(dev, fbi);
> -
> -	fb_info(fbi, "mbx frame buffer device\n");
> -
> -	if (mfbi->platform_probe)
> -		mfbi->platform_probe(fbi);
> -
> -	enable_controller(fbi);
> -
> -	mbxfb_debugfs_init(fbi);
> -
> -	ret = register_framebuffer(fbi);
> -	if (ret < 0) {
> -		dev_err(&dev->dev, "register_framebuffer failed\n");
> -		ret = -EINVAL;
> -		goto err6;
> -	}
> -
> -	return 0;
> -
> -err6:
> -	fb_dealloc_cmap(&fbi->cmap);
> -err3:
> -	release_mem_region(mfbi->reg_res->start, res_size(mfbi->reg_res));
> -err2:
> -	release_mem_region(mfbi->fb_res->start, res_size(mfbi->fb_res));
> -err1:
> -	framebuffer_release(fbi);
> -
> -	return ret;
> -}
> -
> -static int mbxfb_remove(struct platform_device *dev)
> -{
> -	struct fb_info *fbi = platform_get_drvdata(dev);
> -
> -	write_reg_dly(SYSRST_RST, SYSRST);
> -
> -	mbxfb_debugfs_remove(fbi);
> -
> -	if (fbi) {
> -		struct mbxfb_info *mfbi = fbi->par;
> -
> -		unregister_framebuffer(fbi);
> -		if (mfbi) {
> -			if (mfbi->platform_remove)
> -				mfbi->platform_remove(fbi);
> -
> -
> -			if (mfbi->reg_req)
> -				release_mem_region(mfbi->reg_req->start,
> -						   res_size(mfbi->reg_req));
> -			if (mfbi->fb_req)
> -				release_mem_region(mfbi->fb_req->start,
> -						   res_size(mfbi->fb_req));
> -		}
> -		framebuffer_release(fbi);
> -	}
> -
> -	return 0;
> -}
> -
> -static struct platform_driver mbxfb_driver = {
> -	.probe = mbxfb_probe,
> -	.remove = mbxfb_remove,
> -	.suspend = mbxfb_suspend,
> -	.resume = mbxfb_resume,
> -	.driver = {
> -		.name = "mbx-fb",
> -	},
> -};
> -
> -module_platform_driver(mbxfb_driver);
> -
> -MODULE_DESCRIPTION("loadable framebuffer driver for Marathon device");
> -MODULE_AUTHOR("Mike Rapoport, Compulab");
> -MODULE_LICENSE("GPL");
> diff --git a/drivers/video/fbdev/mbx/reg_bits.h b/drivers/video/fbdev/mbx/reg_bits.h
> deleted file mode 100644
> index 6607f353639b..000000000000
> --- a/drivers/video/fbdev/mbx/reg_bits.h
> +++ /dev/null
> @@ -1,614 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __REG_BITS_2700G_
> -#define __REG_BITS_2700G_
> -
> -/* use defines from asm-arm/arch-pxa/bitfields.h for bit fields access */
> -#define UData(Data)	((unsigned long) (Data))
> -#define Fld(Size, Shft)	(((Size) << 16) + (Shft))
> -#define FSize(Field)	((Field) >> 16)
> -#define FShft(Field)	((Field) & 0x0000FFFF)
> -#define FMsk(Field)	(((UData (1) << FSize (Field)) - 1) << FShft (Field))
> -#define FAlnMsk(Field)	((UData (1) << FSize (Field)) - 1)
> -#define F1stBit(Field)	(UData (1) << FShft (Field))
> -
> -#define SYSRST_RST	(1 << 0)
> -
> -/* SYSCLKSRC - SYSCLK Source Control Register */
> -#define SYSCLKSRC_SEL	Fld(2,0)
> -#define SYSCLKSRC_REF	((0x0) << FShft(SYSCLKSRC_SEL))
> -#define SYSCLKSRC_PLL_1	((0x1) << FShft(SYSCLKSRC_SEL))
> -#define SYSCLKSRC_PLL_2	((0x2) << FShft(SYSCLKSRC_SEL))
> -
> -/* PIXCLKSRC - PIXCLK Source Control Register */
> -#define PIXCLKSRC_SEL	Fld(2,0)
> -#define PIXCLKSRC_REF	((0x0) << FShft(PIXCLKSRC_SEL))
> -#define PIXCLKSRC_PLL_1	((0x1) << FShft(PIXCLKSRC_SEL))
> -#define PIXCLKSRC_PLL_2	((0x2) << FShft(PIXCLKSRC_SEL))
> -
> -/* Clock Disable Register */
> -#define CLKSLEEP_SLP	(1 << 0)
> -
> -/* Core PLL Control Register */
> -#define CORE_PLL_M	Fld(6,7)
> -#define Core_Pll_M(x)	((x) << FShft(CORE_PLL_M))
> -#define CORE_PLL_N	Fld(3,4)
> -#define Core_Pll_N(x)	((x) << FShft(CORE_PLL_N))
> -#define CORE_PLL_P	Fld(3,1)
> -#define Core_Pll_P(x)	((x) << FShft(CORE_PLL_P))
> -#define CORE_PLL_EN	(1 << 0)
> -
> -/* Display PLL Control Register */
> -#define DISP_PLL_M	Fld(6,7)
> -#define Disp_Pll_M(x)	((x) << FShft(DISP_PLL_M))
> -#define DISP_PLL_N	Fld(3,4)
> -#define Disp_Pll_N(x)	((x) << FShft(DISP_PLL_N))
> -#define DISP_PLL_P	Fld(3,1)
> -#define Disp_Pll_P(x)	((x) << FShft(DISP_PLL_P))
> -#define DISP_PLL_EN	(1 << 0)
> -
> -/* PLL status register */
> -#define PLLSTAT_CORE_PLL_LOST_L	(1 << 3)
> -#define PLLSTAT_CORE_PLL_LSTS	(1 << 2)
> -#define PLLSTAT_DISP_PLL_LOST_L	(1 << 1)
> -#define PLLSTAT_DISP_PLL_LSTS	(1 << 0)
> -
> -/* Video and scale clock control register */
> -#define VOVRCLK_EN	(1 << 0)
> -
> -/* Pixel clock control register */
> -#define PIXCLK_EN	(1 << 0)
> -
> -/* Memory clock control register */
> -#define MEMCLK_EN	(1 << 0)
> -
> -/* MBX clock control register */
> -#define MBXCLK_DIV	Fld(2,2)
> -#define MBXCLK_DIV_1	((0x0) << FShft(MBXCLK_DIV))
> -#define MBXCLK_DIV_2	((0x1) << FShft(MBXCLK_DIV))
> -#define MBXCLK_DIV_3	((0x2) << FShft(MBXCLK_DIV))
> -#define MBXCLK_DIV_4	((0x3) << FShft(MBXCLK_DIV))
> -#define MBXCLK_EN	Fld(2,0)
> -#define MBXCLK_EN_NONE	((0x0) << FShft(MBXCLK_EN))
> -#define MBXCLK_EN_2D	((0x1) << FShft(MBXCLK_EN))
> -#define MBXCLK_EN_BOTH	((0x2) << FShft(MBXCLK_EN))
> -
> -/* M24 clock control register */
> -#define M24CLK_DIV	Fld(2,1)
> -#define M24CLK_DIV_1	((0x0) << FShft(M24CLK_DIV))
> -#define M24CLK_DIV_2	((0x1) << FShft(M24CLK_DIV))
> -#define M24CLK_DIV_3	((0x2) << FShft(M24CLK_DIV))
> -#define M24CLK_DIV_4	((0x3) << FShft(M24CLK_DIV))
> -#define M24CLK_EN	(1 << 0)
> -
> -/* SDRAM clock control register */
> -#define SDCLK_EN	(1 << 0)
> -
> -/* PixClk Divisor Register */
> -#define PIXCLKDIV_PD	Fld(9,0)
> -#define Pixclkdiv_Pd(x)	((x) << FShft(PIXCLKDIV_PD))
> -
> -/* LCD Config control register */
> -#define LCDCFG_IN_FMT	Fld(3,28)
> -#define Lcdcfg_In_Fmt(x)	((x) << FShft(LCDCFG_IN_FMT))
> -#define LCDCFG_LCD1DEN_POL	(1 << 27)
> -#define LCDCFG_LCD1FCLK_POL	(1 << 26)
> -#define LCDCFG_LCD1LCLK_POL	(1 << 25)
> -#define LCDCFG_LCD1D_POL	(1 << 24)
> -#define LCDCFG_LCD2DEN_POL	(1 << 23)
> -#define LCDCFG_LCD2FCLK_POL	(1 << 22)
> -#define LCDCFG_LCD2LCLK_POL	(1 << 21)
> -#define LCDCFG_LCD2D_POL	(1 << 20)
> -#define LCDCFG_LCD1_TS		(1 << 19)
> -#define LCDCFG_LCD1D_DS		(1 << 18)
> -#define LCDCFG_LCD1C_DS		(1 << 17)
> -#define LCDCFG_LCD1_IS_IN	(1 << 16)
> -#define LCDCFG_LCD2_TS		(1 << 3)
> -#define LCDCFG_LCD2D_DS		(1 << 2)
> -#define LCDCFG_LCD2C_DS		(1 << 1)
> -#define LCDCFG_LCD2_IS_IN	(1 << 0)
> -
> -/* On-Die Frame Buffer Power Control Register */
> -#define ODFBPWR_SLOW	(1 << 2)
> -#define ODFBPWR_MODE	Fld(2,0)
> -#define ODFBPWR_MODE_ACT	((0x0) << FShft(ODFBPWR_MODE))
> -#define ODFBPWR_MODE_ACT_LP	((0x1) << FShft(ODFBPWR_MODE))
> -#define ODFBPWR_MODE_SLEEP	((0x2) << FShft(ODFBPWR_MODE))
> -#define ODFBPWR_MODE_SHUTD	((0x3) << FShft(ODFBPWR_MODE))
> -
> -/* On-Die Frame Buffer Power State Status Register */
> -#define ODFBSTAT_ACT	(1 << 2)
> -#define ODFBSTAT_SLP	(1 << 1)
> -#define ODFBSTAT_SDN	(1 << 0)
> -
> -/* LMRST - Local Memory (SDRAM) Reset */
> -#define LMRST_MC_RST	(1 << 0)
> -
> -/* LMCFG - Local Memory (SDRAM) Configuration Register */
> -#define LMCFG_LMC_DS	(1 << 5)
> -#define LMCFG_LMD_DS	(1 << 4)
> -#define LMCFG_LMA_DS	(1 << 3)
> -#define LMCFG_LMC_TS	(1 << 2)
> -#define LMCFG_LMD_TS	(1 << 1)
> -#define LMCFG_LMA_TS	(1 << 0)
> -
> -/* LMPWR - Local Memory (SDRAM) Power Control Register */
> -#define LMPWR_MC_PWR_CNT	Fld(2,0)
> -#define LMPWR_MC_PWR_ACT	((0x0) << FShft(LMPWR_MC_PWR_CNT)) /* Active */
> -#define LMPWR_MC_PWR_SRM	((0x1) << FShft(LMPWR_MC_PWR_CNT)) /* Self-refresh */
> -#define LMPWR_MC_PWR_DPD	((0x3) << FShft(LMPWR_MC_PWR_CNT)) /* deep power down */
> -
> -/* LMPWRSTAT - Local Memory (SDRAM) Power Status Register */
> -#define LMPWRSTAT_MC_PWR_CNT	Fld(2,0)
> -#define LMPWRSTAT_MC_PWR_ACT	((0x0) << FShft(LMPWRSTAT_MC_PWR_CNT)) /* Active */
> -#define LMPWRSTAT_MC_PWR_SRM	((0x1) << FShft(LMPWRSTAT_MC_PWR_CNT)) /* Self-refresh */
> -#define LMPWRSTAT_MC_PWR_DPD	((0x3) << FShft(LMPWRSTAT_MC_PWR_CNT)) /* deep power down */
> -
> -/* LMTYPE - Local Memory (SDRAM) Type Register */
> -#define LMTYPE_CASLAT	Fld(3,10)
> -#define LMTYPE_CASLAT_1	((0x1) << FShft(LMTYPE_CASLAT))
> -#define LMTYPE_CASLAT_2	((0x2) << FShft(LMTYPE_CASLAT))
> -#define LMTYPE_CASLAT_3	((0x3) << FShft(LMTYPE_CASLAT))
> -#define LMTYPE_BKSZ	Fld(2,8)
> -#define LMTYPE_BKSZ_1	((0x1) << FShft(LMTYPE_BKSZ))
> -#define LMTYPE_BKSZ_2	((0x2) << FShft(LMTYPE_BKSZ))
> -#define LMTYPE_ROWSZ	Fld(4,4)
> -#define LMTYPE_ROWSZ_11	((0xb) << FShft(LMTYPE_ROWSZ))
> -#define LMTYPE_ROWSZ_12	((0xc) << FShft(LMTYPE_ROWSZ))
> -#define LMTYPE_ROWSZ_13	((0xd) << FShft(LMTYPE_ROWSZ))
> -#define LMTYPE_COLSZ	Fld(4,0)
> -#define LMTYPE_COLSZ_7	((0x7) << FShft(LMTYPE_COLSZ))
> -#define LMTYPE_COLSZ_8	((0x8) << FShft(LMTYPE_COLSZ))
> -#define LMTYPE_COLSZ_9	((0x9) << FShft(LMTYPE_COLSZ))
> -#define LMTYPE_COLSZ_10	((0xa) << FShft(LMTYPE_COLSZ))
> -#define LMTYPE_COLSZ_11	((0xb) << FShft(LMTYPE_COLSZ))
> -#define LMTYPE_COLSZ_12	((0xc) << FShft(LMTYPE_COLSZ))
> -
> -/* LMTIM - Local Memory (SDRAM) Timing Register */
> -#define LMTIM_TRAS	Fld(4,16)
> -#define Lmtim_Tras(x)	((x) << FShft(LMTIM_TRAS))
> -#define LMTIM_TRP	Fld(4,12)
> -#define Lmtim_Trp(x)	((x) << FShft(LMTIM_TRP))
> -#define LMTIM_TRCD	Fld(4,8)
> -#define Lmtim_Trcd(x)	((x) << FShft(LMTIM_TRCD))
> -#define LMTIM_TRC	Fld(4,4)
> -#define Lmtim_Trc(x)	((x) << FShft(LMTIM_TRC))
> -#define LMTIM_TDPL	Fld(4,0)
> -#define Lmtim_Tdpl(x)	((x) << FShft(LMTIM_TDPL))
> -
> -/* LMREFRESH - Local Memory (SDRAM) tREF Control Register */
> -#define LMREFRESH_TREF	Fld(2,0)
> -#define Lmrefresh_Tref(x)	((x) << FShft(LMREFRESH_TREF))
> -
> -/* GSCTRL - Graphics surface control register */
> -#define GSCTRL_LUT_EN	(1 << 31)
> -#define GSCTRL_GPIXFMT	Fld(4,27)
> -#define GSCTRL_GPIXFMT_INDEXED	((0x0) << FShft(GSCTRL_GPIXFMT))
> -#define GSCTRL_GPIXFMT_ARGB4444	((0x4) << FShft(GSCTRL_GPIXFMT))
> -#define GSCTRL_GPIXFMT_ARGB1555	((0x5) << FShft(GSCTRL_GPIXFMT))
> -#define GSCTRL_GPIXFMT_RGB888	((0x6) << FShft(GSCTRL_GPIXFMT))
> -#define GSCTRL_GPIXFMT_RGB565	((0x7) << FShft(GSCTRL_GPIXFMT))
> -#define GSCTRL_GPIXFMT_ARGB8888	((0x8) << FShft(GSCTRL_GPIXFMT))
> -#define GSCTRL_GAMMA_EN	(1 << 26)
> -
> -#define GSCTRL_GSWIDTH Fld(11,11)
> -#define Gsctrl_Width(Pixel)	/* Display Width [1..2048 pix.]  */ \
> -                        (((Pixel) - 1) << FShft(GSCTRL_GSWIDTH))
> -
> -#define GSCTRL_GSHEIGHT Fld(11,0)
> -#define Gsctrl_Height(Pixel)	/* Display Height [1..2048 pix.]  */ \
> -                        (((Pixel) - 1) << FShft(GSCTRL_GSHEIGHT))
> -
> -/* GBBASE fileds */
> -#define GBBASE_GLALPHA Fld(8,24)
> -#define Gbbase_Glalpha(x)	((x) << FShft(GBBASE_GLALPHA))
> -
> -#define GBBASE_COLKEY Fld(24,0)
> -#define Gbbase_Colkey(x)	((x) << FShft(GBBASE_COLKEY))
> -
> -/* GDRCTRL fields */
> -#define GDRCTRL_PIXDBL	(1 << 31)
> -#define GDRCTRL_PIXHLV	(1 << 30)
> -#define GDRCTRL_LNDBL	(1 << 29)
> -#define GDRCTRL_LNHLV	(1 << 28)
> -#define GDRCTRL_COLKEYM	Fld(24,0)
> -#define Gdrctrl_Colkeym(x)	((x) << FShft(GDRCTRL_COLKEYM))
> -
> -/* GSCADR graphics stream control address register fields */
> -#define GSCADR_STR_EN	(1 << 31)
> -#define GSCADR_COLKEY_EN	(1 << 30)
> -#define GSCADR_COLKEYSRC	(1 << 29)
> -#define GSCADR_BLEND_M	Fld(2,27)
> -#define GSCADR_BLEND_NONE	((0x0) << FShft(GSCADR_BLEND_M))
> -#define GSCADR_BLEND_INV	((0x1) << FShft(GSCADR_BLEND_M))
> -#define GSCADR_BLEND_GLOB	((0x2) << FShft(GSCADR_BLEND_M))
> -#define GSCADR_BLEND_PIX	((0x3) << FShft(GSCADR_BLEND_M))
> -#define GSCADR_BLEND_POS	Fld(2,24)
> -#define GSCADR_BLEND_GFX	((0x0) << FShft(GSCADR_BLEND_POS))
> -#define GSCADR_BLEND_VID	((0x1) << FShft(GSCADR_BLEND_POS))
> -#define GSCADR_BLEND_CUR	((0x2) << FShft(GSCADR_BLEND_POS))
> -#define GSCADR_GBASE_ADR	Fld(23,0)
> -#define Gscadr_Gbase_Adr(x)	((x) << FShft(GSCADR_GBASE_ADR))
> -
> -/* GSADR graphics stride address register fields */
> -#define GSADR_SRCSTRIDE	Fld(10,22)
> -#define Gsadr_Srcstride(x)	((x) << FShft(GSADR_SRCSTRIDE))
> -#define GSADR_XSTART	Fld(11,11)
> -#define Gsadr_Xstart(x)		((x) << FShft(GSADR_XSTART))
> -#define GSADR_YSTART	Fld(11,0)
> -#define Gsadr_Ystart(y)		((y) << FShft(GSADR_YSTART))
> -
> -/* GPLUT graphics palette register fields */
> -#define GPLUT_LUTADR	Fld(8,24)
> -#define Gplut_Lutadr(x)	((x) << FShft(GPLUT_LUTADR))
> -#define GPLUT_LUTDATA	Fld(24,0)
> -#define Gplut_Lutdata(x)	((x) << FShft(GPLUT_LUTDATA))
> -
> -/* VSCTRL - Video Surface Control Register */
> -#define VSCTRL_VPIXFMT		Fld(4,27)
> -#define VSCTRL_VPIXFMT_YUV12	((0x9) << FShft(VSCTRL_VPIXFMT))
> -#define VSCTRL_VPIXFMT_UY0VY1	((0xc) << FShft(VSCTRL_VPIXFMT))
> -#define VSCTRL_VPIXFMT_VY0UY1	((0xd) << FShft(VSCTRL_VPIXFMT))
> -#define VSCTRL_VPIXFMT_Y0UY1V	((0xe) << FShft(VSCTRL_VPIXFMT))
> -#define VSCTRL_VPIXFMT_Y0VY1U	((0xf) << FShft(VSCTRL_VPIXFMT))
> -#define VSCTRL_GAMMA_EN		(1 << 26)
> -#define VSCTRL_CSC_EN		(1 << 25)
> -#define VSCTRL_COSITED		(1 << 22)
> -#define VSCTRL_VSWIDTH		Fld(11,11)
> -#define Vsctrl_Width(Pixels) /* Video Width [1-2048] */ \
> -			(((Pixels) - 1) << FShft(VSCTRL_VSWIDTH))
> -#define VSCTRL_VSHEIGHT		Fld(11,0)
> -#define Vsctrl_Height(Pixels) /* Video Height [1-2048] */ \
> -			(((Pixels) - 1) << FShft(VSCTRL_VSHEIGHT))
> -
> -/* VBBASE - Video Blending Base Register */
> -#define VBBASE_GLALPHA		Fld(8,24)
> -#define Vbbase_Glalpha(x)	((x) << FShft(VBBASE_GLALPHA))
> -
> -#define VBBASE_COLKEY		Fld(24,0)
> -#define Vbbase_Colkey(x)	((x) << FShft(VBBASE_COLKEY))
> -
> -/* VCMSK - Video Color Key Mask Register */
> -#define VCMSK_COLKEY_M		Fld(24,0)
> -#define Vcmsk_colkey_m(x)	((x) << FShft(VCMSK_COLKEY_M))
> -
> -/* VSCADR - Video Stream Control Rddress Register */
> -#define VSCADR_STR_EN		(1 << 31)
> -#define VSCADR_COLKEY_EN	(1 << 30)
> -#define VSCADR_COLKEYSRC	(1 << 29)
> -#define VSCADR_BLEND_M		Fld(2,27)
> -#define VSCADR_BLEND_NONE	((0x0) << FShft(VSCADR_BLEND_M))
> -#define VSCADR_BLEND_INV	((0x1) << FShft(VSCADR_BLEND_M))
> -#define VSCADR_BLEND_GLOB	((0x2) << FShft(VSCADR_BLEND_M))
> -#define VSCADR_BLEND_PIX	((0x3) << FShft(VSCADR_BLEND_M))
> -#define VSCADR_BLEND_POS	Fld(2,24)
> -#define VSCADR_BLEND_GFX	((0x0) << FShft(VSCADR_BLEND_POS))
> -#define VSCADR_BLEND_VID	((0x1) << FShft(VSCADR_BLEND_POS))
> -#define VSCADR_BLEND_CUR	((0x2) << FShft(VSCADR_BLEND_POS))
> -#define VSCADR_VBASE_ADR	Fld(23,0)
> -#define Vscadr_Vbase_Adr(x)	((x) << FShft(VSCADR_VBASE_ADR))
> -
> -/* VUBASE - Video U Base Register */
> -#define VUBASE_UVHALFSTR	(1 << 31)
> -#define VUBASE_UBASE_ADR	Fld(24,0)
> -#define Vubase_Ubase_Adr(x)	((x) << FShft(VUBASE_UBASE_ADR))
> -
> -/* VVBASE - Video V Base Register */
> -#define VVBASE_VBASE_ADR	Fld(24,0)
> -#define Vvbase_Vbase_Adr(x)	((x) << FShft(VVBASE_VBASE_ADR))
> -
> -/* VSADR - Video Stride Address Register */
> -#define VSADR_SRCSTRIDE		Fld(10,22)
> -#define Vsadr_Srcstride(x)	((x) << FShft(VSADR_SRCSTRIDE))
> -#define VSADR_XSTART		Fld(11,11)
> -#define Vsadr_Xstart(x)		((x) << FShft(VSADR_XSTART))
> -#define VSADR_YSTART		Fld(11,0)
> -#define Vsadr_Ystart(x)		((x) << FShft(VSADR_YSTART))
> -
> -/* VSCTRL - Video Surface Control Register */
> -#define VSCTRL_VPIXFMT		Fld(4,27)
> -#define VSCTRL_VPIXFMT_YUV12	((0x9) << FShft(VSCTRL_VPIXFMT))
> -#define VSCTRL_VPIXFMT_UY0VY1	((0xc) << FShft(VSCTRL_VPIXFMT))
> -#define VSCTRL_VPIXFMT_VY0UY1	((0xd) << FShft(VSCTRL_VPIXFMT))
> -#define VSCTRL_VPIXFMT_Y0UY1V	((0xe) << FShft(VSCTRL_VPIXFMT))
> -#define VSCTRL_VPIXFMT_Y0VY1U	((0xf) << FShft(VSCTRL_VPIXFMT))
> -#define VSCTRL_GAMMA_EN		(1 << 26)
> -#define VSCTRL_CSC_EN		(1 << 25)
> -#define VSCTRL_COSITED		(1 << 22)
> -#define VSCTRL_VSWIDTH		Fld(11,11)
> -#define Vsctrl_Width(Pixels) /* Video Width [1-2048] */ \
> -			(((Pixels) - 1) << FShft(VSCTRL_VSWIDTH))
> -#define VSCTRL_VSHEIGHT		Fld(11,0)
> -#define Vsctrl_Height(Pixels) /* Video Height [1-2048] */ \
> -			(((Pixels) - 1) << FShft(VSCTRL_VSHEIGHT))
> -
> -/* VBBASE - Video Blending Base Register */
> -#define VBBASE_GLALPHA		Fld(8,24)
> -#define Vbbase_Glalpha(x)	((x) << FShft(VBBASE_GLALPHA))
> -
> -#define VBBASE_COLKEY		Fld(24,0)
> -#define Vbbase_Colkey(x)	((x) << FShft(VBBASE_COLKEY))
> -
> -/* VCMSK - Video Color Key Mask Register */
> -#define VCMSK_COLKEY_M		Fld(24,0)
> -#define Vcmsk_colkey_m(x)	((x) << FShft(VCMSK_COLKEY_M))
> -
> -/* VSCADR - Video Stream Control Rddress Register */
> -#define VSCADR_STR_EN		(1 << 31)
> -#define VSCADR_COLKEY_EN	(1 << 30)
> -#define VSCADR_COLKEYSRC	(1 << 29)
> -#define VSCADR_BLEND_M		Fld(2,27)
> -#define VSCADR_BLEND_NONE	((0x0) << FShft(VSCADR_BLEND_M))
> -#define VSCADR_BLEND_INV	((0x1) << FShft(VSCADR_BLEND_M))
> -#define VSCADR_BLEND_GLOB	((0x2) << FShft(VSCADR_BLEND_M))
> -#define VSCADR_BLEND_PIX	((0x3) << FShft(VSCADR_BLEND_M))
> -#define VSCADR_BLEND_POS	Fld(2,24)
> -#define VSCADR_BLEND_GFX	((0x0) << FShft(VSCADR_BLEND_POS))
> -#define VSCADR_BLEND_VID	((0x1) << FShft(VSCADR_BLEND_POS))
> -#define VSCADR_BLEND_CUR	((0x2) << FShft(VSCADR_BLEND_POS))
> -#define VSCADR_VBASE_ADR	Fld(23,0)
> -#define Vscadr_Vbase_Adr(x)	((x) << FShft(VSCADR_VBASE_ADR))
> -
> -/* VUBASE - Video U Base Register */
> -#define VUBASE_UVHALFSTR	(1 << 31)
> -#define VUBASE_UBASE_ADR	Fld(24,0)
> -#define Vubase_Ubase_Adr(x)	((x) << FShft(VUBASE_UBASE_ADR))
> -
> -/* VVBASE - Video V Base Register */
> -#define VVBASE_VBASE_ADR	Fld(24,0)
> -#define Vvbase_Vbase_Adr(x)	((x) << FShft(VVBASE_VBASE_ADR))
> -
> -/* VSADR - Video Stride Address Register */
> -#define VSADR_SRCSTRIDE		Fld(10,22)
> -#define Vsadr_Srcstride(x)	((x) << FShft(VSADR_SRCSTRIDE))
> -#define VSADR_XSTART		Fld(11,11)
> -#define Vsadr_Xstart(x)		((x) << FShft(VSADR_XSTART))
> -#define VSADR_YSTART		Fld(11,0)
> -#define Vsadr_Ystart(x)		((x) << FShft(VSADR_YSTART))
> -
> -/* HCCTRL - Hardware Cursor Register fields */
> -#define HCCTRL_CUR_EN	(1 << 31)
> -#define HCCTRL_COLKEY_EN	(1 << 29)
> -#define HCCTRL_COLKEYSRC	(1 << 28)
> -#define HCCTRL_BLEND_M	Fld(2,26)
> -#define HCCTRL_BLEND_NONE	((0x0) << FShft(HCCTRL_BLEND_M))
> -#define HCCTRL_BLEND_INV	((0x1) << FShft(HCCTRL_BLEND_M))
> -#define HCCTRL_BLEND_GLOB	((0x2) << FShft(HCCTRL_BLEND_M))
> -#define HCCTRL_BLEND_PIX	((0x3) << FShft(HCCTRL_BLEND_M))
> -#define HCCTRL_CPIXFMT	Fld(3,23)
> -#define HCCTRL_CPIXFMT_RGB332	((0x3) << FShft(HCCTRL_CPIXFMT))
> -#define HCCTRL_CPIXFMT_ARGB4444	((0x4) << FShft(HCCTRL_CPIXFMT))
> -#define HCCTRL_CPIXFMT_ARGB1555	((0x5) << FShft(HCCTRL_CPIXFMT))
> -#define HCCTRL_CBASE_ADR	Fld(23,0)
> -#define Hcctrl_Cbase_Adr(x)	((x) << FShft(HCCTRL_CBASE_ADR))
> -
> -/* HCSIZE Hardware Cursor Size Register fields */
> -#define HCSIZE_BLEND_POS	Fld(2,29)
> -#define HCSIZE_BLEND_GFX	((0x0) << FShft(HCSIZE_BLEND_POS))
> -#define HCSIZE_BLEND_VID	((0x1) << FShft(HCSIZE_BLEND_POS))
> -#define HCSIZE_BLEND_CUR	((0x2) << FShft(HCSIZE_BLEND_POS))
> -#define HCSIZE_CWIDTH	Fld(3,16)
> -#define Hcsize_Cwidth(x)	((x) << FShft(HCSIZE_CWIDTH))
> -#define HCSIZE_CHEIGHT	Fld(3,0)
> -#define Hcsize_Cheight(x)	((x) << FShft(HCSIZE_CHEIGHT))
> -
> -/* HCPOS Hardware Cursor Position Register fields */
> -#define HCPOS_SWITCHSRC	(1 << 30)
> -#define HCPOS_CURBLINK	Fld(6,24)
> -#define Hcpos_Curblink(x)	((x) << FShft(HCPOS_CURBLINK))
> -#define HCPOS_XSTART	Fld(12,12)
> -#define Hcpos_Xstart(x)	((x) << FShft(HCPOS_XSTART))
> -#define HCPOS_YSTART	Fld(12,0)
> -#define Hcpos_Ystart(y)	((y) << FShft(HCPOS_YSTART))
> -
> -/* HCBADR Hardware Cursor Blend Address Register */
> -#define HCBADR_GLALPHA	Fld(8,24)
> -#define Hcbadr_Glalpha(x)	((x) << FShft(HCBADR_GLALPHA))
> -#define HCBADR_COLKEY	Fld(24,0)
> -#define Hcbadr_Colkey(x)	((x) << FShft(HCBADR_COLKEY))
> -
> -/* HCCKMSK - Hardware Cursor Color Key Mask Register */
> -#define HCCKMSK_COLKEY_M	Fld(24,0)
> -#define Hcckmsk_Colkey_M(x)	((x) << FShft(HCCKMSK_COLKEY_M))
> -
> -/* DSCTRL - Display sync control register */
> -#define DSCTRL_SYNCGEN_EN	(1 << 31)
> -#define DSCTRL_DPL_RST		(1 << 29)
> -#define DSCTRL_PWRDN_M		(1 << 28)
> -#define DSCTRL_UPDSYNCCNT	(1 << 26)
> -#define DSCTRL_UPDINTCNT	(1 << 25)
> -#define DSCTRL_UPDCNT		(1 << 24)
> -#define DSCTRL_UPDWAIT	Fld(4,16)
> -#define Dsctrl_Updwait(x)	((x) << FShft(DSCTRL_UPDWAIT))
> -#define DSCTRL_CLKPOL		(1 << 11)
> -#define DSCTRL_CSYNC_EN		(1 << 10)
> -#define DSCTRL_VS_SLAVE		(1 << 7)
> -#define DSCTRL_HS_SLAVE		(1 << 6)
> -#define DSCTRL_BLNK_POL		(1 << 5)
> -#define DSCTRL_BLNK_DIS		(1 << 4)
> -#define DSCTRL_VS_POL		(1 << 3)
> -#define DSCTRL_VS_DIS		(1 << 2)
> -#define DSCTRL_HS_POL		(1 << 1)
> -#define DSCTRL_HS_DIS		(1 << 0)
> -
> -/* DHT01 - Display horizontal timing register 01 */
> -#define DHT01_HBPS	Fld(12,16)
> -#define Dht01_Hbps(x)	((x) << FShft(DHT01_HBPS))
> -#define DHT01_HT	Fld(12,0)
> -#define Dht01_Ht(x)	((x) << FShft(DHT01_HT))
> -
> -/* DHT02 - Display horizontal timing register 02 */
> -#define DHT02_HAS	Fld(12,16)
> -#define Dht02_Has(x)	((x) << FShft(DHT02_HAS))
> -#define DHT02_HLBS	Fld(12,0)
> -#define Dht02_Hlbs(x)	((x) << FShft(DHT02_HLBS))
> -
> -/* DHT03 - Display horizontal timing register 03 */
> -#define DHT03_HFPS	Fld(12,16)
> -#define Dht03_Hfps(x)	((x) << FShft(DHT03_HFPS))
> -#define DHT03_HRBS	Fld(12,0)
> -#define Dht03_Hrbs(x)	((x) << FShft(DHT03_HRBS))
> -
> -/* DVT01 - Display vertical timing register 01 */
> -#define DVT01_VBPS	Fld(12,16)
> -#define Dvt01_Vbps(x)	((x) << FShft(DVT01_VBPS))
> -#define DVT01_VT	Fld(12,0)
> -#define Dvt01_Vt(x)	((x) << FShft(DVT01_VT))
> -
> -/* DVT02 - Display vertical timing register 02 */
> -#define DVT02_VAS	Fld(12,16)
> -#define Dvt02_Vas(x)	((x) << FShft(DVT02_VAS))
> -#define DVT02_VTBS	Fld(12,0)
> -#define Dvt02_Vtbs(x)	((x) << FShft(DVT02_VTBS))
> -
> -/* DVT03 - Display vertical timing register 03 */
> -#define DVT03_VFPS	Fld(12,16)
> -#define Dvt03_Vfps(x)	((x) << FShft(DVT03_VFPS))
> -#define DVT03_VBBS	Fld(12,0)
> -#define Dvt03_Vbbs(x)	((x) << FShft(DVT03_VBBS))
> -
> -/* DVECTRL - display vertical event control register */
> -#define DVECTRL_VEVENT	Fld(12,16)
> -#define Dvectrl_Vevent(x)	((x) << FShft(DVECTRL_VEVENT))
> -#define DVECTRL_VFETCH	Fld(12,0)
> -#define Dvectrl_Vfetch(x)	((x) << FShft(DVECTRL_VFETCH))
> -
> -/* DHDET - display horizontal DE timing register */
> -#define DHDET_HDES	Fld(12,16)
> -#define Dhdet_Hdes(x)	((x) << FShft(DHDET_HDES))
> -#define DHDET_HDEF	Fld(12,0)
> -#define Dhdet_Hdef(x)	((x) << FShft(DHDET_HDEF))
> -
> -/* DVDET - display vertical DE timing register */
> -#define DVDET_VDES	Fld(12,16)
> -#define Dvdet_Vdes(x)	((x) << FShft(DVDET_VDES))
> -#define DVDET_VDEF	Fld(12,0)
> -#define Dvdet_Vdef(x)	((x) << FShft(DVDET_VDEF))
> -
> -/* DODMSK - display output data mask register */
> -#define DODMSK_MASK_LVL	(1 << 31)
> -#define DODMSK_BLNK_LVL	(1 << 30)
> -#define DODMSK_MASK_B	Fld(8,16)
> -#define Dodmsk_Mask_B(x)	((x) << FShft(DODMSK_MASK_B))
> -#define DODMSK_MASK_G	Fld(8,8)
> -#define Dodmsk_Mask_G(x)	((x) << FShft(DODMSK_MASK_G))
> -#define DODMSK_MASK_R	Fld(8,0)
> -#define Dodmsk_Mask_R(x)	((x) << FShft(DODMSK_MASK_R))
> -
> -/* DBCOL - display border color control register */
> -#define DBCOL_BORDCOL	Fld(24,0)
> -#define Dbcol_Bordcol(x)	((x) << FShft(DBCOL_BORDCOL))
> -
> -/* DVLNUM - display vertical line number register */
> -#define DVLNUM_VLINE	Fld(12,0)
> -#define Dvlnum_Vline(x)	((x) << FShft(DVLNUM_VLINE))
> -
> -/* DMCTRL - Display Memory Control Register */
> -#define DMCTRL_MEM_REF	Fld(2,30)
> -#define DMCTRL_MEM_REF_ACT	((0x0) << FShft(DMCTRL_MEM_REF))
> -#define DMCTRL_MEM_REF_HB	((0x1) << FShft(DMCTRL_MEM_REF))
> -#define DMCTRL_MEM_REF_VB	((0x2) << FShft(DMCTRL_MEM_REF))
> -#define DMCTRL_MEM_REF_BOTH	((0x3) << FShft(DMCTRL_MEM_REF))
> -#define DMCTRL_UV_THRHLD	Fld(6,24)
> -#define Dmctrl_Uv_Thrhld(x)	((x) << FShft(DMCTRL_UV_THRHLD))
> -#define DMCTRL_V_THRHLD		Fld(7,16)
> -#define Dmctrl_V_Thrhld(x)	((x) << FShft(DMCTRL_V_THRHLD))
> -#define DMCTRL_D_THRHLD		Fld(7,8)
> -#define Dmctrl_D_Thrhld(x)	((x) << FShft(DMCTRL_D_THRHLD))
> -#define DMCTRL_BURSTLEN	Fld(6,0)
> -#define Dmctrl_Burstlen(x)	((x) << FShft(DMCTRL_BURSTLEN))
> -
> -/* DINTRS - Display Interrupt Status Register */
> -#define DINTRS_CUR_OR_S		(1 << 18)
> -#define DINTRS_STR2_OR_S	(1 << 17)
> -#define DINTRS_STR1_OR_S	(1 << 16)
> -#define DINTRS_CUR_UR_S		(1 << 6)
> -#define DINTRS_STR2_UR_S	(1 << 5)
> -#define DINTRS_STR1_UR_S	(1 << 4)
> -#define DINTRS_VEVENT1_S	(1 << 3)
> -#define DINTRS_VEVENT0_S	(1 << 2)
> -#define DINTRS_HBLNK1_S		(1 << 1)
> -#define DINTRS_HBLNK0_S		(1 << 0)
> -
> -/* DINTRE - Display Interrupt Enable Register */
> -#define DINTRE_CUR_OR_EN	(1 << 18)
> -#define DINTRE_STR2_OR_EN	(1 << 17)
> -#define DINTRE_STR1_OR_EN	(1 << 16)
> -#define DINTRE_CUR_UR_EN	(1 << 6)
> -#define DINTRE_STR2_UR_EN	(1 << 5)
> -#define DINTRE_STR1_UR_EN	(1 << 4)
> -#define DINTRE_VEVENT1_EN	(1 << 3)
> -#define DINTRE_VEVENT0_EN	(1 << 2)
> -#define DINTRE_HBLNK1_EN	(1 << 1)
> -#define DINTRE_HBLNK0_EN	(1 << 0)
> -
> -/* DINTRS - Display Interrupt Status Register */
> -#define DINTRS_CUR_OR_S		(1 << 18)
> -#define DINTRS_STR2_OR_S	(1 << 17)
> -#define DINTRS_STR1_OR_S	(1 << 16)
> -#define DINTRS_CUR_UR_S		(1 << 6)
> -#define DINTRS_STR2_UR_S	(1 << 5)
> -#define DINTRS_STR1_UR_S	(1 << 4)
> -#define DINTRS_VEVENT1_S	(1 << 3)
> -#define DINTRS_VEVENT0_S	(1 << 2)
> -#define DINTRS_HBLNK1_S		(1 << 1)
> -#define DINTRS_HBLNK0_S		(1 << 0)
> -
> -/* DINTRE - Display Interrupt Enable Register */
> -#define DINTRE_CUR_OR_EN	(1 << 18)
> -#define DINTRE_STR2_OR_EN	(1 << 17)
> -#define DINTRE_STR1_OR_EN	(1 << 16)
> -#define DINTRE_CUR_UR_EN	(1 << 6)
> -#define DINTRE_STR2_UR_EN	(1 << 5)
> -#define DINTRE_STR1_UR_EN	(1 << 4)
> -#define DINTRE_VEVENT1_EN	(1 << 3)
> -#define DINTRE_VEVENT0_EN	(1 << 2)
> -#define DINTRE_HBLNK1_EN	(1 << 1)
> -#define DINTRE_HBLNK0_EN	(1 << 0)
> -
> -
> -/* DLSTS - display load status register */
> -#define DLSTS_RLD_ADONE	(1 << 23)
> -/* #define DLSTS_RLD_ADOUT	Fld(23,0) */
> -
> -/* DLLCTRL - display list load control register */
> -#define DLLCTRL_RLD_ADRLN	Fld(8,24)
> -#define Dllctrl_Rld_Adrln(x)	((x) << FShft(DLLCTRL_RLD_ADRLN))
> -
> -/* CLIPCTRL - Clipping Control Register */
> -#define CLIPCTRL_HSKIP		Fld(11,16)
> -#define Clipctrl_Hskip		((x) << FShft(CLIPCTRL_HSKIP))
> -#define CLIPCTRL_VSKIP		Fld(11,0)
> -#define Clipctrl_Vskip		((x) << FShft(CLIPCTRL_VSKIP))
> -
> -/* SPOCTRL - Scale Pitch/Order Control Register */
> -#define SPOCTRL_H_SC_BP		(1 << 31)
> -#define SPOCTRL_V_SC_BP		(1 << 30)
> -#define SPOCTRL_HV_SC_OR	(1 << 29)
> -#define SPOCTRL_VS_UR_C		(1 << 27)
> -#define SPOCTRL_VORDER		Fld(2,16)
> -#define SPOCTRL_VORDER_1TAP	((0x0) << FShft(SPOCTRL_VORDER))
> -#define SPOCTRL_VORDER_2TAP	((0x1) << FShft(SPOCTRL_VORDER))
> -#define SPOCTRL_VORDER_4TAP	((0x3) << FShft(SPOCTRL_VORDER))
> -#define SPOCTRL_VPITCH		Fld(16,0)
> -#define Spoctrl_Vpitch(x)	((x) << FShft(SPOCTRL_VPITCH))
> -
> -/* SVCTRL - Scale Vertical Control Register */
> -#define SVCTRL_INITIAL1		Fld(16,16)
> -#define Svctrl_Initial1(x)	((x) << FShft(SVCTRL_INITIAL1))
> -#define SVCTRL_INITIAL2		Fld(16,0)
> -#define Svctrl_Initial2(x)	((x) << FShft(SVCTRL_INITIAL2))
> -
> -/* SHCTRL - Scale Horizontal Control Register */
> -#define SHCTRL_HINITIAL		Fld(16,16)
> -#define Shctrl_Hinitial(x)	((x) << FShft(SHCTRL_HINITIAL))
> -#define SHCTRL_HDECIM		(1 << 15)
> -#define SHCTRL_HPITCH		Fld(15,0)
> -#define Shctrl_Hpitch(x)	((x) << FShft(SHCTRL_HPITCH))
> -
> -/* SSSIZE - Scale Surface Size Register */
> -#define SSSIZE_SC_WIDTH		Fld(11,16)
> -#define Sssize_Sc_Width(x)	((x) << FShft(SSSIZE_SC_WIDTH))
> -#define SSSIZE_SC_HEIGHT	Fld(11,0)
> -#define Sssize_Sc_Height(x)	((x) << FShft(SSSIZE_SC_HEIGHT))
> -
> -#endif /* __REG_BITS_2700G_ */
> diff --git a/drivers/video/fbdev/mbx/regs.h b/drivers/video/fbdev/mbx/regs.h
> deleted file mode 100644
> index 591fc9d26084..000000000000
> --- a/drivers/video/fbdev/mbx/regs.h
> +++ /dev/null
> @@ -1,196 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __REGS_2700G_
> -#define __REGS_2700G_
> -
> -/* extern unsigned long virt_base_2700; */
> -/* #define __REG_2700G(x)	(*(volatile unsigned long*)((x)+virt_base_2700)) */
> -#define __REG_2700G(x)	((x)+virt_base_2700)
> -
> -/* System Configuration Registers (0x0000_0000  0x0000_0010) */
> -#define SYSCFG		__REG_2700G(0x00000000)
> -#define PFBASE		__REG_2700G(0x00000004)
> -#define PFCEIL		__REG_2700G(0x00000008)
> -#define POLLFLAG	__REG_2700G(0x0000000c)
> -#define SYSRST		__REG_2700G(0x00000010)
> -
> -/* Interrupt Control Registers (0x0000_0014  0x0000_002F) */
> -#define NINTPW		__REG_2700G(0x00000014)
> -#define MINTENABLE	__REG_2700G(0x00000018)
> -#define MINTSTAT	__REG_2700G(0x0000001c)
> -#define SINTENABLE	__REG_2700G(0x00000020)
> -#define SINTSTAT	__REG_2700G(0x00000024)
> -#define SINTCLR		__REG_2700G(0x00000028)
> -
> -/* Clock Control Registers (0x0000_002C  0x0000_005F) */
> -#define SYSCLKSRC	__REG_2700G(0x0000002c)
> -#define PIXCLKSRC	__REG_2700G(0x00000030)
> -#define CLKSLEEP	__REG_2700G(0x00000034)
> -#define COREPLL		__REG_2700G(0x00000038)
> -#define DISPPLL		__REG_2700G(0x0000003c)
> -#define PLLSTAT		__REG_2700G(0x00000040)
> -#define VOVRCLK		__REG_2700G(0x00000044)
> -#define PIXCLK		__REG_2700G(0x00000048)
> -#define MEMCLK		__REG_2700G(0x0000004c)
> -#define M24CLK		__REG_2700G(0x00000050)
> -#define MBXCLK		__REG_2700G(0x00000054)
> -#define SDCLK		__REG_2700G(0x00000058)
> -#define PIXCLKDIV	__REG_2700G(0x0000005c)
> -
> -/* LCD Port Control Register (0x0000_0060  0x0000_006F) */
> -#define LCD_CONFIG	__REG_2700G(0x00000060)
> -
> -/* On-Die Frame Buffer Registers (0x0000_0064  0x0000_006B) */
> -#define ODFBPWR		__REG_2700G(0x00000064)
> -#define ODFBSTAT	__REG_2700G(0x00000068)
> -
> -/* GPIO Registers (0x0000_006C  0x0000_007F) */
> -#define GPIOCGF		__REG_2700G(0x0000006c)
> -#define GPIOHI		__REG_2700G(0x00000070)
> -#define GPIOLO		__REG_2700G(0x00000074)
> -#define GPIOSTAT	__REG_2700G(0x00000078)
> -
> -/* Pulse Width Modulator (PWM) Registers (0x0000_0200  0x0000_02FF) */
> -#define PWMRST		__REG_2700G(0x00000200)
> -#define PWMCFG		__REG_2700G(0x00000204)
> -#define PWM0DIV		__REG_2700G(0x00000210)
> -#define PWM0DUTY	__REG_2700G(0x00000214)
> -#define PWM0PER		__REG_2700G(0x00000218)
> -#define PWM1DIV		__REG_2700G(0x00000220)
> -#define PWM1DUTY	__REG_2700G(0x00000224)
> -#define PWM1PER		__REG_2700G(0x00000228)
> -
> -/* Identification (ID) Registers (0x0000_0300  0x0000_0FFF) */
> -#define ID		__REG_2700G(0x00000FF0)
> -
> -/* Local Memory (SDRAM) Interface Registers (0x0000_1000  0x0000_1FFF) */
> -#define LMRST		__REG_2700G(0x00001000)
> -#define LMCFG		__REG_2700G(0x00001004)
> -#define LMPWR		__REG_2700G(0x00001008)
> -#define LMPWRSTAT	__REG_2700G(0x0000100c)
> -#define LMCEMR		__REG_2700G(0x00001010)
> -#define LMTYPE		__REG_2700G(0x00001014)
> -#define LMTIM		__REG_2700G(0x00001018)
> -#define LMREFRESH	__REG_2700G(0x0000101c)
> -#define LMPROTMIN	__REG_2700G(0x00001020)
> -#define LMPROTMAX	__REG_2700G(0x00001024)
> -#define LMPROTCFG	__REG_2700G(0x00001028)
> -#define LMPROTERR	__REG_2700G(0x0000102c)
> -
> -/* Plane Controller Registers (0x0000_2000  0x0000_2FFF) */
> -#define GSCTRL		__REG_2700G(0x00002000)
> -#define VSCTRL		__REG_2700G(0x00002004)
> -#define GBBASE		__REG_2700G(0x00002020)
> -#define VBBASE		__REG_2700G(0x00002024)
> -#define GDRCTRL		__REG_2700G(0x00002040)
> -#define VCMSK		__REG_2700G(0x00002044)
> -#define GSCADR		__REG_2700G(0x00002060)
> -#define VSCADR		__REG_2700G(0x00002064)
> -#define VUBASE		__REG_2700G(0x00002084)
> -#define VVBASE		__REG_2700G(0x000020a4)
> -#define GSADR		__REG_2700G(0x000020c0)
> -#define VSADR		__REG_2700G(0x000020c4)
> -#define HCCTRL		__REG_2700G(0x00002100)
> -#define HCSIZE		__REG_2700G(0x00002110)
> -#define HCPOS		__REG_2700G(0x00002120)
> -#define HCBADR		__REG_2700G(0x00002130)
> -#define HCCKMSK		__REG_2700G(0x00002140)
> -#define GPLUT		__REG_2700G(0x00002150)
> -#define DSCTRL		__REG_2700G(0x00002154)
> -#define DHT01		__REG_2700G(0x00002158)
> -#define DHT02		__REG_2700G(0x0000215c)
> -#define DHT03		__REG_2700G(0x00002160)
> -#define DVT01		__REG_2700G(0x00002164)
> -#define DVT02		__REG_2700G(0x00002168)
> -#define DVT03		__REG_2700G(0x0000216c)
> -#define DBCOL		__REG_2700G(0x00002170)
> -#define BGCOLOR		__REG_2700G(0x00002174)
> -#define DINTRS		__REG_2700G(0x00002178)
> -#define DINTRE		__REG_2700G(0x0000217c)
> -#define DINTRCNT	__REG_2700G(0x00002180)
> -#define DSIG		__REG_2700G(0x00002184)
> -#define DMCTRL		__REG_2700G(0x00002188)
> -#define CLIPCTRL	__REG_2700G(0x0000218c)
> -#define SPOCTRL		__REG_2700G(0x00002190)
> -#define SVCTRL		__REG_2700G(0x00002194)
> -
> -/* 0x0000_2198 */
> -/* 0x0000_21A8 VSCOEFF[0:4] Video Scalar Vertical Coefficient [0:4] 4.14.5 */
> -#define VSCOEFF0	__REG_2700G(0x00002198)
> -#define VSCOEFF1	__REG_2700G(0x0000219c)
> -#define VSCOEFF2	__REG_2700G(0x000021a0)
> -#define VSCOEFF3	__REG_2700G(0x000021a4)
> -#define VSCOEFF4	__REG_2700G(0x000021a8)
> -
> -#define SHCTRL		__REG_2700G(0x000021b0)
> -
> -/* 0x0000_21B4 */
> -/* 0x0000_21D4 HSCOEFF[0:8] Video Scalar Horizontal Coefficient [0:8] 4.14.7 */
> -#define HSCOEFF0	__REG_2700G(0x000021b4)
> -#define HSCOEFF1	__REG_2700G(0x000021b8)
> -#define HSCOEFF2	__REG_2700G(0x000021bc)
> -#define HSCOEFF3	__REG_2700G(0x000021c0)
> -#define HSCOEFF4	__REG_2700G(0x000021c4)
> -#define HSCOEFF5	__REG_2700G(0x000021c8)
> -#define HSCOEFF6	__REG_2700G(0x000021cc)
> -#define HSCOEFF7	__REG_2700G(0x000021d0)
> -#define HSCOEFF8	__REG_2700G(0x000021d4)
> -
> -#define SSSIZE		__REG_2700G(0x000021D8)
> -
> -/* 0x0000_2200 */
> -/* 0x0000_2240 VIDGAM[0:16] Video Gamma LUT Index [0:16] 4.15.2 */
> -#define VIDGAM0		__REG_2700G(0x00002200)
> -#define VIDGAM1		__REG_2700G(0x00002204)
> -#define VIDGAM2		__REG_2700G(0x00002208)
> -#define VIDGAM3		__REG_2700G(0x0000220c)
> -#define VIDGAM4		__REG_2700G(0x00002210)
> -#define VIDGAM5		__REG_2700G(0x00002214)
> -#define VIDGAM6		__REG_2700G(0x00002218)
> -#define VIDGAM7		__REG_2700G(0x0000221c)
> -#define VIDGAM8		__REG_2700G(0x00002220)
> -#define VIDGAM9		__REG_2700G(0x00002224)
> -#define VIDGAM10	__REG_2700G(0x00002228)
> -#define VIDGAM11	__REG_2700G(0x0000222c)
> -#define VIDGAM12	__REG_2700G(0x00002230)
> -#define VIDGAM13	__REG_2700G(0x00002234)
> -#define VIDGAM14	__REG_2700G(0x00002238)
> -#define VIDGAM15	__REG_2700G(0x0000223c)
> -#define VIDGAM16	__REG_2700G(0x00002240)
> -
> -/* 0x0000_2250 */
> -/* 0x0000_2290 GFXGAM[0:16] Graphics Gamma LUT Index [0:16] 4.15.3 */
> -#define GFXGAM0		__REG_2700G(0x00002250)
> -#define GFXGAM1		__REG_2700G(0x00002254)
> -#define GFXGAM2		__REG_2700G(0x00002258)
> -#define GFXGAM3		__REG_2700G(0x0000225c)
> -#define GFXGAM4		__REG_2700G(0x00002260)
> -#define GFXGAM5		__REG_2700G(0x00002264)
> -#define GFXGAM6		__REG_2700G(0x00002268)
> -#define GFXGAM7		__REG_2700G(0x0000226c)
> -#define GFXGAM8		__REG_2700G(0x00002270)
> -#define GFXGAM9		__REG_2700G(0x00002274)
> -#define GFXGAM10	__REG_2700G(0x00002278)
> -#define GFXGAM11	__REG_2700G(0x0000227c)
> -#define GFXGAM12	__REG_2700G(0x00002280)
> -#define GFXGAM13	__REG_2700G(0x00002284)
> -#define GFXGAM14	__REG_2700G(0x00002288)
> -#define GFXGAM15	__REG_2700G(0x0000228c)
> -#define GFXGAM16	__REG_2700G(0x00002290)
> -
> -#define DLSTS		__REG_2700G(0x00002300)
> -#define DLLCTRL		__REG_2700G(0x00002304)
> -#define DVLNUM		__REG_2700G(0x00002308)
> -#define DUCTRL		__REG_2700G(0x0000230c)
> -#define DVECTRL		__REG_2700G(0x00002310)
> -#define DHDET		__REG_2700G(0x00002314)
> -#define DVDET		__REG_2700G(0x00002318)
> -#define DODMSK		__REG_2700G(0x0000231c)
> -#define CSC01		__REG_2700G(0x00002330)
> -#define CSC02		__REG_2700G(0x00002334)
> -#define CSC03		__REG_2700G(0x00002338)
> -#define CSC04		__REG_2700G(0x0000233c)
> -#define CSC05		__REG_2700G(0x00002340)
> -
> -#define FB_MEMORY_START	__REG_2700G(0x00060000)
> -
> -#endif /* __REGS_2700G_ */
> diff --git a/include/video/mbxfb.h b/include/video/mbxfb.h
> deleted file mode 100644
> index 35921cb6d1e5..000000000000
> --- a/include/video/mbxfb.h
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __MBX_FB_H
> -#define __MBX_FB_H
> -
> -#include <asm/ioctl.h>
> -#include <asm/types.h>
> -
> -struct mbxfb_val {
> -	unsigned int	defval;
> -	unsigned int	min;
> -	unsigned int	max;
> -};
> -
> -struct fb_info;
> -
> -struct mbxfb_platform_data {
> -		/* Screen info */
> -		struct mbxfb_val xres;
> -		struct mbxfb_val yres;
> -		struct mbxfb_val bpp;
> -
> -		/* Memory info */
> -		unsigned long memsize; /* if 0 use ODFB? */
> -		unsigned long timings1;
> -		unsigned long timings2;
> -		unsigned long timings3;
> -
> -		int (*probe)(struct fb_info *fb);
> -		int (*remove)(struct fb_info *fb);
> -};
> -
> -/* planar */
> -#define MBXFB_FMT_YUV16		0
> -#define MBXFB_FMT_YUV12		1
> -
> -/* packed */
> -#define MBXFB_FMT_UY0VY1	2
> -#define MBXFB_FMT_VY0UY1	3
> -#define MBXFB_FMT_Y0UY1V	4
> -#define MBXFB_FMT_Y0VY1U	5
> -struct mbxfb_overlaySetup {
> -	__u32 enable;
> -	__u32 x, y;
> -	__u32 width, height;
> -	__u32 fmt;
> -	__u32 mem_offset;
> -	__u32 scaled_width;
> -	__u32 scaled_height;
> -
> -	/* Filled by the driver */
> -	__u32 U_offset;
> -	__u32 V_offset;
> -
> -	__u16 Y_stride;
> -	__u16 UV_stride;
> -};
> -
> -#define MBXFB_ALPHABLEND_NONE		0
> -#define MBXFB_ALPHABLEND_GLOBAL		1
> -#define MBXFB_ALPHABLEND_PIXEL		2
> -
> -#define MBXFB_COLORKEY_DISABLED		0
> -#define MBXFB_COLORKEY_PREVIOUS		1
> -#define MBXFB_COLORKEY_CURRENT		2
> -struct mbxfb_alphaCtl {
> -	__u8 overlay_blend_mode;
> -	__u8 overlay_colorkey_mode;
> -	__u8 overlay_global_alpha;
> -	__u32 overlay_colorkey;
> -	__u32 overlay_colorkey_mask;
> -
> -	__u8 graphics_blend_mode;
> -	__u8 graphics_colorkey_mode;
> -	__u8 graphics_global_alpha;
> -	__u32 graphics_colorkey;
> -	__u32 graphics_colorkey_mask;
> -};
> -
> -#define MBXFB_PLANE_GRAPHICS	0
> -#define MBXFB_PLANE_VIDEO	1
> -struct mbxfb_planeorder {
> -	__u8 bottom;
> -	__u8 top;
> -};
> -
> -struct mbxfb_reg {
> -	__u32 addr; 	/* offset from 0x03fe 0000 */
> -	__u32 val;		/* value */
> -	__u32 mask;		/* which bits to touch (for write) */
> -};
> -
> -#define MBXFB_IOCX_OVERLAY		_IOWR(0xF4, 0x00,struct mbxfb_overlaySetup)
> -#define MBXFB_IOCG_ALPHA		_IOR(0xF4, 0x01,struct mbxfb_alphaCtl)
> -#define MBXFB_IOCS_ALPHA		_IOW(0xF4, 0x02,struct mbxfb_alphaCtl)
> -#define MBXFB_IOCS_PLANEORDER	_IOR(0xF4, 0x03,struct mbxfb_planeorder)
> -#define MBXFB_IOCS_REG			_IOW(0xF4, 0x04,struct mbxfb_reg)
> -#define MBXFB_IOCX_REG			_IOWR(0xF4, 0x05,struct mbxfb_reg)
> -
> -#endif /* __MBX_FB_H */
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
