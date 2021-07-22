Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351823D2D93
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 22:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139456E8B2;
	Thu, 22 Jul 2021 20:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB4D6EA27
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:20:10 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 x16-20020a4aea100000b0290263aab95660so1597279ood.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 13:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=kq9pPpUXWfyOB70y0U/HqDgr6rOmQo21nOBEKCcoDWo=;
 b=nk/s1qG0A/QiwX2ta+8tK85Sr6aMlB8FbNQ8SjuW96XHGaJ48vXa5yzgPwYsNbRA7T
 D/FZ7xAAw87wm4bJ29D15Sk9vOjhmYxsbv/YMrqQQsdT7brH/bLx0hUA5JSbe4ADqXQV
 nMQx1ErPAQ/glDIqsERTASMEyJMWEg0YV41z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=kq9pPpUXWfyOB70y0U/HqDgr6rOmQo21nOBEKCcoDWo=;
 b=Cz2m9Gt2kZXE6aDqXtLPgF57ERHXP4AeAv1M+QARNoOmtgNSDmUlFRoKGfYU/x0K05
 FhJI4qcAZZDaw69XhHVDFqu5/OzfJsqjbEa6HRFDI+r1e7BrGKfyEjC1Qab2Q8bKd4qR
 DsaglIRyzsY6pY+pgemR9ZsPI1peu7kD0f9kAmKcaAaRwJ/H2BbnCf0iQoeJP2Cu0O3+
 viGylf7sdTuIOGCkOl5ZUJwvIF78kp3tZsXXHbIz2ECsVLBhGoFTWBBF1XcPpWRulWae
 EhyQxrCIrHnZPBwGsItYBSe1rhLQe/XRDiUvTzwnjBuoMXeVe9AFD+rrx0h+lxHfBKkx
 bBTw==
X-Gm-Message-State: AOAM5307uFXSw/Z3cK9AAtjdv4T3Nrkvvha8BsOVN8OaFgtql2cO27JE
 mGcPLotDFbzuLnHkGobJCiU4e5tuxFhx5wKocBxqjw==
X-Google-Smtp-Source: ABdhPJws+s2WINOYmzqYr3vkrc2lrXmlRLDg4DQkooApeFXgDsOVANfXb7i2aeHXcsjJA4Y+mBakkGUzNHisCZtQiJs=
X-Received: by 2002:a4a:a6c2:: with SMTP id i2mr762853oom.92.1626985209357;
 Thu, 22 Jul 2021 13:20:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:20:09 +0000
MIME-Version: 1.0
In-Reply-To: <1626922232-29105-2-git-send-email-abhinavk@codeaurora.org>
References: <1626922232-29105-1-git-send-email-abhinavk@codeaurora.org>
 <1626922232-29105-2-git-send-email-abhinavk@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 20:20:08 +0000
Message-ID: <CAE-0n53H=eA-zaVNVfn=Thg=NjrJMeMSjXsA6oG8GwT-CiDXRQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dsi: add support for dsi test pattern
 generator
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
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
Cc: linux-arm-msm@vger.kernel.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2021-07-21 19:50:32)
> During board bringups its useful to have a DSI test pattern
> generator to isolate a DPU vs a DSI issue and focus on the relevant
> hardware block.
>
> To facilitate this, add an API which triggers the DSI controller
> test pattern. The expected output is a rectangular checkered pattern.
>
> This has been validated on a single DSI video mode panel by calling it
> right after drm_panel_enable() which is also the ideal location to use
> this as the DSI host and the panel have been initialized by then.
>
> Further validation on dual DSI and command mode panel is pending.
> If there are any fix ups needed for those, it shall be applied on top
> of this change.
>
> Changes in v2:
>  - generate the new dsi.xml.h and update the bitfield names
>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
