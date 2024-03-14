Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28D487B5B0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 01:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6CF10E54C;
	Thu, 14 Mar 2024 00:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BjqVXXFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E78410E68F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 00:04:50 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-60a0599f631so3786227b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710374689; x=1710979489; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rYpa9v/Uvcp+vP4bhmnZATlh/YoneUhRNbvkfQ+Gd6c=;
 b=BjqVXXFMM8ULHj68pvh4C8q9HVh444+9fONdaUfuRzOrR1VmgRv5wn5fs5rMdPOoGs
 21M4iMjtm3qNp6KLJoZ410n0PXQuftQKdY5frvWfna3S38I0xc9VCXW2AU6T2vLsEGcz
 q+ZJwzh5G2mzY/M8TmtqKwpbNh0LYe0zi4PjJQKPN/KnfbHhbLv2nvgrn3ZZxo4IJSoX
 D/T2q5+pa6rBgJC2X7DFODyqMZWIRCujy67CODTyBi5YNey/LbPvnO440hjolyIDihCg
 e8+cD6pjp4ha7oXGFIiJNtTTX+eszIjAJnDUVaj2nhxxFxxVmEp0t4P59TDBevjeVW+y
 6/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710374689; x=1710979489;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rYpa9v/Uvcp+vP4bhmnZATlh/YoneUhRNbvkfQ+Gd6c=;
 b=N0XIzZnD3aAe6UiX6Tt8m75P2zL1+HKXKu0mjV8wj4KRD7DnpbTAvRt7MnFuqk46WH
 M7n0XwXfivRVKcKjQkXO2s+bDBgapzC1h8u5LeNqLArV2xAqvCecdLO92QsbRzFJUHi2
 RrMMGTmTaqpD+ylz8+yoLwSbmBEkWAFGpNSGanTxB4dQTNU42yOwzkVDXpWVPdwBv0FW
 +N8Ot6+xxci4WcGfgqYs8Nqp22/YCQAanpFkAUEEPktrFij8Gju6FQTzlk5NVccqXcu9
 5L1Nf+3LlnhTbeN6lP7ghy0Gh6Li6UQN7qkAX1d1pQ9ukS/s1+fvMCeFeqU6rt/YFAYo
 0n7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2l5yA+4YW7Mg/MeVW1ygO2XZVc4U7Si+5YqLJsJMmCTbhEpvYL2gktcbCpFXSTd4eYYF7eU53cCqUlZSyZBP+fXXVQ3cPGklLOBPwC1NA
X-Gm-Message-State: AOJu0Yxri56kkwCXu7gmw/keXaVpeY6X8Kki485CwV60UsCDmp5I92n3
 Ee/35vY2vDnII0lbC2J+1taoTCk/53iWYzCzDYl7IP/wMa6L7LejEMA5uJuqE2xFNnwpCV5PV6b
 /NbL9kM4gLaVmzYKvOLhgiOjxAaTIW5ZCby6lwQ==
X-Google-Smtp-Source: AGHT+IFgh160t5mc/VHtCKkq3crL5g/DfQmXNTqe7xSm5+kcqpj76uD36nWOSG4DWnAY5RxZbDwsXSC49FuQsA3G5EM=
X-Received: by 2002:a0d:d90e:0:b0:60c:753e:1e0 with SMTP id
 b14-20020a0dd90e000000b0060c753e01e0mr193025ywe.3.1710374689266; Wed, 13 Mar
 2024 17:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 02:04:37 +0200
Message-ID: <CAA8EJppoBY7Unq+LmPbQAvipU+HnJ0EmUkQdRBrp0=LezBAXvA@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] drm/msm/dpu: support virtual wide planes
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Thu, 14 Mar 2024 at 02:02, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> As promised in the basic wide planes support ([1]) here comes a series
> supporting 2*max_linewidth for all the planes.
>
> Note: Unlike v1 and v2 this series finally includes support for
> additional planes - having more planes than the number of SSPP blocks.
>
> Note: this iteration features handling of rotation and reflection of the
> wide plane. However rot90 is still not tested: it is enabled on sc7280
> and it only supports UBWC (tiled) framebuffers, it was quite low on my
> priority list.
>
> [1] https://patchwork.freedesktop.org/series/99909/

Forgot to mention dependencies, https://patchwork.freedesktop.org/series/130086/


-- 
With best wishes
Dmitry
