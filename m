Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3338E0C3
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 08:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21FA6E0EB;
	Mon, 24 May 2021 06:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BBA6E0F0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 06:01:18 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 n3-20020a9d74030000b029035e65d0a0b8so2816195otk.9
 for <dri-devel@lists.freedesktop.org>; Sun, 23 May 2021 23:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=sLMIpW2Ge4GhccaqX0f4ED9sUyQ6GUsKxhCWraflgrQ=;
 b=kVwYjulbTpXvf8F/AH3Cn0+PqDxe6AsTYtT1ijwLpjc9Obx9CbTmoSemY8OjUw5tYq
 rghjvabI9aDAfy2KPMPOW60+THjy42P4Hk8yAjtHoNQ/Gt4be51wkQTQyQj5PlXT9Z8Q
 euKF6L1zMRk4m61B6LOZ8/zAZNWibeDQj15O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=sLMIpW2Ge4GhccaqX0f4ED9sUyQ6GUsKxhCWraflgrQ=;
 b=qpqfcCKnqLdykdDtsD8mcT6rFmlGvjw1yn0NdlMbzSQItRa6ZJWgfFt23V7x3EykmR
 96HC52GVU71w5sJ2nqK90f70ur2pWppJQ8s/IZxZYv8mzXCK6SM81M77ZGepmBE3zFj/
 5SP7b9JZQ4yFp4k0v5oGksttSZMFCvMRh36a+Eig4ygwklvAUo9u7Q3i+iKf1+aM1+EH
 vc6xT2hlZkdqmCI7QMT4x+n4ZYXJP0UvB41HcgOH9unqH8dLTc9XxeG6zJqLxCGsDZGj
 g7gRFqLYBAublELXE8fXfhFVjRXUhlQxZePW8tQZxTz07jDaHAs1nPvWsDynrv30xfB8
 NBlg==
X-Gm-Message-State: AOAM531MARnXzxBqXjEnstKzf9izkM077qQUQE15stpxNi8c/6aC4Mc8
 PD05ggG5Ji5o/ARYH0j+KGMC743BM1yiQ9N+kwYSdQ==
X-Google-Smtp-Source: ABdhPJxUXFeT7fRAQnyP76eyIBN6bZDnvKj0MzPI3ELpSWl7G60SJAr6Ae5/UXm1yxBeM2GrXn7ehxeepjeJze0/e+U=
X-Received: by 2002:a05:6830:1556:: with SMTP id
 l22mr17357557otp.34.1621836078248; 
 Sun, 23 May 2021 23:01:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 23 May 2021 23:01:17 -0700
MIME-Version: 1.0
In-Reply-To: <CAGETcx_LKwfv3Lx0mpxXaSdvoz284THwjqoHoOmZDwtcTf1zWg@mail.gmail.com>
References: <20210520002519.3538432-1-swboyd@chromium.org>
 <20210520002519.3538432-4-swboyd@chromium.org>
 <CAGETcx_LKwfv3Lx0mpxXaSdvoz284THwjqoHoOmZDwtcTf1zWg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sun, 23 May 2021 23:01:17 -0700
Message-ID: <CAE-0n518E_Yfy7-Au-pO40SQzZAn6NLr8u1pGyPMWWr0wRgpJA@mail.gmail.com>
Subject: Re: [PATCH 3/7] component: Introduce struct aggregate_device
To: Saravana Kannan <saravanak@google.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Saravana Kannan (2021-05-20 13:20:45)
> On Wed, May 19, 2021 at 5:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > -       master->parent = parent;
> > -       master->ops = ops;
> > -       master->match = match;
> > +       id = ida_alloc(&aggregate_ida, GFP_KERNEL);
> > +       if (id < 0) {
> > +               kfree(adev);
> > +               return id;
> > +       }
> > +
> > +       adev->id = id;
> > +       adev->parent = parent;
> > +       adev->dev.parent = parent;
>
> Don't set adev->dev.parent. You are creating a functional 1-1
> dependency where none exists. The real dependencies are the 1-many
> dependencies between the aggregate and the components. Use device
> links to capture that and enforce proper suspend/resume and runtime PM
> ordering.
>

Ah ok. Yeah it seems like that was the thing causing me runtime PM
problems. I've removed the parent patch from this series now and I'll
look at working in the device links now.
