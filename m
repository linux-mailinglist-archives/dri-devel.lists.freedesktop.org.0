Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E5792675F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 19:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9B710E98A;
	Wed,  3 Jul 2024 17:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="amC3bSv7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DA810E98A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 17:45:36 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-65240d22f7cso3329557b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 10:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720028736; x=1720633536;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GhxR4AnmOLb2e8qgt4elcn3tmPYz1HfQBknaKkg9ViY=;
 b=amC3bSv7Zs3Qg0wkcn6OM6EASyZaUo3fkh9DF+JBKl9Mh1aobQ9n65FU/kaOGmr0Lz
 rPtwBct15VVQE5LCNMaKePGufUS9sksJKy8AYir0D8FnJRSm1NcvL9qdMntSXTF+QxtM
 jOofWsMyt1qk2PVEpg0gkqG4zBVJQUVBrh0j/BImir1IuL//QF5Y7eZLhPh6uycTuGA0
 jToY/AzbWhkHQ3gMpOpBxZezqBKhqbvSMd8sBbOKVeOcQXVc4ibbYUIHz4RTjfTKCwNl
 RD5oZAgT2mctv369SMmyYCGVzA8K2jB+s/+A+hMBwOFgXdVh4VBa0d9iZ+E1bZB0Bipq
 xo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720028736; x=1720633536;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GhxR4AnmOLb2e8qgt4elcn3tmPYz1HfQBknaKkg9ViY=;
 b=P4wwyXug7D1VCW4rnKyffm3UEGLNxsfYj0bwG7qEbqjjFICaHhMXQtY/vKEMcawkcX
 Bu/3GJRhl2TFOsMIGNTx6y1FRE4u6WDoM0qJz9lqYAPyqUHpU+psvy5yhPZ2euJhuOe/
 Kz8ufwzHtcnBfSPXHIYLR6lG8ho3hgvJbeJAvMSNFy3swH8m2nTnwIRv/HroSs/HRiga
 g+0sXxVksjwdZhwYDBLIJfAuZw+L4gFdcDibTd442Ba78TNe5PJj55+/95/VYWEg474P
 c2dS/iuTyXijQgz1B7sJPGSSF0vFl1Z2qKqRow5y+KLa4q/XOjRf1/Ur3OoV081xS1WC
 02mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLsr8hkhf8kg+Xx1ilvQ5utHN8K1pJqL89SNoUFGkod2K25upsJ58ZE4GQQHl3gVEHTxlQ71jDY2SnWuluiFwRPH7oAjPLLlXPuKieAub+
X-Gm-Message-State: AOJu0Yy18bGdU5XctZR9rey8lD6ZBSSYKJuDwFZqulIM/ZkOmWEQ+uGF
 50zIlbuSQe+vp9PX2cPlYmk3hPK6DgZuSSMwRgHjkldJntxBnBpBApVrwfrLuu6ZP5MUU2QuPWY
 fffYyTpaHKvJYL+7YmS7eJLLtp8yXv0kxlp5p
X-Google-Smtp-Source: AGHT+IGhOytUB8CaG/gAFJEC68exEInJu4ze08dBFswC7EHqqNiHxCYGfnPatnT8gPM2A0u1TbA00DVz/5EvCS/GRV4=
X-Received: by 2002:a81:7c54:0:b0:646:25c7:178e with SMTP id
 00721157ae682-64c7123c013mr127129437b3.5.1720028735529; Wed, 03 Jul 2024
 10:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240630011215.42525-1-thorsten.blum@toblux.com>
 <20240701232634.0bddb542ddea123b48dcabdf@linux-foundation.org>
 <20240702064017.GA24838@lst.de> <e0f384b0-6913-4224-a3ea-bdae784f5dab@amd.com>
 <20240702003357.6bfd1d918c56d536bb664c37@linux-foundation.org>
 <CAJuCfpFCiUfpa45rG74zd-KoQcaA2fwgUw86iSF2CDiFrXCOdA@mail.gmail.com>
In-Reply-To: <CAJuCfpFCiUfpa45rG74zd-KoQcaA2fwgUw86iSF2CDiFrXCOdA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Jul 2024 10:45:21 -0700
Message-ID: <CAJuCfpHJPtduJwOyxTFT9RVmWZCcWULWhUN4ZPEt6earHp=MXA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Remove unnecessary kmalloc() cast
To: Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Christoph Hellwig <hch@lst.de>, Thorsten Blum <thorsten.blum@toblux.com>,
 jack@suse.cz, 
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
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

On Tue, Jul 2, 2024 at 8:15=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Tue, Jul 2, 2024 at 7:34=E2=80=AFAM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Tue, 2 Jul 2024 09:13:35 +0200 Christian K=C3=B6nig <christian.koeni=
g@amd.com> wrote:
> >
> > > yes that is
> > > intentionally a define and not an inline function.
> > >
> > > See this patch here which changed that:
> > >
> > > commit 2c321f3f70bc284510598f712b702ce8d60c4d14
> > > Author: Suren Baghdasaryan <surenb@google.com>
> > > Date:   Sun Apr 14 19:07:31 2024 -0700
> > >
> > >      mm: change inlined allocation helpers to account at the call sit=
e
> >
> > Dang, yes, that was a regrettable change.  But hardly the end of the
> > world.  I do think each such alteration should have included a comment
> > to prevent people from going and cleaning them up.
>
> Sorry I missed this discussion. Yes, the definition was intentional
> and I will add comments for all the cases which were changed this way.

Posted https://lore.kernel.org/all/20240703174225.3891393-1-surenb@google.c=
om/
adding clarifying comments.
Thanks,
Suren.

> Thanks,
> Suren.
>
> >
> >
