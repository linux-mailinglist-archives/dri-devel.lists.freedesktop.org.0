Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E7C26AC3E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 20:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A036E8D7;
	Tue, 15 Sep 2020 18:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE4E6E8D7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 18:40:34 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b79so492698wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 11:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zYyN6LPzfn2vFUEIVQiganFFyH0N4T2M9+mAWYcZBkw=;
 b=YDPEWjgvy75n5TqlrvnQQNcLCq1dhmu472si60loJKAXfP62B5UPwzP7AueVZSZwol
 MNb32w2A/80QPg/AJzblrS3xzxY8SRrtaFRv32/XZVQ3NfcvwneGCMlxWLBJXm+G3lQ+
 r4crNeBFWPJbQf/aO9ocDkJopUOHevOJSzNWCMFU0ndnL0SR1YBmM4H0t8luCKyz7Wg/
 DMoBiJmr9N/hMIlrPy3orD+Yx3pXJ1VPWoLsXiAM6jjJyuEBvQQAcy+dtGDMe/EzeiPY
 UEWpPz3cwiEQErPkebtqliCdpFSt/wPfTsl0fwPRpd9K4GUq6jsMm1iFlysQwbPpH7ft
 Rxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zYyN6LPzfn2vFUEIVQiganFFyH0N4T2M9+mAWYcZBkw=;
 b=o+BO2Y6YndzgCSMXJHo6EFY8S/WH+hV/eNLUOBDoXhVpVwKCkWsDDeMY/7CWLUce0y
 OAO1pxXtS9uCSeQg9i/OGxYdKijk1+xXruu6ieZMqQQzZCvUq0qkbk3rs1eCHgVsDhZ5
 Ryjzy9aXtmU9+ZBKXviiH+ye/WauPYnoA+XPwiPhVhnjjwhpjJvt0DfwUKDJY4wZHunU
 yfpmMZepw4dvDLn11ye1aS0smwBPtnAyV/NFffambh8bM0MGzinEvBU/kboVog4AWIoU
 HfuJPJffZsnW1pBONliJA1k1Kgq6OGSqrYfHkvdL1x9WP9CIFhVi1Wq2ywajX9zkGJoh
 ssbg==
X-Gm-Message-State: AOAM531TueF8jtynDiBOHORH864b6hdv98ng7u9F8KkO45yr4cAc892/
 cK+s5eQyWlHJS653T130x9KgBRgejNRCWdF6xnQ=
X-Google-Smtp-Source: ABdhPJyRYXq3cFOR9iQUoniE8aaLigosTlWfepQV5AXpCxjDBYYNjM6iHJlHjwWj/g1W4cSbq3etAnLb0W8mCEDx/m4=
X-Received: by 2002:a1c:e90b:: with SMTP id q11mr694910wmc.39.1600195232679;
 Tue, 15 Sep 2020 11:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <61af3cb4-9bfc-0e61-de9c-4bb15afdd652@gmail.com>
 <CADnq5_NOUxxTkBLfmZhaDSvOGy51F+HYQKvcHuC+e4U7W6eLNg@mail.gmail.com>
 <75b33a59-9394-0cf6-7026-8cd14c0f1ab7@gmail.com>
In-Reply-To: <75b33a59-9394-0cf6-7026-8cd14c0f1ab7@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Sep 2020 14:40:21 -0400
Message-ID: <CADnq5_PjevvL39Dy4e6pdsyoSUUgt_kPzF5tZmrQ-mP8-bbUAg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/radeon: Add sclk frequency as hwmon sensor
To: Sandeep Raghuraman <sandy.8925@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 8, 2020 at 1:27 AM Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
>
>
>
> On 9/1/20 2:03 AM, Alex Deucher wrote:
> > On Sun, Aug 30, 2020 at 3:25 AM Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
> >>
> >> This patch series adds support for reporting sclk and vddc values for Radeon GPUs, where supported.
> >
> > This commit message should be specific to this particular patch rather
> > than the series.  You could probably expose mclk as well.
> >
> > Alex
> >
> >
>
> I only have a Radeon iGPU, and don't have a Radeon dGPU to test with, so that's why I didn't wire up mclk.

Well, there is still an mclk, it's just the speed of your memory.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
