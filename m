Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B0AC6E64
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 18:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3308810E640;
	Wed, 28 May 2025 16:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EXhGRBQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2E910E616
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:50:50 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3dd7553c7e3so190795ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748451049; x=1749055849; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mLSfvvzNdOkPMdQtfbrJhi5GREToG8+aqY66T7Y+nY=;
 b=EXhGRBQemvReE/RdSthbWlp4bxIOBvWBUgUSnnXGgMb6lfz7+cEpBSgVAT6jwkqWeX
 ccIhJ5dCUoB6xHP2Ojm+/ZjXZKM0OWxB4pYqrOlsP3eoMEuYlVSHBVnsWa41aRMHK6YR
 H90fmFmMmi9ymqKS7zDrhwvwZlxJLOAWkRBp0nvAkrSb4rQ6vrwvBQAccPw84qaiaLRF
 mqx0gduKbRS6BqO1rcJw24EMv3287tcZsAnvnT5P06wDuHhhARc1LHLAlfeuQO/g8PiY
 D0EoxGZJfuKOKtPwyDaxW/MxukiAZk45GpYBW1+I64vNo2sShTS3ULgyxFm0tGXSIR56
 haag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748451049; x=1749055849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/mLSfvvzNdOkPMdQtfbrJhi5GREToG8+aqY66T7Y+nY=;
 b=EqXHeAytwd9eFwhmL8CEsaOhioO2f0t+iKb/c4iWcLBEs/g4hiE7BgyqK0AFTHloOr
 kZ3omUfnOd6fjwvPca0uHgye2a/Ehdafg5sJWg/Pe6h2wunojNGkcXaz6qdr1/9SS/3z
 ZSPs0gfpysDfVpamprk5wkYf3NVFuAIoACiykW1dNVYqNfaYDHx/T5zqJqGCgNEcJUEP
 C8bG2vQlYH0IfAl4pmJ2NbDONWmRi5gwGm/BexPbjBptatIXmv8kFVQACjsLHbklhczZ
 04DqLSeL314h2tzWAtCO47uOMeFhYGZvr7/OBBh/mHH3YzA4Hr6mLNwXrLoWAfh/+hHZ
 jTiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS5R4x4qhNcZkkuST02xHgXWUcp/OQjXps4a6QLjmau4x+1oIn+KuiVF9DN+zjirlAFcvOcshEATM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCZrherDWJ8hsMvhByS/9F6ilhlgLWJRhzQgAFecHjs5I8osm2
 lEP4sHbbIrB56ZCNe+PhwXg7EihkfX+TCQoLfyXKd3kmeKUlOHtE6/y2EwXfRuITGfy22WYBTw/
 YfMG19BTkhgsrM6h1ixtz+8Ky21nPKMI=
X-Gm-Gg: ASbGncuA10VMyDCdzjZrvKxddAa8Q9qJKMez+qC/TXqz78z6m3mSDLWiNDlNs0bfzL/
 zBADwdRJRp39S/0p5VRs3Ok4LQ8b3wmXODs7VZBfqjy8C0U0kfGxzSxXw2yrNpxzzukxqjnVhIU
 yv4U1AaYw7rzGD/t9yJzGf8C5NYPkGCC63HTrs9o+EspARRZj/M0OnAtHQZcbNyPTU
X-Google-Smtp-Source: AGHT+IElCD9X0MUXc0KEJ35rGa0B2HBelp6NlkIwYIdR4AR+DIEjxBH8j0THx1Zrl04nM1P9nG1x7zntR3Atn44k4xE=
X-Received: by 2002:a05:6e02:2193:b0:3dc:8667:3425 with SMTP id
 e9e14a558f8ab-3dc9b70f000mr157653325ab.11.1748451049219; Wed, 28 May 2025
 09:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
 <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
 <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
In-Reply-To: <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 May 2025 09:50:37 -0700
X-Gm-Features: AX0GCFtYvoKOHGtMqf1X52z4CG5iI44YIX8TXD4Lf5SvSxvLMNmudG51MafUAOQ
Message-ID: <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 jens.glathe@oldschoolsolutions.biz, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Tue, May 27, 2025 at 11:18=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, May 27, 2025 at 12:55:06PM +0200, Konrad Dybcio wrote:
> > On 5/26/25 5:28 PM, Rob Clark wrote:
> > > On Mon, May 26, 2025 at 1:36=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >>
> > >> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote=
:
> > >>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
> > >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >>>>
> >
> > [...]
> >
> > >> Yes, please. Don't set okay status for the GPU until it gets enabled=
.
> > >
> > > Drive-by: Shouldn't the dtb describe the hw and not the state of the
> > > linux kernel's support for the hw?  Ie. if bad things happen if we
> > > describe hw which is missing driver support, shouldn't we fix that in
> > > the driver.
> > >
> > > (In the case of the GPU there is the slight wrinkle that we don't hav=
e
> > > a gpu-id yet so there is no compatible in the dtb yet.)
> >
> > My two cents are that it's okay to enable it, at least in this case..
>
> That would most likely make display unavailable as DPU driver uses GPU
> as one of the components.

Hmm, perhaps we should allow the gpu to probe, but just fail to create
priv->gpu, similarly to how we handle missing firmware?

BR,
-R
