Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B04111E8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 11:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58B06E452;
	Mon, 20 Sep 2021 09:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE15B6E452
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 09:27:48 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id y1so3684239plk.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AkK83KoahY30COqnHPfu5NhmXo2Lmr5a3aIm9VHLcOE=;
 b=daSOJbuZKfdabxXRP7RitCR98YqhVhU/7MIA6S7yHXx9yTkUt9SNuGTki+mR83qSab
 r8Gd0n5LLChV3G2xoTrE/Xxp7DNcvtDdGSuJSZMpkk5C7TTk4LfeldllgKQw1y8sJBrz
 G/F+1w+q62fVM0ZI2YHOmlbI1mSttQ8FNpLjFoJQyWOZH2gA1YfZhu6yGQEaM649PWiC
 dPOuB75qvnqg1Ol4+9H/pWlT+bVOwKhgmC3LadTuo0RqXs3FWwFL65f4sf1U2kArWRRu
 EhMZ588oVC8Ugfrez/fA9bpSYaRgSQLEEvaWU0Pyy9FTPKqg9xfiUAAI45ZyRvzlC4j5
 Ua6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AkK83KoahY30COqnHPfu5NhmXo2Lmr5a3aIm9VHLcOE=;
 b=oYhmy0Q6rTa4UiwkymllUUJoVg5msdy9wY1UbTJZBtz59ADKUDgzXKbymOjwIovmxq
 PBXEVZfVNhCLb1RwGKB2l4BJzyk9MzqrM1iwqw3dyK9V+xD7U5pAeGsW/7zliFbjUC25
 3o2Qeot+m2YUSAc4ohpv9VvB31/rQqlhp1FdiWAt0dlnzfsLo0F2lT2fpyJUt9H4ycMb
 n+BfdK1nigsIF9j6V2aMlkGrX4UgeAWSdtldYEi1j4ZtsXSv4PwLA+RpqSoH38TKZ70Q
 WMF4Bl3g2X8aBUMlrcboZNmdlpYrIAhFlaUwRyY2eQAFIyAdJ0xIVBaPulvRHfI74Gg6
 F0IQ==
X-Gm-Message-State: AOAM533DTfP5meigjH5feMrjD/gMCJ/3zTbgHRDnrGQxQdvPsqU80yIr
 wGCqKxQR1OrfoT6mK8245YcCcCVaoZGBy25XIqCmKA==
X-Google-Smtp-Source: ABdhPJy0CPwEY1Ze6w0dvv1rQvLAPIfSuDz1pmlBDkF4xo460yt13swCiLs4CtvAGWB1+2bvoSa/PzdYXHIOLRUwgKE=
X-Received: by 2002:a17:90a:5e03:: with SMTP id
 w3mr28216977pjf.152.1632130068379; 
 Mon, 20 Sep 2021 02:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210918140420.231346-1-knaerzche@gmail.com>
In-Reply-To: <20210918140420.231346-1-knaerzche@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 20 Sep 2021 11:27:37 +0200
Message-ID: <CAG3jFytjvApk5SOtWQ8RZ=-LCQQncQiHMK-RWbMMY04anLiaFw@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: it66121: Fix return value it66121_probe
To: Alex Bee <knaerzche@gmail.com>
Cc: Phong LE <ple@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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

Hey Alex,

Thanks for submitting this.

Applied to drm-misc-next.
