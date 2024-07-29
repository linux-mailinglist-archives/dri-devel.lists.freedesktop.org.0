Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2093FEC9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 22:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6F010E47C;
	Mon, 29 Jul 2024 20:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SHE6IYoG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B23A10E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 20:09:00 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-709465248b7so1487047a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 13:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722283739; x=1722888539;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=/jIHXG4vT+DDXeeiF4buw3dVqIn5OLZLpsCUv9QEgTA=;
 b=SHE6IYoGmPNLBuqWwjs+c/J7y1VDR3mP3cFf79f1S0VQ1sCPtXs+Q7Jpd2S3A/Tpe1
 nkJPm5QQOUL7JPLLyMy7O+qj32CnZc9Xaf+CudYCoCqpoakxzngpA0y1YwXUG2jKt4fO
 vc4m8boxIvyKzuopp1EYIP37xw0eUB2RoUFwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722283739; x=1722888539;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jIHXG4vT+DDXeeiF4buw3dVqIn5OLZLpsCUv9QEgTA=;
 b=XwaAJg5ugvCTKSDjnNEIrI+bjgK9U2DKeTau6u1UbKD5swvOzs5mEWr6FkpSR3cSGj
 BLA5B5o+8CctRM/tM/8GWhIP+tzrAJJwX/B7aXrNOuvb2Hw6YVm1iHacabYrK0FjmCwK
 248ucG6n4H4gCD0QmK1EfykonZUWqkKOlhL0hTtlBdbDCWu2vDwYNlY3SFBWo2IFxTmm
 Fpb5h128eHAhjmy7COWDnPay6VY0/+CYnpnCvGtJH2kkRZjnfvmx+nZZAYYRTVfDpNiT
 m/c1F+NWXckNa41ly+BfBT8c4nMAEaGzjF776ZxmaAKHDQVO7VZ718vlSa1xFd3e9plR
 f5tQ==
X-Gm-Message-State: AOJu0YyIyd0qozSYw6K84xXb8MoCC65VMUQZUt5zrlGdX2EgybgOfZGU
 zFui3HRyG4PntARYpG+brezEpLLPAUNsoznPc3/YkA1gJllXA8hjfl4XnYPrisRe+kChLhh4dL0
 +LbMDr6ZROwn9SUyBV1FCe88YDQ83nQ/sN7xF
X-Google-Smtp-Source: AGHT+IHpeBg5e8K4m1AjsYDN5Lf6w44ZrVNCRytKZPa/zJpkcs95lHEvp/x4E8DP9QtdgZhxg7CCNODor9FG/pDAGIU=
X-Received: by 2002:a05:6830:2714:b0:709:3b82:7680 with SMTP id
 46e09a7af769-70940c1aa9fmr12988155a34.19.1722283739275; Mon, 29 Jul 2024
 13:08:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jul 2024 15:08:58 -0500
MIME-Version: 1.0
In-Reply-To: <8fa86c0c-183b-4787-9525-38dfe6bcecc6@quicinc.com>
References: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
 <CAE-0n50mBEX98HH+5BurM-uRyzrxcPXFJ7yLg__hFJHfYjm67Q@mail.gmail.com>
 <8fa86c0c-183b-4787-9525-38dfe6bcecc6@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 29 Jul 2024 15:08:58 -0500
Message-ID: <CAE-0n537mpOMkVWrXGSpjU8cHZtUZXFfdG1YTfevu2SRo1hPTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix the max supported bpp logic
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Guenter Roeck <groeck@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Vara Reddy <quic_varar@quicinc.com>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
 neil.armstrong@linaro.org, abel.vesa@linaro.org, quic_khsieh@quicinc.com, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
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

Quoting Abhinav Kumar (2024-07-29 11:28:35)
>
> Thanks for the feedback.
>
> Your change looks valid. We can use this and drop the max_t usage.
>
> Let me push this with your Suggested-by credits.

You can take my

Signed-off-by: Stephen Boyd <swboyd@chromium.org>

and either squash it in or make a follow-up.
