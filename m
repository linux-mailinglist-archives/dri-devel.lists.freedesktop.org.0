Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE012FCF1E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 12:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9836E17D;
	Wed, 20 Jan 2021 11:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAE66E17D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 11:26:58 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id j8so5716542oon.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 03:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bF3kJZOcFi9epN2Ju/OMLYe+R+7Hhk1D0YWcdHI0mig=;
 b=izVJ/aoMWHJbBtduNtBlv80fvfk4AMOqCR1fVP89sgP4r1KzlitBLQVhei6IdNwC0b
 n139tWO/jSeG5PB6CmVmJY/ngiDl4uSYqzvBe3JTIqv/BXJAvevrNxctX/wuVegCPkIT
 q/Vce9FeMPEifc1MdK3IfX/Pwv9tpaXjf7bEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bF3kJZOcFi9epN2Ju/OMLYe+R+7Hhk1D0YWcdHI0mig=;
 b=fCXq0YQ2F8tHfE88bYCwHDhMy9yNbgAUr6qjxjiCSrsYyUIesPHzzrm+wr70yHysPq
 dRCwlmWw5YS6wsMT9V2xBp+GjAgbQbZKYFZS1LR65/eYY+n3hNpJdgmZwIp+xvBAhXuP
 BcRDkrJwXwyarTSbwUoxJFfqzu3DRM29OhGyFv9GBobC0fIVz6KBhK6U9nSKnrQk+5/+
 KlnfTGlDSQSz91zsq/QVJdXGFE0kKZFBMT6qYyclccRbxIkzYgJKAbLNQocfHbTk6MSz
 VLirWQ3sg5b3EhNHKtFdbWa6uaKD/tLnG0H09zgSOmB491mYYCRi9K6aPcID0DDXoIZu
 ooxQ==
X-Gm-Message-State: AOAM532uC7jGF7HFgHaWnPs6FW2ZIiW7thwm5QRN8Y1TyfvoSDDGMJo+
 a7Bffvea9VheBwti/OTNSK7cOaipCmeDnYfWGVxbHw==
X-Google-Smtp-Source: ABdhPJzNf7GDDsKuO2fEPJuRtbJE2LbjunBUPbWEIL8J3gYPW9q007/lCbZ0N5RfnJfLcLzge73Xp86JPERY/PFsHNs=
X-Received: by 2002:a4a:11c2:: with SMTP id 185mr5917268ooc.85.1611142017564; 
 Wed, 20 Jan 2021 03:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20201228183934.1117012-1-pbrobinson@gmail.com>
 <b00bd27c-70b5-9ef1-85a1-11e733af78da@redhat.com>
 <X/c/OwqdMtmqzOZq@phenom.ffwll.local>
 <1acc822f-b7a5-b0be-5533-32528080850a@redhat.com>
In-Reply-To: <1acc822f-b7a5-b0be-5533-32528080850a@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 Jan 2021 12:26:46 +0100
Message-ID: <CAKMK7uHX3C8Dmb8wyypJkOXZQgdrF8P1PxJB4e4mnSm12n68Bg@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: simplefb: Fix info message during probe
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Peter Robinson <pbrobinson@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 20, 2021 at 12:16 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 1/7/21 6:04 PM, Daniel Vetter wrote:
> > Hi Hans,
> >
> > On Tue, Dec 29, 2020 at 02:02:30PM +0100, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 12/28/20 7:39 PM, Peter Robinson wrote:
> >>> The info message was showing the mapped address for the framebuffer. To avoid
> >>> security problems, all virtual addresses are converted to __ptrval__, so
> >>> the message has pointless information:
> >>>
> >>> simple-framebuffer 3ea9b000.framebuffer: framebuffer at 0x3ea9b000, 0x12c000 bytes, mapped to 0x(____ptrval____)
> >>>
> >>> Drop the extraneous bits to clean up the message:
> >>>
> >>> simple-framebuffer 3ea9b000.framebuffer: framebuffer at 0x3ea9b000, 0x12c000 bytes
> >>>
> >>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >>
> >> Thanks, patch looks good to me:
> >>
> >> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >
> > Since you have commit rights for drm-misc I'm assuming you're also going
> > to push this one?
>
> I knew there was some discussion about using drm-misc for drivers/video/fbdev stuff
> but I missed that it was decided to go ahead with that.
>
> Good to know that this is handled through drm-misc now.

This is official since a while:

commit 6a7553e8d84d5322d883cb83bb9888c49a0f04e0
Author: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date:   Fri Aug 9 15:46:40 2019 +0200

   MAINTAINERS: handle fbdev changes through drm-misc tree

Cheers, Daniel

>
> I've pushed this patch to drm-misc-next.
>
> Regards,
>
> Hans
>
>
>
> >>> ---
> >>>  drivers/video/fbdev/simplefb.c | 5 ++---
> >>>  1 file changed, 2 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> >>> index 533a047d07a2..62f0ded70681 100644
> >>> --- a/drivers/video/fbdev/simplefb.c
> >>> +++ b/drivers/video/fbdev/simplefb.c
> >>> @@ -477,9 +477,8 @@ static int simplefb_probe(struct platform_device *pdev)
> >>>     simplefb_clocks_enable(par, pdev);
> >>>     simplefb_regulators_enable(par, pdev);
> >>>
> >>> -   dev_info(&pdev->dev, "framebuffer at 0x%lx, 0x%x bytes, mapped to 0x%p\n",
> >>> -                        info->fix.smem_start, info->fix.smem_len,
> >>> -                        info->screen_base);
> >>> +   dev_info(&pdev->dev, "framebuffer at 0x%lx, 0x%x bytes\n",
> >>> +                        info->fix.smem_start, info->fix.smem_len);
> >>>     dev_info(&pdev->dev, "format=%s, mode=%dx%dx%d, linelength=%d\n",
> >>>                          params.format->name,
> >>>                          info->var.xres, info->var.yres,
> >>>
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
