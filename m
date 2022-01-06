Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 201C5485E77
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 03:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B20210E54C;
	Thu,  6 Jan 2022 02:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D6410E567
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 02:11:37 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id w7so1816314oiw.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 18:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=q2VQMTLj5iMfGBhNI/dlyoIBVmaRNduV4g9FSAc5d0Q=;
 b=HAVqmktk9jdmgZuflgaqkWXgkT6HjjILGQc4nyrtPjXqB/28cq964Ts7Dx4YSVx+nZ
 lvMilO6WZjQUOE7DcdMRpEeflvrwsEdmHMJw3y1+54jjelilqM1XnGYhpkyKEdLGD4is
 5wV0VP6y2BEak1xFEQq6CQf3jXLQX5hdP559w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=q2VQMTLj5iMfGBhNI/dlyoIBVmaRNduV4g9FSAc5d0Q=;
 b=HIqXHqlJrvCQHUoqEQCGarFXYWaqlqlmHnka1qJNaGkZ3oeXqMtvsZkP9KiCViX57N
 1dwHrKEowC1QiWYAbY/O3ZJbhwpjpmIF/eJKdcYWkERwMWlHYD2grWRHuXmYRTJNR/o0
 /d/gAAPGgUgeGH3qymvWpsiuvH0FPT4ZNo8YH5xdg5vrZPJ0kee537XPZ69zpICrIgOm
 QuZJJ6KjRYbRBshAFsAQCPhv9EFDsUTbqBUn1ZNS1qTOwfGCxRLj7tqVFZ6Uw418TiC9
 on/xquDYIZAni+4Uj9c326vFEcgjLRJ2sJWo8xvCIDVjJ7K2jb4P9WCUEt3orDeynFve
 vTLA==
X-Gm-Message-State: AOAM530M2//u3+sVrw5M+nH8+cJz3oJTNWd/r/ou3TlVWVDgfsr52M2P
 GU9t4LwNIOzyew6KuHKaoGLmRJ8gPs7CuZHNlCPDXA==
X-Google-Smtp-Source: ABdhPJwpP4rARq+ZNtjjgLJ5aaz4xxbiA6N8LCGM1f9VveTOLHPxVsLehRjSQTj+a9Afka6xm71L9rlxNmHRbUONRxc=
X-Received: by 2002:a54:4710:: with SMTP id k16mr4656667oik.32.1641435096318; 
 Wed, 05 Jan 2022 18:11:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 18:11:35 -0800
MIME-Version: 1.0
In-Reply-To: <YcGeKpy/oecKlKZg@kroah.com>
References: <20211202222732.2453851-1-swboyd@chromium.org>
 <20211202222732.2453851-2-swboyd@chromium.org>
 <YcGeKpy/oecKlKZg@kroah.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 18:11:35 -0800
Message-ID: <CAE-0n52E-9T0X8COP0EhnjCK8iieSD0Vy_0f9-v8JX7ZshZ_0A@mail.gmail.com>
Subject: Re: [PATCH v4 01/34] component: Introduce struct aggregate_device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Greg Kroah-Hartman (2021-12-21 01:28:10)
> On Thu, Dec 02, 2021 at 02:26:59PM -0800, Stephen Boyd wrote:
> > Replace 'struct master' with 'struct aggregate_device' and then rename
> > 'master' to 'adev' everywhere in the code. While we're here, put a
> > struct device inside the aggregate device so that we can register it
> > with a bus_type in the next patch.
>
> Do not do a "while we are here" type change please.  Do the
> rename/replace first, and then make the other change.
>
> > The diff is large but that's because this is mostly a rename, where
> > sometimes 'master' is replaced with 'adev' and other times it is
> > replaced with 'parent' to indicate that the struct device that was being
> > used is actually the parent of the aggregate device and driver.
>
> The diff is 15 lines, how is that "large"?
>

Looks like I forgot to remove this chunk of commit text while splitting
the change earlier. Will fix it up now.
