Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EAB4D3CC7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 23:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0C010E19B;
	Wed,  9 Mar 2022 22:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268F110E2CB;
 Wed,  9 Mar 2022 22:19:46 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id yy13so8200471ejb.2;
 Wed, 09 Mar 2022 14:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ro2zrvTG4se6drm9oDztex9nzLzWYZIoIIo7eV9G12E=;
 b=G15vs6cZIOXhsz1J6qOlAxWG9pR+HlqZa1BmdBOWP+yXCaEOEZQS9/1VwMAFMvVPdZ
 NenxMrHKl91zM3nWznusb/qhdCWb+eoGjX0EyuqeH1BdYqxlfTu4NUOxsFVYoakj5a03
 MktS3/IOAwRfM2jyF/NpDmKz+81Olf7nBi+NJPJvgthZj8y1OoXLsxDmOHjWUYZ75gZV
 TYnO10qDGSQq6macePsp9dzG/+o2CATVsnmm+Nkbl3EnOEMWeuRFkyh0FxV1Xhq+kGG4
 yoZy7I/QAgsscqxXJkwiXK4u04fkpF5ixAAaMkVdBs4nJ62XRzqVyHaaIYw3m2L0KBQX
 xuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ro2zrvTG4se6drm9oDztex9nzLzWYZIoIIo7eV9G12E=;
 b=YRxkW54T5Exw1wHPwaigsXdLbUOpk3ih/FrZowD+VsvlK4cCRBpKbjXvyPlP7F5ozM
 pAsQ10mWygxR5BXDoY+vMfRGadt8Gbv4vnDcFBvXYC3haXf0hFoOs81Mzzc8r8Y05E00
 GY6iDMV8V9deA/6dfbBQmHpDSiXjtCgNrsoDfRrKv6zBvKbIjOmxVxSI+IEBNCCbHI2z
 1RBt0iixLCtoXl8JenjUbI7P1mvYSbs1AapZmwdWgwRKJE5GPb54x3rIIsL+nHLgUnt8
 R391k9jebhJ3OImp6ftapUcDZQgPvmUgIVF1TP5Zs4l3xyPw7Mugq4aXTxHEsm883774
 aKUg==
X-Gm-Message-State: AOAM532UhWLTlUPS6nX8RzaXvZYfsQjR59gM6wucrFHAWkpzGUNqjHnc
 oanePZwbQwg++5JIFTZkYaFIHwjxYXgfZ3lY2mMry3Dh
X-Google-Smtp-Source: ABdhPJzEoTeUoTXdJuw7S0yTE54Rf1fUgf7HgvEZg03b9UedpvA7/ie87hrRFG7Pf1hDiET//BorRix/ELnTVZs+Mpo=
X-Received: by 2002:a17:906:3109:b0:6cc:7a1:8db0 with SMTP id
 9-20020a170906310900b006cc07a18db0mr1764700ejx.266.1646864384487; Wed, 09 Mar
 2022 14:19:44 -0800 (PST)
MIME-Version: 1.0
References: <20220307200813.77378-1-alexander.deucher@amd.com>
 <CAPM=9twEVwqPMdQvJNaiJqrRGBNW4Mp==2cEXP6skPJcczNemA@mail.gmail.com>
 <CADnq5_NvRDqhUNLcRiRi=ZXO4A3DdVQ3ADUtH7ZjYx1iXaejkg@mail.gmail.com>
In-Reply-To: <CADnq5_NvRDqhUNLcRiRi=ZXO4A3DdVQ3ADUtH7ZjYx1iXaejkg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 10 Mar 2022 08:19:33 +1000
Message-ID: <CAPM=9tzQ9PWp1PjT70gqko_ByuoJqPgvNVqOy4K7P0kn=b4fuA@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.18
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Mar 2022 at 08:16, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Mar 9, 2022 at 5:12 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Tue, 8 Mar 2022 at 06:08, Alex Deucher <alexander.deucher@amd.com> wrote:
> > >
> > > Hi Dave, Daniel,
> > >
> > > Same PR as last week, just fixed up a bad Fixes tag.
> > >
> > > The following changes since commit 38a15ad9488e21cad8f42d3befca20f91e5b2874:
> > >
> > >   Merge tag 'amd-drm-next-5.18-2022-02-25' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-03-01 16:19:02 +1000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.18-2022-03-07
> > >
> > > for you to fetch changes up to 53b97af4a44abd21344cc9f13986ba53051287bb:
> > >
> > >   drm/amdkfd: Add format attribute to kfd_smi_event_add (2022-03-07 14:59:59 -0500)
> >
> > clang says no.
> >
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:508:6:
> > error: variable 'vmid' is used uninitialized whenever 'if' condition
> > is false [-Werror,-Wsometimes-uninitialized]
> >         if (dev->kfd2kgd->get_atc_vmid_pasid_mapping_info) {
> >             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:521:6:
> > note: uninitialized use occurs here
> >         if (vmid > last_vmid_to_scan) {
> >             ^~~~
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:508:2:
> > note: remove the 'if' if its condition is always true
> >         if (dev->kfd2kgd->get_atc_vmid_pasid_mapping_info) {
> >         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:490:19:
> > note: initialize the variable 'vmid' to silence this warning
> >         unsigned int vmid;
> >                          ^
> >                           = 0
> >
>
> Already fixed in:
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/455331caeea5058d6df20f31a414b68ca502ec25
> was going to send that out with additional fixes this week, but I can
> just spin a new PR if you'd prefer.

A respin would be great,

Thanks,
Dave.
