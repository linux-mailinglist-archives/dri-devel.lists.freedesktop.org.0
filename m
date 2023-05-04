Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB1D6F69D5
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03BB10E069;
	Thu,  4 May 2023 11:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5FA5C10E069
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 11:25:53 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:56734.294361253
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 3F9DF10021A;
 Thu,  4 May 2023 19:25:47 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-85667d6c59-6qwzn with ESMTP id
 9f667beeb43d4e3781deb21ab0482b44 for tzimmermann@suse.de; 
 Thu, 04 May 2023 19:25:50 CST
X-Transaction-ID: 9f667beeb43d4e3781deb21ab0482b44
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <8feb341c-fafa-9ca2-4522-fc907aebb0f1@189.cn>
Date: Thu, 4 May 2023 19:25:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [v4,1/6] fbdev/matrox: Remove trailing whitespaces
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
 vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 davem@davemloft.net, James.Bottomley@HansenPartnership.com, arnd@arndb.de,
 sam@ravnborg.org
References: <20230504074539.8181-2-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230504074539.8181-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>


On 2023/5/4 15:45, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>   drivers/video/fbdev/matrox/matroxfb_accel.c | 6 +++---
>   drivers/video/fbdev/matrox/matroxfb_base.h  | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/video/fbdev/matrox/matroxfb_accel.c b/drivers/video/fbdev/matrox/matroxfb_accel.c
> index 9cb0685feddd..ce51227798a1 100644
> --- a/drivers/video/fbdev/matrox/matroxfb_accel.c
> +++ b/drivers/video/fbdev/matrox/matroxfb_accel.c
> @@ -88,7 +88,7 @@
>   
>   static inline void matrox_cfb4_pal(u_int32_t* pal) {
>   	unsigned int i;
> -	
> +
>   	for (i = 0; i < 16; i++) {
>   		pal[i] = i * 0x11111111U;
>   	}
> @@ -96,7 +96,7 @@ static inline void matrox_cfb4_pal(u_int32_t* pal) {
>   
>   static inline void matrox_cfb8_pal(u_int32_t* pal) {
>   	unsigned int i;
> -	
> +
>   	for (i = 0; i < 16; i++) {
>   		pal[i] = i * 0x01010101U;
>   	}
> @@ -482,7 +482,7 @@ static void matroxfb_1bpp_imageblit(struct matrox_fb_info *minfo, u_int32_t fgx,
>   			/* Tell... well, why bother... */
>   			while (height--) {
>   				size_t i;
> -				
> +
>   				for (i = 0; i < step; i += 4) {
>   					/* Hope that there are at least three readable bytes beyond the end of bitmap */
>   					fb_writel(get_unaligned((u_int32_t*)(chardata + i)),mmio.vaddr);
> diff --git a/drivers/video/fbdev/matrox/matroxfb_base.h b/drivers/video/fbdev/matrox/matroxfb_base.h
> index 958be6805f87..c93c69bbcd57 100644
> --- a/drivers/video/fbdev/matrox/matroxfb_base.h
> +++ b/drivers/video/fbdev/matrox/matroxfb_base.h
> @@ -301,9 +301,9 @@ struct matrox_altout {
>   	int		(*verifymode)(void* altout_dev, u_int32_t mode);
>   	int		(*getqueryctrl)(void* altout_dev,
>   					struct v4l2_queryctrl* ctrl);
> -	int		(*getctrl)(void* altout_dev,
> +	int		(*getctrl)(void *altout_dev,
>   				   struct v4l2_control* ctrl);
> -	int		(*setctrl)(void* altout_dev,
> +	int		(*setctrl)(void *altout_dev,
>   				   struct v4l2_control* ctrl);
>   };
>   
