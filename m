Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0EA8022BC
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C8F10E18F;
	Sun,  3 Dec 2023 11:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A02010E10A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:35 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c9f85eff28so8055071fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602793; x=1702207593; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YmhXK4vL3E4nWjMPFEArxq3v2irEKwOONy77m2lg+qc=;
 b=qGSyj28PiFrZ1aH9YC+PHIYtvfEFEz5je+D7j7E9+ZmXhuYkLNn7ohCWzMRwKrWh0k
 QfwXtYxJvVWqR54RO46pihrcSKhnmPM/0kSCO2R13l7FuLL2i86L7mqQFmhLi5es0Kby
 1qAyNR9mriTjfuvRzcsX0C9n7q7CnsWaxUqxryA6u0r1WsxOfFP95aaIEQF80roc2+fV
 pB+Jm+lCqdTk97b0GNcLFVSlxezQYvbBxSK9ZVKOGDaXnrynmTqgJZxhjUubH3t0hL+Q
 HNe17heNZnVB/kVYuLmehJ9U5TYaIGUdSfWcxOqv9OtQvxyJ+n2sed/ZOqAUqF78oFiT
 /VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602793; x=1702207593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YmhXK4vL3E4nWjMPFEArxq3v2irEKwOONy77m2lg+qc=;
 b=DYQTwTSnLdCJPpWYSPxi6npP4buScPCTrza2DT83DzSDbbvximviM9QekXEEAWZZhk
 lrFgly3c0Il9C/P2TxmwryJGps7UzN3FQfah/1W0WKKGBtA89JnhOx/x5LDsxkuYQ/eV
 KqULH96Blhg9burzpuU2OY9p08Ql1STzO70u/EavmjtOLG8fwH94rE0DurHjJ699/XTr
 BdxoIjoIoWS4EED82DwRd8qtdsWgtoDFx4L+1wdFwi3Fo46IGWE3ybL9YEqf55IpCUX1
 T70OIWirzA+7AEGkaVdKewdOPedu1yg2hRV2n+dNndwfouAlxnMANHYyzD5aANCx8acG
 2u9A==
X-Gm-Message-State: AOJu0YzYWQJYXPeZ+1klbMZr4wN4ZriYNAXG7ghDb+3k88oAcOh4SN8Z
 hi/XFSQQwPklQjIVg9VVpxNW2g==
X-Google-Smtp-Source: AGHT+IHlLYyyC21TH0FtIj5NM4vWDxanSGH9w8egAW9vnCLxMxgkRyfvr22YsKy9g8OxxxGBM7H5hA==
X-Received: by 2002:ac2:4244:0:b0:50b:e4a7:93c with SMTP id
 m4-20020ac24244000000b0050be4a7093cmr913587lfl.11.1701602793049; 
 Sun, 03 Dec 2023 03:26:33 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: add QMP dependency
Date: Sun,  3 Dec 2023 14:26:17 +0300
Message-Id: <170160265547.1305159.16031924969779572625.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231016200415.791090-1-arnd@kernel.org>
References: <20231016200415.791090-1-arnd@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 16 Oct 2023 22:04:03 +0200, Arnd Bergmann wrote:
> When QMP is in a loadable module, the A6xx GPU driver fails to link
> as built-in:
> 
> x86_64-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_resume':
> a6xx_gmu.c:(.text+0xd62): undefined reference to `qmp_send'
> 
> Add the usual dependency that still allows compiling without QMP but
> otherwise avoids the broken combination of options.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/a6xx: add QMP dependency
      https://gitlab.freedesktop.org/lumag/msm/-/commit/96ab215b2d5e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
