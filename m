Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BC72610D3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710ED6E7DD;
	Tue,  8 Sep 2020 11:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795546E7DD
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113730euoutp024a58a039c603c2d1dcb3246906436346~yy-A4FaHO3214932149euoutp02a
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200908113730euoutp024a58a039c603c2d1dcb3246906436346~yy-A4FaHO3214932149euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599565050;
 bh=R99R4ZxQzrdJUupr1CTVlhYpaUBTi0hOmTt2nf1voBA=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=UpXqAKp5BCHEoQP6Sz53B4wOom3qPFAL8QZzf6Es8buILk6sbuwBU90KLz4zJ9T45
 lhCokOvgkyuIeZny/e5ogrlhRZjQyNFB0rb2M6I2RyeKoyFVsVkLtsG2t1Uwv2S77e
 kwXgUeDlVZwyHHEcFKXIsDhOftVAzJy/5qm6PL3E=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200908113730eucas1p26bd2c1c6153827a69540b10bb5c7b339~yy-AswukO1635216352eucas1p2Z;
 Tue,  8 Sep 2020 11:37:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 53.B5.06318.9FC675F5; Tue,  8
 Sep 2020 12:37:30 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113729eucas1p17dae0de2383d2cab8553c8cb74e68a2a~yy-AZzspo1315713157eucas1p1I;
 Tue,  8 Sep 2020 11:37:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200908113729eusmtrp284e430433b37aedc125854b91bd3ae74~yy-AZNgmu3046530465eusmtrp2O;
 Tue,  8 Sep 2020 11:37:29 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-8e-5f576cf96e54
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8B.B4.06017.9FC675F5; Tue,  8
 Sep 2020 12:37:29 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200908113729eusmtip26eb083b087c085bcf664473253ca2ca4~yy_-4YgyL1101511015eusmtip2i;
 Tue,  8 Sep 2020 11:37:29 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: replace spurious snprintf() with sprintf()
To: Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <8a486558-08cb-b8fa-5a33-77d73482b1ea@samsung.com>
Date: Tue, 8 Sep 2020 13:37:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200824174407.429817-1-alex.dewar90@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRj22zk7O45mx6n4oqIwrTBIK6MOmZJmNIJQKio0tZUHlTaVzUuK
 PxaJOhOpJYlT0JLUiddpmqIR5qUSL2REisOyBV4YamrWzJlnR8l/D8+F530+PhITN/HdyMSk
 VEaZJJNLCCHePvBn9IhFfj32aO13RFdMZNGb2gEB/eybEaM/rS0SdPfUAqLfFS3x6fGucuKs
 QLph0SJpz69KXNqpMwqkVd1zPOn0w0GedMXgGUFECs/EMfLEdEbpH3xLmKBdtQpScsl7llYN
 rkajRAGyJ4E6Aetb9XgBEpJiqhZBQ7UWsYKYWkWQMxXECSsIyqqW0G6iT28lOFMNAqM6mzOZ
 ETSP3OexAkGdhsd5dbaAExUO69YGjMXO1CHo798i2ABGjSHo0UzbAiIqGArXZ3EW45QPVNRO
 2ngX6gb8/PqWz3kc4X2pyeaxp4Lg6cdlG8YoV5g0VfA47AUd5nKMLQCqSwC1w8sYd3YYPHjZ
 wuOwE8wPtgk47AFbnWyYDTQi2Myf3Ul3IKh5Yt15pkCYGrFsY3K7wheauvw5OgReNGh4LA2U
 A3wxO3JHOIC2vQTjaBHk54o590Form4mdmsLOvXYIyTR7Zmm2zNHt2eO7n9vJcLrkCuTplLE
 M6qAJCbDTyVTqNKS4v3uJCsMaPsbDVkH116h139v9yKKRJJ9Iumla7FivixdlanoRUBiEmdR
 6PBQjFgUJ8vMYpTJsco0OaPqRe4kLnEVBTyfixZT8bJU5i7DpDDKXZVH2rupUWTiG2/LKa8L
 ktSiSo8mU4zzSregh76qM+Tc3Ag7WR4QxVyeifR0LimbbthvzNabwlt/+2efc+cf95lgMko/
 N34wnqeZuHZDf03/QKhv8WJUq3k8WmP4QfrXu8zAgmm6pfhin6Q1zKhpsztgd2Ve4atW5BWO
 RSzqy7oDvUMmJbgqQXbsMKZUyf4BIK4Y2kIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xe7o/c8LjDY6+VreYf7PK4u+kY+wW
 Cx/eZba48vU9m8WeO68ZLU70fWC1uLxrDpsDu8fvX5MYPfZ+W8DisXPWXXaPxXteMnnc7z7O
 5PF5k1wAW5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+
 XYJexqQv/9gL2jgqfm3uZGlgPM/WxcjJISFgInFk5T8gm4tDSGApo8Tdb5cZuxg5gBIyEsfX
 l0HUCEv8udYFVfOaUeL1vVuMIAk2ASuJie2rwGxhAV+JZyseMYHYIgLqEkeP/gdrYBa4wCjR
 tvkBVPcERokN33ewglTxCthJ9Hx/wQJiswioSMxfcQusW1QgQuLwjlmMEDWCEidnPgGr4RSw
 lZh26SOYzQy04c+8S8wQtrjErSfzmSBseYntb+cwT2AUmoWkfRaSlllIWmYhaVnAyLKKUSS1
 tDg3PbfYSK84Mbe4NC9dLzk/dxMjMP62Hfu5ZQdj17vgQ4wCHIxKPLwfvMLihVgTy4orcw8x
 SnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cDUkFcSb2hqaG5haWhubG5s
 ZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgbE+au+EEOacS0y+Vy14d35ze55V9rlCbX5f
 YbacmLE3m1pl5b+ti4rq5+v5ZS25xvFT+xb7v2Pl3zY8Yfrmn776/s4lCyUeVBxWFY5xPrgh
 i+Wi2Kn6JVw9q5Jn3JqUZsmuukbq/uorjaI61RENzDOubL949rEbV+n/mPOrX+31WCB8+N+V
 o8pKLMUZiYZazEXFiQC1asJ31QIAAA==
X-CMS-MailID: 20200908113729eucas1p17dae0de2383d2cab8553c8cb74e68a2a
X-Msg-Generator: CA
X-RootMTR: 20200824174423eucas1p25ee511479ffce613260a49d415e5733f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200824174423eucas1p25ee511479ffce613260a49d415e5733f
References: <CGME20200824174423eucas1p25ee511479ffce613260a49d415e5733f@eucas1p2.samsung.com>
 <20200824174407.429817-1-alex.dewar90@gmail.com>
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
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/24/20 7:44 PM, Alex Dewar wrote:
> par->vgapass is a u8, so if we are assuming that buf is at least
> PAGE_SIZE then the extra checking is pointless.
> 
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/sstfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
> index afe6d1b7c3a0..c05cdabeb11c 100644
> --- a/drivers/video/fbdev/sstfb.c
> +++ b/drivers/video/fbdev/sstfb.c
> @@ -733,7 +733,7 @@ static ssize_t show_vgapass(struct device *device, struct device_attribute *attr
>  {
>  	struct fb_info *info = dev_get_drvdata(device);
>  	struct sstfb_par *par = info->par;
> -	return snprintf(buf, PAGE_SIZE, "%d\n", par->vgapass);
> +	return sprintf(buf, "%d\n", par->vgapass);
>  }
>  
>  static struct device_attribute device_attrs[] = {
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
