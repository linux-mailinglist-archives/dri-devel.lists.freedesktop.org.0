Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF959CDA6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 03:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD7410F4BF;
	Tue, 23 Aug 2022 01:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4EAA8E37
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 01:15:32 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id f21so12647788pjt.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 18:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=PelRXkP8M5TiHnLKSnI/5v9U+UgZU9j1GaqlXXKduyY=;
 b=B2JIlNZDNtkAju6sTNbwCPjM8x/JWnCzOcTOwka5GmJ4uCKJi/4bxcBniEAharzhIt
 pVMSoZo1FiYj4gM/Vq8WdP9AOqs2uegecxzWIaHrIaKIJq+Y0rRz+8iEQ0Q1aY+Xn3N4
 fB1BhoUyJabIdwYV2Lk6fRXWfYU80GAZwMjtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=PelRXkP8M5TiHnLKSnI/5v9U+UgZU9j1GaqlXXKduyY=;
 b=bTaFRrR5PM1LT4fHWi15q4S3oFunUPMlS+0zyUhXP13PQKHjRuYdnKt2SPRTq6QAhK
 687PBgr1j5XMCJ1C7gk+RXxJZ6FJ1BakyplfeUd1bVNLZi6FkIFBtj0xGV+Q/Mougn8l
 nzmSP1ShVoEQQFN270sTb8pYs+XvUxQE7Q09AudEjFQCy23exuFffKGVA5EnrSY6o9WL
 6gPGOM9ArGv3cvg4amnG7+yb75sWljKyV4jiYCMMQPw6dwv1XQ7q4QkhCWBLktFiHPhu
 iityWIOQdG5+17m1pN7JTqzSWJh2jFKT+8I1Gn/a2vb6jp9xOkScLxarN2TQ3rMu1KCh
 9Jag==
X-Gm-Message-State: ACgBeo1lmD9PYdZR7ayhRjU8nbHXDalbYCVtrUHcre0GQVwC2NlDzdOo
 z9GLl5sVt/AloGICmRb0dMTV8R3UBgzwMA==
X-Google-Smtp-Source: AA6agR7U5Fy+osz2wQ91YXA6qrn9tSnO+fvkSNnn0uzp92ozDgtZmxR+K+t6JFtFOoJZjKJP70f0lw==
X-Received: by 2002:a17:90b:4a8a:b0:1fa:fc0a:6404 with SMTP id
 lp10-20020a17090b4a8a00b001fafc0a6404mr933997pjb.127.1661217331786; 
 Mon, 22 Aug 2022 18:15:31 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:34e2:c40e:42d3:27e0])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170902680700b0016d4f05eb95sm8938487plk.272.2022.08.22.18.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 18:15:31 -0700 (PDT)
Date: Mon, 22 Aug 2022 18:15:28 -0700
From: Brian Norris <briannorris@chromium.org>
To: Zhang Zekun <zhangzekun11@huawei.com>
Subject: Re: [PATCH -next] drm/bridge: Add missing clk_disable_unprepare() in
 analogix_dp_resume()
Message-ID: <YwQqMCNBiafBjDSw@google.com>
References: <20220816064231.60473-1-zhangzekun11@huawei.com>
 <CA+ASDXMGbJSJ2PC_4_2HL_01hO2aDoiWyxmosvtOze43aaeWpw@mail.gmail.com>
 <Yv2CPBD3Picg/gVe@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yv2CPBD3Picg/gVe@google.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, xuqiang36@huawei.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 17, 2022 at 05:05:25PM -0700, Brian Norris wrote:
> Hmm, actually I'm going to have to retract that now that I've given it
> some more testing locally. I happen to have a system where I commonly
> hit this error case, and I'm thinking commit 211f276ed3d9 is actually
> wrong, and so we shouldn't be "fixing" its error handling -- we should
> be reverting it.

I've submitted that for review here:
https://lore.kernel.org/all/20220822180729.1.I8ac5abe3a4c1c6fd5c061686c6e883c22f69022c@changeid/
[PATCH] Revert "drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time"

I'd appreciate your review/testing.

(NB: I failed to honor the .mailmap for Andrzej Hajda.)

> Now separately, I have to figure out why I'm hitting this error case in
> the first place...

FWIW, I captured the reason in point 3 on the above Revert. The
pm_runtime_*() handling in the panel driver fails (-EACCES) because the
bridge driver is resuming before the panel. (The DRM suspend/resume
helpers handle things in the correct order.)

This problem is also resolved by simply reverting.

Brian
