Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5986C17C3F9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 18:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF6C6E4C5;
	Fri,  6 Mar 2020 17:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39BC6E4C5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 17:14:54 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id x62so792903vkg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 09:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lzpbKokk11BRaCUTE3S0a/MWb4B/MGyZwwWpbEvm8gE=;
 b=oxCDkIfplYvmZlhq6A8KbraYVjcHaKeefRxBL8EIvkKEnpVIYk9BqMe2YAGtaBuacA
 gTxymGa8mmHE4f5Kchdkx5OHQTrN4vkO+8HY7eUjUfycchnS7ZveJa+qE25qaqXvLBUR
 UnV34k/3O9CK7UlH6y1PtGmgqt3iMAxNDqnQz13Ll6ZyjWcf45YAH3rXBMQw17+ytK6L
 q2ZXbgrsMyyfdt91luG8Ewklm02sfdTYkN6sM+NctRvmmCWTTva/8aOGyKylA9iZqxcf
 CAJhyPvic+eQoJKOGrct7AQ3oDtI8TBA/6FW5G2LvYd8lDiK3jEPbEIar6Rlo8khbZoE
 uZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lzpbKokk11BRaCUTE3S0a/MWb4B/MGyZwwWpbEvm8gE=;
 b=J3HehcBF9//O/3Ck/wA1XmVWdt0SyrE8I86eJoGnbNBfdp9zzfyUXLQypuPjt6maJ9
 5uiPvfFrrw+k6P+INdJ/sZGFixqVYL4wivB+V2NAeLUa3wSeHS2GwLJldWDCx3DxF3JM
 0ekSQ3GRzrb+1hr1n+O29O1Nu73unaSdg4LsNqPUWr5vg9S+l3uH0WwEN52yezRhyl8l
 nQwXb3+1TwFNrc/NlOWA1OpeuuJHj5EQXmdI36QYb5VXRRLl2zuw1q5qYbHhzaQN2FqA
 w4oOroz1Rdlpq5NPNQbl6CxDKB4LMWcaBrmQB1QYk/khlfquLCmYBJ/erQ7z4xzgDVkK
 MT0w==
X-Gm-Message-State: ANhLgQ0b0UfIIYMyTEYRDUBX33bI/J4tJOjxZS2vYJm7gSGv8Va5Fe7U
 KwE0vgBFyOJvUk88lpIbDHFmXg9za+QDpb5dqLU=
X-Google-Smtp-Source: ADFU+vtZ5Ro2yv+kU6KSstLAFH2EszWFrIshdXo0f6ZIZ545pmAPHBGaIceGDW3Bo/2It2oOU2BcawGthNkkEJgzTvA=
X-Received: by 2002:a1f:264b:: with SMTP id m72mr2236379vkm.51.1583514893670; 
 Fri, 06 Mar 2020 09:14:53 -0800 (PST)
MIME-Version: 1.0
References: <1582710377-15489-1-git-send-email-kevin3.tang@gmail.com>
 <1582710377-15489-5-git-send-email-kevin3.tang@gmail.com>
 <CACvgo53dME1ioYebimSzdOMvjAudtmzpz_-5Q7rNqQnZoBpaqA@mail.gmail.com>
 <CAFPSGXYgY7=vgX6ZPWRgfxfZfBeVRj7=gUOwrcTyYpkYE1C1cA@mail.gmail.com>
In-Reply-To: <CAFPSGXYgY7=vgX6ZPWRgfxfZfBeVRj7=gUOwrcTyYpkYE1C1cA@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 6 Mar 2020 17:14:14 +0000
Message-ID: <CACvgo51ShmP+HvLHzxbpzFg2gNs-cD0iey=nM29prDhZsN7fhQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 4/6] drm/sprd: add Unisoc's drm display controller
 driver
To: tang pengchuan <kevin3.tang@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>,
 Dave Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Orson Zhai <orsonzhai@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 Mar 2020 at 13:15, tang pengchuan <kevin3.tang@gmail.com> wrote:
> On Tue, Mar 3, 2020 at 2:29 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:

>> Have you seen a case where the 0 or default case are reached? AFAICT they will
>> never trigger. So one might as well use:
>>
>>     switch (angle) {
>>     case DRM_MODE_FOO:
>>         return DPU_LAYER_ROTATION_FOO;
>>     ...
>>     case DRM_MODE_BAR:
>>         return DPU_LAYER_ROTATION_BAR;
>>     }
>>
> Yeah, the 0 maybe unused code, i will remove it.
> But i think default is need, because userspace could give an incorrect value .
> So we need to setup a default value and doing error check.

As mentioned in the documentation [0] input (userspace) validation
should happen in atomic_check. This function here is called during
atomic_flush which is _not_ allowed to fail.



>> The default case here should be unreachable. Either it is or the upper layer (or
>> earlier code) should ensure that.
>
> There will be some differences in the formats supported by different chips, but userspace will only have one set of code.
> So it is necessary to check whether the parameters passed by the user layer are wrong. I think it is necessary

As said above - this type of issues should be checked _before_
reaching atomic_flush - aka in atomic_check.


>> > +static struct drm_plane *sprd_plane_init(struct drm_device *drm,
>> > +                                       struct sprd_dpu *dpu)
>> > +{
>> > +       struct drm_plane *primary = NULL;
>> > +       struct sprd_plane *p = NULL;
>> > +       struct dpu_capability cap = {};
>> > +       int err, i;
>> > +
>> > +       if (dpu->core && dpu->core->capability)
>> As mentioned before - this always evaluates to true, so drop the check.
>> Same applies for the other dpu->core->foo checks.
>>
>> Still not a huge fan of the abstraction layer, but I guess you're hesitant on
>> removing it.
>
> Sometimes,  some "dpu->core->foo" maybe always need, compatibility will be better.
> eg:
>
>     if (dpu->glb && dpu->glb->power)
>         dpu->glb->power(ctx, true);
>     if (dpu->glb && dpu->glb->enable)
>         dpu->glb->enable(ctx);
>
>     if (ctx->is_stopped && dpu->glb && dpu->glb->reset)
>         dpu->glb->reset(ctx);
>
>     if (dpu->clk && dpu->clk->init)
>         dpu->clk->init(ctx);
>     if (dpu->clk && dpu->clk->enable)
>         dpu->clk->enable(ctx);
>
>     if (dpu->core && dpu->core->init)
>         dpu->core->init(ctx);
>     if (dpu->core && dpu->core->ifconfig)
>         dpu->core->ifconfig(ctx);
>

If there are no hooks, then the whole thing is dead code. As such it
should not be included.


> >
> > Note: Custom properties should be separate patches. This includes documentation
> > why they are needed and references to open-source userspace.
> This only need for our chips, what documentation do we need to provide?
>

KMS properties should be generic. Reason being is that divergence
causes substantial overhead, and fragility, to each and every
userspace consumer. The documentation has some general notes on the
topic [1]. Don't forget the "Testing and validation" section ;-)

Although I've tried to catch everything, I might have missed a comment
or two due the HTML formatting. Please toggle to plain text [2] for
the future.

Thanks
-Emil

[0] https://www.kernel.org/doc/html/v5.5/gpu/drm-kms.html
[1] Documentation/gpu/drm-uapi.rst in particular "Open-Source
Userspace Requirements"
[2] https://smallbusiness.chron.com/reply-inline-gmail-40679.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
