Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D29A9D878
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 08:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740F810E345;
	Sat, 26 Apr 2025 06:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f2lZg9L2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7892410E345
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 06:44:48 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso527719166b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 23:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745649887; x=1746254687; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fHME/bRjyKN4oOcPRa/rPGLvfmF0pdDHAEiwSl5KEMM=;
 b=f2lZg9L23Nq1kCJYlpnK4Cfmy78jw0wnqwh8GcP+cpnTjAAq0nNaqXyt1w9VkVVLBt
 j3zFEvXUDRbmoCic8fU90A+qwp9JWJZInXBddIW67NgiSTMDc617d6y+RgjURG1YpVpU
 KdcYpaQoVk/WhNyMJNfmCr1XQBiUGrxgTyv9Vyvd38/TdgWmIP/VbG+UyPi6EQpEFnhB
 g6PF55APQgU/yPcnrf7FHWv+uVnD15MX5Lza1uOITf/ZUTef5SlYr1qnoN+aruBna/8y
 wtNZMRhGmqgjeIxiuHyC5ao9vOedzMqcHC++2DJAJhQwlKiAMtG5eb3tgZtrWzG10g6u
 XO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745649887; x=1746254687;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fHME/bRjyKN4oOcPRa/rPGLvfmF0pdDHAEiwSl5KEMM=;
 b=XPFvlG5jXQy+J7H4ar8oNG62lelzL0apoS9WtsnQbuwVWfNbpLu8bX+7iSSDVkOuPM
 JK9hDT1E+BLQxIK+aicKmCyEzyWI6BH9+c3pYMTnEPVQCLh43NwwYuGnyUM+OUo7vezj
 Xvjd64wnkbkU79bRhSPcXKWC4dy5qLdASESKZjbY6mplxGxoosyYiXCV5S5Vq+ZqyGFy
 FoBK6i1lm5ISSvbCoKJNgLh0EGl3hMlr+E+i/W1ibqQUcgdAVDEsThVbV1s2jzmmTMRS
 nB55e1rArPMX7bSayyCX8NEEI8FPpLa3grD0qkvil/QGqQy6menBj9VgFLWJgREaOsSs
 MVLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhUbeAsYegMBtl/otEbt6wiAQxuXE7xOX9X5AvKObWaZf/0uot6nlIq6uEPnTqzkoKY7xgOkZhqYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYj4oo/vAeuTWcZQADYT4IfgEmnzk2DVAEE019FOaIl1RowTU8
 kgBDX5XUnUaKVwcqslt5VVAxGCNTlGJxDTJThKiNMPUVPVh143MaVHMy83CVNONkT2to+2ONLCe
 K5DAPsRpCrfVMkQ1OBNAuFw0U40E=
X-Gm-Gg: ASbGncu8M4VIEGWGSsz7F5leSQZoy2eUe+YlDeUhL+HDyPC6AuQzN2UPz4Z8CQ1BEly
 vBT98J9RJX/uykaYx3RIGMJxNMZhJOLHehKDKYxHojpKT2hy8NVcJ9NTwRY2FaiZGql7k0PjnFx
 TLRvUpk4GlQykbkSduQ+g7
X-Google-Smtp-Source: AGHT+IESh3rZBLgETKRl1ROeDzX/G34K5wtO+8A62nhS30IUp5WyZyK/IFihKomh3aMZd2O2VekZK/I1Rrr7DOCs5uc=
X-Received: by 2002:a17:907:6d0b:b0:ace:3214:fed8 with SMTP id
 a640c23a62f3a-ace73a6becbmr418087566b.27.1745649886436; Fri, 25 Apr 2025
 23:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
 <CAHk-=wj+h6i94DyxGQ2Ez6tvp2sBs70EfY7Lp0N1umpwHL_VrQ@mail.gmail.com>
In-Reply-To: <CAHk-=wj+h6i94DyxGQ2Ez6tvp2sBs70EfY7Lp0N1umpwHL_VrQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 26 Apr 2025 16:44:35 +1000
X-Gm-Features: ATxdqUGHpE4_NBal-qN1lACXwjo5KPm8TJfghSYA-Kyv4pw9bObhP-z7YybwtSA
Message-ID: <CAPM=9tx2XsDNFDWkxndpFPNihgf18CK7Ps85vE4ZRvuLBG35UA@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.15-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>, bentiss@kernel.org
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

On Sat, 26 Apr 2025 at 10:56, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 25 Apr 2025 at 16:12, Dave Airlie <airlied@gmail.com> wrote:
> >
> > Weekly drm fixes, mostly amdgpu, with some exynos cleanups and a
> > couple of minor fixes, seems a bit quiet, but probably some lag from
> > Easter holidays.
>
> Hmm. Is freedesktop.org feeling a bit under the weather?
>
> I'm getting
>
>   remote: GitLab is not responding
>   fatal: unable to access
> 'https://gitlab.freedesktop.org/drm/kernel.git/': The requested URL
> returned error: 502
>
> and when I look at it with a web browser, I get
>
>     HTTP 502: Waiting for GitLab to boot
>
> and it talks about it taking a few minutes, but it's been going on for
> longer than "a few minutes" by now..

Indeed between me pushing this branch and you trying to pull it, it
does seem to have died, I've pinged the appropriate authorities.

I've pushed the same branch to

https://github.com/airlied/linux.git drm-fixes

I can try to create a pull request from that if gitlab isn't back tomorrow.

Dave.
