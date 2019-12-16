Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C05DB12024C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 11:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95A86E484;
	Mon, 16 Dec 2019 10:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A21F6E484
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:26:24 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j6so6210866lja.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 02:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OkpVHHKfDIvE++qC7pqWmg/jiaUV0l9IrypFklbrI6o=;
 b=lDL84PL+2Ns4vFAqwLLrdQi1O+3TQ6U/1dl28aR2f5iPN84nonscwhbbksUFjIlS5R
 otbTznmgxLMJaAner5nrpGth72IVvBmT/6uaM4tx+Y+mEEawgORon/elo6UPVH5JvJYb
 Ck2/MV674z0jbmRgEZH0vAlKytoZnH/ItSxaGXx0K213YovI7A4yEtfAGr8qVFC8qILi
 94ezCXOUyfvLoV8f/yzdmpj1qIfvNUfwHHlA4TO3fmxjmrNVgk41krWYbwyb3SMyU9cr
 Nn8qkvnhE3ahvqrWYa02Vf4Ret+ZHDC4hZD4vr81kUyvgcplB6Y5bMnP2WfkMtddC/uN
 iXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OkpVHHKfDIvE++qC7pqWmg/jiaUV0l9IrypFklbrI6o=;
 b=LWmdkwMphAI65XGlIkxF3MPsO8L0s8JHDPLUq9rigPorDQ7gLYqzwmO3u4nCRupAsJ
 Ks+3l8GYH1CBg70inpMYtY1ZZIG51pnbYj58eqs/P92fe+4liCXi3nO5sRNBB+q4I5mS
 Eeq5ZkLB4nA9h37pLrOQvPvMkOlALGrjmSwH+SLfIYS1Db2KKJ00p7WE82zKb5eNJfgQ
 9hoUW4+nz86rBjqlW4Q2OrLBfvt3fJEvL1tcclEL3Tju/r7OpGH7iB5z937HClGYR8hy
 ftpw0qRDcDVEYCD+5AIgIL8o5FaIcX9XTGqT4eF49nf15XJm66k4Ri1YJMElot7pY8Zk
 Z+Ww==
X-Gm-Message-State: APjAAAUNxG3Dw01m0kbUEeAZzgsxJtsmMa9YUayhurQMS6rgJsuEY80l
 hq2qeExYyYEo4KKG5ITPCdxaYbebVtrRSN1N3icioQ==
X-Google-Smtp-Source: APXvYqyfCsSztFtNTTzlCe+aXkIxE7g02n2kJDD5isrSGVNYwnEfbfi911iDlZCap4HI8gvXspWAPVC8NvrEdEvcY0s=
X-Received: by 2002:a05:651c:1049:: with SMTP id
 x9mr18582325ljm.233.1576491982626; 
 Mon, 16 Dec 2019 02:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20191215163810.52356-1-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-1-hdegoede@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Dec 2019 11:26:10 +0100
Message-ID: <CACRpkdarJ5chDfgc5F=ntzG1pw7kchtzp0Upp+OH9CH6WLnvXw@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs from VBT
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 15, 2019 at 5:38 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Linus, this series starts with the already discussed pinctrl change to
> export the function to unregister a pinctrl-map. We can either merge this
> through drm-intel, or you could pick it up and then provide an immutable
> branch with it for merging into drm-intel-next. Which option do you prefer?

I have created an immutable branch with these changes and pulled it
to my "devel" branch for v5.6:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-pinctrl-unreg-mappings

Please pull this in and put the other patches on top of that.

I had a bit of mess in my subsystems last kernel cycle so I
want to avoid that by strictly including all larger commits
in my trees.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
