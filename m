Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B878168133
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 16:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BBF6F476;
	Fri, 21 Feb 2020 15:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB6B6F476
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 15:10:05 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e18so2502153ljn.12
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 07:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UgJkjvOBofqzJTN91u485/kE3gvS4BZKgeCaDBLSUfI=;
 b=zg2cFTkvSYhH3iJg0mI7cgODYM1lBDe1dyRchc+x9NqcY3xizjHuGO1MKGEg0t61wE
 VnI9iMmrDN0iyJAnvYvnFnHyJAUIUKtMb+f7PDhGc6s1dRnrG1ibrk6Mzm6O5H4hzccL
 dwl3z/hFZV/yktNpQnmOB5fABvjYMlVSDcVWqI0bWIGxdjcG8UceiWL7JidrTgJ6Z+Q2
 fwn3v/Wf80JiPIp5Ineq+3Y+a1/DskAy1h6qkoCqH8j1DPfBYzcw6yzBnOx3Y6foRw+O
 7JEMa6tynl/I4dtnIz/tz6PU4aRHse97Q6idWQQ1PBo/vAV78ZO54iqFDEDexn1YIsDJ
 rLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UgJkjvOBofqzJTN91u485/kE3gvS4BZKgeCaDBLSUfI=;
 b=gd1TmPEi9QK2FBztBzrwgiZEce8zNkpAK7yDylxX8xyNYy5UkfnbVQLK3lqXQ4Bfm5
 e0jv+tewXRbQ3xkWYnIKcJDOXCdG9Cl53e82llIU1Bn8VDPr6cM9FDqEg18SxGCe5YNw
 6O363i7KUxzpXWw31/LRHJ2bWzQk+d4mp9MHhhZ7CtCvpmra2A95QJUNislsPSqlOK44
 6cvKSlU6kYWR9OC9viv58GwpONbzjXhj4tQyGXlVWCSyH4aA/sH8eASKOwlF52SBYFLn
 Ra7rEQQyGtgeeue9k8cz+ZI1q3ze8ork+xVFXNoV2CClpbwLBPfRJCuimOYUdhDvS4bl
 dXdA==
X-Gm-Message-State: APjAAAXjIZDOgKBM1+QeI8kCheyli7Z/Z1HsQJYWjj12nsAsFVTDK+oW
 92nT3f1TCu+6n4zjCJU1b1BvU7bvKIqdc5CNYjov22trpHQ=
X-Google-Smtp-Source: APXvYqzN5WfPZzIh+Xq8rpV6szhZ4DkWO3mb8ce0so2gH3otsVS6y+5j+AStLHR+1W818ygs+g03T+kt5TQaTsrNXio=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr23077470ljg.223.1582297803874; 
 Fri, 21 Feb 2020 07:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Feb 2020 16:09:52 +0100
Message-ID: <CACRpkdZRTo+TzSeuADeeq_DWFvZD+Y_iNMWiZOTqtTJ1vqXv9Q@mail.gmail.com>
Subject: Re: [PATCH 00/12] drm: Put drm_display_mode on diet
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 9:35 PM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:

>  drm/exynos: Use mode->clock instead of reverse calculating it from the vrefresh
>   drm: Nuke mode->vrefresh

I'm sure this is fine.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

We need one: either clock or refresh settings, so it does make sense
to calculate one from the other.

So is the reasoning such that we mostly know the clock and the
resolutions and then calculate vrefresh? (It makes sense to me in
a way.)

What I am worried about here is that some of these (especially panels)
are probably already out of sync so we need to ascertain that the clock
is correct-ish everywhere, so let's be prepared for some regressions.

For command-mode DSI panels the vrefresh can become quite
weird I think, the vrefresh is different from what you can reverse
calculate (I know this from experiments) but I doubt we care
much.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
