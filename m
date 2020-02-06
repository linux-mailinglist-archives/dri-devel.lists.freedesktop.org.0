Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4580155C67
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6665A6EAEB;
	Fri,  7 Feb 2020 17:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305936E530;
 Thu,  6 Feb 2020 14:51:56 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id n21so6574940ioo.10;
 Thu, 06 Feb 2020 06:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TqCXQKOBDXFQJVKGddlbc8pIiQ4q9FZiH/HTbC2xQy4=;
 b=Ew8kBRM3/hL/4Kf0D2cwaTyLQ6Ds0xowkyP1rL4Mhrj2e8N3BvOyoJpmVJRJuDzbxE
 s+hwyF6pkxXoHwciWNdtQEFg1Zt6H4WfNMD4RB/uxNxeFhiufi7/2w1e7V0qqw3p0xex
 mU0w7qRdmzggpIIt9oPTIhmRIoobsnW6ubrnRSZQm4kKc3dNcSUdKfT5634rn5Nj4iMr
 aD/4ESSeySiZl6MAyZEGer5u6rpziqyIDXkamz3sYoJB0FYdmeMv196F+IKFFWGFkWm1
 ALPxipRfzvs+MoPHrnnLO2hry7+sVUdWldEZ1kjYadAWKbvVNhV/XGtjkB0mMCWp8ENA
 jVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TqCXQKOBDXFQJVKGddlbc8pIiQ4q9FZiH/HTbC2xQy4=;
 b=Ba3B7OIYnMmD4JY1bAma9hgnHnBXmpwLyf3EFO0jyPOPI53eYR/QwWMNuZonD6gJnh
 JjPIJSzPI/+ltfIfsDJyZqJZtdOS8cUSGG+AFxIuXhx9gIscdIPP60ic7038wGpjIz99
 CkLKGsLLnWkIDRoOAMI5iTGY+TO/hwepVj2oAY4R6PrOMoaLIktQ+WY0ZykpftmzBW8P
 TMmRFfZugTxyZkCrATKx/cZu1BVfsyrn05xe2g+xX87nTMX9rQlIQ0vnzTV6+NtIp2fQ
 hJWgYj7md5tRdVwKakvWX8Knuwny5gU36yXM3WEFwXmfgXEHJyOr4waRMyQV82HE2jW4
 Rzig==
X-Gm-Message-State: APjAAAV00BoIJ2M3j7Np7EYtODgyus/S20R1ucq+aQAFHkwuLLzEzj7H
 Hw8N0KgvBhUKU005Hsf3laz5lCm7XlgAXUVMQN4=
X-Google-Smtp-Source: APXvYqwZYxfalpMvjr4USAwpdtFeqzts07iNxgJWdvTv/0SPzfTizDCBhbfM18KUA+AWxFcUyEZ7fepmukSqkbODuyE=
X-Received: by 2002:a02:a50f:: with SMTP id e15mr35226468jam.48.1581000715561; 
 Thu, 06 Feb 2020 06:51:55 -0800 (PST)
MIME-Version: 1.0
References: <1580979114-16447-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1580979114-16447-1-git-send-email-harigovi@codeaurora.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 6 Feb 2020 07:51:44 -0700
Message-ID: <CAOCk7NqEaJsbTwWgieXbGNN-eGFH3X0i=umMpLaLrPcB4GQzEw@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dsi: save pll state before dsi host is
 powered off
To: Harigovindan P <harigovi@codeaurora.org>
X-Mailman-Approved-At: Fri, 07 Feb 2020 17:01:42 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 6, 2020 at 1:52 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Save pll state before dsi host is powered off. Without this change
> some register values gets resetted.

The phy driver already does this.  Why is the current implementation
insufficient?

>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v1:
>         - Saving pll state before dsi host is powered off.
>         - Removed calling of save state in post_disable since everything
>         would be resetted and it would save only resetted values.

Removed from post_disable?  Thats not what I see in the change since
you are adding code to dsi_mgr_bridge_post_disable()
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
