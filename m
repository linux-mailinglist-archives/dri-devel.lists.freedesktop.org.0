Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA526133B0
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 11:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7CC10E18E;
	Mon, 31 Oct 2022 10:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA7210E18E;
 Mon, 31 Oct 2022 10:35:21 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id f205so13203418yba.2;
 Mon, 31 Oct 2022 03:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6hSCV5/zFaODw8xlO2fBmNOddS6g/LvAJdXcY5VQxH4=;
 b=LRi7RNqQhYB2Ta4GTZcwRDvy7axOUZpPSPC/NWoeeFCaKxqWdGEVnyLsGrZ5N+Srz2
 6DrU3D7RDvMXdb8Kzd+dgCKC6UOg3MZgMxisipgwPypPo8kWodHY+Lcu0jfifWgnD63D
 NusDX04kleCyUYHRcjq0Q5bQhnf3d+eDJviV53eSSu/bfvbeG6Ce4FCcdNzzso5qs2nf
 qMJ0olpRHfeAnXFLr+NiuYl8mvJzSw4H/JTodAL62aVqPsoojIDrm88WPILSguLD4ufG
 xe39Fcqq/HHL3ppcxmDzP1ZfhRyRVta9RCxj5gefPcdaPEIXa1mVOgR8sZOh2pMAEJNj
 BgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6hSCV5/zFaODw8xlO2fBmNOddS6g/LvAJdXcY5VQxH4=;
 b=gRXM8cv2XaOdgnCiXRd3OgA+xa6wvIdgloGM8wSHOrwVizDoT0PH2pcqCzdCsjtFEa
 S/FzWP6rYjDTcXVH+EdIJ9Qmx+Dv2VmuV6Q+TkuQ9ImVT8je8rTePFcqrPyoISqRvmcs
 gq4M7VcXELmoqmdNdyxUl+dPKo+8TzprgmnW83PnVWA0s+p9SkKOrjG9MfLqG/dTBSyN
 GiIMGrHdns1rG6ROcCjZXleVwz+Duxv4N2rJMud9lIdFz/tOmlr0YAPtbUmC4NHwZHpT
 jEenFLqhbi1ULoadA7N6XjucsvXbtHoWhTpeZe/CRfhZyLW3cyrymUQQinQkIhwFiSpH
 DDpw==
X-Gm-Message-State: ACrzQf0AOJlzpmAhmyhrnKZBXRvzWO1FyYl4bsBIuctJx0bUiSisGaV8
 AhkXF+J3VzrQTmCAue3MxxvIeFa3QYM62yHit+g=
X-Google-Smtp-Source: AMsMyM6HFGZR1Ko6q3OSvFIYUAVvaOeXloKKnOT3I/P00Xzc8VAH73rKaHJkX6DRWxCXoHMKLJEPd2AibVySZmF7nig=
X-Received: by 2002:a05:6902:1023:b0:6ca:9d03:2994 with SMTP id
 x3-20020a056902102300b006ca9d032994mr11617287ybt.92.1667212520593; Mon, 31
 Oct 2022 03:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221027073200.3885839-1-nunes.erico@gmail.com>
 <20221027080519.lfpduyt7jcwh3b4k@vireshk-i7>
In-Reply-To: <20221027080519.lfpduyt7jcwh3b4k@vireshk-i7>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 31 Oct 2022 11:35:09 +0100
Message-ID: <CAK4VdL2V+Rnpb-rr=ov_81GUTDt=6i+6QRnKaYztZ7xfkvmMzw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/lima: Fix opp clkname setting in case of missing
 regulator
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 10:05 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Thanks.

Could someone take a final look and apply this? I don't have drm-misc
commit rights.

Erico
