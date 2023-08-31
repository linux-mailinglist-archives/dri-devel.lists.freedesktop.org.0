Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161C678E3F1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 02:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F277010E640;
	Thu, 31 Aug 2023 00:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D8010E640
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 00:27:20 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-d7d50ba994eso108523276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 17:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693441639; x=1694046439; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6XFUVRQ182BzKxaOieUisigxEXwKIxFTn7N8wbJlC7c=;
 b=ZWvhJunR8bUShFQZx5RV8K2if3pwXJJDewMvca3xAuPAAsJG6zauh4xl1JEzF+Ngo5
 Pk1deyaoIXECS4jZROM36vEUion4kccMzyrMx3RyJK8fwSbMms1wLZE2jteEtE4FsF2l
 wILxPhLcEQUPk7izjBRdgWkJSp2kA9PL/y0OcVFb228oAeSg/EAM8YRvIyJpMZsYqTHO
 nDJQhTb+FviPl+M3bjfxx/SmwJfvgKkL0/YLQUTW4ljQw85i2NewklGaeKnVkdhwIc0Z
 VhgYt8SBJmPoanzYx03vN2k6h+8zXH3EBCnLZrZ8Cnocur0pyCFcHDy9q0rXu9VcXdQ/
 qT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693441639; x=1694046439;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6XFUVRQ182BzKxaOieUisigxEXwKIxFTn7N8wbJlC7c=;
 b=XJHN/JjYPQjVVpJCAgoFiegPeHDJQJQ028hEzJbTqjTkYXRWjg5wErH6gAtoKaUdMx
 Pbi7SAbTaioJNtvRSAilWQP5lLIo986gOwB9F5N5oZ+mtjeYrKpdY/vxBaZrX6cKJ+ml
 OF1vEKKah/q9nay3qYgpsNO9rKKKkY7NZzFg7FykGBot0zjvIUPUoIJwGplGTzCZowyH
 XT7PTBJ7Nqa+2Kw7W+q0n87CcM6do5m6covg/XOZY54sQRkrij4JH7wZZshT5Gcznp9r
 VRMXgBaJ0hRLiP9UJLsVm/kmSuSBIdel+rzfbDK/tzJ4U+ftL7kBn65SDWQWL4m/PFsn
 WcGA==
X-Gm-Message-State: AOJu0YzX40bo39QHv79+KbJ3wBsiUshcucNUOqEvob+gpKYRqKgo5M1w
 dBJsOhiRe/hwSzHQY0STTa8u2fLfXCIXgzpOxpNQTQ==
X-Google-Smtp-Source: AGHT+IHknU6BC0qcHumWwJIB4jFHAfeTNSsm6jtFd9ikSrfRePOl4XXsKx1ygwxm0Sd1L8EI6HuBz53qqJL+YdpvGZ8=
X-Received: by 2002:a25:e7d1:0:b0:bcb:9b43:5a89 with SMTP id
 e200-20020a25e7d1000000b00bcb9b435a89mr3433973ybh.61.1693441639229; Wed, 30
 Aug 2023 17:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-17-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-17-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 03:27:08 +0300
Message-ID: <CAA8EJpqwzbBA6HPfW_ruAUxAv88AZwS4hSuCU47qydM8H+Qsyg@mail.gmail.com>
Subject: Re: [PATCH 16/16] drm/msm/dpu: add cdm blocks to dpu snapshot
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Now that CDM block support has been added to DPU lets also add its
> entry to the DPU snapshot to help debugging.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
>  1 file changed, 4 insertions(+)


-- 
With best wishes
Dmitry
