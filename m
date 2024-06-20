Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E64910D57
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AF610EB42;
	Thu, 20 Jun 2024 16:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BegzmYqe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE3310EB42;
 Thu, 20 Jun 2024 16:42:13 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so11204491fa.2; 
 Thu, 20 Jun 2024 09:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718901731; x=1719506531; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MvPWAGvnBNSgSHBYq/LlacrTlJVn4K7wbKBfHfFlQnU=;
 b=BegzmYqeb6JaElfBEDA/eBRZyVjFHJzLwToWGSCiMHdwmDyJRi6u3EYqskjBu4wVff
 m+0yCk0A6FwXGB/4vrpVFXh1qxLl8CxXdXthaPba5sqFAAtEaHjDL2i/ok8TDJAYnQOZ
 Wff9hdr0OdGQtDx/XqMjCouBdNYEw/zDonXmT2qpk/16jg2ACiD+qSjcnkx6KEQPHVKP
 +f47MbDRfMLLGjcGW6wKLI2iJgf6isyyvRil71Wb9/7XoTKNPWbxrwKYrVJOE1y3LGgC
 oI47Pz8ZedlY6CqqXWZzLST3jBWa/di1wxSKQMt9HIyBmRcUZfTUIaD5bBB1PtXfbYbd
 N2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718901731; x=1719506531;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MvPWAGvnBNSgSHBYq/LlacrTlJVn4K7wbKBfHfFlQnU=;
 b=AkHu2bCoqCOLtTzNfKOz5OTj5R0Y9qz096tXHhQa+Diawps/mEH1XsPSiJ+7QAEl+z
 291buUHEfs1AI9NA2A/ehJZreRLsDNIzd5t4v3OUAUdCUkIzWNajhbvvYw73Ow2Cb/RK
 Z8fHJLs1pVJeA0nugze8oSD3dGNJu2hDaqrIbmvlr7rKVNGt3X69IgXFRRpwqcHPxmQa
 ZtO47yhoiXlglquj1ltn0sGqRbzPc9P4VpECquM+BHmSwBmeBz95QD+g62VCDwp+w3AY
 Uu72UsTfCO4sANtieRedShGWlK7sV9YfXasRD24XacsIRPsOM/1+GdhoqdH2a1xZumC3
 8sqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDMbiLsz+2/z2A7qiXsVL/zCNGp8P5nbhEtgU1FpCIGzSdtuLUKa528hjcilRjMJhhLG46WEkKgw2RCNIW8bPEn1Bx9ClJ4NCzGZpKXoBox4aFKQMk1tF9hq+t+ScFrL2E14I69VGVGmUlBSF0u8ha
X-Gm-Message-State: AOJu0YybNa6PYK0UOTGVB9B+7UEVQuIZXYQv47nhOi5pPaROY6BikF6n
 uiVm+d5NdotwJme7S7RnS08IC/Mf/mv7Qp6aqOwo72kTGLcJ9a5t760mIktocLCWDoqCQkb4R5L
 moNQ1UkWLC+31animWkY0lPsuQdk=
X-Google-Smtp-Source: AGHT+IFlO0TjFwAgwe7jW4uv3d0LZl69UkHI5u0XxEuqIMBFANIynjGf5rVmxXcoSuPa4ro4jZJLuLzDKYolw72m6ao=
X-Received: by 2002:a2e:be8c:0:b0:2ec:3dd4:75f9 with SMTP id
 38308e7fff4ca-2ec3dd476d9mr46118991fa.35.1718901731039; Thu, 20 Jun 2024
 09:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240619212743.3193985-1-quic_abhinavk@quicinc.com>
 <CAA8EJpowTONWNQH+Sqe1w1eL85Ty4tw8_Qkc1yToQu9s17Tokw@mail.gmail.com>
In-Reply-To: <CAA8EJpowTONWNQH+Sqe1w1eL85Ty4tw8_Qkc1yToQu9s17Tokw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Jun 2024 09:41:59 -0700
Message-ID: <CAF6AEGsQLqf96g9iaUqB1D6zcay8csvUH7oyirTd04x+bUzvYA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: protect ctl ops calls with validity checks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, dan.carpenter@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Jun 20, 2024 at 6:08=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 20 Jun 2024 at 00:27, Abhinav Kumar <quic_abhinavk@quicinc.com> w=
rote:
> >
> > dpu_encoder_helper_phys_cleanup() calls the ctl ops without checking if
> > the ops are assigned causing discrepancy between its callers where the
> > checks are performed and the API itself which does not.
> >
> > Two approaches can be taken: either drop the checks even in the caller
> > OR add the checks even in dpu_encoder_helper_phys_cleanup().
> >
> > Adopt the latter approach as ctl ops are assigned revision based so may=
 not
> > be always assigned.
>
> NAK, these calls are always assigned. Please make sure that they are
> documented as required and drop offending checks.

agreed, I'd rather see the obvious crash if somehow a required
callback didn't get set up, than a subtle/silent problem.  It is
easier to debug that way.

BR,
-R

> >
> > Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for=
 writeback")
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac0645=
6@moroto.mountain/T/
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 708657598cce..7f7e6d4e974b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -2180,9 +2180,12 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_=
encoder_phys *phys_enc)
> >         if (ctl->ops.reset_intf_cfg)
> >                 ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
> >
> > -       ctl->ops.trigger_flush(ctl);
> > -       ctl->ops.trigger_start(ctl);
> > -       ctl->ops.clear_pending_flush(ctl);
> > +       if (ctl->ops.trigger_flush)
> > +               ctl->ops.trigger_flush(ctl);
> > +       if (ctl->ops.trigger_start)
> > +               ctl->ops.trigger_start(ctl);
> > +       if (ctl->ops.clear_pending_flush)
> > +               ctl->ops.clear_pending_flush(ctl);
> >  }
> >
> >  void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_e=
nc,
> > --
> > 2.44.0
> >
>
>
> --
> With best wishes
> Dmitry
