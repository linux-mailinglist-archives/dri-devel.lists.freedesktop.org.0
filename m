Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47974A4DFD
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 19:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B211110E25E;
	Mon, 31 Jan 2022 18:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446AB10E22C
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 18:24:38 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 e21-20020a9d0195000000b005a3cd7c1e09so7133937ote.6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ASaMitgkrmjvWUALYvAmhPqFdUVqEq221GRVmLCMeTE=;
 b=rqsuJkGoTMqn8mFbQYyZwrLCcvhJUqSnNfCp4U3fwGRFtz9JLNTLwsE1uydNzvyUSM
 isdT9xZQYAtg4or5rWFfGYqxH3n6p103IT0NkgD26NordbifY0CYtyFcr17pTq+jAKkm
 3F+tphZsX2ObGSnuXwjv870IQj0jpVBjfZQMEO+Eo/OrXqTmuoAYy1j6bJFKc3x1ksQz
 sqPUqZOSJIbWMhNvzIW+EBtX7h/LVLVSW25oJvvWUdRO00niabFHoCsV9GkONfeAKr7x
 Si6KxBjod6x7neUpuc3vi2Eo7WtnSoXOn0HiCrYM0JssDdzGY6MGE80iNlzi7T9XKbKd
 ILhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ASaMitgkrmjvWUALYvAmhPqFdUVqEq221GRVmLCMeTE=;
 b=DMBICZsKmMJCZ7yaLC+Dn84Y1def8QOcd7TqKB+6I7tW4sswNLF20CVMejEDkr/n6P
 8nwuRo3ok2w3zlwmUnrxAPFwJznVG2ka1uiMTB8/hCRBlXZqfjRARTP85d5nR5mKeqFF
 MmxVwin18tH9XKph3iEM7YEJsTA32akD1dME2FaQyfRTODdZQ0IXzijRTbvNMkADIjNR
 vaEVKBnu/BR+ATNTjPmT1uZ8BeGDyib6NCJNKTtFnpOfxM+FvSUVjMldZSuFLQAWBkeS
 SzjRA656sRnCD5+xp6GInwTuR5Yfx73WWF4DNEU8cnVYXsi9jRGoqZvdcNGZDjjaLiwQ
 HmKA==
X-Gm-Message-State: AOAM530gFEbOs11YwieWwOoevHv4y4mVgYcLtBPZohe7KhRMvwOsez3g
 1OHDuHyICwdp/UCDqDaxeqw+BtIV4uSIgQ==
X-Google-Smtp-Source: ABdhPJxgjyy80Q85q0aqiH2ROnY9l3ptaA8QRaWNJ6IMhnV4OxQaFvhJtYAM0/1o4A6hsHWQw7QnDg==
X-Received: by 2002:a9d:3661:: with SMTP id w88mr12285764otb.245.1643653477318; 
 Mon, 31 Jan 2022 10:24:37 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id y19sm3273722oti.49.2022.01.31.10.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:24:36 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 agross@kernel.org, linux-kernel@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, robh+dt@kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: sc7280: add display dt nodes
Date: Mon, 31 Jan 2022 12:24:25 -0600
Message-Id: <164365345128.3009281.4776568093879192722.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1637580369-876-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1637580369-876-1-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_abhinavk@quicinc.com,
 swboyd@chromium.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 seanpaul@chromium.org, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Nov 2021 16:56:06 +0530, Sankeerth Billakanti wrote:
> From: Krishna Manikandan <quic_mkrishn@quicinc.com>
> 
> Add mdss and mdp DT nodes for sc7280.
> 
> 

Applied, thanks!

[1/4] arm64: dts: qcom: sc7280: add display dt nodes
      commit: fcb68dfda5cbd816d27ac50c287833848874f61c
[2/4] arm64: dts: qcom: sc7280: Add DSI display nodes
      commit: 43137272f0bc5e05e4c4c6f7bfce017bfb9e16b5
[3/4] arm64: dts: qcom: sc7280: add edp display dt nodes
      commit: 25940788d170251373d8975d359706350818fa0f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
