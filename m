Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBFE25E1B0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 21:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C971F6ECB2;
	Fri,  4 Sep 2020 19:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA5A6ECB2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 19:02:37 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b12so4387271lfp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7uUg6PoEyw6gZZ+b9cvN8OnBYQP4dXfhi5vW5L71sp4=;
 b=Bp9dBLRImFEFuBOvL8cmF4FJjs9ZKdU3TSSCwzYTyefntJCy1jPMS/1pik6rxe7p13
 AYSgb1uqemGd/+2bP3mpNLhOSvzhMS9Gw1K93F0ARpKI4mmCOxXinmdaZi8GFib9Uvil
 MWJ2XoxqXmHYrFtnySgiFspI3EtB5FQL+gY+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7uUg6PoEyw6gZZ+b9cvN8OnBYQP4dXfhi5vW5L71sp4=;
 b=Ho2pa4ql2syzbYMQCKrsEp1r/3IpzY8Y3qEFloy8xOU9nniIwdGlJpsJK3eZriS1lz
 PfGPcHTkgKKloFzJp7RnvdeFj+AI8jONKzBFFOjnGD0jkkvoJcf/4qSpxsa9ZToFXBxz
 sF/rqO76Rv81BxgF75gTXTMFTMh0Kk/CoIThOt7PN0KpRMqjE0Hr4W8icPktcSHalzxJ
 4z0/i4D/zs93l2/1/HS/3hQq+RNotETNc3SEeFs5NyWfV50Jw1qEMKSaegO879Y7XBMo
 MDm9LRQoBEge0GQIqnHPvRGr69nerYQXDtgs58ahqExkDM7bUvfZ1tkUlAOR/H7pR47z
 kCHA==
X-Gm-Message-State: AOAM532TrvcS3JNZgLo4QGw6HL2KAtXbDwRWbysNf9Bt3p+VDWQq5mpd
 dPPLXAlq6sXBajtKAELeoIxGQlfaviHBzQ==
X-Google-Smtp-Source: ABdhPJzyrgVoc2K/VosJjcQBvVrOlvBLOzsQJEiLAaTTKgLPpMbw8JVZ8ZmcskyPdg+NampKjSV9Mw==
X-Received: by 2002:a05:6512:1142:: with SMTP id
 m2mr4526120lfg.22.1599246154752; 
 Fri, 04 Sep 2020 12:02:34 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id e17sm384186ljn.18.2020.09.04.12.02.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2020 12:02:33 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id a22so2807154ljp.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 12:02:33 -0700 (PDT)
X-Received: by 2002:a05:651c:32e:: with SMTP id
 b14mr2189883ljp.314.1599246152917; 
 Fri, 04 Sep 2020 12:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tz0whDeamM+k_8Wu8TVzz0TDr+qMNMXo8rKeeNRKxBuiQ@mail.gmail.com>
In-Reply-To: <CAPM=9tz0whDeamM+k_8Wu8TVzz0TDr+qMNMXo8rKeeNRKxBuiQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Sep 2020 12:02:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh2EH9DKRpJQ7+X+NWjjduLPy_Ncv1GzxnXBg-3mTn0Fw@mail.gmail.com>
Message-ID: <CAHk-=wh2EH9DKRpJQ7+X+NWjjduLPy_Ncv1GzxnXBg-3mTn0Fw@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.9-rc4
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 3, 2020 at 8:53 PM Dave Airlie <airlied@gmail.com> wrote:
>
> Not much going on this week, nouveau has a display hw bug workaround,
> amdgpu has some PM fixes and CIK regression fixes, one single radeon
> PLL fix, and a couple of i915 display fixes.

Any movement on the i915 relocation issue? I've only seen the one
report for the 64-bit case, but clearly there was more going on than
just the missing page table flush on 32-bit..

              Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
