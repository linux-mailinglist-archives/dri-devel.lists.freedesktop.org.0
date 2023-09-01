Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A7879024F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 21:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CE210E1C8;
	Fri,  1 Sep 2023 19:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D3610E073;
 Fri,  1 Sep 2023 19:00:51 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3a9ee3c7dbbso1504494b6e.1; 
 Fri, 01 Sep 2023 12:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693594851; x=1694199651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E7KVmWHseUsA9PHKchK5ctEoALCnskj8nmo0lY5Xalw=;
 b=eY3IBpGbSK9xip4+3tTsYOh+B9Rx/mibsJvzBsPqUCzXUAoiTsqWf+YhqKHvWha2gb
 6az1lJN1wtEuKQWMkX2CTOKuVoGCpaHlbfo8+Xoqak01t2firs118hhVqN3KJhW+huDW
 P3ytTlAWoSOTrHXlRlregiZhNwra/mlgCfRAoIDznmCMMKLJIiAaer/7mxGMZRlEAQrI
 zcRTpDANgNp9d48gXJimgXhifrOmVt7CZsAKYR6BhTeueT7S0soX5eYpw7bqyuszL+CZ
 Vtpnp+E4mEea98nZ1FolcDtS6lSmX7pJuhuyXQkQQbTAjUF8oitPuvq35itOGhfeo9wp
 LD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693594851; x=1694199651;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E7KVmWHseUsA9PHKchK5ctEoALCnskj8nmo0lY5Xalw=;
 b=AJiVk2/QHKafwq198CxofitUOLdXGAMkVCMvcgf8GkCoTpxhhuV4FJjRJYoI7lncZf
 8ZOM7sFUwbpC1TVnc9q6mVIAYcqWTTxCMXaMplrJ6eePlesxsJtzeIT92BedsrVGv4qw
 Dz3EsrrV+H5nmegF/tk9ECCG0Ww0aFiIPLndzyDCAJBYXxVhRTi+lvjGXB2r6uL/jQY1
 /wr7/mVcoBpC2Lwf8oZdmHt8UzHlWnBenuKa41akCAfTu5X5BuU26BxIJCVlsEcqYMne
 BdSAbRiTFFpQjdl9YM3tcOUvy8E18w65D2tdKjd5eCmR8Qm+0zV2QbRbllbJPHsgIfyW
 qYHQ==
X-Gm-Message-State: AOJu0Yyaw3Nfi5B0nqPf/k7jvw3TGCPT48WZCt5dgykKO8aGHKvERsUy
 /SYxRa/myrRMqt1aZQbS4mMlBOUv3zWZ/h2wZFo=
X-Google-Smtp-Source: AGHT+IHKNeKXnIzHuA21Fys8RSDG59anAjPfnV+oTu48reXHV+QCPG6QHRwBdJc9uFbA/6MgZAKi1Nhbd5Q7czwYHts=
X-Received: by 2002:aca:bb06:0:b0:3a4:644:b482 with SMTP id
 l6-20020acabb06000000b003a40644b482mr2981125oif.52.1693594850818; Fri, 01 Sep
 2023 12:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692705543.git.jani.nikula@intel.com>
 <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com>
 <87il965gob.fsf@intel.com> <871qfm2kg1.fsf@intel.com>
 <CADnq5_P49U3dcqiZhB-CjS8UbOtB7K2jNObS0ZQqMhOr3UhLQg@mail.gmail.com>
 <87o7ip252r.fsf@intel.com> <87jztd2332.fsf@intel.com>
 <1e6aa1ff-9aa9-6b2f-84f4-e0304205085c@amd.com>
 <87h6oh0yz9.fsf@intel.com> <b32199ef-7179-3908-3bed-dd164cadc5de@amd.com>
In-Reply-To: <b32199ef-7179-3908-3bed-dd164cadc5de@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 1 Sep 2023 15:00:39 -0400
Message-ID: <CADnq5_MBpxT5mPXq0N_=EC7oCQLLxMKVboziSYp6rNOGwTEJow@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
To: Alex Hung <alex.hung@amd.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Wang,
 Yu \(Charlie\)" <Yu.Wang4@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 6:01=E2=80=AFPM Alex Hung <alex.hung@amd.com> wrote=
:
>
>
>
> On 2023-08-30 01:29, Jani Nikula wrote:
> > On Tue, 29 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
> >> On 2023-08-29 11:03, Jani Nikula wrote:
> >>> On Tue, 29 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> >>>> On Tue, 29 Aug 2023, Alex Deucher <alexdeucher@gmail.com> wrote:
> >>>>> On Tue, Aug 29, 2023 at 6:48=E2=80=AFAM Jani Nikula <jani.nikula@in=
tel.com> wrote:
> >>>>>>
> >>>>>> On Wed, 23 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> >>>>>>> On Tue, 22 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
> >>>>>>>> On 2023-08-22 06:01, Jani Nikula wrote:
> >>>>>>>>> Over the past years I've been trying to unify the override and =
firmware
> >>>>>>>>> EDID handling as well as EDID property updates. It won't work i=
f drivers
> >>>>>>>>> do their own random things.
> >>>>>>>> Let's check how to replace these references by appropriate ones =
or fork
> >>>>>>>> the function as reverting these patches causes regressions.
> >>>>>>>
> >>>>>>> I think the fundamental problem you have is conflating connector =
forcing
> >>>>>>> with EDID override. They're orthogonal. The .force callback has n=
o
> >>>>>>> business basing the decisions on connector->edid_override. Force =
is
> >>>>>>> force, override is override.
> >>>>>>>
> >>>>>>> The driver isn't even supposed to know or care if the EDID origin=
ates
> >>>>>>> from the firmware loader or override EDID debugfs. drm_get_edid()=
 will
> >>>>>>> handle that for you transparently. It'll return the EDID, and you
> >>>>>>> shouldn't look at connector->edid_blob_ptr either. Using that wil=
l make
> >>>>>>> future work in drm_edid.c harder.
> >>>>>>>
> >>>>>>> You can't fix that with minor tweaks. I think you'll be better of=
f
> >>>>>>> starting from scratch.
> >>>>>>>
> >>>>>>> Also, connector->edid_override is debugfs. You actually can chang=
e the
> >>>>>>> behaviour. If your userspace, whatever it is, has been written to=
 assume
> >>>>>>> connector forcing if EDID override is set, you *do* have to fix t=
hat,
> >>>>>>> and set both.
> >>>>>>
> >>>>>> Any updates on fixing this, or shall we proceed with the reverts?
> >>
> >> There is a patch under internal reviews. It removes calls edid_overrid=
e
> >> and drm_edid_override_connector_update as intended in this patchset bu=
t
> >> does not remove the functionality.
> >
> > While I am happy to hear there's progress, I'm somewhat baffled the
> > review is internal. The commits that I suggested to revert were also
> > only reviewed internally, as far as I can see... And that's kind of the
> > problem.
> >
> > Upstream code should be reviewed in public.
>
> Hi Jani,
>
> All patches are sent for public reviews, the progress is summarized as
> the followings:
>
> =3D=3D internal =3D=3D
>
> 1. a patch or patches are tested by CI.
> 2. internal technical and IP reviews are performed to ensure no concerns
> before patches are merged to internal branch.
>
> =3D=3D public =3D=3D
>
> 3. a regression test and IP reviews are performed by engineers before
> sending to public mailing lists.
> 4. the patchset is sent for public reviews ex.
> https://patchwork.freedesktop.org/series/122498/
> 5. patches are merged to public repo.
>

This sort of thing is fine for unreleased chips or new IP prior public
exposure, but for released hardware, you really need to do the reviews
on the mailing lists.

Alex


> >
> >
> > BR,
> > Jani.
> >
> >
> >>
> >> With the patch. both following git grep commands return nothing in
> >> amd-staging-drm-next.
> >>
> >> $ git grep drm_edid_override_connector_update -- drivers/gpu/drm/amd
> >> $ git grep edid_override -- drivers/gpu/drm/amd
> >>
> >> Best regards,
> >> Alex Hung
> >>
> >>>>>
> >>>>> What is the goal of the reverts?  I don't disagree that we may be
> >>>>> using the interfaces wrong, but reverting them will regess
> >>>>> functionality in the driver.
> >>>>
> >>>> The commits are in v6.5-rc1, but not yet in a release. No user depen=
ds
> >>>> on them yet. I'd strongly prefer them not reaching v6.5 final and us=
ers.
> >>>
> >>> Sorry for confusion here, that's obviously come and gone already. :(
> >>>
> >>>> The firmware EDID, override EDID, connector forcing, the EDID proper=
ty,
> >>>> etc. have been and somewhat still are a hairy mess that we must keep
> >>>> untangling, and this isn't helping.
> >>>>
> >>>> I've put in crazy amounts of work on this, and I've added kernel-doc
> >>>> comments about stuff that should and should not be done, but they go
> >>>> unread and ignored.
> >>>>
> >>>> I really don't want to end up having to clean this up myself before =
I
> >>>> can embark on further cleanups and refactoring.
> >>>>
> >>>> And again, if the functionality in the driver depends on conflating =
two
> >>>> things that should be separate, it's probably not such a hot idea to=
 let
> >>>> it reach users either. Even if it's just debugfs.
> >>>>
> >>>>
> >>>> BR,
> >>>> Jani.
> >>>
> >
