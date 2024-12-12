Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455BA9EE1F7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236B710ED08;
	Thu, 12 Dec 2024 08:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pFCbnWwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD9C10ED03
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:54:03 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6ef6ffcc2dcso11377727b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 00:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733993642; x=1734598442; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5B1z5PnAzxL6smT59ljrPqXpw5NGYGq2kaikYQzEn3g=;
 b=pFCbnWwpEB9X2N7YnzBKUIQgt/TZp0YvHJO7bMHjWE6zlYFV/DpCUD0aH+sw5tiyxZ
 96xpPJ+7+28A56d/ogrMzheg4RBM3EwuisONMY3DaJwJmbMhmqnU8iS5zReeIilTvdGO
 cFnAa3ulgMH0kXitDorXUpICIsSarnobKZ3IOcfibBwitkwS/3Z4KVtXDIaGKEDLhr9B
 ID0R5c5aRJ71wiFuGLlgdoxS6LZiMWEU9NLnktwJzzYDXJd5k9HTOHSSkaK4GDtDBI8Z
 a2QibwirdCc5x8lGuyEUAtsUElMQgDZON1I39q6dJkCdW2GgIU28DKIayRi36GlnNVVT
 KlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733993642; x=1734598442;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5B1z5PnAzxL6smT59ljrPqXpw5NGYGq2kaikYQzEn3g=;
 b=lNTdPNPOP03TPxlSLgdQtkyryRAA/kWq1M6oS/2nfM2qVDkt6fhg8GYlPyI4L7wVkL
 i6KDLCQ/pG9G9ZXJ6ZevvhKUjiVKn+meQW4KQBwOud38VNGLxmENqSF1uj9Lej4p6tdl
 EnlN1lb6mrshJuVvIGJRO0eMUM3FxPoYrtcQk/qLG/gkxHOUHhIqDEuwJlp223Aoe1Dm
 TQ0CYKQjDy6QpKWFMLPRz6QOjjiujiXgBsSfmVuJkdD3VfogPFbKggKx/5l7GofTQUvd
 GCRujPs/ZbZyNQ5oAUEfQJji+QeGs8fRUAWXskKCLa2jpspMZYnoMrvwGJs51qiW6VHA
 WM0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/xr5qmxLdgB9gCfaqJ3wz2wdEu3weffHASrMqOPIR8ezS1QRqLVIEEp+L2nnjt+YzxukSg3Dj/oM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRbKEl2Q5l47TNxq8WXdUKdCKLbGsmA3Ot0QJxGUw7+lHCy5JG
 wsprugDioC3+DRd7+rKGocHrFUZg2LgmEldqfVhn9B7vBSiZK5lnyAJw8eAHiLKgQfUJw1HgjdX
 hB10djotbhtqgN4WSFA/4SLhqJ7yYnJ3dhJ3xWg==
X-Gm-Gg: ASbGnctlcPoCqMfKly2xiYF++DsnwAWWDHj5PJxzS2st/jt8coVvrLLSHyYUHFLHm52
 HS/7GJoFdJMj7LsnAGVBeDHXvEWaYVb7QGYaCjg==
X-Google-Smtp-Source: AGHT+IHIjDAY0CeMFb8m9TSevBaBVTCKqRFyfh+kNjImU1zEaK3nbhnQly/UvFHprufd4KmZu0cAQ8h+MllCdzsOhPY=
X-Received: by 2002:a05:690c:6112:b0:6ee:8088:831d with SMTP id
 00721157ae682-6f1b393fba6mr22967987b3.3.1733993642309; Thu, 12 Dec 2024
 00:54:02 -0800 (PST)
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-9-0b1c65e7dba3@linaro.org>
 <f8f9d726-0428-42a7-9f8a-db10641550ae@quicinc.com>
In-Reply-To: <f8f9d726-0428-42a7-9f8a-db10641550ae@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 10:53:52 +0200
Message-ID: <CAA8EJpqxXB6YqajHziENuJMXfR1eg-qgiv_o2Y3-ZrL-Bm_qNw@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, 12 Dec 2024 at 05:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> > Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> > to program audio packet data. Use 0 as Packet ID, as it was not
> > programmed earlier.
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_audio.c | 288 +++++++++-----------------------------
> >   1 file changed, 66 insertions(+), 222 deletions(-)
> >
>
> Please confirm if dp audio was re-tested after this change. I would
> prefer its retested.

Yes

-- 
With best wishes
Dmitry
