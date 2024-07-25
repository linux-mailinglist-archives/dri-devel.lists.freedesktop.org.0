Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B07793BBC4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 06:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D791710E23C;
	Thu, 25 Jul 2024 04:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l0Z+s1XM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F274010E23C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 04:33:01 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-663dd13c0bbso5215347b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 21:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721881981; x=1722486781; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rDFqw6oHHPxpfXtOUHUn1IVLUDP2YjdBprOP06yJvHQ=;
 b=l0Z+s1XMIOtHfowq7s+8dsC6MF4C9z5VivgH1upvZxZeekpK7eKlQ55Hgf+DC3Dxmd
 dhsvpjIeM2Jh5jwkfvV3JcXJiM30KYRtJgGdSJaB2n/e4hr67QsAkBC4HTckUnXj9pMR
 YYZJ9QhQyURAptNwXwAQ8t4B9ehsgpP4SMqcLmOglqeKF12ENAoiuJc+CPVbrWFBSEFe
 kSJBUpIYcdKDw8RdL8PoW/0NcL7sBfsTTZWTvXiRjWciZbpcQGHwAEHBuICO2/tglk1s
 wcB4vU7yiYUpK/P4a9PhDnJjp5lk69o7VyXJ3g0GMB8Zj2UxHea/E0aHPDOfcIbnEr2W
 9DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721881981; x=1722486781;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rDFqw6oHHPxpfXtOUHUn1IVLUDP2YjdBprOP06yJvHQ=;
 b=Kc5TUSH4dqv1TkfVxjVC+VgxlIGH6pbH3Pqnv7IKDgWlv32yeCbnWz+frRpXbLajY9
 phMAS7wkmWB984M6gksG27kbUhCE5i5/C2GBzTcs1A5lTZDRypJDH+NMQsPhsYMH+GOc
 OPlVpbtIRaZh2kjFEvlc6RG7eG64ycePTRF0YM8bbfUfOWtZPchQpQLJLxfOkNj50sjf
 XjnbmVCdqB84YWCESynokIXjZJEIX9TE57709rzX9Mfkl4DU8ODEiWndQIxfg4o0NqJ9
 PiQuje06Yo0DSnAzgWh9uVq8O90v5r+lwpZ6X438TjENlMVySOkWVYLkCtxepleOHCXr
 Mdpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5k+1y0l/N93HkHwZSlq/OPG87JkKpO2AGy8G6WBM+53zhu2EgxkoysBMpSsWFezOnzK8spqZeGCEZc8ZSj3nsMz/Q6YZMLnY73qQ6/Yjn
X-Gm-Message-State: AOJu0Yyb/I1X7LwelZC6SKAnTBoP6fssCoIT+yiP9sOeF9kq6PWlKIB8
 LYePtqxm9TIaxm0IhSKnJNePspH47KDWyWgfHMFONXQxMMdbYZZTSNI2qrrV7LvDJa/RN1qbzD/
 3MMsRS1Ab9YCGj+BsbN9Zail7Hz/afQHpsdGgQQ==
X-Google-Smtp-Source: AGHT+IHUKsyqw7tG3OOmxBx8cB5eWQECQmicrTjKE/6hNnrXGqghpEGBVp8H937CrHq2VeWgvBoopVddULDaspRFEXw=
X-Received: by 2002:a0d:e701:0:b0:669:e266:2c55 with SMTP id
 00721157ae682-6751082c4e4mr17035787b3.5.1721881980943; Wed, 24 Jul 2024
 21:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <20240702-qcom-tee-object-and-ioctls-v1-1-633c3ddf57ee@quicinc.com>
 <ink4tq3wk2jkpybiisaudkun3g2x2drfogrdw43zdpi6yh2u5g@yrvrxzxsi46g>
 <836dab13-9c59-4d87-a600-a0be6506deb2@quicinc.com>
 <CAA8EJprp2veCaQq8GsYv4Mu1HQbx8nWv0XWtxcE4cu5kxkA16w@mail.gmail.com>
 <f9e5ef49-754c-4d97-8186-634674151b2f@quicinc.com>
 <gtdr5s7yih7pjuhpfkjmlu2lflya4heiph4wi446rlbxduqlya@5xfix7dyocli>
 <a1f4457a-2313-4d75-9857-0d82cd502343@quicinc.com>
In-Reply-To: <a1f4457a-2313-4d75-9857-0d82cd502343@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Jul 2024 07:32:49 +0300
Message-ID: <CAA8EJpojNj0wB1aG3JWBc3AVGAUH7foShiWsX4MYdkYJLWRn8Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] firmware: qcom: implement object invoke support
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
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

On Thu, 25 Jul 2024 at 07:15, Amirreza Zarrabi
<quic_azarrabi@quicinc.com> wrote:
>
>
>
> On 7/25/2024 2:09 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 25, 2024 at 01:19:07PM GMT, Amirreza Zarrabi wrote:
> >>
> >>
> >> On 7/4/2024 5:34 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 4 Jul 2024 at 00:40, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 7/3/2024 10:13 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, Jul 02, 2024 at 10:57:36PM GMT, Amirreza Zarrabi wrote:
> >>>>>> Qualcomm TEE hosts Trusted Applications and Services that run in the
> >>>>>> secure world. Access to these resources is provided using object
> >>>>>> capabilities. A TEE client with access to the capability can invoke
> >>>>>> the object and request a service. Similarly, TEE can request a service
> >>>>>> from nonsecure world with object capabilities that are exported to secure
> >>>>>> world.
> >>>>>>
> >>>>>> We provide qcom_tee_object which represents an object in both secure
> >>>>>> and nonsecure world. TEE clients can invoke an instance of qcom_tee_object
> >>>>>> to access TEE. TEE can issue a callback request to nonsecure world
> >>>>>> by invoking an instance of qcom_tee_object in nonsecure world.
> >>>>>
> >>>>> Please see Documentation/process/submitting-patches.rst on how to write
> >>>>> commit messages.
> >>>>
> >>>> Ack.
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Any driver in nonsecure world that is interested to export a struct (or a
> >>>>>> service object) to TEE, requires to embed an instance of qcom_tee_object in
> >>>>>> the relevant struct and implements the dispatcher function which is called
> >>>>>> when TEE invoked the service object.
> >>>>>>
> >>>>>> We also provids simplified API which implements the Qualcomm TEE transport
> >>>>>> protocol. The implementation is independent from any services that may
> >>>>>> reside in nonsecure world.
> >>>>>
> >>>>> "also" usually means that it should go to a separate commit.
> >>>>
> >>>> I will split this patch to multiple smaller ones.
> >>>>
> >>>
> >>> [...]
> >>>
> >>>>>
> >>>>>> +    } in, out;
> >>>>>> +};
> >>>>>> +
> >>>>>> +int qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
> >>>>>> +    struct qcom_tee_object *object, unsigned long op, struct qcom_tee_arg u[], int *result);
> >>>>>
> >>>>> What's the difference between a result that gets returned by the
> >>>>> function and the result that gets retuned via the pointer?
> >>>>
> >>>> The function result, is local to kernel, for instance memory allocation failure,
> >>>> or failure to issue the smc call. The result in pointer, is the remote result,
> >>>> for instance return value from TA, or the TEE itself.
> >>>>
> >>>> I'll use better name, e.g. 'remote_result'?
> >>>
> >>> See how this is handled by other parties. For example, PSCI. If you
> >>> have a standard set of return codes, translate them to -ESOMETHING in
> >>> your framework and let everybody else see only the standard errors.
> >>>
> >>>
> >>
> >> I can not hide this return value, they are TA dependent. The client to a TA
> >> needs to see it, just knowing that something has failed is not enough in
> >> case they need to do something based on that. I can not even translate them
> >> as they are TA related so the range is unknown.
> >
> > I'd say it a sad design. At least error values should be standard.
> >
>
> Sure. But it is normal. If we finally move to TEE subsystem, this is the value that
> would be copied to struct tee_ioctl_invoke_arg.ret to pass to the caller of
> TEE_IOC_INVOKE.

Ack

-- 
With best wishes
Dmitry
