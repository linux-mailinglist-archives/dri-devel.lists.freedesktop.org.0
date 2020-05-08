Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA881CA871
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 12:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DE36E175;
	Fri,  8 May 2020 10:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DA56E175
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 10:37:44 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id j127so287354vke.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NA9me29/TJs79X1Lqi355HvolxRtfq7AU5ESlbnuUUc=;
 b=PJ8C6AB3ttAUXPB/AmL1O/j9WoX2ImOrVWYzWM68geZrq8QPI2/8+fIurlzmzdf3nq
 RTWEk477QcQ/onDeuI9ap53vOnSPGz9IbMqa3tMlAQnL3/ZB5iowZzWI5uz3jU+pcyNi
 6+00ALVnhCIdYvK5bhQNgYuhg7TJRFGQgdz1OwMDdgiT8ASds2BzRejKGAs/JYN/7P86
 51IHhvEzl8Vp8nD4jVzAdTXojFHwCZZsqYExrtndjGbMzoZP+ez2dK4AcprkOtuzLZRc
 lqndEHw0uxxW5BnjQlcKS7aDkUD+DAL6n8RZBWdF3MP/lBlSDw3ALOC/aogqd69D35Nd
 Bikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NA9me29/TJs79X1Lqi355HvolxRtfq7AU5ESlbnuUUc=;
 b=G+ClIivhykpjh/xNcoXopaATanD1JLs7SQAtwGzjFp7jxuynKu5nhsuj16bzy6w8Jw
 ZPj+OcfSNFdbg8WU4VIA3E8JyQtT+wYCiwTEoLH1K7UB+C7bajE2hhSDbJ0cMPJTh3rf
 JAnrcrn+SvGyV5PSP+7w3xw3ePpmmXi1ITYN6BOS6Pq7Gtyd087dZEv28c546t/QkEKw
 eF8k3e4mpvLuv0Ae8W0d/lNafFwhJv/B4b1/q25ZcW9AE069zgAqUocwn0gK1UhTufuN
 yjBHsBzby1sfNy9nJ8aNBqf9A96/S7TunP94YuI9w0wo+BRxuPpRT7hNSOf93mde9doJ
 9CXw==
X-Gm-Message-State: AGi0Pua9EjDxc3Y1o5wx3+hh5PTN7r+zf9upcFEZuJhY1qNExD4QPitU
 CWXqVl3Pdmx/+wyovGJHFwcjX8ma1+L7+yoMEKYYnw==
X-Google-Smtp-Source: APiQypL8JmcPOo542VGYsfUn4sIO/g2uEeundAcVq6Tiw29XjkxYj5gNEa5+W9A8zCEEvwnQBkxRnd6IPDTasa0z7y8=
X-Received: by 2002:a1f:9b4f:: with SMTP id d76mr1123861vke.51.1588934263311; 
 Fri, 08 May 2020 03:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507181726.GE13247@ravnborg.org>
In-Reply-To: <20200507181726.GE13247@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 8 May 2020 11:35:12 +0100
Message-ID: <CACvgo50Wn4mgFAPkhvAvvRz8TAqHKSNk1+brXU8WcVcvCj_57w@mail.gmail.com>
Subject: Re: [PATCH 00/36] drm: Fareless gem_free_object
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 May 2020 at 19:17, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Emil.
> On Thu, May 07, 2020 at 04:07:46PM +0100, Emil Velikov wrote:
> > Hi all,
> >
> > Recently I had a look at the new dmabuf AMDGPU implementation.
> >
> > Seemingly it was using the wrong drm_gem_object_put API. Namely the
> > locked one, even though the driver is struct_mutex free.
> >
> > Upon checking with the documentation, I've noticed it's a bit misleading
> > so I've went ahead and:
> >
> >  - tweaked the drm_gem_object_put/struct_mutex references in the docs
> >  - fixed up the AMDGPU caller
> >  - removed the gem_free_object driver hook - \o/
> >  - fold drm_gem_object_put_unlocked and __drm_gem_object_put
> >  - drm_gem_object_put - add _locked suffix
> >  - drm_gem_object_put_unlocked - remove _unlocked suffix
> >
> > Although the rename patches are a handful, it does make sense to have a
> > consistent and obviously named API.
> >
> > Input and reviews are highly appreciated.
> All patches I did not comment are:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
Thanks Sam.

> I see why you introduced _unlocked, and remove it again.
> So you could ask the compiler to help you.
>
> But I see this as something that should not be committed and only
> part of your own tree.
> But thats not something I feel too strong about - let's just say it
> confused me a lttle.
>
I believe the confusion should be addressed now.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
