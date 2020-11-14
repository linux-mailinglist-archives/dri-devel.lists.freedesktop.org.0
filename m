Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6182B2E0B
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 16:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A746E929;
	Sat, 14 Nov 2020 15:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EAE6E929
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 15:36:58 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id 33so13616689wrl.7
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 07:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6P1mcO2kNRJbbh/T0XZ9QtQQ26OuRe5uLfwAgAsxH8Q=;
 b=rCczp/Gb/iHxZo+1BcJBHyAVqsGmDMTtPxIf6WmQ24kFlIj9K7poJqdE/Cn26EmTXs
 ArhlCEvIhtzq1UHPlV1SeOvTb4DeLX76hQ4nBcy+6SfQOcCqGYlvovN7ao5gffhNZiZX
 3h/2T53hg5DT2fXeYuce9Z0xMsBDMLTVznokjVrYp6bA7MVLsNYb0mMnm+GgMiviIRQ2
 GXxffXuQ+N1eNKOryoPhDUiWk/xK1RKbK4oPGx0TR4ddV/A7dYwR2A95lgjrSgJTyL/x
 F6Q1+7r4LgqEQKcHNw6+5ZDfXo6GJRkmmM+abhsNkbM26Uh7KfK08u2Oz/i2WG+M4gZj
 5Mqg==
X-Gm-Message-State: AOAM533JI5IrRtw4yeU9qMC86ma/2vvpZAXaUtulJ8eEG8gyP+bvqkXC
 JPoTULpqerE+re2LEkNxEt8=
X-Google-Smtp-Source: ABdhPJw/ztErj0PDs063eF71cDChBodWTwASgTPBkCh49ytR3SgplH/2PxKc4YKX8d3OpILcg9/WqA==
X-Received: by 2002:a5d:660f:: with SMTP id n15mr10404788wru.345.1605368217307; 
 Sat, 14 Nov 2020 07:36:57 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id l16sm14975132wrx.5.2020.11.14.07.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:36:55 -0800 (PST)
Date: Sat, 14 Nov 2020 16:36:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 01/26] memory: tegra: Correct stub of
 devm_tegra_memory_controller_get()
Message-ID: <20201114153654.GA4106@kozik-lap>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111011456.7875-2-digetx@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 04:14:31AM +0300, Dmitry Osipenko wrote:
> Correct typo in a stub of devm_tegra_memory_controller_get() to fix a
> non-ARM kernel compile-testing.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/soc/tegra/mc.h | 2 +-

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
