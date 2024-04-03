Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130B2896585
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 09:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E681125AE;
	Wed,  3 Apr 2024 07:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kLx4E31u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D79A112516
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 06:26:15 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dc742543119so5902952276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 23:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712125574; x=1712730374; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/2dKD/Bm+ZtzEQiINOFonFrJFh2338RUVKu+oeOE+dQ=;
 b=kLx4E31u6usO5DVjAwaH510bAh/Fj5+/iN7HAv/XBjn1QvJUcLKFKkj/mqgYs4h0hX
 sXSafMFLufAJkaKUsL3+GUpXeL3QhHL2H2lGOz4vTVDbRmA7SwJnhzdh7qES1vE3HlFO
 3THDPJDkFTyy5THGAzyrzubzeFkR/+29FpGZvf9UYU8sy3ZsTKh/yydNG/O0wu+sSJ16
 28DhX1qe4ECCOAQGxJD1z/5tfgmtKSRfq5XcAhRivV2xKAUp7k5AoagnHhqsKoZ/MeXp
 uWmhwg/UTFX0RtnkQMRoNykbUKQ9TzI6xPPvzDl4J+xCl/ENX6Bu+9+cR2tk+b2IaA0D
 6WAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712125574; x=1712730374;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/2dKD/Bm+ZtzEQiINOFonFrJFh2338RUVKu+oeOE+dQ=;
 b=crusLukKeGZDF/hdG9UOVjMZ5+BslCeYsT/jn5uglvH/A+FEWMApZCwSEycPSbnkgw
 M04Wq0m+rv3ywD5Eu4/wJoLqNXOf8hDG0GmFhs7AWNObVqcZJ6iBm6+8iQbDgi/kUqAz
 FqKyAfs0BmipF8DehEVpC2cSvtSb8l7e4FkunDdVZ19Uvbrf0VjMcxs2edLeo7mhhwg6
 9IXZYRkDne7VvdyxJzUBK6xBINdeFf5n1tfjRAby39RKp/+dK12YBfqS81K7+CGZWGE8
 tEHP4CjCs58EaSf+syUjNcGBONkFsCmW6r/lKBJ8NrNG6q24t60EnI451FdnoIgZrUfN
 dcbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxFpOl8B1HWhnrS23j6uk+SLPPdqnZqaLlc4qyT8yEGG5RDPoq3hNIxQ9sfMlfGra250HcRYegM/HRB3sm6vYyaoSJjV50FSaGUgsOeFeg
X-Gm-Message-State: AOJu0YyCpWxGyUVK885+jPB/kvkYvZCnmydPmyR0zWHxGCspkwdUNTJL
 jvLi3kmgZCPFGUQzz6tPZpmipZ1E9Vc64WSZ+hpc/NqzGEEeZkyvxNjlxy30WKyPgLK4M3gtDe8
 buZpTDtLVOnhn7h842JlcXHmT8Kk=
X-Google-Smtp-Source: AGHT+IEnMsMUQUB9XnLlTGLVqMvFyXWkpsp7wL/mx32iAGiAltt8M6vXSbvrtiRgiI1MmJxhsxyKBdd/JA3//Sm/aaY=
X-Received: by 2002:a05:6902:18c2:b0:dcb:b572:4aaa with SMTP id
 ck2-20020a05690218c200b00dcbb5724aaamr2006751ybb.38.1712125574154; Tue, 02
 Apr 2024 23:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <SH0PR01MB063461EBC046437C88A6AE84983BA@SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <SH0PR01MB063461EBC046437C88A6AE84983BA@SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Wed, 3 Apr 2024 09:25:47 +0300
Message-ID: <CAFCwf12ou8zNgr-_Ru8xT+Q1RWyxywwqJmx9w1spo_MdaEPr1Q@mail.gmail.com>
Subject: Re: About upstreaming ArmChina NPU driver
To: Dejia Shang <Dejia.Shang@armchina.com>
Cc: "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 03 Apr 2024 07:10:39 +0000
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

On Thu, Mar 28, 2024 at 10:01=E2=80=AFAM Dejia Shang <Dejia.Shang@armchina.=
com> wrote:
>
> Dear Kernel Maintainers,
>
> I am a driver developer and would like to upstream the ArmChina Zhouyi NP=
U driver ("Zhouyi" is the brand) to accel subsystem.
>
> The driver is already open sourced (both UMD and KMD) and anyone can find=
 the code from https://github.com/Arm-China/Compass_NPU_Driver.git.
>
> This driver is responsible for scheduling AI inference tasks to the NPU c=
ores (V1/V2/V3). Specifically, a simplified end-to-end flow is:
>
>         1. A TFLite/ONNX model is transformed to an executable binary fil=
e in ELF format by the NN graph compiler (designed by ArmChina)
>         2. An application loads the executable binary file to UMD and pro=
vides the input data.
>         3. UMD parses the binary and sends ioctls to KMD (open device, do=
 memory allocation/mmap/free, submit the job descriptor).
>         4. KMD dispatches the job to NPU h/w, handles interrupts and upda=
tes the execution status.
>         5. UMD polls the status of the pre-scheduled job.
>         6. The application gets the output results.
>
> So...for the upstreaming,
>
> Q1: do you think our NPU driver is suitable for accel? If the answer is y=
es, which tree & branch should the patches be based on?
Hi Dejia,
Yes, it definitely sounds as a good fit to the accel subsystem.
Please base your patches on "drm-misc-next" branch in drm-misc repo:
https://anongit.freedesktop.org/git/drm/drm-misc.git

>
> Q2: in thread https://lore.kernel.org/lkml/ec547d33-214f-4952-aa33-c271e9=
edad63@kernel.org/ showing a similar case, Oded mentioned that:
>
>         "If we would have upstreamed a new driver, the expectation would =
have been that we would use some drm mechanisms.", and
>         "the minimal requirement is to use GEM/BOs for memory management =
operations".
>
> I guess those requirements are also applicable for the Zhouyi NPU KMD? Cu=
rrently, the memory management (MM) in KMD is based on dma-mapping APIs, wh=
ich handles both reserved CMA region(s) and SMMU mapped buffers, and suppor=
ts the dma-buf framework. Maybe I should replace the implementations with D=
RM APIs.
Yes, those requirements definitely apply here.
>
> Q3: if you have looked at the KMD code, do you think I should make any ot=
her major change before submitting the first patch series? Thank you!
I took a quick glance. In general, it seems to be ok, but I noticed
two things related to the integration with drm/accel:

1. You us a scheduler for the job submission, which provides the
ability to defer jobs. In that case, I suggest to check if you can use
drm_sched instead of your own implementation. No point in re-inventing
the wheel.
2. You provide several memory zones for allocation of memory. I would
suggest here to look at using ttm as the memory manager instead of
re-implementing your own.

And please remove the IMPORTANT NOTICE at the end of your emails. I
would have to refrain from answering to further emails if that notice
remains.

Thanks,
Oded

>
> Thanks for your time and look forward to your reply~ =F0=9F=98=8A
>
> Best Regards,
> Dejia
> IMPORTANT NOTICE: The contents of this email and any attachments may be p=
rivileged and confidential. If you are not the intended recipient, please d=
elete the email immediately. It is strictly prohibited to disclose the cont=
ents to any other person, use it for any purpose, or store or copy the info=
rmation in any medium. Thank you. =C2=A9Arm Technology (China) Co., Ltd cop=
yright and reserve all rights. =E9=87=8D=E8=A6=81=E6=8F=90=E7=A4=BA=EF=BC=
=9A=E6=9C=AC=E9=82=AE=E4=BB=B6=EF=BC=88=E5=8C=85=E6=8B=AC=E4=BB=BB=E4=BD=95=
=E9=99=84=E4=BB=B6=EF=BC=89=E5=8F=AF=E8=83=BD=E5=90=AB=E6=9C=89=E4=B8=93=E4=
=BE=9B=E6=98=8E=E7=A1=AE=E7=9A=84=E4=B8=AA=E4=BA=BA=E6=88=96=E7=9B=AE=E7=9A=
=84=E4=BD=BF=E7=94=A8=E7=9A=84=E6=9C=BA=E5=AF=86=E4=BF=A1=E6=81=AF=EF=BC=8C=
=E5=B9=B6=E5=8F=97=E6=B3=95=E5=BE=8B=E4=BF=9D=E6=8A=A4=E3=80=82=E5=A6=82=E6=
=9E=9C=E6=82=A8=E5=B9=B6=E9=9D=9E=E8=AF=A5=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=
=8C=E8=AF=B7=E7=AB=8B=E5=8D=B3=E5=88=A0=E9=99=A4=E6=AD=A4=E9=82=AE=E4=BB=B6=
=E3=80=82=E4=B8=A5=E7=A6=81=E9=80=9A=E8=BF=87=E4=BB=BB=E4=BD=95=E6=B8=A0=E9=
=81=93=EF=BC=8C=E4=BB=A5=E4=BB=BB=E4=BD=95=E7=9B=AE=E7=9A=84=EF=BC=8C=E5=90=
=91=E4=BB=BB=E4=BD=95=E4=BA=BA=E6=8A=AB=E9=9C=B2=E3=80=81=E5=82=A8=E5=AD=98=
=E6=88=96=E5=A4=8D=E5=88=B6=E9=82=AE=E4=BB=B6=E4=BF=A1=E6=81=AF=E6=88=96=E8=
=80=85=E6=8D=AE=E6=AD=A4=E9=87=87=E5=8F=96=E4=BB=BB=E4=BD=95=E8=A1=8C=E5=8A=
=A8=E3=80=82=E6=84=9F=E8=B0=A2=E6=82=A8=E7=9A=84=E9=85=8D=E5=90=88=E3=80=82=
 =C2=A9=E5=AE=89=E8=B0=8B=E7=A7=91=E6=8A=80=EF=BC=88=E4=B8=AD=E5=9B=BD=EF=
=BC=89=E6=9C=89=E9=99=90=E5=85=AC=E5=8F=B8 =E7=89=88=E6=9D=83=E6=89=80=E6=
=9C=89=E5=B9=B6=E4=BF=9D=E7=95=99=E4=B8=80=E5=88=87=E6=9D=83=E5=88=A9=E3=80=
=82
