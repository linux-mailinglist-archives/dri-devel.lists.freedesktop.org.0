Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6675663B02
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D0310E559;
	Tue, 10 Jan 2023 08:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BC610E0E4;
 Mon,  9 Jan 2023 23:16:18 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m6so15504832lfj.11;
 Mon, 09 Jan 2023 15:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2ILC0s/EAU+DV83P6Wz26LirhdaLi4CEI3lPCyUm7s=;
 b=R5hdRClHSsFgrLu08jbXwr8RDUQz8uRVSgPGqGd/Q0bf3I7UMc/Bpq8489et9duwNv
 fvhSTkvbyLzrCFCNmecmO3KYjH9BVN1mhlyGsfzZG5LxAvxkg/5OmW/uTwaGltlQxG79
 XMQmP4QwHF+1dJbVzz+b/wvhWyA70LkTnjhdEB8Yi0Unxm74OtIXM8pkk62IxTQ2UGWF
 CC9C8djPLnL5uBe2OXkqiBtYtW2qg5vsMwJu0u8GgqQsKHHeJFm4ebhcLL5GYtAfPghq
 outVRhhrISh85kgdJ50lxP3uze/PJnhbmCTuNILAODeel+M5f2UkZIGkjl59Idxwqkg5
 IUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P2ILC0s/EAU+DV83P6Wz26LirhdaLi4CEI3lPCyUm7s=;
 b=2Vm5vT2BrCi6VqMxC74iHFrWHZwXO89fzkZl6A2GLkn/g1tNlSuotMW78v2YBbj/kZ
 Xbz9n0pxaidIQ1FJYXja51QlFgPnen5X/yw9Z/c2y9hfMGktfjs86qODEI36OIusz9dx
 MeVwucwTBVp7sKj009KZpknKaELKgyN2gyY/Ie4ayHyDVb1saiV9tryyY8cN8Ixdf9Zc
 75HVmyA+cPJBlABfxkIaugcGHXLY1Xyyp6naieoVFUcn262rD1blXpIoRsPoA7cfCIwn
 3wO3p0Dcv3fRalooykpbq4oPPXKC2hv8xa1G2D+jiLO2dUVlLo+PNZO3ap0F/rOojKBL
 T8Xw==
X-Gm-Message-State: AFqh2kptAa5fmWdF2lLzdmPNod8GUrhd73qQQDIgLou/zsNX1BsXjcSe
 1aTgUGvZFT3uMHxYjFspJg4=
X-Google-Smtp-Source: AMrXdXt+4HvEAapKTb53PbhYPGBm9J7HGYKBL4awae8GqqtQDzoGqThLIPrGSJ+EzVWhuzLjCrkZHA==
X-Received: by 2002:a05:6512:2a8e:b0:4b6:e4b3:d82d with SMTP id
 dt14-20020a0565122a8e00b004b6e4b3d82dmr17401516lfb.7.1673306176410; 
 Mon, 09 Jan 2023 15:16:16 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t18-20020a192d52000000b004cc66d4419asm1846562lft.39.2023.01.09.15.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:15 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221229100511.979972-1-konrad.dybcio@linaro.org>
References: <20221229100511.979972-1-konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display/msm: Add SM8150 MDSS & DPU
Message-Id: <167330408777.609993.10625838053126899594.b4-ty@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 29 Dec 2022 11:05:08 +0100, Konrad Dybcio wrote:
> Add bindings for the display hardware on SM8150.
> 
> 

Applied, thanks!

[1/3] dt-bindings: display/msm: Add SM8150 MDSS & DPU
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9ffbefc1553c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
