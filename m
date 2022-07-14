Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 041E15757A2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 00:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDAE10E87E;
	Thu, 14 Jul 2022 22:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2983C10E00D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 22:25:23 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id sz17so5891025ejc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 15:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VLxamuVHzbCVq4kaO70LC5FKC4nD+QqWmnlRgBc59/o=;
 b=XS+oJ+zFohj9Q1Sgzf8zCga5OG0fBGrBNHDpPjIG7kMOQzPA5trlg0GnXcvk7fPd18
 ENTT+lvHyCPtvACQ26CGyeQpHQr2T5AURNNsFKf/ggcEF92Cewkp2UnDi6z0OE5ofiOU
 857HiU47EDLiE6rNDEq7nDwc82etXZnWFP3MUvQ5t5GLPcaylidQJqxyf6I/wbET+KzT
 qRNRvRYu4CPVry+u10g3DcLUWihrESUMSsX6bkauSVQo1VgXIUu4TcVF6ebD0NRQwa2Q
 GgUyjvxGHHfjJHADHEd8Tr00+GcM2K6UcOPsNV5y+Dht9UyD8/qL185q4tqsIIJEW+f5
 b7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VLxamuVHzbCVq4kaO70LC5FKC4nD+QqWmnlRgBc59/o=;
 b=8PnLsRVe73qSo2br4VsSNMZOOOwMsSt+EpnqmxzR36Ef7bTMF2sotpW0qkX/Pu/44D
 gQ1Akz2qPpNhNAXKAIpPVkNOTrQGDzvGEpYG/6Opo7hbiuGNE3YjNOIgCNLSryE8Po6d
 0vwtjQvylAJ3OJb7e68UJdyXiVHsPCSM8O5nWZcXV1doJH+66k91gwAokA0Bz+LPi+KI
 f/jbazTtJyT0oPYJonvD06UHzrhbqp6uuF4VCtIhAikfmQ91AJEdllJz2mrBFBQK8lBi
 u2mB/9rhApKe3GECZckyDLF2psYjggJCw9YA+sEXHzZvCiFHgeMwNJ9SSD7krydIxFd1
 K/Xw==
X-Gm-Message-State: AJIora9yoX7zJx7GXnTf+Rm6fj9aNRF4kNCiodViNNrZKV2c0hhd+C/A
 QEFYBSGBFC/F3VkuDDYnwdm4vLf/HyjIuZ3BGS5wSb5nUwdHBQ==
X-Google-Smtp-Source: AGRyM1sG1bSb5jFfp0h+4Zx0OojqNsTAaxrusUnLj5DeQbvjg/hOVgzg7dmrwV2rzli60mM+nlPcvINeNwe/Fvv9bn4=
X-Received: by 2002:a17:907:2702:b0:72b:307b:98e6 with SMTP id
 w2-20020a170907270200b0072b307b98e6mr10660524ejk.658.1657833428627; Thu, 14
 Jul 2022 14:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
 <CAK4VdL2hCEoshWZbCh5mkHuS6wYMiPFR3v4MWTnrEKM9zyv6Mw@mail.gmail.com>
 <ef88ec2c-77b5-fa0d-49d1-fdd2451713b7@collabora.com>
 <573fae0d-c9ab-98b0-c6f1-5b0d4e52dd01@amd.com>
 <a33ab7b9-738f-db91-f6ba-78a9641365e8@amd.com>
 <b05f9861-1966-72f5-132b-aebb4b6e0c6b@collabora.com>
 <107fe968-8311-0511-cc31-22feb994a6d7@collabora.com>
 <3e07a8d0-2cbc-8f3e-8f9f-5b73fb82028b@amd.com>
 <CADnq5_MMmeWkiMxjYfrG7pip8BEkbkRc8ADUDLEi++kRF76sqg@mail.gmail.com>
 <bff42c98-045d-2e5a-2cf9-eb563425375e@collabora.com>
 <6e0c7590-6ffb-162b-a98d-0a39333453f6@collabora.com>
 <4ca27cee-eda0-0a65-f972-c69cc3b3e53e@amd.com>
 <CADnq5_Mms=UbPc7D0-Z-HNUHfCHVWMO82NO+jh5Yg8DmkKwH3A@mail.gmail.com>
 <4c7e7b6d-8dcf-41ae-c853-b95e6efd9c32@amd.com>
In-Reply-To: <4c7e7b6d-8dcf-41ae-c853-b95e6efd9c32@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jul 2022 17:16:56 -0400
Message-ID: <CADnq5_NQ+BCQKt1cJX_V0ZmLE6O2ve5UwSxCzXbDrtkcig4=9Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 14, 2022 at 1:58 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> On 2022-07-14 12:22, Alex Deucher wrote:
>
> > On Thu, Jul 14, 2022 at 10:14 AM Andrey Grodzovsky
> > <andrey.grodzovsky@amd.com> wrote:
> >>
> >> On 2022-07-14 05:57, Dmitry Osipenko wrote:
> >>> On 7/12/22 11:56, Dmitry Osipenko wrote:
> >>>> On 7/6/22 18:46, Alex Deucher wrote:
> >>>>> On Wed, Jul 6, 2022 at 9:49 AM Andrey Grodzovsky
> >>>>> <andrey.grodzovsky@amd.com> wrote:
> >>>>>> On 2022-07-06 03:07, Dmitry Osipenko wrote:
> >>>>>>
> >>>>>>> Hello Andrey,
> >>>>>>>
> >>>>>>> On 5/17/22 17:48, Dmitry Osipenko wrote:
> >>>>>>>> On 5/17/22 17:13, Andrey Grodzovsky wrote:
> >>>>>>>>> Done.
> >>>>>>>>>
> >>>>>>>>> Andrey
> >>>>>>>> Awesome, thank you!
> >>>>>>>>
> >>>>>>> Given that this drm-scheduler issue needs to be fixed in the 5.19=
-RC and
> >>>>>>> earlier, shouldn't it be in the drm-fixes and not in drm-next?
> >>>>>> I pushed it into drm-misc from where it got into drm-next. I don't=
 have
> >>>>>> permission for drm-fixes.
> >>>>> The -fixes branch of drm-misc.
> >>>> Now I don't see the scheduler bugfix neither in the -fixes branch no=
r in
> >>>> the -next and today Dave sent out 5.19-rc7 pull request without the
> >>>> scheduler fix. Could anyone please check what is going on with the D=
RM
> >>>> patches? Thanks!
> >>>>
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
github.com%2Ffreedesktop%2Fdrm-misc%2Fcommits%2Fdrm-misc-fixes&amp;data=3D0=
5%7C01%7Candrey.grodzovsky%40amd.com%7Cd62c2e6d3ec748cd639608da65b52548%7C3=
dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637934125954377887%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000%7C%7C%7C&amp;sdata=3DWPmMC%2B%2Fy83cUctuF%2FLNo9VhWnB%2FkpUVQotMh7=
4VshB8%3D&amp;reserved=3D0
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
cgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Flog%2F%3Fh%3Ddrm-misc-fixes&amp;dat=
a=3D05%7C01%7Candrey.grodzovsky%40amd.com%7Cd62c2e6d3ec748cd639608da65b5254=
8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637934125954377887%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DRzCMLUYLmUjSmvDm4E%2FJr%2B5rp7E8UvjFt1tm=
wBoBiVc%3D&amp;reserved=3D0
> >>> The patch is in the drm-misc-next-fixes, so it wasn't moved to the
> >>> drm-misc-fixes.
> >>>
> >>> Andrey, don't you have access to drm-misc-fixes? Or you meant
> >>> drm-fixes=3Ddrm-misc-fixes?
> >>
> >> I have only accesses to drm-misc-next to which I pushed this patch.
> > anyone with drm-misc rights can commit to any of the branches in the
> > drm-misc tree.  You just need to check out and push the appropriate
> > branch.  then push the changes.  E.g.,
> > dim push-branch drm-misc-next
> > vs
> > dim push-branch drm-misc-next-fixes
> > etc.
> >
> > Alex
>
>
> I see, but what  is the reason then that Dave sent out 5.19-rc7 pull
> request without the
> scheduler fix if the patch was merged into drm-misc-next long ago ? All
> the changes from
> there are usually picked up for pull requests, no ?

drm-misc-next is for new stuff for the next kernel (e.g., 5.20).
drm-misc-fixes is for fixes for the current kernel cycle (e.g., 5.19).
See:
https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html

Alex

>
> Andrey
>
>
> >
> >
> >> Andrey
> >>
> >>
