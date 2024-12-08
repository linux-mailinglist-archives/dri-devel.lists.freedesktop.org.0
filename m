Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4D89E8497
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 12:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCA110E19B;
	Sun,  8 Dec 2024 11:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yFOmHsDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79C910E10F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 11:08:04 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53e384e3481so1531854e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 03:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733656083; x=1734260883; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VB2+beIqVz9NLf8laV1xplvCTzTAKoRYTCewp8eMyUg=;
 b=yFOmHsDoiJ8hoq+ej+FCtdCzJKuQS3nsZX6XsSp9KIx7tRITQBweRni5DNWN4DaEVt
 RzlkvBnYQwiVkD/bfmJ37Hq/BwdZafB2jUMkA9rZKJQxJJqDMuCGaUY8nPA3XY3/X1Sp
 D+vZH+fXdoyVmxPKB+VqsZkeekQ6qx1iKyN3WNIZPgqgHq5O5kKEtNsu42hNkwx2S0fq
 X5omef25iI5QuX9/+NCfwC46S+wNvXaGtwB0cxw7Zc5vvlj9PdvLEMGCGtxbtcajuk/0
 BH1XfE4CZimQPLL9BOjlYPshU+TM8lP4SwAnTHe/JNeYlHG5IgNkGu1IqygdROJCy/E1
 93tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733656083; x=1734260883;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VB2+beIqVz9NLf8laV1xplvCTzTAKoRYTCewp8eMyUg=;
 b=coSlkcsLldqbuHsJN9SdFP2y76pCEZxpRcPdHG9ebTvamA5UE2XmgBbIOhnv9AgEUj
 kPqJV8elP1TPsYAUtJZpydVDvOOJLOekLHSBUtiOy8SBo45AGnbxBn4QRrRDcV+7a2J/
 0Y5ZmpXvpJG63/xqQc8uFAJyBi5job8tkWDAzn9z42FCpchmPUHuc90BcBY9GZ0NWFvp
 Za6Kq/w1IgPAoVYsjFdUxukt3cDXj5gBiSVITm+YQC1/3noq2+o+f2vwKa87BJbYfF4m
 Y4bdZI6SkWZBmBO1EcnMsgmkUTLQ7+M3uVyqjIhb3kcSsfg1g+vy7x//Caz/DelwTrTy
 xYOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjHF0RblK20RpnL3QeaZw1c35G6NYDb+oJOvbqsre8XfdpeXzScVccia3qQb+kBW9FCdYDUpsyCLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaNclx670+31Tkh7+EhAcV2CWcnONFjJrzVPG9DTDHCgbrLAH7
 Dp5O4X6ILfaqTaCnW2Sr1kzpIQiwgf9sBivlzbNwaCMS7K60r2l2PN2U2uOExZw=
X-Gm-Gg: ASbGncuAfIJAejeZzfORZ2PPrHJd9rjDx/vnrVMBJj9veUkz7FxBjUyguzWe07Ao6NB
 rAGovxtMBIGdDEH1ePmpftQ/hdvRa7GzS/phpH6kH5WHefXvcBqkKIt+ST+AskbMeqZV49SwUjD
 4UxClNNisvIkKkRcpEPThti08xs8LiKBUGjvUUG8rGlkin0kD7XH3lcgTSTQEhJsNozt4otzytX
 UfUji/qeVw2Hwx7RI1DP8aGjC2jB6ELzm4Fod6FuIVDepi/7j+FGHR4D8cq3S+g9f7iK8dk7pvF
 XUlhbg5Upw/suMHVImESSB0g2E7erA==
X-Google-Smtp-Source: AGHT+IEPwz/DlmKiUGnz4YB99+xhYKrQeR262SJLPjLUw84SmBKtXiKNCszuVXMjeWuRzdQf1Pt2pg==
X-Received: by 2002:a05:6512:398f:b0:53d:e4d2:bb3 with SMTP id
 2adb3069b0e04-53e2c2efb94mr3986572e87.50.1733656082939; 
 Sun, 08 Dec 2024 03:08:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e377f3ba3sm648212e87.187.2024.12.08.03.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 03:08:00 -0800 (PST)
Date: Sun, 8 Dec 2024 13:07:57 +0200
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
Subject: Re: [PATCH 12/45] drm/msm/dp: make bridge helpers use dp_display to
 allow re-use
Message-ID: <zdod6f2a6c33wbjxcw2kqg5mb3lkedmfxq47lgjxzxuul3lcsb@elka24uhxyw4>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-12-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-12-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:43PM -0800, Abhinav Kumar wrote:
> dp_bridge helpers take drm_bridge as an input and extract the
> dp_display object to be used in the dp_display module. Rather than
> doing it in a roundabout way, directly pass the dp_display object
> to these helpers so that the MST bridge can also re-use the same
> helpers.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 34 ++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  9 +++++++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 49 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_drm.h     | 12 ---------
>  4 files changed, 67 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
