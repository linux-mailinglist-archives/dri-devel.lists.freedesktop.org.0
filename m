Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C87D3D2D8F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 22:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0991A6E8A2;
	Thu, 22 Jul 2021 20:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77156E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:19:59 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 42-20020a9d012d0000b02904b98d90c82cso1695855otu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 13:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Fe8pajUE7NDpP+KFoDH14YyaziM8HYOjmxDI4HcE0+Q=;
 b=MrwpkA0AeKDnvtOPhOU+UgtudfAtOHCjLbSpo3JiDU9qOHMaYB8ODyTaQa2sdqp2SR
 izy7tedILcpoCkkMAX8UpYpLS25bl26x1U+mXQo/9n7204kVjnVmNMwqnRTk+SnilJ6p
 yLBa/1IdvxnerBSnyho0pG+5tT5P5QtxJGemY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Fe8pajUE7NDpP+KFoDH14YyaziM8HYOjmxDI4HcE0+Q=;
 b=th/vDME9EK0z0rJq3LmPESXZNtarLbmPF2zAhwo5joDCbmZmzyWGm2RUZ5MNuJOp4z
 SBnyyQ3hZPOOJQCMUDAKVgtiGBuS1nJd9/geJ/WO6XTpuSZB4MXODhLwBOPRHYdhrYVI
 r0AzRzVA1hsTsLVvIBJRhiI4+AJhoTO7S/u104Hy0jOas956IgMyY24SUCxICkBckIeG
 wvRNSJ/5ZDzlfdgQqAfrHN0R4nxXooXhDzpJM6nxAA800cp40Zw4I/KW+O6SwbAbE2MK
 WfbICch0Z7F4pKiK/R1BQ3FIQ+Y6leBkleUEkvBwSGaqSrRRgg5XIkLbq5dRmK/E42kZ
 IVdg==
X-Gm-Message-State: AOAM531MQV8WH+aAVrRKA1xSXWe8Aeb0bRqHbS+z+e7JU2rdE6oFJ6Tv
 Yfvx+13RkRHsjXTD1ANpzFidElSPrde4i5eBlbKbrQ==
X-Google-Smtp-Source: ABdhPJwt7g/hkXpMcwuy3NhbJrzVZd1klNp7hUF1Csjwy5CxmWyIavZZtANOEVOAjS1O5p8mwwxI8J4B3J06pIKbg1k=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr1004458otf.25.1626985199252;
 Thu, 22 Jul 2021 13:19:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:19:58 +0000
MIME-Version: 1.0
In-Reply-To: <1626922232-29105-1-git-send-email-abhinavk@codeaurora.org>
References: <1626922232-29105-1-git-send-email-abhinavk@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 20:19:58 +0000
Message-ID: <CAE-0n52zudM+tiByvhNbiBeoYwb+hSqtH0yDgSPU1oTinnSO+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: update dsi register header file for
 tpg
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

Quoting Abhinav Kumar (2021-07-21 19:50:31)
> Update the DSI controller header XML file to add registers
> and bitfields to support rectangular checkered pattern
> generator.
>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
