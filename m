Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B4031037A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 04:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856106F3E4;
	Fri,  5 Feb 2021 03:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E446F3E4
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 03:23:36 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id q12so7777887lfo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 19:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lBhQgpWYfLW4RX9Ru6N2PlBwZejRwOZ4EQOVez/Xssg=;
 b=YyfcWOr6zzKTij9/R22N6zuSMH7vkLYkZ4LddEBjDIVxyXzAq7XU9kK4Ml/JL3luaT
 SP8E3OvjkQcr7/pZc/k1AIfP9MeJkiUbQ5CXJjJi3pF4tX+qdXALxmTbpXRzr/TkzRNQ
 wiQ4+nz59Wp6S8Kq5eAvKKz/Iz0JgPREtZ3/3Glpzm2GPN1A1biSfi51Grn5Oq0tKuI6
 YCW5Mk+WWyHEdmDbGKO3o5O9YPCNmDLjjfFxZP3MpL2tNBTPfYBK8G5PCnUgshp9HAix
 pGCq5J7mIQK/dKFs798oK2Mv2ZhvioB+oQElyidjqgn1mmZRqUL0N0UIULFe8vGuUx+L
 RyzA==
X-Gm-Message-State: AOAM531Tv2nQFfebbcctlbZDgX4HVkiDfgzRVyTrMqfxHmM0VXv5UaPO
 Rk6vtnFCsyehHlo8JdxosVKoeISrWs+VHg==
X-Google-Smtp-Source: ABdhPJz30DbXmqyGxqMDjUqiQgsSRkd329bddPhPta2Sj5qtzjoBZsfvJvk6/LHbuDKiWEfS63lqRA==
X-Received: by 2002:a19:305:: with SMTP id 5mr1337917lfd.348.1612495415048;
 Thu, 04 Feb 2021 19:23:35 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id r2sm830768lff.143.2021.02.04.19.23.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 19:23:34 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id f2so6020542ljp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 19:23:34 -0800 (PST)
X-Received: by 2002:a2e:9890:: with SMTP id b16mr1389484ljj.488.1612495414322; 
 Thu, 04 Feb 2021 19:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
 <20210204184710.1880895-6-jernej.skrabec@siol.net>
In-Reply-To: <20210204184710.1880895-6-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 5 Feb 2021 11:23:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v65VauNZaxWgayp0BdGxm=Kbb3LF-YXarx9gFZmPYP8B-g@mail.gmail.com>
Message-ID: <CAGb2v65VauNZaxWgayp0BdGxm=Kbb3LF-YXarx9gFZmPYP8B-g@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 5/5] drm/sun4i: dw-hdmi: Fix max. frequency
 for H6
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
> It turns out that reasoning for lowering max. supported frequency is
> wrong. Scrambling works just fine. Several now fixed bugs prevented
> proper functioning, even with rates lower than 340 MHz. Issues were just
> more pronounced with higher frequencies.
>
> Fix that by allowing max. supported frequency in HW and fix the comment.
>
> Fixes: cd9063757a22 ("drm/sun4i: DW HDMI: Lower max. supported rate for H6")
> Tested-by: Andre Heider <a.heider@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
