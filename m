Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C91B8E51
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 12:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3156F483;
	Fri, 20 Sep 2019 10:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D168F6F483
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 10:14:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i18so6117643wru.11
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 03:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5ZARvlMGzUOLlDd3Qz++HvoWRZDtFBjq+Ck4U0kIZJ0=;
 b=RACRdKYR2xjF5eFIKdyqotibea30Z8qWAzGXQA68iKxhFB04TOgnIiFpuDpnDF1YXv
 F6XXBGs35J94X4ope794xcSzdveFUrPRnqznGY7vrhxKNXycDdfrX4A0HA2AfLwp/S6i
 8i9WMJahWuWH2vB49ioSLPls1fIhDjY8Wd7ci5IR7svk+xmABiLOAjx3AsxQVQCrU+nT
 axFwfJP7b5yGWUDlcINoLF8/+s4fnjAPWU/S2hv6Mluu0z54JA0OUEa9/eOaguiVAf3q
 VIwG32YURBRCmCu6HYp2BUv7m7knEKtJicwE4ZjfZdgiaISK5b4FUKs6ZL/F42qwt+cB
 0/tA==
X-Gm-Message-State: APjAAAXjoOkyWNSkIE3RBjsxWw82Gj17a2PWvngg/kngpSI71rAKSHcw
 aJuDyaG1XaVgbGjN23RXB0wGsQ==
X-Google-Smtp-Source: APXvYqyKLOgmfl8hv9NLxhkcUW8cJq4QiBvFCFxi3sIHPyIEplkcQ/E1SKt7/3vCOBdKqIxZ7o8nBQ==
X-Received: by 2002:a5d:4742:: with SMTP id o2mr11160970wrs.253.1568974455339; 
 Fri, 20 Sep 2019 03:14:15 -0700 (PDT)
Received: from holly.lan (82-132-212-65.dab.02.net. [82.132.212.65])
 by smtp.gmail.com with ESMTPSA id z9sm2200313wrp.26.2019.09.20.03.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 03:14:14 -0700 (PDT)
Date: Fri, 20 Sep 2019 11:14:05 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 1/5] backlight: pwm_bl: fix cie1913 comments and constant
Message-ID: <20190920101405.yuu4bymublj45kd4@holly.lan>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5ZARvlMGzUOLlDd3Qz++HvoWRZDtFBjq+Ck4U0kIZJ0=;
 b=W6nzOE9+ubRnrXYaddn4a21F2+zaZqCfW5jYKljj9XjJqQ9t+UHwh8ByKvVJeZxs5T
 fNr6h9fu1qTNCNjta8Tngtiah1PSd0me8UgBwWXGumP+jzpGVEOQpqPhj9CAHNXJK+qn
 7KxxqKGRYpmRQ3h4qyXCfzUQqGIW73rHtkObqsExqBGkjXiD2JXOALqcc/ijZdPdBNa5
 mxzZ7u4kFImnnhqGHksmDkJxGROJvZoq2mtAx08mC2DufbIbzt0vcRYodcdpV/tU4iBL
 tjLELQ+Av7uCHUQLoUEKytOxo2cjZfLqKTf7grg7HYe+CmvC9NOxOmKh4bs3A2g1SBlT
 OO8w==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUmFzbXVzCgpIYXMgc29tZXRoaW5nIGdvbmUgd3Jvbmcgd2l0aCB0aGUgbWFpbCBvdXQgZm9y
IHRoaXMgcGF0Y2ggc2V0LiBJIGRpZG4ndApnZXQgYSBjb3ZlcmluZyBsZXR0ZXIgb3IgcGF0Y2gg
NS81PwoKCkRhbmllbC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
