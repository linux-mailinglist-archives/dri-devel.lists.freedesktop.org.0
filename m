Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F16310377
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 04:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E8C6E158;
	Fri,  5 Feb 2021 03:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBE36E158
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 03:22:44 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id q12so7775732lfo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 19:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rja3IW88jr9tIZdmCSJYYXsY9wEVmDBMuxnwOuDy0Lw=;
 b=ldr9Qmb1pZoFEn16sEYw+cgHixb2tmKRTtXPbUBsOmxXCxnaDEHP1j3tYH4FX8YZNz
 Gc+fMA8gzxLhMSiXE6yZhneh6c0v4yrgvA6ODQFG+K0FnhRRmxFAnhRukNqy0LS8wOZn
 VVQHUV29HiRGH9qlBAVDLcKeLlNg40+GAkrYU5Xz/FvgjlZDc+OQbVKEr6i/PeL3q/ns
 Vny1UqF52DXf8AqezYK02E6vUKWM1kGVzPDILx6sRRRp4wtUeEgYJX4NVxpw5T4Dcgbq
 m4praOsaalGwvAWuZGurwXasfl4i5FAe10RDBDIe0+eDyw3dCnmxLMhO+PNQU55F+2yc
 Hx7w==
X-Gm-Message-State: AOAM531SkM+rmiWYvVb9ec1tVX/WCcVKVjz9hQWD4hQOW1zdHZWqtfQc
 cMfxb1/nvISdI9B0oRvre6vzelwqAXiLzg==
X-Google-Smtp-Source: ABdhPJwbNv5lE9XW1K4Z9pmFVWPqCCsMqeZloCxi6CQBdzKC3v+qLz6ySakCnDyq3/xXBdWTkgcI5Q==
X-Received: by 2002:ac2:4d24:: with SMTP id h4mr1453522lfk.458.1612495362479; 
 Thu, 04 Feb 2021 19:22:42 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id k8sm830597lfg.41.2021.02.04.19.22.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 19:22:42 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id h12so7803960lfp.9
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 19:22:41 -0800 (PST)
X-Received: by 2002:ac2:561b:: with SMTP id v27mr1399561lfd.233.1612495361845; 
 Thu, 04 Feb 2021 19:22:41 -0800 (PST)
MIME-Version: 1.0
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
 <20210204184710.1880895-2-jernej.skrabec@siol.net>
In-Reply-To: <20210204184710.1880895-2-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 5 Feb 2021 11:22:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v652cCbwvdvb8RA4zH41cnOKcqbVNosiU1eCGPjGpWUGcg@mail.gmail.com>
Message-ID: <CAGb2v652cCbwvdvb8RA4zH41cnOKcqbVNosiU1eCGPjGpWUGcg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 1/5] clk: sunxi-ng: mp: fix parent rate
 change flag check
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
> CLK_SET_RATE_PARENT flag is checked on parent clock instead of current
> one. Fix that.
>
> Fixes: 3f790433c3cb ("clk: sunxi-ng: Adjust MP clock parent rate when allowed")
> Tested-by: Andre Heider <a.heider@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
