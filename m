Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41826910D46
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4185610EB33;
	Thu, 20 Jun 2024 16:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PyEmtXaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0F010EB31;
 Thu, 20 Jun 2024 16:40:33 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cfeso11215271fa.0; 
 Thu, 20 Jun 2024 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718901631; x=1719506431; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybRqH+f3jYJpqHLaTIJ36+rntUDMcpku54YvTURH+dM=;
 b=PyEmtXaRU/RTucqdThSYPQLDQgnKmzNgfEVmDHJPXBXx5r8ZB0/qcYX3triKbkU+x+
 sR+9pjhZZs0xI/iZoFUXsCyM0d5sWaYP+P+diGjl7fOY1ojHt5gNGNDqx1SJ5E+4DMJZ
 7qfaEiN+EunLdfuLRLQa4uUB8NYOCJbAj3AkuY3E17rQtv9tCOVU2NqvdmuLxEnUuHuY
 4yFHkdwoSYSHnr7XFQPtr44BVnCWX2QTRO5OGplwGbqCuJbIEeRmxVtUoSYk8YjwA9UG
 O6eSEXLkWTD4Ko/8CaL3vW9I08m5E4YrUqkULQ194c42iPr45/Gj/P5Id6OvluImE15N
 3BmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718901631; x=1719506431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ybRqH+f3jYJpqHLaTIJ36+rntUDMcpku54YvTURH+dM=;
 b=H+Tj0bbH3YOcueSghbapfjkdkhsLE21ItLNAhu8baF/AvyiMcDslET0MJruCBlxsyr
 EeIyfHkuyWoSlRBFbK4i9rzfzFEzy38/vX4t+NzK0lteh+JWg6LRno68YLWq3Ln2rXIS
 MKMuNPWA6QdpBEZYmycGhfkAhEnOGLQK+capUfn+nTXdovoEfb7kNit5qSHsjMuvWSPG
 NsdGo4NzROr73M7o4gtFDaLWXvUzGB8lM7sQzYPTYj8Wz8ZQEaTB+ARqNfMxPzbVZbSA
 tEZ76yQ7q8uQmKUXXdKX4guh41QjvdKLLfgDj/lEFGnc1Ep4R5RQyRVA9mkkXWgwfgou
 MCbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOmREamqJi/TxPN0K45xeskTYyb85r8ywDqRMlS6JhHKRkRBnoJUXuePSFa9DWphs0xxQe2KFwOaOXhdSsUt12lpkMxpvI+yknI9vVKvdT
X-Gm-Message-State: AOJu0YzqcOPdWPL+CVNp6FEoDjM4CTi+gG8RXhfIzSCjakdrmu5eQF0Z
 sAUnvTfhN/8HuARfJEA4HFyccciVSvNs2rfhpBRWHhk1TjWfaE0luY9p2pEE5YzAOmQXEvGXn2t
 fjtx/xqqjlWToJ9T1wYqATAUYglg=
X-Google-Smtp-Source: AGHT+IGvqdAlDx6Z6v6araLkEoxtUYIgBR7BNE4u41+u5r5Ox89EvqTbeZiT2Cqa/Zme0pueUrHwq2W88SeIlIYAC/Y=
X-Received: by 2002:a2e:a9ac:0:b0:2ec:3d74:88ca with SMTP id
 38308e7fff4ca-2ec3d748a31mr44402911fa.25.1718901631136; Thu, 20 Jun 2024
 09:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240618164303.66615-1-robdclark@gmail.com>
 <20240618164303.66615-6-robdclark@gmail.com>
 <ecadeb37-fd12-4b63-949b-136356a42362@linaro.org>
In-Reply-To: <ecadeb37-fd12-4b63-949b-136356a42362@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Jun 2024 09:40:18 -0700
Message-ID: <CAF6AEGu1VArhyYO3+oV5WGcXTBZxCUFrQcpM_fuT7wJakA8AFQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/msm/adreno: Move CP_PROTECT settings to hw
 catalog
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 18, 2024 at 12:02=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linar=
o.org> wrote:
>
>
>
> On 6/18/24 18:42, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Move the CP_PROTECT settings into the hw catalog.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> [...]
>
> > +static inline void __build_asserts(void)
> > +{
> > +     BUILD_BUG_ON(a630_protect.count > a630_protect.count_max);
> > +     BUILD_BUG_ON(a650_protect.count > a650_protect.count_max);
> > +     BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
> > +     BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
> > +     BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
> > +}
> > +
>
> patch:394: new blank line at EOF

removed the extra blank line while applying, thx

BR,
-R

> other than that:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Konrad
