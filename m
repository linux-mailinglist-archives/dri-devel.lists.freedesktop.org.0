Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A31D43C2F7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 08:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043B589E11;
	Wed, 27 Oct 2021 06:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C547889E11
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 06:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Rqg3stQt4XtdbZ4gHdaa4uO9gPGzOkCoc22v00/z/Gc=; b=fIjDTjmZe9z1PVOTUxtvlWNG54
 yUcznJwM474rbgpbZgTiSY3WPtnRYLk1XpQslyCwnpRqaDmSJZ6gFF4Yr2g23GDHReOIMBHd8BMA4
 kt8GwSHzC59W7we2rBshuWtdr1y410iTGcQoDJtvXtt7LP0daBAbYIeX9ougGKfGTNOltfuiyQLzu
 zFtllP3Y1x2nqxX4gT7TT98Il3XYv4FWIAdJK2hpOKXu7jwwl3qZdHk2IF0ieBqA+IPJK5MJub8Z6
 PNWQBYlxvDdFVQjaHvfchuN4ZavN7ZPj57OwKFsb/mH0FkaaCOLGVcTdNCJPnitxOq7TZwZpcWoTP
 mqEaT1kA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfcO0-0041fE-VR; Wed, 27 Oct 2021 06:26:09 +0000
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to
 `drm_gem_fb_get_obj'
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
 <857ab1a9-0175-2b2c-e729-2620d0221e1e@suse.de>
 <6862b109-ea12-6ffa-c82b-b23ee26aa5b2@infradead.org>
 <CAK8P3a0wG8dKnuQMOL=bKmBHuSkWcu6OfvhTP-86rpLdr7_5CA@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <61f14f2b-b1cd-b9df-86fd-8fcc4b9eb738@infradead.org>
Date: Tue, 26 Oct 2021 23:26:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0wG8dKnuQMOL=bKmBHuSkWcu6OfvhTP-86rpLdr7_5CA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/26/21 11:19 PM, Arnd Bergmann wrote:
> On Wed, Oct 27, 2021 at 2:58 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>>>
>>> Looking at this config, there is:
>>>
>>> CONFIG_DRM=y
>>> # CONFIG_DRM_DP_AUX_CHARDEV is not set
>>> # CONFIG_DRM_DEBUG_MM is not set
>>> # CONFIG_DRM_DEBUG_SELFTEST is not set
>>> CONFIG_DRM_KMS_HELPER=m
>>> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
>>> # CONFIG_DRM_DP_CEC is not set
>>> CONFIG_DRM_GEM_CMA_HELPER=y
>>> CONFIG_DRM_KMS_CMA_HELPER=y
>>>
>>> GEM_CMA_HELPER depends on KMS_HELPER, but the latter is a module. That's probably the cause of the problem. Is it intentionally set this way?
>>>
>>
>> The only drivers that select DRM_KMS_HELPER are both =m, so that's how
>> DRM_KMS_HELPER is set also.
>>
>> Symbol: DRM_KMS_HELPER [=m]
>> Type : tristate
>> Defined at drivers/gpu/drm/Kconfig:82
>> Depends on: HAS_IOMEM [=y] && DRM [=y]
>> Selected by [m]:
>> - DRM_ATMEL_HLCDC [=m] && HAS_IOMEM [=y] && DRM [=y] && OF [=y] && COMMON_CLK [=y] && MFD_ATMEL_HLCDC [=y] && ARM [=y]
>> - DRM_ASPEED_GFX [=m] && HAS_IOMEM [=y] && DRM [=y] && OF [=y] && (COMPILE_TEST [=n] || ARCH_ASPEED [=y]) && MMU [=y]
>>
>>
>> I did the ARM cross-build and also see the linker error.
>> I didn't understand why -- and still don't, but here is a little
>> speculation:
>>
>> In the past (e.g. 10 years ago), we have to move some .o files
>> in lib/ from lib-y to obj-y so that they would always be included
>> in the final object file and not cause their user/caller object
>> files to suffer from undefined references.
>> These happened because unused functions(?) in lib-y files are
>> stripped out of the final object files.
>> The same thing could be happening here (still just guessing).
>>
>> Does that help any?  I dunno.
>>
>> Adding Arnd to Cc: to see if he has any ideas...
> 
>  From all I can tell, the problem is that DRM_KMS_CMA_HELPER is a 'bool'
> symbol, so if it gets selected by a '=m' driver, it turns into '=y', which
> then selects DRM_GEM_CMA_HELPER=y, but that one cannot link
> against DRM_KMS_HELPER=m code.
> 
> This trivial change makes it all build:
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index c08860db2520..699f434ce813 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -218,7 +218,7 @@ config DRM_GEM_CMA_HELPER
>            Choose this if you need the GEM CMA helper functions
> 
>   config DRM_KMS_CMA_HELPER
> -       bool
> +       tristate
>          depends on DRM
>          select DRM_GEM_CMA_HELPER
>          help
> 
> but this needs some more testing to make sure it doesn't add
> any other regressions.
> 
> Interestingly, I never hit the problem in randconfig testing since
> there is always some '=y' driver that selects DRM_KMS_HELPER.
> 
>          Arnd
> 

Hi Arnd,
Thomas had posted a patch that also fixes the problem.
Somehow I missed seeing that the first time around.

Thanks.
-- 
~Randy
