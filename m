Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEFE5118B7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 16:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED57D10E9C4;
	Wed, 27 Apr 2022 14:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B5F10E9C4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 14:21:19 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id m20so3691701ejj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 07:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jBmFdo+EpPmujhmTmGtxoyUWpgyu6cfuoFJjRqtxiOA=;
 b=W5INljCWeWJF9MFkZkWUGd1SdYK4KmOXAP3cP6JmepywfWPRn73wV7xSNiKgUzJ3Qk
 hQe8hoTh3bEUEqxOtYINeazzWxSvMgnOuH9JWcnMK+bMGl8TUPh0g5V1OG3hZIxGbwvg
 uskbkMZqi9iLQHRlQlrrno+uU32lrNW69iWMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jBmFdo+EpPmujhmTmGtxoyUWpgyu6cfuoFJjRqtxiOA=;
 b=RKJfPocOrtq4ulAUDt8Oto0xBDhnFmQVmM52DIp085r9/ZKv6UPukHcVY/uNy6bvFf
 Lq46lTv5DyC/A1qHbtmJJUI828eyRBM0ur2BLN+KWzBUEOBkIKdGlacXShlPA+8sP9g1
 2ELPnY03Sr43RMLsz92caLomM/c0rRlHhApYsI58poEYU+EOMN3Pfc9SuS9yplK0cjrC
 gCBfycoj6gXFp2m8krv8cBz4IewIYqoB06W8cp6E9esNgyknwO1/cK6j+VB0jpjBQWUs
 cJPCE/lWxzLGDZ8F2BAjerFwjAxkTVejRRDDcJuFw2C5skAQf877BNQ+oROnHXJAoi5Z
 y4pw==
X-Gm-Message-State: AOAM530ZesYWnblN7OXptjLIvYaPY2zHXMOiIV/REc4EE10mtFdd4LBr
 JZ1ZHFMgHElEC1RYagNn4pJ48A==
X-Google-Smtp-Source: ABdhPJw2gZ+GIMPilmZXcEDDjYVeTh7sRJrZyOP3JMsVinZUkmshLZ7JQZ2hO83UghHV9x5ZuP9muQ==
X-Received: by 2002:a17:907:728c:b0:6e8:a052:4f03 with SMTP id
 dt12-20020a170907728c00b006e8a0524f03mr26028860ejc.344.1651069278065; 
 Wed, 27 Apr 2022 07:21:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 kx5-20020a170907774500b006e1382b8192sm7134212ejc.147.2022.04.27.07.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 07:21:17 -0700 (PDT)
Date: Wed, 27 Apr 2022 16:21:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: dim question: How to revert patches?
Message-ID: <YmlRW2fAabBqWc+0@phenom.ffwll.local>
References: <c79789fb-642d-ee9e-32a6-fc7f79d9e3b4@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c79789fb-642d-ee9e-32a6-fc7f79d9e3b4@gmx.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 10:37:55PM +0200, Helge Deller wrote:
> Hello dri-devel & dim users,

Apologies for late reply, I'm way behind on stuff.

> I committed this patch to the drm-misc-next branch:
> 
> commit d6cd978f7e6b6f6895f8d0c4ce6e5d2c8e979afe
>     video: fbdev: fbmem: fix pointer reference to null device field
> 
> then I noticed that it was fixed already in another branch which led to this error:
> 
> Merging drm-misc/drm-misc-next... dim:
> dim: FAILURE: Could not merge drm-misc/drm-misc-next
> dim: See the section "Resolving Conflicts when Rebuilding drm-tip"
> dim: in the drm-tip.rst documentation for how to handle this situation.
> 
> I fixed it by reverting that patch above with this new commit in the drm-misc-next branch:
> 
> commit cabfa2bbe617ddf0a0cc4d01f72b584dae4939ad (HEAD -> drm-misc-next, drm-misc/for-linux-next, drm-misc/drm-misc-next)
> Author: Helge Deller <deller@gmx.de>
>     Revert "video: fbdev: fbmem: fix pointer reference to null device field"
> 
> My question (as "dim" newbie):
> Was that the right solution?

The patch wasn't really broken, so revert feels a bit silly. The hint was
to look at the documentation referenced by the error message - the issue
was only in rebuilding the integration tree:

https://drm.pages.freedesktop.org/maintainer-tools/drm-tip.html#resolving-conflicts-when-rebuilding-drm-tip

This should cover you even for really rare conflict situations.

> Is there a possibility to drop those two patches from the drm-misc-next branch before it gets pushed upstream?

It's a shared tree, mistakes are forever. The only time we did a forced
push ever is when someone managed to push their local pile of hacks or
something, and we're catching those pretty well now with a server-side
test to make sure you're using dim to push.

It's also no big deal, and next time you get a conflict just resolve it
in drm-tip per the docs and it's all fine.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
