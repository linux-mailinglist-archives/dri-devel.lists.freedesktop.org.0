Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA45B9E77B8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 18:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC85010F151;
	Fri,  6 Dec 2024 17:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b="DmLxYPME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF00410F151
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 17:52:33 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-7fbc1ca1046so2255699a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 09:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1733507553; x=1734112353;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nKYHN1tDjRPCAyrZepPGpFuLMXlU8NGafq5LEoek4Ig=;
 b=DmLxYPMEVKIB9hlu204lZo/UyW81+4uSYjXy8yCCNx0ZQ03m8Kr91dgO6ajt7T2QXm
 b7+hhnUYRm5u8wtEKg348tsnTB6/jlIdUxCt6iqpcf/LtvlZtpbrn8sLWh7bDWOKRla4
 Ll/ucxj/MT4ucyIAH4zzriQOInM8qz56H9xvSwi4tKtGQU9DRCi3sd8S3pR4ZSrvAB5e
 DsaGccl9R2cmkwd8QvGOdvR05rIlskdZSDuRklASB1alKDB6d/CrrbI3ZhdHnPZWLFtG
 7ny2lZtEGtpooydANUHbt4xKH3H5bDr7Z5icnunyNeuCPrEYydIn8s3QoaxqmH4+ZBRQ
 Uy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733507553; x=1734112353;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nKYHN1tDjRPCAyrZepPGpFuLMXlU8NGafq5LEoek4Ig=;
 b=JjHIE8PmBLSMwzJMDuXgEnFhCi2t2srd7Fv0gG0pvRM7ijTvGR0jQbgu4UIP/GMnL/
 eogCDqOV0OcPURNoCHRnk3lZfj35HdbkcGPqdFiWVCULBoCSsWQPHW+BnjAyT5k4aBt4
 I8VgH4GApcan8XMpgM+h4nNYyrHT9D0ev/zHry/B3Cg1E6kYmBZa7z+T512+hDXgSEYH
 m34X62pViyqxNLkQq83Ex4lNQCPSQfNbUhHdcL3b72Z15rLpolORK3ByfiWf2qJrtx3R
 74toxHGp26qDKaGWgdkCUNPO7lv8FAHVQDzk18t+Ff+BeHv+YdG4cZYtrxpfYZlmppIM
 fjkg==
X-Gm-Message-State: AOJu0Yzp6whGS/1tj4gUNE8VvyzfHec7U22hTnBpiFICosKrPEuAnpGT
 U3nmu05pfpipShTTOZZxhTg4n14aa9kF1ppUbA1ZNTWcq2Rq+GA9LCM+OvYrow/yumw0O81MSZ9
 fV4dLIdqA4B2HrRxDg40nr0Mlb0OCdqQMHJc6
X-Gm-Gg: ASbGncu8mtxYOYqnE9xY2MjZrOtEXccibngrpD6m/AmIJm2GmVfoPze3D8L7N1uYgcs
 OA1BbTgI7Zj31wljfOaBTHn/Cq2qQ1JQt
X-Google-Smtp-Source: AGHT+IH3u51CB6cyh8k9ahMRnC9pPmxqxIgQNVKfBI4jUC8TZon+ZqYMpuQ8hepzCVqYdx25g9AdleBH6vRLt6zjdEk=
X-Received: by 2002:a17:90b:3910:b0:2ee:d797:40a4 with SMTP id
 98e67ed59e1d1-2ef6955d53fmr6469215a91.8.1733507553348; Fri, 06 Dec 2024
 09:52:33 -0800 (PST)
MIME-Version: 1.0
References: <CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com>
 <c9e86bf2-1d97-87bc-e170-4525d304d89d@amd.com>
In-Reply-To: <c9e86bf2-1d97-87bc-e170-4525d304d89d@amd.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Fri, 6 Dec 2024 17:52:22 +0000
Message-ID: <CAHbf0-Hb=y02=YX3O6Hb7yYH8922sPchWn1YYADNFSrzonoSzg@mail.gmail.com>
Subject: Re: [PATCH V7 03/10] accel/amdxdna: Support hardware mailbox
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Zhen,
 Max" <Max.Zhen@amd.com>
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

On Fri, 6 Dec 2024 at 17:10, Lizhi Hou <lizhi.hou@amd.com> wrote:
>
> Hi Mike,
>
>
> How did you install npu.sbin.1.5.2.380?  There should be a symlink
> npu.sbin which points to npu.sbin.1.5.2.380.
>
> https://gitlab.com/kernel-firmware/linux-firmware/-/blob/main/WHENCE?ref_type=heads#L2719
>
>
> Thanks,
>
> Lizhi
>
> On 12/5/24 07:44, Mike Lothian wrote:
> > Hi
> >
> > I needed to add the following to get things compiling for me
> >
> >
> > diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c
> > b/drivers/accel/amdxdna/amdxdna_mailbox.c
> > index fe684f463b945..79b9801935e71 100644
> > --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> > +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> > @@ -6,6 +6,7 @@
> > #include <drm/drm_device.h>
> > #include <drm/drm_managed.h>
> > #include <linux/bitfield.h>
> > +#include <linux/interrupt.h>
> > #include <linux/iopoll.h>
> >
> > #define CREATE_TRACE_POINTS
> >
> >
> > I also had to rename the firmware in /lib/firmware/amdnpu/1502_00/
> > from npu.sbin.1.5.2.380 to npu.sbin
> >
> > Cheers
> >
> > Mike
> >
> >

It's just a clone of
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
in /lib/firmware, there's definately no symlink in
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/amdnpu/1502_00
