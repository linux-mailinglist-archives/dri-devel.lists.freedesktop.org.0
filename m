Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F4C4A7E48
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 04:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE2E10E6C3;
	Thu,  3 Feb 2022 03:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BCA10E626
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 03:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=T8bNH9fL4HTNLFcbm/NljfXqh0eT/3CzmsIE177pSnI=; b=n/xSt0MdUbZxJg954Oxg8G0yzz
 My+XNLZEgmIIuimUoq5ush3+t+uSH1sAmtWtVm11n8XcNWCxSfMrkf7cel7FF9enxhFOl0jV/CM+e
 qV08qYdtpro2Ctm4iZfKHiRIfMRIYqON1OYy22//5x+iY7qI5CAzP6cXQbVc2qdkgzr/yfPa8zEtS
 UUlCOaRsTbcYGfARsqVA2JcmAZgLcYnMAcj1eY1Yxf0f1Ua70xpBuFD5VqOQnmHpKx3Jou+ECFGjb
 mCu8yEbZ+FN3cDDGpydHRll2Cdl3UEZ7Fw+cf0O+QT15RyeWuc68fe1gu+0ciD+PyPq6Q1Xkljm1w
 9tOhOXwg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFSb0-00HRUX-JR; Thu, 03 Feb 2022 03:15:42 +0000
Message-ID: <582f032f-e04c-aade-4d18-514fb7e2d848@infradead.org>
Date: Wed, 2 Feb 2022 19:15:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Kconfig CONFIG_FB dependency regression
Content-Language: en-US
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Arnd Bergmann <arnd@kernel.org>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi--

On 2/2/22 15:55, Thinh Nguyen wrote:
> Arnd Bergmann wrote:
>> On Wed, Feb 2, 2022 at 1:14 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>>> Fabio Estevam wrote:
>>>> On Tue, Feb 1, 2022 at 8:06 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>>
>>>>> On 2/1/22 15:01, Thinh Nguyen wrote:
>>>>>> Hi,
>>>>>>
>>>>>> One of our test setups is unable to boot (stuck at initramfs). Git
>>>>>> bisection points to the commit below:
>>>>>>
>>>>>> f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
>>>>>>
>>>>>> Reverting this patch resolves the issue. This issue persists in mainline
>>>>>> also. Unfortunately there isn't any meaningful log. Hopefully someone
>>>>>> can give some insight as to what could be the issue and revert/fix this
>>>>>> issue.
>>>>>
>>>>> Hi,
>>>>> Did you enable DRM_FBDEV_EMULATION?
>>>
>>> I did not enable it.
>>>
>>>>> Please provide the failing .config file.
>>>>
>>>> Does selecting CONFIG_FB=y help?
>>>>
>>>
>>> On the config that has the issue, this isn't set. After reverting the
>>> commit above, this was set. Maybe this is what's needed? I need to test it.
>>
>> CONFIG_FB should not normally be needed for booting, so unless
>> you have a graphical application in your initramfs that requires the /dev/fb0
>> device to work, it is not supposed to make a difference.
>>
> 
> I'm not sure, but it seems like the setup we have isn't the only one
> that needed it. Fabio also noted that the imx_v6_v7_defconfig also needs
> to have CONFIG_FB set.
> 
>> Are there any other differences in your .config before and after the patch?
>> It's possible that you use some other driver that in turn depends on
>> CONFIG_FB. Does your machine have any graphical output device?
>> If yes, which driver do you use?
> 
> I don't have the answer to those questions yet. Need more investigation.
> I'm new to this particular test setup.
> 
>>
>> You may also want to make sure that you have 9d6366e743f3 ("drm:
>> fb_helper: improve CONFIG_FB dependency") in your kernel, which
>> fixes a minor problem with my original patch.
>>
>>          Arnd
> 
> The issue also occurs in mainline, which has your minor fix commit
> above. The revert isn't clean for the latest kernel version. I also have
> to revert some of the changes along with CONFIG_FB. The revert looks
> more like this for the latest kernel:
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index b1f22e457fd0..7cbc733a8569 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -118,8 +118,9 @@ config DRM_DEBUG_MODESET_LOCK
> 
>  config DRM_FBDEV_EMULATION
>         bool "Enable legacy fbdev support for your modesetting driver"
> -       depends on DRM_KMS_HELPER
> -       depends on FB=y || FB=DRM_KMS_HELPER
> +       depends on DRM
> +       select DRM_KMS_HELPER
> +       select FB
>         select FB_CFB_FILLRECT
>         select FB_CFB_COPYAREA
>         select FB_CFB_IMAGEBLIT
> 
> 
> 
> I attached the configs for kernel v5.17-rc1. The "bad" config is without
> any revert, the "good" config is with the change above.

I took bad.config with kernel 5.17-rc1 and then manually set/enabled:

CONFIG_FB
CONFIG_FB_EFI
CONFIG_FB_MODE_HELPERS
CONFIG_FB_TILEBLITTING
CONFIG_LOGO

and I got very close to your good.config file.
Can you do the same and see if it works for you?
If so, then we can decide what to do about it.


thanks.
-- 
~Randy
