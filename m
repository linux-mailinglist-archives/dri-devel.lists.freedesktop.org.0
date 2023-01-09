Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09428663B00
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C1E10E557;
	Tue, 10 Jan 2023 08:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2AF10E511;
 Mon,  9 Jan 2023 23:16:26 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m6so15505315lfj.11;
 Mon, 09 Jan 2023 15:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TfEuuSwlBNCNhQ0V5aSlOKkpq1jL3HZF0gUtECm9ca4=;
 b=H89n6zgg9/ccQW83NIXtgWreRJ1gThUzpqTRM46UyotjgGl289ZtSeYWxfwcJDA1io
 2d2eBFAobUY0hgOv/1qLa2p0T0eDMoTT0p0odlKwnpozFdXS3DsZIyq1aAK9F66VnDn1
 lYnGuIiYLNprPIGCYmAKwEkL3GUtFMIRtzeOxEOewO9fxEn2I+ZDYxhhiXtqYJx7Kw+E
 I8iMnUaogrCKo1EmgN6md2a5m4oGq0MKl0RLMPajTXSbs2L+0mIVUglLO1YYaepiAztb
 rif1zqFMFG9YtTgMFr03o+OC6R8mkG7ZQUinGmpfnBx6eg8cgH5wD/wb98AzEOplZSHE
 KCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TfEuuSwlBNCNhQ0V5aSlOKkpq1jL3HZF0gUtECm9ca4=;
 b=GePpbLi+DJNpqoTe+gOSjS5Mfr1879OhWiHYWId1YxMKjzYGG+X1nPh7MiaNxPQueb
 vb7gTmbn1VO9eNvsDdQ7hY+xo83v2ddguWo7DEtWgpIjaT041w0q52Thxt0ERZq1PowL
 v1CBsbgV6VZEZYaLw1vbydfhts4DmmHu2shFKwPWR7sMztP+DZ7Y2zd7FfH8IoRLE3XN
 mxPPsxF5sSNzfoRrqc2F/xEysiZ64c6OKmUdQz53ucosYdJGdl6YopjurYMNF4WKJHnS
 v4xDXuLmbUpZ8v7eTdJPUN1e2GCCstMe18IRTtucDKa/o90g7JyMW0VgEBB6dwqa507Z
 2tUQ==
X-Gm-Message-State: AFqh2kpQglrIPnLpkgYD/PuoffgZisN+nkKnyuE6SooNyeVUvGa8ceXm
 dRbKoL3H9upSklwCC4Oaf3k=
X-Google-Smtp-Source: AMrXdXvprIeLayo9AFJx7FpojNZLkyqDF96Vsu4eBGirYDKXTe9iE/pZTVa/I66i+H3OiKDocm+NhA==
X-Received: by 2002:a05:6512:10d6:b0:4b5:834b:9f75 with SMTP id
 k22-20020a05651210d600b004b5834b9f75mr20414337lfg.33.1673306185460; 
 Mon, 09 Jan 2023 15:16:25 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 b9-20020a056512218900b004b57162edfasm1833530lft.117.2023.01.09.15.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:24 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
In-Reply-To: <20221207220012.16529-1-quic_bjorande@quicinc.com>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
Subject: Re: [PATCH v5 00/12] drm/msm: Add SC8280XP support
Message-Id: <167330408782.609993.5872563380257036199.b4-ty@linaro.org>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 07 Dec 2022 14:00:00 -0800, Bjorn Andersson wrote:
> This introduces support for the SC8280XP platform in the MDSS, DPU and
> DP driver. It reworks the HDP handling in the DP driver to support
> external HPD sources - such as the dp-connector, or USB Type-C altmode.
> 
> It then introduces the display clock controllers, mdss, dpu and
> displayport controllers and link everything together, for both the MDSS
> instances on the platform, and lastly enables EDP on the compute
> reference device and 6 of the MiniDP outputs on the automotive
> development platform.
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: display/msm: Add binding for SC8280XP MDSS
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9ae2a57bdf9a
[02/12] drm/msm/dpu: Introduce SC8280XP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f0a1bdf64dd7
[03/12] drm/msm: Introduce SC8280XP MDSS
        https://gitlab.freedesktop.org/lumag/msm/-/commit/39bcdb416fb6
[04/12] dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b6f8c4debc00
[05/12] drm/msm/dp: Stop using DP id as index in desc
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5d417b401146
[06/12] drm/msm/dp: Add DP and EDP compatibles for SC8280XP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5bd69fd16198
[07/12] drm/msm/dp: Add SDM845 DisplayPort instance
        https://gitlab.freedesktop.org/lumag/msm/-/commit/fa33f2aa9674
[08/12] drm/msm/dp: Rely on hpd_enable/disable callbacks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cd198caddea7
[09/12] drm/msm/dp: Implement hpd_notify()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/542b37efc20e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
