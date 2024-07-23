Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 981CA939D50
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 11:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4AF10E100;
	Tue, 23 Jul 2024 09:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="txd2ysDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2B310E100
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 09:13:31 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6519528f44fso49364177b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 02:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721726010; x=1722330810; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G2TkTpA3pGGEMQVrSmpubkD3J5dcZcnfjtaZ+X4Iz5w=;
 b=txd2ysDTl6Xm5hV9ku6PnuwQ9GM3POewnRJQQ999cWygQbshIcKLcDp2HvLxleRS0H
 MnCCOFZJ+QUmIVXuw0UwhGBCFBhljhvQ+8ZCspFU3nsjZwpnR6duJPisW6/lIACYb4N6
 B94Ne7jdLARBI7mZTDj4tw3w5XrhJ5p8qlPaQ4ClGEmGHvG66SBpAQ4xv5g3yL0nivUM
 8Gy0wiumWlHVYaFwVsWKgCCLixOg6irp+3Jf0k8LEmx/cPrKL8oCRNPJE4xz8xYxEOJP
 Mvoeqic/dHlqMOCOrNhIWCvTdob2UWTey5Ddm0v0oBxcOwhMVsf8fSRDv5WKzEC5RgIu
 HuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721726010; x=1722330810;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G2TkTpA3pGGEMQVrSmpubkD3J5dcZcnfjtaZ+X4Iz5w=;
 b=WmRTOUpV4vm12+owxUj0AuL86J4OtZnbAinepEoz//EBqhNGz8UDINdzTeZnfRGtnz
 fB1NhMusT2nuj76dqmdPPnee+Ha3kXKi3R939sThkORru8En6NVz46tiLtjtL4elRHTx
 Sq4u5MGDaYd2mgymxIbR7DANlFv+99MBOwoxJnvwUBWCvwi1nQFoMJNTfKkFGTzAYBR/
 SQngLTf2iDhVlH2sLzHeWF13crJJxH3EGxo+1CwZUCDYylcy3FykbWDlzdTo+6I69NVQ
 SkzNH3gVKLC/da1gDTDy2v1mZ4fibS34GqxR9MNESyhIttkIgfapwwjlHTlkJBXmVGzO
 d+6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe7UVOyH6Ef8cbNrHfBxbdmW5I93X6Hjgxgsk+fRpZoH1hmI08NZClanoM/kEizZC6liQJVi/66o5TeF2nLor+iuS9PyJakMCbdPDF3kjG
X-Gm-Message-State: AOJu0YyNGsTe/w9CO67vc2lNRyoexYoEe06qwC25R/GHaV2H+rn0e6Q9
 0PdXJm69Wv/p/p1ulK5CYTDoQeyKllnhbYrJQviHz6GPd1/Lx+0iMCGHusfnIA0JoBZGtrGZFqL
 LFUO3LMJjgfFoRDmKqb7cwDkY3It2piBiqTIIsw==
X-Google-Smtp-Source: AGHT+IEFyj21m/TdpHs/KSfSoW7V5VWMJIuVXvJvfA82UQX0au9dQs51sRr+TRBEGm0LSSW1B/6NWPvZ1qRsBhjfG/0=
X-Received: by 2002:a05:690c:428e:b0:630:f7c9:80d6 with SMTP id
 00721157ae682-66a69837c4cmr96640487b3.27.1721726010101; Tue, 23 Jul 2024
 02:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
 <20240722080200.3530850-2-quic_ekangupt@quicinc.com>
 <ydp5ntlresenovs6qaqt7wdaleuruubem5hajbfadkratfsiam@wjn33ymp4gyc>
 <63c52fd2-9f31-418b-8c6c-4c91f7c69fd3@quicinc.com>
In-Reply-To: <63c52fd2-9f31-418b-8c6c-4c91f7c69fd3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jul 2024 12:13:18 +0300
Message-ID: <CAA8EJpqZ5pgA3D2PB57nAQkK+w7PdbQe1dgSTbFmTJbutu6N7Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] misc: fastrpc: Define a new initmem size for user
 PD
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 23 Jul 2024 at 07:35, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
>
> On 7/22/2024 2:02 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 22, 2024 at 01:31:59PM GMT, Ekansh Gupta wrote:
> >> For user PD initialization, initmem is allocated and sent to DSP for
> >> initial memory requirements like shell loading. The size of this memory
> >> is decided based on the shell size that is passed by the user space.
> >> With the current implementation, a minimum of 2MB is always allocated
> >> for initmem even if the size passed by user is less than that. For this
> >> a MACRO is being used which is intended for shell size bound check.
> >> This minimum size of 2MB is not recommended as the PD will have very
> >> less memory for heap and will have to request HLOS again for memory.
> >> Define a new macro for initmem minimum length of 3MB.
> >>
> >> Fixes: d73f71c7c6ee ("misc: fastrpc: Add support for create remote init process")
> >> Cc: stable <stable@kernel.org>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index a7a2bcedb37e..a3a5b745936e 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -39,6 +39,7 @@
> >>  #define FASTRPC_DSP_UTILITIES_HANDLE        2
> >>  #define FASTRPC_CTXID_MASK (0xFF0)
> >>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> >> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
> > So, what is the difference between INIT_FILELEN_MAX and
> > FASTRPC_INITLEN_MIN?
>
> INIT_FILELEN_MAX is the maximum shell size that can be passed by user.
> FASTRPC_INITLEN_MIN is the minimum initmem length for PD.

At least this should be commented on in the source.

>
> >
> >>  #define INIT_FILE_NAMELEN_MAX (128)
> >>  #define FASTRPC_DEVICE_NAME "fastrpc"
> >>
> >> @@ -1410,7 +1411,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
> >>                      goto err;
> >>      }
> >>
> >> -    memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
> >> +    memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),
> > BTW: why is the code multiplying filelen by 4? Nothing in the source
> > code suggests that filelen is in u32 words, so I'd assume it's measured
> > in bytes.
>
> The passed filelen is actually the size of fastrpc shell. This size is not sufficient for the user
> PD initialization. The 4x of filelen gives the approx. needed memory for signed PD initialization.
> Yes, filelen is measured in bytes.

Ugh. Shouldn't it be sum(elf.ph[i].memsz) + some margin? I know this
is a separate topic, but since you were touching these lines it has
come to my attention.

>
> >
> >>                     1024 * 1024);
> >>      err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
> >>                              &imem);
> >> --
> >> 2.34.1
> >>
>


-- 
With best wishes
Dmitry
