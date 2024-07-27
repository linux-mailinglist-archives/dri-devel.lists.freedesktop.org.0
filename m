Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7C093DF63
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 14:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F1E10E0B1;
	Sat, 27 Jul 2024 12:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jLhr7jyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9343110E0B1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 12:47:27 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-654cf0a069eso4903467b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 05:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722084446; x=1722689246; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qm0K2iiwCjE6zO/ZiafleFRuipXYf73kca2DfX3AnMA=;
 b=jLhr7jyJIDomgYbbLlRJTmCNHQjV+WgIguwLpCEm3KfzBXpD8UQvzpKBy79AQZ3K/B
 RTHEQkoIsDIhQ7WpG3c4g2pnG29wgUY4DriN1xiT/KBmPQ5hnCZeDLEPszHgtcpXq4Co
 Cx1zo0/4NXxlUbepv1mMSKge5kRGn4dhu68gIsJRrLyQmWNt7g1Fk294hv1JYVULdPX6
 KpRZF1DUJCjmkAnc/tH0mPBne+3V3NNNBBQwHJ5S4+mObyqMrt2jFrtAcuikQosEXLXq
 yHVXKadl6gpYP6JKmF+3Rm7bUeyYvH6pLANakSdKLbnHytpK93iSLkjbRIoZef+aES4s
 OIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722084446; x=1722689246;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qm0K2iiwCjE6zO/ZiafleFRuipXYf73kca2DfX3AnMA=;
 b=QgHJySAjXaSoU0uxcWHTUEaA9dkStezhXp/7p1yY1xZgosxB/Vu82oGGEnmC5ov4sD
 O7GSXU2pVzUcEpJlozTcNCSGP0Cqo1YKK6FavJlzKihH9L4G/xrFicMtAwafGHdzSqFx
 md+++XuQs2TrDVVhQ0SEY7eQFnxv4WUd0U86zoNeMy5lOWpwIgYe9kbQIcz3n6imr2CA
 CQabDusPDXtHwMpmcoAhriVZcedP196dfe6XhcfCEk/wyOf1QhWcX8H0+c9nFWxrHT4Y
 s7hy8clCm8RyOGGhkYz/9KP5b4psPclrns87d3wM8v3PURSfO0JuaSj+5qGU30IHeaVh
 DCOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGL7LvB6KdScOL4yOk6tpu7Vb1iSVafu/8d3CfmfLYrX4/ad+6EGoYfD/CHCoq8JYIj/gqF2Fhl/vV22yiBqjJWLW1HYUo72Sgv1gg1r+l
X-Gm-Message-State: AOJu0YzRGGbsDNWKHv9hjhVT/mNsrV+H9yqOcfk/B+gh90NzDH6TasCc
 HujqvLP+PouZpp743iwE/8aw0OjtMQrgk2lsyFzp0xLaFofu/YnQWRfi8yeN4R+Q73QqF+ZvP9h
 UjPqk0zO1d8fGNDN4lRNSBeE5yvofdlTezV8eXA==
X-Google-Smtp-Source: AGHT+IEqbcAV41X4ysEtg0m1TQxIoMPD89y9he1KPVTcI6Tf0/ta8VQ8uK6NG3kpYoMoSd/HctShnal6IEhL9nfMghI=
X-Received: by 2002:a81:5c87:0:b0:650:a1cb:b122 with SMTP id
 00721157ae682-67a07f4ca6fmr27053727b3.27.1722084446649; Sat, 27 Jul 2024
 05:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240725220608.131426-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240725220608.131426-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jul 2024 15:47:16 +0300
Message-ID: <CAA8EJprYPq4gj3ZWexWW9jNc2806Q8VHEx-aJA4R-jFd76W=AQ@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom: com-qmp-combo: fix swing and pre-emphasis
 table for sm8350
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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

On Fri, 26 Jul 2024 at 01:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Fix the voltage swing and pre-emphasis tables for sm8350 as the current
> one do not match the hardware docs.
>
> Fixes: ef14aff107bd ("phy: qcom: com-qmp-combo: add SM8350 & SM8450 support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK


-- 
With best wishes
Dmitry
