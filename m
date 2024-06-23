Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01517913753
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 04:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C2E10E531;
	Sun, 23 Jun 2024 02:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SOJ9t9bO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C122C10E531
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 02:26:50 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7954f8b818fso217262785a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 19:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719109609; x=1719714409; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+LPiISOoLYsJFxCwMt3f7g5PbGNmTkGzNcNw2ao++w=;
 b=SOJ9t9bOzvGS1PXuSSvDTNR/S9ahpA6NsLy62ZxJBV2hp1PL4wXk+2s1pcHScofVnI
 SZZwGh17V7ra2PckuLStZJXX3GxpW7GWgTIWwcNhqKgtl5tSiPR1sRN+5C6IgI9fKhz5
 UTJF/yx8Bb71qH80omu5f6GQqVWaWtPt5Zx9Nx8Vi/Pu7gauQpg7IWUUV5M+tKiiI36x
 3SMlePImAx/PXYbmZHAM1tBMmrrecRfeXe2fjLta+/nASszj3TASinz0UKwPgO3T85Sg
 k9UNS3Gmp1oLHC3Z6KuvQRrV4mOA4qKCu9oslQzaspmZXzBDj/xpcFybpUBeNjYL4MuL
 VFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719109609; x=1719714409;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K+LPiISOoLYsJFxCwMt3f7g5PbGNmTkGzNcNw2ao++w=;
 b=DKpzgjOtb7dRBSQi0kMr+f15BF0b0ustnaurslP6PZpEbdgzTGKoE09RwyhNacR5OS
 7KiMR4unKmTZM/i+TbdHjRJgN1Lk7y8Ch9vcyCtmQ4ReFjU0uwQZK1DnfhTplHPwi2D+
 Jfi8CtBCw7T2jzq2qrAz0lPgNhnJwclLWXuf2drSh6TAB4Fw5mtuGqXrAtW9+uZf8aIR
 0OCstOuJriFazRfxC4RrtEPuYO3hMfq2W0UX4aInGFpEjzacgDySfvq5DCUcPypTOQu9
 Hk7a3osPvLE9qZ9Kv74H36qKW2KTaMyPNXHGBgrURwN+dKM30o8fs5FaRVpPLClw/Cug
 7frA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkra1b2k3aEI4rL5WJdFnM6g3FHHJXeZT3xbZEZUmSbPSwyXQRkTU9kUko2MA9GszZXIIHIuBrtlCy+XlA+DfcNf6ELQbdC0xqeiIJRyHa
X-Gm-Message-State: AOJu0YxZsLHmsjyPVvCY6RTKt1zJaVXax0FAX3+j/JTtgwtd47QEGxGp
 i1OzeXL7IuF7zBreq92k83FEoiwaJwEsem1+vanEsKkJQXDd/QWVc6l50/yCs1r+lajFqY7h+4h
 ydjz8Zv+byLd47yTL2xQIiFzLiNY=
X-Google-Smtp-Source: AGHT+IFY0Y/UcJS7sknileL2UagN7ReFxrAWEEHMeCw0v9alkFUCpuvgoM4QBmWhVR/dsnO/cQfpgT+sNC6/yK6yero=
X-Received: by 2002:a05:6214:20e2:b0:6b5:24b:f430 with SMTP id
 6a1803df08f44-6b540a91d2emr16144186d6.40.1719109609327; Sat, 22 Jun 2024
 19:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240621022959.9124-1-laoar.shao@gmail.com>
 <20240621022959.9124-7-laoar.shao@gmail.com>
 <20240621135142.GF1098275@kernel.org>
In-Reply-To: <20240621135142.GF1098275@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 23 Jun 2024 10:26:13 +0800
Message-ID: <CALOAHbARduAEv+CQnRuLokrf5NYkM5omhpOuJuDuBhf-daKgxg@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] mm/util: Deduplicate code in {kstrdup, kstrndup,
 kmemdup_nul}
To: Simon Horman <horms@kernel.org>
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com, 
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com, 
 akpm@linux-foundation.org, penguin-kernel@i-love.sakura.ne.jp, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org, 
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
 bpf@vger.kernel.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Fri, Jun 21, 2024 at 9:51=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> On Fri, Jun 21, 2024 at 10:29:54AM +0800, Yafang Shao wrote:
> > These three functions follow the same pattern. To deduplicate the code,
> > let's introduce a common help __kstrndup().
> >
> > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
>
> Hi Yafang Shao,
>
> Some minor nits from my side.
>
> > ---
> >  mm/internal.h | 24 ++++++++++++++++++++++++
> >  mm/util.c     | 27 ++++-----------------------
> >  2 files changed, 28 insertions(+), 23 deletions(-)
> >
> > diff --git a/mm/internal.h b/mm/internal.h
> > index b2c75b12014e..fd87f685739b 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -1521,4 +1521,28 @@ static inline void shrinker_debugfs_remove(struc=
t dentry *debugfs_entry,
> >  void workingset_update_node(struct xa_node *node);
> >  extern struct list_lru shadow_nodes;
> >
> > +/**
> > + * __kstrndup - Create a NUL-terminated string from @s, which might be=
 unterminated.
> > + * @s: The data to stringify
> > + * @len: The size of the data, including the null terminator
> > + * @gfp: the GFP mask used in the kmalloc() call when allocating memor=
y
> > + *
> > + * Return: newly allocated copy of @s with NUL-termination or %NULL in
> > + * case of error
> > + */
> > +static __always_inline char *__kstrndup(const char *s, size_t len, gfp=
_t gfp)
> > +{
> > +     char *buf;
> > +
> > +     buf =3D kmalloc_track_caller(len, gfp);
> > +     if (!buf)
> > +             return NULL;
> > +
> > +     memcpy(buf, s, len);
> > +     /* Ensure the buf is always NUL-terminated, regardless of @s. */
> > +     buf[len - 1] =3D '\0';
> > +     return buf;
> > +}
> > +
> > +
>
> nit: One blank line is enough.

Ah, will change it.

>
> >  #endif       /* __MM_INTERNAL_H */
> > diff --git a/mm/util.c b/mm/util.c
> > index 41c7875572ed..d9135c5fdf7f 100644
> > --- a/mm/util.c
> > +++ b/mm/util.c
> > @@ -58,17 +58,8 @@ char *kstrdup(const char *s, gfp_t gfp)
> >       if (!s)
> >               return NULL;
> >
> > -     len =3D strlen(s) + 1;
> > -     buf =3D kmalloc_track_caller(len, gfp);
> > -     if (buf) {
> > -             memcpy(buf, s, len);
> > -             /* During memcpy(), the string might be updated to a new =
value,
> > -              * which could be longer than the string when strlen() is
> > -              * called. Therefore, we need to add a null termimator.
> > -              */
> > -             buf[len - 1] =3D '\0';
> > -     }
> > -     return buf;
>
> nit: The local variable buf is now unused, and should be removed from kst=
rdup().
>      Likewise for kstrndup() and kmemdup_nul()
>
>      Flagged by W=3D1 builds with gcc-13 and clang-18, and Smatch.

I missed that. Thanks for pointing it out.

--=20
Regards
Yafang
