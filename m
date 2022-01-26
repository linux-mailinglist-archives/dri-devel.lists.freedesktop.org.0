Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C2449D56F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 23:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F6F10E342;
	Wed, 26 Jan 2022 22:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5BA10E342
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 22:31:14 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 s6-20020a0568301e0600b0059ea5472c98so710583otr.11
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 14:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cspukaFlNuPpy4+8Cpeu4TXQ6/rweaZWRIglmARlXtI=;
 b=HKCNnx+jGJJkADStNKMs4G9pgWeOHv9cJloYZfNPZggjJ50vn6T4vNRKuHrgq1/Npu
 IjUM1bKfceM0gOV10gxAzfz16RUhXSTB4OmNMI3psbedk66R8L9slNMWIi5sdTZ/DKzC
 WPOX46tSKJx4Zh5CMaSt5jaynDyQl4p76rTrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cspukaFlNuPpy4+8Cpeu4TXQ6/rweaZWRIglmARlXtI=;
 b=nR6ZG4/DbEc1GC3/TYLzpBCQKHLeHgsobvhtIXPDoyuAo8PUl/Ze/18Jb5C9ZSpJbU
 hZWPPHFwzBiawJJ5kKF8xdARR3fQx54Cqf2RgcblhDlPXRikA3BEXIX2D/2sLm+mZ2E/
 fs97Clny0LIn4nUf8BmDEuHxVLTK3vZxWXXiShrMrHNSE5QDg/CzQgslmhqG/D8QuzdQ
 SHAmlJOCx7gqMqgECavzxNjWFzFxYxHmORWvuMMvDR/CPuC8SvJcNRyb6jI2kBmuyjR1
 +xP7FClg3h3LQ5VtByD6NB53gaEWGKYjqL1CKPIUnhCVqZgtqELTzmuO7RfMEQyJ0zYc
 /tVQ==
X-Gm-Message-State: AOAM530mFBt8Bcs48ns+Ty8nXN3KbS93qnGWoK+ksLAms6Lq7ronRS/C
 65VrtOATGx8n66gMNvLfjjLlehdAHkMxzMkfZU3e9g==
X-Google-Smtp-Source: ABdhPJwFd4e23GnR4SX0gCqw43jALR8CbpTM+5jsdmpC+ksI6IzORmC0SPijyruIE5/dthHYq1aiZgd2e6JbzaOqHxg=
X-Received: by 2002:a05:6830:2b25:: with SMTP id
 l37mr533241otv.323.1643236273720; 
 Wed, 26 Jan 2022 14:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <YfFMSkhbvHaR0YNE@smile.fi.intel.com>
 <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
 <YfFWmmJFtEB93jUi@smile.fi.intel.com>
 <3430838d-1c63-da49-b774-c5a883e7085f@redhat.com>
 <YfFZkgE3wfPXLpYA@kroah.com> <20220126144524.GB1951@kadam>
In-Reply-To: <20220126144524.GB1951@kadam>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Jan 2022 23:31:02 +0100
Message-ID: <CAKMK7uGEFW4nd+W6PiT=uwSPz=pA6HKZXj6ePcdsAGiMDb3BxA@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Dmitry Vyukov <dvyukov@google.com>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dOn Wed, Jan 26, 2022 at 3:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The other advantage of staging is the I don't think syzbot enables it.
> I guess it's easier to persuade Dmitry to ignore STAGING than it was to
> get him to disable FBDEV.  :P
>
> The memory corruption in fbdev was a real headache for everyone because
> the stack traces ended up all over the kernel.

Uh Dmitry disabled all of FBDEV? That's a bit too much, since there's
still a lot of distros shipping things. I don't recommend enabling
neither fbdev nor fbcon and some hardening checks look for these
(forgot which one). But if syzbot stops checking fbcon and fbdev stuff
on top of drm drivers (where most of the problems should be gone
because you can't change the resolution through the current fbdev
emulation) then that essentially means fbdev really needs to be
disabled in distros asap.

Disabling the entire pile of hw drivers makes sense, because that's
pretty hopeless imo.

Adding Dmitry to confirm.

-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
