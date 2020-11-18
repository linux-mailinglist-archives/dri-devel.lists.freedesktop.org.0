Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6622B2B87A4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 23:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A9A6E4CA;
	Wed, 18 Nov 2020 22:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F966E4CA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 22:25:37 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id d18so3720321edt.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 14:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WhgF/IA0ylKv3857epiQSft8PVt9PvfZJmPTqKtYUWk=;
 b=lHVpf+IiHwYzA5b2OP4M6pDap5B/AtrWq259lzuNt/iFOBJckQFbHahg2TbM7C3fUk
 jt8tAZRAlM4e8jW12z22NXCGWzGcrwj+UxW7c730jXr9p/3+EoLaB+Td9qGgUSld9KvA
 4QvZnmpycwpZhkePUWXdnlRI8zI9+0/sVZrWPti9U4JARlXj0FZqPeDN+SpTVmdIhVm+
 I+GR2gcZYaLcHFVPKysWhJ5cDdaxY2aXrDZqtX3Xq/x3QplSUYwLxbydVXO8Pf2+OTZw
 rWKO8B6ZBGrj/rRD2eJdbz3jGsFP9VInz//nuvEW0Q3NZaO+hABVkaPXCfV6awF/Gvy+
 Agbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WhgF/IA0ylKv3857epiQSft8PVt9PvfZJmPTqKtYUWk=;
 b=bD8Ecr5Sj9XyfTMl2if64cmAI292NpcYuOyQ7RLQ7Ga1lQ1iAwHclrjRCxXKFbpm5l
 g0jZBVlVSS75sqM0HmCBWeWjsgMZWw6vYga68QxYgvbQpA52c55NBHqY6O1Spjlm+zrC
 Fut37ymNFgYLq+biQUQ/vTCL4zg09jqpG746uJbtJ0LvrTckdylH5n3e1hbc1XrYI5kp
 naNabvvdJfpjkx0XllCgosDkZYByxd44NiNYqKA0oHsnb80W+YZAI4hO9xEIoiglVXYc
 RebtmwXApYKTZWxK/VqRRalVrqrDzxtPYJx3SBPdZpHTkCdMXc2qjDnGc2ZxCZUlx5Nm
 Jmpw==
X-Gm-Message-State: AOAM531XSQI91mirlxm/WhmkZajh+35s/e00Xfbx/e+PUAJzQglga28R
 vbNKh1kgZmGzY9WZOW3N3qRKNIy8gQe0oUrkY0o=
X-Google-Smtp-Source: ABdhPJzOwvJ+BSFzbS/tue9emcVc7TGxC//Fwu5s5V11amStH73YCO5SCGLGsDa69pJbMqqzH8QEG07gTGWiefYj9FQ=
X-Received: by 2002:a50:d516:: with SMTP id u22mr7772043edi.127.1605738336474; 
 Wed, 18 Nov 2020 14:25:36 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wjFfAktnadOPb_iV5nKh=V5Am1sG-gciYveswRtuEkrLQ@mail.gmail.com>
 <692820a49ded436591b5fe3a18c68a5e@AcuMS.aculab.com>
 <CAHk-=wgQY7k_3NVCbaSmiJyLiAV_1TgwLk-d4QRMHMWqM5Oo_w@mail.gmail.com>
 <0a10da3d-085f-c7a7-0053-dc1e9ea871ed@suse.de>
 <f7be660da595411ab60aaa4b76008769@AcuMS.aculab.com>
 <CAKMK7uFZhVqEzjfHszQ=1KeoRecXSDa0+tdH_rT8yENY9zasyQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFZhVqEzjfHszQ=1KeoRecXSDa0+tdH_rT8yENY9zasyQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 19 Nov 2020 08:25:24 +1000
Message-ID: <CAPM=9tw7_BU1_mUVa8ZeqsXfsN_cODsTzTAXiQkDGT+i1v0JaQ@mail.gmail.com>
Subject: Re: Linux 5.10-rc4
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: "Huang, Ray" <ray.huang@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 David Laight <David.Laight@aculab.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Nov 2020 at 08:15, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Wed, Nov 18, 2020 at 11:01 PM David Laight <David.Laight@aculab.com> wrote:
> >
> > From: Thomas Zimmermann
> > > Sent: 18 November 2020 19:37
> > >
> > > Hi
> > >
> > > Am 18.11.20 um 19:10 schrieb Linus Torvalds:
> > > > On Wed, Nov 18, 2020 at 4:12 AM David Laight <David.Laight@aculab.com> wrote:
> > > >>
> > > >> I've got the 'splat' below during boot.
> > > >> This is an 8-core C2758 Atom cpu using the on-board/cpu graphics.
> > > >> User space is Ubuntu 20.04.
> > > >>
> > > >> Additionally the X display has all the colours and alignment slightly
> > > >> messed up.
> > > >> 5.9.0 was ok.
> > > >> I'm just guessing the two issues are related.
> > > >
> > > > Sounds likely.  But it would be lovely if you could bisect when
> > > > exactly the problem(s) started to both verify that, and just to
> > > > pinpoint the exact change..
> >
> > I don't quite understand what 'git bisect' did.
> > I was bisecting between v5.9 and v5.10-rc1 but it suddenly started
> > generating v5.9.0-rc5+ kernels.
>
> We queue up patches for -rc1 way before the previous kernel is
> released, so this is normal.
>
> > The identified commit was 13a8f46d803 drm/ttm: move ghost object created.
> > (retyped - hope it is right).
> > But the diff to that last 'good' commit is massive.
>
> Yeah that's also normal for non-linear history. If you want to
> double-check, re-test the parent of that commit (which is 2ee476f77ffe
> ("drm/ttm: add a simple assign mem to bo wrapper")), which should
> work, and then the bad commit.
>
> Also is this the first bad commit for both the splat and the screen
> corruption issues?
>
> > So I don't know if that is anywhere near right.
>
> Thomas guessed it could be a ttm change, you hit one, and it looks
> like it could be the culprit. Now I guess it's up to Dave. Also adding
> Christian, in case he has an idea.

I'd be mildly surprised if it's that commit, since it just refactors
what looks to me to be two identical code pieces into one instance
(within the scope of me screwing that up, but reading it I can't see
it).

I'll dig into this today.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
