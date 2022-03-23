Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB00E4E54FB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0891310E6E8;
	Wed, 23 Mar 2022 15:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E3710E6E8;
 Wed, 23 Mar 2022 15:14:50 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d39f741ba0so1952763fac.13; 
 Wed, 23 Mar 2022 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gnpxNdyYt25f0bJKJ/luTNvlpSBS08raEsQXZTYnFpY=;
 b=PS9ahrEcbgmOHgtA7V/jSqDLnbiPESOqCmiFJ3RWyFgmzxCHviTO5VhtGxYGEEL5o3
 aHdSO8bxsfd2eByHXum3tPKOR3bc3MQ4KHOLdIBNYpBLqaRJq5bcquO7KcI97NIHBCbp
 f9URPD8UgkV07dlIh0s4LXTSBD5N+b7UBKSalci+k/xOTXFhHd0LOJkxzfVW2ccvDa5S
 0RCH0JxKdn97jn7qFV4scjHRa03Maw88vKuCT7Z8/4Hvc6YMSZF23VcX9QBtHJymru4I
 2kIh/eS0l8Jy7zNDErGxsLQSNgETWDI5/25azOV5rG4dB18vrrwMVes9f7SocEOSirEY
 L6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gnpxNdyYt25f0bJKJ/luTNvlpSBS08raEsQXZTYnFpY=;
 b=ekD4aaN3MUEBP/aIoFP5BM4VranxhWlyR0Q1XeXmNKPtWCvATQU/EwON3m8xqCiQpG
 FkOhc3S4+1liyo//mD1h8d/BSyGQTV+EPTNt90UaU31Fs+9oDCJEH6RCpRoOUepFmmUT
 Tvl7vxDvtGwC+se7TzKxJElZIQBN41Z+BR1uI3Xp7ijqd7aE8VIRCF6TwguvpI266YB1
 U36SzaZ21XCzf8gakSAwWgSlvsmrgh4Is8ggKhI9jD/t7DuhdFGgs8mdtymqBs7+8r7J
 tU/tG29Px7+77+YmBjDCd0VIYzpOaloYPkoD/3+NXoZ8BkOVYaMHvUccIdGDm6NCaI9c
 jaqQ==
X-Gm-Message-State: AOAM533jylqg3DnJaE3Pp2cQfBXCoa7yK9brnx1Az6RFNzuNnHrt4ZMz
 vqTUuN6Rqzu4Ldo2f7lXO/oPdJTWqwMlOIn3drM=
X-Google-Smtp-Source: ABdhPJzRQxM+RKXazWBSuRwso1hTJ0uokGOpGfdTQ88Nueky3sb9aMq5bwvzBNzs2FQqzTrio+/BJd09+ep0o/GbYhA=
X-Received: by 2002:a05:6871:8ab:b0:dd:b74b:409a with SMTP id
 r43-20020a05687108ab00b000ddb74b409amr4187501oaq.200.1648048489380; Wed, 23
 Mar 2022 08:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <7addb3e7-d265-c1a7-d449-7d0056f06d63@molgen.mpg.de>
 <fc60c561-c12a-c031-9558-abae3e3474ec@amd.com>
 <6f0888a2-f74d-f41f-d593-a8362e7dc673@molgen.mpg.de>
 <398f8851-d37b-4020-24ce-8f2ab9723e40@amd.com>
 <CAPj87rMETV9UkpbGRYAT3mjVhRtW75m0e9OLON6_+gdcD0Fo2Q@mail.gmail.com>
 <CADnq5_NuaN_ZziNipdqvvTQ41you==VqJg5oxQovowokaJ2K1Q@mail.gmail.com>
 <CAPj87rNyjd1xkEEARMoiaEdjLxy2rvcKa03fnNCnpN91DLhF1A@mail.gmail.com>
In-Reply-To: <CAPj87rNyjd1xkEEARMoiaEdjLxy2rvcKa03fnNCnpN91DLhF1A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Mar 2022 11:14:38 -0400
Message-ID: <CADnq5_Mt5sWCC7hLLBH_DJdvXGqSTbNNaxWpY+cWWD9Vpa8KGQ@mail.gmail.com>
Subject: Re: Commit messages (was: [PATCH v11] drm/amdgpu: add drm buddy
 support to amdgpu)
To: Daniel Stone <daniel@fooishbar.org>
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

On Wed, Mar 23, 2022 at 11:04 AM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi Alex,
>
> On Wed, 23 Mar 2022 at 14:42, Alex Deucher <alexdeucher@gmail.com> wrote:
> > On Wed, Mar 23, 2022 at 10:00 AM Daniel Stone <daniel@fooishbar.org> wr=
ote:
> > > On Wed, 23 Mar 2022 at 08:19, Christian K=C3=B6nig <christian.koenig@=
amd.com> wrote:
> > > > Well the key point is it's not about you to judge that.
> > > >
> > > > If you want to complain about the commit message then come to me wi=
th
> > > > that and don't request information which isn't supposed to be publi=
cly
> > > > available.
> > > >
> > > > So to make it clear: The information is intentionally hold back and=
 not
> > > > made public.
> > >
> > > In that case, the code isn't suitable to be merged into upstream
> > > trees; it can be resubmitted when it can be explained.
> >
> > So you are saying we need to publish the problematic RTL to be able to
> > fix a HW bug in the kernel?  That seems a little unreasonable.  Also,
> > links to internal documents or bug trackers don't provide much value
> > to the community since they can't access them.  In general, adding
> > internal documents to commit messages is frowned on.
>
> That's not what anyone's saying here ...
>
> No-one's demanding AMD publish RTL, or internal design docs, or
> hardware specs, or URLs to JIRA tickets no-one can access.
>
> This is a large and invasive commit with pretty big ramifications;
> containing exactly two lines of commit message, one of which just
> duplicates the subject.
>
> It cannot be the case that it's completely impossible to provide any
> justification, background, or details, about this commit being made.
> Unless, of course, it's to fix a non-public security issue, that is
> reasonable justification for eliding some of the details. But then
> again, 'huge change which is very deliberately opaque' is a really
> good way to draw a lot of attention to the commit, and it would be
> better to provide more detail about the change to help it slip under
> the radar.
>
> If dri-devel@ isn't allowed to inquire about patches which are posted,
> then CCing the list is just a fa=C3=A7ade; might as well just do it all
> internally and periodically dump out pull requests.

I think we are in agreement. I think the withheld information
Christian was referring to was on another thread with Christian and
Paul discussing a workaround for a hardware bug:
https://www.spinics.net/lists/amd-gfx/msg75908.html

Alex


Alex
