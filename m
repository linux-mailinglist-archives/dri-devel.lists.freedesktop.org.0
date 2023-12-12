Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 112AE80EF64
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 15:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5553410E604;
	Tue, 12 Dec 2023 14:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C94210E604;
 Tue, 12 Dec 2023 14:55:33 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3b9db318839so4103512b6e.3; 
 Tue, 12 Dec 2023 06:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702392932; x=1702997732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FC/Vpfr7MIARIwnwGGWmXjjUlNgWi23Htq/xmbvsJCk=;
 b=h8Gmi0276XNDO9IzKB7uvvJiruHn2vfDw3ntUg0J/qx9G8L//AQyP24TeEoSgLfbzp
 9cARCMTcO2F7JO74ALRbDZXmqqoAU9s5e64+8G2/dgJxAOZ7FvD5vC68Kyet6CjY+KVI
 QK8zSVqaMVk4Mi53GQMy6MzKc03B3xOecvQDwdtULgRXcz0Sffe6BaCwmI7e36uktVka
 w9usdl+Php5i6V2Aoqd6y0QUtmYEoaKF5DesJn/meDARf17EvktiyJZON0f9R6jQkKhh
 YsihNoUfu7TIIyl4MQEdDytzKPEyyH173y5gpe30NAI/srPNdG4K+uru7pbZsDmL2oQA
 1KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702392932; x=1702997732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FC/Vpfr7MIARIwnwGGWmXjjUlNgWi23Htq/xmbvsJCk=;
 b=ZpHrD/u6zBXpWG1Qey8AwezFxLsB6gM/TODWGxguIPDbyjD6soDer2nosmd7INU1FV
 ZvU9oJIVrhvKcLUlFU7/3k8qGtYxrzeU9uFoYqpXVtwXebSxLVR7iTd31aVVgr68iloN
 ug7TznziaVB1JP1vwB6q/K9mx1eXKZ+BtMuwAJDx0aT9AouzL4dticLU9EF96BDLECix
 kK0N02vqKIUB8r0ejYrGFDWHeo4r9ZgtQAK4dWc5pk/1NKcfo1WXtPrKorxo66rntYhs
 NA+47tB08JiiPMRmMRkWWHoVaYUr3nPNx/7e9iV0COBKt5voZ90TcRLIrMpsNju3vyEg
 Pz6w==
X-Gm-Message-State: AOJu0Yw1x6UULZhGrbsrSamlmfvepaSGUEP/y/XURk+oX1tH1LVyssd/
 c31BWYYxnLfjdMxolP4+5z7BpAfgItBDrooOKvk=
X-Google-Smtp-Source: AGHT+IHq+QzxCX8gQUM6S0hC7Fo7q1dTCZTgvw/J1vuRyfhGGu2MpPtuJGqJYnc/6KWnfR91d4qZpois0AOaWLPWIjw=
X-Received: by 2002:a05:6870:f155:b0:1fb:75a:c417 with SMTP id
 l21-20020a056870f15500b001fb075ac417mr5948435oac.64.1702392932689; Tue, 12
 Dec 2023 06:55:32 -0800 (PST)
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87jzq2ixtm.fsf@vps.thesusis.net>
 <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
 <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com>
 <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
 <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
 <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
 <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
 <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
 <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
 <CADnq5_Oy6RMyJ52TbsxVjZ=0p=wYJHduE4X8B3DiYnqHYJUAvw@mail.gmail.com>
 <87edg3koka.fsf@vps.thesusis.net>
 <CADnq5_PtSV1C6Up78XX8ejExqaiM-wzHVFhCRtxboS1Y4cF-Ow@mail.gmail.com>
 <87y1e05me4.fsf@vps.thesusis.net> <87r0jsw9g3.fsf@vps.thesusis.net>
In-Reply-To: <87r0jsw9g3.fsf@vps.thesusis.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Dec 2023 09:55:21 -0500
Message-ID: <CADnq5_MYSCd32p2doPMN1_vcrUZvHMDPn83LU-0oVBS6fuRVuA@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Phillip Susi <phill@thesusis.net>
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Luben Tuikov <ltuikov89@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 7:28=E2=80=AFPM Phillip Susi <phill@thesusis.net> w=
rote:
>
> Phillip Susi <phill@thesusis.net> writes:
>
> > And it works, but 6.7-rc5 does not, even though it includes that patch.
> > Here's the syslog from the attempt.  I'll start bisecting again.
>
> I checked out the patch that got merged upstream and it also fails.  I
> looked at the two commits, and I see what happened.  Your original patch
> MOVED the call to amdgpu_ttm_set_buffer_funcs_status().  The one that
> got merged into Linus' tree instead DUPLICATES the call.  Oops?
>

Yeah, I messed up the patch somehow when I applied it.  Fix up already
queued up to add the missing chunk.

Alex
