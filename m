Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37DE4BC2E9
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 00:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9BA10EA3C;
	Fri, 18 Feb 2022 23:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D8010EA7E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 23:38:22 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 e19-20020a4ab993000000b0031a98fe3a9dso5456236oop.6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 15:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=WD8tzmr6Gc9xsM6o0zTpMsmg98gwrdEpXYMfSuQzvAE=;
 b=hWsgHxEOfsPtol+MTw/rQABiw/ogBt1NwqQlWjDJv7a013wO74pb+pbnxCFW2zfd1K
 PmzdI+PK5juqzHzxuvZmWAUZJREUKpFwmttobU5iJIeSp1kgkJuSbiBntnMrdxDvv2cY
 Gvi3pvDFnGuRze/95TfSLSnvcLnTaAStKv9W8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=WD8tzmr6Gc9xsM6o0zTpMsmg98gwrdEpXYMfSuQzvAE=;
 b=AMu/D/qj5yJQNfps4jhjpxzJQjkt54i+y0KUMs8nOnJ/XDrXZByW4XIScn0y8MZdls
 kgA4RPoqXtTyx8nzCIJt1Bw0wS84Ql50hUmeqtB+YZG8I0QGOna1EKKTruGkTN0iwpfH
 K23zWZiFB9peSMYM6aaUA9FciQtSj38SQovWVfvwcUiLwHGZwgLymkSxlg2iht9dwJbe
 z9FvGM+dWPfOLPNAk5T5cYNiN08LCGCZaepOzzKm8/uNcaYfbXDli7InLAqK3PdFWTxS
 Iy3EMIDKi2m3XXXVaqnz9uwMIPkA8axI2QXBQbH/UWJ9YHoPPALLZ8hydJTMJCBGF6V9
 UCmg==
X-Gm-Message-State: AOAM533Ns6SdMhMZooV88qL7XQeYHUaiRyFhFPKIUA61wEW++0tqB4JL
 wtaU/kWm4VELlS9N6YhV7clafnBoFCwv7UlMSHzpkg==
X-Google-Smtp-Source: ABdhPJwdEQkxvsrBJbSY1CMQPrS2Bi29H8PeVBXyD3lU7f86Fon+eR4moQmyWhKCWzgrx9JyZAlY6Y8pppO2vSFC+6k=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr3644761oao.8.1645227501635; Fri, 18 Feb
 2022 15:38:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 15:38:21 -0800
MIME-Version: 1.0
In-Reply-To: <20220211224006.1797846-3-dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 15:38:21 -0800
Message-ID: <CAE-0n52EDHg8=W36SE_pKWmmvq4-2y6KLMQMdwLSU4h5pOHwOA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/5] drm/msm/dp: support attaching bridges to the
 DP encoder
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Quoting Dmitry Baryshkov (2022-02-11 14:40:03)
> Currently DP driver will allocate panel bridge for eDP panels. This
> supports only the following topology:
>
> - eDP encoder =E2=87=92 eDP panel (wrapped using panel-bridge)
>
> Simplify this code to just check if there is any next bridge in the
> chain (be it a panel bridge or regular bridge). Rename panel_bridge
> field to next_bridge accordingly.
>
> This allows one to use e.g. one of the following display topologies:
>
> - eDP encoder =E2=87=92 ptn3460 =E2=87=92 fixed LVDS panel
> - eDP encoder =E2=87=92 ptn3460 =E2=87=92 LVDS connector with EDID lines =
for panel autodetect
> - eDP encoder =E2=87=92 ptn3460 =E2=87=92 THC63LVD1024 =E2=87=92 DPI pane=
l.
> - eDP encoder =E2=87=92 LT8912 =E2=87=92 DSI panel
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
