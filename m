Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA492EA1EF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 01:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232E7891F9;
	Tue,  5 Jan 2021 00:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06215891F9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 00:59:12 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id r24so15517445vsg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jan 2021 16:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kZxuuYiPtHc6s2Zy+bkt3Y3hl+3F1jPre2w81KvLQfw=;
 b=bLCWFQwUTYyKbRkiIoiB0WKRGHiO3kAx3ufaAPHtT2TOxGQyZ+iwlCyGaHOVutCFt8
 q5LeZvTxDacbRLXvM8hzOzxPxf7h3iqUKECM9t8nJPDIaLWVic/i3BKLA0AtVs2Q8Krc
 wYCSvi9xrIo0R29+QXHGzBiJA5s6hrcffWLdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kZxuuYiPtHc6s2Zy+bkt3Y3hl+3F1jPre2w81KvLQfw=;
 b=si03zK5wcWMtOoOdtY1ChVjDH+jGQvsD9PWbHAsXSktTtBTP1ZAkmEMCI85YTzf8kR
 dn0od9x0EYG12dxhIXquuXmLqv33S2wB43Vu22F6zxPHLHZgcMrs6iVvjRGWnBAbDbrK
 G0Uk7/MmtcI2eUC5NQhNznyrRISgAQZAE1pblXprsy3KYGaSNdfEyWiuAbLQTxX37mDe
 L9s128PuEQ1P5f0d8+NOLSFGua3GpUvtrY8LG7s/FJLFmMm7mSqbOPBmNRqnpgiBMHY8
 3toe96SpudnJBbgT275SMujyJjnnYi4JGJte4t6gireubVfGv4EhjeEMSNfoNFM7MeCw
 Zbdg==
X-Gm-Message-State: AOAM533fbNUb6DIprl9dtsaQWD0FIH8iBDsmAW7cm8O1j722rPb/KrLR
 Axsuv64IoIjYg596fwqEVFVY5bjgtm3apvaALqWpHg==
X-Google-Smtp-Source: ABdhPJzB/3Kn2M1TyHyXiaHLvCJYLcm7dAyGmWlRcLpFicTs5UuECGJOIcH1VSh+UbCaJXtfJZqxaSnDWiCRv2KQVsI=
X-Received: by 2002:a67:ff03:: with SMTP id v3mr44806304vsp.48.1609808352096; 
 Mon, 04 Jan 2021 16:59:12 -0800 (PST)
MIME-Version: 1.0
References: <20210105001119.2129559-1-drinkcat@chromium.org>
 <20210105081111.v6.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
 <20210105003430.GA5061@kevin>
In-Reply-To: <20210105003430.GA5061@kevin>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 5 Jan 2021 08:59:01 +0800
Message-ID: <CANMq1KCjucCWW+FE=JEegw_OmPPuEFRXPBLTmjrc-k7cpBrASQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Fei Shao <fshao@chromium.org>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 5, 2021 at 8:34 AM Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com> wrote:
>
> > GPUs with more than a single regulator (e.g. G-57 on MT8183) will
>
> G72

Duh, sorry, yes. I will fix that in v7.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
