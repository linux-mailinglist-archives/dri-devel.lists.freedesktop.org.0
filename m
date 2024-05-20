Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FC08CA286
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 21:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9D910E3C4;
	Mon, 20 May 2024 19:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MROHSrH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF2C10E3C4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 19:05:02 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-792b8d30075so270097785a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716231900; x=1716836700;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=df0l1z5z3FCtw3Ch204FxFA5rR9YqNy64rwyV2fw88o=;
 b=MROHSrH7qb6Q1JjhveaOi1ALwzpSjXfvJ2BNRkdZjhMGjPsOhKQD+tBRRGd0pCS3mK
 GkMu5bheIg+va1eB3DvdHyqtbFKSZiy+7ZpMznuiwFmOIp+tgDxXPuEmZXHDu8HTf5tG
 BAQu0+hur95sFMXxTTzpCaNcyIcrAyh6+rGY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716231900; x=1716836700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=df0l1z5z3FCtw3Ch204FxFA5rR9YqNy64rwyV2fw88o=;
 b=C/GrqcgH15VlvEj/AKgz3UUHOiQ01MLQE9J8MVi74tJAXe005ct71Sgt+W79VeuQuO
 vIyGIZptbvGyYBmVqK89BnMEYHwS68p0/yL7PITSWfzr00VpVsHnqNc/W4E5qz6MUyt5
 WO0fI17DcpNuT42ECN7CWz0ScfRgWEI0tSGC69h7txKx3BDjW1bz2w66avkPIyoWXhBo
 sxieMrhHgCQTrexz3DIkO87cg5LvOgclfJxguyElAj2seCwhJiKm2DSWIVoIOm2okMUc
 mI7K+GErY6QK1y+a1Ai8rgKmxxohr5B6vOFg2st2ON3gbFNRZNSaViHkd9+sAjS8ePn9
 hkrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQdRorEF+NZq0OVHHDtK89PLswBif9eQkACugMI0w7xrowHr1a6O+1Ebs/af7lX33V4rcqD1jzyNZuJ/ONh+AdGyxq9NLbozc/CFo9+Jcw
X-Gm-Message-State: AOJu0YzPL78rxyrnJQG5WfLAx1dwwh2/wA1hVjivZwMDM6VlyhEGo4N5
 wGBxDboUnCzoGywr8IQPTJRUqMQ5uHSEfCcVdBKHTD8oWAPrfs0hM/UWAniluA1exgVCRFu1AZA
 =
X-Google-Smtp-Source: AGHT+IH79fGn2KFBwoQ7Zv2I9vUIttM3PLZ4NU+Tv04L2wrOHnOXAKbIS8BKhOfHdtJF0a7s7VBrmw==
X-Received: by 2002:a05:620a:5a43:b0:792:9f96:f7a with SMTP id
 af79cd13be357-792c7600b84mr3017633285a.66.1716231900108; 
 Mon, 20 May 2024 12:05:00 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e2e4e1419sm82777501cf.51.2024.05.20.12.04.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 12:05:00 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-43f87dd6866so391671cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:04:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX/R7bq8ZQUakw7Ic1rtkg0kDlmem/m3/ZV9ogalKyCCSj2FZuktAkjLXDi8WxcnFX8CGRkNrDwVc1bDcdvU+J0Tuasuv+SHOj3Wn+Cghs7
X-Received: by 2002:a05:622a:1918:b0:43d:a002:b with SMTP id
 d75a77b69052e-43f7a91b195mr5561141cf.9.1716231529626; Mon, 20 May 2024
 11:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 May 2024 11:58:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Us-459kG-h1xT2+ffuSGuTLJ-UrJBD-5seRh4jAeHxmQ@mail.gmail.com>
Message-ID: <CAD=FV=Us-459kG-h1xT2+ffuSGuTLJ-UrJBD-5seRh4jAeHxmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, 
 swboyd@chromium.org, quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, 
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

Hi,

On Tue, May 7, 2024 at 4:05=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicinc=
.com> wrote:
>
> Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mes=
a"),
> compilation is broken on machines having python versions older than 3.9
> due to dependency on argparse.BooleanOptionalAction.
>
> Switch to use simple bool for the validate flag to remove the dependency.
>
> Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

FWIW, it looks like the commit this is fixing is now present in
Linus's tree. Is there any plan to land this fix? It would be nifty if
it could somehow make it in time for -rc1 so I don't need to track
down this patch every time I need to build a subsystem tree for the
next several weeks...

-Doug
