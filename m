Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 658EC727306
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 01:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD5710E572;
	Wed,  7 Jun 2023 23:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAA410E571
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 23:33:34 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f505aace48so74457e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 16:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686180812; x=1688772812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dN4pp9fb5TWIMsqp3d9VNESt/WcsddcSpSKGD0lW3Qo=;
 b=FH75676ycuQq9EAzdrKVKWs5LzowZmXbypYaZY/A2T7G0/+KjbSday6hzkfIFkL68/
 aUvUkK2+YXuRJj6cNIFU4MdDhJ74dFftIvl9rKHkfE/GovkJL6oDki9AGPht4DO2fBde
 Ic6eD9XT3hfxahv5lC8Za5t6/2eZsIl/9/4cOvC2nkyf527sncfx7cu3sTpoiIbjN0N2
 hzsG3QRkHYFzuxSht/R3P/d7BrpSwSLq0iPUBTP1totpVxLADbW4335z5FpwPp1Af5GR
 BGPjXl8MwOPU0ogoM8cDDuXDDr3vWyIksyzwOk6KwWvYO8xxNQr8YsoH3TeivdzcvItN
 hBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686180812; x=1688772812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dN4pp9fb5TWIMsqp3d9VNESt/WcsddcSpSKGD0lW3Qo=;
 b=JODkUJgz7IN3qeW69+2kqed9TR1RJJ+EXAXzyEG0gAjxC+is37BjfE+2bTgi44j7ul
 x3GrctFhrXf4ZoFXFO6hlg8hOSabMzdVHTyf0D5JGHtaWHL6meawbRffNCOnlJAasv3y
 I5Yj3FNqAuOrJx0DY13DvY/QXADJKwDB7W/hvGlE8Tmn/+ciaf1zHxtoIEZLd+fS0MgF
 y4B39c/EEZoFFWUZhy7KqMWPRu1gzWLYRE4kmB+v4srqvYxVdN3PTygNn/DhV5Ditez/
 ExOr1Lt03eqvVv23FL0v2tuuWlywsBzBfgwfrVq/PL/FbftVn3u3dMxdOCtTI3DcZEGZ
 6xsg==
X-Gm-Message-State: AC+VfDzx4pmdPjhxWtOhpmeAeA18mDrG9csWe7f3CE9CpWe0rb+RLZ3Y
 TrRMs8cR53/FkLiSUaVE4PT2/Q==
X-Google-Smtp-Source: ACHHUZ7DDz75h1c5ySi2EzigAvLkdaMJCBg/qI57xGd90LVlStQKU5y/JYOalBn5h+xtR9kXeECIug==
X-Received: by 2002:ac2:59dc:0:b0:4f5:bc59:6f21 with SMTP id
 x28-20020ac259dc000000b004f5bc596f21mr2455945lfn.12.1686180812387; 
 Wed, 07 Jun 2023 16:33:32 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 b17-20020ac25631000000b004f001b0eda2sm1951199lff.56.2023.06.07.16.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 16:33:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: tidy up some error checking
Date: Thu,  8 Jun 2023 02:33:30 +0300
Message-Id: <168618077607.1883603.4945564571594085795.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZH7vP2Swu8CYpgUL@moroto>
References: <ZH7vP2Swu8CYpgUL@moroto>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 06 Jun 2023 11:33:03 +0300, Dan Carpenter wrote:
> The "vsync_hz" variable is unsigned int so it can't be less
> than zero.  The dpu_kms_get_clk_rate() function used to return a u64
> but I previously changed it to return an unsigned long and zero on
> error so it matches clk_get_rate().
> 
> Change the "vsync_hz" type to unsigned long as well and change the
> error checking to check for zero instead of negatives.  This change
> does not affect runtime at all.  It's just a clean up.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: tidy up some error checking
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e7a2cf8e058e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
