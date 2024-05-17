Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C771F8C895D
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 17:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0088C10E2E6;
	Fri, 17 May 2024 15:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GHEoCR+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EC410E2E6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 15:31:36 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-43de92e234dso6442741cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715959896; x=1716564696;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k7megH/H2PCv2+j9G389xKdUzN7SbYmctbozhmOjrak=;
 b=GHEoCR+q0xBXL4qm/k22EsxjJ1Yh+7n0UHuXBBDrPfn6z2IL9snl7LRK4A06DUAU+P
 Nm+y9kTbpu5EbwaC5L/VxbNbFQIYoha8um0Pm0MGZuKIw5YBHWc9C0Wz7e8BnZoAcViR
 bjwotxltOZAhWnpJNvXhLT4UtB3ii7EWU0P4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715959896; x=1716564696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k7megH/H2PCv2+j9G389xKdUzN7SbYmctbozhmOjrak=;
 b=QbmckC3MohU2OoQ2q8vs6W2Ap6CigimojjHAKvZEwX8tOOR4OvHsw/povYNIOd1iQL
 QCnMpSK61R9eAs2pRvXmhrI8tpDxsDs85HVCIu3pSU6qIMeMeNGZTFH6OrzXlqtILKI5
 PXoGktu9vZ1hMe5q0AtaF/TStlz9VSa+yt3w68Nr99NdNC4kbd4tPJ33cEan0M/Ni+0E
 U6yys6IlenRE4LQZFNxQJMRv5/cxH7gmDDw+aLT8CfR4STDuJYYG35GQ7svoqXGC/3rJ
 0xdPhak+0k2BTF++9j0Sf2WKSNEQ6+wGFQoMQAQLst3S0TGxNI5Oh7vP5ECvakBo0btY
 0OTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA1pY25T1WiubIxKSCWChTSk5DaU5QVB8RauMeNsrrHkJ1AaRsRThEFx977xLsuLntrjAKgHVFKy5B1qOvXbz0xBF88XI3+h5Eqpkqk89H
X-Gm-Message-State: AOJu0Yyl5Qx1iZKhegwoU3rTm9IMdDhrPDBtcbys58dftljqjkmSQ0OE
 6t1uFfQofD8igKJaX8z1qdKmokciBBGRQmOixAMKrOnHWViapfXOKkXGUAcTaFL9iE0c7muFZZK
 P6CXTSr8tryV+hRJ1S6kN3sblyUI4Ayl30TNm
X-Google-Smtp-Source: AGHT+IGhcIgFiNUmswLwDNFrEyhlQEYmVuB0KuktpQFJvPdoeuKAcVFmkHhvUvnReCh+DA3a2Vh8QYXmcY74cB7LSJU=
X-Received: by 2002:a05:622a:1109:b0:43a:699e:114c with SMTP id
 d75a77b69052e-43dec39cd25mr388192291cf.31.1715959895750; Fri, 17 May 2024
 08:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240516115721.1.I8d413e641239c059d018d46cc569048b813a5d9b@changeid>
 <9dd1cfd1-fe13-4434-a7cc-e14113dcaf53@amd.com>
In-Reply-To: <9dd1cfd1-fe13-4434-a7cc-e14113dcaf53@amd.com>
From: Tim Van Patten <timvp@chromium.org>
Date: Fri, 17 May 2024 09:31:25 -0600
Message-ID: <CAMaBtwFTBp-oAMLD4BKgrxQrfvWpJ6NbWBpyoLXeaqg8ebLGaQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove GC HW IP 9.3.0 from noretry=1
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, alexander.deucher@amd.com, 
 prathyushi.nangia@amd.com, Tim Van Patten <timvp@google.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Ikshwaku Chauhan <ikshwaku.chauhan@amd.com>, Le Ma <le.ma@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Shaoyun.liu" <Shaoyun.liu@amd.com>, 
 Shiwu Zhang <shiwu.zhang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 chris.kuruts@amd.com
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

On Fri, May 17, 2024 at 12:35=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.05.24 um 19:57 schrieb Tim Van Patten:
> > From: Tim Van Patten <timvp@google.com>
> >
> > The following commit updated gmc->noretry from 0 to 1 for GC HW IP
> > 9.3.0:
> >
> >      commit 5f3854f1f4e2 ("drm/amdgpu: add more cases to noretry=3D1")
> >
> > This causes the device to hang when a page fault occurs, until the
> > device is rebooted. Instead, revert back to gmc->noretry=3D0 so the dev=
ice
> > is still responsive.
>
> Wait a second. Why does the device hang on a page fault? That shouldn't
> happen independent of noretry.

No idea, but hopefully someone within AMD can help answer that.

I'm not an expert in this area, I was just able to bisect to the CL
causing the change in behavior. There are other reports of people
bisecting to the same CL, so this issue appears to extend beyond
ChromeOS:
https://gitlab.freedesktop.org/mesa/mesa/-/issues/9728#note_2063879

> So that strongly sounds like this is just hiding a bug elsewhere.

That's entirely possible, bringing the number of real issues up to (at
least) two:
1. Why the page faults are occurring to begin with.
  - Any video of size 66x2158 seems to trigger the issue.
2. Why the page faults result in the device hanging with gmc->noretry=3D1.

I've asked prathyushi.nangia@amd (chris.kuruts@amd may be helping as
well) to look into the page faults further, since they can't hang the
device if they don't exist. She should be able to provide any further
details if you're interested, but please feel free to reach out to me
as well if you have any other questions.
