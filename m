Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931EC663B09
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAFC10E562;
	Tue, 10 Jan 2023 08:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F54810E0CF;
 Mon,  9 Jan 2023 23:16:21 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y25so15528547lfa.9;
 Mon, 09 Jan 2023 15:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpASIlrn94h2kw47h1c03X9cqh5FWCX9FeHma7sBwdI=;
 b=OddwY0fZ5A3JB6m4rY6uFid0LFESPpUOayVuoldTW73tVR7xTvqwzsKsMlBAhppa2K
 3JIAQSrlK7QcSTSSpLzEXa6XGmlpAE0sbMKqsRkEnEmQpZv4NYNdrq97WlLhg1zYr0KC
 nXQkvyhSFtFD+HabUcSL3soa36aQ32GdOgAwZtFn/ZxQR4TOdvdSxTGGIyBXYWXQbYO2
 vOAKxQmlxVRjoWwbBMnGfTQhS1rkdWoZDGYAo6uclgM+IoSSQZlw4m0HPXciDTgtsh/X
 hDJhhe5MLSujIH3UFLGqmd3JrPU0F9cAqDCZd/ojQPnn4rEu4eWr9DFv900duiOUwfnx
 oWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kpASIlrn94h2kw47h1c03X9cqh5FWCX9FeHma7sBwdI=;
 b=tmyXl2hYfbYy995L7AsBtzHK/Tamvyh9x9Sr8XCSPLVARHOdX9FRbCqApqlYngf1L9
 OkYTxNILgFzGCHHf0KZ2b/yL4M7KJbOjY6qoMwxfBS1ZyOushtnFPgulpPY/HeNdSjvf
 kCWKdkns/lo4Fp5k9dLYz6sTe9yjK6pgDtb6lIzgf69bx3xd171GqJOR/cb3MZHYYkT3
 7Ttsm3s6uYMES24sK/Bacs/GlgWi8v193OXsGwSMQt6Eg6+lajvbijS4GmcQ+4LyJdQh
 8JH3gAglj0adKibcjPQNj5zjGjsNyi9PavX4VGfZyKkbhfCXcNk3ULM8b6KeqfYUBzw1
 u6VA==
X-Gm-Message-State: AFqh2kq5kEwYFfyyi0bSWGY+o/EhniLIjcqebrxcqDd2wiIRWOYVXruo
 zUrWo4BNxwKxU8g4MZNMIL8=
X-Google-Smtp-Source: AMrXdXu5ikj2pAGUB/brE8c1ApXc5qFSMTIK3z7H9KCdu4bmAuUGQkMHt4a6xrXKgb5sLMG4R/alPA==
X-Received: by 2002:a05:6512:e82:b0:4be:a3c8:dc5 with SMTP id
 bi2-20020a0565120e8200b004bea3c80dc5mr18607851lfb.22.1673306179533; 
 Mon, 09 Jan 2023 15:16:19 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s6-20020a056512214600b004aa255e2e66sm1823097lfr.241.2023.01.09.15.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:18 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: phone-devel@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>
In-Reply-To: <20221121222456.437815-1-marijn.suijten@somainline.org>
References: <20221121222456.437815-1-marijn.suijten@somainline.org>
Subject: Re: [PATCH] drm/msm/dpu: Print interrupt index in addition to the mask
Message-Id: <167330408782.609993.3753799611578677856.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:28:50 +0000
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
Cc: Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 21 Nov 2022 23:24:55 +0100, Marijn Suijten wrote:
> The mask only describes the `irq_idx % 32` part, making it generally
> impossible to deduce what interrupt is being enabled/disabled.  Since
> `debug/core_irq` in debugfs (and other prints) also include the full
> `DPU_IRQ_IDX()` value, print the same full value here for easier
> correlation instead of only adding the `irq_idx / 32` part.
> 
> Furthermore, make the dbgstr messages more consistent.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Print interrupt index in addition to the mask
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d45e5744ab39

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
