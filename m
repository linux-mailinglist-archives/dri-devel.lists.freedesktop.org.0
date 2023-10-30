Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB147DB9CC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 13:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476A310E2A4;
	Mon, 30 Oct 2023 12:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485AE10E0BE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 12:21:02 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-59e88a28b98so37980457b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698668461; x=1699273261; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tx0E1lO7sX80TYEZLbZ/p7IN8KY+xevJVJVX9CSG4+g=;
 b=de62hGDRxlcVMtj9LDMk9pdBf+93GoHhuFf8PwRKboZBHgnCRMbMffyJi+HxWjs2m2
 NXZrKDIg2dOLUeAY591bHuqSvrcQT/7QnNWs3LLBD9K0gc4XquvgtiXueBrCVgJH9lBo
 rXg0ErL/HNJjJf/zAsOOyT8UQtvxTw/q+ILaNmtiKSSZRVII+8EQUH7RFR1O64kLlXOf
 396hHT278s8qe98//nWaEEctRkEQxaGpXsGh5zvL0wIYtEkKH6ZtWFvnFmZyH3PGzKR8
 /kH1LkB4dE0EBg2tXmoRIxd+h9z5wDAJj9zGY1BKMYN9IuFQsdiw7oBCNIZ146vxYDHk
 xRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698668461; x=1699273261;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tx0E1lO7sX80TYEZLbZ/p7IN8KY+xevJVJVX9CSG4+g=;
 b=RA4Nqv1Xkj5Noie59/ILtylqUm7rhMK0kzWsos4+uDymJw9Hz6wDUmDLS/QVpw33dQ
 Cs+cp4duNlQxXKTej6VS3jTzQ3IFYVjgwM6XR8z9W8jqHmYGrQcL6pRXz4vn4k13YqWC
 GeadPNmjoLI92a8wqgJZFZWACXFAJ8mvmvb9vGD72MKrsyi16MyKjlH426jnwv6xo8CE
 nQEt3HKkDcmwxThpq72ard0S2kmyuX8zm45Xk/Qa1YLrfFvIHbdpb56bYMYUSRaALTmz
 W+NAqsbiJ9VkjNQbRkSQRPU9x7HCo+/3Lc7BnLXn/NAMxuUSc2OrQ1QqmMGD9gMD7awg
 sVvw==
X-Gm-Message-State: AOJu0YyPiHHQGQOba3cAaHULRJYTZ9djZQLZ6cTzj/5n61NPef4mDtz1
 rhZbSviMQ1yv1CD2Y53CjwnDkcG5sWyBcqL0dwHgFQ==
X-Google-Smtp-Source: AGHT+IFKE8vLRCh0SuUhxTnn5PdhE/o7DyZSiHlRWBzISa81u1bz2zPdSgaIvbzp7Wc+FD7P0CwSUInn+dj6DwNZIKw=
X-Received: by 2002:a81:441e:0:b0:5ae:15bb:466a with SMTP id
 r30-20020a81441e000000b005ae15bb466amr10123206ywa.14.1698668461455; Mon, 30
 Oct 2023 05:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
 <20231030-topic-sm8650-upstream-mdss-v2-5-43f1887c82b8@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-mdss-v2-5-43f1887c82b8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 30 Oct 2023 14:20:50 +0200
Message-ID: <CAA8EJppBTOnSAWLpZjHAGwwfQzPRVgHVmDfN4nvaVifU+2xEOQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: add support for SM8650 DPU
To: Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023 at 12:36, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add DPU version 10.0 support for the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 457 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  26 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  5 files changed, 488 insertions(+)

-- 
With best wishes
Dmitry
