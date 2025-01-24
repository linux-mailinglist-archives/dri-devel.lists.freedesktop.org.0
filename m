Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444B6A1BBE5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 19:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8826410E9FB;
	Fri, 24 Jan 2025 18:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gi4zLYL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC1B10E9FB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 18:07:54 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e3978c00a5aso3804162276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 10:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737742073; x=1738346873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cfjAH6wacEymYVBFOh1WPmz3PQJf2rhJKR5AERmsJw4=;
 b=gi4zLYL+aHnQjXPMpCUBzkzIhNRREWsfOHGwsMb6FNmvFs7pW9Uqr2FAr+/eowan0I
 mpo0hPvRhcT2WOmyp4IHAVPUUb1MPHQsKkMJL9s9Dzk1jtssOY9UyTDJVZHH21dmpY42
 V5hKQBLuAObEyeQdbtwPMp2TurVM9Qo0DUSctzwzwXAR4o/qXFnOK5vt0y/F3Y+/DoNV
 p5kG6Jqi/2fSDE8f62FrD8qe+9J5LHm8nlKxfcyvEKgKK5yhjcZFhlQps9VcalZaZjrL
 gCSuqumCAb1MeAIft5RwJvlnz8b1BopPb4aIbsjmezoNzR0Z9A6DoLCMkRy4qVVyxGzP
 yWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737742073; x=1738346873;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cfjAH6wacEymYVBFOh1WPmz3PQJf2rhJKR5AERmsJw4=;
 b=odD6y/5EHKlz0vL9l/3cfImTl8Xor2qnPkiJnN5fRIfMnrSzxHuO90GuxVQyF6Xw3h
 YRIo/5xTligPTNEKMvAg2pLLy4zfAdnNN7hTJ5dPyVF8iXRuIg4rqfk5ToBJcdIMmImk
 ZaQY566u/qeH3L7AlWSYrYL/jPtYQ1l6H8/yrXYzCqhAhuEtYnHKvrOsGDFb7DsayIPB
 sTgReUXtqUCiwxQSxfvGcfQeVZjIFym7f1g5VSisTDqXrjq7K7YwrB+gxMZoc7iUl3ZS
 +nHyNJy2BookRkDsCm8ShHs4+qCZpmcANR4Cjw8cZT4dIKl5YgDF+ExFC1tKSb6AYTyo
 7Q2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2s5FGk5uypuOWZImc3vI6CTVaswKcowLhwXEE8i1Q7ctQc1e21/fV5JISmC3ZBMLLx6FZeCiXALE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyqUvYLiOeI/ozfNGdNYGwz4lT4Kt8mcKXbj2m3JMHx4523CGS
 tzOqpbv8y5rDMvwcny4a7i707jlQLM2RttPg7Rn7F7QUVBV6EgWubIxGv5HtoBpP9o7cHcqNNL5
 Id7i+w1/oeVTJwsLXrmgvD8aAnHHyBk0r5hyF1Q==
X-Gm-Gg: ASbGncuRNogNw1c3oKXmsY8O6lHPMokfe2LX1x9AvpvyjzdrtOSCFq27VtywQzGo6p8
 xBr9UcARf5Y34xNfHJcnwyxFsNZKE1LJdS2yKzEoks59z7TJL7TKCjIGwWee+0g6CUqE=
X-Google-Smtp-Source: AGHT+IEvQawWvbODqKpeWmhbnVvP67aPuBS2qojQLo5WrCMABiRRxMrK1zubuPh/r6/xhtarnZgUkKZJY0JBR3HK9zI=
X-Received: by 2002:a05:690c:74c7:b0:6ea:5da9:34cc with SMTP id
 00721157ae682-6f6eb64e5c2mr240082137b3.7.1737742072993; Fri, 24 Jan 2025
 10:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
 <fbe9381b-7a61-417c-af97-ff5b8f498673@quicinc.com>
In-Reply-To: <fbe9381b-7a61-417c-af97-ff5b8f498673@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 24 Jan 2025 10:07:42 -0800
X-Gm-Features: AWEUYZljn2d60ZQAEgu4wX7E2q0L-hbvtZG9qjDwTq_2iWq5aX5k6JqtUqYgnO8
Message-ID: <CABymUCP2dWK44j8n2ncVGLvLPoOKzgKK1NitRN-y8izpvUs__Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Jessica Zhang <quic_jesszhan@quicinc.com> =E4=BA=8E2025=E5=B9=B41=E6=9C=882=
3=E6=97=A5=E5=91=A8=E5=9B=9B 15:32=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 1/17/2025 8:00 AM, Jun Nie wrote:
> > 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> > And 4 DSC are preferred for power optimal in this case due to width
> > limitation of SSPP and MDP clock rate constrain. This patch set
> > extends number of pipes to 4 and revise related mixer blending logic
> > to support quad pipe. All these changes depends on the virtual plane
> > feature to split a super wide drm plane horizontally into 2 or more sub
> > clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> > whole drm plane.
>
> Hi Jun,
>
> Please add me to the CC list of all future patchsets/revisions.
>
> Thanks,
>
> Jessica Zhang

Sure.

Regards,
Jun
