Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F400042CA68
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 21:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10876E0A6;
	Wed, 13 Oct 2021 19:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFC06E0A6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 19:49:19 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id o4so5304773oia.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 12:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=51iCtJfwF5rNqKCUIND5PpXwy486y8bSNPCFCoqsvKM=;
 b=GtN6f8PMidexfjnF/349pYjiZmXuf6rowzWXAw7EvtyJS68wcCRNFBO0ttVehwhlVh
 il/ckZ8S2Ye4H4vbo6TOFCgaFJAN1lTCglERo0fqfglSlD0AWLI9QAJRQMmSWnVyFHpO
 D4kmC6mAwQRLnVM1DUj8rY42VzjXPBOdS3izs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=51iCtJfwF5rNqKCUIND5PpXwy486y8bSNPCFCoqsvKM=;
 b=lD6AH7915cHYMoA9Ak/wNJ6J8eQPHoPhrMxor0RKRqFjX1wGjhpUSvgTCFWgC7I2rQ
 Mt5vJVtCgavdLcB9NOeXB/nDSIcVKcA6Av/F+FWavDyDhGMhq45wnEE+2YqMMTU57iQP
 hTYrQH/VqcOvvJucjFZU2WdaiiRplZ8dSr0G0xnl41qOQuUZGU+W+NtlJEPMr2VWDlJD
 m0768epBmrAWFK0e6TbKDHu/RxpkQDVtfQKuEFFrz+LzTxtXpOk0Bso48E87KfjosaaZ
 ng7eSy9JKDCQ5Q1/DbgKO5SVUMrIQisCAGATrI0RmQ0S74BhJPn4oGYJCpH9Xj5wGOpe
 J+4g==
X-Gm-Message-State: AOAM532hJ/JDP/cB56KHYi5oqywXGxq3HF/zQSyEVzf/GWgQZfY4bOZj
 p8Tkql+rUBmuUdcN7MP4GmAEtEmj+xVKE9w+qg4aVA==
X-Google-Smtp-Source: ABdhPJxX7OwXr/yMPANG+HHhHuaY5istIek0XSOY4+ZivdVb8quhuZc49QWi/nEmYjVgcpXIEGjwzniAFVFFCF4sz7c=
X-Received: by 2002:aca:3306:: with SMTP id z6mr9586177oiz.164.1634154558286; 
 Wed, 13 Oct 2021 12:49:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Oct 2021 14:49:17 -0500
MIME-Version: 1.0
In-Reply-To: <YWbPfwnbLKNZkRcB@phenom.ffwll.local>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-2-swboyd@chromium.org>
 <YWbPfwnbLKNZkRcB@phenom.ffwll.local>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 13 Oct 2021 14:49:17 -0500
Message-ID: <CAE-0n51FFUCb8C55bHSM0Fz16U65CvjGzVVe9CToqnFNZ6-bSQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] component: Introduce struct aggregate_device
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2021-10-13 05:22:23)
> On Wed, Oct 06, 2021 at 12:37:46PM -0700, Stephen Boyd wrote:
> > Replace 'struct master' with 'struct aggregate_device' and then rename
> > 'master' to 'adev' everywhere in the code. While we're here, put a
> > struct device inside the aggregate device so that we can register it
> > with a bus_type in the next patch.
> >
> > The diff is large but that's because this is mostly a rename, where
> > sometimes 'master' is replaced with 'adev' and other times it is
> > replaced with 'parent' to indicate that the struct device that was being
> > used is actually the parent of the aggregate device and driver.
> >
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > Cc: Saravana Kannan <saravanak@google.com>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>
> This adds device model stuff, please cc Greg KH and ask him to review
> this. Maybe also an ack from Rafael would be good whether this makes
> sense.

I will explicitly Cc Greg on these component.c patches.

>
> Once we have that I think we can then go&collect acks/review for all the
> driver changes and get this sorted. Thanks a lot for pushing this forward.

I'll resend the series today. This one has some compilation problems
that I've fixed now.
