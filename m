Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB77619DCDA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 19:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D75C6EC44;
	Fri,  3 Apr 2020 17:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3A16EC43
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 17:35:53 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q19so7741849ljp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 10:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=POas12dpN7kN9O3srxn75BiKgA8osyRtABWdm9UHIdc=;
 b=QGH0XZa85F7gf6EtUQ+4zpN0bu7F0YRNIXn5DUG9yPM2ZMXOo1+dzNBiANe3tWY3Qu
 D+k0DuazWhGnHb3+bsPxVPijdtPmfQLrBbXmzcqQVZtFU5atW7YvlAo2a1RVi8hDgY7f
 mqr13el7xCdyZ7DIfyOGqsYkzNCsPt1Qd28GOzaK3BTaMKgw+7PZDqH2euCFXtVxGbhk
 wvPNWa9rET83eVFUnTP/I4dRWg5dMqROJu1Kwii5Am3mDwLUo24qnGlbKhtbk9XgykCJ
 XDlpDAHVJcm3FMxOIcs/xr0FLwiTSIzoWFxWXBt3J5rbCBQy9WrTgr5v9D700wXEKX5T
 5cFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=POas12dpN7kN9O3srxn75BiKgA8osyRtABWdm9UHIdc=;
 b=d6rI+pMeah5qk0EN0JC04eqwhiVILx4SsIhlj1Y37YoJOC5UUjuRjTkvxoMrVEzoei
 eyu0LFHNVZIJMNTDXTdtoQa6M9HWfQPL+mv65n5hI81qVu7Xjfn8vN06rP9CDCYsPUl0
 RUvc9Cn9vQoRdveaU7tTcwF45kFfNch+LyZ/xHZ/Qbd9e+Jgka6Jk2qgYnV56+gt8s0L
 YfqtTN/Aje/y9fd2UQ+04CPaNR/YhdzytQBb1AWlJYV9zA2psZpNmFZXErtEmEFIORfo
 7SpBQXrn86mnhaHxY1V1ukHOvhhAPuXdW/bCQ5/TihU4I/L1N8TAAsxy3Mk31cn70ord
 RZ6w==
X-Gm-Message-State: AGi0Pubg2Nl42f3eLNE9irEfxU7OKKwEhm9TBROcW7LVZFz0zAFBBNAa
 swZKxFuIMOZuPg6PHN3e5h0NL3v0dGU4OV4jzpRuxQ==
X-Google-Smtp-Source: APiQypKMP/RnXTRfLKJD2UC+5Cd91AUzB1nOA2FDBNy5pLCNrQf05sW9Pa++XaIoH4z8MExARwbhTV032DovHlZyPsc=
X-Received: by 2002:a2e:7004:: with SMTP id l4mr5617327ljc.55.1585935352328;
 Fri, 03 Apr 2020 10:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-14-daniel.vetter@ffwll.ch>
In-Reply-To: <20200403135828.2542770-14-daniel.vetter@ffwll.ch>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 3 Apr 2020 10:35:40 -0700
Message-ID: <CADaigPWXAwOyEjTEpxrm-wBY9gwSfPsmrVL_0P2EhSktF_rX0A@mail.gmail.com>
Subject: Re: [PATCH 13/44] drm/v3d: Delete v3d_dev->dev
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 6:58 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> We already have it in v3d_dev->drm.dev with zero additional pointer
> chasing. Personally I don't like duplicated pointers like this
> because:
> - reviewers need to check whether the pointer is for the same or
>   different objects if there's multiple
> - compilers have an easier time too
>
> But also a bit a bikeshed, so feel free to ignore.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Eric Anholt <eric@anholt.net>

a-b.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
