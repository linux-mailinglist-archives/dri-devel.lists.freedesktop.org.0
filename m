Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD5D910E81
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 19:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F9010EB87;
	Thu, 20 Jun 2024 17:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XlMqRkIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2909710EB87;
 Thu, 20 Jun 2024 17:29:12 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4415ba6c5deso4708261cf.1; 
 Thu, 20 Jun 2024 10:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718904551; x=1719509351; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n0iu5V6CVJ2htaSZURuMvsIrPmxFYUDGGtOzfJvtWgk=;
 b=XlMqRkIKC7CBQFEpq7Byxemf5tflwPdPC9SSNKlIG3mK4qhd9aQGcmqo68BU0FOKz2
 fq2HkpQEZnPEwfJR9O6ZQ7LMgfOvOeNjpTBqsvCYd1ejzXXoD8StZUBJVvDH0s8tO61a
 woLgSkLiEftdo190jZuXFRO/x3AdlR214GYg1qetKaqsHwwcbdNa6ej2vaZDI2NI44RV
 Qb/5115geZu7qhWHvQHPNBG2X9uMWZuQdc8R5d9G/AXSRl0ZaCRAkKB3prsLtq+if85T
 04qnOlBGi705kShQ7icZg+NqBZT1+wN/i66+TnEJpzjCbRd4NLSThe+SWpOZPRymQeyT
 Oprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718904551; x=1719509351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n0iu5V6CVJ2htaSZURuMvsIrPmxFYUDGGtOzfJvtWgk=;
 b=ue3drEYPlw0xQp7gFrf5sWDmJ6WHM9SWlSbg/ALg1iw7XPr3xM0Sk+8o4Ug10qEnk6
 Q5M5psyRcN/59fH6EsaRQhM0e4oJXqjAbDC7HUtRVhX+g12PX50Lcvb/qTUjjSIl0x4a
 ZmpQ9C51vjjvFyoY6K9gczjlRaleO2NEhdeJQJBkAIQBM1zB1zCGi6KPC+QREA1CkBK+
 d2FaThENq8EE2k2goSekd1syfWNbwpNOYu2PpRKeuT9S6pDJdm3qlyjnhzStdstzSexK
 CjmNjSUba3mX8aqS+izBWK6rMbRcxfpTxDveR351Rl4NwR3VQm6XFUXkw098ThX2KV7j
 xW6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUXBHLndCdXx6G0opAeCtJEYUmqu06PuwM2WkgxIWamldOrMzeLkwmsSHpbIoT+IcFvlY6XTwjy8eAdn5Bo2Z6jUT7bfRh6EjJwCAwyyeuEazybpocEopoYtG6gYHTb0w3pNG044YqEVogI5I5fmB5
X-Gm-Message-State: AOJu0YzbGs0DqCS5rkME4Hs2VG6xIQwm7xlbYbpJAW49WlGNVP37nriB
 mATWWH/H9BShAWFJN4IOA/k5EvLbJzPPNR9wa0Ve6eIyx00WtougIkNRPQi6M0IHp/gpMKK0anD
 eL8simMuQq6fJ6r28/12LT5l0S6k=
X-Google-Smtp-Source: AGHT+IHnU4Kfz0hQPXXVFIATrwZUVqfWopwRtu2bkf4SRPQCq8ZqbWpdRu8EZFIAv5Jal3eFR36wqu1MCkoHLXxZDIg=
X-Received: by 2002:ac8:5709:0:b0:441:575a:786d with SMTP id
 d75a77b69052e-444a79c2f7bmr65856181cf.26.1718904550945; Thu, 20 Jun 2024
 10:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240528-a306a-v1-1-03a66dacd8c7@gmail.com>
 <76a124b6-8cc3-4060-866c-03f47da450cc@linaro.org>
In-Reply-To: <76a124b6-8cc3-4060-866c-03f47da450cc@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Jun 2024 10:28:57 -0700
Message-ID: <CAF6AEGuHSG0t6CH=+JGzZqiZa_JsOgPkcgO_UhCbO3vAgFZK_g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add A306A support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
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

On Wed, May 29, 2024 at 3:41=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 28.05.2024 9:43 PM, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> > From: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> >
> > Add support for Adreno 306A GPU what is found in MSM8917 SoC.
> > This GPU marketing name is Adreno 308.
> >
> > Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> > [use internal name of the GPU, reword the commit message]
> > Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> > ---
>
> [...]
>
>
> >
> > +static inline bool adreno_is_a306a(const struct adreno_gpu *gpu)
> > +{
> > +     /* a306a marketing name is a308 */
> > +     return adreno_is_revn(gpu, 308);
> > +}
>
> The .c changes look good. Rob, do we still want .rev nowadays?

mostly I just want to avoid revn for newer GPUs, but I suppose we
should be consistent and drop it for "new old" GPUs..

Also, it would be nice to rebase on
https://patchwork.freedesktop.org/series/127393/

BR,
-R
