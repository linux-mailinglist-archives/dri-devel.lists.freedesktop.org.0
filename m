Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3C4213680
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCD86E093;
	Fri,  3 Jul 2020 08:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B166E093
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 08:36:13 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o11so31787451wrv.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P7fSWBhdxOnn6PDppQSZdtfTHysfKgZ56cdTi27Te1k=;
 b=SETBoYUzp3W1/FMNxRJDXRc/8ZkoZIVtsqmqb7/bAoO+3x677B084XmRKTTdLLTwpa
 znpdvj1gspctmHlV6SdXA99xzwr9/fnvXhp1Qlq6wUgSJmQObd8lg44YR641uvYgN3Tl
 GG55y2REAUmeBNepXIbXElcSWiI3CDup6AeHqK0k5kF1Gd0lWJsXuek+VrF2mSykXKN2
 A59Mo/VLBGahk3n1HdIK/aP2rz0jNQo4uoKmrC3pEjJV0w2ltHDCVmfANegdl4hteJmd
 c6A60yEZG8HmvcG5H1oqi+LnAnJGZsEDsDw/rkPI+f9GHN6qcpupW/3hgWnqAOV/ryPv
 YBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=P7fSWBhdxOnn6PDppQSZdtfTHysfKgZ56cdTi27Te1k=;
 b=kzAEnQauNcTORFNFeNZ5K+7FHZNU8HVxvzqpipO9n3buoRgpL5ZjC9FUMM7qUDGWSi
 BDEBAfyiV/MASltqcWdEzD25GcNjM18oMNv5Clwdzsi7ScQ7jFnFq+BCblNfOONM1Gva
 vB8tAItAxaLbq+lXk73DcAmWmt1NaHMUPrAD3LaalkacSjh3VdPl13jQwyU+XNwqIu0x
 auZ3Mm7rHpbBLR+N/SJgNGKET+J1JoHaLmn076oR8IizUAFCRapqm35gaaiTwZIofMVa
 k1zjreyPqofRHV1gIdEoCAjMRN+rMo8jNDtZZK4aQlaNwoZLl5MkYCCnhnTPbeI3ZJdQ
 JQLw==
X-Gm-Message-State: AOAM532w9jKE/4MrBuX/YaCgLK1Dw1kni6nHGz043x2tXfGTTSkdIQKm
 AtNZ6pMSzgXs5RNPhtovC/frXw==
X-Google-Smtp-Source: ABdhPJzaOP7hivgWzseoHDdimS6iY5oQtiqRnN8+cZn7+eoQ6d1Ex/F6TisVLdyoZtJaTIVDAkD1Ig==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr38009535wrn.179.1593765371990; 
 Fri, 03 Jul 2020 01:36:11 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:6959:e617:6562:cabf?
 ([2a01:e35:2ec0:82b0:6959:e617:6562:cabf])
 by smtp.gmail.com with ESMTPSA id 92sm14145773wrr.96.2020.07.03.01.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2020 01:36:11 -0700 (PDT)
Subject: Re: [PATCH v9 0/6] drm/meson: add support for Amlogic Video FBC
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20200703080728.25207-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <1d81e856-9b57-4e07-96fa-bf087c41bde9@baylibre.com>
Date: Fri, 3 Jul 2020 10:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200703080728.25207-1-narmstrong@baylibre.com>
Content-Language: en-US
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jianxin.pan@amlogic.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/07/2020 10:07, Neil Armstrong wrote:
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
> 
> Changes since v8 at [8]:
> - added clarification of scatter mmap behavior as suggested by daniel
> - added ack and review tags
> 
> Changes since v7 at [7]:
> - rebased on drm-misc-next
> - removed spurious DEBUG in drivers/gpu/drm/meson/meson_overlay.c
> 
> Changes since v6 at [6]:
> - rebased on drm-misc-next (after drm-misc-next-2020-05-14)
> - updated patch 1 commit log for completion
> 
> Changes since v5 at [5]:
> - merged all fourcc patches in 1
> - fixed fourcc definition to have only a single DRM_MOD_
> - fixed 2 checkpatch issues
> 
> Changes since v4 at [4]:
> - added layout and options mask
> - cosmetic changes in fourcc.h
> - fixed mod check using the masks
> - fixed plane apply using the masks
> 
> Changes since v3 at [3]:
> - added dropped fourcc patch for scatter
> - fixed build of last patch
> 
> Changes since v2 at [2]:
> - Added "BASIC" layout and moved the SCATTER mode as layout, making
>   BASIC and SCATTER layout exclusives
> - Moved the Memory Saving at bit 8 for options fields
> - Split fourcc and overlay patch to introduce basic, mem saving and then
>   scatter in separate patches
> - Added comment about "transferability" of the buffers
> 
> Changes since v1 at [1]:
> - s/VD1_AXI_SEL_AFB/VD1_AXI_SEL_AFBC/ into meson_registers.h
> 
> [1] https://patchwork.freedesktop.org/series/73722/#rev1
> [2] https://patchwork.freedesktop.org/series/73722/#rev2
> [3] https://patchwork.freedesktop.org/series/73722/#rev3
> [4] https://patchwork.freedesktop.org/series/73722/#rev4
> [5] https://patchwork.freedesktop.org/series/73722/#rev5
> [6] https://patchwork.freedesktop.org/series/73722/#rev6
> [7] https://patchwork.freedesktop.org/series/73722/#rev7
> [7] https://patchwork.freedesktop.org/series/73722/#rev8
> 
> Neil Armstrong (6):
>   drm/fourcc: Add modifier definitions for describing Amlogic Video
>     Framebuffer Compression
>   drm/meson: add Amlogic Video FBC registers
>   drm/meson: overlay: setup overlay for Amlogic FBC
>   drm/meson: overlay: setup overlay for Amlogic FBC Memory Saving mode
>   drm/meson: overlay: setup overlay for Amlogic FBC Scatter Memory
>     layout
>   drm/meson: crtc: handle commit of Amlogic FBC frames
> 
>  drivers/gpu/drm/meson/meson_crtc.c      | 118 +++++++---
>  drivers/gpu/drm/meson/meson_drv.h       |  16 ++
>  drivers/gpu/drm/meson/meson_overlay.c   | 289 +++++++++++++++++++++++-
>  drivers/gpu/drm/meson/meson_registers.h |  22 ++
>  include/uapi/drm/drm_fourcc.h           |  81 +++++++
>  5 files changed, 488 insertions(+), 38 deletions(-)
> 

Applied to drm-misc-next
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
