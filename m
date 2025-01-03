Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E33A00D60
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 19:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8853B10E90F;
	Fri,  3 Jan 2025 18:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mCOksrf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C094410E90D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 18:07:32 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-540215984f0so13181245e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 10:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735927591; x=1736532391; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=155ezFoO+4fVmuNy4GZMEsWBNEAzYP4vCAeZ5fjCchw=;
 b=mCOksrf7UMtQqgFZSPorSDGEl5/xZUAJxRvXmWaIbZnfR13BTF3hkmgw4Re3kTIaxf
 LBLsSLJZVGH0i985ajleS5XubvRiAMFNMNaguuN2XE5VoREKW2GKj3CTT/EOvbwewLZj
 kzOITbM/Tmixo4ATV0QsD2CoEKB8Hhb92PRPvgnW4ZEZj3m/EG78QIT+TjYYAaoC7pjE
 QivMMxO5WAzyIK4ASkN4JHeQQk3dk8gty+bN082FtY111huCs3XShrxHaaS1VSdpd/In
 /kc5cCFwoSEKM2eLpikCd6JU5iKiOcaMSG4VaIhjvX6agQCiyUoQcvcyoYDaryVu09NS
 loOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735927591; x=1736532391;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=155ezFoO+4fVmuNy4GZMEsWBNEAzYP4vCAeZ5fjCchw=;
 b=PGhB9fAOa1kk2ULWWT8KxG8WW0sDW+33A46RM4c5ke1uDtg8kTs9MfWpPwPykJl94Z
 yRiAmi5HTjOyG1wgbOAfgk2bm+w8Hg/CX1djYxXvgSGQGvLz0oLJbrnLa7+UBl8FMeq8
 m4fVdvn6WbvDaPJAnSXKQwVO+uBbDI2mDKyiAFyxEAq3Zg3zkaDuIXzsnu3WcN7PGPbL
 73o6LIFkeHRZ/zag0KElnithWv+Nt3frBfnVozPMlEuoHN+M0cJVvbhFQlQnf1hUWYgR
 GiyYlFaRyGuGsPZEOOHJtH8XaZNCNHOKrSPYFg0viE0je2c8XIAsz5iq0Zl/DOr2LbSS
 GPjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUomRxuPixfe8V2SOEBefSaGNa+a400mbmINk//wMmV8IQZiU+Cs3csxTOiCHkY9Xb1f36s6QfZBkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyigb/FgkbnG86vj7UKuSm4jfcdX90XgaoQ0cw/vDoieq5RSHaB
 /hx8yYKE5GWoIZZIvdZHPSkxkEpzvBrQ/yIVv/KHfFNKpHxN+cdXDyU87JyIw0s=
X-Gm-Gg: ASbGncuTtXfm3HyYsLek8Druc7Dc50M3d2PiCsw1ModbjmgzsvvZeI9JU691X7gLAwv
 JFpa4Umn/g3V9r/6Tzl+nXGAbHYld+RwHSDI+eX+CU90pUjk3boDIyJcBp+Y4Jr5BshKKnr83Tr
 6KLP4k+GRae+J+mCMSYoh/e1ijLLp2IzEft3ju8n6t4kv6xiUWZHw4syYdbRbzC/HUou/9Iq3BM
 r1Sz12UN0Vo8PtKKIC/RW2iGqKZcap16UtX9aBT8NJJAYZT1vK/j2aPLl3h5rEvtmSm95HFW6BY
 eFIcS+J4oe+Mw1ZN+DVdnm0xXLoRDbXiYNSN
X-Google-Smtp-Source: AGHT+IGRom+Gus/1G1SgQhKlOCafo/OEVm4N6cFluXFzAfrnKOJhSwVzA8r9uuoBvSe2BPxSSW2YMg==
X-Received: by 2002:a05:6512:438b:b0:542:2999:2e43 with SMTP id
 2adb3069b0e04-54229992e47mr16954688e87.24.1735927591118; 
 Fri, 03 Jan 2025 10:06:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832a5bsm4176014e87.270.2025.01.03.10.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 10:06:29 -0800 (PST)
Date: Fri, 3 Jan 2025 20:06:28 +0200
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
Subject: Re: [PATCH v3 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <yx2io7cuu5hescyocvkvzsaoiqhgbifknbxytqtusbno6y4xe2@e4bar6lemtdl>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
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

On Fri, Jan 03, 2025 at 02:58:15PM +0200, Abel Vesa wrote:
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> Add a generic helper that allows switching between these modes.
> 
> Also add a generic wrapper for the helper that handles the explicit
> disabling of non-transparent mode and its disable->enable sequence
> mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> to move this handling out of the vendor specific driver implementation
> into the generic framework.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 61 +++++++++++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  2 files changed, 63 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
