Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1B9E84DC
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 12:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD7A10E440;
	Sun,  8 Dec 2024 11:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DLFYmzPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FD210E440
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 11:58:37 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53f757134cdso774594e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 03:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733659115; x=1734263915; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CysgqJSoA6The5y4gGxS6RuFPaDLlk4I3KIup58ZBcs=;
 b=DLFYmzPg8rTR6JSbQ4KnoqgbOovHddSKGcjqc1SO3Jjg5Tk5ZIGgqIV0SvRPJ2XiFz
 lJM/EEk+FnVgHCgCWR5i+eMa2iI/58Mnty6NmbUHmmazOiAlkvbli9mPePLxxr/EELoe
 qw5F9mblc0csMfo1vQQgpjkLG+Ud/ZCdUytx6JxI4l4WuNdYVyAq3mzyWjFWAj4mjO3F
 EjANSbVcmJ3YtJg5yfCA7WdceojCtV3yjxsOj09FxNa5zRP62C+vKXoTlyNKSTYKmG5l
 u24YZEgoh0eAGsnXF4DEkvwhyiUqkIwnWfNN/jPjeznFqWUZ0oDo9spjy534StttK2xv
 HUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733659115; x=1734263915;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CysgqJSoA6The5y4gGxS6RuFPaDLlk4I3KIup58ZBcs=;
 b=hRRUBv2+I/aVtzeE3f5GfFogvLdgknR8uaezR3Juw5oHZXpiOfcOLS49UozS1WHlBi
 LBKotAmKnxpUygsYE2k8GFGxM0RLX5/NeRvgG8MyHdJV1WK/CZ3kbvK+ix0j+puJ0CVs
 lp93iHKhBqCrgeh2I+tYa+hc7ascezPaUdESdaX0g3jZNdqsrF8LK0f7fCrtGHEgLcXD
 euYqw0ERRikO0Kwnq14e6goCgsUAx+YYmn9Lw6e+Cj+nou10FCL6NdQDK+W8e6HpqEQg
 TsXCQeO7cST4xaW6BaXZwLIC8ALig23RCr65GHSh5MQ5VoI2mTcPOPn8x6WM7XJmWxYm
 +iUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfInlh997HD/ubVMwlyPSyOfide/TM7KD2tqy4EbH7jhAYTKbz3rIlc+llpq8DdxSIR6Im7oxDOmA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqB/xT6+gGa62dnNm7XF8mNQlFbuuSieudYMzl/PPa39N+4T7C
 mF+mz28Iz9vOcGMrk0p3C56qKwqch/T5XEibGNLAjkKIHhh2wjg/P9rSzyv4FvE=
X-Gm-Gg: ASbGncu9mQcg2ouRMP2hOWQoOFHGY4KsAdZrHiHC92FSErwcB6iuGLG2/i406UPk7CD
 4+dZfsK1xb8J24kN+naJmcxyJfuSb33y4YBWv5dYNfNr/3MXEvEFp5QiFmjZOhgx4Fv0jqmejXY
 8fDTNstsgQbyS2Aso6olCnCl/Dci7o9TbNa0dkymABhcHI6G7ksFdys2jZiOsu34V2acYyzmvT5
 UFXyUCtWUTFe/YGIY5tu92NNL0UE8fg52MWA0/b3DdroKE3Ba+9I5F5EymrCB3lFb47rLTRpnhY
 ePv2o4uwuAzm3FPEKte0aQ4oVWa48Q==
X-Google-Smtp-Source: AGHT+IFMxzujaEusISBpEqUr26OQV2IrA+gNY14wgz09Z76uRnfMuKHilK9vldlA5zCo+wLBFIB44w==
X-Received: by 2002:a05:6512:3d07:b0:53e:3a7d:a1df with SMTP id
 2adb3069b0e04-53e3a7da2cdmr1577018e87.45.1733659115464; 
 Sun, 08 Dec 2024 03:58:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e94f77f3fsm424275e87.217.2024.12.08.03.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 03:58:35 -0800 (PST)
Date: Sun, 8 Dec 2024 13:58:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 42/45] drm/msm/dp: mark ST_DISCONNECTED only if all
 streams are disabled
Message-ID: <blxp4p56inbzlwmnsj2mw3pllioemgwmyxmu6eqo2oicl5dbth@exdch2z3kk6a>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-42-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-42-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:13PM -0800, Abhinav Kumar wrote:
> HPD state machine assumes only one active stream. Fix it to account
> for both while marking the state of the hpd as disconnected.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
