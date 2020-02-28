Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E75021735DF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 12:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921916F3E9;
	Fri, 28 Feb 2020 11:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6643F6F3E9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 11:12:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l5so2505031wrx.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 03:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pJgpsPTAOyTEQskkZCcN8WPjUqHPIZGQG/IVbQt6n/E=;
 b=h2WHITZOQEvnJndGhZ+TDX7M952DgLQOWgr31Ngcy/m/dAg0BxFgqGvir/enXuUlsK
 kcF7X6vJmNR1YHmdV01i0/Irr8N33dYBwfdc9meKii+Dc5O3Eyo+N1F4IE0ROgq55uBw
 Lp3epqMDKrMRhCGZHzO7XQkqHKFZz0us+lB/RYxYAt9/B4x/waJnwlVxcBZAJ/O63+KT
 Az8tRKMz0QfKvcEEoXp5Z4wj/ZQunjOj8ZKo/h1lM8UjbTSk9jNl1tVL2M+jFoHsTbl5
 BExPopLr535QXki47KTKxzX0gw87dLNq4T3TZeieLI5slCMLO7xK7sKTwcynKlm4EUCL
 ohIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pJgpsPTAOyTEQskkZCcN8WPjUqHPIZGQG/IVbQt6n/E=;
 b=eeTLJMSgTJrdW0u4MrmSX0BQjGh95D9QU4cGIl6kuI3zrGJLad/UXDk5ez7bjfqC5A
 Z6yyfkrjDjzSYZYBdaRp5MhJfYDkthdlxrx4CISEWD9EN741E7gGIeC4PJX9NAvzvsVO
 y9mWE1VgSBRZSoObYbSgI2m5+3EqH8jGqvxCgiZt9i1j2/MXTjP6u0nLiF4+sKv7SbtH
 gBmdpyCTM9pBQTbDVuiC3gg09rEO3VJZfVh8aVNZI96g2QDKcMsms07uf5VgWNNVt1ls
 JuzS+g8H+OM7EV0I2ILsqOEaCaJog4hL0cK3FWFNW/Y5LBk0LRYwO0K2+cZ946I0SJNc
 qQUw==
X-Gm-Message-State: APjAAAXBj/2n76MQoSc3GSNYzWC2hPM8po36tOiqM+6HM3+570V2W6Fz
 8Ah+s+K9VfPaQIVl2PiaD0IZfi+xXtPRAi+8Seq0WQ==
X-Google-Smtp-Source: APXvYqy6KcgmbPb1fw5V3WytN081I6/VutL5m3T3ZlzWnw7MV1kE3qIKSqavYxfdsKdocmu8raau8/qoViKot+DHhpk=
X-Received: by 2002:a5d:56c4:: with SMTP id m4mr4484559wrw.6.1582888371081;
 Fri, 28 Feb 2020 03:12:51 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200228094033eucas1p2fa2f6cea3b882e758992d97da2fc50ed@eucas1p2.samsung.com>
 <20200228094026.26983-1-m.szyprowski@samsung.com>
In-Reply-To: <20200228094026.26983-1-m.szyprowski@samsung.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 28 Feb 2020 11:12:10 +0000
Message-ID: <CAPj87rOH6o593kkPKibfWr7K2JYQ8yvTHuAwSu=rjhWGKgKJGA@mail.gmail.com>
Subject: Re: [PATCH v2] drm: panfrost: Silence warnings during deferred probe
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Feb 2020 at 09:40, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Daniel Stone <daniels@collabora.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
