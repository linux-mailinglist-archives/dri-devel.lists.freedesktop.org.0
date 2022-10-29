Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949F86122C8
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 14:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCED110E288;
	Sat, 29 Oct 2022 12:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389FF10E2C0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 12:08:24 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a15so11383416ljb.7
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wXEZ0SiAJsDBx6kQwPJlcjj9GjZJFbTgLrn2PJu4DcQ=;
 b=suSMcqpRXIsoVwxg5CQFuNE+7xV6t597mjxo4naDfeQFSr84KTvQnthV826Nh49JQZ
 rr5b9fVXhBczMDIaILxd9d3uLpppWPQ6uymgOEhH/xKsLshyk/UYJxwqVlX+VQvYjPTa
 FwCHkTYVPY0FnGxLjGkufV11SlEhpKQxPfA0lhQrWroYo8XmEIkjSi/YZ4Hew/Gs9PUs
 H8X6Y8wba7o4/gCwhPaYyqULVDfldDQE8HR3BznhwUJxKyXulAlXciPG2+GTTbz2I6Bc
 kasO4guLOulskzUMM6LzsnZBGLs7TcFJ83YTrZtb0AplDwHJyes0ZK1hTUOwZHlc6iOv
 4iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wXEZ0SiAJsDBx6kQwPJlcjj9GjZJFbTgLrn2PJu4DcQ=;
 b=TGoskNrHFCkuljhRV17e4pfD4t/ta2tdNZV5eu727TsbASx/Xotb3em02aNaZ5Zuv8
 5BQmdpvtR0WhvDcB9e7r5wCPSEzCQ7OKvtmNgkfigDGnW2nu8+DLeNk7sdtMc/vfsyKL
 Ntvt3QXnI0ZotN+9U7mJ8XlPdiIg9exJmrSZVlq1ydOYogE2KQSUTDEKZsHPmPUK1f09
 n/vwGkxIfzWDb0mAPwdcnOqcbvVgRAx3F8bKC7mwtd7rD0TaG+w7AqovncA0gLT7SOWV
 zZWDlW7/peo2Z+cl7GpNlbbYDl89123Gl8rs64vAy0JUIgjBso0RDl6aKjhuitaZgfsk
 O4fQ==
X-Gm-Message-State: ACrzQf2KfsRpsmtjhrNRlOFMjQGusfcgiMmU88lq4qGrVoGbb43HbHIi
 04X2pWEeByxcipBEGq21itzdJ0XnNJc5uw==
X-Google-Smtp-Source: AMsMyM7QrN+wVCBWlK5JozAyEWh7jUIdwIrxna8eFiKA/cZuWW/mjCuWyQ/Piw0n5wA0Nn5Ik4iUMA==
X-Received: by 2002:a2e:a5c2:0:b0:261:d23a:2009 with SMTP id
 n2-20020a2ea5c2000000b00261d23a2009mr1411058ljp.303.1667045302545; 
 Sat, 29 Oct 2022 05:08:22 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a05651203a300b004a95d5098f2sm255836lfp.226.2022.10.29.05.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 05:08:22 -0700 (PDT)
Message-ID: <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
Date: Sat, 29 Oct 2022 15:08:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221028225952.160-2-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/10/2022 01:59, Jessica Zhang wrote:
> Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> drm_plane. In addition, add support for setting and getting the values
> of these properties.
> 
> COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
> represents the format of the color fill. Userspace can set enable solid
> fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
> the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> framebuffer to NULL.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Planes report supported formats using the drm_mode_getplane(). You'd 
also need to tell userspace, which formats are supported for color fill. 
I don't think one supports e.g. YV12.

A bit of generic comment for the discussion (this is an RFC anyway). 
Using color_fill/color_fill_format properties sounds simple, but this 
might be not generic enough. Limiting color_fill to 32 bits would 
prevent anybody from using floating point formats (e.g. 
DRM_FORMAT_XRGB16161616F, 64-bit value). Yes, this can be solved with 
e.g. using 64-bit for the color_fill value, but then this doesn't sound 
extensible too much.

So, a question for other hardware maintainers. Do we have hardware that 
supports such 'color filled' planes? Do we want to support format 
modifiers for filling color/data? Because what I have in mind is closer 
to the blob structure, which can then be used for filling the plane:

struct color_fill_blob {
     u32 pixel_format;
     u64 modifiers4];
     u32 pixel_data_size; // fixme: is this necessary?
     u8 pixel_data[];
};

And then... This sounds a lot like a custom framebuffer.

So, maybe what should we do instead is to add new DRM_MODE_FB_COLOR_FILL 
flag to the framebuffers, which would e.g. mean that the FB gets stamped 
all over the plane. This would also save us from changing if (!fb) 
checks all over the drm core.

Another approach might be using a format modifier instead of the FB flag.

What do you think?

-- 
With best wishes
Dmitry

