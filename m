Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C914237793E
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 01:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814DA89BFD;
	Sun,  9 May 2021 23:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A7789CD7
 for <dri-devel@lists.freedesktop.org>; Sun,  9 May 2021 23:28:20 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id r9so21767923ejj.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 May 2021 16:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lBFJrqe7bHT5+gn4IcxMShBG7BogSn9qx16JG59uH0Q=;
 b=X3WBc/yNTPCTAZal/4i8kU9SAkAsXd24twdgeu0i2VNzHRnu6ILggUBX2B5jrDB3DE
 1mZ1INALsjCd60UsD7iqEjCo0xsidaHBlKQJrnyqnbK6jvf7sLeIUaFRDVIaQh3Y/WsV
 vUZtjCa1Ha0TE8iKg9mZVJ4iZo9qcrzV520qDzmgqDpfiEgeUzPRhn9HxXaEiw9btMUL
 AMCKiN6sy8+uciNwxOHB1IoreTFJIcxiKcg8stM6+UF9O+Vt/iyfOH5X3i4PTBCuCIA5
 nvQvhpn9SoZoYsc6MHXBrW1YNmCHqcucWfvwPKBlwf2s9Vz1WSEwhiJ5EUVNRMxtzrUE
 /Tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lBFJrqe7bHT5+gn4IcxMShBG7BogSn9qx16JG59uH0Q=;
 b=dcFXzD4kttpycGhGDHRlKRLwWfn/rufTmA6rPbNDyiPqqKuuJFwv+YIKJbQHpZBiE9
 Yva3vL6bjbSKleKmKQA46YPeBjeZJt71350Q4qnAsgSJbXMuirkbToErMp7/HtAkOn4W
 LYanEpjQ6cSHXs1OvgPphjVmk31yvdnJ0DohR5tZTaTmUpqZvAma7T1n7sA6tAxvU3HX
 aHncQOS7NRvcOZcS0r4IiY8rNd1GtGU0yaBhimy8EKmxi3h2jOqKJSqybOJxo2yNTN2k
 4j5eaFifKLwIHFNqJOlKzvr2IJR5O/PhvMLDSxRIbHg40KJ6F/5xHfFMt4amwvm6WyiV
 3D/A==
X-Gm-Message-State: AOAM533dRxG6yI55XmdtJdFbOK8fbOe+0wUhpqLzSeIW2howp+7KJ7bw
 A5o8zMb4LKNMtEW0qvmykugdm7QuamXyrCwOMHM=
X-Google-Smtp-Source: ABdhPJyp04FFC+8e4/ADV5BBAh+WBx9ZhIH7+RLgA7JIHlPGdBi+MXd809EgfD4TLG8+f1ElZoVm6MNK3c80tDba6Rs=
X-Received: by 2002:a17:906:8285:: with SMTP id
 h5mr22488211ejx.456.1620602899126; 
 Sun, 09 May 2021 16:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twAN82gkzrfc2CGQopjkjEdWtBKMF2DgBOtw+6RsZ++fw@mail.gmail.com>
 <CAHk-=wgf+kHeSZbpkZumWcTXUD7ordqTMvPRNL6aQVG1DSBDnQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgf+kHeSZbpkZumWcTXUD7ordqTMvPRNL6aQVG1DSBDnQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 10 May 2021 09:28:08 +1000
Message-ID: <CAPM=9tyji5UqZu4hV3gGNKpm5aTgau7oED9wMWqK8bjVvon_NQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes round two for 5.13-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 May 2021 at 07:08, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, May 9, 2021 at 11:16 AM Dave Airlie <airlied@gmail.com> wrote:
> >
> > Bit later than usual, I queued them all up on Friday then promptly
> > forgot to write the pull request email. This is mainly amdgpu fixes,
> > with some radeon/msm/fbdev and one i915 gvt fix thrown in.
>
> Hmm. Gcc seems ok with this, but clang complains:
>
>    drivers/video/fbdev/core/fbmem.c:736:21: warning: attribute
> declaration must precede definition [-Wignored-attributes]
>    static const struct __maybe_unused seq_operations proc_fb_seq_ops = {
>                        ^
>
> but I noticed it only after I had already pushed out the pull.
>
> I'm actually surprised that gcc accepted that horrid mess: putting
> "__maybe_unused" between the "struct" and the struct name is very very
> wrong.
>
> I fixed it up after the merge due to not noticing earlier..
>
> Maybe the drm test robots should start testing with clang too?

My current build, test + sign machine " 09:23:22 up 419 days", running
fc29, has clang 7 which is my current blocker on implementing a clang
bit in my build cycles.

The machine is in an office, that due to RH not being able to fathom a
country where COVID isn't rampant, I have to fill insane amounts of
paperwork and high management intervention to visit, I'm afraid to
remote upgrade or reboot it unless I really have to.

I've some rough ideas to update it to f33/34 which would give me a
good enough clang, I suppose I could just build my own llvm/clang I've
done so for years for other reasons, if I can't come up with an update
plan soon I might consider it.

Dave.
