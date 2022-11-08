Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D462147F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 15:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1427710E467;
	Tue,  8 Nov 2022 14:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E4010E467
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 14:01:53 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id k2so38883861ejr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 06:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L7nl5lQt3BtRFyNK7IkAchdMRyk+9zHRzSrbcY6TD8c=;
 b=l3XRs4BBknDJDKcETah7sUuEbPcdxn4s2yZW7N6Rbv4y2svECGuzeyIELoGPYUGPL/
 ovpSS4xTGv76X/FvVvf/NLN4iFUDalLixA+D3efiUbXDlVeEdcm9QKbsF89TtjI4/KOA
 VGRRHbC0LygVfkFP44M6QvPmTUkp6IpkiDLT9R+My2Z2CK3Gi7UW0VjrcMwDgmahljlY
 GIiqSuO4H1Y9kk1JjqL0v9pdOSidPEZPWeXSLSZ9ZovmUC587W1cybF8Yvo/pj7xrI+X
 kB5p+bdGUpZRRqt663wVP/E4rk3/elYWgzMd3O/X1kPydbkiZ2DCpJD4dV8zsdxZzluH
 nQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L7nl5lQt3BtRFyNK7IkAchdMRyk+9zHRzSrbcY6TD8c=;
 b=pdKL/VslTnWLakF26W4GluHDKmztC6cH1PVeaZiGut9IfXr9zejzUKQWg/Y9WuDRxR
 w4Eh+gSupw9yGFNjFKuNhS4AlBvPlPi1P1sSs1Q9GaAQ2M7990vSEXdUvI+s08aP+EKL
 iMzBuJOf+xlTC9ndtImSW0mNx5WAMZvhNlbeFKyxIEXjHtjqMhDupwCU8bMF72CVdHVn
 wzBYJCxj+odzN6nIZVJZpSyPPtklZ++Wy2KdeB6i9Aao97Gb8gZ796SwHChhe4+mNltJ
 OgQCMHP0SCBqO1NMz6YULN9u4TXzgZoUmpoxvAa9P/YWF5UJqb+F0UhobmvvSjMntoMX
 M9dg==
X-Gm-Message-State: ACrzQf0rBQKDq/WxHPD3W8V5InVVHfaLMCVUlhtqacjiP2VwbJBtl4WT
 UtZz58Om0y710hGKYtqxgMwMsQAzWxAPTJkKXosv/g==
X-Google-Smtp-Source: AMsMyM6OersG+l3AkXV9lPpbOJTXe23AD2+kpKtn+WjIUc+U1IdpyJbjtgntS1SWh/nhgtfEvq6Url57kdNjqLqNAm0=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr21276844ejc.690.1667916111765; Tue, 08
 Nov 2022 06:01:51 -0800 (PST)
MIME-Version: 1.0
References: <20221103141155.1105961-1-jagan@edgeble.ai>
 <20221103141155.1105961-4-jagan@edgeble.ai>
In-Reply-To: <20221103141155.1105961-4-jagan@edgeble.ai>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 15:01:40 +0100
Message-ID: <CACRpkdYEW4z6EZ7UC9wT3NtRVnE=0L6AAHJDxtu5Jb-UrB+WSA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm: panel: Add Jadard JD9365DA-H3 DSI panel
To: Jagan Teki <jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 3, 2022 at 3:12 PM Jagan Teki <jagan@edgeble.ai> wrote:

> Jadard JD9365DA-H3 is WXGA MIPI DSI panel and it support TFT
> dot matrix LCD with 800RGBx1280 dots at maximum.
>
> Add support for it.
>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> ---
> Changes for v3:
> - updatd to WXGA
> - use JD9365DA_CMD_DCS and JD9365DA_CMD_DELAY

My comments on v2 have not been addressed, for example I asked to
remove the delay from sequences and just use an explicit delay and
to then use the existing sequence sending macro.

Yours,
Linus Walleij
