Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CEA809869
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 02:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA5910E9C8;
	Fri,  8 Dec 2023 01:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4467B10E249
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 01:11:06 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9c18e7990so20681471fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 17:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701997864; x=1702602664; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cPIpR2OhS8FsOJYuELc4EcfXoYVEFO3KDU00U/AniAY=;
 b=Gf7X5e74P8tlns0Kv9eLwuR2MrXW2BhP1zh++SaAKOSf37PB2Rjn+9ILohQW9OfT2+
 O47LBRADOesRsmPJicArS9K1N6nH48Bb55b/YviUXGJdKOGvlbo/eItBsZWMOx9i7eRR
 Tbdbbv7ijJZr4Zkv6ac4/BZCAPIaRq41cGxfx5hTCc0RD3GFzGBl6L65TpvchCkMyBdl
 s5Y9KTs3k6d8XYSJOWxvO99rNl4Gw4hWVTCMUIEqcGDIyME1RQ/Qu3vSkHWGcb9sXFHp
 ij0M/kwMu/dfiYhYjy/7CSV3ZMDgLIaXjdg/ZkXhNOrj7X9ClHco3YbjIqWPFQrRezNn
 TlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701997864; x=1702602664;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cPIpR2OhS8FsOJYuELc4EcfXoYVEFO3KDU00U/AniAY=;
 b=VfoiiGrOl+CrqQq/K2FWpAOCyjtpWcBuJs9WH6CgnnE3OVV4lrag2Pin30+6HUghOl
 krVoCnU1i0Cf+IPH8NXN6umf1U0+MgXjK7Etbw9pnfcWIC8TdJOdcUk3VrGQRe1fEvna
 zBbFOJn0xjoE3GLp2CDpCpuEc58LrDb0NQlyrWOgdkOZUkxO7ydy8oZn9Sq6dO92cmBu
 R4yT9kAfYCVib8BJoFdMEtwDXjCzh349EhF4B9wCA0v66IOPF7Z9xXIPmdCaGDllV1+/
 kLXdB3kjh0/9jZsTaVA30WZa9NWPk033s0LJhU0HrJ1iGqPm6w5KkRNICRevCxoUGqpZ
 GbEA==
X-Gm-Message-State: AOJu0Yxqe/HMaJwfDP0Wt98Qz0tWEApAF6V1XNbnNLCoNhJDLy69YhUM
 6So0c4elQpv28cs54oP7sAnagQ==
X-Google-Smtp-Source: AGHT+IEWZjda2fsJ0zD6R8OaPvGCIhuiY+08NdpNxfUAkKx96xvmVTnzBUfNL5Fr1v/oeWTLLPMssw==
X-Received: by 2002:a05:651c:117:b0:2c9:fa20:89e1 with SMTP id
 a23-20020a05651c011700b002c9fa2089e1mr2063453ljb.9.1701997864531; 
 Thu, 07 Dec 2023 17:11:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227?
 (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm86616ljh.19.2023.12.07.17.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 17:11:03 -0800 (PST)
Message-ID: <22f39a38-6293-424e-898e-77edc071ef75@linaro.org>
Date: Fri, 8 Dec 2023 03:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Fix platform_get_irq() check
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
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
Cc: freedreno@lists.freedesktop.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/12/2023 14:02, Dan Carpenter wrote:
> The platform_get_irq() function returns negative error codes.  It never
> returns zero.  Fix the check accordingly.
> 
> Fixes: 82c2a5751227 ("drm/msm/dp: tie dp_display_irq_handler() with dp driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

