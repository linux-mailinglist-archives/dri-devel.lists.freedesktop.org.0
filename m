Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B3B7EE70C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 19:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D91610E66B;
	Thu, 16 Nov 2023 18:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D7A10E669;
 Thu, 16 Nov 2023 18:56:28 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3b2e73a17a0so687341b6e.3; 
 Thu, 16 Nov 2023 10:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700160987; x=1700765787; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mfl7Uje3tFYF1t/Z0iO7j2ft62sWmma7geyA5tMKm+Q=;
 b=XxiL5mACWB0/W1cdX9lDEX3Ry8eSVDdFpwjJTsQsRmYGcsb3ycBMsHo+9olmTzKSjB
 bV75urRs9NUCIldobNSinVmHy+CFL1WkNtv7mrxv2x+lZPAaaqb/hOV+/qT51L4T9zDM
 cyD7lFdDdJdTurbJcdaojRVOExw+EGLxxujh5YbpYHGiwskVYxKqCmUEFgDioi9LIrYS
 sDr+8Ho++0Rw2Ex+lPzI9r4G8UPdj0zN1ahvdWf+gqS710ke+EvjNbCcx09AfvuAD6M5
 5SBrEizXvHtWLW0LE08X0wcMT7loQGu5X4ztZiIJz828QgUfoaMEJ8TKd1d87n93z21I
 MVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700160987; x=1700765787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mfl7Uje3tFYF1t/Z0iO7j2ft62sWmma7geyA5tMKm+Q=;
 b=fo9wt/OOOlD9A/RnP7WSqEZX08sKIz0oyNn3Xu7K7cUsp1ULIGrPjPaPwqv/dbWANj
 uQcZ9VIvWFymeEapbOPzhfNzK8v4/4hUVygpwLnN+gf2aduJHDrX2+MLg7Ue4O4jOoiO
 thQxP4R1tsH9f4Z9h9GborE4kgoTUM9u771CWIyhO9MXfnPXWEuwZNL21h7S9uvxsGIh
 qnXmPTSxU6SgSS4VFXUwO+dcN1fHRkSQW5MRG9ZJXF6hXysVJ+LXv8eeYjPxt6s+5HRx
 yW3rRMlwp2haHNblfZZH9ifW89gxB92Zgr0vO1Tnt5is1vHl0NGRh+jupEuEscbMzWf1
 ozsA==
X-Gm-Message-State: AOJu0YwMGf7cZP2FzpEx2VDKL7Jczuf6PYWj495Bs29CJ9yN5nifRRNQ
 jF4XON50tzIQE5ImjDexIbLzbwADUpH0AbPxT5g=
X-Google-Smtp-Source: AGHT+IHCyvXgVJb/dXO1JI3dVNFjLVgyT6C3jPYtogIsMwQHwJ320YLStLK7w8M+mFJb8NeQCY67F77NmvAqaEZRIr4=
X-Received: by 2002:a05:6870:3c09:b0:1ea:406:4dff with SMTP id
 gk9-20020a0568703c0900b001ea04064dffmr21289052oab.50.1700160987524; Thu, 16
 Nov 2023 10:56:27 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsNsDLvZR8RGf9ji5938QreSix89FCpGHju+9in2x6OfDw@mail.gmail.com>
 <CADnq5_ObMvxN4pFAsWU7OM3SAtYCNHKE_fHsLqizGm0p1ubp=w@mail.gmail.com>
 <CABXGCsPXp_pWZcyVQajYSTZKeViRqjfXK2=jmuRXh0yug_OoWQ@mail.gmail.com>
 <CADnq5_ND_aBmsD3X=tx2==EM7VOz4EBwid4hRVZ79mbi6bWq1w@mail.gmail.com>
 <CABXGCsOn2a9vZj_1yET96mum=wjGmer6tHG=XgToS76L9ihdUg@mail.gmail.com>
 <CABXGCsOKs33zOC-X7p5QOVWbSzDnSzuxAyGL-oxFBMVFx10pmQ@mail.gmail.com>
In-Reply-To: <CABXGCsOKs33zOC-X7p5QOVWbSzDnSzuxAyGL-oxFBMVFx10pmQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 13:56:16 -0500
Message-ID: <CADnq5_Ndk0Z14gnk9=f6nsiQFHU9F3z9Vd2ca8fKsbrmyyTKxw@mail.gmail.com>
Subject: Re: 6.7/regression/KASAN: null-ptr-deref in
 amdgpu_ras_reset_error_count+0x2d6
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 1:14=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> On Wed, Nov 8, 2023 at 4:24=E2=80=AFAM Mikhail Gavrilov
> <mikhail.v.gavrilov@gmail.com> wrote:
> >
> > Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> > Thanks, after applying the patch GPU loading meets expectations.
> > Games are working so overall all looking good for now.
> >
>
> Unfortunately I didn't check this patch on 7900XTX.
> And now I see that this patch leads the systems with 7900XTX GPU to a
> lot of protection fault messages in the kernel log.
>
> [   75.211702] gmc_v11_0_process_interrupt: 164 callbacks suppressed
> [   75.211706] amdgpu 0000:03:00.0: amdgpu: [gfxhub] page fault
> (src_id:0 ring:169 vmid:0 pasid:0, for process  pid 0 thread  pid 0)
> [   75.211715] amdgpu 0000:03:00.0: amdgpu:   in page starting at
> address 0x00008087fe5fd000 from client 10
> [   75.211718] amdgpu 0000:03:00.0: amdgpu:
> GCVM_L2_PROTECTION_FAULT_STATUS:0x00041D53
> [   75.211720] amdgpu 0000:03:00.0: amdgpu: Faulty UTCL2 client ID: SDMA1=
 (0xe)
> [   75.211723] amdgpu 0000:03:00.0: amdgpu: MORE_FAULTS: 0x1
> [   75.211725] amdgpu 0000:03:00.0: amdgpu: WALKER_ERROR: 0x1
> [   75.211727] amdgpu 0000:03:00.0: amdgpu: PERMISSION_FAULTS: 0x5
> [   75.211729] amdgpu 0000:03:00.0: amdgpu: MAPPING_ERROR: 0x1
> [   75.211732] amdgpu 0000:03:00.0: amdgpu: RW: 0x1
> [   75.211740] amdgpu 0000:03:00.0: amdgpu: [gfxhub] page fault
> (src_id:0 ring:169 vmid:0 pasid:0, for process  pid 0 thread  pid 0)
> [   75.211743] amdgpu 0000:03:00.0: amdgpu:   in page starting at
> address 0x00008087bffff000 from client 10
> [   75.211746] amdgpu 0000:03:00.0: amdgpu:
> GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
> [   75.211748] amdgpu 0000:03:00.0: amdgpu: Faulty UTCL2 client ID: CB/DB=
 (0x0)
> [   75.211750] amdgpu 0000:03:00.0: amdgpu: MORE_FAULTS: 0x0
> [   75.211752] amdgpu 0000:03:00.0: amdgpu: WALKER_ERROR: 0x0
> [   75.211754] amdgpu 0000:03:00.0: amdgpu: PERMISSION_FAULTS: 0x0
> [   75.211756] amdgpu 0000:03:00.0: amdgpu: MAPPING_ERROR: 0x0
> [   75.211758] amdgpu 0000:03:00.0: amdgpu: RW: 0x0
> [   75.212337] amdgpu 0000:03:00.0: amdgpu: [gfxhub] page fault
> (src_id:0 ring:169 vmid:0 pasid:0, for process  pid 0 thread  pid 0)
> [   75.212344] amdgpu 0000:03:00.0: amdgpu:   in page starting at
> address 0x00008087fe5fd000 from client 10
> [   75.212348] amdgpu 0000:03:00.0: amdgpu:
> GCVM_L2_PROTECTION_FAULT_STATUS:0x00041B52
> [   75.212352] amdgpu 0000:03:00.0: amdgpu: Faulty UTCL2 client ID: SDMA0=
 (0xd)
> [   75.212356] amdgpu 0000:03:00.0: amdgpu: MORE_FAULTS: 0x0
> [   75.212359] amdgpu 0000:03:00.0: amdgpu: WALKER_ERROR: 0x1
> [   75.212363] amdgpu 0000:03:00.0: amdgpu: PERMISSION_FAULTS: 0x5
> [   75.212367] amdgpu 0000:03:00.0: amdgpu: MAPPING_ERROR: 0x1
> [   75.212370] amdgpu 0000:03:00.0: amdgpu: RW: 0x1
>
> The full kernel log attached below.

This patch should address the issue:
https://patchwork.freedesktop.org/patch/567101/
If you still see issues, you may also need this series:
https://patchwork.freedesktop.org/series/126220/

Alex
