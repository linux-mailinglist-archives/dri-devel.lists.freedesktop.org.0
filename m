Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A821F37BF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 12:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880C06E09F;
	Tue,  9 Jun 2020 10:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D202B6E09F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 10:17:50 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200609101749euoutp029ea9429efd8eddcdb3a385113a93b5af~W2MdcBayz0057000570euoutp02x
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 10:17:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200609101749euoutp029ea9429efd8eddcdb3a385113a93b5af~W2MdcBayz0057000570euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591697869;
 bh=WmGn6y0fRrmt7+Tgt0t9pFWpnQ3kIEMTyzUcYcT/gCs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=JPikHyez0pOnTQDO4x6z7HPrJ3Ndvot6+AuYEawGv8RU/B1ioV3ID8/PWcLO0mKZu
 eLfvFZ+WeeN7smAVjGq9dFeDCUuA+LbResQsIPbarzIPkdrKAbV5gs7wg07F+XN13X
 55ntVWr0ATtwdw7p7hunmk4fZdIh64D7VfKiHXPk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200609101748eucas1p26af961353281c038c9d97a893f615a63~W2MdJUDWg1384513845eucas1p2N;
 Tue,  9 Jun 2020 10:17:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 19.15.61286.CC16FDE5; Tue,  9
 Jun 2020 11:17:48 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200609101748eucas1p25e3c30e33e0552a3a49078cedca1f5d0~W2Mc45PGy1384613846eucas1p2e;
 Tue,  9 Jun 2020 10:17:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200609101748eusmtrp2221a37df5aa1da0891362a42566200b2~W2Mc4NolX1385213852eusmtrp2E;
 Tue,  9 Jun 2020 10:17:48 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-3a-5edf61cc1591
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id FF.C3.07950.CC16FDE5; Tue,  9
 Jun 2020 11:17:48 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200609101747eusmtip2296ab910e5c56e376834ebf75f1c3331~W2McUDHkq2983929839eusmtip2U;
 Tue,  9 Jun 2020 10:17:47 +0000 (GMT)
Subject: Re: [PATCH v2] fbdev: geode: Add the missed pci_disable_device() in
 gx1fb_map_video_memory()
To: Chuhong Yuan <hslester96@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <a2bc1184-df7d-b921-c699-731591b2cd56@samsung.com>
Date: Tue, 9 Jun 2020 12:17:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200605161458.2513177-1-hslester96@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCKsWRmVeSWpSXmKPExsWy7djPc7pnEu/HGbR+0rbYuaKH3aJn0QZ2
 i3+rfrFbXPn6ns3i8vGLrBazD71ktljc/IjJ4kTfB1aL/nOnWSwu75rDZvF/1nNWB26PW/8F
 PHbOusvusXmFlsf97uNMHpuX1HtcO/+V0eN/0wt2j57n85g8Pm+S87j9bBtLAFcUl01Kak5m
 WWqRvl0CV8ayI5eYC45JVxxZL9TAOEOsi5GDQ0LARKLlb0AXIxeHkMAKRonny/eyQDhfGCUe
 HpjICuF8ZpT49nQTYxcjJ1jH88PNUInljBKHnrcyQzhvGSWWb9sGViUskC7x6uExNhBbREBd
 4vOunewgRcwC95gkZt18wwqSYBOwkpjYvgqsgVfATmLS8XOsIEexCKhI7L1rARIWFYiQ+PTg
 MCtEiaDEyZlPWEBsTgEbiasXe8DizALiEreezGeCsOUltr+dA3aQhMBXdonjPbOgznaROLi2
 lQXCFpZ4dXwLO4QtI/F/J0gzSMM6Rom/HS+gurcDvTP5HxtElbXEnXO/2ECuYxbQlFi/Sx8i
 7Chx4ecmNkhI8knceCsIcQSfxKRt05khwrwSHW1CENVqEhuWbWCDWdu1cyXzBEalWUhem4Xk
 nVlI3pmFsHcBI8sqRvHU0uLc9NRiw7zUcr3ixNzi0rx0veT83E2MwLR2+t/xTzsYv15KOsQo
 wMGoxMN7Q/xenBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xov
 ehkrJJCeWJKanZpakFoEk2Xi4JRqYDS6dDhC44XN/h1GG2Z0ibS//+towGbacny20RKdtU0B
 0m9ddJwMFhcyLK2tWXtrZ9O+aPeZymFWG1T+TS7cpS0QLaU6QYPbti9JUVfEZo7Isx2GK1iy
 E6bsiDraN+XhHX7fd3MEWe7WlSjV8vDfz9m2rP76upetmau/T16hbK/Xnfx4vo7WFCWW4oxE
 Qy3mouJEAFTFDiNnAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsVy+t/xe7pnEu/HGby5Lm2xc0UPu0XPog3s
 Fv9W/WK3uPL1PZvF5eMXWS1mH3rJbLG4+RGTxYm+D6wW/edOs1hc3jWHzeL/rOesDtwet/4L
 eOycdZfdY/MKLY/73ceZPDYvqfe4dv4ro8f/phfsHj3P5zF5fN4k53H72TaWAK4oPZui/NKS
 VIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYxlRy4xFxyTrjiy
 XqiBcYZYFyMnh4SAicTzw82sXYxcHEICSxklulZOAHI4gBIyEsfXl0HUCEv8udbFBlHzmlFi
 +qt2VpCEsEC6xKuHx9hAbBEBdYnPu3aygxQxC9xjkpg5YR07REc/o8SZ3htMIFVsAlYSE9tX
 MYLYvAJ2EpOOnwPbxiKgIrH3rgVIWFQgQuLwjllQJYISJ2c+YQGxOQVsJK5e7AFbzAy07M+8
 S8wQtrjErSfzmSBseYntb+cwT2AUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYSK84Mbe4
 NC9dLzk/dxMjMI63Hfu5ZQdj17vgQ4wCHIxKPLw3xO/FCbEmlhVX5h5ilOBgVhLhdTp7Ok6I
 NyWxsiq1KD++qDQntfgQoynQbxOZpUST84EpJq8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6
 YklqdmpqQWoRTB8TB6dUA6PHi2y2tomzzFv619Wq86y+/Mo986zZgw0PDOeXzHwevzRSLVbj
 +DE5oTVyt/qmhk7WCfZPWJofdHIC1zLJlxnHt+6S3+/7mPNr4mpPKZuQ5rcd2+//+V54bGnL
 TG0Zce3u77Oz+zZElpxe/NJAxHSadKW6mVT79Mh7ZwzXxLqt9QnzrklS/arEUpyRaKjFXFSc
 CACKao54+QIAAA==
X-CMS-MailID: 20200609101748eucas1p25e3c30e33e0552a3a49078cedca1f5d0
X-Msg-Generator: CA
X-RootMTR: 20200605161558eucas1p1388b824ffc9c65e05a30a71ffff8333a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200605161558eucas1p1388b824ffc9c65e05a30a71ffff8333a
References: <CGME20200605161558eucas1p1388b824ffc9c65e05a30a71ffff8333a@eucas1p1.samsung.com>
 <20200605161458.2513177-1-hslester96@gmail.com>
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
Cc: Andrew Morton <akpm@osdl.org>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-geode@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Adrian Bunk <bunk@stusta.de>,
 Markus Elfring <Markus.Elfring@web.de>, Andres Salomon <dilinger@queued.net>,
 David Vrabel <dvrabel@arcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 6/5/20 6:14 PM, Chuhong Yuan wrote:
> Although gx1fb_probe() has handled the failure of gx1fb_map_video_memory()
> partly, it does not call pci_disable_device() as gx1fb_map_video_memory()
> calls pci_enable_device().
> Add the missed function call to fix the bug.
> 
> Fixes: 53eed4ec8bcd ("[PATCH] fbdev: geode updates]")

This doesn't seem to be a matching commit.

The proper commit seems to be:

commit a06630f3e7fb29f2524e1d7b009eb8b5a278ba23
Author: Antonino A. Daplas <adaplas@gmail.com>
Date:   Mon Jun 26 00:27:04 2006 -0700

    [PATCH] Detaching fbcon: remove calls to pci_disable_device()
    
    Detaching fbcon allows individual drivers to be unloaded.  However several
    drivers call pci_disable_device() upon exit.  This function will disable the
    BAR's which will kill VGA text mode and/or affect X/DRM.
    
    To prevent this, remove calls to pci_disable_device() from several drivers.
...    

which removed pci_disable_device() calls from:

 drivers/video/aty/radeon_base.c
 drivers/video/cirrusfb.c
 drivers/video/geode/gx1fb_core.c
 drivers/video/geode/gxfb_core.c
 drivers/video/i810/i810_main.c
 drivers/video/nvidia/nvidia.c
 drivers/video/riva/fbdev.c

In order to bring back pci_disable_device() calls to gx1fb
driver (and other affected ones) you should verify that
the issue described in the above commit is no longer present
(preferably with testing modified driver on a real hardware). 

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
> Changes in v2:
>   - Fix the typo in the subject.
>   - Modify the label of error handler.
>   - Refactor the code.
>  
>  drivers/video/fbdev/geode/gx1fb_core.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/video/fbdev/geode/gx1fb_core.c b/drivers/video/fbdev/geode/gx1fb_core.c
> index 5d34d89fb665..15645244e4d0 100644
> --- a/drivers/video/fbdev/geode/gx1fb_core.c
> +++ b/drivers/video/fbdev/geode/gx1fb_core.c
> @@ -208,29 +208,39 @@ static int gx1fb_map_video_memory(struct fb_info *info, struct pci_dev *dev)
>  
>  	ret = pci_request_region(dev, 0, "gx1fb (video)");
>  	if (ret < 0)
> -		return ret;
> +		goto err_disable_device;
>  	par->vid_regs = pci_ioremap_bar(dev, 0);
>  	if (!par->vid_regs)
> -		return -ENOMEM;
> +		goto err_nomem;
>  
> -	if (!request_mem_region(gx_base + 0x8300, 0x100, "gx1fb (display controller)"))
> -		return -EBUSY;
> +	if (!request_mem_region(gx_base + 0x8300, 0x100,
> +				"gx1fb (display controller)")) {
> +		ret = -EBUSY;
> +		goto err_disable_device;
> +	}
>  	par->dc_regs = ioremap(gx_base + 0x8300, 0x100);
>  	if (!par->dc_regs)
> -		return -ENOMEM;
> +		goto err_nomem;
>  
>  	if ((fb_len = gx1_frame_buffer_size()) < 0)
> -		return -ENOMEM;
> +		goto err_nomem;
> +
>  	info->fix.smem_start = gx_base + 0x800000;
>  	info->fix.smem_len = fb_len;
>  	info->screen_base = ioremap(info->fix.smem_start, info->fix.smem_len);
>  	if (!info->screen_base)
> -		return -ENOMEM;
> +		goto err_nomem;
>  
>  	dev_info(&dev->dev, "%d Kibyte of video memory at 0x%lx\n",
>  		 info->fix.smem_len / 1024, info->fix.smem_start);
>  
>  	return 0;
> +
> +err_nomem:
> +	ret = -ENOMEM;
> +err_disable_device:
> +	pci_disable_device(dev);
> +	return ret;
>  }
>  
>  static int parse_panel_option(struct fb_info *info)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
