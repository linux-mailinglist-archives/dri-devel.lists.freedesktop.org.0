Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37476CBFC4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 14:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852FA10E897;
	Tue, 28 Mar 2023 12:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586D910E897
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 12:51:00 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id y35so9913926ljq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 05:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680007858;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oPp+3nUFhZ+YccWkOIH56CCwebX/zcxyGIO1u7xt7XA=;
 b=UMUoBtzi8Lljz2Sgb34U5+xP6Cu5rQuIeiaCyv2PE0Qy2pb0JDEUpuRrub0zyOxEpG
 Cz6ta8fT083O124Iuv8hNxLEjJEaTEwySKZRBOCj4XCsSnnCQsJJd1SbR1KDebBCx/UD
 W8Ju0NAR93gKRNTOFefaA1HYM9rkGhZPYuap7A75MkKBehF60/Cc+O93aT6FvX6pfPzb
 3i76DO71uzn07NOuoPLptIeTq79g+lpO7aYaikD/lxpuEbfGnlTogT3qhMT1dSSlSfbO
 4HAwb96diIMyQTLi/KEOP+kT7Khau+oMMDYhtMZgdTEZAduqhqmlh81XdhL6BnLxG/9b
 7Fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680007858;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oPp+3nUFhZ+YccWkOIH56CCwebX/zcxyGIO1u7xt7XA=;
 b=LVIYMp2wrEKFTlst1tI+oLCOpY4udYR8x54R1BuO+5fBXj2E8lDyMSFpzJsvlZY6ds
 q/vqEc9ow1P0hWcQr2Fk/1rgn+62G1FJPWbdcnG9ZpuCuQyk77zfPpIIso41syckOxgg
 LpIv4nZjRVad/z6EaY9QI8ADTPfxE1WCslaYw4v5mXlT2qbVdV+yyJOPYocnU3g1HOhf
 2Ymr1CfOSoZE+oR+MnYE6UI3o91kkzIh609hLa/g3Gs3cZymmOQ+MT5BOYKXyNa+cSY7
 NP7sF7mhkvhl5+q9/P7GiokLZCQO0Obh7CKs3yuQkULvhxyyayG5awEJhDRpn4XY5QXm
 jfYg==
X-Gm-Message-State: AAQBX9cuPRlu2Ofl9Daydp/mVrsZZJS7L7rqHW1lq6i3M8mSJJUW6IZL
 U4Jwkg1agBxsVo7y74O+47VT1w==
X-Google-Smtp-Source: AKy350Yfu+WCDB8OJ9f2IMPSw0LR1xCUAsN/WKbV1RchlDNRGKaVMzSWeu/KVaJJcuMAw7GWBZ8XcQ==
X-Received: by 2002:a2e:9d0c:0:b0:29e:4fa5:1708 with SMTP id
 t12-20020a2e9d0c000000b0029e4fa51708mr4844998lji.3.1680007858273; 
 Tue, 28 Mar 2023 05:50:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a2eb002000000b0029b32a40934sm4666781ljk.113.2023.03.28.05.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 05:50:57 -0700 (PDT)
Message-ID: <40178a1b-4a97-8f18-74ca-ccb1fc7403d4@linaro.org>
Date: Tue, 28 Mar 2023 15:50:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 08/10] drm/msm: fix workqueue leak on bind errors
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-9-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230306100722.28485-9-johan+linaro@kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/03/2023 12:07, Johan Hovold wrote:
> Make sure to destroy the workqueue also in case of early errors during
> bind (e.g. a subcomponent failing to bind).
> 
> Since commit c3b790ea07a1 ("drm: Manage drm_mode_config_init with
> drmm_") the mode config will be freed when the drm device is released
> also when using the legacy interface, but add an explicit cleanup for
> consistency and to facilitate backporting.
> 
> Fixes: 060530f1ea67 ("drm/msm: use componentised device support")
> Cc: stable@vger.kernel.org      # 3.15
> Cc: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

