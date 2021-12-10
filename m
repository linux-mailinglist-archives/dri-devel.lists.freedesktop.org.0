Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883AE470286
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 15:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AFC10E3A6;
	Fri, 10 Dec 2021 14:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127C410E3D9;
 Fri, 10 Dec 2021 14:16:42 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso9773319otj.1; 
 Fri, 10 Dec 2021 06:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EOSoarCCbZM7dlcjmgAvZBd2Ge5y+aGOq0kCRiTe4tw=;
 b=lsFSompV1OCJP8n00tqcmPhSB4U7IEQ6pnwkl8mM6i6SPt5ZGXNzqYRzrPCP5ycozH
 Lc3LBns3JreH4ulGaPEkT0EvnFOmNL1PcYb0Qw+uUvtessMSUOo98/sZ/GLwK8Gt54VH
 A1uDTNRyt4uJ9V17abTvznDzwv6cXKkwpOOtBGseHvco62o5nH5qrvscNezxp31rzhLW
 XSI2SOU7HaIxeJs/iVe+prYJRREV0R/BLvqXBg14JIr8UtOAFmNTWCeukrXynVoTExe+
 HWbjByukta9YKjkT+O5Ei/60PnnNLqkikjpNVlrxuUuduCHmGGxBAazDgtSIKxGB9eTR
 oC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EOSoarCCbZM7dlcjmgAvZBd2Ge5y+aGOq0kCRiTe4tw=;
 b=JM+G0hrkhW2W7/pPm3ne0HeTwZfcR+BngIhoB6J7zKfEvXF1+q66E1S2P8tNEXU+25
 2+qFTVigoJeEF31oVVS8jsk5vxNW73JwZeQL+RblRItP2a+Xe4J/rDaxc8XycKJg4Z4R
 mXqbm8zi+Ek76Z1EA1zx55TJi9MX0aKcDxddQZfwwn9lB9kyIwY6LVE3WTDi/iUROR0P
 7EIw5m7inf/L52dABBfLRKfsoqOLFSjBHHXxODwOhIdm+jIy4peH85u7jCm501rSmM9s
 H0ImF0JGKdnFDpbe99DQYDocrDTZmm3Hresjn2N7KElEtUqyQE3LOWTrrPrhnw9tMXPh
 5yIw==
X-Gm-Message-State: AOAM5327s8iATk6xurxBUi8d6v9nHFV0v6jnnJt/QF7qpW1vg5GaJT48
 OzS9TvcgYrZ1zPmJAfEGm5M40/Hk18OAX2u1QzFi5pqf
X-Google-Smtp-Source: ABdhPJzxEixHNY/ukDs1bIqZdHB/bSDP4VRdSeRVaKe8t7pjUL4W1JYcWPxk99li/psv45WFTLJCZZdgC34P0aaSQV4=
X-Received: by 2002:a05:6830:1bcf:: with SMTP id
 v15mr11608187ota.200.1639145801225; 
 Fri, 10 Dec 2021 06:16:41 -0800 (PST)
MIME-Version: 1.0
References: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
 <CADnq5_O8x3_8f7GZ=tme55-QW+nqMJ2YoqvROjDPg2YZP2catQ@mail.gmail.com>
 <a1f4d263-b3d2-4ceb-8a89-948c8129500f@igalia.com>
 <CADnq5_N9ptK4c86LO77YcrF5_M==hket+L7eYjsGCaKbORO=ug@mail.gmail.com>
 <eaea0143-a961-b83c-3c6c-4d612cd003bc@igalia.com>
 <6d3c7acf-a23f-3073-56ed-375ccb8cc815@suse.de>
 <99b38881-8c63-de04-50f8-aa4119b52b25@igalia.com>
In-Reply-To: <99b38881-8c63-de04-50f8-aa4119b52b25@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Dec 2021 09:16:30 -0500
Message-ID: <CADnq5_NqPEY6vPSsBQSst5Gsw-VpJ-sp-5DHMeB+EGA2t7KoAQ@mail.gmail.com>
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 xinhui pan <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Baoquan He <bhe@redhat.com>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=C3=A1lvez?= <siglesias@igalia.com>,
 kernel@gpiccoli.net, kexec@lists.infradead.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, pjones@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Dave Young <dyoung@redhat.com>, Christian Koenig <christian.koenig@amd.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 9:09 AM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> Thanks a lot Alex / Gerd and Thomas, very informative stuff! I'm glad
> there are projects to collect/save the data and reuse after a kdump,
> this is very useful.
>
> I'll continue my study on the atombios thing of AMD and QXL, maybe at
> least we can make it work in qemu, that'd be great (like a small
> initdriver to reprogram de paravirtual device on kexec boot).

Why not just reload the driver after kexec?

Alex


>
> Cheers,
>
>
> Guilherme
