Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61E527E0A6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 07:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7292A6E4D7;
	Wed, 30 Sep 2020 05:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5453F6E4D7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 05:51:26 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id b142so354043ybg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 22:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BhdS2BGo3si8nLZRXzdPnTlXLQOb+VYAf9EEYK8/yf0=;
 b=On+z7rW+sj3PI9QhHcidbDeUHkbd0NpkBy6ewHSrsEuBJJOExvVJ+NCSolaohnVAfP
 OLrGlkjQHTbG8kV5YxUmLYLTApQ0b3oE2cycGPG2JuwNmic1CfsUjQ/ZCat0DGshWjgJ
 HR6QM8ebzjJw1EXVlboGP71r/YrOnia2z0u2MvKyDrKJETpqYVZJRis90QmhMOBw1MGu
 3Y5gdyuqg4U0z1iL+SOoSm2AE+wipttmdf9T3Ruct46fNS4U45tgEqfaP3EdPodv3GLC
 cUhgI8PKsLk+z51MmuWSpbKRq+gu8Tx6URNOaUddT7kixs+8qJ28I3YxsM3VDFOGMACd
 C3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BhdS2BGo3si8nLZRXzdPnTlXLQOb+VYAf9EEYK8/yf0=;
 b=JjCRHueThE5u1M2J/2n0Z7g2r8See9M7nL7b4dKhve6I141joyLsAxWU5bQSRkviO2
 yuTQ7ss3ZbHR/WJsZhh/+BxMSpcV5GakoNlaPJ5HfIY61Oy0bB2srALqCDX6NyrpQQJG
 1bRXBj84cqYIdWnBM4qfgn12K4kcfP81aWu/kbCo+nEDJzM8+4TB89jlczFHHig2Grsp
 7FPLQK74sVM9AEwU5IliyDRkahfCmtYaiemHMEMl2d1kpAur6c6wF2k/upQauVdlUgsk
 F3VmF1UItYqklYgOat7TD1RtLgK7hv7I7gb9Ku/H4xj1XI+nn4ocBFFEjTMGyNYFWm1Z
 zB0w==
X-Gm-Message-State: AOAM53033JDBzD7b6QCaZ4aru8BMsTVBUPp+tibq2HHXUUOzYlJI6QlG
 jwWCUjwjLvsd0ARh2wkqTLV+f/3Fy45CWPJWAg4=
X-Google-Smtp-Source: ABdhPJxSV7w3BgMCuk/QXl/rO/EOPx29jb9LrPFZ+DgYLp4wtnbPUz3L3XEFspgZKQuHW74GuGWGCIkg9WWOqd+vJQA=
X-Received: by 2002:a25:fc23:: with SMTP id v35mr1073987ybd.200.1601445085558; 
 Tue, 29 Sep 2020 22:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200924051845.397177-1-airlied@gmail.com>
In-Reply-To: <20200924051845.397177-1-airlied@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 30 Sep 2020 15:51:14 +1000
Message-ID: <CACAvsv7tp3E1a6WBMSg3cyaQBVJbuGxeqO4fo5ZtyovLk57h4A@mail.gmail.com>
Subject: Re: [PATCH 00/45] TTM move refactoring
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Sep 2020 at 15:19, Dave Airlie <airlied@gmail.com> wrote:
>
> This refactors how TTM moves get called between core and drivers.
>
> 1) puts the driver in charge of all moves, and enforces
> drivers have a move callback.
> 2) moves move_notify actions around moves to the driver side
> 3) moves binding/unbinding completely into move and driver side
> 4) add a new invalidate callback to replace the last use of move_notify
> 5) add some helpers to cleanup the resulting move code
>
> There's a bit of internal churn to try and make each patch logical, so
> don't get too caught up in each patches changes unless the end result
> is a problem.
I've looked over the nouveau-specific patches, and the ttm ones
(mostly ignoring the changes to other drivers beyond a quick glance
over).  For all but 37/45 and the patches that depend on it:

Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

I'll add some more specific comments to one of the patches, but it's
also fine as-is.

Ben.

>
> Dave.
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
