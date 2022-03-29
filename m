Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CBD4EAF4C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 16:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983C610E8CB;
	Tue, 29 Mar 2022 14:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DA610E8CB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 14:34:45 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 o20-20020a9d7194000000b005cb20cf4f1bso12869062otj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 07:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wMvmEyLab5Hwgmcc+Z+3zfyYKytRujbovXgUe7Inh00=;
 b=Dqsouoiu2emw/4nz4WC+N8SKQD1v62lPtdRIXrSzWKWL11Dq3ZlsARKok4IjOVScu7
 vG/1Lf21jZrSxALMOwm5n4QThic2lj2rzLZy44UJcDVLMMW/SNXIwq1bEEIfWKmcShT0
 +4N5vyvNN6It6Zp2fns+J0G1Mj21a0QWIoodOJxv5xvjrovD1irmMMjGaNLB5TjJFplP
 MTRYFOroVdmUPesqMGwFPgOobbanD3LuJ8DVmvGro3ZKRovtDmoFiKmyqwMxz8bsOd3u
 W0kbnTSUY8Fhka4+P0qtxstVJbZJd6u9Xwqw46RU6HtdGejRZRDVCwYz0tI8eyR6psah
 Hg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wMvmEyLab5Hwgmcc+Z+3zfyYKytRujbovXgUe7Inh00=;
 b=e9jMIDjT1A07vy3WNXlJQ2tzv3zKxIfcta/Z2PUZIRlY97crmdEmrD7WgUr+sYyvDM
 WvVq0Nap0rfp/sD55B98aFxn8lQqGpVVPIX1JaH8zwXsolh8S5EsJ0h+VTX88Ntw/Dv4
 9njnf5N+YN0AoDL+wSeiVJghtImMx9ND2JplpZ7riDbjj70aNYWysjbcRWAXU7uiswTU
 WBFt95rdQ5vNgEEZhWA0mjn+dXe1JpgbcZONHgskikQ0YemArC3nyoh84sayMOVPVdJ9
 nF/D22Zu5j1kcGo4SD2j8edse3VrAIF6KTG89Bj+DSZDIEEbfids5f5dsVqZGROZ8H57
 332w==
X-Gm-Message-State: AOAM53376IotyZ+Sm8xMcXm3/hNO+MFEiz6AMWNi34ky5Q1EE1cPw8Zf
 9ce2R6p5cRcXa0mvpMRS+pBR4Kz4g82lnd7J87s=
X-Google-Smtp-Source: ABdhPJx/1DSFqFqGJ8uQyChN4+4VB8++WxHyhW6Nzzmt36HiCWujISZXRpSyhE345ig1DDmxdda4OMLSlWwW5r5Qw4o=
X-Received: by 2002:a9d:4702:0:b0:5cd:481a:148a with SMTP id
 a2-20020a9d4702000000b005cd481a148amr1239212otf.200.1648564484511; Tue, 29
 Mar 2022 07:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tytg5jd_i3z3C5Y1dii2-cgO11Gjgvaq8qoWn3CGfCreg@mail.gmail.com>
 <CAHk-=wibHWd_E7_YFxc8=RH9b0iL0VunosCkt=L6PcqcDbD+qg@mail.gmail.com>
In-Reply-To: <CAHk-=wibHWd_E7_YFxc8=RH9b0iL0VunosCkt=L6PcqcDbD+qg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Mar 2022 10:34:33 -0400
Message-ID: <CADnq5_Nk5qsqUnA+dmdOBpH_Lu9Jfrv6n_vBRkNSxQJ=qjoh+g@mail.gmail.com>
Subject: Re: amdgpu link problem (was Re: [git pull] drm for 5.18-rc1)
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 9:54 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I didn't notice this until now, probably because everything still
> _works_, but I get a new big warning splat at bootup on my main
> workstation these days as of the merge window changes.
>
> The full warning is attached, but it's basically the ASSERT(0) at line 938 in
>
>   drivers/gpu/drm/amd/display/dc/core/dc_link.c
>
> and it looks to have been introduced by commit c282d9512cdd
> ("drm/amd/display: factor out dp detection link training and mst top
> detection").
>
> This is the same old setup I've reported before, with some random
> Radeon card with two monitors attached (PCI ID 1002:67df rev e7,
> subsystem ID 1da2:e353).
>
> I think the card went by the name "Sapphire Pulse RX 580 8GB" in case
> any of that matters, but it's been working fine.
>
> It still works fine, it just has a big ugly boot-time splat.
>
> As mentioned, two 4K monitors attached, both over HDMI.

I think it should be fixed with this patch which is already queued up
in my -fixes PR from last week:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/a572f7055067d95455850fd242d8b54ff5786cac

Alex

>
> If there is any particular info you want, just let me know where/how
> to find it, and I can provide.
>
>                       Linus
