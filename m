Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E77179481
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 17:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AA76E02C;
	Wed,  4 Mar 2020 16:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139EC6E02C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 16:08:32 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id x62so698768vkg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 08:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O1TPPQdcdHvad52oa9e1eaBSfICW/64mgOwAr43XQg4=;
 b=b0Bm2nnsjkT2KC7lNWy0bvOY7WZB9B5kjiGTGYB/UftpLH0F+BrFQhzmGsQ6ZFX4Cr
 fHVZdc71lS2P8koutRJRnvZ9U9wvn/+IH/Osw4Ic7VRZfiNb12rmKZFRUhvq27VVHvZm
 HCqvxHWu2Q5dsvdfVb1rsHrHOd9ILczUbDPCbKFvlr3xkc+xkM/5J3rEPi3sqfr0VFK6
 OUQBVRooKCC4ieXUuaEz8ssSa+zhx7qSdj9rvqhrie7AMwO5gpRB7UPYPXGQhLafgBwk
 NieAFPB3KtCnxthjnEqdEIXzx2YOa9U/gCQ2fDDiR795wCf3QDeC4Y2E5yetJOhl+9wq
 fjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O1TPPQdcdHvad52oa9e1eaBSfICW/64mgOwAr43XQg4=;
 b=eK+X/ZjKxPeYMcXKt+IbNoGGgVqfygXjFawQT72fFBmfJqAmReusZfHVONz9LGw7g5
 smvn+e50bqrDVOkaT2/wvMxJfZyIrhMBRhtEi7bdYh8Ard9Dw0VdCR9EZN6ojG9FMbC8
 S8JcT2UIBXeri1a18RYcIdt4cohjrGkIC4PTT/Vhs0u04Dp8lLZzWuzR/f6qPG4C3P9W
 2RCeqCGFI9GVJL/0tzcnUnRDJQg+X1nobP2ofueE8nsGg/S6tPZnzGZfhaS8rLsd2hIz
 fVrmausv1T+Zkehi4GdPUoVjryh2TUTZGBK4f7itVB1330Mp0o+FjBKQRq5ofj1besBX
 9Owg==
X-Gm-Message-State: ANhLgQ2RSKNg5eASe55SIi/vl93h1WE5p9hSONh2lxl4+3Uk3f39t2ss
 JfBle7psI+sK6upi33zKM1PNVTHWVespR7ZNEnph6sqE
X-Google-Smtp-Source: ADFU+vs31W/WEVIn76Ztw3WyoimEONBAG53uXXKde/SleGt+DABaUMoEsr1PNpI6SJ5LdUBweh4yjPYk2mmpKKbfPv4=
X-Received: by 2002:a1f:9d16:: with SMTP id g22mr1793743vke.22.1583338111113; 
 Wed, 04 Mar 2020 08:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20200131092147.32063-1-benjamin.gaignard@st.com>
In-Reply-To: <20200131092147.32063-1-benjamin.gaignard@st.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 4 Mar 2020 16:07:55 +0000
Message-ID: <CACvgo50=Wt9LFWDjkJa99T8r8A64JWgfqApmir8kX=kSXd1yog@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: context: Clean up documentation
To: Benjamin Gaignard <benjamin.gaignard@st.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 3 Feb 2020 at 08:11, Benjamin Gaignard <benjamin.gaignard@st.com> wrote:
>
> Fix kernel doc comments to avoid warnings when compiling with W=1.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  drivers/gpu/drm/drm_context.c | 145 ++++++++++++++++++------------------------
>  1 file changed, 61 insertions(+), 84 deletions(-)
>
Since we're talking about legacy, aka user mode-setting code, I think
a wiser solution is to simply remove the documentation. It is _not_
something we should encourage people to read, let alone use.

Nit: prefix should be "drm:"

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
