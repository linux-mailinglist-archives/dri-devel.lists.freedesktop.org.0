Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4621E63C0
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 16:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350FA6E57A;
	Thu, 28 May 2020 14:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7076E57A;
 Thu, 28 May 2020 14:23:40 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id q10so1711815vka.4;
 Thu, 28 May 2020 07:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nAhpW8QVwc8Ujj2mNc6bcOrAMpvU9W7GbhsBz4Gzvhw=;
 b=o3OYUV2awTE4zaM6eQ6bGpJ9AGpzEvPoy9X3gdRbiu7Q36SOGJVd11n+wELJP0hCrR
 WKk9l6hXMmjDNfO9QzC5/c4ODLT9JVGmj4YyBP5/+7+ZBvi3UVmYd+B6nizWOZHJr37D
 jtWn0cou3Zdwivsrm7ay4khwct9PYa58jkItIwF8hp6ihZECq3prZ6AWxwrA8x18dIEw
 jFbPOYK20MSh3RtinlBn79QSefAXGW26irS/9MraqWDo0Ydy+yWqRfwjLnskK1/J614f
 Td65oeqyU09sBCdU0x6XzVU8pQRC04L9qn+S5WT/BR9UetMRa7q4mQua0j15xIaqVY+5
 ja3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nAhpW8QVwc8Ujj2mNc6bcOrAMpvU9W7GbhsBz4Gzvhw=;
 b=hfe+5pSaJbUb4xlWVoWVDrgwET7nGhr3QbQ2gXQkSUdW61Vh78uUfmtgUmmZQqAc8o
 kzu+ikRCb2dG/S0pA16y/U03+pDUY3RL1p5tGC6DKGWeaNX/1v8JNCMXBUpvGW9Xb830
 m7PYcOiINpqj/KKm9e3Je9LQ8cFZQoIKec2+nu7t7St5r0S/tUDh14cjYjmkZ0DFrSGs
 s4AvFi/sMohGDRE8twVnonNKv5vieg3r13wGBVDlwaMN1vzeQbCOsD/r/B+e4tdXOmwK
 kFdHwL5EupQgZHK4ZyxryHYi4mXSRBehKbZ7897rqInGypbSHH2raPJw+IaNB7iNv8Sy
 fbfQ==
X-Gm-Message-State: AOAM532Ydl7Zi1sd+eNgqn1KFcT/5jqz0SEmVgVNSRuD3GJJli8xG1TY
 HI40kauRXzuZ2kmd1J9gP6x2zDh0FgmHOJvQh7LwHxfy
X-Google-Smtp-Source: ABdhPJzuT8MSU85NpoOwMdiT8zoimwOh3EUoEuzcCQx9qiDgeQaQ7fd8o7Ca8TU86WjY/KjCEdAuPPNripOwYkoc/X0=
X-Received: by 2002:a1f:110a:: with SMTP id 10mr2216379vkr.51.1590675819530;
 Thu, 28 May 2020 07:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200528133835.5087-1-rohan.garg@collabora.com>
In-Reply-To: <20200528133835.5087-1-rohan.garg@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 28 May 2020 15:20:31 +0100
Message-ID: <CACvgo501HGxkVXAEafXZ0XukN2J3WSKmo3Ds9bpODt4X4Lor-g@mail.gmail.com>
Subject: Re: [PATCH i-g-t] panfrost: Test labeling functionality
To: Rohan Garg <rohan.garg@collabora.com>
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
Cc: IGT development <igt-dev@lists.freedesktop.org>,
 alyssa.rosenzweig@collabora.com,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rohan,

On Thu, 28 May 2020 at 14:38, Rohan Garg <rohan.garg@collabora.com> wrote:
>
> Introduce tests to cover the new generic labeling ioctl's
> being reviewed here [1].
>
> Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
>
> [1] https://patchwork.freedesktop.org/series/77267/
>
> Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> ---
>  include/drm-uapi/drm.h    |  23 ++++++-
>  tests/meson.build         |   1 +
>  tests/panfrost_bo_label.c | 129 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 152 insertions(+), 1 deletion(-)
>  create mode 100644 tests/panfrost_bo_label.c
>
Listing high-level comments, haven't looked at the test itself:
 - make/name the test generic - I would imagine we can use dumb buffer
on panfrost, vc4 or others
 - catch the missing locking - a) two writers, b) missing read lock
would trigger user-after-free
 - use invalid handles - to highlight the mismatched gem_object_put
(as mentioned off-list)

The last two categories would produce various kernel
warnings/warn/bugs with earlier revisions.
Might be a good idea to run the test against those, to ensure the test
triggers correctly.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
