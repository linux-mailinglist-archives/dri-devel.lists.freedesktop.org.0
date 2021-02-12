Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C32731A04B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 15:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5026E17C;
	Fri, 12 Feb 2021 14:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5E56E17C;
 Fri, 12 Feb 2021 14:07:36 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id 30so2909990uac.7;
 Fri, 12 Feb 2021 06:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZZgcR0GXQOuQH7akp/dBCCzUPB9l3DB+PduIt221Fus=;
 b=LwSJnQ9Rf7hYrkwVZMRDzruVm0i2SDp4GtwQaF5CkTY3sHxUJlqfaTiUG7vBZXAysI
 WOoNc4c7DZJ90E9NDXYemZqoZftzw8SueDOMpxFaprmEeIWxuupOI48xua7PFgZI8TS2
 MuCOrmK594Wcb0qTFn9LPw7GwTDNCwh9ncvLk+z6UtHWdktN5PfbBC/eqFOXGzQgSFRX
 6mL3Xf0H7pWjn/qdsrKfrV6cCXfXLaCFmLaPkchfA9iTlodzvz2zBkByjRw0CbCAg6C2
 v4D6aUG3BvdFwACvMlf+yXZRTcYmAiy+DnflKtJ+Lel3IL+BqQIuvkeYDunVhLXs8/TL
 78+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZZgcR0GXQOuQH7akp/dBCCzUPB9l3DB+PduIt221Fus=;
 b=RVXru1YL0RHJl6ukUNLvbbwTTFv7QQ8SMnEvZKmM9aka6yBnygcG/D5go2VQtzgBR6
 sfggL2BU97jc50aiEA/42+eNiaAWKer48wi9LnYso0JOAox32Qq5UIjCOwsQpvLD4UcK
 0BbRCUd18rbqsJH14iSQdw+mLRJWhcBUv9LVc/2a3TFtG1kyJY0bxHvnqF71VxH5UEAC
 ji26QRf5kamkkE4pq+ggDnNklRdZsQTTqQFkzKwnqp2KGlNyP9gKp51C3RqZ0tbnNNyA
 mvMP92tsyEltx9RuBDDK1WZCVce2ZmaHsyq1o/HqOZk3/1sS+EEhOGTf3fXYCF7Cxjz/
 +oWA==
X-Gm-Message-State: AOAM530wEP5PQpeL3jUzWrnF4AFOvWnDHxap10S5F94e2SSVWAtyUQ1E
 6wVT+mA7IQQPuCUrz8dWtz/Gfw6t7N5VvnJidEI=
X-Google-Smtp-Source: ABdhPJx92cVtlR8nyOwrnpqoQUY5gXSHyY10cEr8vAqdJP/vf9c/d7G1G7CJoeOQjImt0yesSCuQ+D8ttFlZsja+xBE=
X-Received: by 2002:ab0:338d:: with SMTP id y13mr1550050uap.64.1613138855360; 
 Fri, 12 Feb 2021 06:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <20210205220012.1983-1-chris@chris-wilson.co.uk>
 <CACvgo52u1ASWXOuWuDwoXvbZhoq+RHn_GTxD5y9k+kO_dzmT7w@mail.gmail.com>
 <pIyZ-Jj7O2MYk1vKeyghnFmiFWk_5ZWm-Ze1gUqdDaXzImOVjVdjPh2uyHa-sxOPovRk1ApSKk_5zKBvOrzoSwXeXUu0LbZ75Q1D3gIK2Kk=@emersion.fr>
In-Reply-To: <pIyZ-Jj7O2MYk1vKeyghnFmiFWk_5ZWm-Ze1gUqdDaXzImOVjVdjPh2uyHa-sxOPovRk1ApSKk_5zKBvOrzoSwXeXUu0LbZ75Q1D3gIK2Kk=@emersion.fr>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 12 Feb 2021 14:07:23 +0000
Message-ID: <CACvgo50Bki0GKW0SNjzn9zieWqHO=curbVhkL0ALpA_d2E5bfw@mail.gmail.com>
Subject: Re: [PATCH v3] kcmp: Support selection of SYS_kcmp without
 CHECKPOINT_RESTORE
To: Simon Ser <contact@emersion.fr>
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
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Cyrill Gorcunov <gorcunov@gmail.com>,
 "# 3.13+" <stable@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@amacapital.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Feb 2021 at 13:14, Simon Ser <contact@emersion.fr> wrote:
>
> On Friday, February 12th, 2021 at 1:57 PM, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> > On Fri, 5 Feb 2021 at 22:01, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > >
> > > Userspace has discovered the functionality offered by SYS_kcmp and has
> > > started to depend upon it. In particular, Mesa uses SYS_kcmp for
> > > os_same_file_description() in order to identify when two fd (e.g. device
> > > or dmabuf)
> >
> > As you rightfully point out, SYS_kcmp is a bit of a two edged sword.
> > While you mention the CONFIG issue, there is also a portability aspect
> > (mesa runs on more than just linux) and as well as sandbox filtering
> > of the extra syscall.
> >
> > Last time I looked, the latter was still an issue and mesa was using
> > SYS_kcmp to compare device node fds.
> > A far shorter and more portable solution is possible, so let me
> > prepare a Mesa patch.
>
> Comparing two DMA-BUFs can be done with their inode number, I think.
>
> Comparing two device FDs is more subtle, because of GEM handle
> ref'counting. You sometimes really want to check whether two FDs are
> backed by the same file *description*. See [1] for details.
>
Thanks for the correction and the reference.
Seems like I've short circuited file description table vs file descriptor.

Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
