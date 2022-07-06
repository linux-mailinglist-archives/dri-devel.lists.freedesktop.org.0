Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96795569069
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBBE11A33D;
	Wed,  6 Jul 2022 17:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4485611A3BE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 17:14:17 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id x1so19162315qtv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 10:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gdl58Y6eruxO/UF9iHebd7iAX1fPwcfZcdGK1G6I67A=;
 b=NcYmRAhNkr+Sej+dUBW/rUemcu4qhrB0eGXwYx5FTFmtQ8tKRufDlwJ/lkS7wER2zJ
 jV6wRoRmAMNdAQSXMkcvIOLC2e60hR5mw9xUwmncmRINM3JFeYMHnzmNaXHfIjFlbf7S
 LDX+d7jVDzt3eROD00YFUpwlzzpN+FGYYubdZ94XUT/jDUnTLGCPskgT+K5yZnTAH4nR
 9KN4M7fzv63p/y1wtxjpDfTTuC85SufMiPGqenPoHFa91gprzBOo9A8iG+THujkecbCy
 fhtfwsTjXDPXOWFw8PTjz5echkBOFR7P9QzIipHzfLD0oVava1d+90rXJYk2Old6RtK3
 GuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gdl58Y6eruxO/UF9iHebd7iAX1fPwcfZcdGK1G6I67A=;
 b=k/s1ceR07vIF33cZdZI/rAJOQ3QQgFOG22wDQb3Yvh+4q4OxQwIlrvZCjg0aKtYvSB
 3EMZ1PvRaKbLlJtBkRhBQ58VYcQvws5uB968mko+sFcWbuQIb6HgJUz24xkcFQMogVPr
 xls7plYHssB3csG98vZBj89u0k8WLd+CduHK3rzOj8X5dRqqpxDFiAREzNh0Uo8eeFWA
 vUNyEmnA+RRh1y/At1MNLxr/+AQRc/+gubIh2w0EF/Fw0xMjLao+XrA99uu/68lVP+LA
 l9F+IUNP5bGqpkjhMDUYFgT+D6MQHk6YcXWFFXnPHDrfL88w6ulGxtJFSHYHzUmAupXB
 3MeA==
X-Gm-Message-State: AJIora8/bYKxGJfC5VzIFvAwqz9WEo8Cwf55ULWDLNfM0f+hIfYs29Kz
 9RD2Yswnf3LBvivZt3bh+RwWOoWUq0D1Ou6Ui58xkA==
X-Google-Smtp-Source: AGRyM1siyHqhjYbCijMakD/a+R1/ORAjQrKAxonXg7rZEccsGYIKNljc2HpasXRM2tM13BML+/t+aFxBEkjO+7fgSBU=
X-Received: by 2002:ac8:5c96:0:b0:31a:c19a:7da1 with SMTP id
 r22-20020ac85c96000000b0031ac19a7da1mr33974182qta.62.1657127656137; Wed, 06
 Jul 2022 10:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <0083bc7e23753c19902580b902582ae499b44dbf.1657113388.git.geert@linux-m68k.org>
In-Reply-To: <0083bc7e23753c19902580b902582ae499b44dbf.1657113388.git.geert@linux-m68k.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Jul 2022 20:14:05 +0300
Message-ID: <CAA8EJpp2u4NuimhvkXwcO2kPQCopgbDV5x=B+LEkyqoQrSW5rg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/adreno: Do not propagate void return values
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Jul 2022 at 16:18, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> With sparse ("make C=2"), lots of
>
>   error: return expression in void function
>
> messages are seen.
>
> Fix this by removing the return statements to propagate void return
> values.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> v2:
>   - Add Reviewed-by.

-- 
With best wishes
Dmitry
