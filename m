Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBDBD1981A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 15:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D679210E193;
	Tue, 13 Jan 2026 14:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fwR9Ybjd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBEF10E193
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 14:35:50 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-34abc7da414so4371089a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 06:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768314950; x=1768919750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oSG1flMMfh36IrNc9ewR5ZYBFxhDPNDnEZLwNTNKxSw=;
 b=fwR9YbjdmsO9NIoC25kaSGckmSt/9oOp7rxkKpavHO9bhJjttkDO4lo4jYPbaZ2N9T
 0s+F6vSfUHjbgdEvCD0GgXk+4uNdLSQyEb0Yo+FZd3mP7K4BKNz/PoXN4VCkXV8KHsM2
 UzFW3eYGYnvnt2frvUMvRXOidBUDddQUtYBuLqQvHsXCbLMjGgW3LpJg4iwbAP6pnUck
 OwYcWRXKikGTQvL8dWL4FnPTBimJtAn6tphyc2ap651dqmhOXXSd6jB84hUnoZHojHdE
 jj/Dzgz829gVRLRXTJEeCfdVAvbURuCHeWx860/lv9MBXSV3XNVIEU5vWhDRLPgl1Df2
 OJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768314950; x=1768919750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oSG1flMMfh36IrNc9ewR5ZYBFxhDPNDnEZLwNTNKxSw=;
 b=SEzIc6qvgcTT1SDsjvAVhffpnxGq+WCiRT+ar5BiGG9LQbincHlXPi1vt/LyPsYfwT
 rQqY84DahTGg8bzhpQmyH5OTsG5fRdRJ5lghtPyQGKmmM/l5pcDLzP2DCaof3iutkMlR
 Q/nK0ohDjPVWI5yv5M37DRNfUxhyNEk1xA7/Odu6EisCIob8H069h2XMVltukJmPRcA/
 6uGYE+UeiMvzlYTxnpvU0KVdJzElDZmHBMnxj2s3rkp7+1t7Q+JvkRZ/S2yCjce/RlYd
 6Prf9VOS+3S40bZAITwITGMG3r5fxSSNRAOANfPnfevNwCrZpGrQz4hDpFb0ODOk4wWo
 Go+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0kzS4soJj/C4OZIEGE8Nf9K5mwlyILtTZJH48yAbHdIaqmZPijEmB42grscwAhziv7Z1Gln546mU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKZsuDcz+sqAGJWzyt5xUvokhH3nksc+r0Kj34KpdAnpuNeerj
 RKvXFYzE7z3xFAfbyvsI5VTARa35ENqYha/RVbIaKz16782rBOshYIvhDdlybNHzUWkL+EcaKmU
 XaQv7wLYRayT8ZfLPnWFU7hVaJqJVjyI=
X-Gm-Gg: AY/fxX5M6iVsOX7Z166nUEU7wfRTDh2OYNeXTKpts8i1mcPKh/F0p5vbji6h9LHwRed
 fHcbukMV0kwKAXd4dVN6W6F9tv47xWArd4QpdizICw3jCdjjtYrPDIIaJqB4QApuq/xxUmhYDYQ
 ciI5Lima9ZteJq7HsEs5NPbLyKMFEeVK1g12dW+yOb6MR8hB/IjACCar2lYmo8wzRKgZrOokpD5
 X29OybyoFlXIBaK4X06yr3W2n2bfRzyIQjvGcU8j9iPPYRVNz0HkhopkdSV2kAAsuzg
X-Google-Smtp-Source: AGHT+IHT+/65AwG7pbeaD+hwDIeJFQVVT8OcPnsbknIVCNlEW+jBEIRg6vXSDBwDn6VbTK0XAMZHrcwQrDSLxvGIXR4=
X-Received: by 2002:a17:90b:264a:b0:341:3ea2:b625 with SMTP id
 98e67ed59e1d1-34f68b661eamr23258771a91.12.1768314949735; Tue, 13 Jan 2026
 06:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20260113065409.32171-1-xjdeng@buaa.edu.cn>
 <20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com>
In-Reply-To: <20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com>
From: Xingjing Deng <micro6947@gmail.com>
Date: Tue, 13 Jan 2026 22:35:38 +0800
X-Gm-Features: AZwV_QilNtsaInykWQuPTQNCtpY0ZlBqP2RfpYd9nDByrVVow35WCZNPQxZXsrw
Message-ID: <CAK+ZN9oMpc9nh08vK1j1XDfhs8w=sQngmJ6rPOqa9QZwjTioUQ@mail.gmail.com>
Subject: Re: [PATCH v3] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de, 
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
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
Reply-To: micro6947@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

OK, I will do that.
PATCH v4 is released now.

Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B41=E6=9C=88=
13=E6=97=A5=E5=91=A8=E4=BA=8C 16:44=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jan 13, 2026 at 02:54:09PM +0800, Xingjing Deng wrote:
> > In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> > reserved memory to the configured VMIDs, but its return value was not
> > checked.
> >
> > Fail the probe if the SCM call fails to avoid continuing with an
> > unexpected/incorrect memory permission configuration
> >
> > Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access =
to the DSP")
> > Cc: stable@vger.kernel.org # 6.11-rc1
> > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> >
> > ---
> >
> > v3:
> > - Add missing linux-kernel@vger.kernel.org to cc list.
> > - Standarlize changelog placement/format.
> >
> > v2:
> > - Add Fixes: and Cc: stable tags.
> >
> > Link: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnf=
i67e@hu-mojha-hyd.qualcomm.com/T/#t
> > Link: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xj=
deng@buaa.edu.cn/T/#u
>
> v3:
>  - ...
>  - ..
>  - Links to v2 : https://lore.kernel.org/linux-arm-msm/20260113063618.e2k=
e47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#m84a16b6d0f58e93c1f786ea04550681=
b23e79df4
>
>
> v2:
>  - ..
>  - ..
>  - Link to v1: ...
>
> You could even use b4..
>
>
> >  drivers/misc/fastrpc.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index fb3b54e05928..cbb12db110b3 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_devi=
ce *rpdev)
> >               if (!err) {
> >                       src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
> >
> > -                     qcom_scm_assign_mem(res.start, resource_size(&res=
), &src_perms,
> > +                     err =3D qcom_scm_assign_mem(res.start, resource_s=
ize(&res), &src_perms,
> >                                   data->vmperms, data->vmcount);
>
> Fix the alignment to previous line '(' like you did for dev_err(), I know=
 this file lacks it,
> but that does not mean we should repeat it.
>
>
> > +                     if (err) {
> > +                             dev_err(rdev, "Failed to assign memory ph=
ys 0x%llx size 0x%llx err %d",
> > +                                     res.start, resource_size(&res), e=
rr);
> > +                             goto err_free_data;
> > +                     }
> >               }
>
> With the above change.
>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>
> >
> >       }
> > --
> > 2.25.1
> >
>
> --
> -Mukesh Ojha
