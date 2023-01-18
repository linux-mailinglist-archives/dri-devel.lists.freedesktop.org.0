Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D6A6710B5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025DB10E62F;
	Wed, 18 Jan 2023 02:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319DA10E63A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:34 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ud5so79873065ejc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJFVta3hfZRXKx31flRwp+6NT2ffWbzRaGmZqjFNr1c=;
 b=iYjiINA+JJ3kTzl1Gteh2w+mbXYZ9cG0fXexodYl+c+HMeAU3ijvCw2l/9A6UII/+W
 zk/r1pm7o/XrXklag/NO61lvSN+4jx5Vrk5yezpWjXvO7SWMRQfS8lM6BocW8giJG4sD
 JfPwWiVAtgoWl8NDfz4a+injNOjlx7/FRmOZUCJ4wJKLZQEAdUMs3n0OYMBPJ7PdcM/h
 NFQOIdvPFVszk9XlGUGxuK9Z4avY+cstBvIGRKohtA9lVmLIhnOyu45FJ5AssCqcxNDx
 FNYTjpSWV5OnvSgUnk56GRe4BQNmpyjtlyndTYZF1QER+2ljc3YFdpbq6dH4Wm88OdQ2
 dRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJFVta3hfZRXKx31flRwp+6NT2ffWbzRaGmZqjFNr1c=;
 b=2jzixNDvfudAzn/e7ZF0VkXQ2vKOuthdqiotzgtb4WoA+si1pmygMGjnRb4GWLD+Ko
 nrX9Hj8CfvjFDKn+d0G/W9N84nyl+90kJvmqCdrrepEDCAMRwhhEEuBaRPSVvWdnhY95
 ypK0k7j0P4x4Ewel+3Q82ZeJnTPS/hQ6h4YcooOKH3uLDaskAaMAs0tYHb/b98fBeJqa
 Y3kchvQ4dG7QPVB+gZyAAhQ/+06TkMqxk+S90lZWWy1Y5xUxGdhsJKX/p6PobbSXP+f4
 I48nGgo7+90q38b7ylXtjpPzDD63I+xQRipz8I0ALSIydGdPlIWxsY7hLP/fb0Uyp62g
 vAAw==
X-Gm-Message-State: AFqh2kqUhYUuTQ/n4t+e/CSffwelpHJJJzueTeCZsfGFQ4kluZJIr7ru
 F1GA63dOmRyp29Cv0P3SBmT/AQ==
X-Google-Smtp-Source: AMrXdXuMQsMdEybEvR86mCX/ybN1G/aZe55D3EdZwtkengkxeDuDvAfBx5UmZHdzFoQbX3i4PvV+WA==
X-Received: by 2002:a17:907:9b06:b0:872:f259:a7ea with SMTP id
 kn6-20020a1709079b0600b00872f259a7eamr4989597ejc.53.1674007592812; 
 Tue, 17 Jan 2023 18:06:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dianders@chromium.org,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] drm/msm/dsi: Drop the redundant fail label
Date: Wed, 18 Jan 2023 04:06:14 +0200
Message-Id: <167400670539.1683873.12609021672778272128.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111011006.6238-1-jiasheng@iscas.ac.cn>
References: <20230111011006.6238-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: marex@denx.de, vkoul@kernel.org, sean@poorly.run, vladimir.lypak@gmail.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 11 Jan 2023 09:10:06 +0800, Jiasheng Jiang wrote:
> Drop the redundant fail label and change the "goto fail" into "return ret"
> since they are the same.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Drop the redundant fail label
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dc57f09acc34

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
