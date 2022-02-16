Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBC84B7CF1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 02:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECD310E5E9;
	Wed, 16 Feb 2022 01:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08FB10E5EA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 01:56:36 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id x193so1044338oix.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KCyjpWkYyVwulnMSGHPzK15YA1gsgRLkW8T95C42RLs=;
 b=LNR7cMd/oTxmlVmnnr0/9oha/NJrcVP8Di5AvttdpQ+MIGv8ctlPHPVN341VV7bgAS
 nM03GM3lYzgcsmEsTln+dO0IyYD4Uo847Rf9OvcngvEaHIjJhdt+NbIyeSX/hOASHY+r
 zrodAlxjW66C1q0PGih0d7Ga52QMSfq2lcf+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KCyjpWkYyVwulnMSGHPzK15YA1gsgRLkW8T95C42RLs=;
 b=PJxuQean4DWC7+N9WgpsBo25BOY+lJeU36HvZCBy1fP1LZBkWGNHMVPyEMG0gyE2XM
 DIp6wQDkz2VwT6KAgi6FlHX4kwXhlHcmtNaqofa0r9MLSS9O9Q1NZquG8BpbtM+QUqwJ
 4RRiyItgoAS2L/9BzgeHod3jye0QcvQ/A0PclnQATZKJGlr8wXXJ74Jha+P5vCRsuFRH
 U5hy3LkTETsyWgm5JipRgZCvME8ygjTlVgxC2VBGjvRScVFGUkLnVYdcYfOYegLKhhst
 3SpYiy0qDYaVKCJJuF7MhMA3LM7h/lZFGBKc7WM5kbx5Qf4ivPTBzWwFNjliFY3ts5VC
 Nzrg==
X-Gm-Message-State: AOAM531UTE2XwCh7I5/pvuRUtPtwrNPjryplIhb8yKYPpXPfPNeHWuwF
 HWhIj7UhgYQmoPJU3ZqPm9Pexl/YQN2qdhQFd+RsZIKRebc=
X-Google-Smtp-Source: ABdhPJxYf/Ggt3IXaM5zUgr3PhbxATDPeznV3McX+HESVwjV1FmJjaH2gqnopr4zi66eMYtzYAWT/VgNG3JzRBLp2YQ=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2949049oig.40.1644976596157; Tue, 15
 Feb 2022 17:56:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:56:35 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-3-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 17:56:35 -0800
Message-ID: <CAE-0n51haHQTtZy08Quo66WnuDin_kx8MK_sytNQ1x_N9YU-Wg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] drm/msm: move struct msm_display_info to dpu driver
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-15 06:16:37)
> The msm_display_info structure is not used by the rest of msm driver, so
> move it into the dpu1 (dpu_encoder.h to be precise).
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
