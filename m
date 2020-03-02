Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B40E6175F8B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 17:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469ED6E554;
	Mon,  2 Mar 2020 16:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2809B6E554
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 16:25:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x7so521349wrr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 08:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=DQCMbgMMKN4eMeJGo0Sh2/wZnBo8vQSRKLHwF2vzE7s=;
 b=B3X4puU1y9SmFMshbChsRmChUOK2azMe71Z6UNk1N9NDl6tMQa4PSHNF+osdrbJXHY
 wLD5KwG64BeOrgSRYxi/KRY7U9Nl6yD/Zqy1LV1yjLeKSQ+bQwT1O3spYrzbqA14zOpC
 WAI4GQmlEl4Wc5tpIjvpyTrGtZPFv/wxLch4Pr4Iq9Y5B2m+40bqPAz/0xfJyeRemzj7
 0GxWPqrZ0yjWODLO4bwgMiDbhJVSzI1HoZ1lMeY9rrvi2XBUarq7sSV0loFlK0iPK3c3
 dnIpKxLpNYJ2D99tIj2D/1HpIPR1RFvDWajdRmPOKU0UpLGNxs+OwFbatGARS0xCNo/O
 SA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DQCMbgMMKN4eMeJGo0Sh2/wZnBo8vQSRKLHwF2vzE7s=;
 b=hohhJC9B3QMBmuychrU7gm03oo1usuTDUqa4XG9YGjC/m9DYNvDCdJNp163RW7P5Pj
 JltOtKzbKDAtp0xhhyPSsB0/kN26PZRzv3w+/oT2fp3kI4TP6XNLZSeOubXHdlNgJlTi
 SAWyUX12xgEU8KMFozVRQS4E5tbjck+fCYVIG4W4yW3PE+fdxcRK6fbwoPvtD50ZQmlp
 +fCvAmSKbIctg3uqdhMjz/vQVELB5e21Q/203HrfWL+ufU3QEuFrsB/qcGMogyCqOTl6
 PPrCWjSZWS3cFKjBTW0U+9SBcxgpSDu57PSq8X4fD12CkrkqjE5AxhsxjnjOwr9ntonY
 35qw==
X-Gm-Message-State: ANhLgQ3UFKvevF2XeZlgg8onJ4+2ngPgv/Wj4ufHPYLIgKKStw3tUxwc
 EDbLDCwMd7Li2b/l3A4zZ7H/yQ==
X-Google-Smtp-Source: ADFU+vtZgwQFqSgV0Xi9k1YUBkP5b4vDb2TY6yuZe1HN/vcyZrgyFl5FHMyu4impez0lXe+ojRP0RA==
X-Received: by 2002:a05:6000:149:: with SMTP id
 r9mr335199wrx.147.1583166308694; 
 Mon, 02 Mar 2020 08:25:08 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k7sm15851605wmi.19.2020.03.02.08.25.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Mar 2020 08:25:08 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/4] drm/meson: add support for Amlogic Video FBC
In-Reply-To: <20200220162758.13524-1-narmstrong@baylibre.com>
References: <20200220162758.13524-1-narmstrong@baylibre.com>
Date: Mon, 02 Mar 2020 17:25:06 +0100
Message-ID: <7hy2sirafx.fsf@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
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
> At least two options are supported :
> - Scatter mode: the buffer is filled with a IOMMU scatter table referring
>   to the encoder current memory layout. This mode if more efficient in terms
>   of memory allocation but frames are not dumpable and only valid during until
>   the buffer is freed and back in control of the encoder
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

Tested on meson-sm1-sei610 with 4k@60p (VP9) streams.

Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
