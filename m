Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF89575DC5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 10:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BCE11BB8D;
	Fri, 15 Jul 2022 08:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5DD112CC7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 04:50:30 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id q16so324173pgq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 21:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=kRLhZzbGYGaRDYFSzzNmS4CySIoJIiXGprjd8sj9K/0=;
 b=V+hoi62i9rmotV7C9un25P6iuXZO0dEMik9ZBz3EVv9NVFcXJN95QkPmfBncsjI/Ao
 FCxOTAqa8wvTsmNa1AOwYKeX3C3rL7cY5bTQBsQJUlcVD/Pkzfv/BmgwYTtEqzlYEqvK
 CY5SN2DJ0kyd6PoEAxwAOH5Zq2JwJEObsYuI7yoR08OxaaYfAYOE0lTxfzI5VYFrLJAh
 Ags94LXbQBlnBepEDdYxl8tpSLRTpMcG4ZTbO43dOwIoD56IHTdEMnPGbVG32oDhp5oZ
 a27iAGk2eDZeSJGEI7gP30qOS/i2Hti3D6xeHqSZ6Na1K9JIY/GvwP3QFrzHEgqACVQj
 ZSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=kRLhZzbGYGaRDYFSzzNmS4CySIoJIiXGprjd8sj9K/0=;
 b=sesRkXDP2q/7R9Tj7+Rcc4B/6NsU5cMgqxIUfGMb2lbJTUQIS8zu3V07OomagVhT5a
 Z8qPb4yNR/uTiEpz4+KFowtYsQmCxnGQWL2ggnLuzzQlT7QGvHulLP9hNhpTLgMzk1DJ
 NQ7RepcEaC6wMJzY31K7zXx1olkXA2nXus7En8cuGC+lKt+k21JsO4GCsc4V+QaTDFQ8
 zIkbSkRt6wdYwyGB73TIcoFut0ikVzNM6B153TrkZ1T+ZIJlYb6ltX3gbAytvLVekq9s
 E/1A1ktX4UfyHP8M3dyFpUFaAlBNX/wjVMXoNjaF4zCGoJdXGikcfaR89ZZaBadShlTN
 LjGQ==
X-Gm-Message-State: AJIora8GtkjdavBsXfeGf+rK5MWNgWBQ4yrKTo6njMKasRWA1hqbaWZ+
 i+g9iJ9maMCSddjj9tEu9cU=
X-Google-Smtp-Source: AGRyM1u/RDFN0eyZrhqFr7v6lAykVv06aI/n1+Es6yulIiuzxUGnR3jVZSsEy1EL8D33z18/mQCqtA==
X-Received: by 2002:a05:6a00:8c5:b0:510:6eae:6fa1 with SMTP id
 s5-20020a056a0008c500b005106eae6fa1mr12333545pfu.12.1657860629806; 
 Thu, 14 Jul 2022 21:50:29 -0700 (PDT)
Received: from [10.1.1.24] (222-155-0-244-adsl.sparkbb.co.nz. [222.155.0.244])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a170902c2d200b0015e8d4eb1dbsm2389411pla.37.2022.07.14.21.50.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Jul 2022 21:50:28 -0700 (PDT)
Subject: Re: [PATCH 00/10] video: fbdev: atari: Miscellaneous fixes and
 cleanups
To: Geert Uytterhoeven <geert@linux-m68k.org>, Helge Deller <deller@gmx.de>
References: <cover.1657554353.git.geert@linux-m68k.org>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <d9af62bf-09f2-cfca-eeda-92dcb539b56e@gmail.com>
Date: Fri, 15 Jul 2022 16:50:21 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1657554353.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 15 Jul 2022 08:47:25 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

somehow this series slipped into my spam folder ... only saw it now.

Am 12.07.2022 um 03:50 schrieb Geert Uytterhoeven:
> 	Hi all,
>
> This patch series contains miscellaneous fixes and cleanups for the
> Atari frame buffer device driver, which were identified while working on
> the Atari DRM driver.
>
> Most of them have been tested on ARAnyM, and should be safe to apply,
> except perhaps for the last one, which is marked RFC.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (10):
>   video: fbdev: atari: Simplify atafb_pan_display()
>   video: fbdev: atari: Remove bogus FB_VMODE_YWRAP flags
>   video: fbdev: atari: Fix inverse handling
>   video: fbdev: atari: Fix ext_setcolreg()
>   video: fbdev: atari: Remove unneeded casts from void *
>   video: fbdev: atari: Remove unneeded casts to void *
>   video: fbdev: atari: Fix TT High video mode vertical refresh
>   video: fbdev: atari: Fix VGA modes
>   video: fbdev: atari: Remove unused definitions and variables
>   [RFC] video: fbdev: atari: Remove backward bug-compatibility
>
>  Documentation/m68k/kernel-options.rst |   4 +-
>  drivers/video/fbdev/atafb.c           | 101 +++++++-------------------
>  2 files changed, 29 insertions(+), 76 deletions(-)
>

Looks good to me. (I'll still try to test it on hardware this weekend.)

I'd suggest the last one be applied as well - if the regression can only 
be triggered by a X server resolution switch, I doubt it'll matter in 
practice.

Cheers,

	Michael
