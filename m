Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88D958F0AE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 18:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0D610ECA1;
	Wed, 10 Aug 2022 16:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E931136F4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 16:45:32 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id uj29so28850229ejc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 09:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=5NvoZJM3Gs+fBasdyNd4Z2rFfR4Itw8USwXW1cmyyE8=;
 b=GIYzVXcdJxpQ4lZ25KP2SH5ofk/LXeWONvwkMDgjc3EOG8fVZz3Z4r/EA/diDglMCc
 QuLhWkGhHKZ/9I4K+K7mAQyI5xkaQ8xRZoChF3UTRRIq6r+28RxIFlUaR0BnyHpfcWmx
 sCUKW9nB1Yz6TUj4D74JeVPtpmPtcsuTWLqrLvjyg/VYqtL5L08h3Ehh7xKs9BQtYqtf
 EKB3oBidDMpfIJ3QqH1vE97g9j1fkh8osmE/carv0fYVdpia1jHzrVKvYeMhP7bxTsbr
 DygSJskZfMY+XcDeN6Na0hgG1ZYqqN+tfov5+S87PHEe2uK4eYXCzPNImtV+vVbb3BPj
 pDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=5NvoZJM3Gs+fBasdyNd4Z2rFfR4Itw8USwXW1cmyyE8=;
 b=rZjFYUjj3KyI89A1VDh88TVEaKnQmvft0dBIZSawbwzRKvlPjikPyojnozGVW8xNic
 D1VXprQ5RhVS8v6MpuO/dhoqpt21wRZGXZGo6+seFdBRXV1RjENxW4VqeFAq0gmF28yz
 T5GpzkPhpXRM7uIzSushinJNSisIs5h42pihnqG0XfTR02DeZZi347aNZXZzbBUcHuQz
 2Y3CfusdsMsck9/zfRZb9ARIsGRwPvM8jE5+H365dqzaRB5+vLUFo9qNhS006akgB6Cl
 xiTx6DfFx1pcXzNOVeEohCUkJJkcqtoDNNOCIBsOJnuqVm+16gwXSmfc3Ax9CQVoPVE/
 I+tw==
X-Gm-Message-State: ACgBeo2UDBtJGa4D0OTMxHTN5UsQALRaERB4h5Ah07Jm6HthXr+3dseH
 Uez9GOVNLTk40VKfIRd+rVY9L57vC4jboi/dLEKBuA==
X-Google-Smtp-Source: AA6agR59uDEneVfQSSQ5O0JbL9fvFhN61r08zRzhXcVxubzSSg2ygxBcsm4TZKp55NK2SPAS2Mt4RJQd3vAi7VMUtwQ=
X-Received: by 2002:a17:907:7da0:b0:730:fe97:f899 with SMTP id
 oz32-20020a1709077da000b00730fe97f899mr17172028ejc.369.1660149930625; Wed, 10
 Aug 2022 09:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220709115837.560877-1-jose.exposito89@gmail.com>
 <20220709115837.560877-5-jose.exposito89@gmail.com>
 <CABVgOSmhOBdXPH_=B_WRcUjMGC-wVPTLBwCdbgZLb0o3-O8pKw@mail.gmail.com>
 <20220717170054.GA1028249@elementary> <YvPddQEptMj23HSj@phenom.ffwll.local>
In-Reply-To: <YvPddQEptMj23HSj@phenom.ffwll.local>
From: Daniel Latypov <dlatypov@google.com>
Date: Wed, 10 Aug 2022 09:45:19 -0700
Message-ID: <CAGS_qxoM61S6vBBBKMQ8JMCSOuJWXXbGjQPhA_zjURy7Kwm0cA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb565()
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
 David Gow <davidgow@google.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Latypov <dlatypov@google.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 maarten.lankhorst@linux.intel.com, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, 
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, dri-devel@lists.freedesktop.org, 
 KUnit Development <kunit-dev@googlegroups.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Wed, Aug 10, 2022 at 9:31 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, Jul 17, 2022 at 07:00:54PM +0200, Jos=C3=A9 Exp=C3=B3sito wrote:
> > Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com> wrote:
> > > I already fixed the warning and added the reviewed by tags, however, =
I
> > > noticed that rebasing the series on the latest drm-misc-next show thi=
s
> > > error:
> > > [...]
> >
> > Sorry for the extra email. I forgot to mention that the error is only
> > present in UML. Running in other architectures works as expected.
> > Tested on x86_64 and PowerPC.
>
> Maybe a regression in the kunit infrastructure? Just guessing here ...
> -Daniel

As noted elsewhere on the thread, these errors means that kunit.py
can't parse the KTAP output coming from the kernel.
There shouldn't be any recent changes in either the python-side parser
or the kernel-side output logic.

So I can't think of a kunit-specific change that would trigger this.
There could be some other issue causing output mangling.

We'd want to look at what output the UML kernel produces (stored in
.kunit/test.log, or visible via kunit.py run --raw_output).

-A different Daniel
