Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80655B16AF4
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 05:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6591B10E243;
	Thu, 31 Jul 2025 03:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WULw3goi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4878C10E243
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:47:55 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-615622ed677so636230a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753933674; x=1754538474; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TipReVIbHYikOGm96b9ccV0Al10yALQ5vwodidB34xQ=;
 b=WULw3goinyrGK6mi+v2eaECIfeJo/3h694Z6XP5CVZZdUxIaqzWlZRMKDfnxBrK8ni
 9TsAlBHz8K7HVotJnYArtRUb4X0gFlKAoo/9BoED5tU594wNVVIqJg54a7UYfuZoCtX4
 RMk+zPu9RaMSPlKhUulXKXp6PtDXitf9p9ygjj443EAbVUsQG4lkbEaS0HgXU/jHbNuF
 PixJ2A3cgek2N8UbeEiUx588D9WAOo0aX3378I/t9rw8Qm1VnR+UZ4tif37fiDGPATRF
 PtJZJrJUE39AD3rNNYD0C67kGb6zxsv5P7LV6HkHnO1Cx+ym/dCSafk9C29YCeqHsTy5
 ecnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753933674; x=1754538474;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TipReVIbHYikOGm96b9ccV0Al10yALQ5vwodidB34xQ=;
 b=QQPUT9fxAFZsoyH1oUmwo1UOXvvOPYqOjxoFBlOyBiqwbNqkxDCyRnicdY6JS6Weh9
 Yu+GZ/zAHsoyBn5aWhmKZxWJKPNsW+SS4saHAfpr6Cg82gxIcGFVnv86yImvQ0fwDqAO
 rks9BeSYB1N98N3FhpJysbEHcwOsId/iIhF7VZDyU/8WFjzCMlfYdA72Sq7RmA/btwY3
 6Fekz+bAeMh0N2+1PbRe+5GAKVRuJIuimvXC7esKZSuIwlw5oI36VLTkA4r5IbkTXEEw
 G+mzplkffx5bvUdtzoruTgYWPUNoz+KqRiKldap6iyqAanXIt+vwLIAIBvVyxO8pJ5BS
 XDCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtSd5ZnchyyepeOY5yguUljOki1rKE05zUsNLgqOeYGnqPNfhzP19Af0j1N1qcplH5pnaFnWYVJnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx64gjQEFBz7ZRqoOkaoPXuK/AernBkhXxpMbPQSxV/tDHO2X1B
 VJR5hcfeQqPbbh1K+XZyyi7lE/UHJJgcMZ3yhYC8ZNHVk7vswqwpaKZmboqNX9rc6ZzixEoeo83
 wqzoszwYw3UHVPDOT+BnrlN/J0OWepiU=
X-Gm-Gg: ASbGnctWkmuHEsU+/3M5oa33ENgWizexVcDKRhaK4D4PD1Ce6JmBmK3+XTUFVQmzP44
 uAods/nu4vs1NenFj19eyRN1gvHMkHxy6lJmu8GiTBOwGRqq8oSzA+36zIyxqH+kU46oqZx5r5d
 mG1VCIvFrgjiPWzOqwA6zpGF+mH5LCuv/KUsld3yCAfX9eq/RJRW6LZcrCPHID5Dn3CJXqtR1Mu
 /yULYiUBzC9UgEK
X-Google-Smtp-Source: AGHT+IEvTAydO0B8dvzIZ0V9dPskizzLo7/Pc73sLswWKrpceGhyGfj+u9TePveB4an+PFx0VzXm+x86pMJ7Umh2hIY=
X-Received: by 2002:a17:907:7ba3:b0:ae3:7113:d6f1 with SMTP id
 a640c23a62f3a-af8fd77fd70mr767905066b.25.1753933673729; Wed, 30 Jul 2025
 20:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
In-Reply-To: <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 31 Jul 2025 13:47:42 +1000
X-Gm-Features: Ac12FXwzj7aR8cH3Q3BwHUffq5oqwa0xpVNoHkTPAr_dHLtsTxCt0qqTKuewNo8
Message-ID: <CAPM=9tze2EcWTyi7VZxEY6Ys+YSrep4U15TtizZghFSD6eWjsQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Jul 2025 at 13:41, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 30 Jul 2025 at 20:05, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Again: I'm not going to guarantee that I got it right. I *think* I did
> > - I'm not feeling particularly unhappy with my merge end result.
>
> I spoke too soon.
>
> I'm very unhappy with the end result, because it just results in a
> black screen at boot for me. No signal.
>
> It works on my laptop (Intel i915), but my Radeon desktop is very very dead.

Is that the Polaris card still? I don't think the merge would cause
too many problems in that area,

I'll pull out my Polaris card and run some builds here as well just to check.

Dave.
>                Linus
