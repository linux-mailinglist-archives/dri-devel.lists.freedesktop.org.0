Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4583485C65
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 00:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF24C10E49E;
	Wed,  5 Jan 2022 23:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2B710E49E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 23:43:00 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id j124so1260022oih.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 15:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=IxB3I9VutZnjRNdLbfVzg0rsq9Bjtv+GSlcLzooWDJs=;
 b=oITkVjokHn5CRvqrEiqDtuwhv24jSdiQLBq2Ql1uuasuvwkDAkEQPAWOJ2M7ogugcg
 RvH5zOrQolNS8/Uk1XOVDHWF8gQIXGzrVvJ1QBUE3EbDm02aevaPK3rwMBsT98qlhP60
 ScPLorvJtpvZxMNnMqkVCagPYAAs1S85l+sE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=IxB3I9VutZnjRNdLbfVzg0rsq9Bjtv+GSlcLzooWDJs=;
 b=gdZyjPMAefozwBvyUWZrTaWeTCUHNNttcdVYpNlWtwvMEGN/QinWMeChP5MRrdp5r5
 dgNPWRVdSnW1HaVBogDSgnGCOmzOTF4yVzw4oAj7FeT+DK3C4jPjMO1cStc94hLN1HP4
 CE6nlrGkGOCBng055MDS2WwYgOPJgxD7iWDUUQc4KuCtiCLaH0AizIh4I2O5RTOVn9t8
 yL7+9W42DPghpZifz+qZRyhBupqOATJiagQ50rgSn/7vCPBGqL1YAVZMYik5oxGgP+eQ
 oHKs96Rn0fNiRfaQ/p+6cgS5Bx188CEkLjJYJro7eHCkQUc51fvuakSqytwrJaAvSfw/
 5+ZA==
X-Gm-Message-State: AOAM531OZViaPE2M6ZsymhdEypvL3IdyGqlgn7wJZFtOp4U0/+xHBrjQ
 20uIw/nXO5OxfqDawkv1uOnfHg1kd2ITfs5LHqs/Iw==
X-Google-Smtp-Source: ABdhPJxRPZ8DsgITx8hePuL7cPTiC/1Xo6E6Nn7hwWVurib9oIaOohMpMR3GPvpFKaS1by70oaAf/MWhpADtA8C4seE=
X-Received: by 2002:aca:4382:: with SMTP id q124mr4323087oia.64.1641426179984; 
 Wed, 05 Jan 2022 15:42:59 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 15:42:59 -0800
MIME-Version: 1.0
In-Reply-To: <20220105232700.444170-3-dmitry.baryshkov@linaro.org>
References: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
 <20220105232700.444170-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 15:42:59 -0800
Message-ID: <CAE-0n52fsc9cFfUMOg8EufwwkjJp1sQDO07RVWBvK78+74ubLA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/msm: move msm_readl/_writel to msm_drv.h
To: Abhinav Kumar <abhinavk@quicinc.com>,
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

Quoting Dmitry Baryshkov (2022-01-05 15:27:00)
> With the reglog removal, msm_readl/_writel became single line wrappers
> around readl/writel. Move those two wrappers and msm_rmw to msm_drv.h to
> remove need for extra function calls when doing register writes.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Any chance this can go further and replace msm_readl/msm_writel with
readl/writel directly?
