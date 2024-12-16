Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4919F38F5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 19:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696A710E761;
	Mon, 16 Dec 2024 18:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Lrp39gUs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EB010E761
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 18:29:26 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-6ef66a7ac14so51406427b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734373766; x=1734978566;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=GR1waToDgrCuopV4sJNgGblNy716dPbxfdvbcwPcWso=;
 b=Lrp39gUsXVc0402ZcG84uyI2Dm4oHIXIGtoZLUstCNmeK5zAB7O00KP1a47DMLs9I4
 aXfdKMwiE74f4JrV/f3mKt9AcVZrGTpETK2GeMIGKba64dc3eJv3sFWUos1+kFf+K5N4
 k6sSDD0AhE5Cx7Q4qT93TinDkJ8fB7uTVKpfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734373766; x=1734978566;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GR1waToDgrCuopV4sJNgGblNy716dPbxfdvbcwPcWso=;
 b=jwCe3/PdkuYWyXx2cKbvurS4NdEVwzMwdHFUKdESrgLYrrZ5wjMV6uoTrQCWoNcK/k
 3QCWKiAKP+D81+PugilbkU/iezeFvFY3CJZJ+sY9yyHoDAuMFog3mTwJBAdV2zyBtYrm
 PaxpEn6e9pYN41ScW9XBwWUC7KCn0o/ITomsz8rLW4UR223sSqWykMM1Y8J+AawcZlri
 4VEhhV/F9yieQHlPdriIW5iPT/cpewo/sDYFzG02T1+04DDA1sjwyU8PfgblFBLuH/KK
 QMnuFQ+VlAMOGawm3HE11s8USmGhTvSFPnEr8NyBHnnaO3cD8FL9+PwhvBsM5OqeM74x
 E4QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1u4jylZ/0Cbc4QtNHYKHYy1SKyBra8tKlYB6jGORseNLmfy62viGVwU+JQRkZFunqUW/5Q+sNkKE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLVNAfcQJN7dhlWYw26obir6++Q9A7oXUGQxM4b2aQOtm/7rjd
 lKwWZZ9vbiTqHqE2KTbTG9GjroTkNGC8fsQ+ayTf1PUwXPcAJDS0lE8H0GTm6phB92z7rkuKmrN
 P90uoGklCLRLhKA782E5c47DvSOIBF5jzj7Dj
X-Gm-Gg: ASbGnct/7Lm0K60k6K3UJlEeI+stmZoZf/pdlaOmndqdE1Evbo5mEmkZLbN/6ZlPOEM
 UAVMR8ILIGoB82rk3JK+FM3Ip+JX0gf9NpjbxRbr9eKS/tUCIUcYGEGwWhS/I+D6Y1g==
X-Google-Smtp-Source: AGHT+IH1rrCqzyUmv/+ovkxDTTujqBxDtcReQhBBlksOzIUEXVcbUlAtrkHnUp3TKKoOBpjZ9dyQODPY9A4b8x3dvxM=
X-Received: by 2002:a05:690c:48c9:b0:664:74cd:5548 with SMTP id
 00721157ae682-6f2bb9a5b62mr5055197b3.1.1734373766242; Mon, 16 Dec 2024
 10:29:26 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 10:29:25 -0800
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-6-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-6-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 10:29:25 -0800
Message-ID: <CAE-0n527-TKS2Y=SsmALOKrx_QrzT4=j_dTyNgk9A_RDQzVcWg@mail.gmail.com>
Subject: Re: [PATCH v4 06/16] drm/msm/dp: split MMSS_DP_DSC_DTO register write
 to a separate function
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2024-12-15 14:44:11)
> It's the dp_panel's duty to clear the MMSS_DP_DSC_DTO register. Once DP
> driver gets DSC support, it will handle that register in other places
> too. Split a call to write 0x0 to that register to a separate function.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
