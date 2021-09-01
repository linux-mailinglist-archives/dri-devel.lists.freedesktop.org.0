Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A769B3FD1AD
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 05:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA64689FBC;
	Wed,  1 Sep 2021 03:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B90489FBC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 03:13:15 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id h1so2334399ljl.9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 20:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=d55o8VRMccw0pmcvesAE8Rz9x+AqcwcttzF+pmxCfek=;
 b=bCg/Nk0TbAY13fmh2bXxsSPoIhCRX+Fr4qTwZJaSP0ybyvvYcc+PXqQtCgt0WN4+WK
 ebleQkG1gHp9pGY2IS39rYWpQ0LP1Y01ysTIAeYohB/6kfLZQt/A1urNN2Hkc94wAixb
 KeDvobmDT038f0GT6oebwcwVU0eqRpY81WdHteoABxBfQTnm0pTOJQdP1X9I4C65IBDa
 1jGtIV1JlT5TVZbUaMpCzFuM9hrOneM1kMPFSm/Tiz+oUyVAV+CVYgHG9HFmdCfTZLff
 qIWbFh/MiSNW8pycu9cXyuXvsfOam6/bOdQ7N45RZ3rypXrpK7apZDuY4+Z69yFbRt+7
 Xuqw==
X-Gm-Message-State: AOAM5310EJtpaU5EpfQP6vAU1HolCgCGoYh72iJKMYOofc+T81f34nmd
 2pzK5pP6SV7MIEr60AeM2v7FM2CypqXQOA==
X-Google-Smtp-Source: ABdhPJyNU3vRpHuWSpur34RDn1UuzBITGAq3zL75FcYBaAfhK3He/m+31vyZcYcJlh35OAagov6OFw==
X-Received: by 2002:a2e:86d1:: with SMTP id n17mr27328221ljj.237.1630465993191; 
 Tue, 31 Aug 2021 20:13:13 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id u11sm1392649ljo.126.2021.08.31.20.13.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 20:13:12 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id j4so3326210lfg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 20:13:12 -0700 (PDT)
X-Received: by 2002:a05:6512:3b27:: with SMTP id
 f39mr23258174lfv.303.1630465992483; 
 Tue, 31 Aug 2021 20:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210831184819.93670-1-jernej.skrabec@gmail.com>
In-Reply-To: <20210831184819.93670-1-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 1 Sep 2021 11:13:01 +0800
X-Gmail-Original-Message-ID: <CAGb2v67TNrkeP438t3nLcquFvGTfS+F0MvBmGAS=qmZ5JZFmag@mail.gmail.com>
Message-ID: <CAGb2v67TNrkeP438t3nLcquFvGTfS+F0MvBmGAS=qmZ5JZFmag@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix macros in sun8i_csc.h
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-sunxi@lists.linux.dev, 
 linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, 
 Roman Stratiienko <r.stratiienko@gmail.com>
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 1, 2021 at 2:48 AM Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
>
> Macros SUN8I_CSC_CTRL() and SUN8I_CSC_COEFF() don't follow usual
> recommendation of having arguments enclosed in parenthesis. While that
> didn't change anything for quiet sometime, it actually become important

                             ^ Typo

> after CSC code rework with commit ea067aee45a8 ("drm/sun4i: de2/de3:
> Remove redundant CSC matrices").
>
> Without this fix, colours are completely off for supported YVU formats
> on SoCs with DE2 (A64, H3, R40, etc.).
>
> Fix the issue by enclosing macro arguments in parenthesis.
>
> Cc: stable@vger.kernel.org # 5.12+
> Fixes: 883029390550 ("drm/sun4i: Add DE2 CSC library")
> Reported-by: Roman Stratiienko <r.stratiienko@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
