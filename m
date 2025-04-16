Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8536A91509
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 09:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF9610EA3D;
	Thu, 17 Apr 2025 07:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="goU4ANjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DBF10E976
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 17:17:37 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-54afb5fcebaso8778759e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 10:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744823856; x=1745428656; darn=lists.freedesktop.org;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p3b+zeH7rWYpJmBO5lBWisIlQUvmuGjOtwZlH2vw6+U=;
 b=goU4ANjWvkrCMKRh3eh5Q6p1jBvMNv6LRYWzlfnoaaFoDDJTCQEuGnFrmDroQmWIRX
 WhPEVkpCaDc+xXB64Vd5QpzhbdMoBxBeqEE5w2xEwwZ/TP1CJ9p2JC8fyjPJLAfSK8o8
 bfxUYeAQH8SXsrB9YvrWzFet23WzadRl0TcT5VASHEOEFGkyjQr2fYekawFyG2n8jJss
 FAACQE+lqQY6VeW6C7aoO6bbqfef4vD+eMSg91XPg0do9LOEdUwpsqIkJR5e7805mgYo
 KaJx32nPhP8L+5bmlM/0HwAwHhEE1zoI4n42r5Ghcvm+UujgIsax+IIevgqzsXGGRe9y
 zMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744823856; x=1745428656;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p3b+zeH7rWYpJmBO5lBWisIlQUvmuGjOtwZlH2vw6+U=;
 b=mPUi0FDoxApnCAVKL3xTS8IMr2LEVXN6QXkaQA8A8+ud/M2k04tvJMzNCZU02/GD7Y
 Nb5SBwqDkeMSHyIASx5QIpv79/QoGVsOs2lQmEeIO0qBayS+O4JAnixClW+7ZGadANON
 HNhAUeNP3ypiEeRKt9BFJVvLFoUTDgM9vNTuBePZFDPykJk4TC6nRtOPNO6ErKhzjYg9
 UCGeARY0SxV2sq44jFS6ffopSY7jLh77IosdkzFLk9jfE2zXnMX4wuCr5A5nAqNDdHQ0
 3BgSH/28pcmgLD8b01sB7d8cUMhutRLlN3hMzMgt0UIeYgvLuq4mm0r1gmM0HWegyIv5
 8Zkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA68CxWzGdbX7lJ3RfibZkGKA5KG9m1Np+RI2WhmjBEHn1jAIE9gX7iyYiOapbqwj4XRJ58YuUuqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX5X1U+EU8Rq2AdVAk3hg0iK25LdtWEA1dUOGonM7/cxS1DzZW
 cB2PYjLIb2x8jm2q5hzlzrK8Y/LsGg82Ms+1G0e5JroKxcyl4P+y
X-Gm-Gg: ASbGncvhjnFWtm32IeSqpmedA7nI9QBHj2qcMiqjQaeQnQenHN6dHrVWVMxB50/sBeT
 bgIFZJkHVyubRV18j/YN1VebNOqObhseDLA891vervxYdC35I+CpObAQw/C19Tu/l76Byy7Lhvi
 VvGQWvZ9AFiybf0GbHGkExhGz1h8MN8wNk1FjIlz9UU2XaJJRoiE7eQu7KZyogHrYdIbt7HYhqG
 i2D/PQHoiLBVDpUA1AndqxoXrHoQbemgziKlSohVtyxDSU1wsuG3jStQcfbxEMnGDmDAPnnIjme
 T/C/T7xm7bPdu8f1IALK/utKzevF/UxaPHCTP+KlYlyvKhEYq2H7k14=
X-Google-Smtp-Source: AGHT+IHgS93xBloD0L9yqzXrZsTR3gD78+pFYcbqpOdRLppxVx8e6ARpe/n7J4iZ8d34Wt5Yx8Y6Gg==
X-Received: by 2002:a05:6512:ba9:b0:549:5822:c334 with SMTP id
 2adb3069b0e04-54d64afc313mr845614e87.52.1744823855405; 
 Wed, 16 Apr 2025 10:17:35 -0700 (PDT)
Received: from [192.168.0.143] ([176.124.171.91])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d52019fsm1731241e87.221.2025.04.16.10.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 10:17:35 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------a5hjqGMKvi5bglQPXOWdwM3M"
Message-ID: <b0e7f094-ce26-4d22-bc0a-360f42676253@gmail.com>
Date: Wed, 16 Apr 2025 20:17:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Fix value in <VBLKSTR> register
To: Wakko Warner <wakko@animx.eu.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org, 
 stable@vger.kernel.org
References: <20250416083847.51764-1-tzimmermann@suse.de>
 <Z//LSBwuoc6Hf3zG@animx.eu.org>
 <568a359c-e096-4486-84b3-95b37b2de7a6@suse.de>
 <Z//hO7ol4nED5UiH@animx.eu.org>
Content-Language: ru
From: afmer <afmerlord@gmail.com>
In-Reply-To: <Z//hO7ol4nED5UiH@animx.eu.org>
X-Mailman-Approved-At: Thu, 17 Apr 2025 07:22:17 +0000
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
--------------a5hjqGMKvi5bglQPXOWdwM3M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello. Maybe I don't understand something, but I installed kernel 
version 6.14.2 on Arch Linux and the problem with the blinking video 
signal on IPMI remained


16.04.2025 19:56, Wakko Warner пишет:
> Thomas Zimmermann wrote:
>> Hi
>>
>> Am 16.04.25 um 17:22 schrieb Wakko Warner:
>>> Thomas Zimmermann wrote:
>>>> Fix an off-by-one error when setting the vblanking start in
>>>> <VBLKSTR>. Commit d6460bd52c27 ("drm/mgag200: Add dedicated
>>>> variables for blanking fields") switched the value from
>>>> crtc_vdisplay to crtc_vblank_start, which DRM helpers copy
>>>> from the former. The commit missed to subtract one though.
>>> Applied to 6.14.2.  BMC and external monitor works as expected.
>> Great. Thanks for testing. Can I add your Tested-by tag to the commit?
> You may.
>
>>>> Reported-by: Wakko Warner<wakko@animx.eu.org>
>>>> Closes:https://lore.kernel.org/dri-devel/CAMwc25rKPKooaSp85zDq2eh-9q4UPZD=RqSDBRp1fAagDnmRmA@mail.gmail.com/
>>>> Reported-by: ????????????<afmerlord@gmail.com>
>>>> Closes:https://lore.kernel.org/all/5b193b75-40b1-4342-a16a-ae9fc62f245a@gmail.com/
>>>> Closes:https://bbs.archlinux.org/viewtopic.php?id=303819
>>>> Signed-off-by: Thomas Zimmermann<tzimmermann@suse.de>
>>>> Fixes: d6460bd52c27 ("drm/mgag200: Add dedicated variables for blanking fields")
>>>> Cc: Thomas Zimmermann<tzimmermann@suse.de>
>>>> Cc: Jocelyn Falempe<jfalempe@redhat.com>
>>>> Cc: Dave Airlie<airlied@redhat.com>
>>>> Cc:dri-devel@lists.freedesktop.org
>>>> Cc:<stable@vger.kernel.org> # v6.12+
>>>> ---
>>>>    drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
>>>> index fb71658c3117..6067d08aeee3 100644
>>>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>>>> @@ -223,7 +223,7 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
>>>>    	vsyncstr = mode->crtc_vsync_start - 1;
>>>>    	vsyncend = mode->crtc_vsync_end - 1;
>>>>    	vtotal = mode->crtc_vtotal - 2;
>>>> -	vblkstr = mode->crtc_vblank_start;
>>>> +	vblkstr = mode->crtc_vblank_start - 1;
>>>>    	vblkend = vtotal + 1;
>>>>    	linecomp = vdispend;
>>>> -- 
>>>> 2.49.0
>>>>
>> -- 
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>
--------------a5hjqGMKvi5bglQPXOWdwM3M
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="tw-data-text tw-text-large tw-ta"
    data-placeholder="Перевод" id="tw-target-text"
    style="text-align:left"
    data-ved="2ahUKEwjMo56Xh92MAxULFBAIHR72GfQQ3ewLegQICBAU" dir="ltr"
aria-label="Переведенный текст: Hello. Maybe I don't understand something, but I installed kernel version 6.14.2 on Arch Linux and the problem with the blinking video signal on IPMI remained"><span
    class="Y2IQFc" lang="en">Hello. Maybe I don't understand something, but I installed kernel version 6.14.2 on Arch Linux and the problem with the blinking video signal on IPMI remained</span></pre>
    <p><br>
    </p>
    <div class="moz-cite-prefix">16.04.2025 19:56, Wakko Warner пишет:<br>
    </div>
    <blockquote type="cite" cite="mid:Z%2F%2FhO7ol4nED5UiH@animx.eu.org">
      <pre wrap="" class="moz-quote-pre">Thomas Zimmermann wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hi

Am 16.04.25 um 17:22 schrieb Wakko Warner:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Thomas Zimmermann wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Fix an off-by-one error when setting the vblanking start in
&lt;VBLKSTR&gt;. Commit d6460bd52c27 ("drm/mgag200: Add dedicated
variables for blanking fields") switched the value from
crtc_vdisplay to crtc_vblank_start, which DRM helpers copy
from the former. The commit missed to subtract one though.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Applied to 6.14.2.  BMC and external monitor works as expected.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Great. Thanks for testing. Can I add your Tested-by tag to the commit?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You may.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Reported-by: Wakko Warner <a class="moz-txt-link-rfc2396E" href="mailto:wakko@animx.eu.org">&lt;wakko@animx.eu.org&gt;</a>
Closes: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/CAMwc25rKPKooaSp85zDq2eh-9q4UPZD=RqSDBRp1fAagDnmRmA@mail.gmail.com/">https://lore.kernel.org/dri-devel/CAMwc25rKPKooaSp85zDq2eh-9q4UPZD=RqSDBRp1fAagDnmRmA@mail.gmail.com/</a>
Reported-by: ???????????? <a class="moz-txt-link-rfc2396E" href="mailto:afmerlord@gmail.com">&lt;afmerlord@gmail.com&gt;</a>
Closes: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/5b193b75-40b1-4342-a16a-ae9fc62f245a@gmail.com/">https://lore.kernel.org/all/5b193b75-40b1-4342-a16a-ae9fc62f245a@gmail.com/</a>
Closes: <a class="moz-txt-link-freetext" href="https://bbs.archlinux.org/viewtopic.php?id=303819">https://bbs.archlinux.org/viewtopic.php?id=303819</a>
Signed-off-by: Thomas Zimmermann <a class="moz-txt-link-rfc2396E" href="mailto:tzimmermann@suse.de">&lt;tzimmermann@suse.de&gt;</a>
Fixes: d6460bd52c27 ("drm/mgag200: Add dedicated variables for blanking fields")
Cc: Thomas Zimmermann <a class="moz-txt-link-rfc2396E" href="mailto:tzimmermann@suse.de">&lt;tzimmermann@suse.de&gt;</a>
Cc: Jocelyn Falempe <a class="moz-txt-link-rfc2396E" href="mailto:jfalempe@redhat.com">&lt;jfalempe@redhat.com&gt;</a>
Cc: Dave Airlie <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
Cc: <a class="moz-txt-link-rfc2396E" href="mailto:stable@vger.kernel.org">&lt;stable@vger.kernel.org&gt;</a> # v6.12+
---
  drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index fb71658c3117..6067d08aeee3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -223,7 +223,7 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
  	vsyncstr = mode-&gt;crtc_vsync_start - 1;
  	vsyncend = mode-&gt;crtc_vsync_end - 1;
  	vtotal = mode-&gt;crtc_vtotal - 2;
-	vblkstr = mode-&gt;crtc_vblank_start;
+	vblkstr = mode-&gt;crtc_vblank_start - 1;
  	vblkend = vtotal + 1;
  	linecomp = vdispend;
-- 
2.49.0

</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------a5hjqGMKvi5bglQPXOWdwM3M--
