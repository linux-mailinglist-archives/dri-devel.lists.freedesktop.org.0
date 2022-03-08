Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 902D84D22BA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 21:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4E510E360;
	Tue,  8 Mar 2022 20:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B4410E360
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 20:36:08 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 n5-20020a4a9545000000b0031d45a442feso426240ooi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 12:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qVaJCfxjsUXAyjD9fhWkvYzGM86k2JdETPIA3qn9/JY=;
 b=kilFiNI5uz22iSJPK1Gt8KB1l705LrDfOOJTBrWLBRjWLsOv9Vx0dmkSuJDHS8YUR4
 nj6Cgp99iN79rUXo3IbjsynDHsneQ2aM2fN8+C5qTK/Zxryr437+/N8aV9hz+KVWy5Ex
 dypcGDKJ1gAJcXM4b5HIFVedOF0n22V06x7BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qVaJCfxjsUXAyjD9fhWkvYzGM86k2JdETPIA3qn9/JY=;
 b=eKux9rGwQeHHmi/QDuev665Zlj2KJ8hFjfh9Lx7fumUe5KqaDASSQPPt6Arvyg6EEr
 tpLcAVzZk7V8FehqZ01sIK14kTGAjPdfzaFjGCUhVHOvK2sd8JL7eDf/W2g3nG1aRyKB
 NbG4XNLRluMz24y7uugkOW2QjycGZm7DZ0PS0stz3GUMBLIEGuZX0W5wx4V+xqQEGOPp
 8qxImm9fhzDuccD2VnyZfdfcf7vAHT/T48hG/hDeega74cgarvAmd2lLNSGzk/iKcv6k
 i6zOa7T9dHsyBrg6EFNR9aK6miVlhDZXJZIEiN3Y1UurQcQ1MpymHggm/OqlgkHjdQM9
 jH8g==
X-Gm-Message-State: AOAM531yXQVU7/6aKCV25K4s+6RIkDFWFhjfe+2+qPDvdmEV5W52CbMa
 xqo50JruEqJDE1zJqxgsxmQ4VkcDZKHaI+RqsCTquQ==
X-Google-Smtp-Source: ABdhPJxx/oEwjmfSR8atG/+Wq8RQXmGfnslvHo7Kqa54uPuTrLx6bcwyb6JqhK/QYSqu5rmC2ZrOkU7VXX3UHlgihBY=
X-Received: by 2002:a05:6870:d250:b0:da:b3f:3211 with SMTP id
 h16-20020a056870d25000b000da0b3f3211mr3492462oac.193.1646771767902; Tue, 08
 Mar 2022 12:36:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:36:07 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-6-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 12:36:07 -0800
Message-ID: <CAE-0n50jrtvunQgj40nrwOjrZrsKunOixnHGjMCvu+wEHG2nLg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] drm/msm: allow compile time selection of driver
 components
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

Quoting Dmitry Baryshkov (2022-03-03 19:21:06)
> MSM DRM driver already allows one to compile out the DP or DSI support.
> Add support for disabling other features like MDP4/MDP5/DPU drivers or
> direct HDMI output support.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
