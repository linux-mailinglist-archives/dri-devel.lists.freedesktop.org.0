Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B0C2B3808
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 19:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2746E9AA;
	Sun, 15 Nov 2020 18:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34716E9AA
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 18:51:39 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s9so17322041ljo.11
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 10:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LYiXRQ+1WeTZOpU+DvI/FDTjWLYT9LQvFQVRDuroK+4=;
 b=qnq9nImmT9X78fDcZ4Fzke1Q9XZA0Qbyhwqw2/Kjy5+qa1wWeryzZ9ZPKFsn8T6Bje
 TEAs/kLF72yKuOu8svzwIhOunuLYjxiyqxIX+jFvDPzanNR9hx2sUnkc9vfChWx7Bho4
 QKOBFZf4EHK5gOIULxD2F78urzB7mn+DKrYo7KHXUkXyB3zCkrFMnDgtUeqizxI5wDO/
 VGQ27zdqLAqtlr3sE7M5BMh8e6dqmvCKdm2BXxjoAAAwz6Q99fXPJ8/n5bmfcrRVUa/C
 3dVkkOmmqgQuC1LMcDD5PodcOTSse4fDMjQ6+O7fkpypVer0h4fwX4i0WF7xmQRbwidS
 AmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LYiXRQ+1WeTZOpU+DvI/FDTjWLYT9LQvFQVRDuroK+4=;
 b=Syn7jW+7Xy1pr/OJMTJ/iuy8wYFSxuSJ6nsMenWYromKU6+KuA3LD1esdgD1xKP1Hs
 DKhY8ZaC34R8jHBLFcP2g3sRmQduIvLFrfns5rHeIXk6ISW3lc+EruaQ47a/Kkd8wTD3
 B4sQUACa6FPAsCLrNjTTUZ/lvo1T60Wap+JtrHYe13sMGrZ7sQAOUAXDux7Z4HCZb/rw
 hwAmK7XFF9Gq9iiRDYc5zLbHvkrWoq/BgslgnCdD4GDCHX93ZnUyfjQg0iiv3zhbQERH
 iAxGfIBjE/azwiURk0CbwTgWcRmd115CJqSE5pQHnzzzML8Ylfnkx6l1Rl3Cxlb2S5p3
 1IOQ==
X-Gm-Message-State: AOAM530uqUutqKH4BHW3VhxCEUxKdwNhXj9GbkNpUFAcyqzRfRMJjogs
 XEP2z5Lgmk5RvTC07VFsc7O4uUAxfbtK/EgXypXOtsyzDqU=
X-Google-Smtp-Source: ABdhPJyKxQq6Dx2waSopbvu3p/m3mpH5HnxKaUNaXzNaxH0bAqsE20jT2ntQEZ0veaLPQQcU1IcnBhLMQMtJEghjsdE=
X-Received: by 2002:a2e:9f55:: with SMTP id v21mr4616423ljk.423.1605466298294; 
 Sun, 15 Nov 2020 10:51:38 -0800 (PST)
MIME-Version: 1.0
References: <20201115175420.32167-1-patrik.r.jakobsson@gmail.com>
 <20201115183255.GA4011888@ravnborg.org>
In-Reply-To: <20201115183255.GA4011888@ravnborg.org>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sun, 15 Nov 2020 19:51:27 +0100
Message-ID: <CAMeQTsZHRgexWdHpHHFy9kDdHRvoM74UFRV6iC=NTcw8pQAMmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Remove 2D accel code
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 15, 2020 at 7:32 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Patrik.
> On Sun, Nov 15, 2020 at 06:54:20PM +0100, Patrik Jakobsson wrote:
> > 2D acceleration is only available on PSB and MRST and very slow on both
> > platforms. CPU acceleration is faster so don't bother with 2D accel
> > anymore.
> >
> > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>
> I like the patch and it follows up on the discussions to
> remove accellerations that is not really a benefit.
> But I tried to apply it on top of drm-misc-next and it failed in
> framebuffer.c - did you remove psbfb_roll_ops in another patch?

Hi Sam,
Right, sorry I should have mentioned that it sits on top of
https://patchwork.freedesktop.org/series/83153/

-Patrik
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
