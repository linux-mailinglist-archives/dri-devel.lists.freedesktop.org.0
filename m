Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAC3B0C8CA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 18:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B95B10E293;
	Mon, 21 Jul 2025 16:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eJYWG0XV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4471C10E293
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 16:30:45 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b31e0ead80eso3534611a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753115445; x=1753720245;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e1OthpiQLo0yn+Ex+1T1Nl8yMpcQVCC1Su5Bulvu4QQ=;
 b=eJYWG0XVcZRKkN1UB3FWWx0xh8SdrBrZymUBr4eHzo/jrmOycBqlUva3kEvECLrIIA
 sKILjWWro2LZggAshV9jxXpfLNEi8aORoFD6T8JyPatIh9NFytyeVvDdSWC3X+Ub8UUr
 zH7hxM0OzVMbcGWtLtn4vuc0+wnssfbVwkT8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753115445; x=1753720245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e1OthpiQLo0yn+Ex+1T1Nl8yMpcQVCC1Su5Bulvu4QQ=;
 b=o9RPklsCXuhMyLHfyHTidDR6z0pO3PIFtnIiVf9DXiSj7gvVJf6J6WKrEJMWedjSUn
 hGaGwdLyC9Bs0AxQWqKHmYz3eOKXoUw4MvPzTqZj4mq+uzwW5rM4IFgSllEDPOC7Gm0Z
 zfOQq4gzjkMhEPwqf8B+yzqT2C2QIyRsWW/T+DGM0D1EDf+QSIloQ5IioMvUtrrP7Qbu
 qWePX++9VzYSNRlfdqDilXijBTeV+aaLEQ+QlFGfZy9YPuboOWbnK2u0/ubPsrIUCmA+
 pTeKRd0u/bJapoHOlmnJBG3/NERwH4CGr9MMcvu9LUr8UXLnL4hW1Lf63LMOOMb0ct6J
 qVqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2Ub/0nLGRiYOwtG6pvzxTuG0LzpVACretqBktXsZGt5P/cYt1OetybYqIWgvd6WT3Eyz37JO3gAc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6c8irj2KhhPpPKcpmC4wLWODg4JQESYckN+veeIlsF9g/gSRO
 CoouABfODWG2zeqEmuSOLS3GNW4NnOMIhkq9OQrcWLJm3DaYN5tiCOpSmB0NQeM9wb5CkllWU3m
 cblQ=
X-Gm-Gg: ASbGncteX/kKHO3ICkMSczjwyuzxhf8LAvoV0tZ83IB53HQ00aBUPMOVK01r6UJ4Vj7
 1zfQiq+NCDz16I9lJm6G7xxv5dkj7lZ84QB5RF3T+DlCEE3OVE8bzWRu3YjjnEOuIXC1bioTZUu
 TR7y8oP7wUVo2sNMm4p42+j1OTmrJMTQl9yOGI8NcOInGpT9r5aSWiFxRhBNliV2LtWQDcD4Ld4
 a68bT8+jUO31xTKnLcdpER2YAuLziQT3Xzt1PX5PUDlgvv+JjspqiHlnwbGAFP1kICZfSqvavSh
 rUCWfQChsimCHi51rnu/K6OFb4WL3+CQVtt5rOU8hD02kDq8WQ4UAlD8pjQ00rd5HGIs/S5vlxz
 P+2Gl95GDUvtvbcomM6IU7JX6IdPopqOFRJNLDi5iQy43knk6Ep62Omp7R+IAIiqox6DbiKaI+z
 AC
X-Google-Smtp-Source: AGHT+IFkVgwSaFXyyRu2MQyFLCIKSZiUlpmRs6zxl4RU9fUf+K4pXYJCMllHl82eiph7LAjUT8tkOQ==
X-Received: by 2002:a17:90b:5281:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-31c9e6e52e8mr26029090a91.5.1753115444726; 
 Mon, 21 Jul 2025 09:30:44 -0700 (PDT)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com.
 [209.85.214.176]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45083sm6395625a91.2.2025.07.21.09.30.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 09:30:44 -0700 (PDT)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-23694cec0feso42147855ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:30:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW8SVwaCbheWJEe7LD7Y8Xk2rXxtsTWGyxBV6EpJNxXo2UYoL3gu+v9pM6Th0LO5scM0lpVeiXbrrY=@lists.freedesktop.org
X-Received: by 2002:a17:903:3bcc:b0:235:f298:cbbe with SMTP id
 d9443c01a7336-23e24edc278mr357296245ad.12.1753115443448; Mon, 21 Jul 2025
 09:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250719082639.307545-1-me@brighamcampbell.com>
 <20250719082639.307545-2-me@brighamcampbell.com>
In-Reply-To: <20250719082639.307545-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Jul 2025 09:30:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xzno3ReSyp9w+DC+nLoy1AXmcwd+j1=_XRxFi_k+bmng@mail.gmail.com>
X-Gm-Features: Ac12FXy9MlSRxUz0cgfvqURcfFQN33HCDR1ifsxTc8_3lTfiq4MM633TTSdKa88
Message-ID: <CAD=FV=Xzno3ReSyp9w+DC+nLoy1AXmcwd+j1=_XRxFi_k+bmng@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] drm: Create mipi_dsi_dual* macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

On Sat, Jul 19, 2025 at 1:27=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> @@ -827,6 +827,30 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_mu=
lti_context *ctx,
>  }
>  EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
>
> +/**
> + * mipi_dsi_dual_generic_write_multi() - mipi_dsi_generic_write_multi() =
for
> + * two dsi channels, one after the other
> + * @dsi1: First dsi channel to write buffer to
> + * @dsi2: Second dsi channel to write buffer to
> + * @ctx: Context for multiple DSI transactions
> + * @payload: Buffer containing the payload
> + * @size: Size of payload buffer
> + *
> + * A wrapper around mipi_dsi_generic_write_multi() that allows the user =
to
> + * conveniently write to two dsi channels, one after the other.
> + */
> +void mpi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,

BUG: above should be "mipi", not "mpi"


> +                                     struct mipi_dsi_device *dsi2,
> +                                     struct mipi_dsi_multi_context *ctx,
> +                                     const void *payload, size_t size)
> +{
> +       ctx->dsi =3D dsi1;
> +       mipi_dsi_generic_write_multi(ctx, data, len);

BUG: "data" and "len" are not valid local variables...


> @@ -431,6 +439,87 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi=
_multi_context *ctx);
>                 mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
>         } while (0)
>
> +/**
> + * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
> + *
> + * This macro will send the specified MIPI DSI command twice, once per e=
ach of
> + * the two interfaces supplied. This is useful for reducing duplication =
of code
> + * in panel drivers which use two parallel serial interfaces.
> + *
> + * WARNING: This macro reuses the _func argument and the optional traili=
ng
> + * arguments twice each, which may cause unintended side effects. For ex=
ample,
> + * adding the postfix increment ++ operator to one of the arguments to b=
e
> + * passed to _func will cause the variable to be incremented twice inste=
ad of
> + * once and the variable will be its original value + 1 when sent to _ds=
i2.

It could be worth also pointing people to
mipi_dsi_dual_generic_write_seq_multi() and
mipi_dsi_dual_dcs_write_seq_multi() below?


> + *
> + * @_func: MIPI DSI function or macro to pass context and arguments into

nit: remove "or macro".


> + * @_dsi1: First DSI interface to act as recipient of the MIPI DSI comma=
nd
> + * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI comm=
and
> + * @_ctx: Context for multiple DSI transactions
> + * @...: Arguments to pass to MIPI DSI function or macro
> + */
> +#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)           \
> +       do {                                                     \
> +               struct mipi_dsi_multi_context *_ctxcpy =3D (_ctx); \
> +               (_ctxcpy)->dsi =3D (_dsi1);                        \

nit: now that "_ctxcpy" is a local variable you no longer need the
extra parenthesis around it.


> +               (_func)((_ctxcpy), ##__VA_ARGS__);               \
> +               (_ctxcpy)->dsi =3D (_dsi2);                        \
> +               (_func)((_ctxcpy), ##__VA_ARGS__);               \
> +       } while (0)
> +
> +/**
> + * mipi_dsi_dual_generic_write_seq_multi - transmit data using a generic=
 write
> + * packet to two dsi interfaces, one after the other
> + *
> + * This macro will send the specified generic packet twice, once per eac=
h of
> + * the two interfaces supplied. This is useful for reducing duplication =
of code
> + * in panel drivers which use two parallel serial interfaces.
> + *
> + * Note that if an error occurs while transmitting the packet to the fir=
st DSI
> + * interface, the packet will not be sent to the second DSI interface.
> + *
> + * This macro will print errors for you and error handling is optimized =
for
> + * callers that call this multiple times in a row.
> + *
> + * @_dsi1: First DSI interface to act as recipient of packet
> + * @_dsi2: Second DSI interface to act as recipient of packet
> + * @_ctx: Context for multiple DSI transactions
> + * @_seq: buffer containing the payload
> + */
> +#define mipi_dsi_dual_generic_write_seq_multi(_dsi1, _dsi2, _ctx, _seq..=
.)     \
> +       do {                                                             =
       \
> +               static const u8 d[] =3D { _seq };                        =
         \
> +               mipi_dsi_dual_generic_write_multi(_dsi1, _dsi2, _ctx, d, =
       \
> +                                                        ARRAY_SIZE(d)); =
       \

nit: the indentation of ARRAY_SIZE() is slightly off.


> +       } while (0)
> +
> +/**
> + * mipi_dsi_dual_dcs_write_seq_multi - transmit a DCS command with paylo=
ad to
> + * two dsi interfaces, one after the other
> + *
> + * This macro will send the specified DCS command with payload twice, on=
ce per
> + * each of the two interfaces supplied. This is useful for reducing dupl=
ication
> + * of code in panel drivers which use two parallel serial interfaces.
> + *
> + * Note that if an error occurs while transmitting the payload to the fi=
rst DSI
> + * interface, the payload will not be sent to the second DSI interface.
> + *
> + * This macro will print errors for you and error handling is optimized =
for
> + * callers that call this multiple times in a row.
> + *
> + * @_dsi1: First DSI interface to act as recipient of packet
> + * @_dsi2: Second DSI interface to act as recipient of packet
> + * @_ctx: Context for multiple DSI transactions
> + * @_cmd: Command
> + * @_seq: buffer containing the payload
> + */
> +#define mipi_dsi_dual_dcs_write_seq_multi(_dsi1, _dsi2, _ctx, _cmd, _seq=
)   \

BUG: doesn't "_seq" need to be "_seq..." ?

BUG: You need to remove the definition of this macro from
`panel-novatek-nt36523.c` or else it won't compile anymore since the
name of your macro is the exact same as theirs and they include this
header file. It would be OK w/ me if you squashed that into the same
patch since otherwise rejiggering things would just be churn...

I guess we also chose different argument orders than they did (that's
probably my fault, sorry!). They had the "ctx" still first and this
patch consistently has "dsi1" and "dsi2" first. I don't think it
really matters, but we should be consistent which means either
adjusting your patch or theirs. It's probably worth confirming that
the novatek driver at least compiles before you submit v6.


-Doug
