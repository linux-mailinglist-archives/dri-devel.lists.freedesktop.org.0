Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19215629E57
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 17:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8EB10E161;
	Tue, 15 Nov 2022 16:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310A910E161
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 16:01:31 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id bj12so37075066ejb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 08:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YCH6PtmHj3XKQVwXY2Gm1n1n5KTgNrZ2aoxjacIPkLA=;
 b=XSZ1UsKd72WGVsU13AkxPx13kvV7eBMN2rk9mYv5/1BlvJuWdPfmvCjHqGY1YHuX1S
 ZKcO4QYOE4Wc2+/sm0oCJqKm0mbgDpEta1QZXmLqmoik9/WEh1cA5d8rjRXkfeZwUrS2
 t1agO5hRMm5K5WuuenC90gkUkRgs3BSOw1BPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YCH6PtmHj3XKQVwXY2Gm1n1n5KTgNrZ2aoxjacIPkLA=;
 b=XNea2iXnj+bpjy9hVHgH+DIE72U3zqZ5fhClXSUG4E8EbsV/4dQFxBDBMBJ9Hb/FHE
 vNq6BSwdcb4GPoa7gIRoNcBfr/tTi6IP9lRqt7WcOeNGX/8Xo9qgzdq9pJC0TNUfr813
 xnRoKuJb7OyS46Io7Xa5lqCsh4kXguGXBg2e3gFInCcOWYWth5TewBhIUpULA6bw0z3S
 gNfMGYSRROCuXuCKdiNbZrA00CVUhLbCo6N6x4KQDa0upIFIevaDhpLLa3oJDIA/xbDP
 MJY5NFpT008cjpCx0W+glC77DVjrk9OC4FtAbkLAWG00/LX7+J4ErfVPH09dWEYVj6Ak
 16Iw==
X-Gm-Message-State: ANoB5pnIfX2/AGmH73LEOsJm1cp6SVgGB2VBNYW8iLKIZHCAwdtYkql1
 Tk6rtwHmBQMuIb3+fWYdXZXLP/SFoREfqQIw
X-Google-Smtp-Source: AA0mqf4IzWQjQ1es/EcNDjnZ+KYCbt37yrSi/HTbSmYG5yOjKVzqG/tLjhWVTpAm/Dhc15lNqz41Mg==
X-Received: by 2002:a17:906:a448:b0:7ad:d7f9:1f96 with SMTP id
 cb8-20020a170906a44800b007add7f91f96mr14133282ejb.384.1668528089442; 
 Tue, 15 Nov 2022 08:01:29 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 rn5-20020a170906d92500b0078dd4c89781sm5699131ejb.35.2022.11.15.08.01.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 08:01:27 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id k8so25084116wrh.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 08:01:24 -0800 (PST)
X-Received: by 2002:adf:f145:0:b0:236:5270:735e with SMTP id
 y5-20020adff145000000b002365270735emr10938918wro.659.1668528084437; Tue, 15
 Nov 2022 08:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20221115155535.1615278-1-robdclark@gmail.com>
In-Reply-To: <20221115155535.1615278-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Nov 2022 08:01:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJKTHf7qLZkygfnMRSjXEdQ09opCpFM2brUc=uiTGyTw@mail.gmail.com>
Message-ID: <CAD=FV=VJKTHf7qLZkygfnMRSjXEdQ09opCpFM2brUc=uiTGyTw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Enable clamp_to_idle for 7c3
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Nov 15, 2022 at 7:55 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This was overlooked.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
