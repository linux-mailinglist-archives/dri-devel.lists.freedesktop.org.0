Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 309DE4E5527
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A88210E6FB;
	Wed, 23 Mar 2022 15:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728E110E6F6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 15:24:21 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id z8so3303818ybh.7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0vD20m8g5PwvGzKInMp8Kg7Nyn6jhDP8wyiv6EKOnK8=;
 b=xnqYWHc9Rh/KAHAeNxANCstSj/vKV0eDjPvQRGBOBKB9YqALTq7KVdGn2to84O5G7T
 P3mgdIencXN4x7wUQrTzlNrzzV0BRZ0Yx4xovbKXai4SnqzTujKHqbp3iWIbd0xtjZqZ
 LtRKvedmitK/b3Zbr/FiN7PafpUguML/pZ16SrgXWu/ls6CPL9e2cmVeFd5RBFrgQ6ox
 8MILP2zq+M7RsYPkHsVBhuqJ88ds7F6BtQ3YEAtOsql0tGifEPzBB04BbAExp/vpHtvO
 EPD9j7pnl1cW12KM/PMcIy648Z3jTRKlAS6UAFrXCvkntQCpAebWb9tIP4gzN6TIHFfI
 q7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0vD20m8g5PwvGzKInMp8Kg7Nyn6jhDP8wyiv6EKOnK8=;
 b=WmcOLNnEef33RE1E0BFaWPv7IkVQKfTXZQGQI7L4OxmCayiVYOsG4+Vq95pthVx1HV
 iLVDlbivCi7Qp17cJj0lJJCUq8Ht1LK21Mf1ZweJC1Vx5/1W/RuGiYbaHJeZmRsuApyo
 pZ93TFqs8mXN8SG8suRAIhw/o33uXZGCDBQONZOEAlqFvp/vTEDCdPdzgzDL3BIP2dyd
 jKDivj6dX+S/UQH2i5zorKPXcjOBdMWVZ4jHvIHPCkoVZwmrwQLnI4bn7Atgftfiw2CC
 W5t+zc9cMzdFv//ZXx0OR9q2H9EDxpqJzrFCOhIOef25lmaCwZbvnWBBM9ZoAhdqJ+2W
 xgXQ==
X-Gm-Message-State: AOAM530rk48+tMP8F5ZGI6w+lo3b52R1mcScbG6zNvrYJ1Bh10oOONlI
 xIqobOtxJUY5IHTxbK3eXLZq3MfRk4j1uAg4o9D2QMvTY67gWw==
X-Google-Smtp-Source: ABdhPJxo7ogDtwljQ4TL6S5M9NR8I7rdIXfXJWICIHLgh9As9vgbQ2EsxzjM3DXJI3ugzmS/82ZhN4yjYZAiNmP6F2s=
X-Received: by 2002:a5b:710:0:b0:633:98f0:47ad with SMTP id
 g16-20020a5b0710000000b0063398f047admr438074ybq.201.1648049060548; Wed, 23
 Mar 2022 08:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <7addb3e7-d265-c1a7-d449-7d0056f06d63@molgen.mpg.de>
 <fc60c561-c12a-c031-9558-abae3e3474ec@amd.com>
 <6f0888a2-f74d-f41f-d593-a8362e7dc673@molgen.mpg.de>
 <398f8851-d37b-4020-24ce-8f2ab9723e40@amd.com>
 <CAPj87rMETV9UkpbGRYAT3mjVhRtW75m0e9OLON6_+gdcD0Fo2Q@mail.gmail.com>
 <CADnq5_NuaN_ZziNipdqvvTQ41you==VqJg5oxQovowokaJ2K1Q@mail.gmail.com>
 <CAPj87rNyjd1xkEEARMoiaEdjLxy2rvcKa03fnNCnpN91DLhF1A@mail.gmail.com>
 <CADnq5_Mt5sWCC7hLLBH_DJdvXGqSTbNNaxWpY+cWWD9Vpa8KGQ@mail.gmail.com>
In-Reply-To: <CADnq5_Mt5sWCC7hLLBH_DJdvXGqSTbNNaxWpY+cWWD9Vpa8KGQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 23 Mar 2022 15:24:08 +0000
Message-ID: <CAPj87rPhuVTDJSsY-HsKfvV3xkDhEn7nUd3WLsxNuJD=Mx2Zxg@mail.gmail.com>
Subject: Re: Commit messages (was: [PATCH v11] drm/amdgpu: add drm buddy
 support to amdgpu)
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Mar 2022 at 15:14, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Wed, Mar 23, 2022 at 11:04 AM Daniel Stone <daniel@fooishbar.org> wrot=
e:
> > That's not what anyone's saying here ...
> >
> > No-one's demanding AMD publish RTL, or internal design docs, or
> > hardware specs, or URLs to JIRA tickets no-one can access.
> >
> > This is a large and invasive commit with pretty big ramifications;
> > containing exactly two lines of commit message, one of which just
> > duplicates the subject.
> >
> > It cannot be the case that it's completely impossible to provide any
> > justification, background, or details, about this commit being made.
> > Unless, of course, it's to fix a non-public security issue, that is
> > reasonable justification for eliding some of the details. But then
> > again, 'huge change which is very deliberately opaque' is a really
> > good way to draw a lot of attention to the commit, and it would be
> > better to provide more detail about the change to help it slip under
> > the radar.
> >
> > If dri-devel@ isn't allowed to inquire about patches which are posted,
> > then CCing the list is just a fa=C3=A7ade; might as well just do it all
> > internally and periodically dump out pull requests.
>
> I think we are in agreement. I think the withheld information
> Christian was referring to was on another thread with Christian and
> Paul discussing a workaround for a hardware bug:
> https://www.spinics.net/lists/amd-gfx/msg75908.html

Right, that definitely seems like some crossed wires. I don't see
anything wrong with that commit at all: the commit message and a
comment notes that there is a hardware issue preventing Raven from
being able to do TMZ+GTT, and the code does the very straightforward
and obvious thing to ensure that on VCN 1.0, any TMZ buffer must be
VRAM-placed.

This one, on the other hand, is much less clear ...

Cheers,
Daniel
