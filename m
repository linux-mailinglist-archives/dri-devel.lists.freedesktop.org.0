Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0F7AC924A
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 17:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1A610E035;
	Fri, 30 May 2025 15:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="h0w9N++J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0EB3310E035
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 15:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Content-Type:Message-ID:Date:MIME-Version:Subject:
 To:From; bh=n8E9mia/gKh+o+ngfIihpc0cQbahr8ftM3uoeCmTEF4=; b=h0w9
 N++JmlkWTGtcS10Aqr6ZPYXTGmubb+XEhznH1rUxquyi2nisTJbFGwoTpS8jqqdR
 r1xZBeP8i/0ObjLpmehbeTNWdBGbTT2l1v22dfkU8nRPMTV6djjtLcxsT6h8BU6t
 0evTFtTVoOFYLa3kG9XyXwPVwil+2mM9sK24Bv4=
Received: from [192.168.124.17] (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wDnW0uEyzloa4DfEw--.15441S2; 
 Fri, 30 May 2025 23:15:16 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------Yf9zWol0zqtZcWmT4DeHz07g"
Message-ID: <b0587eda-df65-4abc-b2af-c5dcb717c8b6@163.com>
Date: Fri, 30 May 2025 23:15:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 04/10] drm/hisilicon/hibmc: fix the hibmc loaded
 failed bug
To: Yongbang Shi <shiyongbang@huawei.com>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com
Cc: liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com,
 libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dmitry.baryshkov@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-5-shiyongbang@huawei.com>
From: oushixiong <oushixiong1025@163.com>
In-Reply-To: <20250530095432.1206966-5-shiyongbang@huawei.com>
X-CM-TRANSID: _____wDnW0uEyzloa4DfEw--.15441S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF48WFyxtw15XFyDWryDKFg_yoW8XFW3pF
 W7XayUKryktanxtFn8AFs29FW5Aa17Zay7Grn3A39avw4YvryDuwnaqrWxXFyUXrZ7GFyF
 vF48K3WUur1DZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTyxiUUUUU=
X-Originating-IP: [113.246.127.68]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXBRdD2g5wo7vegAAsS
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

This is a multi-part message in MIME format.
--------------Yf9zWol0zqtZcWmT4DeHz07g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/5/30 17:54, 00 1970 写道:
> From: Baihan Li<libaihan@huawei.com>
>
> When hibmc loaded failed, the driver use hibmc_unload to free the
> resource, but the mutexes in mode.config are not init, which will
> access an NULL pointer.
>
> Fixes: b3df5e65cc03 ("drm/hibmc: Drop drm_vblank_cleanup")
> Reported-by:oushixiong1025@163.com
> Signed-off-by: Baihan Li<libaihan@huawei.com>
> ---
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 4cdcc34070ee..ac552c339671 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -319,13 +319,13 @@ static int hibmc_load(struct drm_device *dev)
>   
>   	ret = hibmc_hw_init(priv);
>   	if (ret)
> -		goto err;
> +		return ret;
>   
>   	ret = drmm_vram_helper_init(dev, pci_resource_start(pdev, 0),
>   				    pci_resource_len(pdev, 0));
>   	if (ret) {
>   		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
> -		goto err;
> +		return ret;

The mutexes in mode.config are initialized when calling hibmc_kms_init(),
if calling hibmc_kms_init() failed it also need to return.

You may want to look at the following patch:
LKML: oushixiong1025@163 ...: [PATCH] drm/hisilicon: Fix a NULL pointer 
access when hibmc_load failed <https://lkml.org/lkml/2025/5/20/331>

Reported-by: Shixiong Ou <oushixiong@kylinos.cn>

Thanks and Regards,
Shixiong Ou.

>   	}
>   
>   	ret = hibmc_kms_init(priv);
--------------Yf9zWol0zqtZcWmT4DeHz07g
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <div class="moz-cite-prefix">在 2025/5/30 17:54, 00 1970 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250530095432.1206966-5-shiyongbang@huawei.com">
      <pre wrap="" class="moz-quote-pre">From: Baihan Li <a class="moz-txt-link-rfc2396E" href="mailto:libaihan@huawei.com">&lt;libaihan@huawei.com&gt;</a>

When hibmc loaded failed, the driver use hibmc_unload to free the
resource, but the mutexes in mode.config are not init, which will
access an NULL pointer.

Fixes: b3df5e65cc03 ("drm/hibmc: Drop drm_vblank_cleanup")
Reported-by: <a class="moz-txt-link-abbreviated" href="mailto:oushixiong1025@163.com">oushixiong1025@163.com</a>
Signed-off-by: Baihan Li <a class="moz-txt-link-rfc2396E" href="mailto:libaihan@huawei.com">&lt;libaihan@huawei.com&gt;</a>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 4cdcc34070ee..ac552c339671 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -319,13 +319,13 @@ static int hibmc_load(struct drm_device *dev)
 
 	ret = hibmc_hw_init(priv);
 	if (ret)
-		goto err;
+		return ret;
 
 	ret = drmm_vram_helper_init(dev, pci_resource_start(pdev, 0),
 				    pci_resource_len(pdev, 0));
 	if (ret) {
 		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
-		goto err;
+		return ret;</pre>
    </blockquote>
    <p>The mutexes in mode.config are <span
style="color: rgb(64, 64, 64); font-family: quote-cjk-patch, Inter, system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Noto Sans&quot;, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, Oxygen, &quot;Open Sans&quot;, sans-serif; font-size: 16.002px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">initialized</span>
      when calling hibmc_kms_init(), <br>
      if calling hibmc_kms_init() failed it also need to return.</p>
    <p>You may want to look at the following patch:<br>
        <a href="https://lkml.org/lkml/2025/5/20/331">LKML:
        oushixiong1025@163 ...: [PATCH] drm/hisilicon: Fix a NULL
        pointer access when hibmc_load failed</a></p>
    <p>Reported-by: Shixiong Ou <a class="moz-txt-link-rfc2396E" href="mailto:oushixiong@kylinos.cn">&lt;oushixiong@kylinos.cn&gt;</a></p>
    <p>Thanks and Regards,<br>
      Shixiong Ou.<br>
    </p>
    <blockquote type="cite"
      cite="mid:20250530095432.1206966-5-shiyongbang@huawei.com">
      <pre wrap="" class="moz-quote-pre">
 	}
 
 	ret = hibmc_kms_init(priv);
</pre>
    </blockquote>
  </body>
</html>

--------------Yf9zWol0zqtZcWmT4DeHz07g--

