Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3592F838D7C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 12:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C50310E537;
	Tue, 23 Jan 2024 11:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 500 seconds by postgrey-1.36 at gabe;
 Tue, 23 Jan 2024 01:30:09 UTC
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 209A210F28D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:30:08 +0000 (UTC)
Received: from loongson.cn (unknown [122.96.148.122])
 by gateway (Coremail) with SMTP id _____8BxefCnFK9l1fYDAA--.16592S3;
 Tue, 23 Jan 2024 09:21:43 +0800 (CST)
Received: from [10.160.14.173] (unknown [122.96.148.122])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxhcymFK9l0T4TAA--.5690S2; 
 Tue, 23 Jan 2024 09:21:42 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------Qa5iG02T6BV36bmC7bQb7Yzc"
Message-ID: <07112f1d-7950-4ffa-be53-923c4951eb3d@loongson.cn>
Date: Tue, 23 Jan 2024 09:21:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/loongson: Error out if no VRAM detected
Content-Language: en-US
To: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huacai Chen <chenhuacai@kernel.org>,
 Jingfeng Sui <suijingfeng@loongson.cn>
References: <20240119104049.335449-1-chenhuacai@loongson.cn>
From: Shi Pujin <shipujin@loongson.cn>
In-Reply-To: <20240119104049.335449-1-chenhuacai@loongson.cn>
X-CM-TRANSID: AQAAf8AxhcymFK9l0T4TAA--.5690S2
X-CM-SenderInfo: xvkl13hmlqqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ury7Jw4DXry5KFWfKF13ZFc_yoW8CF4fpr
 W3C34Ikay5tF12grsrGry8C3W3uasrAFZ7Gw4xGw18urWDAa10v398JF4jyFW7ZFZ3X3W2
 vrn7K3y09F17t3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJUUUymb4IE77IF4wAF
 F20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r
 1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAF
 wI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67
 AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x2
 0xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx
 0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCjr7xv
 wVCIw2I0I7xG6c02F41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
 67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
 9x07UiqXdUUUUU=
X-Mailman-Approved-At: Tue, 23 Jan 2024 11:32:57 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------Qa5iG02T6BV36bmC7bQb7Yzc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

This patch works fine with my Loongson 3A5000 laptop (GDC-1401), which 
has a
7A1000 chipset without VRAM.

lspci |grep VGA
00:06.1 VGA compatible controller: Loongson Technology LLC DC (Display 
Controller) (rev 01)
07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. 
[AMD/ATI] Oland [Radeon HD 8570 / R5 430 OEM / R7 240/340 / Radeon 520 
OEM] (rev 87)

在 2024/1/19 18:40, Huacai Chen 写道:
> If there is no VRAM (it is true if there is a discreted card), we get
> such an error and Xorg fails to start:
>
> [  136.401131] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  137.444342] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  138.871166] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  140.444078] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  142.403993] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  143.970625] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  145.862013] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
>
> So in lsdc_get_dedicated_vram() we error out if no VRAM (or VRAM is less
> than 1MB which is also an unusable case) detected.
>
> Signed-off-by: Huacai Chen<chenhuacai@loongson.cn>
> ---
>   drivers/gpu/drm/loongson/lsdc_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
> index 89ccc0c43169..d8ff60b46abe 100644
> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
> @@ -184,7 +184,7 @@ static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
>   	drm_info(ddev, "Dedicated vram start: 0x%llx, size: %uMiB\n",
>   		 (u64)base, (u32)(size >> 20));
>   
> -	return 0;
> +	return (size > SZ_1M) ? 0 : -ENODEV;
>   }
>   
>   static struct lsdc_device *
--------------Qa5iG02T6BV36bmC7bQb7Yzc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">Hi,
        </span><br>
        <br>
        This patch works fine with my Loongson 3A5000 laptop (GDC-1401),
        which has a  <br>
        7A1000 chipset without VRAM.
        <br>
        <br>
        lspci |grep VGA
        <br>
        00:06.1 VGA compatible controller: Loongson Technology LLC DC
        (Display Controller) (rev 01)
        <br>
        07:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
        [AMD/ATI] Oland [Radeon HD 8570 / R5 430 OEM / R7 240/340 /
        Radeon 520 OEM] (rev 87)<br>
      </span></p>
    <div class="moz-cite-prefix">在 2024/1/19 18:40, Huacai Chen 写道:<br>
    </div>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">If there is no VRAM (it is true if there is a discreted card), we get
such an error and Xorg fails to start:

[  136.401131] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
[  137.444342] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
[  138.871166] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
[  140.444078] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
[  142.403993] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
[  143.970625] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
[  145.862013] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed

So in lsdc_get_dedicated_vram() we error out if no VRAM (or VRAM is less
than 1MB which is also an unusable case) detected.

Signed-off-by: Huacai Chen <a class="moz-txt-link-rfc2396E" href="mailto:chenhuacai@loongson.cn">&lt;chenhuacai@loongson.cn&gt;</a>
---
 drivers/gpu/drm/loongson/lsdc_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index 89ccc0c43169..d8ff60b46abe 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -184,7 +184,7 @@ static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
 	drm_info(ddev, "Dedicated vram start: 0x%llx, size: %uMiB\n",
 		 (u64)base, (u32)(size &gt;&gt; 20));
 
-	return 0;
+	return (size &gt; SZ_1M) ? 0 : -ENODEV;
 }
 
 static struct lsdc_device *
</pre>
    </blockquote>
  </body>
</html>

--------------Qa5iG02T6BV36bmC7bQb7Yzc--

