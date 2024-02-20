Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B320985D22E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9B210E65C;
	Wed, 21 Feb 2024 08:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KpkZM8M5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDF010E30A;
 Tue, 20 Feb 2024 13:11:48 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-33d32f74833so1620779f8f.3; 
 Tue, 20 Feb 2024 05:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708434707; x=1709039507; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jh0XLZKxGstbU+73Iunkxnq9ZWdTIJGh34NljKi+HTQ=;
 b=KpkZM8M5RTiuIAYUITa6uI1u9XPXfXdTduhlK3hLkZNmcxx9jsQmuB/VQVcs2FLcA+
 3ekEZC6+OxN/2NXXFoT44Q90kiN8Zfvz1P2g/Avj6saIcefcKVWea887mh55ifgbxicq
 FPs9JNsd3tXfjEIW0c/+kwTta7PAJua8GFYqIUIEsFk46KI3E03sZfc1UK+k1PN43F4Q
 F3BjzT8pe+sZVC04VtOFbmrmuIa5nsd6Q/PbXQLWX12YKPoe0XjWynZOmAvCYm8cb+MO
 aGkue8pUtCAlxDzQ+RdomHHLkxYhYT7HU61mmeqc9Qb5nhIw+XnVMrMTd2ZrCfUCoVtb
 rg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708434707; x=1709039507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jh0XLZKxGstbU+73Iunkxnq9ZWdTIJGh34NljKi+HTQ=;
 b=OCjZ9rABLmv+cSw+m2myoJy1xWpGtTmiZG5pFRVkHNB0axpXm6M4dG6q1bHIpPJwtZ
 F40xy8qVTPyKwKcnqHjB/+0714F/hpDip+rhnUY6m+V9Z2ufDLeB1P6Ei26aIG5t5O3/
 etF5BZxUZGNzP4MdqkpHIIX+qakRllqVW533AGFN3CLS31c+jT+AuUw2/1vyAZ+GrCjz
 2P/r3/4WhXNG+jmOnLsLP4BR3KdBRJU3mlTy/pWxaDbc+L4qSD82afZ1qdqGHnQzW6gC
 KB7lsyTe9UfcN7iXAiAi2pEIBXxN6sd+1b6iif9W9FI2SG3oBdkrDbm1f5+ucOYLjM7j
 SB3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVuKv1cklV4d5zZZn9sMMxNOuD5/3SVU//Rpme1K0OCAqGRHEczmcvbX3Es9pPR2Or1hteWwvfDjCFips05bmoW7upZfxRg8hDT4FwC9yuExD1yeZSXcdIQD+9bNZn+VbDLpTxx3mU2hqGbQNpQqVj
X-Gm-Message-State: AOJu0Yx7s0STYHp9m3Iwp0joIzG1Ln3fu/8k+l9obt8KBWf2Bygv9940
 Lw5102JXDCHs6Egd1oLqPXKBCq71JQwa86lo1mpJ0dqe/X2gt5Y+gpTScN2qXv7RBOxm4s1UnDq
 4cJ+LqoWios329HE6vMiCfCjwwvQ=
X-Google-Smtp-Source: AGHT+IFnUvbzWhpd3T+gixNS1N5rv8Q8mcjl8T3JlDQNt374EKAfm+9Mxk0703OTixhgMtiaE7371hMTrKQScrdqjgo=
X-Received: by 2002:adf:f60d:0:b0:33d:27cf:6208 with SMTP id
 t13-20020adff60d000000b0033d27cf6208mr6344072wrp.7.1708434706815; Tue, 20 Feb
 2024 05:11:46 -0800 (PST)
MIME-Version: 1.0
References: <20240218134434.2531636-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240218134434.2531636-1-dmitry.baryshkov@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 Feb 2024 13:11:35 +0000
Message-ID: <CACu1E7Hi7JgCAneOfK-M32o6Okzsqm_uOT_qsmiKWC5ZBzEMsA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: skip programming of UBWC registers for a618
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Leonard Lausen <leonard@lausen.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 21 Feb 2024 08:08:40 +0000
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

On Sun, Feb 18, 2024 at 1:44=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Historically the Adreno driver has not been updating memory
> configuration registers on a618 (SC7180 platform) implying that the
> default configuration is fine. After the rework performed in the commit
> 8814455a0e54 ("drm/msm: Refactor UBWC config setting") the function
> a6xx_calc_ubwc_config() still contained this shortcut and did not
> calculate UBWC configuration. However the function which now actually
> updates hardware registers, a6xx_set_ubwc_config(), doesn't contain such
> check. Thus it ends up rewriting hardware registers with the default
> (incorrect) values. Add the !a618 check to this function.
>
> Reported-by: Leonard Lausen <leonard@lausen.nl>
> Link: https://gitlab.freedesktop.org/drm/msm/-/issues/49
> Fixes: 8814455a0e54 ("drm/msm: Refactor UBWC config setting")
> Cc: Connor Abbott <cwabbott0@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>
> Note, a proper fix would be to incorporate actual values for sc7180
> and drop the a618 shortcuts. However it might take some time to
> materialize and to be properly tested. As such, I propose to merge this
> for 6.8, keeping the existing behaviour.

If we do this then there's a chance that 6.8 will report a broken
value for MSM_PARAM_HIGHEST_BANK_BIT, which is going to require
otherwise unnecessary workarounds in [1] for quite a while once I fix
up a618 support. Can you at least dump what the default is to make
sure that the value we report matches what's being programmed?

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26578

Connor


>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index c9c55e2ea584..07d60dfacd23 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1325,6 +1325,11 @@ static void a6xx_calc_ubwc_config(struct adreno_gp=
u *gpu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +
> +       /* a618 is using the hw default values */
> +       if (adreno_is_a618(gpu))
> +               return;
> +
>         /*
>          * We subtract 13 from the highest bank bit (13 is the minimum va=
lue
>          * allowed by hw) and write the lowest two bits of the remaining =
value
> --
> 2.39.2
>
