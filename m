Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805F6635B6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6462010E52C;
	Mon,  9 Jan 2023 23:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74B410E51C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:11 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g13so15615117lfv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t/mDgzPnUXxALwSc77P9Iyw1b4SZpp1LqX9N2wGlWLw=;
 b=CYaufEjN+FQO8Ij0Vpc2EDA67qNJ5J4okXNCkY+RWe41dxiaS7/Vs7dZurAKEbLHPH
 jiy5IQqVZ6nENLhobd8CsNo+CJQ76i4qyoOGGrTW3ExgwvCFE7/kbnILtY1zWQUteCy9
 ma+m5CTTawzykxmuDbDIGlpyBBh8YJFwQEFJmNfaz80iGxh48ApazuVni6MzYh+v8ohu
 vw57vgPKJCTClhjDMfne707H9OB4iQy9vcIV8EZ1e1bQngDw+5hkGoXBxhogpz2o6sOT
 ICC62oQvWFEJzpXcrNFQRtB4yLV5rR+bspK6zHPw1ST72Bj8Qv99Z0pUiSpv3v+Ml3Dj
 eJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t/mDgzPnUXxALwSc77P9Iyw1b4SZpp1LqX9N2wGlWLw=;
 b=ruy1xvW9U3yhHUC/HJtZzXMvnA1GbaXjGysLs/OQb+zPmaQCDKXYqKm46pf38OKwn0
 aSZ1Y2IPdwhSFS2bodeN6Ghv3yU3oFkoGsr+MKa3sZCeIdgcwScNLa9frfMPnKBzcs7Z
 +ToKkVAlGXjQMuN0sO88OxR7kLvVgrjw98SpOxrb7rOzO51S7BUgnXQ+iTsMp36k+zrd
 3GsgaZraZokGGbt8zTgZ7G+bwp0LCFlgnczGbFr07Q4XYROX4RDoZ7xrZkogYOgIXA5q
 HSnBk+pgMlEubPAqTQStAK2X6FepABbghyinD3R0uSCHMWVvm4U7NZxDNMAMbscMTzhc
 fi6Q==
X-Gm-Message-State: AFqh2kpy5/milm0NBriMiAVnPgY/h07fOqt7j1FE1PI+La/NtFxCtbfX
 p/FDyG9k1kzCb0T3UBYDPdmyIk6KNdAddJBx
X-Google-Smtp-Source: AMrXdXuFEjJWeYruo91f+vSduDBZf3rVjH8VWxe3VFEYuc3GkvajLlaBvU0owcPnRbMCo6wP6qXaVQ==
X-Received: by 2002:a05:6512:2591:b0:4b5:5bc1:678c with SMTP id
 bf17-20020a056512259100b004b55bc1678cmr18912454lfb.21.1673307851241; 
 Mon, 09 Jan 2023 15:44:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Kalyan Thota <quic_kalyant@quicinc.com>
Subject: Re: [PATCH v4 0/3] add color management support for the crtc
Date: Tue, 10 Jan 2023 01:43:56 +0200
Message-Id: <167330408778.609993.9217470869804308069.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
References: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 21 Nov 2022 01:08:12 -0800, Kalyan Thota wrote:
> Add color management support for the crtc provided there are
> enough dspps that can be allocated from the catalog
> 
> Kalyan Thota (3):
>   drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
>   drm/msm/disp/dpu1: add helper to know if display is builtin
>   drm/msm/disp/dpu1: add color management support for the crtc
> 
> [...]

Applied, thanks!

[1/3] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a4d6f8253645
[2/3] drm/msm/disp/dpu1: add helper to know if display is builtin
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4cb6b1eebb92
[3/3] drm/msm/disp/dpu1: add color management support for the crtc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c48c475bd75a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
