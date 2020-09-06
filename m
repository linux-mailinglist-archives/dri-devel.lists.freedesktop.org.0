Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6178525F084
	for <lists+dri-devel@lfdr.de>; Sun,  6 Sep 2020 22:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC716E146;
	Sun,  6 Sep 2020 20:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41316E146
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Sep 2020 20:33:56 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id nw23so15362211ejb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Sep 2020 13:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1u31zWVb/xtq4zWR8IqXITU9cST43X1jVmMQ6Khtjc=;
 b=AAEd7uDisMvj4IWWY6cwd8eKB+Uv8KPC+pbb5PxuYD1RHISfNs+aPzznszKIKHBqoK
 bJsnaBlytKPe8VEi7sCD0zvUhBp9pNeAlGklp2wW3TG/fSLPVxRfqPmvADw8h0FhmCNM
 vJ7He/a/9u+mkXEuu2fw4WwhGfjCXRvkmnxoYVgcx6GD9bkY5yVmgzcQWbZOcXHb2Nxp
 C7ag1TinV+RKEGX3W1p+1gprj4db+2JWvMw1T2uF5rYDTAtM+g2GrHWyI2sCNTYwCEuH
 j859J70xtr6YNFWUZ549ZzRwA92/bXuOuZAKCT6y2jRX7+RpcuzylfAj2mXOotcmr922
 vjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1u31zWVb/xtq4zWR8IqXITU9cST43X1jVmMQ6Khtjc=;
 b=PDPmmuMv8Ms0dvDPpp1dxPowZZe1ve2NINpcPX27GInlwwIysln/679Q63un0yM2iE
 HczbqcVx5CFqHKExWrj7Kg9HEpZvy2mlKegZypw97aqdwbdK+3hMEFKatCHGNKl0Dn+b
 GQDd9mrel1u83Tjnz6bukZjtt72pn01QUcHisdh6HJlDwMDjqKhYPsv8ZAfI6bhAjNST
 zr+fPI5GA6/ajv1caix+994WR+Rq6yazY9S0tx+NQwpyGPVbuZW5+LS2iVoIGxKVJXnG
 r5v7Wf0Q1HT6MHKHOnaAVAEeC6166yGwZZrB6VYyMfoAGdEuAkA6vFNeKC9jPCdZ/NMn
 Eo0Q==
X-Gm-Message-State: AOAM533eKTOeOl/zl2+Sa+DsQpRKcp7VkKJLRMYXggMrUvQDE7tUJmst
 v9o/NOGcMfVfZLk4QMoN0Wb13IyWcUZvRCQ3WTY=
X-Google-Smtp-Source: ABdhPJxAue3rsrq47sfL7omIfmy8aw6NF/OD0xZvrgtLITJBii6+t2OQIFBK3GPcND0H6OJvig0iUSQasoRFiOHwlPM=
X-Received: by 2002:a17:906:813:: with SMTP id
 e19mr17716996ejd.101.1599424435566; 
 Sun, 06 Sep 2020 13:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tz0whDeamM+k_8Wu8TVzz0TDr+qMNMXo8rKeeNRKxBuiQ@mail.gmail.com>
 <CAHk-=wh2EH9DKRpJQ7+X+NWjjduLPy_Ncv1GzxnXBg-3mTn0Fw@mail.gmail.com>
In-Reply-To: <CAHk-=wh2EH9DKRpJQ7+X+NWjjduLPy_Ncv1GzxnXBg-3mTn0Fw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 7 Sep 2020 06:33:43 +1000
Message-ID: <CAPM=9tzOBOAiMXP+59x_n1Spsk4gz1cGjfnyXQj2deHaiRhSFg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.9-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 5 Sep 2020 at 05:02, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Sep 3, 2020 at 8:53 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > Not much going on this week, nouveau has a display hw bug workaround,
> > amdgpu has some PM fixes and CIK regression fixes, one single radeon
> > PLL fix, and a couple of i915 display fixes.
>
> Any movement on the i915 relocation issue? I've only seen the one
> report for the 64-bit case, but clearly there was more going on than
> just the missing page table flush on 32-bit..

I'm going to pull in the reverts this week I think, Intel are changing
some part of their patchflows to me, but the 5.10 queue had to revert
some stuff in this area for other reasons, so I'd like to sanely get
those into 5.9 as well.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
