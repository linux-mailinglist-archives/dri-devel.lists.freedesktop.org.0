Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E591CA0116A
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2025 02:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CF210E1B9;
	Sat,  4 Jan 2025 01:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iDTdCEsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDC310E1B9
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2025 01:05:04 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-aa6b4cc7270so1835061766b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 17:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735952643; x=1736557443; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a4NhGUz7I3CAC37MMfl5it+wA4D/a3jTss78eeeM00E=;
 b=iDTdCEsGu/TF2PN+CKV3zdHi7srujCLzlzLvgp+pK/48njTOZJlTacb4ILDY9ESpuU
 xlWnh6t7yg3aLullDCgKpp8l5Q1kSt7D4Gd23DCAdcoeZ+UdpiHqLdZFKO4w5Fcad0ud
 P709Wt/oQkFgHtSCeimgKEAp5W+Nf1WIotsttbFH96or0XQ9cL1K0XndL8ELHTqSAYt/
 WqroaCK6iNHlkx5SLKAwjYh60rn0zuewyKzMFGHluoadQKjQPm7XchtEfzblRA0XU0me
 /Trk16clxbSf7397iQvygD+BHlPbXLI3b2NbtErvbDpETLW5AxI0pxOYucpxqKkEfXxq
 2N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735952643; x=1736557443;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4NhGUz7I3CAC37MMfl5it+wA4D/a3jTss78eeeM00E=;
 b=vUORiGBW6CH1tLT5tLLxmIpsOdKepU5CaZ4Gq6WJWy3IW4oLnEyG67bbqPuwQFYh62
 mrlBlRNUoYcum5BXzdpDwmOblMoqRA0nJXvf6Asu3e0sEF2EVgOA9inwvQemzrOdDv8I
 zv61hByvukg4ZeBZFmVxmXz010s3SLgU6NgjAaD9Ess9vsC0lUMhunubfwmd5dOQMZwJ
 yddRHEAF7piyuMu8sqKidWOiWJ1U/krxMy0GLZrzP1cjwYX2C/rG7WrPmibPv8nzh4gq
 sL1fhG0iPFhFgAmmuVOnv4QVImFG8VaxuaSzWyvP5MuhFT7iUTJiBf74Ni1wV8wBlEdL
 ZM9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDvZqBz6WaSop+xpLwIF65lA+NV2QMY+6TIL2qlA9ECg4bSa+I86W/OOEhVqCc8B49U5glS94tQJY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVCs+LCyi7667s4aslGO/wtcHXk9mwiHeK8MYkncM4UgPueN7j
 uAF4ujADm5tb/ZYp0jQV6PJko6bL3AXefWVUAOnTMtZ+EMU9NemYf+OReOJsWXYkj2jFjmlOOZj
 nv8E=
X-Gm-Gg: ASbGnct/CCI6ZY37tcYci2JUUkGLkznGqkEabFhauhJmVTfy+LTuCpSgZdR8dXS2mxS
 uACzWhvjXvnS8JV39qfEQkRy4r9C994/ci3aLvLHuM0pJKEF+iGSeGA51jpiMf0hUISaf1zMJK5
 7ZqgPkxf3rs90Cc7eZMVtEHFViF1yca1UKpTnbVAe0L6gpOW9jcZ4h3xuiG46XWXUmohJfQ5mio
 Vt82+4EekGVn9UOlhx3lF2tCG/pPyWsodrjLYWkFgKxQNvVdgY9CtgaDpTpHQbeqjbInWOcssGY
 CKLhxLhULcpEpc7nZzhFQKaJ//EeXm8wyC2U
X-Google-Smtp-Source: AGHT+IHkyk31lkzWD+THb2q0kv0bZe0UEvMvlsqPvrWF0mIfBuAWDJmkYgVUK9JyXm1uBZasD7+P3A==
X-Received: by 2002:a05:651c:502:b0:300:3a15:8f2d with SMTP id
 38308e7fff4ca-304685dff04mr196263781fa.34.1735927937405; 
 Fri, 03 Jan 2025 10:12:17 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b083ebbsm47714751fa.115.2025.01.03.10.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 10:12:16 -0800 (PST)
Date: Fri, 3 Jan 2025 20:12:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <qsmcpai2uqfhmy6y5wks55p4fyqigndfzqfnapvdjf35gu4wg3@5aowfh3xaydn>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-4-5c367f4b0763@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-4-5c367f4b0763@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 03, 2025 at 02:58:18PM +0200, Abel Vesa wrote:
> Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
> 1.4a specification. As the name suggests, these PHY repeaters are
> capable of adjusting their output for link training purposes.
> 
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> The msm DP driver is currently lacking any handling of LTTPRs.
> This means that if at least one LTTPR is found between DPTX and DPRX,
> the link training would fail if that LTTPR was not already configured
> in transparent mode.
> 
> The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> that before link training with the LTTPR is started, the DPTX may place
> the LTTPR in non-transparent mode by first switching to transparent mode
> and then to non-transparent mode. This operation seems to be needed only
> on first link training and doesn't need to be done again until device is
> unplugged.
> 
> It has been observed on a few X Elite-based platforms which have
> such LTTPRs in their board design that the DPTX needs to follow the
> procedure described above in order for the link training to be successful.
> 
> So add support for reading the LTTPR DPCD caps to figure out the number
> of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
> at least one such an LTTPR, set its operation mode to transparent mode
> first and then to non-transparent, just like the mentioned section of
> the specification mandates.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
