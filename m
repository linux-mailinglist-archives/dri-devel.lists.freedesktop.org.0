Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE81E8022F4
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4C610E28F;
	Sun,  3 Dec 2023 11:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E224D10E27A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:47 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50be24167efso1569867e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602806; x=1702207606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9QBSxCXVzh9rXO4c/SO8NkEBuWtu15Ry8njynJOrfsY=;
 b=b6kroUukW5hVJ4+dUpnLEGZvkFZz1Lc2LJi8H9LY54iXsGlzbguSn7RBLJ9bkNs478
 jACdKIxMpNrQtc695541p9Q76a7KqfcLXbpLgWoR//dHWcUTJxJo3hoatTIoz62i0F0g
 RZHqgk8hRAusHsrQFoG9LoUWolf/Gt1GJwpAzpMifc/qSX01WgX2KkBHzfW/7yWUpLMP
 tzYjbtGzrZJYx9k5foL2MlW0St7XzAJ1g57OGrbz5OwX61JxTdoguw9dlHha10BqydJl
 nXflzB3j7uLCIllD6TYTMIDDkgCvJ2jU7/Z15G62XuXRBC5YOK/oVCK0CrNMchSfLIQX
 IU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602806; x=1702207606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9QBSxCXVzh9rXO4c/SO8NkEBuWtu15Ry8njynJOrfsY=;
 b=P7a30yAi5M/303bjtDm9LpMwXwJf68yv7Bnfp2Pg7TWjdNUbL/RxG5GfZzoiDCilph
 fkX++srboGIhfn9o3FnMTKj/JpBToE0uroWT9Oaa3v5WXTuut282olJL1yYSbpC6yo61
 DUIRLgXRAj6Y7Ifqn7WkwV38ihacLRIBVp8wzxSFviN/YxTQBYu7WhAM6b6CJaBtYWay
 CpNTEkiev/BO3CXytY9bE+hdL2adRNF6WoF1Wra2ZwSUzWb5iPuGVSpiM1UV5mQV2Ip0
 IFT95/GmaLRtioZ1JTZydM3zTh6YWKmHypJ5b7M89eGe0ctuUruPrhCP+NNAS/xZOPzW
 NlUA==
X-Gm-Message-State: AOJu0YwYNr3kVKHZ8hw3rhJvadkcUuTz7eoqe9fWXozSjco6+ZYpzoKE
 NsRehTdDpDdTpjY/LcgLR+JlUeLtXS2dXMHJBo4=
X-Google-Smtp-Source: AGHT+IE7GxPDS+PrjdIRKoKcXEI0G00AkJ5kcwKcMEX1WNFa5xkbSILxwpIRZxmX3UUZ53Rok4brKg==
X-Received: by 2002:a05:6512:4019:b0:50b:debe:d35d with SMTP id
 br25-20020a056512401900b0050bdebed35dmr756886lfb.133.1701602806015; 
 Sun, 03 Dec 2023 03:26:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Correct UBWC settings for sc8280xp
Date: Sun,  3 Dec 2023 14:26:31 +0300
Message-Id: <170160265539.1305159.17862781249540372821.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231130192119.32538-1-robdclark@gmail.com>
References: <20231130192119.32538-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steev Klimaszewski <steev@kali.org>, Danylo Piliaiev <dpiliaiev@igalia.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 30 Nov 2023 11:21:18 -0800, Rob Clark wrote:
> The UBWC settings need to match between the display and GPU.  When we
> updated the GPU settings, we forgot to make the corresponding update on
> the display side.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Correct UBWC settings for sc8280xp
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0b414c731432

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
