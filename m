Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C714B310C5E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 15:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060336F44B;
	Fri,  5 Feb 2021 14:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53EE6F448;
 Fri,  5 Feb 2021 14:01:30 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id a16so3598795plh.8;
 Fri, 05 Feb 2021 06:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9mVRXJ1/m2Ab7utnhdbSusiRKnV59wpCtJPbJHx3VCk=;
 b=XztMZPDU58th5eKVyXGkC00fgRrKZery2vGPxOREgC14W+PUEVDSGLDwsjZ3pbtnIb
 VK5gp1AbMy7mYgt4Yqm6J4GA9C1jEZty2d5ivJ93u2V3At0j/aXiopwlr6JUEd0+wTmP
 vgR8ia4Eou83XBKtXoo5kWmJC6mwXExeiAfx2Ch9KMEisFmqTbUjmpyPAvzY5kU4YCv0
 waLHPzY2kaKLl0S8IRHw4IziqfcV0YMuYHZ3eObaLh/oR2J2WiA38y4wP/X6ABcqmyKb
 zPs1v+kHpaQ4vStCh4rGN4egOcLdT6LTfZ5Qb0xK5dmwgg7Ml+yvz7faVLRLN4TbeEun
 L0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9mVRXJ1/m2Ab7utnhdbSusiRKnV59wpCtJPbJHx3VCk=;
 b=XLs9sTl+VnYD6fgwI33rM8Hnhsz4MeGKGUsqY8WJzXmE7yK1i+BTF/dOpx2ArrVynA
 CO4WSRYA7m4U2QYZA4sMnANkIoLQxyKMMUo3O+kpnMzLqWzivzOHTzSEH5kVaIhriB3B
 gOOOIwxNHUPUCnj+kFLNEg3+DpZN9JzSstuFYS6wDS7+LDQ20MWo/He5PRFMLEVJGXtu
 DHmfIkFsK5eCWju7OnqaJwXVbSR9huGwlXIvok4OMcCuZAKnNirjkhJWxqgs+Vj05VH+
 sQxuta2ww2fZD2rTX5gnxLVWRwaxEUdcLpdIDq4jwl/kDYJN4hn/f88ZIjViV4qcJ0sv
 9OHA==
X-Gm-Message-State: AOAM530wJCoQPnVSe1pDS92gcK8brgnPyzgvnXvfCkQhS6lVLd+eTOwu
 c3P0qhCt1KlEM7Zbl+h8ZiKoujGwoq4Ojl+JfP8=
X-Google-Smtp-Source: ABdhPJzn7icLqSpYWC8pI6O41q0nqM43UZ+wkg65n4fjCOQg3z1XI8OGZBa87lh+5WCg8R+RKOLLNMVPvzeSiQ5Q0mQ=
X-Received: by 2002:a17:90a:644a:: with SMTP id
 y10mr4470679pjm.129.1612533689048; 
 Fri, 05 Feb 2021 06:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20210204155846.5aef94a8@canb.auug.org.au>
 <CAHp75Vct=jSQxu187hwz4Wrc_xRKiTmKFt_bgT-m-z=iW31drg@mail.gmail.com>
 <CAHp75Vc_xJFpUECZenOYEyJ6YDzfDFmJe9cTeGh0x-c_fKQPHw@mail.gmail.com>
 <CAMeQTsYK5GoL=VNB0CPrGi0Y-804N1q24dkii20OuV8=ckhmuA@mail.gmail.com>
 <CAKMK7uFSF0cHZh6KikMf2MmBykZazE5HGA1ejJU++GWyfuTmfQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFSF0cHZh6KikMf2MmBykZazE5HGA1ejJU++GWyfuTmfQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Feb 2021 16:01:12 +0200
Message-ID: <CAHp75VeeEutQB0nX3TAfbBSOuACREChaZaTtG9zmsjX9kfPBuQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 drm-misc tree
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Gross <mark.gross@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 3:05 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Fri, Feb 5, 2021 at 12:14 PM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
> >
> > On Fri, Feb 5, 2021 at 12:07 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Thu, Feb 4, 2021 at 11:04 AM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > >> Today's linux-next merge of the drivers-x86 tree got a conflict in:
> > > >
> > > > Thanks. I already asked Patrik yesterday day if DRM missed to pull an immutable tag I provided. I think they can pull and resolve conflicts themselves. Alternatively it would be easy to resolve by Linus by removing Kconfig lines along with mentioned files,
> > >
> > > Patrik, I have sent a PR again, so you may consider pulling it, thanks!
> >
> > Daniel, is this something you can pull into drm or ask one of the
> > drm-misc maintainers to do?
>
> We've already created the conflict, and my understanding is that Linus
> wants to have visibility into conflict-y stuff and doesn't mind at all
> resolving conflicts. Hence for 5.12 I think we're fine as-is.

Fine with me!

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
