Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AE79695BC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3577110E411;
	Tue,  3 Sep 2024 07:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rUjYgb7M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787EF10E411
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:36:39 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f4f2868621so53219691fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 00:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725348998; x=1725953798; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kqcEYObkrC0jQZ4XALAJ1vO1P6Mi2ZZhNfK7jC8/8yY=;
 b=rUjYgb7Mq2ae1JKbpP3x+/2iKfqVDRyqMB96A/g3bUMYuEw4cQH94ALmxP3zRDTcTY
 i0I7tnuz6dmsuc6agtgg5bUBAnnuShqkhcq0aCOV3SBNsZt17UT4LURbmhU4RpcuevM/
 WsCjS81CDJeC1ae9bcU70jYfGZztPXxx3kHCOIXzPnnpnx/cUNJyhuDvhyDIE8cMi9Mt
 oOZB8ayN3T4rkloKQBY8Vlw4pF0WRLKtUAhaij/O6IaOP1JBUOHwGXZ+CoaRWjv67YKJ
 l4Yf4Idlpuq/vYhLEgCNCL4nFXEnoe5bAl2xrotxe+EOA/b9iFeTLcCgSl9bX43w+tZE
 UfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725348998; x=1725953798;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kqcEYObkrC0jQZ4XALAJ1vO1P6Mi2ZZhNfK7jC8/8yY=;
 b=xO8TklqlurEWuoecgpcm7lV+uUYIaZVknZaHMak3s30pEDUtr1wYOxSkkJLRM4kMSc
 8x+mGEapMSQ2BTaV9BHuRGwaIQZCk99PSMYReGST3zRURvlaVGjmzf0efHh5SMHaXsHE
 p4RIW2yK02feAqOwI7m2oPk83Ee07fLhMe9DYebb2Wy8hXlsnYueyx0qqb2UJJV+uL8r
 BIWAc0r63y1va/Qa8XeSH2iUhoRA5fjMrT3KUW49YzzG4DxZYKIN4LdFazsiuILDdWom
 94u92b3COvwF7S2fvUiwzhEjEvztEx2pEuDtCMKgE6FZgtN7pPdOxinkxEb08EGg6GO6
 eiqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/VXAwo8oRraF2peavi6QJGic7946NlucFPPYaw5Xa86/+RO7Y5DGr6lWoSC3l5GDv/2qZDEf/WVA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWGEAvlXmluFmt7e+ySU57uj7Scc/H9wZUDeVW11N+adZMXdqT
 H0acUSJuZ9EmLWnPYpqTRZovaUX1r8l84d/wjhk0x69vMtkV6RM1SCHXOIuwoaizt9hLBJy/fCy
 wtObRfICcrr9C4sXC6erE/BXa+nnGWNVe1G51cg==
X-Google-Smtp-Source: AGHT+IGteQhWMzNbnFN2+qKmtjU62TM1lL3m0+11wewZW7P3uvaelhDjpcxaWwlb8wZ9QV901P1BCZNJ2yN7NdhKUJc=
X-Received: by 2002:a05:651c:199f:b0:2f4:f8c1:2e91 with SMTP id
 38308e7fff4ca-2f6290ea8a5mr60244041fa.45.1725348997477; Tue, 03 Sep 2024
 00:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-4-bdb05b4b5a2e@linaro.org>
 <CAA8EJprKnd269S_KMVUDk7UfT-c4ighPq4VkX-nEkwGg8ys1cQ@mail.gmail.com>
In-Reply-To: <CAA8EJprKnd269S_KMVUDk7UfT-c4ighPq4VkX-nEkwGg8ys1cQ@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:36:26 +0800
Message-ID: <CABymUCNCZFx3kMtxXt-U2L+_ks5oCCWMF0k-NyFkp99-aTqf-A@mail.gmail.com>
Subject: Re: [PATCH 04/21] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:04=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > MSM display controller support multiple slice to be sent in a single DS=
C
> > packet.
>
> This is not MSM-specific. It is allowed per the standard.

I do not find it in VESA standard 1.1 and 1.2a. Could you help point
me the standard
link?
>
> > Add a dsc_slice_per_pkt field to mipi_dsi_device struct and
> > support this field in msm mdss driver.
>
> This doesn't describe why this is necessary at all. Is it a fix or a feat=
ure?

It is a feature per the name. But I do not know more than the code from QCO=
M.
And different value other than 1 is needed for some panel with QCOM
SoC per test.
 So I suppose it is a key parameter. Any more idea?

>
