Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD54815D0A
	for <lists+dri-devel@lfdr.de>; Sun, 17 Dec 2023 02:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E9710E3A2;
	Sun, 17 Dec 2023 01:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70A710E3A2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 01:35:11 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2cc3facf0c0so18219761fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 17:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702776850; x=1703381650;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=hl782NtFmKPulrM6nPcx+9M9EkIbH3sXgzxwfUjhxxY=;
 b=DdJYfrk5QL69Cqcf552hDXU8og/Bx54yXZdpslhPPNfvPBSOETrchsKuTKUfXW3+G7
 ArF8MLvoiskdkujTG6MNVOgrS8HP01kjpVxRJR5JMdhkOFGuNZk4r2/lTs128GaWVCqq
 EvCNl5p46C6uFYYaUjYpdMjXPyPG4Trx7sSJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702776850; x=1703381650;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hl782NtFmKPulrM6nPcx+9M9EkIbH3sXgzxwfUjhxxY=;
 b=w7vlxuqobgbZ7M0BPi1eD76G8Np5os1uPp/67z9pobotJukYSvuBXIDCS+ZJEJkxxA
 HU762+KGB5PjB0UJSfXBzwykJLKSaRrF6XkszbX+QOHGRh8pir2UruFGdRDn64TZ4Qp8
 nnwaNi3MDIuHN9OJLNe1+EUcFp3UBgMfqxM6jdPHZJ+4vThETf6egRthUt6ypRKrZLxM
 DrpuFljw3xfHz8SQaqZj+XipQ8nHQLq2A9GChh2TY0tAftfD3V7qVNOG3n1KJqTieYKZ
 qAmvTM3jK3+5drUGppDvDrDhZQKnMbZwwN11r0oSOEZo0I4LNXalTfc8mmyYQSP7obwv
 XwGw==
X-Gm-Message-State: AOJu0YzSVIfIqJBWAouHoR0zce88SbZrOWxgD/Dm70gRopFbHClRHNgQ
 NjzUTRPRfqXzd76HYhXlSLic63mfy5nl2UTXNhujFGH43mTDDTV3
X-Google-Smtp-Source: AGHT+IGI/qIxJ+tAk/PNQNrLNhT7HuVcrrKpVt70q44XRpAb37rhW3MUD7pq1ZTc5wUOEpLk5A4wOU9udQLAHzJod+c=
X-Received: by 2002:a05:6512:b95:b0:50c:2177:f184 with SMTP id
 b21-20020a0565120b9500b0050c2177f184mr9901201lfv.17.1702775095723; Sat, 16
 Dec 2023 17:04:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 Dec 2023 01:04:55 +0000
MIME-Version: 1.0
In-Reply-To: <20231217000158.912062-1-dmitry.baryshkov@linaro.org>
References: <20231217000158.912062-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sun, 17 Dec 2023 01:04:55 +0000
Message-ID: <CAE-0n52PqzgUJjvFZdURKvFCN9imR-bGxqadtphwkBf5XKJZDA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: drop obsolete documentation for
 dpu_encoder_virt
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-12-16 16:01:58)
> Drop obsolete kerneldoc for several fields in struct dpu_encoder_virt
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312170641.5exlvQQx-lkp@intel.com/
> Fixes: 62d35629da80 ("drm/msm/dpu: move encoder status to standard encoder debugfs dir")
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
