Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6E2810722
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 02:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDC510E14B;
	Wed, 13 Dec 2023 01:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F66410E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 01:01:15 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5e2b8f480b3so752487b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 17:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702429275; x=1703034075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8HfANxUWC3WxKXWhqphH39nW3rgCcomC7MKMCC29Qqg=;
 b=hkcMjNI+0NGtjsn0q1KzvUX1Ka1pNPjP6xtkxHmMx4NfA7h6yCvxd+B5Pt0VtS7VSY
 +HboOjzL2LJB7b7WTJeTdwn9nrq5jNKHCsBtwgHSP4kM1sdk28e/sTRqhA5bDTBBd4XN
 25IWJEoeAOiqUpAeablrPhMl92NJaNJC7jwKbWdSJ7K4v6xnEIGbTqG9gmkA6JNt5s07
 TT3kSSmU+YUdV8Iwz0a/cizgbzU8qF1AMRCNisCHCwONNPe1KBo8fl6HoghfrZ6Xot6n
 opY+JgCjIaX33K3z8C15NtTA/Lr6OT65hQ/YAO++F8fGkIWNHonedFpYZS/SkrxhRbho
 WwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702429275; x=1703034075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8HfANxUWC3WxKXWhqphH39nW3rgCcomC7MKMCC29Qqg=;
 b=MDYcWn3PPoyZe5fSi1DNexANMti82H7p5siTi0E4g3JtnYt+I6nAiBuD5eQNgT7J6j
 4RQi83+Rv6RwXTSPoeEtHEfs+FrAwMJJ7vnPVX4LgXHK4xzphEmoeIbpGescP2EUF6Ic
 /OnIjVJ93hl6vadMe9MUNjckE/z+uIjWZnUHtgH148hvYYRpc+DkYUavM8+74IUWVgKD
 zXxccG+bzwPz9RkrcjgE0DHwijKKIyUrLVEQGybcaYmIR/Q6ybfywk754gu6an0NRXOO
 zkbpFwEgwnb6ojaZpPFRPNyDntEHvWboOaziCitMNe3lNznYj3U8dJbTgX/euxvXISau
 Ipdg==
X-Gm-Message-State: AOJu0YxvawHYdkryZe3bUBbtKDU8g1jlu5dfDVF+ooIjjYNL7q9mBCMK
 Is6LvFWMYGb8Q4C6YP6JePBZYZxn4UBALZiVp8qxgQ==
X-Google-Smtp-Source: AGHT+IHVi83Rrr1q31yucvfH4NV5e9tFDr/5T72ZOzl0h1OKhAR2Zyot33DCF6/ocWofbTJY3ircpd94xktl+xNzs9c=
X-Received: by 2002:a0d:d182:0:b0:5d7:e6bc:8641 with SMTP id
 t124-20020a0dd182000000b005d7e6bc8641mr5867867ywd.41.1702429274720; Tue, 12
 Dec 2023 17:01:14 -0800 (PST)
MIME-Version: 1.0
References: <20231213005728.53060-1-dmitry.baryshkov@linaro.org>
 <d485c123-4dbf-ef59-4566-bff84cae516a@quicinc.com>
In-Reply-To: <d485c123-4dbf-ef59-4566-bff84cae516a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Dec 2023 03:01:03 +0200
Message-ID: <CAA8EJpoeP-6-oPnruK2LA0=E5ga1Uu9LJi=xaQBeRh6+vwDBFA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: move CSC tables to dpu_hw_util.c
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Dec 2023 at 02:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
>
>
>
> On 12/12/2023 4:57 PM, Dmitry Baryshkov wrote:
> > Move CSC tables out of the header file to fix following kind of warning=
s:
> >
> > In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h:8,
> >                   from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:5:
> > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:54:33: warning: =E2=80=98dp=
u_csc10_rgb2yuv_601l=E2=80=99 defined but not used [-Wunused-const-variable=
=3D]
> >     54 | static const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l =3D {
> >        |                                 ^~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:39:33: warning: =E2=80=98dp=
u_csc10_YUV2RGB_601L=E2=80=99 defined but not used [-Wunused-const-variable=
=3D]
> >     39 | static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L =3D {
> >        |                                 ^~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:24:33: warning: =E2=80=98dp=
u_csc_YUV2RGB_601L=E2=80=99 defined but not used [-Wunused-const-variable=
=3D]
> >     24 | static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L =3D {
> >        |                                 ^~~~~~~~~~~~~~~~~~~~
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 44 ++++++++++++++++++++=
+
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 44 ++------------------=
-
> >   2 files changed, 47 insertions(+), 41 deletions(-)
> >
>
> Strange, I didnt hit this but change LGTM,

It shows with W=3D1, maybe that's why you didn't observe them.

>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



--=20
With best wishes
Dmitry
