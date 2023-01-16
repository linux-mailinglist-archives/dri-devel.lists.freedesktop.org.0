Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990966D26A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 00:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B04610E507;
	Mon, 16 Jan 2023 23:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2EF10E16B;
 Mon, 16 Jan 2023 23:00:22 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 i26-20020a9d68da000000b00672301a1664so16916657oto.6; 
 Mon, 16 Jan 2023 15:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z4g7vdb3yta2n/gZl1vU9DSyf5veYF5lzBGEfMsw6P8=;
 b=c0whZrjFkYI4bi8MRQDpeczLGoIl2kgOoAmAe/ZSBaonBprEZhwA1BkUQ0l+xQGEQ5
 1Irk2MHkF1tfVd3vMDfA4igzF9lZrLnEWseONsgHL9QeggacBCGjprjkIMHAfx9mjX5T
 dkUP78zwuiUqDFyLEEWxjZzYhkFYLn3Az8sXAUe1dB8AAPK4k778QmgESu/B4ALmDpAQ
 sBW4PektsfUvX/Q6AmLUYP5R9qtR5wj5o13oP0souNLi1IqIfadENctCMAdHenehz2N6
 GW8j8vc+lYvcMk66qPwHCGV6cjO+6qpqTKmX1i+TQpsHj0pZM/MeGVkKsW6vNlsLxFfD
 2hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z4g7vdb3yta2n/gZl1vU9DSyf5veYF5lzBGEfMsw6P8=;
 b=hTZfFOhFNF9GlWpqey92tYsPxZLSxqAMFB8PX5gGeZK3NMcgqeNILcBbJzYLCOlj5K
 qX9pDDe4sMjj+MXoW3fZz6sLd92GjirggqEFtJ+T9trSBT3J3CmBBedSH3UW2ZOhq5RB
 hHmhjtslsCEyvzS1O65DsT9LkAAbm86dA6hSfXPkm2sTObI78pEIlwo0kblWar9ZFd0U
 0JEoNInZeXPM8wx3XfzRtij72+7AODiOwTjw8ThvF2Byzjkg7gbh7CpUONwv1ZxNn1+d
 Q1rI2KDmYRI6eXfljsPxfjDvpW1u1dXIAH109ahz5DyxIl2ecudrbPhDgo9pG1/mLkmP
 B5RA==
X-Gm-Message-State: AFqh2kqfZ2WpH4tHWcy5CrQFrHmMND412LS2RLKlYW2c+bqJxqK+JwJz
 ETy5nzypV5SyHMMaNTGOo1TFOGZLc7FLbNdp7EEVy7++
X-Google-Smtp-Source: AMrXdXvcAq81zvU7uCNCPPlOx0qhhdwJOibOjkrF49LzZpgIlVF5cVKb/wMcAHoAoiAQZmNj5+fKCsPQRTG1tUHGRCQ=
X-Received: by 2002:a05:6830:449:b0:684:bedc:4f54 with SMTP id
 d9-20020a056830044900b00684bedc4f54mr42456otc.233.1673910020428; Mon, 16 Jan
 2023 15:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-3-gpiccoli@igalia.com>
 <CADnq5_Oh5Vdygo12evQKxw3w-ipRoQMvSNFHGcKtBNbSmtW7GQ@mail.gmail.com>
 <DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19@DM8PR12MB5399.namprd12.prod.outlook.com>
 <b8a7253e-6902-e143-1bf2-ff107f25fd2b@igalia.com>
In-Reply-To: <b8a7253e-6902-e143-1bf2-ff107f25fd2b@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 18:00:08 -0500
Message-ID: <CADnq5_NJ7Kjoi7d+8bL2KNY3Leg8Jy7QL5reDS_dyEt7MUB0wA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force (en/dis)abling
 indirect SRAM mode
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang,
 Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 5:34 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> On 16/01/2023 19:27, Liu, Leo wrote:
> > Secure part requires PSP load VCN boot sequence which is with indirect
> > sram mode.
> >
> > Regards,
> > Leo
>
> With that said, and with the plans of just setting the indirect sram
> mode nevertheless (with no switch/cases anymore - I'll submit the V2
> tomorrow if everybody agrees), does anybody oppose to have this
> parameter for debug reasons?

It's not clear to me when this would be used.  We only disable it
briefly during new asic bring up, after that we never touch it again.
No end user on production hardware should ever have to change it and
doing so would break VCN on their system.

Alex

>
> I first considered doing through debugfs, but obviously was a (very) bad
> idea, since this should be an early boot tuning heheh
>
> Cheers,
>
>
> Guilherme
