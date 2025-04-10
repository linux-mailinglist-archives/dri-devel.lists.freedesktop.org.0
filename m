Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5660FA839A7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 08:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB4210E36E;
	Thu, 10 Apr 2025 06:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="f+JPjK2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF90A10E36E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 06:44:43 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so3610775e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 23:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1744267482; x=1744872282; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0chDNpqWEg6rX5jiiV+xs5nY/pUtnulH7M5PEDr5nxg=;
 b=f+JPjK2cXuVWK6NNb/SHPDcr95LLMMuIwC7iGZTxnu6C4RqBx2aENHylD1v5gfmnJ8
 k8pLyVpgP9bLOJd4swUwy48SU+sLEAhRzPIgCFQssGDztGNHtg7vjwzjx5BS22CXUOjo
 ++HPCbLWzLBGtOBLWmI68z0WoFwXWOdlDf7Ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744267482; x=1744872282;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0chDNpqWEg6rX5jiiV+xs5nY/pUtnulH7M5PEDr5nxg=;
 b=BLOGDIIYWb69Nwb8kW3Yj1xfPkUENArVaFnSIaU5g27fvCqBjOrq1lZcMzN7ndjAjz
 pLXjAl320joq9L/eb/+gZwYJTDI1qwyXrJvhlHmp7c+tOipRDTWFK2lLZUWAtWbFRU4C
 Re7fpZpKzUNv5Z5U3s5IAu0G4QxnSHfGsKKMGwxJPnVa98z3qthYvu7RaHBvK/3CZ0qH
 ZTFa+pPQVoZjg4cAHIR8aX94ljQ2I/0l6VBIthOh52HOsezgktngvweMdjAnf+OfgCcg
 j2Qn4gHfSAMOLbAE/wX+OtzSB6k9vbYAKjzt5LFiPyl3aehEsrJzjCD7MEuB+0i32VXr
 WsVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGfNj7E70u2mxmSHn7v7HiRGSsz6eQI8hX3f+wgUy05wqS4b0WiQ3Rdd/nle5YebYqJgZJS6XTTYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYWoNOkKHT11NjzmHrllSWcxJW86lFpkeXUKnTzn4tzLqm9Cfm
 hmSmq0B8aFLImYgfBzGVA5Yp6LuemoIsYNDuJIMPPdPiqHuL4rJJD76IaqXXHWM=
X-Gm-Gg: ASbGncv/LWiIBAXn+Qct+d070Lh66bJyIUOIk3uEfxl8oRHcJTBxbytwOUUk21whqcy
 gAfjq43nbioaPUFItSySNjIb/oW7Rh9Wj4hZsLn5g2JzIxAHbKW5EFUwDQQFIy8cCthWWpvldnW
 ts4v0/V70BbKGkNdVV85Yg8CXywdqGe594hqovDiIyWHVU4enuv+MxON28e66+ReRLgaeAclOqT
 gTvsRD6Sfr59XO79W7iJd70vayzDtFCYosTZzWEp5mv3M3WH/fvGW4NZaF/BycMOvAQsphpOBmZ
 rF85/S8EA44CMq4L5//aEWQFjEh5j4tLifXWS8V1snb2oSHnORO5
X-Google-Smtp-Source: AGHT+IEJgQqevPlSECoqBxW8CYtFMCdGsh21g1ElfCwZR2OH03SfuBiLuLrqmVXW04qTylyL3AfREw==
X-Received: by 2002:a05:600c:4e14:b0:43c:f8fc:f69a with SMTP id
 5b1f17b1804b1-43f2d7af23cmr16246325e9.4.1744267481677; 
 Wed, 09 Apr 2025 23:44:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f208e96dasm32222395e9.0.2025.04.09.23.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 23:44:41 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:44:38 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Cc: Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 acurrid@nvidia.com, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/8] DRM Rust abstractions
Message-ID: <Z_do1l7Clues20eD@phenom.ffwll.local>
References: <20250325235522.3992-1-dakr@kernel.org>
 <32e7da7e-de32-4bc6-a751-f604da36a63f@asahilina.net>
 <Z_VXBZcBsk2k6eVN@cassiopeiae>
 <143206f6-cd97-4ef8-a4f3-f68d703903bf@asahilina.net>
 <Z_V2ZxIZxI_HiHM5@cassiopeiae>
 <ebbb4d4e-4778-434b-82d7-188f8f6152ff@asahilina.net>
 <CAPM=9ty5dNQOJUj=wtubGYGt5Kt3QeQAQ9rjM2P0dwjBUFspMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9ty5dNQOJUj=wtubGYGt5Kt3QeQAQ9rjM2P0dwjBUFspMw@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.17-amd64 
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

On Thu, Apr 10, 2025 at 07:29:30AM +1000, Dave Airlie wrote:
> On Wed, 9 Apr 2025 at 17:49, Asahi Lina <lina@asahilina.net> wrote:
> >
> >
> >
> > On 4/9/25 4:17 AM, Danilo Krummrich wrote:
> > > On Wed, Apr 09, 2025 at 03:06:38AM +0900, Asahi Lina wrote:
> > >> On 4/9/25 2:04 AM, Danilo Krummrich wrote:
> > >>> On Wed, Apr 09, 2025 at 01:29:35AM +0900, Asahi Lina wrote:
> > >>>> On 3/26/25 8:54 AM, Danilo Krummrich wrote:
> > >>>
> > >>> You said "use it/submit it in any way".
> > >>
> > >> I thought keeping authorship is an implied part of kernel etiquette.
> > >> Usually when you submit code someone else wrote, you keep them as
> > >> primary author... I want you and others to use the code, that doesn't
> > >> mean I want you to put your name on it as if you wrote most of it.
> > >
> > > The broader context of the private mail was about you stepping back on kernel
> > > development. You did so with a few more details (which I'm not going to
> > > disclose), that made it clear to me that you don't want to be bothered with
> > > kernel development any more.
> > >
> > > In combination with you giving permission to "use it/submit it in any way", I
> > > thought it's better to just pick a safe path to not misrepresent you given all
> > > the changes I made.
> > >
> > > I do still credit you on all corresponding patches though.
> > >
> > >>>> I'm really tired of kernel politics and I don't want to spend more brain
> > >>>> cycles looking at all the other patches or having to argue (in fact I
> > >>>> usually don't look at patch emails at all recently), but I would
> > >>>> appreciate if you keep my authorship for files that I did largely author
> > >>>> myself. After everything I've been going through the past weeks (some of
> > >>>> the people on Cc know what that's about...) this feels like yet another
> > >>>> slap in the face.
> > >>>
> > >>> As mentioned, please diff the correct thing and then just tell me where you'd
> > >>> like to have primary authorship changed.
> > >>
> > >> I don't even know what tree this series is supposed to apply onto (tried
> > >> drm-misc next, torvalds/master, v6.15-rc1) so I'm just going to take
> > >> drm-misc/topic/rust-drm and assume that's what this series includes.
> > >>
> > >> $ diff -urN rust/kernel/drm/drv.rs ../uplinux/rust/kernel/drm/driver.rs
> > >> | grep '^+' | wc -l
> > >> 45
> > >>
> > >> So I'm diffing the correct thing now and the result is essentially
> > >> identical.
> > >>
> > >> Meanwhile, device.rs has many additions... but a big chunk of those is
> > >> code that was just moved from drv.rs (like drm_legacy_fields and the
> > >> code that uses it).
> > >
> > > Except drm_legacy_fields! and VTABLE (which is just trival boilerplate code)
> > > device.rs changed fundamentally, i.e. I switched the device abstraction to use
> > > the subclassing pattern.
> > >
> > > If you look further you will find that I really changed a lot of things.
> > >
> > > I have *nothing* to hide, here's the overall diff for all the changes I made:
> > >
> > >       [1] https://pastebin.com/FT4tNn5d
> > >
> > >>
> > >> Again, I don't have the spoons to make some deep analysis here, you
> > >> should know how much of the code you changed, added, or just moved
> > >> around. I'm not going to litigate this further. If you think splitting
> > >> up a commit into multiple commits and moving code around warrants taking
> > >> over primary authorship of a project I've been working on for years now,
> > >> so be it.
> > >
> > > You just said you "don't have the spoons to make some deep analysis here" and
> > > right below you acuse me of just "moving code around".
> > >
> > > Which means that you do so *without* evidence. And again, I have *nothing* to
> > > hide, see [1].
> > >
> > > Besides that I also told you that I'm fine to change primary authership, if you
> > > tell me where you think it would be appropriate (even though I do think my
> > > changes do justify how things are currently).
> > >
> > >> I'm just disappointed.
> > >
> > > That's where you are maneuvering *yourself* into.
> > >
> > > You could have easily just asked me to change things for patch #X, #Y and #Z.
> > >
> > > Instead you outright started with accusing me of things. I also feel like you
> > > intentionally try to misrepresent what I am doing and what my intentions are.
> > >
> > > I neither have the time, nor am I willing to deal with random drama like this.
> > >
> > > If you want something changed, just go ahead and tell me what, *without* more
> > > drama and without more accusing me of things.
> > >
> >
> > Alright, then please remove my authorship entirely from this series,
> > including Co-developed-by and signoff lines. I hereby release my code as
> > CC-0, which means you don't need the signoffs, it's yours now. The same
> > applies to any future code submitted that I originally authored as part
> > of the Asahi kernel git tree. That way we don't need to argue about any
> > of this.
> >
> > I thought asking for patches that I mostly authored to keep my Git
> > authorship would be an uncontroversial request (and not unreasonable to
> > ask you to figure out which those are, since you made the
> > changes/splits, and #3 clearly is one), but apparently even that gets
> > you flamed on Linux threads these days.
> >
> > I regret having been part of this community.
> 
> Look, this isn't Crank or Speed, there is no need to keep the drama
> level above 50 to sort this out.
> 
> This also isn't exactly how best to relicense code, so I think we
> should abstain from doing anything to help promote more drama.
> 
> The project will maintain authorship/signoffs on any patches that are
> clearly still authored by you, we will err on the side of caution and
> on rewritten patches which share some decent amount of history shall
> retain your authorship. In this case it does appear instead of putting
> in the 5 minutes of looking at Danilo's reasoning and supplied diff,
> and either saying "my bad, this is sufficiently new code and I don't
> feel I wrote it" or "I'd still prefer to retain authorship despite
> your changes", both of which Danilo indicated would be respected you
> somehow picked door number 3 which probably took more time and effort
> than either of the above options. Again no need to pick door number 3
> here, you can let the bus go below 50, it won't explode.

To emphasis and maybe a bit more dry&serious, signed off by lines are not
optional, because they signify agreement to the developer certificate of
origin irrespective of the original license. Upstream has some patches
without sob lines from all authors (well copyright holders to be strict,
with companies there's often some internal authors that get dropped), but
that is some very special case and needs real care.

On the topic itself there's a few different ways to do this, depending
whether it's more co-authorship, a complete rewrite or just some small
bugfixes on top of an existing patch. The important part is that all
authors are acknowledged, and that we have sob lines from everyone.
Ideally also with archive links, where that's not obvious, e.g. when patch
titles changed or the entire series was rewritten or when the original
patch never was submitted to a list tracked by lore.k.o.

Unfortunately git doesn't allow multiple authors, so we cannot acknowledge
them all exactly equally due to lacking tooling in the co-authored case.
But that's what the Co-Authored-by or similar tags are meant for.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
