Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E42310379
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 04:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8226F3DD;
	Fri,  5 Feb 2021 03:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA776F3DD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 03:23:09 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id b2so7892980lfq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 19:23:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tH2dcjVQVPFUlZ3icB7ec2l1YXyIMMEv/uggANC4SPw=;
 b=lbjzBpcVG5PvIp37PmyPSDbiQBrISG9sShRG1j9G7HUhM03CxP1kLfUdaJXLqL+tSW
 I4sYNz39byTBvUii9X433eWb6pN76UmyrJZem4VH5Or6yrE7yrbaoD9a2fr5tIwpaGZP
 eg9shKiRcWMPDQtJIuVMdyBrvi6WMkaCVM+gzlJbYkGJy+ICeo1UbI0ltiPy8y3T9ezn
 /NxNsFW2/bUf6KTBuR/f5eb5Ma/8WtWwkYxbNDgWoZRaESO+uJW8kUBE7Hx39WX80/7e
 faR2qdPP3CdDFZQLRcVCvNA6VdIOsRb8WJg3E9820MD4D7zFw1wWTzWSymQrsLDHjhvF
 qarg==
X-Gm-Message-State: AOAM530wg3PFkbyKUFqYYgAjJ5NcS6sGTWvSOllORIIIs5GoVEH0I3nP
 PQCQRKUQmXJoOBNxgMbYxjAPhtZNyfNQ5g==
X-Google-Smtp-Source: ABdhPJyaC/DDozrG3LsGEMwLn0KAKcA3OSC+vYkRrTubn1JndqHX6FCIGTaBRvDaDHIDl0JPGqH5mg==
X-Received: by 2002:a19:6555:: with SMTP id c21mr1362259lfj.563.1612495387408; 
 Thu, 04 Feb 2021 19:23:07 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id p3sm829270lfg.14.2021.02.04.19.23.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 19:23:07 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id s18so6053585ljg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 19:23:06 -0800 (PST)
X-Received: by 2002:a2e:88c1:: with SMTP id a1mr1543946ljk.74.1612495386836;
 Thu, 04 Feb 2021 19:23:06 -0800 (PST)
MIME-Version: 1.0
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
 <20210204184710.1880895-5-jernej.skrabec@siol.net>
In-Reply-To: <20210204184710.1880895-5-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 5 Feb 2021 11:22:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v64BpizczmSJdompGosFwWWayNscWvW-7oARLgwNNo=teQ@mail.gmail.com>
Message-ID: <CAGb2v64BpizczmSJdompGosFwWWayNscWvW-7oARLgwNNo=teQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 4/5] drm/sun4i: Fix H6 HDMI PHY configuration
To: Jernej Skrabec <jernej.skrabec@siol.net>
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
Cc: Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 2:48 AM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> cpce value for 594 MHz is set differently in BSP driver. Fix that.
>
> Fixes: c71c9b2fee17 ("drm/sun4i: Add support for Synopsys HDMI PHY")
> Tested-by: Andre Heider <a.heider@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
