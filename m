Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DB976EE91
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 17:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FD310E621;
	Thu,  3 Aug 2023 15:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D2D10E621
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 15:47:01 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-76ca8921c6cso56013185a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 08:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20221208.gappssmtp.com; s=20221208; t=1691077620; x=1691682420;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BR95KYRW8gjLWmj5n1GrAER+G2eIWp3ay4JBNBU6gJ8=;
 b=0bbF3wBBxw+ApJM1bSULNxPzeIu8AWzYPBt1rdb1LWJyi4ZyLxEhHOgWCmg24+v/bX
 e73+6ZVFPAOJBfb4Il5wJuoktFHqJviWxQ0ucAN47nzImxfWMBKcJ0kmuPeAcOR1XUd7
 NuHQHb1m21IC8lRfXbqUkDw89tjlbA/wEwHSlc/CNi8cPIOIY+woRuVSaeOtbZhakOEG
 UiYuRmUlyjFY+dbd9YXqvr0OKdogIVY972whDOQoacqF1y3HDeH/BWnkWF3c+p1dLRbF
 16OVXwPhwVRyaJW0y4Kjxj6Bsg37zlkCv0nhwqoVYd3AxRWs/WtLwPfKFVTC8y3CxXkq
 gDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691077620; x=1691682420;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BR95KYRW8gjLWmj5n1GrAER+G2eIWp3ay4JBNBU6gJ8=;
 b=drBTKDlmpJaOswqLsL5HDxinb/w0VUByzT6TBNMDQK+1VjvzTUFXqux+1HEBFA3Kt8
 9zhwPIvsuCy4dGkLcAM4DNw98/mXVi5sS7YhSpGSKeGuuoLdYB6Jd7yVFKtxA9ClhAwH
 LhNVNZR7E3JfQGYWM7SayxDYYHfVb5l4vxDzhe+LojoB4ow9mcK23/GFQ2tDmBC7VSXC
 o2d1lT6cNO+CkHdehWj0Z9sx2BRj5c8cwlR3zO/BY/ioti5+WiXOiUKsIuueZI9Wlh6D
 ouOhVRHOPLd4zt88y+6Oy1t2MJUVarMFSvPU9YqT/f95cSLa1KSlzNBZztlq6W4dPkEH
 trEA==
X-Gm-Message-State: ABy/qLa40Rnjx5SUALmtnvIySuTZpn+7uZKZR5ekZOl0c+Uumfc9uFGv
 ODl4OmewuHewkGuq2dEvkg97wDjAzT+OMf48Tj3Cbw==
X-Google-Smtp-Source: APBJJlGw4ETm5GfVCR4LUhH6OiHpNa0fHLB0u1/uKg534tppEH6ps07NMLhpPvDi+d1HQzPVrckvZ7yCFleuqk9jVu8=
X-Received: by 2002:a05:620a:4311:b0:76c:9769:9e1a with SMTP id
 u17-20020a05620a431100b0076c97699e1amr17874088qko.17.1691077620369; Thu, 03
 Aug 2023 08:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210905122742.86029-1-daniels@collabora.com>
 <AqG6tXWB4u3qhQs6QV8AkOhbOhpAsenbzEKPlyG4IRBDtqevEHfx61dGX80b1U49N-nnoovcWzW1smGRlK6OhRrFkonCSFMalVxbhgdoNuE=@emersion.fr>
 <f27654e4-3abb-3950-1629-c32b881332ed@nvidia.com>
 <YYo7wHBACwgwy3W+@phenom.ffwll.local>
 <CAPj87rPaGtRirzB3-Gk+3i-=xrdA4O9LR6dV36smCgJH9JU3EA@mail.gmail.com>
In-Reply-To: <CAPj87rPaGtRirzB3-Gk+3i-=xrdA4O9LR6dV36smCgJH9JU3EA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 3 Aug 2023 16:46:49 +0100
Message-ID: <CAPj87rOU7wOXSJnwq8UqSOXvv5VuaSS7LRST1e+TphL2gscxew@mail.gmail.com>
Subject: Re: [PATCH] doc: gpu: Add document describing buffer exchange
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: James Jones <jajones@nvidia.com>, Daniel Stone <daniels@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Aug 2023 at 16:46, Daniel Stone <daniel@fooishbar.org> wrote:
> On Tue, 9 Nov 2021 at 09:13, Daniel Vetter <daniel@ffwll.ch> wrote:
> > Seconded on just landing this without trying to perfect it first, because
> > I was just looking for it and didn't find it anywhere :-/
>
> Swing and a miss ...
>
> I've just sent out v2 with - AFAICT - all the changes from all

.. all of you in this thread. Thanks a lot for the review!

Cheers,
Daniel
