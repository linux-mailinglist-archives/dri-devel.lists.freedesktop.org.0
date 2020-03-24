Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C8191C82
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 23:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B6E6E550;
	Tue, 24 Mar 2020 22:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABF96E550
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 22:07:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p10so531145wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 15:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=YusM14BzJIMDSHzMH5zdQjw9hhEPT3JITrKIkp7xEiM=;
 b=U5oJgwJXEzInJbCIIllHCyQtoy/blNO5KYVVGHN+8SR+VKjULgmNBy/lH8MVbbmlkL
 GPBooUKVyWq7vjqhlzRUKcA01z8NTBrvLB+e98zv7ais1jXQoW3t4CQ7mxYkL+gTucey
 2OB3m6uVI+l05dzTf7V0rJFPEpe9siDmry3VRO/wNAo4QVPTOvgDhTpNnhIWUAcDQoGB
 QgqQ5eLI88p3/+p2/3h/WuZ+UPfBhCOmbPHIGFirtt1E9h4DRCjG1StIjOr5JdLZAwfA
 +dIjEKOIgvfNhulzvawbwxR40c1oj51Y+fWYB4rHjY9Ui2T25TTQzDUWifCnWaF8VbJ3
 Slhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=YusM14BzJIMDSHzMH5zdQjw9hhEPT3JITrKIkp7xEiM=;
 b=rNSxhH2t87fspyEv1GFVXC3sk3/8X85yfST0KYzL2FZn6Dpm7aWwYpJJGiUOCdLxDz
 m8RT9DbvNmvmaVL6YuHNtQyTncPE0xqa56HNK6b6zlAOqC2c6Er0M3X0PK/q5qFPd5Js
 nRsEuiFdPaPTkLQV0e0BeMBUufwR9D/aE2fX9OzZgAnXKjeQINaVIuH00zLG89sI0PhY
 yrbdWs9jvIsOYLlFvAzqPE6BgeSZUNv8ayJIe902cYYu5qerM1Q/UT7TBWI1uLvjErt9
 kW4ORjOR4iVpWHebEZZmYhpa0HGQkyMGZ6ImiLqm4XN4jiPDX+4nGXEINijMEwatxUow
 YoeQ==
X-Gm-Message-State: ANhLgQ3KRb6qPNh8m/zeTPM6nFiupJxmxAHI+iFw9trgbDMeNGKShmuH
 nZWU0BdLbmnfkIKSo4I1Iw/z7g==
X-Google-Smtp-Source: ADFU+vuSxXw25QUR0nIAb5OLmIU6jTi7EWOtLxakEApqVuvh84HPZknVnAkiaJ2bxtodhoIEBc76bQ==
X-Received: by 2002:a5d:5386:: with SMTP id d6mr32380863wrv.92.1585087641149; 
 Tue, 24 Mar 2020 15:07:21 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id v11sm11963482wrm.43.2020.03.24.15.07.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Mar 2020 15:07:20 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/7] drm/meson: add support for Amlogic Video FBC
In-Reply-To: <20200324142016.31824-1-narmstrong@baylibre.com>
References: <20200324142016.31824-1-narmstrong@baylibre.com>
Date: Tue, 24 Mar 2020 15:07:17 -0700
Message-ID: <7hsghx2yqy.fsf@baylibre.com>
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
Cc: mjourdan@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

Tested on meson-sm1-sei610 (VP9 60fps content).

Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
