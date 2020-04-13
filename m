Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133731A650B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 12:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6227F89C27;
	Mon, 13 Apr 2020 10:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8793789C27
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 10:11:34 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id a43so11354886edf.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 03:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k+7Q/wT0Mnct4ipSNlbYLt8kOVOarKScVBUfZKd/RJw=;
 b=Ftl6L6lCJy/fpy6YxWit+iPeJZbNeYl4OLQOjA7UAViyIPvldQnoXgr96YnuLmBKgD
 i1OY53JE5+coVC5AV8PeACQCwB44rPrtyzeFtsQDrI0RZsg2PfzMNqiaWWc12ZgcUBVo
 XENubJ2SQuc4oF3k5VvB4r8mK33lofDI2bMdY7eEZuBqZ96ARdXnJNVtR/yyQBnHjKXc
 g8DVYjKx61B6hfPN1DbCjNR38tCJ/T36qepB8l6oaZn3pzhjTziYca7cgiSzm1qlCB9T
 o11Z0KWkMRLdlGdn80awXF7oegfRNwe8TQNt3+Pbfcw98c1xfuYSaLK4KrCgrnREN8Cy
 u8BA==
X-Gm-Message-State: AGi0PuYaJtAg53LycAbNfZzLTXxYoFGSRyZWZejYuEz3VGsRR8Osc6Uy
 zcOq5E2hn1YOMdoe+t1Xs6aVUunjedQ=
X-Google-Smtp-Source: APiQypLvUEuB97TPh2JYirFQbq7f2sjr92UjL0XQ3SKfrB7XUiiYQZq8a7KlBW9R0Wgtuov5Ocv9fQ==
X-Received: by 2002:a05:6402:335:: with SMTP id
 q21mr15315734edw.47.1586772692459; 
 Mon, 13 Apr 2020 03:11:32 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id i26sm1312416edx.23.2020.04.13.03.11.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 03:11:31 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id x25so8885513wmc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 03:11:31 -0700 (PDT)
X-Received: by 2002:a7b:c927:: with SMTP id h7mr17717288wml.122.1586772691230; 
 Mon, 13 Apr 2020 03:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200413095457.1176754-1-jernej.skrabec@siol.net>
In-Reply-To: <20200413095457.1176754-1-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 13 Apr 2020 18:11:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v65qetxxVX1yoCjyduM4zRTyF3YKX1g9CuaHZkF_Z+AKQg@mail.gmail.com>
Message-ID: <CAGb2v65qetxxVX1yoCjyduM4zRTyF3YKX1g9CuaHZkF_Z+AKQg@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: hdmi ddc clk: Fix size of m divider
To: Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <mripard@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 13, 2020 at 5:55 PM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> m divider in DDC clock register is 4 bits wide. Fix that.
>
> Fixes: 9c5681011a0c ("drm/sun4i: Add HDMI support")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
