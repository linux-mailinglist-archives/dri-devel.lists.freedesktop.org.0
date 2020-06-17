Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 074281FD533
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 21:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077E56E156;
	Wed, 17 Jun 2020 19:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFAE6E143;
 Wed, 17 Jun 2020 19:09:56 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id e1so845583vkd.1;
 Wed, 17 Jun 2020 12:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eD4bw0lGQCfL/fgr6hV02m8eAYxz9GB1Zd0qbxDAQJ4=;
 b=XRBe8Rr7OkveXmecDtX/Xwx/BpU5lBwhhcVbrpoalnm1bZ7zPj/mDE+sO9H1fjKm8S
 0WK8Do11W4GOm/hBgpzdfMZkg1HQDYaNifUIEMvH0faExmBNgq9NVV5Vp3yaYGOig8j6
 jvk4u1TeWqnEfqYKYEDLa09ph/KY4QVwdS33iJ0FUQZVnPEKW7vK1LLrwALdWnXjojAx
 4AdUKLFEhhGVjdUxP7Snk/1AGy3g36NJSZK698jDayOsui7sEmAyQ3Z28PN54+hO0JK0
 m6kr8SBA105mxFS2VHnpdRD5nkwMcWCliyVXfhjOY0hltcf+TkKCke2/dgGoamf7fbcb
 AXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eD4bw0lGQCfL/fgr6hV02m8eAYxz9GB1Zd0qbxDAQJ4=;
 b=MEuWj/Dc+H+zOPRBrgdv37ZgHeWeE/8L+lLZzjFQ7eZ3Li41wXfnWqy33KPGrllpGF
 qFfznuU+qnu3RH8gh7qPYqInuYEzurOXcsiGKsYcWlu02pJdmHSW9vev8I8VHigfWaL9
 8C2LWSVIfkVPHypPxMtRzDdpdsnqJDNLIZfLT+1JvaQIf2CzVbiz6/FArbxbOhJxLHqx
 uoLVwWflzfmEQGy8fpG4bzvtghAGD4zuHwXDpjCh3OvtxmDn+ViJss0ndDaXrpWURoIV
 +sxeiXf6/OHB0ePIk58VSdkI/IGcp4ZY/sNMSbyCc1tPn/+IryWxSoD9RiP8tAXJtBAk
 vZZg==
X-Gm-Message-State: AOAM533O/mYx7vEiyXDAwbZ0hNEzqjJawg/c2IRYhfp0R4wxHw0ZNDR8
 RcKuiTdW8iBgBPSpCZU3twosA3hKVjR1FopDV+s=
X-Google-Smtp-Source: ABdhPJwtoKeRVXvgQWYI0FGFEFUVIAQMF4l4PZuS7D/IV4AQqwOs6rxLY7l/5BGZ9tRfwoRr4V6z3VuB3DyHbXX5n8I=
X-Received: by 2002:a1f:ee81:: with SMTP id m123mr762899vkh.51.1592420995496; 
 Wed, 17 Jun 2020 12:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200617105929.534edd34@canb.auug.org.au>
 <c82b9c52-d4e6-9eef-e37d-0a26ee9f1183@suse.de>
 <20200617170307.3c87be5a@canb.auug.org.au>
In-Reply-To: <20200617170307.3c87be5a@canb.auug.org.au>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 17 Jun 2020 20:06:11 +0100
Message-ID: <CACvgo50Ke-7pGqpwEb8y0iYOKv7wep1qUMm8_KJvUp0fV-YHoQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On Wed, 17 Jun 2020 at 08:03, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Thomas,
>
> On Wed, 17 Jun 2020 08:33:24 +0200 Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > We recently dropped the _unlock() suffix from drm_gem_object_put(). This
> > patch should be ok.
>
> Yes, but what it shows is that the drm-misc tree is still based on
> v5.7-rc1 and v5.8-rc1 has about 16000 more commits for you to get
> conflicts against :-)
>
Being the culprit here - thanks for the patience and report.

I believe that both AMD and drm-misc teams are aware of this lovely
situation I've put them in.
As you mentioned drm-misc is a bit special and doing the usual
backmerge will be fun.

If you have any tips on how to minimise such issues, I'd gladly utilise them.

Thanks again,
-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
