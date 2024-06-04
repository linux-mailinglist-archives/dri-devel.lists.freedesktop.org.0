Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDAB8FB223
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 14:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B2810E1DD;
	Tue,  4 Jun 2024 12:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X8srQF7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D9210E1DD;
 Tue,  4 Jun 2024 12:27:16 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1f44b441b08so41695515ad.0; 
 Tue, 04 Jun 2024 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717504036; x=1718108836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cWBz78Abu0CTj2Sphj5nhGk0PlgynOAQxXUthSgBAMQ=;
 b=X8srQF7JLVcAT05nb7JGXyUHID5PnuAp3V4kuHEKi/GWUnREva5ioPaNRTEH1DTDWH
 CBY2YTYrLbn4E9j1x5v0SyG2myx4b0hIF32VPkk1yMa4/scTwqgOsqOQvJLb8362uV2V
 K/65HGrCeEMYR1Lum60Zh9fWewHIwra27iEeOqN3wrkYR7kkTSpwNhhY4veyRVn/ijqw
 uMtqAkmwoL55nhu8LcrYKdyll3Y1qihZrQ+KqdKpsTRhWkMmAN5jj0bQrrTVUvVShkgM
 ywKL4KA3/9YOuSdlchcHQ2Sb3SMKxAt01X289efKN+DVu+SX7TlvtwJ+e8riVTj9SL/s
 xLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717504036; x=1718108836;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cWBz78Abu0CTj2Sphj5nhGk0PlgynOAQxXUthSgBAMQ=;
 b=bBIrw4GvI3RA5EX/kRNHuAkaiNyrkHHUqy7DZeA9d5XdrRw+ffsdoFydt8mV2mmg2k
 tYqLTMPLF80rWir1GUHEqZuxWJ2fW6pDzC2av9FnOfYPkXfc2mUohIJOSLTmoMGv/AG5
 e1xgDfgKVNd7RKf2/ckqkWS2hrcTZEBnJLpcO2vskBwxbnO2o43/6nDyGdHMpPygOj6M
 oa5flN5RrloWfNpsZ+wsICZc6pEBuuOAhChK1gLRe4AwyWOD9Tl9h0QU/Fs8tc7yebDS
 pAY8//4bGicioO4+1QbY7Xmx93MFGK55FtpZjVuhzb8USJj8r07fF8aZVu4KXe2nFjN7
 ufiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUggK/aKAXMZxGlLjZI1QPIWyVB4AgeQdoDr1DLbWqTb62LrbMrx71cVLpKTwYid08RuHeBT03ZX8LnPAcgzPXx6j/s7cxANhDqsns5pEoZpiBm/qd2jeq00CFn9ZqbrZCKJl+s+/jPf9Ngj0c5pfIq
X-Gm-Message-State: AOJu0YxWsHBqzYcO2pWm8z2EW/BEqsIBTduTRTmfU352Zqnx2oswqtnl
 G4rtOSEoUTB88PjPS09izUAtBiachdygwvQXBAZiF7XeBzH4z6Fjt2g4++zuXO2Op494Sp1Qzwf
 K4yuT//4KQ9705pjSYY58Bp7psBE=
X-Google-Smtp-Source: AGHT+IFK/4dyXU3onorVfBIGrQ7RGbLlCzZrBNsv8DCE6538BNa55fpTJA1mERcBai/KbPLJggqRDcYyI5Nfa3Vr9kE=
X-Received: by 2002:a17:90a:bd18:b0:2bd:f439:546b with SMTP id
 98e67ed59e1d1-2c1dc582296mr9121768a91.19.1717504036018; Tue, 04 Jun 2024
 05:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240604-a505-v1-1-82ee1c04d200@gmail.com>
 <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
In-Reply-To: <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Tue, 4 Jun 2024 14:27:04 +0200
Message-ID: <CAGsSOWV=i2JHsYNvi5EC6q=NoD8v7SiTjbVQhTDLNw35+irTCQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add support for Adreno 505 GPU
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
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

On Tue, Jun 4, 2024 at 1:55=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
>
>
> On 6/4/24 02:20, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> > From: Daniil Titov <daniilt971@gmail.com>
> >
> > This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MHz),
> > SDM439 (650 MHz).
> >
> > Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> > Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> > ---
>
> This all looks very good, just a nit
>
> [...]
>
> > +             /*
> > +              * Increase inactive period to 250 to avoid bouncing
> > +              * the GDSC which appears to make it grumpy
> > +              */
> > +             .inactive_period =3D 250,
>
> Are you sure this is actually necessary?
Every A5XX GPU is using the same value, but i have never tried with
DRM_MSM_INACTIVE_PERIOD.

>
> Konrad
