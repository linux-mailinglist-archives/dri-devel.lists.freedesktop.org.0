Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 364E9212CA0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 20:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329DB6E104;
	Thu,  2 Jul 2020 18:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA13F6E104
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 18:57:40 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id g17so11652258plq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 11:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=hz4Mj/iQWQ1Gm0J6ofti89mpz3pTQ7LpeTX5svYgVDU=;
 b=vIYTYR0m8trV9lrGh8PSvAGnzTxA5G6rFm/vi7ItU7DM4fvPTm/3Rl6ME1n7it2B1M
 T30gPbuZtIE6zll34iGAqLPSdG6bmMkAT7qZrHG23Iy2IrCRlFaNzAsYQxUBUtDS7maR
 lsMpgjIPLbqvPDQlAxBB7JqNjvFBayTSyW6uH39IJTaZMduCtQ7pwgshj2ZogHfR0AYK
 rC+JXeUG8Ftfy0mqFWAjEeGKNCPSA+bU+DULdd9p41k1p8IbO6nixuAiWR3klbBC35vM
 ims47ez4t1jO7VNTh6Q4ji0M92+FQztMbbM3vX5S4RlQYC9J2EyktcqMDI2JKUeROJQS
 ApcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=hz4Mj/iQWQ1Gm0J6ofti89mpz3pTQ7LpeTX5svYgVDU=;
 b=W1Ew0kzPT/2ddPPoaYKmggRhd4AGtIQL5GF6xhzc/VgaINXqc/NBK/VTGZ+/e141ui
 Do23JP4rBtymLQOCwxOpRuvoya2K/leEU5N/LOBvsx0rMFtMwjouGqOc/qnJFHzcIJmX
 VpE4I8uuVgI37JYhmBVMH4SJbL++1O8C3OSESihLNn7K9uSUfjwrOb0FD8w6sdGGJLxP
 DD0leHq5SQFWIr2VjZ5TPO7RTYltDVJ6RxBMKwOKR3/JQ2HPzNZtl5cQOvVInt40bsXG
 OdNGGQL+Zx2v1g3enUnzI9lKZ0vnIK2W4cIvPiRhv6bu5gmf6wiWOHOL12rr1U3sD2PD
 8/fw==
X-Gm-Message-State: AOAM532jUbNXm/3aD+zjwsFYevH8kJtVAo4jns70Bl3EdnWjsNAqeU73
 LCtgYu6rx7SX2gyegrfpLImaLQ==
X-Google-Smtp-Source: ABdhPJy7+DRCrQWC1YEAlkN5Qs9h2rvj2F4QBQqw8k6R6J/7z34EhuVEi87Gs/fBbFtsm5CKS4/LNw==
X-Received: by 2002:a17:90a:f695:: with SMTP id
 cl21mr35145208pjb.86.1593716260173; 
 Thu, 02 Jul 2020 11:57:40 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id c71sm7396890pje.32.2020.07.02.11.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 11:57:39 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 0/6] drm/meson: add support for Amlogic Video FBC
In-Reply-To: <20200702074759.32356-1-narmstrong@baylibre.com>
References: <20200702074759.32356-1-narmstrong@baylibre.com>
Date: Thu, 02 Jul 2020 11:57:38 -0700
Message-ID: <7himf5iw2l.fsf@baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jianxin.pan@amlogic.com,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Neil Armstrong <narmstrong@baylibre.com> writes:

> Amlogic uses a proprietary lossless image compression protocol and format
> for their hardware video codec accelerators, either video decoders or
> video input encoders.
>
> It considerably reduces memory bandwidth while writing and reading
> frames in memory.
>
> The underlying storage is considered to be 3 components, 8bit or 10-bit
> per component, YCbCr 420, single plane :
> - DRM_FORMAT_YUV420_8BIT
> - DRM_FORMAT_YUV420_10BIT
>
> This modifier will be notably added to DMA-BUF frames imported from the V4L2
> Amlogic VDEC decoder.
>
> At least two layout are supported :
> - Basic: composed of a body and a header
> - Scatter: the buffer is filled with a IOMMU scatter table referring
>   to the encoder current memory layout. This mode if more efficient in terms
>   of memory allocation but frames are not dumpable and only valid during until
>   the buffer is freed and back in control of the encoder
>
> At least two options are supported :
> - Memory saving: when the pixel bpp is 8b, the size of the superblock can
>   be reduced, thus saving memory.
>
> This serie adds the missing register, updated the FBC decoder registers
> content to be committed by the crtc code.
>
> The Amlogic FBC has been tested with compressed content from the Amlogic
> HW VP9 decoder on S905X (GXL), S905D2 (G12A) and S905X3 (SM1) in 8bit
> (Scatter+Mem Saving on G12A/SM1, Mem Saving on GXL) and 10bit
> (Scatter on G12A/SM1, default on GXL).
>
> It's expected to work as-is on GXM and G12B SoCs.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
