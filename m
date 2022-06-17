Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154FE54FE8A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2EF11254E;
	Fri, 17 Jun 2022 20:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1699F1124EB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 20:53:08 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-101b0266185so2811126fac.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=pOJ0w1fx8TDvU6Wqqk+kju4f/j2XWysLUuPMKoQ93WQ=;
 b=BCibZwkwaWdmHbyckK1itupaySjS2gpljASTEwZsgmFNvWfcv7hFIh0Q6nCCPGNLjx
 /i/TFOrHBgEmtJlicNOVI2xEFcbx0/J45Y/oeZcqipsroldorlI8/h02GBcyDQ/k7b5d
 a019+LDOh4MT5bMtUHPCY/jUDuG4Zea/gCL30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=pOJ0w1fx8TDvU6Wqqk+kju4f/j2XWysLUuPMKoQ93WQ=;
 b=5OrJcY5mk3GpDpRW4077+D7br9SekaCR9vu0TpCF42kIigPxSZLlLlll/QbN5GFhQd
 V+8j53uMxyO20dcyM3m6tn+4IXZ0Wak0G5FFQkRTegrYmWpeADiKW/8Lc5dEnl7mrrjt
 aYQz/nrOShoaITZuUf1L3V8vVpbBnGu+CMcl3bAIeuJbWc0JmvwxAXOHPQ4EBM1SWD2F
 ji092Isb+GWaXd5V9K6QJdlIHE9EkQtcTBSdKk8z4PGCxtTjLYfxmRlCVCqi7tbkufok
 YZFWih+DffyFYKskKovPTsIFomQ2s4+L+hFXQQ4NFAigvB9IjFfi4VxB8tGqykNgcncW
 v4zA==
X-Gm-Message-State: AJIora/YacA8rGp36eHaWZ0EKAOmpcFImZXzu/t+gpVMmCb9nFPvbDF+
 2qHOGYP4P19VxL7UBJg/3gtXYxDzxvpkkex125k4wA==
X-Google-Smtp-Source: AGRyM1tHrKeZbF6x4Ph4v2TGhIyG5/H7CB4DpNOnp0o8Y+JdhKEu01LNai/uLjNuxsjXcEVC20rNgdoz+JZY07qm7Bc=
X-Received: by 2002:a05:6870:b48a:b0:101:40eb:63a3 with SMTP id
 y10-20020a056870b48a00b0010140eb63a3mr6279169oap.193.1655499187407; Fri, 17
 Jun 2022 13:53:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:53:07 -0700
MIME-Version: 1.0
In-Reply-To: <20220616085054.432317-1-dmitry.baryshkov@linaro.org>
References: <20220616085054.432317-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:53:06 -0700
Message-ID: <CAE-0n507ro+ZDAi8eoYbXjuxeT8SB-viCbr3Fh3x9QN56UTLrQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/hdmi: drop empty bridge callbacks
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-16 01:50:54)
> Drop empty callbacks msm_hdmi_bridge_enable() and
> msm_hdmi_bridge_disable().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
