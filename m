Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F0B299808
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 21:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5039C6E116;
	Mon, 26 Oct 2020 20:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941706E116;
 Mon, 26 Oct 2020 20:33:18 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l15so13834718wmi.3;
 Mon, 26 Oct 2020 13:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/O8B5tDsbMKoWPbr5etGrG3WN9TQf/YvulQxtm1JNqc=;
 b=fgGtA4dZkC7fJbJEp77T2zNmJPL+rQzgZ1HlLKVt9cz6ql8n6Ew8NtQxmH48a25heT
 lkDvFDx9tZgelHI68g+i3kcvouujmjmCv6AQVtHFRvt07YjyP2EZmGVBm8Wt56o2cORX
 wRO+5ZqpFhdG6Ac53AX7WPmPeLDNH2bucLyVDtdurw0THcKB7xgZ0qdUjmnAhov8y8E4
 xSEIBjkL944sHXH0benknMyN3QHAffKFDnglOwcPQUYcAr32JBvTBWqT/5UXf0dnsww+
 1f8kFHIKp3KuUV2ogMZyU++YgUpCB4zQs0wa7WvtqQBO+mf3QgBdjrAb2KkzSy3M9uJf
 0QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/O8B5tDsbMKoWPbr5etGrG3WN9TQf/YvulQxtm1JNqc=;
 b=Hju+dArgvQ5w2FbTNo+239I/+aBcHr8Wxf9HgLdg4tA5xnD1ph7LzbdTPJOxVsRpK3
 MDJGktgf2uryODo9f1CmdcxGAqh/COJiNa2pXlaS4jUpHJozxkrNAqZH7MXQv9ud1hxK
 5GebKMDJMREfogpehFVAVlEmL9dPsA3OA2COlZ0mplmph/24Wo5xHoA//k6P0ncKHvCA
 KVuaIlw0tDl+0oolRFLtg5S3ZcbbWU3yxEsqZYXFkuWeLDyOByqfIs4jbiDxpElOUscc
 0pnxadZde/IRK7QexgMNTXJsSI1FnJPZtvJWoLLVGuCVdkG151vTD5Pdcn+fX3WpkZGA
 EzsQ==
X-Gm-Message-State: AOAM532hJtt97Y54KEsHs1qky3+9rDYiK7wqxEAAyQPUuarWoxzECfUq
 +Ql0ppPe+4OfgOrES887ZxPxgqPgXkwReoCe/7iASJut
X-Google-Smtp-Source: ABdhPJwMDiAiLRKHlrvYhOBxCY24XJ9FgKn7gwnrmpvOmcovyvuheNcYl6kswwxOccE6N3E2mp6N1hUoQVyoAadJXtE=
X-Received: by 2002:a05:600c:25a:: with SMTP id
 26mr17442752wmj.39.1603744397278; 
 Mon, 26 Oct 2020 13:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201023074656.11855-1-tiwai@suse.de>
 <1d3e22ef-a301-f557-79ca-33d6520bb64e@amd.com>
 <CADnq5_OY8tRqs-bao9mkKxgcXC=305-_71U=04C5z9HM0+5MuQ@mail.gmail.com>
 <22ab9117-0281-2ff3-8328-d7780e353643@amd.com>
In-Reply-To: <22ab9117-0281-2ff3-8328-d7780e353643@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Oct 2020 16:33:06 -0400
Message-ID: <CADnq5_NVPRpiOj+Cpzh1TM=2J-ym8xbKbxGc_hUL=4_j_MAo6A@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/amd/display: Fix kernel panic by breakpoint
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Oct 26, 2020 at 4:22 PM Kazlauskas, Nicholas
<nicholas.kazlauskas@amd.com> wrote:
>
> Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>
> Looks fine to me. Feel free to apply.
>
> Regards,
> Nicholas Kazlauskas
>
> On 2020-10-26 3:34 p.m., Alex Deucher wrote:
> > Yes, looks good to me as well.  Series is:
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > I'll give the display guys a few more days to look this over, but if
> > there are no objections, I'll apply them.
> >
> > Thanks!
> >
> > Alex
> >
> > On Fri, Oct 23, 2020 at 7:16 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
> >>
> >> On 2020-10-23 03:46, Takashi Iwai wrote:
> >>> Hi,
> >>>
> >>> the amdgpu driver's ASSERT_CRITICAL() macro calls the
> >>> kgdb_breakpoing() even if no debug option is set, and this leads to a
> >>> kernel panic on distro kernels.  The first two patches are the
> >>> oneliner fixes for those, while the last one is the cleanup of those
> >>> debug macros.
> >>
> >> This looks like good work and solid. Hopefully it gets picked up.
> >>
> >> Regards,
> >> Luben
> >>
> >>>
> >>>
> >>> Takashi
> >>>
> >>> ===
> >>>
> >>> Takashi Iwai (3):
> >>>    drm/amd/display: Fix kernel panic by dal_gpio_open() error
> >>>    drm/amd/display: Don't invoke kgdb_breakpoint() unconditionally
> >>>    drm/amd/display: Clean up debug macros
> >>>
> >>>   drivers/gpu/drm/amd/display/Kconfig             |  1 +
> >>>   drivers/gpu/drm/amd/display/dc/gpio/gpio_base.c |  4 +--
> >>>   drivers/gpu/drm/amd/display/dc/os_types.h       | 33 +++++++++----------------
> >>>   3 files changed, 15 insertions(+), 23 deletions(-)
> >>>
> >>
> >> _______________________________________________
> >> amd-gfx mailing list
> >> amd-gfx@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
