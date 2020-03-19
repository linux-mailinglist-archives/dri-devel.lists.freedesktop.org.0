Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFC218C881
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAC56EAD4;
	Fri, 20 Mar 2020 08:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4D46E32E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 12:28:00 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l20so2014958wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=A9SGNay6V5AK51JymycAKfsjcnHxWtXDcTFCmT1Vk+E=;
 b=rWNJYxiRGxQPNJ0vJ1Hjn39bP0NuYfEf0w9eCCOSFBbW/sR8X1EFAiE6O254aP4Ixe
 L7MD8WjBigyHc4soKokx0mhvOKKcjHY/Tw4QX7eK1MibVaNsHMWU6cI3oTfIwW+5pe1o
 U9CTwcxKCVhYuUxbnfM24442Zj7K7kYk3CWsdxf0LXFUUwRHpMtrcuKOunQ+BoHLSGVf
 kXodDeNl44EuXRVB/pgfNykVP/TvEpim6P1SaEK1hVlrNMRE6/g2I3e9rtzFf20071kk
 KNCZMmH5m9m/S8sPgBBLdJ5lByOqjlqeAl58Yb924o+xaQKHT01k8jpmbLZYQ4NHbfJ+
 CcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=A9SGNay6V5AK51JymycAKfsjcnHxWtXDcTFCmT1Vk+E=;
 b=HQm5UIKNIcWwtGJzipbqzdnQupx6f06BLWUg4GIC1inOWARwy+WxBbFqh2BscFwFrj
 C+P1Im9n6/NB4IxhyM3SfLiljS4RyaL6WSYGhf+UAUKBVH9Cro5FT53edUQsMyD4XnWe
 trlN+wNJbFnEwKX6tNFQO3LEb3xR9SL9SbxruxqttSvWMtesMDZT2Ikoz5/cYgvmP+j2
 gpxmRNYPcA1GxBZxHA6GLs7z+me5p6GMKmv5NKyaPt6wBKFaXE0U4/+oyOYzRH3o2tlW
 vNeAt+vR6Q8V9M1O8Opv9/arW9r80Jx5bNthEJPiKh8WM1QmPlYirvcviWgrqQX2ZbfB
 vsaw==
X-Gm-Message-State: ANhLgQ0XSvf4awAgZTu4PTVjiK2MQH+mP6Eqy7FxPfk+1REXZJ4FDQzQ
 ClQ3/wg6BcUsPiqw2AHy2t/gopCn
X-Google-Smtp-Source: ADFU+vt9CrOL32fzju0rsgW6b2+is1jo4E9mLrZ14oElkWNUmIMnH4/u4Z397A0CwFhXELH0EzqcQA==
X-Received: by 2002:a1c:bd82:: with SMTP id n124mr3468131wmf.162.1584620879035; 
 Thu, 19 Mar 2020 05:27:59 -0700 (PDT)
Received: from wambui.local ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id c124sm3022493wma.10.2020.03.19.05.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 05:27:58 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Thu, 19 Mar 2020 15:27:29 +0300 (EAT)
To: Daniel Vetter <daniel@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>, 
 Wambui Karuga <wambui.karugax@gmail.com>, Dave Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 10/17] drm/vram-helper: make drm_vram_mm_debugfs_init()
 return 0
In-Reply-To: <20200319101830.GB2363188@phenom.ffwll.local>
Message-ID: <alpine.LNX.2.21.99999.375.2003191522020.89327@wambui>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
 <20200310133121.27913-11-wambui.karugax@gmail.com>
 <20200318152627.GY2363188@phenom.ffwll.local>
 <alpine.LNX.2.21.99999.375.2003181857010.54051@wambui>
 <CAKMK7uGwJ6nzLPzwtfUY79e1fSFxkrSgTfJuDeM4px6c0v13qg@mail.gmail.com>
 <20200318165846.GC3090655@kroah.com>
 <CAKMK7uGbg5Lax+eXJda4k9LNd7JBb+LRtRw4S+bZ4GbNGT--ZA@mail.gmail.com>
 <20200319075524.GB3445010@kroah.com>
 <20200319101830.GB2363188@phenom.ffwll.local>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:25 +0000
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Thu, 19 Mar 2020, Daniel Vetter wrote:

> On Thu, Mar 19, 2020 at 08:55:24AM +0100, Greg KH wrote:
>> On Wed, Mar 18, 2020 at 08:10:43PM +0100, Daniel Vetter wrote:
>>> On Wed, Mar 18, 2020 at 5:58 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>>>>
>>>> On Wed, Mar 18, 2020 at 05:31:47PM +0100, Daniel Vetter wrote:
>>>>> On Wed, Mar 18, 2020 at 5:03 PM Wambui Karuga <wambui.karugax@gmail.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On Wed, 18 Mar 2020, Daniel Vetter wrote:
>>>>>>
>>>>>>> On Tue, Mar 10, 2020 at 04:31:14PM +0300, Wambui Karuga wrote:
>>>>>>>> Since 987d65d01356 (drm: debugfs: make
>>>>>>>> drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
>>>>>>>> fails and should return void. Therefore, remove its use as the
>>>>>>>> return value of drm_vram_mm_debugfs_init(), and have the function
>>>>>>>> return 0 directly.
>>>>>>>>
>>>>>>>> v2: have drm_vram_mm_debugfs_init() return 0 instead of void to avoid
>>>>>>>> introducing build issues and build breakage.
>>>>>>>>
>>>>>>>> References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
>>>>>>>> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
>>>>>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>> ---
>>>>>>>>  drivers/gpu/drm/drm_gem_vram_helper.c | 10 ++++------
>>>>>>>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>>>>> index 92a11bb42365..c8bcc8609650 100644
>>>>>>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>>>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>>>>> @@ -1048,14 +1048,12 @@ static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
>>>>>>>>   */
>>>>>>>>  int drm_vram_mm_debugfs_init(struct drm_minor *minor)
>>>>>>>>  {
>>>>>>>> -    int ret = 0;
>>>>>>>> -
>>>>>>>>  #if defined(CONFIG_DEBUG_FS)
>>>>>>>
>>>>>>> Just noticed that this #if here is not needed, we already have a dummy
>>>>>>> function for that case. Care to write a quick patch to remove it? On top
>>>>>>> of this patch series here ofc, I'm in the processing of merging the entire
>>>>>>> pile.
>>>>>>>
>>>>>>> Thanks, Daniel
>>>>>> Hi Daniel,
>>>>>> Without this check here, and compiling without CONFIG_DEBUG_FS, this
>>>>>> function is run and the drm_debugfs_create_files() does not have access to
>>>>>> the parameters also protected by an #if above this function. So the change
>>>>>> throws an error for me. Is that correct?
>>>>>
>>>>> Hm right. Other drivers don't #ifdef out their debugfs file functions
>>>>> ... kinda a bit disappointing that we can't do this in the neatest way
>>>>> possible.
>>>>>
>>>>> Greg, has anyone ever suggested to convert the debugfs_create_file
>>>>> function (and similar things) to macros that don't use any of the
>>>>> arguments, and then also annotating all the static functions/tables as
>>>>> __maybe_unused and let the compiler garbage collect everything?
>>>>> Instead of explicit #ifdef in all the drivers ...
>>>>
>>>> No, no one has suggested that, having the functions be static inline
>>>> should make it all "just work" properly if debugfs is not enabled.  The
>>>> variables will not be used, so the compiler should just optimize them
>>>> away properly.
>>>>
>>>> No checks for CONFIG_DEBUG_FS should be needed anywhere in .c code.
>>>
>>> So the trouble with this one is that the static inline functions for
>>> the debugfs file are wrapped in a #if too, and hence if we drop the
>>> #if around the function call stuff won't compile. Should we drop all
>>> the #if in the .c file and assume the compiler will remove all the
>>> dead code and dead functions?
>>
>> Yes you should :)
>>
>> there should not be any need for #if in a .c file for debugfs stuff.
>
> Wambui, can you pls try that out? I.e. removing all the #if for
> CONFIG_DEBUG_FS from that file.

Removing them works with CONFIG_DEBUG_FS enabled or disabled.
I can send a patch for that.

wambui karuga
> -Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
