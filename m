Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 214C428F94F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 21:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA4D89202;
	Thu, 15 Oct 2020 19:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A13489202
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 19:13:52 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id dt13so5156675ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 12:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XpNta3oGXOGMfw8lC8Ia8pIVoil33uOCCB/uiUIy1Ys=;
 b=nqtzQCD4UJ5TOOSNwTeAs18WkAHE9maC+RCNSoZ+tJjBTp3MGukv9rYj6uVO/w6hHl
 NL7UQGN3gKEtH0cVGN1rFfFQsayrZTyxSIcPBQC28ot902mb8iq+tSdC+bh21fCQxFo5
 8m+/7U/G5Ma1oEhQDsq3AuzTPhawD4Dt56XQKl3O+8fWunhBQN/4wEsa9twMNsL0cwSy
 ugCOlj2jgfN9f1YWDCMVahlaqvk49ZqsuL2yG/rlanqbE/ABH79jnuZMing7xDVZIhy+
 r3OF4/gxitTiZJSTG8p4MhlmsxecXpo+LCQCfU/Bhg7hAD23NuHPl+PTeY0L/6AKFQuc
 9T+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XpNta3oGXOGMfw8lC8Ia8pIVoil33uOCCB/uiUIy1Ys=;
 b=ueIBMGK8zB7VlNE6rWxRMSiX6SzqnuWy0Ob1VvQscfZxcvxDeWSWoRb5nf1kM7Bbjm
 sngsquushvmXm6+HKmukqwlp41+nhYHwQ3JxK3iHR3swt44NWCwp2CrQvMHSxxhGnNdK
 SPA+jWKMdBYGawwbQaogMEL/MRvRDiG4JE+4mdBDgwun6Spxtq2Qi3r2Io/EiWj1AJeV
 EnmYWnoBf0gXCvi1IkJr6y/ZY6liMG+eAyBCPuTsALOXuS5SAIyzOSBA1ue8Zrjs+4hP
 LoB3EoOSq0Nj0DxXkNsbFW3NnLdE1xvPKl0I1Y5UyGMM7tQ1fD2ESsm5yrcUB8f1UsYo
 dzRA==
X-Gm-Message-State: AOAM530FULefTMS9szfHmI8ihxfdPrVpje+erzDyRkx+6MOo8mj1aJnF
 BmsRXwiRnM8Vm6P8gj+1x47au/UUXPjiUkU1lck=
X-Google-Smtp-Source: ABdhPJwMRHN2r+nEbe4Pcq5RIxrw+0qxNWTP6glIsrkOwjYteM0Gts+BCIAEOoZaHkKKxz5QFXbfG9nWrRaWavW+qWE=
X-Received: by 2002:a17:906:2b83:: with SMTP id
 m3mr6007641ejg.456.1602789230712; 
 Thu, 15 Oct 2020 12:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
 <CAHk-=wiP+S4K3yU+FqgGmF+EgcSgk04Eerf3gE-6qObicy346w@mail.gmail.com>
 <CAHk-=wgYNzhoYuUBsBcFq1TFA5C+Bie-2uzZkF2McO9joXxW0A@mail.gmail.com>
In-Reply-To: <CAHk-=wgYNzhoYuUBsBcFq1TFA5C+Bie-2uzZkF2McO9joXxW0A@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 16 Oct 2020 05:13:38 +1000
Message-ID: <CAPM=9tzwRb13Umsgq+aqo2ZDqjEc9578tS7_ydxkYPYArmSong@mail.gmail.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Eryk Brol <eryk.brol@amd.com>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Oct 2020 at 04:42, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Oct 15, 2020 at 10:51 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Thanks, looks good to me [..]
>
> Uhhuh. I already pushed things out, but my clang build (which I don't
> do between each merge) shows a problem:
>
>   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:650:8:
>   warning: logical not is only applied to the left hand side of this
> comparison [-Wlogical-not-parentheses]
>                 && !params[i].clock_force_enable == DSC_CLK_FORCE_DEFAULT) {
>                    ^                             ~~
>
> and I think clang is entirely right to complain about that code.
>
> Yes, the code may be correct, but even if it's correct, that's a
> really odd way to write things.
>
> Anyway, what it does is:
>
>    !params[i].clock_force_enable
>
> turns 0 into 1, and anything that isn't 0 into 0.
>
> And DSC_CLK_FORCE_DEFAULT has a value of 0, so what that line actually means is
>
>   (params[i].clock_force_enable == 0) == 0
>
> which obviously is
>
>   params[i].clock_force_enable != 0
>
> which in this case is the same as
>
>   params[i].clock_force_enable != DSC_CLK_FORCE_DEFAULT
>
> which may be what the code actually meant to do.
>
> So I suspect it does what it meant to do, but only because
> DSC_CLK_FORCE_DEFAULT also happens to be 0, which also acts as a
> boolean 'false'.
>
> But it's also possible that the '!' is a left-over, and the code
> actually _meant_ to do the exact reverse of that. I have no idea.
>
> This odd code was introduced by commit 0749ddeb7d6c ("drm/amd/display:
> Add DSC force disable to dsc_clock_en debugfs entry"), and can we
> please agree to not write this kind of obfuscated C code?

I've asked Alex to direct send you any fix for you to apply once he's
had a chance to validate it,

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
