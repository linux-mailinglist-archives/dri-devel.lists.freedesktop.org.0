Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDDA4A4E13
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 19:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A08F10E393;
	Mon, 31 Jan 2022 18:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6BF10E393
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 18:24:40 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q8so13842691oiw.7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r9mPaFEJk4glaPEfbstkf6mGQAvnXTOz75yKFh769Xs=;
 b=JDl52j304GonUugjmEz7Oj8bVrx7wZrIhVuZL8MQTQFuL/8MFLOWZcd/OaTmOicGVM
 824qZZU1lzNgpSPyKP8OVtZyrtC6NXu4WzFAm4zX/p4zjsWKbGKCmlzQZZmt5THva4bj
 Siy/ZQyep4uJp7mMKwtyshkyo761rcOBDf0JYn3bGDmLmlllLNpAFdUlJN6bzrcRzsAu
 OcLwjwA7iY8UYptOVr/wqI+Z8ixONiaFXDa4jkPOnn1KTdy8JG8bZ8Qea4rIVO6oPCIl
 MUNHoHOW+cjY2YzosAlC/gpuT2/ut7qLxpQIQWg5UeEG9jRiuQuKwV8ZdHYQmsBPx5gu
 Y9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r9mPaFEJk4glaPEfbstkf6mGQAvnXTOz75yKFh769Xs=;
 b=ZkfcMi9ILDiP0SGHG43yO2wIJxDVcdah8Ozl5CGX8yY7x2WJ+UmGzO+7DrubO8Iz0R
 4QcXwP09KtmQtZ7qJ3YucdF1WlojtQb8NSNOYUv6Oq+WmIdysBmhXK8PsqwKZ0CwbOvO
 BsMGsxKcXo84Ot1hIL+Fswog+6q18wuis7rtNEjm4qZw3PNDrRRoi/TI3HPKKsqCMe+p
 SI3+Zudtm3AjycCYzmU/2tJumxehaT/AesZqWa0g/6eRJnyZa1V/RSEzyO04jxepcltM
 CIel4yyHvdA+WIs5q9j9yHZZ52FTrzP8TzGxsKQs9LRrj2NrC0HWNG9iiSUlxhcDAoDR
 3Riw==
X-Gm-Message-State: AOAM532Z7kG/2ncb9AYrYna74/ClJVVxvzS/p0vSyMM7IxIo3HsDt+vo
 nVenJCp7tqR7Fn5+2bzeKd9ooy+QU/MJew==
X-Google-Smtp-Source: ABdhPJzRbaJTu1CP/oi40yx3UKog6K9CaXVPNvF0Yk99zoOH4j6nXYBHdOpoDVHpkUDPo4bBKQ8nsA==
X-Received: by 2002:a05:6808:bca:: with SMTP id
 o10mr9686870oik.58.1643653479922; 
 Mon, 31 Jan 2022 10:24:39 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id y19sm3273722oti.49.2022.01.31.10.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:24:39 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 agross@kernel.org, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] arm: dts: qcom: sc7280: Add display DT nodes for
 sc7280
Date: Mon, 31 Jan 2022 12:24:27 -0600
Message-Id: <164365345128.3009281.17096332459054539007.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1640361793-26486-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1640361793-26486-1-git-send-email-quic_sbillaka@quicinc.com>
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
 swboyd@chromium.org, quic_mkrishn@quicinc.com, seanpaul@chromium.org,
 quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Dec 2021 21:33:09 +0530, Sankeerth Billakanti wrote:
> Add display devicetree support for sc7280 platform.
> 
> Krishna Manikandan (1):
>   arm64: dts: qcom: sc7280: add display dt nodes
> 
> Kuogee Hsieh (1):
>   arm64: dts: qcom: sc7280: Add Display Port node
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sc7280: add display dt nodes
      commit: fcb68dfda5cbd816d27ac50c287833848874f61c
[2/4] arm64: dts: qcom: sc7280: Add DSI display nodes
      commit: 43137272f0bc5e05e4c4c6f7bfce017bfb9e16b5
[3/4] arm64: dts: qcom: sc7280: add edp display dt nodes
      commit: 25940788d170251373d8975d359706350818fa0f
[4/4] arm64: dts: qcom: sc7280: Add Display Port node
      commit: fc6b1225d20de0298a7b0e52eb3843d71e1992e8

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
