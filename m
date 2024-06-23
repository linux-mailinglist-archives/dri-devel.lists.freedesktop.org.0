Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8503991375A
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 04:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB50B10E533;
	Sun, 23 Jun 2024 02:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jXJhaaMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D78A10E533
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 02:30:08 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6b52eb2ee2eso4184086d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 19:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719109807; x=1719714607; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WM541qVAnGiANIIksD1Xne6uz5S+eheGdJIN5eBGE8Y=;
 b=jXJhaaMW8L0D/STRepa95GOSINvD/qbIIF/l644H1E7ehhgCPpNcu4UtudVC9FOia7
 toPxMCkddLWcQCQ7mfkZc6GYMs/tasHlSWii4RLVxc9Ep/JWMUBYUzE+YUhfBTQ+BTLB
 347OORALH6REGpW2yNp/qRTzSyZbmYqskHB0ylBFlv4amC7cYI4lWXDNJYX/Tr5nm4sF
 BAOAHJ7Knu78BnEuEuXKG/MqFzrwxqECv8n4bV3EFSyXomUu8cvoztCc7pg7yDxHZnvd
 uNiy1K/u2S6bcNBrW51apg1mmz8pVkVGUCqSJIKcrt3NUl3zN/d8dMLDNqs8MEr1fczb
 oRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719109807; x=1719714607;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WM541qVAnGiANIIksD1Xne6uz5S+eheGdJIN5eBGE8Y=;
 b=ajKgz6imhglgG6vEwvb9Z2sPw3FcdGl5LJmBF+kTrhL+JKQ6rlcneK1VHVAOJ3SzfA
 ByMtsm+zBDKCpUELQZjSrJ/6JI9i5voUv0719i27JeFDD2T/mg910J7att9wM/YkVbdD
 JcI9CFl9JS0o0L5Up3hkxNCGKB+Nbl42OWIWPvgmpF5DJZrLDdsmPcy6pcjSzuTWyAsR
 JoXVlpaH/Jhx/1RtQbLFsyCzhDftM+h5TOSeFSCP+NBUIfz3Z/axjgCdstHI5pBiAtYa
 T9idQZPTFvFEbJzysrWGl+4EvJDATp4T5ByEcSBM+6KOVHV5b2eUYJbOcuI4YCZ5gmob
 v0YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWORQuB34DkTISenQs1ZauZUz1IcpCzUepEbp4AHE+jjPx1tEf4HV5b+mek/tbEzLgTJDpBIkDZnNOpsGhsRG2u0cxB6tBPb3+xdDFmxwnI
X-Gm-Message-State: AOJu0Yy9t/KMv9e7M5CLrYnjx+rKyBnFUYyOXcZsdLAdO/1Vn415KS3g
 799yh4UUILsPaC+0zWJib2osTDdo7Nxst94on+CS5R0taDB8M/I0w3wZ86ATmV1cOfZmvxUAvjv
 jzppmpNiVOwi0MxxoHxSMwccyKg8=
X-Google-Smtp-Source: AGHT+IEeabbh6/EMckVo526ehLQ90tgELbRwQuFwnoLikHZJL17E+5jYV7YmCBYvSb5so7hxOyIwV/nrsBs0ESAd1BE=
X-Received: by 2002:a0c:e1d3:0:b0:6b4:35fa:cc17 with SMTP id
 6a1803df08f44-6b5409c7b57mr14480146d6.20.1719109806997; Sat, 22 Jun 2024
 19:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240621022959.9124-1-laoar.shao@gmail.com>
 <20240621022959.9124-7-laoar.shao@gmail.com>
 <ZnWGsw4d9aq5mY0S@casper.infradead.org>
In-Reply-To: <ZnWGsw4d9aq5mY0S@casper.infradead.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 23 Jun 2024 10:29:30 +0800
Message-ID: <CALOAHbC0ta-g2pcWqsL6sVVigthedN04y8_tH-cS9TuDGEBsEg@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] mm/util: Deduplicate code in {kstrdup, kstrndup,
 kmemdup_nul}
To: Matthew Wilcox <willy@infradead.org>
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

On Fri, Jun 21, 2024 at 9:57=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, Jun 21, 2024 at 10:29:54AM +0800, Yafang Shao wrote:
> > +++ b/mm/internal.h
>
> Why are you putting __kstrndup in a header file when it's only used
> in util.c?

I want to make it always inlined. However, it is not recommended to
define an inline function in a .c file, right ?

>
> Also, I think this function is actually __kmemdup_nul(), not
> __kstrndup().
>

Good suggestion. Will use __kmemdup_nul() instead.

--=20
Regards
Yafang
