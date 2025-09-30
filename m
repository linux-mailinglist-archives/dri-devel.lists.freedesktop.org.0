Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4F7BAEBA3
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 01:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6658110E2EA;
	Tue, 30 Sep 2025 23:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TLMYUycy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816C410E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 23:06:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0B8D344BAB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 23:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D510CC116D0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 23:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759273573;
 bh=mFz+L72B9DjiruUWCPt3+uUkwCHLqPB81lzn9f7L9es=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TLMYUycydyqqjUP15CWlEFWzraN18TkKIePRecxtCkCy1V5Q6/cfOULx67IJAdEQY
 EFNXsgnj/eXNVpwvz/ZXK8sN2Kv+2EroVbxbQTHggT3RrnWzpqW/+Z+m7tk7o9dfFo
 sEq6s7AbWNouIEML4E8VJ1WTkAEhu3E135shP2Vr1R/buR2pnuVKgi3JwzjqUc5Wm0
 DWzbQKPLIcspHPUxfkQnFXFz1R8Rm8sSnElOO/CFIwGkfzxfOMPgGpPyR3P6DpgPBJ
 o2/bpIo5eTMgdzFUbE3ysoaO3uOcJaWiK5lanpjA19JNzBPG/nwdL23imNUc9InoM5
 H64dZ454YRRPw==
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-27d3540a43fso72542715ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 16:06:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWNC3vZgm4KfjmQmzAnrXn7AIX1lFlQ5KjY4x0wfjOE+ayyT7ie1ADJKnvcPYqVyGAgpOXNXfV0R/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9mYQuTVN60/mR7gLQbSjg3Q9o0tUjvWDetf2/+UkEjk/lNhNW
 mojzAyYAwavVwlzUXSHwlC3idqBlT0xGoAobJr8q36SFrkPAOkthuPqRdGO4+UV0VLrC4lIcMWr
 zp1oO5Qa9hilvd2qGhuSJa3zuRLdnYEQ=
X-Google-Smtp-Source: AGHT+IEtVABxEKyxN7a+U3Kp2sBw7bT8AmKlK9sbcU4p8q7V3u9HMuNYcQ/g3mBtE/Xshs31HBFf6QR4rED4d0MupEk=
X-Received: by 2002:a17:903:4b48:b0:275:2aac:fef8 with SMTP id
 d9443c01a7336-28e7f33067fmr14927905ad.38.1759273573411; Tue, 30 Sep 2025
 16:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9@epcas5p4.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com>
 <20250930040348.3702923-9-h.dewangan@samsung.com>
 <CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com>
 <75d06769-4896-4095-9969-03a517705196@samsung.com>
 <CAJKOXPe0kGFoUxOGupwD_rSshTBVFhH3184xOH=NquSGn2QxcQ@mail.gmail.com>
In-Reply-To: <CAJKOXPe0kGFoUxOGupwD_rSshTBVFhH3184xOH=NquSGn2QxcQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 1 Oct 2025 08:06:01 +0900
X-Gmail-Original-Message-ID: <CAJKOXPchnA2k4sghuSBxA4h=CKJEQU0=09F+AAxPxA-rBpUW_g@mail.gmail.com>
X-Gm-Features: AS18NWB-7qq3WRSu2_4sN54O9Pq__ESSuLB-fBN1o7du1U_PSVDKaJXEOusJU-4
Message-ID: <CAJKOXPchnA2k4sghuSBxA4h=CKJEQU0=09F+AAxPxA-rBpUW_g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_08=2F29=5D_media=3A_mfc=3A_Add_Exynos=E2=80=91MFC_drive?=
 =?UTF-8?Q?r_probe_support?=
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Himanshu Dewangan <h.dewangan@samsung.com>, mchehab@kernel.org,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org, 
 christian.koenig@amd.com, alim.akhtar@samsung.com, manjun@samsung.com, 
 nagaraju.s@samsung.com, ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
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

On Wed, 1 Oct 2025 at 07:59, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, 1 Oct 2025 at 00:46, Marek Szyprowski <m.szyprowski@samsung.com> =
wrote:
> >
> > Hi Krzysztof,
> >
> > On 30.09.2025 07:54, Krzysztof Kozlowski wrote:
> > > On Tue, 30 Sept 2025 at 12:56, Himanshu Dewangan <h.dewangan@samsung.=
com> wrote:
> > >> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
> > >>
> > >> Introduce a new Kconfig entry VIDEO_EXYNOS_MFC for the Samsung
> > >> Exynos MFC driver that supports firmware version=E2=80=AF13 and late=
r.
> > >> Extend the top=E2=80=91level Samsung platform Kconfig to disable the=
 legacy
> > >> S5P=E2=80=91MFC driver when its firmware version is >=E2=80=AFv12 an=
d to select the
> > >> new Exynos=E2=80=91MFC driver only when VIDEO_SAMSUNG_S5P_MFC is not=
 enabled.
> > >>
> > >> Add exynos-mfc Kconfig and Makefile for probe functionality and crea=
tion
> > >> of decoder and encoder device files by registering the driver object
> > >> exynos_mfc.o and other relevant source files.
> > >>
> > >> Provide header files mfc_core_ops.h and mfc_rm.h containing core
> > >>    operation prototypes, resource=E2=80=91manager helpers,
> > >>    and core=E2=80=91selection utilities.
> > >>
> > >> Add a configurable option MFC_USE_COREDUMP to enable core=E2=80=91du=
mp
> > >> support for debugging MFC errors.
> > >>
> > >> These changes bring support for newer Exynos=E2=80=91based MFC hardw=
are,
> > >> cleanly separate it from the legacy S5P=E2=80=91MFC driver, and lay =
the
> > >> groundwork for future feature development and debugging.
> > >>
> > > No, NAK. Existing driver is well tested and already used on newest
> > > Exynos SoC, so all this new driver is exactly how you should not work
> > > in upstream. You need to integrate into existing driver.
> > >
> > > Samsung received this review multiple times already.
> >
> > Please don't be so categorical. The MFC hardware evolved quite a bit
> > from the ancient times of S5PV210 SoC, when s5p-mfc driver was designed=
.
> > The feature list of the new hardware hardly matches those and I really
> > don't see the reason for forcing support for so different hardware in a
> > single driver. Sometimes it is easier just to have 2 separate drivers i=
f
> > the common part is just the acronym in the hardware block name...
> >
>
> I know it is easier for Samsung to write new driver, but this should
> answer to - why the maintainers and the community would like to
> maintain two drivers. Sure, make a case why we would like to take this
> code.
>
> The easiest argument here why we wouldn't is: new vendor downstream
> code means replicating all known issues, old coding style, everything
> which we already fixed and changed.

And 15 second look at one of the patches already confirmed this:
replicating downstream issue - undocumented DT ABI not following
current style, code relying on some other downstream drivers. 15
seconds was enough to find it.
