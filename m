Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7189E0473
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0D310E742;
	Mon,  2 Dec 2024 14:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C8eoKQp9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0AC10E742
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 14:11:02 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-725079e1499so251538b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 06:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733148661; x=1733753461; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhG3GF72Fq8o/jk0lOvSw1REGfU3YheRFY4zkgPERm4=;
 b=C8eoKQp9b9vnoMCgq4R5HHMLzszAaIvGL2NLOyPikyNoCRrLv3j1nxGmjXreiNo/4+
 cnLkXMeGKPv6MoJf1BnJCkRManjXmbQFIHZvPDC0pUJQrNrznkMwXhP2m9gtM5vt/TdU
 vngUfeT+Z0PWKLJmLg+UpSVfrIEKonKK9R8RB8Prl+Aab/ia42OsJzYZ1JSEd9rHOoZl
 VkZ/6bgAoIMoAoUNFBs3H3Bl0ixzUDnqDT2O4GvaRXXutSqtTyqt4QXLaX3jzIu6E2QT
 S/M4iZyDYnZmoRMpSlVFmQQgmCzDut6ZyMo1ejw2YMGsmNalBj65umXzhpYaPKpcQrnB
 JD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733148661; x=1733753461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZhG3GF72Fq8o/jk0lOvSw1REGfU3YheRFY4zkgPERm4=;
 b=sBAi8u1LIiqCGV98FQngixKeLROnyvEukcXi85HpQ9Om4jaGHnellKS6VlWZLjnbCr
 Fm071SBL8G5OJbZPrC1fwJJqz3QLnO7Y4U3zZ5GBMwS/em3UEaqooaUULpRAKM3G9Jnh
 LYyKR+aLJ9Q33g5PnNIehT1n98bVrVD1oR4c0xPEbXGyXae6FLA4/p649Qu/iEtJIi1U
 nCNy6uylLaoVaBhajHyFqeQt3MB7LvUrH5n/FFYx+Io+O4OyeEB4T3qrlFSgw9NVOFCo
 kyES1KTBFErMVeMHsziRL5iuRVQjxHW/ytgEslsoL3IX1IRDoqA7N2Jth6cWQ1ov9FRu
 pNng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcWG2zerKsuVmewZHWGsmixNIif3m4G+p85gndEFBqpMWWmH9A+vHooepv/hK/J6cJAa76/Bf245Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeOJiinc4y2qrDZlDRDcrBRGQIPIGD7TAiL1aHbL6dCuqcr0QH
 8UTPIsx//nBaYtzl27wGrgEiFDkQkWibRnlEIxve258sK0E7wVIF2xjPUbExCFEq6SiwHu9tlEe
 XTUDhLvW2iz/83QnRuhsQggI96cE=
X-Gm-Gg: ASbGnctuarR7w27nTpbVRFuI99M+KS6ERD9ruSi7fECMl2zdd20gYPLh73fSJZd37Fx
 jEfbx5KXNVOLk+AxZjH1NGStI91bPX3c=
X-Google-Smtp-Source: AGHT+IE16Z2x8BUgyY0P0StFngdqghpu4YG8qMPby96pkRXX+IYaBbPuSlm8Dx+FaTprGRT0KdZqOS+NHsz7SjNozoQ=
X-Received: by 2002:a05:6a00:26f5:b0:725:322a:9229 with SMTP id
 d2e1a72fcca58-725322a930cmr12270990b3a.2.1733148661430; Mon, 02 Dec 2024
 06:11:01 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tzpFOhQN3yCb4+OpLsfYVrq4mLuUS+SP=H=gq=qSLDz7g@mail.gmail.com>
 <CAHk-=wh74-reWGqpP+i3O8usrS1Jr12UGGMCfaK58_0aK5Lw_Q@mail.gmail.com>
In-Reply-To: <CAHk-=wh74-reWGqpP+i3O8usrS1Jr12UGGMCfaK58_0aK5Lw_Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Dec 2024 09:10:50 -0500
Message-ID: <CADnq5_PBLv4EDAPY23B6QztH6bnbht8Nzy9dd+=T4_dH4RwS_g@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.13-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Sasha Levin <sashal@kernel.org>, Sima Vetter <sima@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Fri, Nov 29, 2024 at 4:57=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, 28 Nov 2024 at 12:42, Dave Airlie <airlied@gmail.com> wrote:
> >
> > Merge window fixes, mostly amdgpu and xe, with a few other minor ones,
> > all looks fairly normal,
>
> Hmm. I've pulled this, but do note the report by Sasha.
>
> The
>
>         if (WARN_ON(!work->func))
>                 return false;
>
> from __flush_work() looks odd, and is fairly obviously triggered by
> this one liner in commit 93df74873703 ("drm/amdgpu/jpeg: cancel the
> jpeg worker")
>
> -       bool set_clocks =3D !cancel_delayed_work_sync(&adev->vcn.idle_wor=
k);
> +       bool set_clocks =3D !cancel_delayed_work_sync(&adev->jpeg.idle_wo=
rk);
>
> where apparently the jpeg.idle_work isn't initialized at that point.
>
> It looks like the initialization is done by amdgpu_jpeg_sw_init(), and
> it looks like that cancel_delayed_work_sync() is just done too early.
> But I don't know the code. Alex?

Already fixed with this patch:
https://patchwork.freedesktop.org/patch/625940/
Will be in my fixes PR this week.

Alex


>
> The other report by Sasha seems to be a 32-bit issue, where something
> calls roundup_pow_of_two() on a thing that would round up past the
> 32-bit limit. Presumably it works on 64-bit.
>
> But I'm not seeing anything that looks like a likely *cause* of the new w=
arning.
>
> There's a couple possible cases, although this one looks suspicious:
>
>         adev->vm_manager.max_pfn =3D (uint64_t)vm_size << 18;
>
>         tmp =3D roundup_pow_of_two(adev->vm_manager.max_pfn);
>
> because it explicitly uses 64-bit types for that max_pfn thing, but
> then does that roundup_pow_of_two() that only works on "unsigned
> long".
>
> Sasha - it would help if your warning stack dumps had line numbers
> (using decode_stacktrace.sh, which you should be familiar with, since
> you wrote it...)
>
> I realize that requires some debug info, which might slow down builds
> etc, but it would be really nice.
>
>           Linus
