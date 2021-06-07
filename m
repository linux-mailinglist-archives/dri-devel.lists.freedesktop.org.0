Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C4339D783
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 10:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EBB6E877;
	Mon,  7 Jun 2021 08:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AB66E877
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 08:36:49 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so1693691wms.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 01:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OqAD7JyQJLtIUaTq7HisxnM/3X8ut9jR2CAddAB1Cqg=;
 b=doyN4rgRGFyq1Kz5xW+zSGP5eyprWLTmJNWt5GNCkcTtUajEwG24mgCalhI3uWmOKW
 E7LCI4cmGi21nURQKDnzjr6hmcWUA+rBgfNF0vs0mpK1jp45ve6KaLrJPGXSoe771ahY
 YKf6eaFqhhkVJBN+po2m0v/39VhNx4Arqs+4GJXeCrwOnb/BEDmWL6RlCMNOZVyPCcx2
 bFmYtkdXB5wB3CTjH+SBYgDr/uhhou6x/6QjqNkwbIk+KvX/AwWrxXr1Hfu+EZD8AZ59
 C+/A0ECO+spDAadILs7h5QCLyZDNdFTp7/Urc2/s3rg+8a9uhPG29gc1YAzWaRhruw29
 ym6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OqAD7JyQJLtIUaTq7HisxnM/3X8ut9jR2CAddAB1Cqg=;
 b=a8lBPTvPFEJwDe4Ql41u7Bw43/JMDlPFET/qud24u6kEadMC9Km/RXTmUuW8pjfB/R
 n37wk0ZY8Mx/YvRfriMDDglIBS5rE9XeeoapqhkZzPnZGkJCo9Btg1UCht6B/eSiKan6
 FJv8PckxvGGMB/BauSfZnCTfpCE4Y0qMptd5EkoWdUNIU5uoY21DOF2RUvDAG7JjAgd8
 oeeeqmPC6pZR3ckQQlS9L41RiXx3pULNkOsGAHFxcYpgaP805BOAZLUEfCzxsIUqyKXZ
 O/1fVuHw860qWJvxOoGIWBcpJ5QrKvfeqlYhaG9p6nWZMr+NUGiLi0y/M30vMqZfw1AJ
 BUxg==
X-Gm-Message-State: AOAM532ImWDEGnEjFvn3T1jqlLP5afnNa2vB18SLRxR3VTHWd6i+fGJH
 Pb5TCM6Ln9uwHkNZ9PGAba+BzjmE7jpExft0SG7Ucg==
X-Google-Smtp-Source: ABdhPJz8hM3hqr1V4jECe7fc+5nfq3AknPzC5rkIflKDlHDhykr0xPABNXJ3M2qlpZSxchzC5A0kjKaWCdCtcDbvsBk=
X-Received: by 2002:a1c:b782:: with SMTP id
 h124mr15900314wmf.168.1623055007668; 
 Mon, 07 Jun 2021 01:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210605073534.3786194-1-jernej.skrabec@gmail.com>
In-Reply-To: <20210605073534.3786194-1-jernej.skrabec@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 7 Jun 2021 09:36:36 +0100
Message-ID: <CAPj87rNFXkoRJw2_Y7aW0+7mzOYGpirs6YgUfuFrDFfXcyOMeA@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: de3: Be explicit about supported modifiers
To: Jernej Skrabec <jernej.skrabec@gmail.com>
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
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Daniel Stone <daniel.stone@collabora.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-sunxi@lists.linux.dev,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 5 Jun 2021 at 08:36, Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
> Currently only linear formats are supported in sun4i-drm driver, but
> SoCs like H6 supports AFBC variant of some of them in multiple cores
> (GPU, VPU, DE3). Panfrost already implements AFBC compression and is
> sometimes confused what should be default choice (linear, AFBC) if DRM
> driver is not explicit about modifier support (MiniMyth2 distro with
> MythTV app).
>
> After some discussion with Daniel Stone on #panfrost IRC, it was decided
> to make modifiers in sun4i-drm explicit, to avoid any kind of guessing,
> not just in panfrost, but everywhere. In fact, long term idea is to make
> modifier parameter in drm_universal_plane_init() mandatory (non NULL).

Thanks Piotr & Jernej!

Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
