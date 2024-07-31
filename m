Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4A942472
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 04:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BA810E104;
	Wed, 31 Jul 2024 02:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kgNx4S5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D212010E104
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 02:15:25 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6b79c969329so26034746d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 19:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722392124; x=1722996924; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpOoG/RLrOqlfYfTau1ZI4Yg/763W2V/48rNlpEaGLo=;
 b=kgNx4S5AywEvvJPe/QX01Upm0zAS0+dJcFEkSDjvLuGIMxNK3tYmJJ5vUl9hJ7bnv8
 B6zCiescyZhcfcem0hij+qboZ8Kqnhr88I3u/lmFzdIC+Y4+8kESzDObaWjB9yPWvE1o
 36IBisZ4NEBq/5c+gxyf9BeBSrCV1dck4EHHkJsFJJjF8ObE4pCDZWrNPlHLETGC0Ewn
 Yzuvb7CGPpW7KED/yP2ukTSdLS2xWrpvreuB6RsQMj4LMgeQP3rzo6ArhuP182qC29dv
 DpgGy90mk726zKi3Tq+mM500wWOAf4TVClte4dlPnIbHUcYfbKMPHNmT+lmDukXMlsEe
 TqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722392124; x=1722996924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bpOoG/RLrOqlfYfTau1ZI4Yg/763W2V/48rNlpEaGLo=;
 b=FZ3C7BdG6vgPJinYEr/zU4Y62jEd5Szqax8jXj+uF1PdKkfw+JNOi4hxtemp870Jhc
 Ky9ElUQb9O8ylBMTtwpxwQ1v44C4P49OjqVq5j5KneZknqbnGXcdyg1DOVMZm9G9ikmg
 KCziVcVMpEhvtqzHybh4XTyKANJqOwwpI2s+yop9+pJYGClC54ChX1UfqsOlvfpCAbux
 RPhinfTUKSxgbZsL61jdXlw9Sh/aO2LaxNE4Nywa4VKg5omsyYQx68QQ2zrWBJfbJBSj
 C8nsoFgpLQs5oJm9JRVa+ew2x/lhjuxu1m26ND2uipBxtaUsq3nh+XmUwcyteo5hrwhB
 TxRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7qVMs9YpjJuAswj8johixtc/W/Vucx4tODvMLQW1lOOSeeS/eowjYXJkTUjvuPXabdIExYqxhlfkE120/rbgv/nGQOQeC2xLryiayA5gK
X-Gm-Message-State: AOJu0YyVvcSm1sWcSEwVFDPl/kJQh3vJ4c82CSBdaQ5xe8oZZM945SXQ
 aKE+kek/cgPn/ks+NB6SZm/urAVNtQj7dI6dHJ1OPasQsPM4QeHCjGpp6wbILnon4KbBIYBibvy
 ZPhOp0/iQ1WmYV/mp297MStDPpK8=
X-Google-Smtp-Source: AGHT+IExK4nk1O4rGXBVJI3hTBgaSm4OMa/Q+JI34XmOHqthammrX2+56ouv+IPsoXJAUAPqosbOqNjTYsvBgTnKXGc=
X-Received: by 2002:ad4:4eed:0:b0:6b7:b3b8:e882 with SMTP id
 6a1803df08f44-6bb55a5c953mr178760546d6.25.1722392124637; Tue, 30 Jul 2024
 19:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240729023719.1933-1-laoar.shao@gmail.com>
 <20240730175927.673754c361a70351ad8a3ff9@linux-foundation.org>
In-Reply-To: <20240730175927.673754c361a70351ad8a3ff9@linux-foundation.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 31 Jul 2024 10:14:48 +0800
Message-ID: <CALOAHbBiYPNaULVSR5DS=XE=C28DVmwZC48ZZ4DhOf2SYqkz4A@mail.gmail.com>
Subject: Re: [PATCH resend v4 00/11] Improve the copy of task comm
To: Andrew Morton <akpm@linux-foundation.org>
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com, 
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com, 
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
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

On Wed, Jul 31, 2024 at 8:59=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 29 Jul 2024 10:37:08 +0800 Yafang Shao <laoar.shao@gmail.com> wro=
te:
>
> > Is it appropriate for you to apply this to the mm tree?
>
> There are a couple of minor conflicts against current 6.11-rc1 which
> you'd best check.  So please redo this against current mainline?

I will rebase it.

--=20
Regards
Yafang
