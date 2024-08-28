Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98204962C7D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0521810E0E8;
	Wed, 28 Aug 2024 15:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NDZOyrZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1371F10E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:35:47 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3df036d7132so27715b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 08:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724859346; x=1725464146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V6yAsW8mNLGozd3i7GjRGefCXRich5GRAyEbXws/Or8=;
 b=NDZOyrZf6aqMeWo2zPRCefmglDcBezPK3KrazdsTSLDDVx4AulVK+ZhiNzrBYmYFss
 z68XJAJAqEVWJvoh/4qmc8GRL2IqHbUS7+0Lq/jtI7AbuM4KOmT/eWKbNcqHRaC3QcBn
 LXOz7B1XsXNLutsco/sXTIgdRjPtMMwseGYThKwsc39Emp04kAJ2d5D/J2uGzSzN2Rmq
 H1gSwKnl2mV4nvOeNRH6mjkFYqSAFenxEtF8GL1fK7O3r0dxy3URfmIsi4O4YyDboQtE
 056xAtGCRR0lcOEUnkvUrmu3QyMe3a1k8hn81Ho8TDHImLMeOOfZGX8eil1z36xczRH6
 aMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724859346; x=1725464146;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V6yAsW8mNLGozd3i7GjRGefCXRich5GRAyEbXws/Or8=;
 b=ik+KgX/+HdBXsn5YPrsUihNI1i7iqJymjALNjYZlF2O8CoM4te2d6u9aNKDsjW8Jfe
 Ybn/Zz8PshnK5cof07kOT9Sf6bk1GOySYKs8Uy/SwPCsuD0+/MYcAdZ5sVNbjkW3S+R1
 TpfJiphx538DIh/T+SqrJThNwU6EH+uV/XjkL5cDnxjri4KxNWJ36xo1/Gu9nEP/CMNM
 6aMI71XU7euXxQSArR87TnB+OOXpqKspyrytnX5iNPFGyVohnwj4mWmQHsVP38p6MLa5
 ZQvHS4W2zRVsUSIGdD0rMAKlkm8n1Wa196flX/x3Ib1rwjjv7UF28s5FbnihQwY+ibAM
 fPIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+GsODb67LS/0Qan79H957onMhQ5GUyyikV9NXLwaSZng1R0KPLP7abEzZRIa3PRMogRDPZqyCCCw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzobQIBoaWBzhA373s+lImWrQWfBvVnPozS+UC1dtPbcT8RQc02
 P+y0fGQTBLCE/y1I2yi6YGZPO9BbU67FWGvBidpJGXHxCUSRDtkW7i71vPzJ6ZBYBLraZ29bXKu
 0mB0U51UXYvU5ktfl2gVU3QZeWbU=
X-Google-Smtp-Source: AGHT+IFWVJkFGqUW/6NMJLG+fLGH+28B/RVs+oYoEU7i5z9aPDKzbo4jNZ4QqGrhLhScG9Mj/I0GuLCKlqkcbWyLGGw=
X-Received: by 2002:a05:6808:189c:b0:3d9:26fe:2991 with SMTP id
 5614622812f47-3de2a892f3dmr10465661b6e.4.1724859346098; Wed, 28 Aug 2024
 08:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <ZscDox5KoiNHXxne@phenom.ffwll.local>
 <3afe3ab2-4a58-49a9-acd7-c989980c68f2@amd.com>
 <Zs4EPT1DR7OrE5X-@phenom.ffwll.local>
 <Zs4Ss8LJ-n9NbBcb@phenom.ffwll.local>
 <c890ecbf-e7eb-479d-bb54-807edd1f66e6@amd.com>
 <010f1193a4c21fff566f4847d49289091b9b49c6.camel@linux.intel.com>
 <afd2f497-88db-4609-ac4a-841039d61677@amd.com>
In-Reply-To: <afd2f497-88db-4609-ac4a-841039d61677@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Aug 2024 11:35:33 -0400
Message-ID: <CADnq5_NaUFjM6LNWg+uVCkqKyBCskcPsu3JVXGgWGNH35kijSA@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org
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

On Wed, Aug 28, 2024 at 11:26=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 28.08.24 um 16:05 schrieb Thomas Hellstr=C3=B6m:
> > On Wed, 2024-08-28 at 14:20 +0200, Christian K=C3=B6nig wrote:
> >> Am 27.08.24 um 19:53 schrieb Daniel Vetter:
> >>> On Tue, Aug 27, 2024 at 06:52:13PM +0200, Daniel Vetter wrote:
> >>>> On Thu, Aug 22, 2024 at 03:19:29PM +0200, Christian K=C3=B6nig wrote=
:
> >>>>> Completely agree that this is complicated, but I still don't
> >>>>> see the need
> >>>>> for it.
> >>>>>
> >>>>> Drivers just need to use pm_runtime_get_if_in_use() inside the
> >>>>> shrinker and
> >>>>> postpone all hw activity until resume.
> >>>> Not good enough, at least long term I think. Also postponing hw
> >>>> activity
> >>>> to resume doesn't solve the deadlock issue, if you still need to
> >>>> grab ttm
> >>>> locks on resume.
> >>> Pondered this specific aspect some more, and I think you still have
> >>> a race
> >>> here (even if you avoid the deadlock): If the condiditional rpm_get
> >>> call
> >>> fails there's no guarantee that the device will suspend/resume and
> >>> clean
> >>> up the GART mapping.
> >> Well I think we have a major disconnect here. When the device is
> >> powered
> >> down there is no GART mapping to clean up any more.
> >>
> >> In other words GART is a table in local memory (VRAM) when the device
> >> is
> >> powered down this table is completely destroyed. Any BO which was
> >> mapped
> >> inside this table is now not mapped any more.
> >>
> >> So when the shrinker wants to evict a BO which is marked as mapped to
> >> GART and the device is powered down we just skip the GART unmapping
> >> part
> >> because that has already implicitly happened during power down.
> >>
> >> Before mapping any BO into the GART again we power the GPU up through
> >> the runtime PM calls. And while powering it up again the GART is
> >> restored.
> > I think you're forgetting the main Xe use-case of Lunar-lake
> > compression metadata. I'ts retained by the device during D3hot, but
> > cannot, at that time, be accessed for shrinking.
>
> Yeah, that is really something we don't have an equivalent for on AMD GPU=
s.
>
> When the ASIC is powered down VRAM is basically dead as well because it
> won't get refreshed any more.

We actually support memory self refresh for VRAM on some platforms,
but the rest of the GPU is powered down, so only the VRAM contents is
retained.

Alex

>
> > And copying it all out "Just in case" when transitioning to D3hot just
> > isn't a viable solution.
>
> I would say that this is solvable with a hierarchy of power management
> functionality.
>
> E.g. the runtime PM interface works the same for you as it does for
> amdgpu with evicting TTM BOs etc....
>
> Then separate from runtime PM you have a reference count for the
> accessibility of compressed metadata. And while shrinking you only
> resume this specific part.
>
> Christian.
>
> >
> > /Thomas
> >
>
