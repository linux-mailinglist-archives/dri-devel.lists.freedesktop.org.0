Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2034F90C5EB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 12:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F47E10E61C;
	Tue, 18 Jun 2024 10:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y7TQOHUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0BB10E61B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 10:09:55 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-63127fc434aso43970927b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718705394; x=1719310194; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IqR5wZUp1Tx3xq+bP/edl3bl9htsL0tG2NWiQ3t5YmQ=;
 b=Y7TQOHUy75kKLkbL/29JVQt4neCYavLSRmP6qabUBrQS6eMk7o9MCY1Wuq/lwUX/Nm
 Ikcig+A2ukwdbl/8YQhL6gr8BniBrGUKv/yIUH7Ssw0bt0eGgjW3Xr5d7qf5jih5B1MC
 g+cxQfzGFfthrSLEfcVKkZuYMRTj9J/7AWmLah3SLEcIbyQmF9uy5vJRQ5VyS2lIn4MJ
 72syqaH+2BBvpC+DaNNpN+vmKUNcVb0Dd9C+C/YYAzmCYkKZ6XsaL4LI+aDGNQLRr0/v
 kETCD8n6zKBhM0xTvKWyvYRKB5/mnRQRhsGAZI7mZ2AFj0mQXYEp6z7VS+EDnhxn0DPv
 Mvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718705394; x=1719310194;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IqR5wZUp1Tx3xq+bP/edl3bl9htsL0tG2NWiQ3t5YmQ=;
 b=aEf2t+wfY4hZmoUfd1l+b63/6N6hYjWpCAV7lAbF+ux3YZrXdXF78iG/DJJNPsX1yV
 mvJ+sq6qnQxs538YT1KrMF8N8hkB3HhZiYpg5H+pCHr7nTI59uA9AvFAoRomWBtBPGzi
 jioxhKhH8lqBoUdhtNl4HH/YoVeR3h7VFAi+wqv9x6wDYtKsVbrB5NkQmcgPAmp3yAkm
 6s+Q9TGXnm+vsH0plC41r6NU9/TjzOcy1a0M5X1rGd3fkq9Af9EbjyddLUeIKvYeGXLt
 XQDtOTelZVT0jcrEyKElPo/Pk5uc6kD/CUqVvqBS0/xHfhLyoOGlyHg4tPTph6UERlf4
 L/eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZlEZBxPFDexjVq7c31TWc3NPGlRKnO6HfM1ocsB2Z/aXidf9cPG8IfvPdUOiPBVGAwzfjKsqyBh40kWQ11Mc/+w/TzzgWK8nuZoAqNgvz
X-Gm-Message-State: AOJu0YzkEieRPMigetWuI/ndcKuIQ682DUvhT+48XreCsRdDcJm2VUXd
 gYHiF/jA1s5EMLZ++Hmazpcwkrsb4dOVI42+zho7jGPJa4QaIxjZdSTUADz64qS0VMPOaoBqxR0
 PytMOE4I+1fvmhyM2nzyx/BEfsVUM3bEZ1KK23w==
X-Google-Smtp-Source: AGHT+IHRwPCQfQa69fMu0wKjL3vPrpLu3LBFBhI//GsCDP56r0T5z4Wbx99DpWuIJj4GMQDFqn1DNosmf91VMnQnZz4=
X-Received: by 2002:a25:6b07:0:b0:dff:4a3:2de9 with SMTP id
 3f1490d57ef6-dff15385bddmr11704923276.20.1718705394187; Tue, 18 Jun 2024
 03:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240618081418.250953-1-j-choudhary@ti.com>
 <20240618081418.250953-3-j-choudhary@ti.com>
 <k4t7zcvweap6e3fqrcixu7szqtvykn3nnqryyd3hdybhhufcgk@snimim34rrwh>
 <a34116ff-989f-411b-8846-2f53b16b3773@ti.com>
In-Reply-To: <a34116ff-989f-411b-8846-2f53b16b3773@ti.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 18 Jun 2024 13:09:42 +0300
Message-ID: <CAA8EJpq2UkMn9ArSNaJcOyw28H4uUcRwvUqfUBBqSCALmozBrg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: ti-sn65dsi86: Fix
 ti_sn_bridge_set_dsi_rate function
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: dianders@chromium.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, mripard@kernel.org, 
 linux-kernel@vger.kernel.org, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
 daniel@ffwll.ch, spanda@codeaurora.org, a-bhatia1@ti.com, 
 dri-devel@lists.freedesktop.org
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

On Tue, 18 Jun 2024 at 13:05, Jayesh Choudhary <j-choudhary@ti.com> wrote:
>
> Hello Dmitry,
>
> On 18/06/24 14:33, Dmitry Baryshkov wrote:
> > On Tue, Jun 18, 2024 at 01:44:18PM GMT, Jayesh Choudhary wrote:
> >> During code inspection, it was found that due to integer calculations,
> >> the rounding off can cause errors in the final value propagated in the
> >> registers.
> >> Considering the example of 1080p (very common resolution), the mode->clock
> >> is 148500, dsi->lanes = 4, and bpp = 24, with the previous logic, the DSI
> >> clock frequency would come as 444 when we are expecting the value 445.5
> >> which would reflect in SN_DSIA_CLK_FREQ_REG.
> >> So move the division to be the last operation where rounding off will not
> >> impact the register value.
> >
> > Should this division use DIV_ROUND_UP instead? DIV_ROUND_CLOSEST?
> >
>
> Floor of the final value is expected according to datasheet.
> The error was due to taking floor earlier and then error propagation
> due to multiplication later on.
> I think we can come up with a case when DIV_ROUND_UP can also give this
> error. So this particular approach seemed okay to me.

Ack

>
> >>
> >> Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
> >> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> >
> > Fixes should go before feature patches. Please change the order of you
> > patches for the next submission.
>
> Okay. this was supposed to be code snippet movement in the first patch
> and fix in the second patch as suggested in v1:
> https://patchwork.kernel.org/project/dri-devel/patch/20240408073623.186489-1-j-choudhary@ti.com/#25801801

My point is pretty simple: fixes are backported to the earlier
kernels. non-fixing commits are not. In your patchset you have added a
dependency from the fix onto a non-fix (and
not-selected-for-backporting) patch, which is not so good.

>
> I can fix it in next revision.


-- 
With best wishes
Dmitry
