Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D858F9270B2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 09:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F5310EA04;
	Thu,  4 Jul 2024 07:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C1TbCmes";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA51C10EA04
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 07:34:40 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-64789495923so2949867b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 00:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720078480; x=1720683280; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSJbA3DiJ1YzPD3LPw7LD0YqK/n1egS96uxWCsi6+XA=;
 b=C1TbCmesZQ32S2q7gOf7Q+iTpDnVST4SWV3/Wi6PjM/snMOkWID6YLo9TcePyicyD5
 1uoa7aShGVbaQU5o0bw/PyKCjmJiJWdV5lyoBvEyKbb+MeDmugZdCW39H34gFsClrddD
 WAM3cmyUUTIMwzDhqH8v1/8HDjSvSn336eBDcv6+Y8lC4e7uO6qCHgfwDmRNrmOVo2kf
 oCfTvdIoRz+K8Iqfh36hXpPimHKGw20DvCIGfews8mGhx5pIIe03+M+oHiEjPzrkt/+m
 at7+gB4MTzONvsO7qVEkyYGeEHeC07DrQxg1wS37UGoNHvpiiUesbqwXnJ3QsWoLTFCO
 uZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720078480; x=1720683280;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZSJbA3DiJ1YzPD3LPw7LD0YqK/n1egS96uxWCsi6+XA=;
 b=kKurrjIIGmGgg+uzkQ7BXO5dphrUwVuiAnrLjo44vpAjjcC7H2VgJ1JEjhmCEXhyve
 +Mc99fTH+MykzoEHbC++I5NIlz1P8ecf8KFrt9B2U+iEAULJvdgALsUtGHseXZFqpD9t
 Y7JTzEmuicKlkrwuEFBUFXCuArn4p1YUy7Q9SeQlTH4eCewQfH8v9cgCfV6imu8yll0Y
 dov2NBnX39QVygfOXu7pY1UxHKzSmp1dBm+48/ve2x+HkI9pwVAj34/rHnSnFxMhK8ke
 uXBym6kJVTikQEQ8dkBoUfyODCxBblwZi8n1/TlbGw0ss7kU0/oKZ7D9V5u4o0siplc+
 ngBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuM06wCyAwiGi28kcios5rJs/swAQHVKlrKc9sG26DZVUZ8jf7MdglHoqggjM7lQcT6PlEEkkKN1+6z5S6SU3zUZHFtk0JgjVHBaPfcft5
X-Gm-Message-State: AOJu0YxAmUi/P8v1dPXU8znGmTNmSzIjWLBwPyBcQ7qE8NPzyiLbuJpR
 9hpdxRGl5P6prZnlFmPZIrwnGJ2f3Zcht50Z2hwOxrwQLbkxgYM+LcvJte3bMTY1wiAC7AKS3/m
 dED+G60eMS2ScV11F9KPx29WuGW7pDmzaUB/o5g==
X-Google-Smtp-Source: AGHT+IHhzigWq58lUOH6s/Jt2RBqXA0UUUMkvO30rPZCplWLfh0mEABxieG1yDWZSLhKM2T0i2/FZBaIpwaJfjilpU0=
X-Received: by 2002:a05:690c:7483:b0:631:2ebf:b8dc with SMTP id
 00721157ae682-652d5333721mr10121657b3.4.1720078479809; Thu, 04 Jul 2024
 00:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <20240702-qcom-tee-object-and-ioctls-v1-1-633c3ddf57ee@quicinc.com>
 <ink4tq3wk2jkpybiisaudkun3g2x2drfogrdw43zdpi6yh2u5g@yrvrxzxsi46g>
 <836dab13-9c59-4d87-a600-a0be6506deb2@quicinc.com>
In-Reply-To: <836dab13-9c59-4d87-a600-a0be6506deb2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Jul 2024 10:34:28 +0300
Message-ID: <CAA8EJprp2veCaQq8GsYv4Mu1HQbx8nWv0XWtxcE4cu5kxkA16w@mail.gmail.com>
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

On Thu, 4 Jul 2024 at 00:40, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
>
>
>
> On 7/3/2024 10:13 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 02, 2024 at 10:57:36PM GMT, Amirreza Zarrabi wrote:
> >> Qualcomm TEE hosts Trusted Applications and Services that run in the
> >> secure world. Access to these resources is provided using object
> >> capabilities. A TEE client with access to the capability can invoke
> >> the object and request a service. Similarly, TEE can request a service
> >> from nonsecure world with object capabilities that are exported to secure
> >> world.
> >>
> >> We provide qcom_tee_object which represents an object in both secure
> >> and nonsecure world. TEE clients can invoke an instance of qcom_tee_object
> >> to access TEE. TEE can issue a callback request to nonsecure world
> >> by invoking an instance of qcom_tee_object in nonsecure world.
> >
> > Please see Documentation/process/submitting-patches.rst on how to write
> > commit messages.
>
> Ack.
>
> >
> >>
> >> Any driver in nonsecure world that is interested to export a struct (or a
> >> service object) to TEE, requires to embed an instance of qcom_tee_object in
> >> the relevant struct and implements the dispatcher function which is called
> >> when TEE invoked the service object.
> >>
> >> We also provids simplified API which implements the Qualcomm TEE transport
> >> protocol. The implementation is independent from any services that may
> >> reside in nonsecure world.
> >
> > "also" usually means that it should go to a separate commit.
>
> I will split this patch to multiple smaller ones.
>

[...]

> >
> >> +    } in, out;
> >> +};
> >> +
> >> +int qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
> >> +    struct qcom_tee_object *object, unsigned long op, struct qcom_tee_arg u[], int *result);
> >
> > What's the difference between a result that gets returned by the
> > function and the result that gets retuned via the pointer?
>
> The function result, is local to kernel, for instance memory allocation failure,
> or failure to issue the smc call. The result in pointer, is the remote result,
> for instance return value from TA, or the TEE itself.
>
> I'll use better name, e.g. 'remote_result'?

See how this is handled by other parties. For example, PSCI. If you
have a standard set of return codes, translate them to -ESOMETHING in
your framework and let everybody else see only the standard errors.


-- 
With best wishes
Dmitry
