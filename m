Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D42B7F0494
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 07:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761F910E195;
	Sun, 19 Nov 2023 06:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3BF10E0CC;
 Sun, 19 Nov 2023 06:47:15 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9d242846194so453887966b.1; 
 Sat, 18 Nov 2023 22:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700376433; x=1700981233; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sWWstq9VEzb+u3ForlZQdBiFb99f3/DYp4agyqbW5EU=;
 b=J3gnRNph7yqECKtC2SUWygsJvT5+UD9C4dPZps1w1F92+29qkQnG2a+mkuLe9rLfrN
 pdc3HFh98IlfwtmefKSvKmmraIfBcRRMfDN8reOqk2I91Zu4uJTkqWCfD//CJZx/nbqi
 AhXkptdjGI2GNMl8yffJsioLm2KbXkLN7QbOhgqnEKH5s07dvCFaO0s8xp9M/7xz6Qfd
 F/JjeO9dH2NXvkidckrjICchcadWOKCZl6py+Yt8Pp7JBeQiexlthMoaBcmWmVFuazNs
 d7zzUXMCXTCIeqlyBHXt3Km/dPEEJsEXIsQLAwyurjJXinuSKLkEHIpYqh3vB61N9T5I
 k22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700376433; x=1700981233;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sWWstq9VEzb+u3ForlZQdBiFb99f3/DYp4agyqbW5EU=;
 b=mO96eFvhHC5Zocm04J50m8xnPYtfBEp1U+FfSrkDo9F1waS/iZey9W6ZBrpk5Elgtn
 LceB0ZjfJCNeNcN5RKqH4uicSeCqWOgSJD59OhIrdY6GGRbSFUBGCz/YwGT8N+LOR5sN
 RlaSUxgXgjR5TCLaUYxQE1pdZBW02BdRZEb70VsAt0ErEBntgYRTZOFO2DqmRtYL8Gv9
 Ytfz9jj4mn072vA3G4F4oTWsWMx7VD2VShGcksX4qvMEXlAShV67P8WBWmYOgCBc2DdT
 +0OkQpBbtKAGxl7kC6ccoubSkfpaT/xL+dnQ/mQ1QIwOBXOoHA06UWSHrNBXz8GC5WeY
 Nu+A==
X-Gm-Message-State: AOJu0YwM+A5ZMaXr/LRn+xTaBmwCULXXUkr6UO8s9iSpPrS2TBkGf5jD
 CKQFFpDX9IAkiqNiwOSkFrDmEidR2yx9zLNtOJQ=
X-Google-Smtp-Source: AGHT+IFLNYwN5aPDqVp9nauy22AjSvZ5hVHdqJZuBwEFqmr6KS+jP04ZULl0PxzMF602oe1DOWARDCaSrSEte4v5yec=
X-Received: by 2002:a17:907:7283:b0:9f7:b6c2:cd3b with SMTP id
 dt3-20020a170907728300b009f7b6c2cd3bmr2888671ejc.5.1700376433186; Sat, 18 Nov
 2023 22:47:13 -0800 (PST)
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
In-Reply-To: <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
From: Dave Airlie <airlied@gmail.com>
Date: Sun, 19 Nov 2023 16:47:01 +1000
Message-ID: <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Linux regressions mailing list <regressions@lists.linux.dev>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Phillip Susi <phill@thesusis.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> On 12.11.23 01:46, Phillip Susi wrote:
> > I had been testing some things on a post 6.6-rc5 kernel for a week or
> > two and then when I pulled to a post 6.6 release kernel, I found that
> > system suspend was broken.  It seems that the radeon driver failed to
> > suspend, leaving the display dead, the wayland display server hung, and
> > the system still running.  I have been trying to bisect it for the last
> > few days and have only been able to narrow it down to the following 3
> > commits:
> >
> > There are only 'skip'ped commits left to test.
> > The first bad commit could be any of:
> > 56e449603f0ac580700621a356d35d5716a62ce5
> > c07bf1636f0005f9eb7956404490672286ea59d3
> > b70438004a14f4d0f9890b3297cd66248728546c
> > We cannot bisect more!
>
> Hmm, not a single reply from the amdgpu folks. Wondering how we can
> encourage them to look into this.
>
> Phillip, reporting issues by mail should still work, but you might have
> more luck here, as that's where the amdgpu afaics prefer to track bugs:
> https://gitlab.freedesktop.org/drm/amd/-/issues
>
> When you file an issue there, please mention it here.
>
> Furthermore it might help if you could verify if 6.7-rc1 (or rc2, which
> comes out later today) or 6.6.2-rc1 improve things.

It would also be good to test if reverting any of these is possible or not.

File the gitlab issue and we should poke amd a but more to take a look.

Dave.
