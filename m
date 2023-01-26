Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D32567D4EF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2811D10E988;
	Thu, 26 Jan 2023 19:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767E810E981
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:18 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ud5so7712075ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qBWm6FSmlOHy18aqhTxXmGS8/TFLM/DG4o289iZ6hFw=;
 b=HCJKjiq3GNFduyzH2nOCkRTh4dBUXS1OY264zhC/gkzdTkQWV7uFD3vkchrcHYlATa
 Qt37nLapwe+NljxPwQHFQSXMwzgF5mtYvWtyoICGRQ92zBUqKfR6Sz9wz1tR1JO1qJUj
 s8FZt/KQEWbY9W9kpysUN4uYWx/7mI0LtGI3bIMc8kx7coqnndMtXRXwqKlJjaaROEWL
 /GPqrJap2htFMmHotLdvkyvSliGNVweUwJo/UHYHb+CJfdaTDA/JQ1lAb1ovgC+AMrxY
 b/dCmIdiz8pehIdNgDfwHRACxRNSOKna9JlqUV7gdE18CTAhfAgP7r/tV6Y6D8y66+mx
 yhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qBWm6FSmlOHy18aqhTxXmGS8/TFLM/DG4o289iZ6hFw=;
 b=RDDnD554bJaKrhmxJQH+gEYxQAqR4dl2GxlVS20vqVgN/7LFfNW0fqPZfk8PupUJg3
 b51YlT/8OY/XHFTcRljsGsQe+SOtWVSjJnBFZo9CqvbUIUm0WwZ/BeZC62dT0E48x4IQ
 ndHeCFvyk3qvEvYMLcijwa8SEu/9XMvTDfRu37HO+mRRNrOqJgZsfElZf74whWAfjVc6
 d3Fc2g7zGYeYb6xtdN4beIKa2+rUkFQzDpk3nmAPkm2CTWGpVjMKyfwmUpwYWMfHipN5
 AENlxU+xpjy7LZtQGW6me9DYB1alIvcyABKFeIgrIv6TrsMWdID8k+7ShoqkTLxzqjhi
 wg+g==
X-Gm-Message-State: AO0yUKVtRNa9qZLMx1yx1dLBEX9eXRmodUqV9SpF5Cjf8w4dua1nQuK3
 zonRzbStGIG8hFaSHxh6JmNUdQ==
X-Google-Smtp-Source: AK7set/rsuFfe/cwMZ3ZuTOvMPjnMOP/rgYnI0ksZLx+5S5MuskuUnGWpyCs2aNXPzkZpjFYgDfRJQ==
X-Received: by 2002:a17:907:8809:b0:878:5859:b019 with SMTP id
 ro9-20020a170907880900b008785859b019mr4044768ejc.48.1674759678131; 
 Thu, 26 Jan 2023 11:01:18 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dpu: add missing ubwc_swizzle setting to
 catalog
Date: Thu, 26 Jan 2023 21:01:01 +0200
Message-Id: <167475959091.3954305.4158185883745972292.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123062415.3027743-1-dmitry.baryshkov@linaro.org>
References: <20230123062415.3027743-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 23 Jan 2023 08:24:15 +0200, Dmitry Baryshkov wrote:
> Use the values from the vendor DTs to set ubwc_swizzle in the catalog.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: add missing ubwc_swizzle setting to catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/31c318051040

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
