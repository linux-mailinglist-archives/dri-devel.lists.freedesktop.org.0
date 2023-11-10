Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C07E7C48
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 13:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C4210E0C2;
	Fri, 10 Nov 2023 12:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDAB10E08C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:53:02 +0000 (UTC)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AA0A24062D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1699620780;
 bh=rQz1XEF+09FV0wYKQEHG4CRIbx1Q7DTh+y5gnO8WcbM=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=wHEDBtfKxP8I4v1PPlFHdc57CXNQ5DLTw0Abf49NrAjma5acjL1es+d0TwvCo1ooJ
 JtJLYUkXAZTSGV+6ZN0MjfNL6mjVsRYxgsqgym7P9ft9i9p1GKZWWljXEi29xuVdiF
 iKZGo2HkB2XwDVSBzJyEbVIL39wR+bNqhis/Krep6/iv4jF0+qd83oNi1IGolHWbNl
 cJQXva9akeoGdCPCotu5jfoOTVcJ5lm/gFAwYsRvBKFvliA1t62rimlyq3Z0pErMGb
 1jcZI9mcySEwsMnZ9nIPbDi7wgyqXBwmpsQ4ybI2FqhntQ50Q3ksiWCHiuZCxbxLto
 Cgf+RsCNQqN4g==
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-5abf640f19aso2160305a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 04:53:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699620779; x=1700225579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQz1XEF+09FV0wYKQEHG4CRIbx1Q7DTh+y5gnO8WcbM=;
 b=Nw6tqZWtzQQ7Rj88bBngewsl9o1Cd+sQ72w8MPjKxSo+ycN+QG+mkFI7eD2pmDnEBB
 0cO3y8//p8yUSjER47kYRp8O+5yuWdbxEyUhtmuk6+FQjqCY5ZvaibrEUAwh1vCu4aoL
 rMq+WkNjFBt/1R3qSM2xvyeljvoLJI/XqvtfCLO+6CjzJ/aLU8U3t0G4PyFXcaBTY4Pz
 Ivsq0k9dpKpG2A9o4l9usi2t+A28MR2mKNeJRzfQRPbFxyXUsNBVZ0LO7ElC/Ew54+q4
 vtXA93vCeJ276euQAC0/5basNE0WoScDwE5MSdSS0Bc7nErA8yAxs+Y1idAuhKlCXqQU
 2hDA==
X-Gm-Message-State: AOJu0YzfeNG3y2Mfx2iX7GR2yO6pEQ+2K90jC+3udIIekjWH6aKM1aub
 lFtEqwKoVk7ncFlE56JDx+KJ031RBuqM8EsuZcr+Y71a27jgJMOjde8KF4VVsR5fFs6qpYGi5w3
 8UQ2Ntinlosbd4gXscthOPcpGoMbyoaeVD72qY1+8ItL7qFSn6DjW+cQtGTP6zw==
X-Received: by 2002:a17:90b:1d03:b0:280:4799:a841 with SMTP id
 on3-20020a17090b1d0300b002804799a841mr4829848pjb.38.1699620779364; 
 Fri, 10 Nov 2023 04:52:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnczUq1VC3lW8Z/p4H5gQI8h4wKRWrRJatMYBw6a+WKwY+ovLUCuSr/qS2Bo2wOsiAR0FM2aGrvUeOcuVrw2E=
X-Received: by 2002:a17:90b:1d03:b0:280:4799:a841 with SMTP id
 on3-20020a17090b1d0300b002804799a841mr4829828pjb.38.1699620779062; Fri, 10
 Nov 2023 04:52:59 -0800 (PST)
MIME-Version: 1.0
References: <9f36fb06-64c4-4264-aaeb-4e1289e764c4@owenh.net>
 <CAAd53p7BSesx=a1igTohoSkxrW+Hq8O7ArONFCK7uoDi12-T4A@mail.gmail.com>
 <a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com>
In-Reply-To: <a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 10 Nov 2023 14:52:45 +0200
Message-ID: <CAAd53p608qmC3pvz=F+y2UZ9O39f2aq-pE-1_He1j8PGQmM=tg@mail.gmail.com>
Subject: Re: [REGRESSION]: acpi/nouveau: Hardware unavailable upon resume or
 suspend fails
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: regressions@lists.linux.dev, Karol Herbst <kherbst@redhat.com>,
 nouveau@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, stable@vger.kernel.org,
 linux-acpi@vger.kernel.org, "Owen T. Heisler" <writer@owenh.net>,
 Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Fri, Nov 10, 2023 at 2:19=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> On 11/10/23 07:09, Kai-Heng Feng wrote:
> > Hi Owen,
> >
> > On Fri, Nov 10, 2023 at 5:55=E2=80=AFAM Owen T. Heisler <writer@owenh.n=
et> wrote:
> >>
> >> #regzbot introduced: 89c290ea758911e660878e26270e084d862c03b0
> >> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/273
> >> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218124
> >
> > Thanks for the bug report. Do you prefer to continue the discussion
> > here, on gitlab or on bugzilla?
>
> Owen, as Kai-Heng said thank you for reporting this.
>
> >> ## Reproducing
> >>
> >> 1. Boot system to framebuffer console.
> >> 2. Run `systemctl suspend`. If undocked without secondary display,
> >> suspend fails. If docked with secondary display, suspend succeeds.
> >> 3. Resume from suspend if applicable.
> >> 4. System is now in a broken state.
> >
> > So I guess we need to put those devices to ACPI D3 for suspend. Let's
> > discuss this on your preferred platform.
>
> Ok, so I was already sort of afraid we might see something like this
> happening because of:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D89c290ea758911e660878e26270e084d862c03b0
>
> As I mentioned during the review of that, it might be better to
> not touch the video-card ACPI power-state at all and instead
> only do acpi_device_fix_up_power() on the child devices.

Or the child devices need to be put to D3 during suspend.

>
> Owen, attached are 2 patches which implement only
> calling acpi_device_fix_up_power() on the child devices,
> can you build a v6.6 kernel with these 2 patches added
> on top please and see if that fixes things ?
>
> Kai-Heng can you test that the issue on the HP ZBook Fury 16 G10
> is still resolved after applying these patches ?

Yes. Thanks for the patch.

If this patch also fixes Owen's issue, then
Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>


>
> Regards,
>
> Hans
>
