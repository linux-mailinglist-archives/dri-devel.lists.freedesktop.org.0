Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F449888A9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 18:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3E210ECED;
	Fri, 27 Sep 2024 16:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mE7obZMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678A610ECEC
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 16:02:25 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6db67400db4so25465607b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 09:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727452944; x=1728057744; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oGIro/Gw+pG6C+1E3sPWUSd5s24w2G8NI6gHk8UMPKw=;
 b=mE7obZMjW0VXqY80KpAG3bjVBfOFHLIORVEAdE2XlSl6a5FDT/5LijfqhuIG1I+w/P
 5JM+nMUO5QOdfTLlwXh2UfNKOTGMZD8iNtxcucZmYEy2vrxH7Pi3zFpqlGUm8JMkcuoT
 gKGDMZzquTbDNawB2+Lk2NYRsuK1wANpb+o1L6Wwm8dVZ0sN3Qr3HzqPf8KIoHY+LlgL
 04Z5PT3hKJ7Kush+/17sOZLvdqWluBRRwn6x3yTDkboh5lNKsDNP7HIw3wi7mAjRxAqK
 MmWsJ4yW4pOM1m1PN/0kz+8UqF6FhzrpT7b3Y9+qMhcNmL24B/miEuENPLEmQPPJshbU
 /xQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727452944; x=1728057744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oGIro/Gw+pG6C+1E3sPWUSd5s24w2G8NI6gHk8UMPKw=;
 b=l5uAcpj+pRHe51igpsYO7M+/O0gGrfUgRPclIgCxauVQyvqv0REXK55iR4MEeSgCaC
 /Une3tJFhHa5CuiMibd8rddvqyiZmgFGQ7aCr0M5SceRyNCrlsDFwrNefoVl78+g0xnV
 R0Jknxp+S9M0HdPOLq+5ubYTbklunbn0a+WVNZI4vVt3A6DOnlAUMtVq1XHcllsZ3Yjm
 wEE0KYa8GjHJyaHdXH2yQYDHQ8X+bI9Jq0acLsT3nZ18F44B8tFFySNf4oo1T3tbSjlg
 qCcWYk7VKxvdVeEEGrSefZ0Th2MylHW6aQVY7lsAN1Uk1dPkxHOKp1QxAl8GaWaCdsGo
 mitg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQC0DkbmCp8iTWMzhjs1uUzqOgFbXrdDL33vqBI1UbF2tbL32K/AggL+jAbvVF7lMfs4/xzhOuNmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzWi98lCKZAsj8URVNZX4jvZuUqitawbucYoQYhZgpuoLrM0UJ
 xi8Q09WuNsZreK6IQIR7j3k/91j5UMXuqqElKxaU/sSmR4o26miunRolacxKxjROAFCZxrDxglM
 o3JhQDVLILTQjJrNgAz88cbr/XuyfJNbJClBJYg==
X-Google-Smtp-Source: AGHT+IFKb/vMmnggV56geE4/LB9PLjbBe1DnuIle3XzTmcqytPrRsrd/oj6ZHjXqBbLDkzsVtWhd/O27c6gwZgRbuEk=
X-Received: by 2002:a05:690c:f0e:b0:6dd:c768:e58c with SMTP id
 00721157ae682-6e2473b6783mr34335307b3.0.1727452944048; Fri, 27 Sep 2024
 09:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
 <05c1f93940c38087e8d245d2b6bf90e0@mainlining.org>
In-Reply-To: <05c1f93940c38087e8d245d2b6bf90e0@mainlining.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Sep 2024 18:02:13 +0200
Message-ID: <CAA8EJpr0C-gXDoJsStTxJzCMEkbZaPeEAcBES3GqZp1FcKb=4Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
To: barnabas.czeman@mainlining.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@somainline.org>
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

On Fri, 27 Sept 2024 at 17:39, <barnabas.czeman@mainlining.org> wrote:
>
> On 2024-08-01 21:25, Dmitry Baryshkov wrote:
> > On Fri, Jun 28, 2024 at 04:39:38PM GMT, Barnab=C3=A1s Cz=C3=A9m=C3=A1n =
wrote:
> >> This patch series add dpu support for MSM8996/MSM8953 devices.
> >>
> >> Note, by default these platforms are still handled by the MDP5 driver
> >> unless the `msm.prefer_mdp5=3Dfalse' parameter is provided.
> >
> > Could you please provide a summary of features actually tested with the
> > DPU driver? Have you tested YUV output? Have you tested RGB planes?
> I have checked all planes they are working fine.
>
> > Which LMs have you tested?
> I have done some more testing and msm8953 LMs are fine but i have found
> out
> on msmm8996 LM_3 and LM_4 is not working as i see in downstream sde code
> they are not exists.
> This kind of messages i got for LM_3 and LM_4
> [   34.751091] [drm:_dpu_rm_make_reservation] [dpu error]unable to find
> appropriate mixers
> [   34.751112] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw
> resources: -119

I think LM_3 / LM_4 are WB-only, but I didn't have time to check that.
Maybe it's easier to omit them for now.

I hope to get back to those platforms during the forthcoming or the
next development cycle, after (hopefully) finishing the HDMI
conversion story.

--=20
With best wishes
Dmitry
