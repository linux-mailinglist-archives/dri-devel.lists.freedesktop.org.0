Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD17674EA9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 08:49:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC67910E0D7;
	Fri, 20 Jan 2023 07:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3218510E0D7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 07:49:48 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id kt14so11875873ejc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 23:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BdhCjSy3SqnjWjDLB4IHqxMmPrap4fRlZrofYhguHhQ=;
 b=kr0qXC5yFUKl0L2KrHHQGmSu2kxGGeqtAIMq38iN7JnKS1Y/kmoTfYqWxV0GQvuej2
 krhEokJynI8KXyI8u8QUBHbYZobaDqApZZQHq8CuczZtsSYH92bVOEhvNKkYdR4MVrdz
 WjN9YY39rexcT18tPKx1BORtglR8DF7uAnFO3eh+uWB6oPA6/TE2/FS/OUf4lCf17F+k
 ifou1LFvh3lfdivSXjgtawzs+GgkdMY3zBUzhxmKuyb5138aeGmFkg2Vb1V+QCeQ+gOT
 zwuYNTEVK6A3FTRJdbg4SqqkqH8450+RopzwjSe4xwaT6Flwmiud+d8X3HHCPmN1mmVJ
 XjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BdhCjSy3SqnjWjDLB4IHqxMmPrap4fRlZrofYhguHhQ=;
 b=iwvNhnVOGOyW2xWkmkMaZw2IWQiIZ5RHrNIIC26hy3F6aQLliUj+sM6JGfCT/E5GF2
 MSzZy4A95yrCfmLKA1UZVWQJuWJNvtjV8D/gJLzf9IbbpVMLnjX6iQdg4Rfl5Wh0Sh43
 SWtOJwNtnugOGW5r1nxvCoVW4jNVmYlqFOkBkzyZf7NFs7p42kTOOAW5R75eorbzPXDj
 O6vbEZ8zl0BcIEAfxJPctZxa6pvU2a43BCaPqRqvYwF7SuNEpY3KhIycH0S+A5ul0YYg
 +DEouIpUjpvxE34CIIJcqons5s6Blov3iGFGFOgduWeFZKxINtGDevRrSAkFMccbqevw
 u0Sw==
X-Gm-Message-State: AFqh2ko27/DdzXd7D+L7NAEe6K9p24/4xUmUo+raO595FJrvG/f8dh5F
 MCECvN7LQEw28w8DC/SjRDhddg==
X-Google-Smtp-Source: AMrXdXu+nKsOpir3oVd9sIYTS7eJGx8vz6+wj1IeM5SC24ERfXKmFDBCCEcIUoQmMocvOYiZZ7lKnw==
X-Received: by 2002:a17:906:a393:b0:7c1:1fcf:266c with SMTP id
 k19-20020a170906a39300b007c11fcf266cmr14312899ejz.14.1674200986580; 
 Thu, 19 Jan 2023 23:49:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a170906a24c00b00868ef175e6asm10221725ejb.74.2023.01.19.23.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 23:49:45 -0800 (PST)
Message-ID: <6873374c-d221-534e-7a28-78836c6da4ad@linaro.org>
Date: Fri, 20 Jan 2023 09:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] drm/msm/dpu: Reapply CTM if modeset is needed
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230118233848.611-1-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230118233848.611-1-quic_jesszhan@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/01/2023 01:38, Jessica Zhang wrote:
> Add a !drm_atomic_crtc_needs_modeset() check to
> _dpu_crtc_setup_cp_blocks() so that CTM is reapplied if the LM/DSPP
> blocks were reallocated during modeset or after a suspend/resume.
> 
> Changes in V2:
> - Fixed commit message
> 
> Changes in V3:
> - Added mention of suspend/resume case back to commit message
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/23
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

