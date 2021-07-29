Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578E73DAA25
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 19:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6764E6EE1B;
	Thu, 29 Jul 2021 17:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FFC6EE1E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 17:29:39 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id t128so9463966oig.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=nuL9Gtrngyb6HozKG8XOhySmiHppyZ4SPKwk+KQp+Zc=;
 b=JdtXha2KVXzKZ2i+/dg6/TqTi8BKHsyrpUafLCGrH3a4/NrAgfn9+1VV61+cKYypI/
 zQis9HjO0mRR/RhoP0rU+vdBW8oNeszZsNBI9t+oY9amV7+Q38G2zdiUy58bnHalNRVT
 BzZ5MybexeU8CXngY8eZukXE4Gw0vor1OAyfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=nuL9Gtrngyb6HozKG8XOhySmiHppyZ4SPKwk+KQp+Zc=;
 b=G2DNCKXtdHRsqavNT8wnY2aUiOQaH8LYqkfA7yPgFhdSUBdtQD7N4JhtPL+Riw2Yvv
 N5eiqSQerLGBOLsxjtkuiLIyFFjRaB51NhN1PE4QHzmeSPtxrqeXzDSTz5furFtbOyNR
 QB+FnQMVvGyKbfjvRcJaPVaSrc2hQGt4wvhKoMJeAW3VT7DQuMp0AHsPke7UxJlKAXMd
 r1II6rrVgrb/jKMxp7jRdHgZiOlup5HcGNaPMHFGsmwHsLOYD8pio4J3VLpY5q9w7HpB
 DOP3Th0EQ5m31VHuZFNDFLGECob91n15G3Mx2DpEFuBhxriJTMfw7dB59MzFRKgKQVNF
 YAPw==
X-Gm-Message-State: AOAM532VbUa8g6gEG4bpQpyWi1v5/gcuNT+SM9O2ljT59QBUAlUSjTVX
 qfeyw5b/iyx2aDuEb0Wxs4Hrn0xuhK9orvgnis4XTQ==
X-Google-Smtp-Source: ABdhPJwi3G9rwu5lrD06uFLjaL3kNc79dxhFbRDbNktWD54FVP7PGqPqCjr1IvDBEJd9gDzQ74iPrFgSWrFNyjY6nRc=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr3928249oiu.19.1627579778357; 
 Thu, 29 Jul 2021 10:29:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jul 2021 12:29:38 -0500
MIME-Version: 1.0
In-Reply-To: <20210728172330.v3.2.Iea8318d85a23f0167fd523ea85df5630147649f9@changeid>
References: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org>
 <20210728172330.v3.2.Iea8318d85a23f0167fd523ea85df5630147649f9@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 29 Jul 2021 12:29:37 -0500
Message-ID: <CAE-0n50GLdByWnMxf2AZJ0r1pdZFRwG3b5t3V69wZY6H6pf32A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sc7280: Add gpu thermal zone
 cooling support
To: Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>, 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm@vger.kernel.org
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Andy Gross <agross@kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Akhil P Oommen (2021-07-28 04:54:02)
> From: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
>
> Add cooling-cells property and the cooling maps for the gpu thermal
> zones to support GPU thermal cooling.
>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
