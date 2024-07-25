Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F2993BB64
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 06:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A6010E554;
	Thu, 25 Jul 2024 04:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NoVVmGJ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4702A10E2D6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 04:09:35 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2eeb1051360so5024461fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 21:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721880573; x=1722485373; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2aLaJYQrt2Mrpa6ixTAmSx6t43lvxNvXrJytjXn2tsc=;
 b=NoVVmGJ4/92YMNn82S7wPjY84RY+U/tFnz8H0dJRtY1JksSuyqBpeZXc9XezAkqPW2
 17dqfTjl3lnq3IQTwpYmI6gJroIlewvhFIooKr5dEEaBPw98WDZy+LS8V3j8x6ZY1+56
 atQ3KMaxRE584Vxqf2oCN+E6voOhukE85haHSQUJK0CkX9Z8pK4usYRzrCkK3om2bC6e
 5Gd5HV/dB9Wg1ZWlR+dki26abTfOmZiJkGzNyc6610GDG8mMaRHkhBgqxE19IjKW1xCd
 PpNAPoXF7va4o7kMmnU1h5iV+dhehnF6+9mk/Yp2wZc1ze3kZuNMYzEAqR5q2TvSUHbn
 A++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721880573; x=1722485373;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2aLaJYQrt2Mrpa6ixTAmSx6t43lvxNvXrJytjXn2tsc=;
 b=Qz8TZ6rwpj1+wUpQIDMMLsHuH9GTj/KJzWqUuoBaRMzVGr5tvHTp+/bGlWIHr3rMFw
 Y0+j180WyHuBNHPPSVAzme47BP8XcNlEHOka0bu5pnZBnlmkZ/5eMwavcGrJ9wlu2zhC
 mhw+xuPCTP3CBlq15eDOfDENUvlfZuydGmmYJ3MSMExCl4feciC4slgFsrnm+zqqWMbA
 YxRR9yQsxR1nzsU+mbTTtV362YR6nCS36pmBz/cA4t0OpJ7ZyUwcKcy4tu1R8tYCbr4s
 tPMcX4LB3YktOrbzcHgtV27X9xgFhHAq9VT8DvUMt2wayMcPxWKHBFvDasrKTHRllKr5
 Lbpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU190djx21hmdr+hRIdbwMRLVBv1fWxSDLS5qx16utIMSjXai9ZcpUnF52a/7OdK4mQ/FjP4+AUyv16ZVukwikzbHrklIkuN+v4uUYPWGD6
X-Gm-Message-State: AOJu0Yzf92ad38RkrAaIm+QTTdYsk7ciZOLJI8TTMImLDT7SFmnzJtA9
 PWO2+15138ICY0YGVUEH0xdqHUZlEKMc6Xx7VWKwVfZhNOX4FbS4NRfLyCLUUnw=
X-Google-Smtp-Source: AGHT+IHHSLqQht8+k7EY6AfB3rbMJpvFsWVF+UqzojkS4iXdaTdaP69THmV9umWbUpansa7zrf2raA==
X-Received: by 2002:a05:651c:207:b0:2ef:22ad:77b5 with SMTP id
 38308e7fff4ca-2f039cc448amr10613301fa.29.1721880572931; 
 Wed, 24 Jul 2024 21:09:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03cf55cfasm751491fa.65.2024.07.24.21.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 21:09:32 -0700 (PDT)
Date: Thu, 25 Jul 2024 07:09:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH RFC 1/3] firmware: qcom: implement object invoke support
Message-ID: <gtdr5s7yih7pjuhpfkjmlu2lflya4heiph4wi446rlbxduqlya@5xfix7dyocli>
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <20240702-qcom-tee-object-and-ioctls-v1-1-633c3ddf57ee@quicinc.com>
 <ink4tq3wk2jkpybiisaudkun3g2x2drfogrdw43zdpi6yh2u5g@yrvrxzxsi46g>
 <836dab13-9c59-4d87-a600-a0be6506deb2@quicinc.com>
 <CAA8EJprp2veCaQq8GsYv4Mu1HQbx8nWv0XWtxcE4cu5kxkA16w@mail.gmail.com>
 <f9e5ef49-754c-4d97-8186-634674151b2f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9e5ef49-754c-4d97-8186-634674151b2f@quicinc.com>
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

On Thu, Jul 25, 2024 at 01:19:07PM GMT, Amirreza Zarrabi wrote:
> 
> 
> On 7/4/2024 5:34 PM, Dmitry Baryshkov wrote:
> > On Thu, 4 Jul 2024 at 00:40, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 7/3/2024 10:13 PM, Dmitry Baryshkov wrote:
> >>> On Tue, Jul 02, 2024 at 10:57:36PM GMT, Amirreza Zarrabi wrote:
> >>>> Qualcomm TEE hosts Trusted Applications and Services that run in the
> >>>> secure world. Access to these resources is provided using object
> >>>> capabilities. A TEE client with access to the capability can invoke
> >>>> the object and request a service. Similarly, TEE can request a service
> >>>> from nonsecure world with object capabilities that are exported to secure
> >>>> world.
> >>>>
> >>>> We provide qcom_tee_object which represents an object in both secure
> >>>> and nonsecure world. TEE clients can invoke an instance of qcom_tee_object
> >>>> to access TEE. TEE can issue a callback request to nonsecure world
> >>>> by invoking an instance of qcom_tee_object in nonsecure world.
> >>>
> >>> Please see Documentation/process/submitting-patches.rst on how to write
> >>> commit messages.
> >>
> >> Ack.
> >>
> >>>
> >>>>
> >>>> Any driver in nonsecure world that is interested to export a struct (or a
> >>>> service object) to TEE, requires to embed an instance of qcom_tee_object in
> >>>> the relevant struct and implements the dispatcher function which is called
> >>>> when TEE invoked the service object.
> >>>>
> >>>> We also provids simplified API which implements the Qualcomm TEE transport
> >>>> protocol. The implementation is independent from any services that may
> >>>> reside in nonsecure world.
> >>>
> >>> "also" usually means that it should go to a separate commit.
> >>
> >> I will split this patch to multiple smaller ones.
> >>
> > 
> > [...]
> > 
> >>>
> >>>> +    } in, out;
> >>>> +};
> >>>> +
> >>>> +int qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
> >>>> +    struct qcom_tee_object *object, unsigned long op, struct qcom_tee_arg u[], int *result);
> >>>
> >>> What's the difference between a result that gets returned by the
> >>> function and the result that gets retuned via the pointer?
> >>
> >> The function result, is local to kernel, for instance memory allocation failure,
> >> or failure to issue the smc call. The result in pointer, is the remote result,
> >> for instance return value from TA, or the TEE itself.
> >>
> >> I'll use better name, e.g. 'remote_result'?
> > 
> > See how this is handled by other parties. For example, PSCI. If you
> > have a standard set of return codes, translate them to -ESOMETHING in
> > your framework and let everybody else see only the standard errors.
> > 
> > 
> 
> I can not hide this return value, they are TA dependent. The client to a TA
> needs to see it, just knowing that something has failed is not enough in
> case they need to do something based on that. I can not even translate them
> as they are TA related so the range is unknown.

I'd say it a sad design. At least error values should be standard.

-- 
With best wishes
Dmitry
