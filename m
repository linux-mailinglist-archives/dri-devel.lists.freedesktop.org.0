Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8A055BBE5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 22:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7223310E449;
	Mon, 27 Jun 2022 20:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833048923D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 20:03:51 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-fb6b4da1dfso14332094fac.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 13:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uBL8T3g3R0Pq3whUkb/j5eJUSIuSh7+BTEsAjLrbttw=;
 b=tByXVs4oLqp70UnWrAelQLgAZ02AjGHlRCOv88PrYBSqr+tpiHU5Q+f/xG7zbiFenC
 tiSrYxs9TC477G06hNDlrjxga5jvL580iaOVQGS6EHHO8M55FCPlukXVJTUMpkwdzO5P
 bt9xGTTeA+6oUcHAnORPIsaOH90m5W/HxuLc0sGWNLScVokcy2cOBVkXLeqZNkhZR/HJ
 +9gIG3dMRBkp3pA91MTASZcI6SxfpD2vHTSBtwEsD9C/ME9MWc+SZNyA9AzpAgFu3TGm
 QNnpCpBGzCQzCXk0nqqQ1th0UuAX4myDZ9b36KaYhbKCKvwhJMxcWNugDfPdLOUI5ira
 AR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uBL8T3g3R0Pq3whUkb/j5eJUSIuSh7+BTEsAjLrbttw=;
 b=C0I4+x4+j/U/QkAwliHf5H7R/LznP/2YvVH2vfMCok5WcHvbOVcIuitxAPv4iJhyna
 Lwyr0LQZnaRtQ/xUM6nDZdqDgmwJRFZOrq8ppNaMjRdWHWeo0dAMQk7u6T669TsVIHIf
 LZ6A+RNl+8WLAYK5S6buJIK7HruTm+0YIk7o0zqyODeSRoAceX2TrWmF371BQwtmVdao
 QDZm/hD5JnAbk7lCM4hqQQM9N+lbHuJrKknXN1tMSJbzFogyStRYL4doLRtltbn9GWH9
 /XmpDnJCF6mu9tIPtX9dBEr1rCI5aouCTaFWTI51pS00ERnY/A4zhuI36VzPlfg1BIy6
 TASA==
X-Gm-Message-State: AJIora+FifGMFk86CC+ZenoqRfyVqKwDK/jSWBGnyRLpbDUL5tqJeENs
 fgamsH5PRRARecqSiQNvGN4OmA==
X-Google-Smtp-Source: AGRyM1uyXxkCopnKmMrwc7YTmNhF77XP6v4iLuNzB3mcEoxBcwwNkqmrJxoiPfBIjXYpp1D8SYTD2Q==
X-Received: by 2002:a05:6870:23a6:b0:f2:2dfd:d6d5 with SMTP id
 e38-20020a05687023a600b000f22dfdd6d5mr8502700oap.100.1656360230798; 
 Mon, 27 Jun 2022 13:03:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 13:03:49 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Subject: Re: (subset) [PATCH v7 0/5] Update mdp clk to max supported value to
 support higher refresh rates
Date: Mon, 27 Jun 2022 15:03:04 -0500
Message-Id: <165636016347.3080661.10709114868531823730.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1647919631-14447-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1647919631-14447-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, dmitry.baryshkov@linaro.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Mar 2022 08:57:06 +0530, Vinod Polimera wrote:
> Drop the assigned clock rate property and vote on the mdp clock to
> max frequency during bind/probe sequence.
> 
> Changes in v2:
> - Remove assigned-clock-rate property and set mdp clk during
> resume sequence.
> - Add fixes tag.
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: qcom: sm7280: remove assigned-clock-rate property for mdp clk
      commit: 5241fd7fee9bee0cffa33f6d074194e94831e467
[3/5] arm64: dts: qcom: sm7180: remove assigned-clock-rate property for mdp clk
      commit: aa4ae511a760e66f22641d9b9b6052b469df3c10
[4/5] arm64: dts: qcom: sdm845: remove assigned-clock-rate property for mdp clk
      commit: 0b24829fd74cf954b3a02e9e4c4da3c098c69fbc
[5/5] arm64: dts: qcom: sm8250: remove assigned-clock-rate property for mdp clk
      commit: 6edb323837909462d493f22c07a38a23ef44f944

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
