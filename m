Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347609BB8A9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 16:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AC410E45C;
	Mon,  4 Nov 2024 15:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jr16vx1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6276110E034;
 Mon,  4 Nov 2024 15:12:36 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2e2ee0a47fdso755639a91.2; 
 Mon, 04 Nov 2024 07:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730733156; x=1731337956; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KviHfL3GhPgk1194ewkZ7Elw3O84xMVSBocbCkmPTLs=;
 b=Jr16vx1x6MQ+gwtnq0S3iv3NkvhrEIn42kPcK8JUsjMBB+6reYe8IEWCV6YdiPT1H7
 JWapc9JdcnRXcWO6eD3u/SMV4O09811dZNXqAR91Krn4mKNu+ZT0Z7hPyOivTqQLAPyZ
 kUWDQVy95dTKE4hnJQtVvVxQjFmLhvNYoLiUGZ+QflTFgugzi3PosgtlSPt5appUhQyw
 IyFPAl8gwQ9gHD3nKjZ2xI216iu6FZuIe5GjN1PRiwZl7G040yiQveo7MLSvhNaqtXGb
 h5XJ+uISbzBmZ0th68+1W+DxTrGRwYJgTA9qGyKya7p/2PTcyl4rPYCDEPsSUjZDHR9e
 VtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730733156; x=1731337956;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KviHfL3GhPgk1194ewkZ7Elw3O84xMVSBocbCkmPTLs=;
 b=FTX3KtE9rCE1zHUeGmc+K2DdtH7T9hnGIyn+0NPDpZQz6O6uVg5o40XKpFWr8ujISO
 DTHUvKAgRhxrIAVaGmCD+2Vm/UEwhZRIDu0HGvTwiKwYtHcYmA5UbeiSpGC7LNk+1XZO
 T/6xtB8sY8BRC9I4ekMIIWjl4iCqhSBBqYFcT0yVq3IkiJVR6ifm0D0M7/WwC8ssHrgS
 nnrPO7attyE/Gse8bGjEV57SJU8FaKSiAHmCsH1CW8DjXO12Jr2VHQqj1gfNWzizvwOc
 BXEXgTKv9RkHoVj3pcMVOdbvDsi5p4eqC43NXOaJIgvPTJ9Mu43jQKU3sgUAQ5Lv+mS6
 R1HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6d6YqSv233pvHxyPbqz2b1T+BnBpj82bSuyk6sklOl/OlSecXVCiLVv41T7gzv+jEQoUQmh27OyeE@lists.freedesktop.org,
 AJvYcCWcEqahR4u3I/dtsUKUMD1njQND9y/oL3HI3wbOJKSaCZQ8HCA5spWAzzOQfi3XSBPA+h9fqD1l@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAOF0+fHxMjjoi2TXnKx9yBomnNjggRzh1tEhx4GpWCd+Q6MLG
 Le9scsFVBZyfq56t+8d9kOiOwjkOa/i8t0SGLWVaiZvN/7wFQh9iMhUf3sJQ0+vO4NR54vs0iDp
 HQYMUjyiDuICTHjKksFx1lUWLMrgPWg==
X-Google-Smtp-Source: AGHT+IH6q+c/r/8XZVBV6BuFehgtpcxWK806Z2lT5bLMqawbzEthFokNLqHNCackCtMD0b/aN73UxVUip01R2w8zoec=
X-Received: by 2002:a17:90b:3b48:b0:2e2:c423:8e16 with SMTP id
 98e67ed59e1d1-2e8f0f4ccbdmr16257661a91.1.1730733155852; Mon, 04 Nov 2024
 07:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20241029133141.45335-1-pchelkin@ispras.ru>
 <ZyDvOdEuxYh7jK5l@sashalap>
 <20241029-3ca95c1f41e96c39faf2e49a-pchelkin@ispras.ru>
 <20241104-61da90a19c561bb5ed63141b-pchelkin@ispras.ru>
In-Reply-To: <20241104-61da90a19c561bb5ed63141b-pchelkin@ispras.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Nov 2024 10:12:24 -0500
Message-ID: <CADnq5_OR9T5Ocxu6pRu38uzdmcV7_um_6aK4vYefhMiZ0gJJSA@mail.gmail.com>
Subject: Re: [PATCH 0/1] On DRM -> stable process
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 stable@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, 
 Mario Limonciello <mario.limonciello@amd.com>, Jonathan Gray <jsg@jsg.id.au>
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

On Mon, Nov 4, 2024 at 9:55=E2=80=AFAM Fedor Pchelkin <pchelkin@ispras.ru> =
wrote:
>
> On Tue, 29. Oct 18:12, Fedor Pchelkin wrote:
> > On Tue, 29. Oct 10:20, Sasha Levin wrote:
> > > On Tue, Oct 29, 2024 at 04:31:40PM +0300, Fedor Pchelkin wrote:
> > > > BTW, a question to the stable-team: what Git magic (3-way-merge?) l=
et the
> > > > duplicate patch be applied successfully? The patch context in stabl=
e trees
> > > > was different to that moment so should the duplicate have been expe=
cted to
> > > > fail to be applied?
> > >
> > > Just plain git... Try it yourself :)
> > >
> > > $ git checkout 282f0a482ee6
> > > HEAD is now at 282f0a482ee61 drm/amd/display: Skip Recompute DSC Para=
ms if no Stream on Link
> > >
> > > $ git cherry-pick 7c887efda1
> >
> > 7c887efda1 is the commit backported to linux-6.1.y. Of course it will a=
pply
> > there.
> >
> > What I mean is that the upstream commit for 7c887efda1 is 8151a6c13111b=
465dbabe07c19f572f7cbd16fef.
> >
> > And cherry-picking 8151a6c13111b465dbabe07c19f572f7cbd16fef to linux-6.=
1.y
> > on top of 282f0a482ee6 will not result in duplicating the change, at le=
ast
> > with my git configuration.
> >
> > I just don't understand how a duplicating if-statement could be produce=
d in
> > result of those cherry-pick'ings and how the content of 7c887efda1 was
> > generated.
> >
> > $ git checkout 282f0a482ee6
> > HEAD is now at 282f0a482ee6 drm/amd/display: Skip Recompute DSC Params =
if no Stream on Link
> >
> > $ git cherry-pick 8151a6c13111b465dbabe07c19f572f7cbd16fef
> > Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.=
c
> > HEAD detached at 282f0a482ee6
> > You are currently cherry-picking commit 8151a6c13111.
> >   (all conflicts fixed: run "git cherry-pick --continue")
> >   (use "git cherry-pick --skip" to skip this patch)
> >   (use "git cherry-pick --abort" to cancel the cherry-pick operation)
> > The previous cherry-pick is now empty, possibly due to conflict resolut=
ion.
> > If you wish to commit it anyway, use:
> >
> >     git commit --allow-empty
> >
> > Otherwise, please use 'git cherry-pick --skip'
>
> Sasha,
>
> my concern is that maybe there is some issue with the scripts used for th=
e
> preparation of backport patches.
>
> There are two different upstream commits performing the exact same change=
:
> - 50e376f1fe3bf571d0645ddf48ad37eb58323919
> - 8151a6c13111b465dbabe07c19f572f7cbd16fef

There were cases where I needed to cherry-pick fixes from -next to
-fixes.  In the past I had not used -x when cherry-picking because I
got warnings about references to commits that were not yet in
mainline.  I have since started using -x when cherry-picking things
from -next to -fixes.

Alex

>
> 50e376f1fe3bf571d0645ddf48ad37eb58323919 was backported to stable kernels
> at first. After that, attempts to backport 8151a6c13111b465dbabe07c19f572=
f7cbd16fef
> to those stables should be expected to fail, no? Git would have complaine=
d
> about this - the patch was already applied.
>
> It is just strange that the (exact same) change made by the commits is
> duplicated by backporting tools. As it is not the first case where DRM
> patches are involved per Greg's statement [1], I wonder if something can =
be
> done on stable-team's side to avoid such odd behavior in future.
>
> [1]: https://lore.kernel.org/stable/20241007035711.46624-1-jsg@jsg.id.au/=
T/#u
>
> --
> Thanks,
> Fedor
