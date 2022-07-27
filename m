Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD80581E35
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 05:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB2BC0A1B;
	Wed, 27 Jul 2022 03:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562D3C0A1B;
 Wed, 27 Jul 2022 03:24:58 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w5so7405400edd.13;
 Tue, 26 Jul 2022 20:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=/7RZLsjyTI0R4ZfKKOyrHQdFEO+4TXaNSeF8vSSb7tI=;
 b=cVFC+UPtE/3zcIq7u5nwCpzP8EzjiMSvS9+k/JFYwrMQT8j9A72UuXQV0mo7Ye6F/A
 pLhefr7Z1Dx1hHC1Rvac0ay79PYaJlvHFF+ekEJ6voOIHyLAg0RgGk/ZCcN8+bQ33IG5
 Z7uTGyaAhf8Oxzl2cXAK5uBBXFgPY/tojpZqg5iURMumJpPjbQfB1sMqE7kKyrzX3UNc
 5f0kRMtkHt6d+UT9GG32eXUmBlkPJU0G5nUORkY4GL9uogZR/kzBdbqoIXptptqZgK1U
 AgBQcTFzXF0nGUHzUyS7edENyjz99a/ZaCa1P1J+AT0HXgc9JJFjdIXCHJfGdeufATyn
 4p+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=/7RZLsjyTI0R4ZfKKOyrHQdFEO+4TXaNSeF8vSSb7tI=;
 b=nVkGpxpMnx+kmTczhFNz/nfOsJC9sMRB+TN1PxEHkUMgE3H6IFhOejnrr+kStAVJt+
 1vGbEFyuNFoOqAZl3w6DmckZ9wJv/3xD0RGzAG4W9Gy/5ZbNeV7xB7j8up+LXXlbgv1G
 jsgRUn5EYx+9qEdgKn+gVSWOKA44nICO91m50GzFZscJcAKO0WJwLyGCfeKZkHKc5CKF
 bvxicwqW1FGpx20iye4OF94iSVMiVROwkZ0GPEHPTzwzFfQwyFPIdK+STX4iSrPWEISi
 L0f3Dfdi3qhdopqzaW/1KYF2xIR4XWqOmDA00T/L1ejpsSJHs51nGd6vjn222wfkyPOT
 Aokg==
X-Gm-Message-State: AJIora+p+dbI/EtfDUcMG/K2LbPOsYbRaQMwcGNz0XGsvPzf1s5TeOYg
 MSfRxPhK/ukzR/N/1sp1zoR5LBvn9z4I58YKP/Q=
X-Google-Smtp-Source: AGRyM1vxIL6k5kOgHXbW+8CMv2eWQF/THRb/39MgpPWjav/mjtDNp/blw3eauSZ+Vy+/ap3KtNHg0TKu8u0ei3KlclY=
X-Received: by 2002:a05:6402:249b:b0:43c:8ce6:8890 with SMTP id
 q27-20020a056402249b00b0043c8ce68890mr3626994eda.74.1658892296672; Tue, 26
 Jul 2022 20:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220711124742.3b151992@canb.auug.org.au>
 <6e60d396-2a52-d1fa-f125-3c585605b531@amd.com>
 <20220718094453.2f1a1f09@canb.auug.org.au>
 <20220727125508.1991f1e7@canb.auug.org.au>
In-Reply-To: <20220727125508.1991f1e7@canb.auug.org.au>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 27 Jul 2022 13:24:45 +1000
Message-ID: <CAPM=9txm_fZX781zMr0RAS6uBD_FoE63THY-WaiB92xYEUrfTw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jul 2022 at 12:55, Stephen Rothwell <sfr@canb.auug.org.au> wrote=
:
>
> Hi all,
>
> On Mon, 18 Jul 2022 09:44:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Mon, 11 Jul 2022 10:05:45 +0200 Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
> > >
> > > Am 11.07.22 um 04:47 schrieb Stephen Rothwell:
> > > >
> > > > Today's linux-next merge of the drm tree got a conflict in:
> > > >
> > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > > >
> > > > between commit:
> > > >
> > > >    925b6e59138c ("Revert "drm/amdgpu: add drm buddy support to amdg=
pu"")
> > > >
> > > > from the drm-misc-fixes tree and commit:
> > > >
> > > >    5e3f1e7729ec ("drm/amdgpu: fix start calculation in amdgpu_vram_=
mgr_new")
> > > >
> > > > from the drm tree.
> > > >
> > > > This is a mess :-(  I have just reverted the above revert before me=
rgin
> > > > the drm tree for today, please fix it up.
> > >
> > > Sorry for the noise, the patch "5e3f1e7729ec ("drm/amdgpu: fix start
> > > calculation in amdgpu_vram_mgr_new")" and another one is going to be
> > > reverted from the drm tree as well.
> > >
> > > It's just that -fixes patches where faster than -next patches.
> >
> > Here we are a week later, -rc7 has been released and as far as I can
> > tell (though I may have missed it), this is still a problem :-(
> >
> > I am still reverting 925b6e59138c (which is now in Linus' tree).
>
> Ping?

My assumption is I fix this on sending my -next tree to Linus with a
resolution I create at that time?

Is there another option, we have this fixed in out drm-tip tree already.

Dave.
