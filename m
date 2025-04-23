Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE38A97D0B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 04:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E2910E3F1;
	Wed, 23 Apr 2025 02:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ur2bOFrx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8464110E643
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 02:50:36 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e7270e0edf5so5412289276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 19:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745376635; x=1745981435; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvLBDDsYBas19wUJSHN+4qLHbj0kQt2zzQgLxxn1VJw=;
 b=ur2bOFrxUJvC9XxZKckueyI0euBYgS6GRUYE7+1V7DXafbFl3OKI34U52Y/EwL/w0n
 dROy2LkAh1YZeFAfsQ3vOJr3dYeRfeDBOkF/+ZWZPwvDo+AmP3HFSR+1Tn7bwogFSgdQ
 otmNOr8NeCLz0BEILQSjcCo6DJqT3QRm8SSNe5MkW9taXPOXeABxQ/qDAWRcKqolWIoJ
 l7NX3N299zgUeQhWBuwCUOABz79p/BMDh0b7SjJpCSCqeBh6QnlWuBqdKj/GMFUOohGx
 xHn6zmKswPXV21WP+PXDeWpdXdDZfgA5BGHEiLUWxAXcGpk7Mmk3bsnYT8xdZfCyCR2+
 i80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745376635; x=1745981435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvLBDDsYBas19wUJSHN+4qLHbj0kQt2zzQgLxxn1VJw=;
 b=Aqda7dKjHdIMhdbfdOB7EHl9Ne250X5jhkXjtJoPtrXXfr+nr5RAdAUEbjivoVgb0c
 YE5OAVXsSma+qxK1AAkwxzTXfj4f671sN5zvP2LRW00W74rkyADJE10Uxt5zheYKVA2W
 NcYmQkPcs3ibNmY96Oy3VyPMtnb4C539SIcr+NwUpNy34nO8wuOmr3qmK9ZRwAHqXVjy
 g9foliLixcb8XLDP3770VaoG3I3t8YtqwLq90fj5no6q2uZvno9Rcb5AaonUsCLX4vnM
 x37lS/1Kp5mYms0Vo+os+DiwSJhCa51KDBpt0l4mEyM9SoiKj6vxc+vffR1zORjm+QWw
 +Dyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPtA92bw8p7x0e1IKg6Vxde2R8WSfFgEN5okBHekgVYEMRpkzwowRoculPtnr/er4gRuwanMjBpxs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/EsDPr+wUeWigaLHZHDd7QyAYQ1gQzW4OCxUTQQgJBdjrSjMq
 6gOeurgafuvPn+NF5WEfelVPSkK8vdoS1qVFDOqjfnFIrvBsJ+vLOaFRFbCjkU5V5xhRyWq2ySZ
 51NfTbWkj/9/d6hweT7N6Z/HWyeI+lr3IXAdgMA==
X-Gm-Gg: ASbGncvQIPakqmTjP6+fQVTw4MQXJyaIQevAPOz90h/grbfKJGIx1Nx5gaQQe7mMKGt
 Rtae5EJX3B9QZWHDcqffbiXyAkdpYpnSzt/c9a7xbkWzMqXnj+vIqj5yzxbKyyIYXXFWhzryme4
 fbIBlYI4Y158Czv13uENq98g==
X-Google-Smtp-Source: AGHT+IFS7GMJaX0GM076iPvZ4Mqv8sbSOQ2aAa8tFq8e5VIVWaIK11j6XpLBL5g1xrPI44TmKCq1OKq9pAfO+Q9jung=
X-Received: by 2002:a05:6902:1381:b0:e69:371d:67ef with SMTP id
 3f1490d57ef6-e7297e9ab9amr24210024276.33.1745376635244; Tue, 22 Apr 2025
 19:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
 <20250418183236.209236-1-mitltlatltl@gmail.com>
In-Reply-To: <20250418183236.209236-1-mitltlatltl@gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 23 Apr 2025 10:50:23 +0800
X-Gm-Features: ATxdqUHPz54vm6pZFuzIqsgbIcK5d4qHYfWOJGGxPj-jtXf6WoRf3GOGq6HIB5k
Message-ID: <CABymUCNL2FQax13vie8kqX_FpNOTZBPwKbxvKzmXHaXr2OjbAw@mail.gmail.com>
Subject: Re: [PATCH v8 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: airlied@gmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 marijn.suijten@somainline.org, quic_abhinavk@quicinc.com, 
 quic_jesszhan@quicinc.com, robdclark@gmail.com, sean@poorly.run, 
 simona@ffwll.ch
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

Pengyu Luo <mitltlatltl@gmail.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=8819=E6=97=
=A5=E5=91=A8=E5=85=AD 02:34=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, 03 Mar 2025 23:14:29 +0800 Jun Nie <jun.nie@linaro.org> wrote:
> > 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> > And 4 DSC are preferred for power optimal in this case due to width
> > limitation of SSPP and MDP clock rate constrain. This patch set
> > extends number of pipes to 4 and revise related mixer blending logic
> > to support quad pipe. All these changes depends on the virtual plane
> > feature to split a super wide drm plane horizontally into 2 or more sub
> > clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> > whole drm plane.
> >
> > The first pipe pair co-work with the first mixer pair to cover the left
> > half of screen and 2nd pair of pipes and mixers are for the right half
> > of screen. If a plane is only for the right half of screen, only one
> > or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> > assinged for invalid pipe.
> >
> > For those panel that does not require quad-pipe, only 1 or 2 pipes in
> > the 1st pipe pair will be used. There is no concept of right half of
> > screen.
> >
> > For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> > the single SSPP and its multi-rect mode.
> >
> > To test bonded DSI on SM8650, the 5 patches for active-CTL improvement
> > are needed:
> > https://gitlab.freedesktop.org/lumag/msm/-/commits/dpu-4k?ref_type=3Dhe=
ads
> >
>
> [...]
>
> > base-commit: b44251a8c179381b9f3ed3aa49be04fe1d516903
>
> Hi, Jun. The display of my sm8650 device requires 4:4:2(lm, dsc, intf)
> topology, I want to test this series, these patches can't be applied to
> the latest linux-next tree, and I can't find the commit id in linux-next
> or msm-next. Where can I fetch the tree?
>
> Best wishes,
> Pengyu

This is staging patch set. Code clean and formatting is still needed.

https://gitlab.com/jun.nie/linux/-/tree/sm8650/v6.15-quadpipe-staging?ref_t=
ype=3Dheads

Regards,
Jun
