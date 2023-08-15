Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33AD77D354
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 21:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4868C10E27B;
	Tue, 15 Aug 2023 19:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD8810E27B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 19:23:43 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b9e6cc93c6so87847991fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 12:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692127422; x=1692732222;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qaFxc7NLdnRLFGC9mlhpM8Q09n9sYqbBf799fEemgfw=;
 b=TQ21jZyTGF3bfMGXahLoN4HPtf2jI0G0qRbhilG9PHiO7OiF3viTLSdLr8ftgVW2MJ
 t/n2cjVspxR/8irwI7IlFbd6Uz7LHi9Jg2/8yEW2dI8ahXpOgxzvvwLFm8s7DiZOtODy
 b6gCmq7bfnW8qjx3IwQfBDhg2BPtk1nuT6sUFCwbJ4WsFL4V8p2lbF7K7ZtV3F3SxPSN
 6pBvh0Xdf02XPh993XjEty6Nt9rGfLcTjiHKZ4wso3ztCAoO356imeB2k89ew+cS8F/h
 bm7axHDRBMrKR6de5WQphoD+otQM27z+Ue9qY3UlFB/ZHbQ4/npLLN0KnzuGcH4+DS0I
 P2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692127422; x=1692732222;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qaFxc7NLdnRLFGC9mlhpM8Q09n9sYqbBf799fEemgfw=;
 b=kN7+K9R06Ue3dQUWShhM9422S8P8rHgwzdup1TAECDhsPGz9ZJ9QZsX7bHVTtG7zw4
 Ayj9hGcwSI8oQ1rQLW+qgyHfVD4VSjdbJ50QJqzjKcaCohOuUIbk6HPixgiCYTxnfs1i
 zB27gh5IuK2ICtKAFYfhNfg+p40NGAmDA0mA7JIt55Zf7Jt0cobbbm50kjWLxSD8IEZE
 FsslSuXmD0AYbXLfv1db3fj8Ow0DgjTFT3/K7rwoZaqgUayJ+3Vk3YzRLrdbluXso9sp
 ahoH3WNYky3DfFt3kls0E+WrH0Tjiy1pKxH+c3b1EVnKQVQgwYGUxbUErPvr5KKomYCp
 /Z/w==
X-Gm-Message-State: AOJu0YxQH+XDZcPvpj6u6EYfYVDJWmaHNk+pCTxeOMO5Fmzq/1KEJZEM
 E/v++EYZsGqukxaDQADZ1WVk/CUYXQr+Ls9eb1pxzja0QRI=
X-Google-Smtp-Source: AGHT+IHJLA26STk/hwBrtqzVAv06LFh2j1m+MsPIDzZXybnuQC5Pb5RCUUJwpAsqa9+P2xMq87XKKRMURzO/wBgCQmw=
X-Received: by 2002:a05:651c:14a:b0:2b9:d3b6:769e with SMTP id
 c10-20020a05651c014a00b002b9d3b6769emr9194707ljd.24.1692127421409; Tue, 15
 Aug 2023 12:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <389b-64db6700-1-3dc04b80@31442286>
 <b278375f-4644-2db6-9a14-9088470d528c@suse.de>
 <CAKMK7uF1hv3S--=jsmFWG_tkOKavgMBOkWQt6VOSV0d1U7C0VA@mail.gmail.com>
 <1b9ea227-b068-9d91-1036-28a4161b1744@suse.de>
 <CAF6AEGsr+2xaCeExm9wPmK=nU+jxevLcd8RDWTSFrwKR-yCvZg@mail.gmail.com>
In-Reply-To: <CAF6AEGsr+2xaCeExm9wPmK=nU+jxevLcd8RDWTSFrwKR-yCvZg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 16 Aug 2023 05:23:29 +1000
Message-ID: <CAPM=9tx16UoYoOw4hBChVNPcj57ox1XsybPPTGZn=r2DDQBJmw@mail.gmail.com>
Subject: Re: [PULL for v6.6] drm-misc-next
To: Rob Clark <robdclark@gmail.com>
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
Cc: emma@anholt.net, daniels@collabora.com, robdclark@google.com,
 david.heidelberg@collabora.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, robclark@freedesktop.org,
 gustavo.padovan@collabora.com,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>, anholt@google.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > Otherwise, there should be something like a drm-ci tree, from which you
> > can fetch the changes directly.
>
> I asked for a pull request so that I could also merge it to msm-next
> so that I can do CI this cycle.  (Unlike the earlier out-of-tree
> version of the drm/ci yml, this version needs to be in the branch that
> CI runs on, so I can't use the workaround that I had in previous
> cycles.)
>
> Perhaps it should be a pull request targeting drm-next instead of drm-misc-next.
>
> We were going to do this one-off for this cycle and then evaluate
> going forward whether a drm-ci-next tree is needed.  But perhaps it is
> a good idea.


I'm still not 100% sure how this is going down, and I'm meant to be off today,

Don't send this as patches to drm-misc-next, but I think we'd want
this in drm-next for a cycle before sending it to Linus, but maybe
it's not directly interfering with the kernel so it's fine

Ideally when the real merge window opens and drm-next is merged I'd
want to have a branch + PR written for this against drm-next that I
can send to Linus separately and see how it goes.

Dave.
