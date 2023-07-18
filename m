Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AEB7576A3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE18D10E2F5;
	Tue, 18 Jul 2023 08:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9CA10E023
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:35:05 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so4159819a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 01:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689669305; x=1692261305;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eMpOX6C6FYtAsj4g5lQl10VVb5hvzXz095FozRIR5PU=;
 b=DwimSEDVkIBfU0qaTsE+yPx0nYQT1QCX0UKdyX+stGt2gKMdLu0KxOsi+hCOgdWDnC
 ejUUJCFRbmMnoaBjAJuuZmDg45yXpoguxMzhG0OFw6yICEBHdMqGTuV3i5/7AXXkmtM2
 EMJsdQLhmAM5NEMO2yjL7sAkrvao6vMvnnLE8Ub3FAjDDR65QsRnqs+puQSHxFlJnKyv
 +1kUvk7zLDLOQ/rYuKjv27id8UPUTTFj9R9L9mR2An7OBaz8hL6IgwygCvucSU9Gyd2B
 RNrosT75Xwnnyt+R1FWxBbab7NHxpIPw/MJJ9QdXZoM2aRr3f72TLZ4hm40DtvLUE2hn
 J1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689669305; x=1692261305;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eMpOX6C6FYtAsj4g5lQl10VVb5hvzXz095FozRIR5PU=;
 b=LJwYSdp0+xuJEuDRGdIvTsw8T9iFr2z8trBsj37e7c+LhnMaqZYqhTGGZi0UmMTHkd
 t9fNhdmqVWZAsb25gFCcFacMU2PpTaYoMAtVt4RcJghju9xUBwrtGvJqWOngLpEUSd3C
 O8SzRjgUauyYaT9f/795fyldAa3TKgU77WRdAz1FZnWxRgzHkIJxon8GqX8veMmwndHY
 9M6bhNm4NKyxn2W0XKHHn3IKB9Vjt8yDzf+hM5dnIt+ePg7qhtcwkSCpFsrq1Cfo+3ah
 TyWuHZ7cyDcV5EeXAGal/BIf+6mXU4nI5hJTxYnLgQB1Nkq9M184zP8kyA/YV3OyUrke
 aYKA==
X-Gm-Message-State: ABy/qLbsXdDSQ8y3/elFKdY9g8wJ4fF1sV+aWPkpY9rZty8OxJx3z3Cd
 IP2fUZxsjUqpRJL/dt4C3SQrsCfvvCirWzKAzpY=
X-Google-Smtp-Source: APBJJlGS8gVNY6wOq3wTAu77YtV4k3kOYTmOgon0h0cxJMmNVVysd6ICAyejQni8l5u9Fm0MnNHYbqxrv1jSa3ue0i0=
X-Received: by 2002:a17:90a:72ce:b0:267:7743:9850 with SMTP id
 l14-20020a17090a72ce00b0026777439850mr939949pjk.14.1689669304776; Tue, 18 Jul
 2023 01:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <64b5dc93.170a0220.243d5.1d63@mx.google.com>
 <87zg3tiv08.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87zg3tiv08.fsf@minerva.mail-host-address-is-not-set>
From: Luc Ma <onion0709@gmail.com>
Date: Tue, 18 Jul 2023 16:34:50 +0800
Message-ID: <CAB3Z9RKV4ptbwnyG2T1LsqcAFVmBsTFOGrVS5RR9PNx7FO8OfA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: remove unintended hyphen in the sysfs path
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On Tue, 18 Jul 2023 at 14:39, Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Luc Ma <onion0709@gmail.com> writes:
>
> > From: Luc Ma <luc@sietium.com>
> >
> > Signed-off-by: Luc Ma <luc@sietium.com>
> > ---
>
> Even when is a trivial change I would add something as commit message, i.e:
>
> "The kernel-doc mentions /sys/kernel/dma-buf/buffers but the correct path
> is /sys/kernel/dmabuf/buffers instead. Fix the typo in the documentation".
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

thank you for the review, I'll add the above to v2

> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>
