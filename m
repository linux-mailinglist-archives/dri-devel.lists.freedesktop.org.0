Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FC97465DF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 00:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE78C10E184;
	Mon,  3 Jul 2023 22:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876D310E184
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 22:54:47 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-c5079a9f1c8so2222019276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 15:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688424886; x=1691016886;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xn7vrbu5PqDTl7a51t/U7fc8ZrLjhxJkWnIqrCoiU4U=;
 b=JHDhTSNEp+9zhQtG4YcXd+5itchw7KMtzGCR/WqbH/Wo9oyj0oTY8/OB7a3E424ODh
 kKOFrBha6pLgOIVALJUWPSfARD/WeIFBBhRyZArS2vXBEk3WTZA3uMH5oO820xDX+PXh
 h2Z5gk3ut/1EnUagV/DSqR5/64A5hIlCkuNcuX1dJknUf/5JzR7SLgiyhSD/2fbIeBVF
 2BwhNXrqoEtVV6A8mxb/HGtPf1obvpvtLI90Ree+1NVNBl9J352ZshZxqHFjuiTxg3bJ
 Tt0uYqGBsktC9EUxRz+Wwu+gE6Te8sPujyWQFnBXgRxWsQMRiNHFEqClkEKSkVA9ja4E
 5rIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688424886; x=1691016886;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xn7vrbu5PqDTl7a51t/U7fc8ZrLjhxJkWnIqrCoiU4U=;
 b=UAXFDAo5U7+rwQteRIcjP9iGMxmHSqkOaQmx8oSPSNsknfi1/JprsjrDUk62zh1x86
 5haGImLlkNyxu/v2zeleWnxrjrzG1fVXYDdMud77auyhUku4U/1wgLpzGwfzgZsNgd4E
 RvspgaexQXEDOazuindAJpTi+UF0fpJ6daUD3UiWQ872Bu2TDthZk7kTx7W+0jOxdLYE
 dem/LEmJK44NtMNEl+MhLDDQu8puVjoS41RCi+GW50zpPyX6iMuncr6vGaZxlqlEb45y
 97Tdy30BeF33Cv6QJNalMY6PDFvlHk6jDd7SMS2pxeTa2FhcH2McGw790hvjqz5rcIG+
 SV1w==
X-Gm-Message-State: ABy/qLb02ihLK8Uj7D0sJeVteE52Zgz2ZWpUF3SBgUGwLJF9no3AGLZa
 ZadHFU7/smZAKXXatUzBaq+40W198UFed9dWEg70mQ==
X-Google-Smtp-Source: APBJJlEouuF8/0ggK2G6w3HPfixNJv2NGicX8j6nANc49QLXr6neO8qeecRq3vcwS8pbfEtDLyvY14QIupaAIiJQacY=
X-Received: by 2002:a25:d0e:0:b0:c19:d3e:f629 with SMTP id
 14-20020a250d0e000000b00c190d3ef629mr10625615ybn.58.1688424886624; 
 Mon, 03 Jul 2023 15:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
 <20230628-topic-refgen-v3-4-9fbf0e605d23@linaro.org>
In-Reply-To: <20230628-topic-refgen-v3-4-9fbf0e605d23@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 01:54:35 +0300
Message-ID: <CAA8EJpp3TaNikf7=y1AS7vM99jHEKYS0Cmy2AbqUAx3DvYmovA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/msm/dsi: Hook up refgen regulator
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Andy Gross <agross@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 3 Jul 2023 at 21:16, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Consume the refgen supply on configurations that may use it.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed--by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
>  1 file changed, 2 insertions(+)

-- 
With best wishes
Dmitry
