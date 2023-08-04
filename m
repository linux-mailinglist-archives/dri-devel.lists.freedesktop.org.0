Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2913776FC11
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 10:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DA410E6BA;
	Fri,  4 Aug 2023 08:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA6E10E6B7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 08:30:47 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fe2ba3e260so18012275e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 01:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691137846; x=1691742646;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JAckcGQZs5adpjiStERN8wHvnjgweyITFA752Ae1t+M=;
 b=k/zVqT9T/LPYLDqyCC9ETpvweUt2i2pat5y+TuNqqYF1tBMDNfIh11FYXQb/o9FVVa
 Z3fng86fILMtLnynLJhMvopKO3aJd7glro6Umn/4/hx3H9gmVSrMnnxu1O8qANBf9FK4
 ZwC3q8qYDAT44YYXHTEK6JNosDn1/w7GHDnnoaLHvbb82xUZybjnjGBOnlVK4kCKt1ck
 td5niSI7/NvgI4SfmuG0fi69k/0C2SS3+RWVlsKOPdN1GobghuyDqc6Bqz4cPJUC7rxW
 6qRKDLz1jrwP261QDyxJhHWTP8X1jPSrSKtt1TggLlCjr18Vb818Kr/8dQ5Ft7xSH5aj
 2C1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691137846; x=1691742646;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JAckcGQZs5adpjiStERN8wHvnjgweyITFA752Ae1t+M=;
 b=b2ro8idfLjMikDtLG1Zn3/6iRxeTrJ1svqo/R12t7WzwSRzPfEuf8TivYicfDREJVi
 XfV+amNzEYSMA8vphrPapaEcG5r7kdZWhCMdkub6IAbqBGCj7B3io8R2ZeyaCCYK6Av7
 vGhSYEL5hR/J55HDVJVMzEYlhFzi+8gEjxxDBkG17U5vsSEpZfyTw1oklDhugqUxp2d+
 SqY0VTBHmBxOD5s3R9dN8ALjkcQD3/KCSlJymHu+KdZjpCbm6OpvZPMtPMSHhaTEijqo
 SmLvPXcqUO7INpuD50DEL2IZxfJcAXdOvgFnrjg4g8S5YAFPo1fzGkR3K2UGsFFh/Lbx
 6eFw==
X-Gm-Message-State: AOJu0YzhdnA2NKyeA6kYPEzwxQiSEtJEVcaIsnIp+VQbEHga+WqoTNJg
 wVJPRalgvTIF9bjP2oN/xe6RfA==
X-Google-Smtp-Source: AGHT+IF9eAaJqnipO7W5MkWr5ZEFwnTeucI4Vruud1vG7qTA5kMfrWewbQZg2JIJGVcr7RgKiLIaRA==
X-Received: by 2002:a5d:668e:0:b0:317:58a8:baa with SMTP id
 l14-20020a5d668e000000b0031758a80baamr704840wru.28.1691137846053; 
 Fri, 04 Aug 2023 01:30:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a5d670b000000b0031753073abcsm1892476wru.36.2023.08.04.01.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 01:30:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate
 HFP/HBP/HSA and EOT packet"
Message-Id: <169113784495.3155201.7552146882174275208.b4-ty@linaro.org>
Date: Fri, 04 Aug 2023 10:30:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 02 Aug 2023 10:52:22 +0200, Neil Armstrong wrote:
> This reverts commit [1] to fix display regression on the Dragonboard 845c
> (SDM845) devboard.
> 
> There's a mismatch on the real action of the following flags:
> - MIPI_DSI_MODE_VIDEO_NO_HSA
> - MIPI_DSI_MODE_VIDEO_NO_HFP
> - MIPI_DSI_MODE_VIDEO_NO_HBP
> which leads to a non-working display on qcom platforms.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA and EOT packet"
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3c6bd1b7e2043fb00ce6b622709d176609431406

-- 
Neil

