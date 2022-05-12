Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF38524E9F
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 15:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EAB10E8C1;
	Thu, 12 May 2022 13:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9973F10E7B3;
 Thu, 12 May 2022 13:47:41 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-ed9a75c453so6642282fac.11; 
 Thu, 12 May 2022 06:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lAKLw82Wxg+eOurBghu8fJNyA1GqYs5wj0gY1XCz7Ro=;
 b=m/GTkuGjI1B5jx6nL5P/4EflzdI3QMBGmNFCquv0Dxr0fCYznNF6rzRzEHPTPKHxXC
 DXkAKLOzNRwhfxSdESZFpIRvG+4ceQQN+sJ5+0VpUfTCScU4gdBJ9VySZxgLIceicUds
 Ul+KyFqAPUGMw/oPmRPKxvrhebfFVHvbJF+yf079NmUheQb5udeUeydhsXZbaHMmno/M
 tnPkY9nJec+JaKIn08CcOWzb7djbqDDajDyMz/aUcIC+q5F/D4P1UtsbQeBaR5gM8q3D
 eU1114Kx4jWdj/jaaqyOGLuTD+X0YmsNDvim0dLXzohhh4FKhdxtFfSkSxthfQj4E1GD
 89Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lAKLw82Wxg+eOurBghu8fJNyA1GqYs5wj0gY1XCz7Ro=;
 b=W2CUUgK7pFPiIfM+ZTqIYYldEvrQY0ns+jAA76o51/l2qaXZmmkuHSgjR7VcEXujYh
 6+ytN3v12NWrgISvKZpQ7CLEQrPqXEQMwnt1O7Ss4s6f34Z6eFqa5ZGzynou0OTdUohu
 HCUoLLGFpcpMkGZgLvlV+nc8pOtJaPitV2aWjOMl+p67h55BNXgGCXVscs9j5DSBpgD8
 Qroa+xw64XbwfEyK2SBR7svzAZDAB7zztWDNjo8Py0j7bUJ181H1neyAaP5I01vY1A5I
 FJbiBwT9l0XNm/9cLPqpDW7HTzGRdj61u6syMvAPDeZNAK0ob7y8kBg2YWjylcvqoVM8
 2e3Q==
X-Gm-Message-State: AOAM5311s7AUx/AEdBK+Pep3xc0L6pS3yM68Niv8UXfywE2Y9fOkgMOk
 PE62oOgj47w1EzY5QzL+vPlLDOyvGwAeTBFTUaY=
X-Google-Smtp-Source: ABdhPJz3l54A1RhbIxHH695Vm5HWA0Vfm/tkaukXHol2A8LN/cits8d9LpM4S5YTojnhgCH97a8Hlo69iiYpmwq9/30=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr5725345oap.253.1652363260913; Thu, 12
 May 2022 06:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <YnTAc96Uv0CXcGhD@suse.de>
 <CADnq5_NT3UtawpGuPDwF+dgmRdaoysb7sD_-oWWBC=T3BoUH7Q@mail.gmail.com>
 <YnpIjdTT3esZ72Bf@suse.de>
 <CADnq5_NYVvjcUru9hfbnATfcHJR5+eiK9bJAA9m41WKa=OJsog@mail.gmail.com>
 <505081FC-4323-4424-87A9-89B95A89515D@suse.de>
 <CADnq5_PoWLHydAGqHXKNwBnnc_Uz7xc01Mmp2ri-h+RtnRqgfQ@mail.gmail.com>
 <YnzG1KE9tasxdUbX@suse.de>
In-Reply-To: <YnzG1KE9tasxdUbX@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 May 2022 09:47:29 -0400
Message-ID: <CADnq5_OyfTZ1ma_9rc9ePqhRUqcuNbdCPh7eAYUC7zdX+ZOuyA@mail.gmail.com>
Subject: Re: [BUG] Warning and NULL-ptr dereference in amdgpu driver with 5.18
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 12, 2022 at 4:35 AM J=C3=B6rg R=C3=B6del <jroedel@suse.de> wrot=
e:
>
> On Tue, May 10, 2022 at 04:41:57PM -0400, Alex Deucher wrote:
> > Does setting amdgpu.runpm=3D0 on the kernel command line in grub help?
> > If so, that should fixed with:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Df95af4a9236695caed24fe6401256bb974e8f2a7
>
> Unfortunatly, no, this option doesn't help. Tested with v5.18-rc6, full
> dmesg attached.
>
> Any idea what the BadTLP messages migh be caused by?

Are those new?  Maybe the card is not seated correctly?  Can you try
another slot?

As for the null pointer defer in the display code, @Wentland, Harry
any ideas?  I don't see why that should happen.  Maybe some hotplug
pin is faulty or the display has input detection and that is causing
some sort of hotplug interrupt that causes a race somewhere in the
driver?  Can you make sure the monitor connector is firmly seated on
the GPU?

Alex


>
> Regards,
>
>         Joerg
>
> --
> J=C3=B6rg R=C3=B6del
> jroedel@suse.de
>
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5
> 90409 N=C3=BCrnberg
> Germany
>
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
>
