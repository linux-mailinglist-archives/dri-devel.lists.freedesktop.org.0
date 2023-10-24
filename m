Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4533B7D5BE2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7659210E4AD;
	Tue, 24 Oct 2023 19:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EF010E4AD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:52:52 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1d544a4a2f2so3220456fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 12:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698177172; x=1698781972; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4v0Tx3LEGkdavh4vYYD99MkxxVJWO8xEM2BO5mWKw0=;
 b=NmtQKMnp4NUZSXn2NILpRQttARgr352sQMID92oLjxP2XqLR042U1ygqvamxYvgi8k
 dBu7fE9DbCbffdP+tdDPLeGH31YXN51t3yi1sn3Bb/3hUtvYIC6DER9CA/tPlD3YQyfK
 cmjncnCd53atUF56eoAGyKNSIy0un6AC8TGAOCRlO4a7Sj3lUUecpq1ZGt8QjT5yRi7Z
 VFkSEqZ4X/Vuc7sAk/kmPH5YgIHq17WmVLp7xNqyGnNLFj5fFHu1GmvU78tiasAXdVx+
 lYYdGMvCL1C656EmsXNo+LW36GxZElz3bMuMtXoQpCT0Uqs6gd31XXUAEvcIWCrYuE33
 DX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698177172; x=1698781972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j4v0Tx3LEGkdavh4vYYD99MkxxVJWO8xEM2BO5mWKw0=;
 b=uglL20u19LDRBmoMuHUKGbTY88tiLneLmAaxv/fZK00zP5txZyqkUjgKpqzihefvyT
 3UCCcBvjO4vsPHqe85xHy/YkMMHjvsM7RP9xlXpcqwvqwLBwniCnuv3qEB+ws8oO9WEL
 ibkFBlwBDWq25Kvd51j9CecNOaCtu6oTBByqIiultyWvp0iIl5clXROzjSa62Afx2nWs
 Y6+8CK6ckgmC8Mvj2imO39DyPUdwJ5qPTbCFDEwa+BlaHc03UDUxcOea2Hsgimp8cOHO
 0dCOTM5G1jM4a8XpU2U+DdA9RbFLgkCX8vdJ5VnFuLycvQnucB0dZrp9XYqBquZY7woZ
 J9vg==
X-Gm-Message-State: AOJu0Yy66ZyKN9jeuinqM2EZg3KubmOM1dICxe68NYf4SJEPBgs2W/V4
 ko31f/UAELcFkStFhE3yr1oX0uknjseHrjEbyH2v3NLV
X-Google-Smtp-Source: AGHT+IF5+l/sIaMZYDwt0jM872L+aYqrqvPjN3KGyHM9mIDlE++bIFQ2z35Msbz7vXspgGElyXY2/Rr4ZNW2sTnJAJ8=
X-Received: by 2002:a05:6870:4c02:b0:1be:ceca:c666 with SMTP id
 pk2-20020a0568704c0200b001bececac666mr19072674oab.14.1698177171769; Tue, 24
 Oct 2023 12:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231010124357.5251e100@canb.auug.org.au>
 <20231019120618.71424848@canb.auug.org.au>
 <20231024115903.2d73440c@canb.auug.org.au>
 <CADnq5_Od1cQFp=5__LexMKzXwtnmcmcAidE-XsLkL3N4oz+5sg@mail.gmail.com>
In-Reply-To: <CADnq5_Od1cQFp=5__LexMKzXwtnmcmcAidE-XsLkL3N4oz+5sg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Oct 2023 15:52:40 -0400
Message-ID: <CADnq5_P1fOw4pmh56D6E8m6JvMggsMFQhtGv=xhdkUbsUhdRYQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
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
Cc: Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 24, 2023 at 8:57=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Mon, Oct 23, 2023 at 8:59=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
> >
> > Hi all,
> >
> > On Thu, 19 Oct 2023 12:06:18 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> > >
> > > On Tue, 10 Oct 2023 12:43:57 +1100 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> > > >
> > > > After merging the amdgpu tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > >
> > > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: =
In function 'dml_core_mode_support':
> > > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:8=
229:1: error: the frame size of 2736 bytes is larger than 2048 bytes [-Werr=
or=3Dframe-larger-than=3D]
> > > >  8229 | } // dml_core_mode_support
> > > >       | ^
> > > > cc1: all warnings being treated as errors
> > > >
> > > > Caused by commit
> > > >
> > > >   7966f319c66d ("drm/amd/display: Introduce DML2")
> > > >
> > > > (or maybe something later that changed storage size).
> > > >
> > > > I have used the amdgpu tree from next-20231009 for today.
> > >
> > > This build failure now (presumably) exists in the drm tree.  I am sti=
ll
> > > applying the 2 patches from Rodrigo to my tree as a work around.
> > >
> > > I would have expected that this was fixed in the amdgpu tree before
> > > Dave was asked to merge it ...
> >
> > Any progress here?  I am still applying the 2 patches.
>
> The two patches are in my -next tree and in the PR I sent last week.

Looks like the gitlab migration over the weekend lost some history.
I've fixed it up.

Alex
