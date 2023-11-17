Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 683857EF260
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 13:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5BD10E752;
	Fri, 17 Nov 2023 12:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027FC10E753;
 Fri, 17 Nov 2023 12:10:10 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-41cda37f697so4132971cf.1; 
 Fri, 17 Nov 2023 04:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700223010; x=1700827810; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVa/xkTnX+o0TolBxebC81ZLWvNl5aLTfGLyraWx7PY=;
 b=UORoE013uI8xUbVmHUo61U3HpR0q0VObtfRnjGVBnSdzitvsMoGHG1oHc2nG6vaBys
 wRqQPt4zBVL3tKMMm/tz3SVnFN2mQKmuZ7go38hZ0llr5dE9InVS0wv9Ou8pBAApbsBr
 Who2/hwcnWCZriB7RjlTz+MraWI5/Woa0C+2b4H8pIjLXe5jeD6JZWbgagV3pzwlespX
 uR9BQ/odjJgHwUjrkt562I6UsiokD8rQrT9bjlcucuov3ss5/F8ZYlmyY8eiFj6b2Za9
 D2Qbz1uHtvHXxOCK4Tolo5TxYR6aXaUH2zoisMug8//Heg5Sp+S+O858Mjp5KnVm9ouu
 sNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700223010; x=1700827810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVa/xkTnX+o0TolBxebC81ZLWvNl5aLTfGLyraWx7PY=;
 b=oybngJBvHNQzGjgmlpy4qckuLLJnbHpfDChhBrCbtJ6f0P7URBJGiKLsA+um6ikPZf
 5jO7pxb8c21bgkMvR7Ti5rRgqFKaT9ZmcDjwedDWlr1qKRcCm9gfKxrr3CkT5xerKJNR
 Zsi+rhUxwsXxTzIZIPoHs59fvXGhuAm8jZlcQEUWLTow6MciX2PJmu1qNyF5LP9n3fcM
 PfTB0C3N5CAkHXpYbkdgxVTQChxvmRiuxzIN8hItGKStBerilMphvLUlM5MRfjZBkTqf
 19ibPy0uKYCFNbdw7bmcHEh6PcexQ2DtkP6OSn9X6WrY0+qN7gH5KUUvOB2xmAVhrd7w
 wYBg==
X-Gm-Message-State: AOJu0YzCMnEqQ7Sf7mww0r1moSrU61T25iGn+GZZj4KzbInDrTJdx8+2
 vaqL6bykZmg9Upbu6ZduVuwDnUDjiswZUs0mqw0=
X-Google-Smtp-Source: AGHT+IGQWdUNxYScc/HdVKMkk9g/NaGEp1SceyCrjV0PWCrQMXOP7v9jiNsVMIVNUupRtR3LRAwJ3IUYvKiACT3Zru4=
X-Received: by 2002:ad4:522b:0:b0:677:f339:f896 with SMTP id
 r11-20020ad4522b000000b00677f339f896mr1795868qvq.6.1700223009882; Fri, 17 Nov
 2023 04:10:09 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsNsDLvZR8RGf9ji5938QreSix89FCpGHju+9in2x6OfDw@mail.gmail.com>
 <CADnq5_ObMvxN4pFAsWU7OM3SAtYCNHKE_fHsLqizGm0p1ubp=w@mail.gmail.com>
 <CABXGCsPXp_pWZcyVQajYSTZKeViRqjfXK2=jmuRXh0yug_OoWQ@mail.gmail.com>
 <CADnq5_ND_aBmsD3X=tx2==EM7VOz4EBwid4hRVZ79mbi6bWq1w@mail.gmail.com>
 <CABXGCsOn2a9vZj_1yET96mum=wjGmer6tHG=XgToS76L9ihdUg@mail.gmail.com>
 <CABXGCsOKs33zOC-X7p5QOVWbSzDnSzuxAyGL-oxFBMVFx10pmQ@mail.gmail.com>
 <CADnq5_Ndk0Z14gnk9=f6nsiQFHU9F3z9Vd2ca8fKsbrmyyTKxw@mail.gmail.com>
In-Reply-To: <CADnq5_Ndk0Z14gnk9=f6nsiQFHU9F3z9Vd2ca8fKsbrmyyTKxw@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 17 Nov 2023 17:09:58 +0500
Message-ID: <CABXGCsOUm3oMJ2mox558=2v7p9O68K=WRysDe5REdMS8d63dFQ@mail.gmail.com>
Subject: Re: 6.7/regression/KASAN: null-ptr-deref in
 amdgpu_ras_reset_error_count+0x2d6
To: Alex Deucher <alexdeucher@gmail.com>
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

On Thu, Nov 16, 2023 at 11:56=E2=80=AFPM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> This patch should address the issue:
> https://patchwork.freedesktop.org/patch/567101/
> If you still see issues, you may also need this series:
> https://patchwork.freedesktop.org/series/126220/
>
> Alex

Thanks.
The first one patch is enough.
Tested-on: 7900XTX, 6900XT and 6800M.
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

--=20
Best Regards,
Mike Gavrilov.
