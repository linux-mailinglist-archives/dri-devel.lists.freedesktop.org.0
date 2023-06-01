Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B52C719F4F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 16:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A577410E142;
	Thu,  1 Jun 2023 14:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D593E10E142
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 14:12:48 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f60b3f32b4so8673875e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685628767; x=1688220767;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c+pyc2M4W79NW5jM6Yi5A6BoToDoHhe5rEuQkc7puW0=;
 b=c1n7cc7EuMobfAjw7tRsFwjRb8piUJFPmjeWQhM1LDJKUa0m/4xRMlHthNmgWuGOL/
 BsPyrOgbjtiSEWm2H4w1A6eRbRkBOABKsg7mXyi027yjeGvVWeZPcjjYGM2uIXcKPCIT
 Zn1ETyaSzcCfj4fpHu1JMtPFY2c7QGVn6FxpeRkSnLatppHdW9nDdQTCoNKdblCvtSCa
 z3Uppw2pzefwTE2otKgJTBZAtb1wijvT9USWSnM0jFTswBsh/9627dqiYY3euYxUOpU1
 i5WW3oRFiEOmt7h8bA+UnN1PnUr2xccj/1YdyLaK+0yfQVQytDLayzvqOSJlUTaZ01NR
 wj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685628767; x=1688220767;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c+pyc2M4W79NW5jM6Yi5A6BoToDoHhe5rEuQkc7puW0=;
 b=SMtKTxmdTI/MtAc8mE+jGSxkNzipmcMXbVAWL1cdaFsnJV2WB0Qk7DKRoG97QyPlJw
 w6ubrMr4dj+tnHdN4gDX8ta7G3HHexExNO3hfuoq2kXTek3xlyzQFKACU9aQscVeuOKx
 rHeMvJJGU/9Hjnbcwu14pjPX478GsTDI2uhbdZAMET3uhiAIq5qK7kaSF+NOuOrVj5pp
 QhbtVgo1W7dD1YRbrV1RUFnneRg1Uv1+CwByCLcUjawcl2y/KoyAIgYhNPLmcomEhLyC
 6JFSdb+zPDfN150Ie8W4VRWbQ2EjUJSZwmIezxkKVHJ4uA6re+TBPNy8XiK/cqD8dXmM
 DyZg==
X-Gm-Message-State: AC+VfDyi9JET7CSl6HIxa9E4CoX4JlwnqdHoiEmvCdP9cXK7C1qSXnqj
 bu0IyF2CuNpY8tziZs45XbB6ZA==
X-Google-Smtp-Source: ACHHUZ7vQwVk+BxbzRERdlM6SSelmA5Q5GxOlJfvRMKf50IBfm8RuNZ/vGRElLDOFoO4qVYxzS9pfw==
X-Received: by 2002:adf:cc91:0:b0:306:3284:824f with SMTP id
 p17-20020adfcc91000000b003063284824fmr2364472wrj.8.1685628766781; 
 Thu, 01 Jun 2023 07:12:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 p12-20020adfcc8c000000b0030adfa48e1esm10629591wrj.29.2023.06.01.07.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 07:12:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20221025-ts050-timings-v1-1-5c824bbb24d9@linaro.org>
References: <20221025-ts050-timings-v1-1-5c824bbb24d9@linaro.org>
Subject: Re: [PATCH] drm/panel: khadas-ts050: update timings to achieve
 60Hz refresh rate
Message-Id: <168562876603.86739.9442516356348966398.b4-ty@linaro.org>
Date: Thu, 01 Jun 2023 16:12:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 26 Jan 2023 10:39:42 +0100, Neil Armstrong wrote:
> This updates the panel timings to achieve a clean 60Hz refresh rate.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: khadas-ts050: update timings to achieve 60Hz refresh rate
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=29c6df0d942454cb43334cf0e36de068f4124b94

-- 
Neil

