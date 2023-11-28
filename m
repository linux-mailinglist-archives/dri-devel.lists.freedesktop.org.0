Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 254BE7FC931
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 23:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884F410E193;
	Tue, 28 Nov 2023 22:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222FC10E193;
 Tue, 28 Nov 2023 22:13:15 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6ce2988d62eso3659708a34.1; 
 Tue, 28 Nov 2023 14:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701209594; x=1701814394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzkua+PtowZpetcv1vSwzhlAqYyVuNpPQqTrqldHUFg=;
 b=eKEH6jI+2YRKZHo6GkbT1bne1JxumQrvUPdv/rO/cJ1Xmlo++r+P5T5IDoOZTdIKii
 hSpGCrBZhyHez3M79gzeTP5er53HHFLdsqXpcwnnsmZHrb1Sx2kMtsmKcuX+go3EcKkA
 yJodKvJgk1c4jGJUtT2ezMEwt1+WvD229Iqk1NFtJ7QLZJesZUaIIxyWG19CRzW2grlo
 m6+8MmF67nAtngKRmO0fn3+Ey4p5Q1yKkG6+XIFHjBdNOoxyRBUhtcVEyZD6GVVKwv4h
 8QBJU8M61YX3kxaat6JXTe+9545q5LxfeIRcHvSC9SZaXMmUR0dsHSmUWHC4VqqfTG4t
 EcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701209594; x=1701814394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzkua+PtowZpetcv1vSwzhlAqYyVuNpPQqTrqldHUFg=;
 b=fUQmVJqv6qkZhZv5ATn6LBcLCQW2QRv0SlGleJEl3wWKido3TaEC6iegk/jxbWkw1a
 eVXPBpiw4qs62sBdBDGupFWnib6vN/ChcImZW+fSxSv/FardljHmsePYEiSfArgfjpAu
 EzfALPsxM8G7m1qdH9TlfiMJJnVt/ErwRvp9OreZ//Z7toqz3HvD0OCT1uwYFTZG8itN
 EPR0TmP4yx2utW+L5ZEGDIPWH/LgUgeWJuSA4bWw1m1mKR4+oRfO8n9KY7NxiA68Z4Yh
 7X4N0wGrTR0/Vy0WK1v0SErYTIrwI72ALDHypEu11Bw5Llx4DYzLDC1SU4yy18SX9XpP
 3r8w==
X-Gm-Message-State: AOJu0YyPjoMCKe1SyiWRfFJ+Ig+CALsQjnLOomGeNIn+TnjDOYvdctRs
 LygeyEgHhCexUon1L7RwOt0oiPJM3RL4hS2PwV8=
X-Google-Smtp-Source: AGHT+IFbrCgwO30ksnJPK0vfsHqHO0Uot3qklNhA8h4Ae+35H6kZ7mEYmIQO0afjWRq/2USC0OYc3UiMQOZSlgVxD34=
X-Received: by 2002:a05:6870:ebca:b0:1e9:9989:33a5 with SMTP id
 cr10-20020a056870ebca00b001e9998933a5mr23314739oab.5.1701209594307; Tue, 28
 Nov 2023 14:13:14 -0800 (PST)
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87jzq2ixtm.fsf@vps.thesusis.net>
In-Reply-To: <87jzq2ixtm.fsf@vps.thesusis.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Nov 2023 17:13:03 -0500
Message-ID: <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Phillip Susi <phill@thesusis.net>
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thesusis.net> w=
rote:
>
> Alex Deucher <alexdeucher@gmail.com> writes:
>
> >> In that case those are the already known problems with the scheduler
> >> changes, aren't they?
> >
> > Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'm
> > misunderstanding what the original report was actually testing.  If it
> > was 6.7, then try reverting:
> > 56e449603f0ac580700621a356d35d5716a62ce5
> > b70438004a14f4d0f9890b3297cd66248728546c
>
> At some point it was suggested that I file a gitlab issue, but I took
> this to mean it was already known and being worked on.  -rc3 came out
> today and still has the problem.  Is there a known issue I could track?
>

At this point, unless there are any objections, I think we should just
revert the two patches.

Alex
