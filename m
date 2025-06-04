Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BDCACD832
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 09:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A3110E040;
	Wed,  4 Jun 2025 07:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="D0/7G6hV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4879810E040
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 07:03:55 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-4034118aeb7so1409331b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 00:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749020634; x=1749625434;
 darn=lists.freedesktop.org; 
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=40ajQCpqDRjpuGjCnS6LNsF3WHnh2o2xFeFnau3dKQk=;
 b=D0/7G6hVY0aI81oE8/AraV/xRL3RfPEYcTrzv9auQtQiZ6M4pFaeh1zGitfuTpT5Rw
 eJRitmE3Rz4JCgsfUGrvq1Abb0ZDNgRtAIfqtV3sAjEY62rtwMJHhwjzc+wVS2EN3pho
 f3LnnYR5+HnBunvc9J0fW2tOxPIoPw6+W50H6K3iamkjqo1ed9tMrnkRYuGLDijbRuGN
 jzn1Co5iXQN/SjSE83XFxL9AyoLGjS5nL3rQKpWlyemKNs4Jfln7k1BX8ijiR6DMBDa5
 +axdXM+c/iIGBv6q3YaJKuLTKcTzNIlI4u6GeACm381RRC1aBcZtfjaENCNZbTo5DE23
 tpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749020634; x=1749625434;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=40ajQCpqDRjpuGjCnS6LNsF3WHnh2o2xFeFnau3dKQk=;
 b=peSpW1YFAm6Dxx0gCTOXr2LDwQcunbYxmD5dWIMpgGS+tAQFsXPdkhsvRHPYffhyrg
 h0S4eeLT4JV8KExHUkBAkmV9TcJIN0mNAYNpefku32GXuEaC7pMiSLtlEAx2ZePHUzfP
 1+Xduz+Kd9vZV3CJIpNdPu/93HFXYTEeY5JPYQYVXtEExmxVFroyG2uQrMVmv8lA+AB7
 ogxwsl9u54Afx6yN6fjp3c7c5nWSTaIoyU8gw2NX+viRrSTJuNmH/ZjqNbAgtJoAuBa/
 rQlr8tuuBhnfxGeuj87QZACZw7zvtm/EQ+lUqYBlYGG2cEzwtQbSIXjDHPE1qu7Dzaf8
 zknw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfj+EG+RP1z9+FPrTGf/gSfk8YeVV8/43yfXnFen5AwR9yIXh3wywEQRcPm3efY5rOmmo30ujtPfw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEzAfMaxc/JE+YHdbfbVrsbtF6yImlhvDNJ5wyute/PZvNQghG
 d0bgHEoKEccjK9TOldhXqTXh4VaBEfL1F0iomLIFTajKPOPdsZmheQSEX96HuiYpMg==
X-Gm-Gg: ASbGncv/e5gQjOY1cTt7a/aeHTP1ozwL2+fOyYx8/FW+6Ia6BUWzqU2p2JCiLQR5Wep
 5X1QIXZUdKsbJ5R9XBb3uN5T6Mt+4nnFoWaTVhFpsL/gY8u1BTY26ee9tlBAcX0woghS5Czrrnu
 S7aX/zO5ulgFJAlTEykF/YoxiZ6nfDFZhpmYjEKsE59oQNmHgmTBvVU8i7szcx93n2daP5zuaiq
 23L+OcH3G7evCc31XU6LS3OIzfn8xirK5hGD7CVDiRhk8ZCo0dRyMpcn5bYJcn8jSSCk8h6+Lkj
 pETHkjzd3GLl996WfiCCi6ypmGO4UqQkxrNaiaSdR4JqHBfhXZ5oDI0kUhaoTJicuV/MaMi9TOs
 RUidtZoGOE8Kz9+6oZyaDynsBTepre0jWiMAuviYYOSWDOQ==
X-Google-Smtp-Source: AGHT+IFdbMc3chGS05aazK3NptvjeJGMEive3vKl+DZZ1wIg+JEq+OKIn9JnQGVLtzmO09GrSJUS4w==
X-Received: by 2002:a05:6808:6b96:b0:3f6:a476:f7d3 with SMTP id
 5614622812f47-408f0ed6388mr1629259b6e.9.1749020634210; 
 Wed, 04 Jun 2025 00:03:54 -0700 (PDT)
Received: from darker.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40678bf3374sm2140123b6e.8.2025.06.04.00.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 00:03:52 -0700 (PDT)
Date: Wed, 4 Jun 2025 00:03:18 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Steven Rostedt <rostedt@goodmis.org>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, 
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
In-Reply-To: <20250603140632.168190f9@gandalf.local.home>
Message-ID: <dca861b8-a29d-b2b3-eba7-32aaf2b8eff7@google.com>
References: <20250602170500.48713a2b@gandalf.local.home>
 <20250602171458.7ceabb1c@gandalf.local.home>
 <aD4boBrdZXtz_5kL@casper.infradead.org>
 <fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
 <20250603102959.20c85adb@gandalf.local.home>
 <aD8iL4cFoXpIVK_0@casper.infradead.org>
 <20250603132736.554f611d@gandalf.local.home>
 <CAHk-=whb2rMUCGsaNQC4pkCikJ7iX2_Tc1ye5_a6R9-vAkd2Cg@mail.gmail.com>
 <20250603140632.168190f9@gandalf.local.home>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463770367-150941725-1749020632=:5058"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463770367-150941725-1749020632=:5058
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Adding Thomas Hellstr=C3=B6m, father of ttm_backup_backup_page():
Steve doesn't have CONFIG_SHMEM=3Dy, so now gets a build error because
there's no shmem_writeout(); whereas before 6.16, backup_backup
writeback would have oopsed on calling NULL ram_aops.writepage
when CONFIG_SHMEM is not set.

On Tue, 3 Jun 2025, Steven Rostedt wrote:
> On Tue, 3 Jun 2025 10:54:49 -0700
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > On Tue, 3 Jun 2025 at 10:26, Steven Rostedt <rostedt@goodmis.org> wrote=
:
> > >
> > >  config DRM_TTM
> > >         tristate
> > > -       depends on DRM && MMU
> > > +       depends on DRM && MMU && SHMEM =20
> >=20
> > Yeah, except I think you should just make it be
> >=20
> >           depends on DRM && SHMEM
> >=20
> > because SHMEM already depends on MMU.
>=20
> Yeah, if I had made this a real patch I would have done that, but this wa=
s
> only for seeing it it would work.

Many in drivers/gpu/drm do already "select SHMEM",
so I came to think that

--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -188,6 +188,7 @@ source "drivers/gpu/drm/display/Kconfig"
 config DRM_TTM
 =09tristate
 =09depends on DRM && MMU
+=09select SHMEM
 =09help
 =09  GPU memory management subsystem for devices with multiple
 =09  GPU memory types. Will be enabled automatically if a device driver

would be the right answer.

But perhaps that adds bloat to kernels that don't need backup_backup
writeback, and some #ifdef CONFIG_SHMEMs in or around backup_backup
would be more to the point.  Maybe add that "select SHMEM" line
before rc1, then refine ttm_backup.c with #ifdefs at leisure?

But I just don't appreciate backup_backup and its place in the
drm world: it's a matter for Thomas and dri-devel to work out.

>=20
> >=20
> > That said, our docs already say that if you disable SHMEM, it gets
> > replaced by RAMFS, so maybe just having a ramfs version is the
> > RightThing(tm).
> >=20
> > I don't think such a ramfs version should just return 0 - much less an
> > error. I think it should always redirty the page.
> >=20
> > IOW, I think the "ramfs" version should look something like
> >=20
> >         folio_mark_dirty(folio);
> >         if (wbc->for_reclaim)
> >                 return AOP_WRITEPAGE_ACTIVATE;  /* Return with folio lo=
cked */
> >         folio_unlock(folio);
> >         return 0;
> >=20
> > which is what shmem does for the "page is locked" case.
>=20
> I'll let someone that understand the code a bit more than I do to make su=
ch
> a change. My patch was just a "this makes my system build" thing and let
> those that know this code do the RightThing(tm).

I did start out from the position that mm/shmem.c should provide a good
shmem_writeout() stub for the tiny !CONFIG_SHMEM case.  But seeing as
nobody else has wanted it before, and backup_backup would have been
crashing in such a case, it now seems to me pointless to add such a stub.

Unless all those drm "select SHMEM"s got added long ago to avoid exactly
such crashes, and a shmem stub is preferred throughout drivers/gpu/drm.

I vote for the "select SHMEM", but Thomas and dri-devel and Linus
should decide.

Hugh
---1463770367-150941725-1749020632=:5058--
