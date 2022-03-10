Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 595F04D50C2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 18:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B39B10E912;
	Thu, 10 Mar 2022 17:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2058D10E912;
 Thu, 10 Mar 2022 17:41:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e24so9119543wrc.10;
 Thu, 10 Mar 2022 09:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6FQJtIxEyLyAuqaxm8PK6+y8KVErteJM5ZocQugIhFk=;
 b=QNWMToMA6rnVmiCGy+zTjIJTXnQ2BYaJFNQbZzBSB9KkXyYLIYaoVTVmMsAIz6uVoy
 cu7fRHX4ifvPsEdqc5v3srPvypNuLP9N6gozcjEjpFsilZkzEGUUiTmObGB+nphi462E
 vyKzvZqjyLSO0T4CPff1j5S25l+Cwh4I2aZl8/H4WAqSE/HaHOFsgWLMA3Zup/v1XX+q
 dKdoN8mCEU5ZKisulmyr30HgkDPBQUxEkbJ5RmwoTkqgUA2768XGhkF02zsmIu1vPuf4
 5zHtkBQV2H2Trt+rUPvkKbvTc54uSjwW7Iavc9vC+drRuN1I9WiNoj8e2wn1Y7avjPnI
 lLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6FQJtIxEyLyAuqaxm8PK6+y8KVErteJM5ZocQugIhFk=;
 b=rcaGh3M5m8FSST6j663Csgk88Fwhb+f94mMojZjm1NcI6Q3Ib5qVSCRZYAkQm4zre+
 eACb0Cqpg87PrafCpCwEuThZUPTEryEU09lgyTQow56XL637GuuLJktoD1ZD0SLPI4AQ
 7GqX2WXisXQk1gTJJMlSJmm20C949gNrwq4ZlVJKkeYMa5VCd7iRzcfo4YVjdho/Cyws
 v5utThr25C9nK1+yf61Xxhwc1nq+EUiC4G8mteUYvX4ZLLQxtbbDzdYTQMA3RqxL4aLX
 SsGpt4z4ye8DNOpQib5PuaC2CBqTyhME73sxVYRpRj4vP3bqmHe/3DdXaiUoMa2hHrm1
 qzxQ==
X-Gm-Message-State: AOAM533Vun2zt0Jwo18apu6/dsm2rJ+ZVZF47c9JeFR/e7eRl72JK6Nj
 L1zcXzaDSzKep7sb68YsA1/jL1rQYhRWHozW8VE=
X-Google-Smtp-Source: ABdhPJwxqzWY9k8r/9v7EQnQU3gGjWxX5Ot3azqCe4RTi54SnamREqyutsbyVALjvzPGWD/B5UiL0g7dMS8TB1F3tic=
X-Received: by 2002:a5d:4b85:0:b0:1f0:9661:9263 with SMTP id
 b5-20020a5d4b85000000b001f096619263mr4366543wrt.574.1646934069655; Thu, 10
 Mar 2022 09:41:09 -0800 (PST)
MIME-Version: 1.0
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
In-Reply-To: <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 10 Mar 2022 09:40:57 -0800
Message-ID: <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: "Sharma, Shashank" <shashank.sharma@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 10, 2022 at 9:19 AM Sharma, Shashank
<shashank.sharma@amd.com> wrote:
>
>
>
> On 3/10/2022 6:10 PM, Rob Clark wrote:
> > On Thu, Mar 10, 2022 at 8:21 AM Sharma, Shashank
> > <shashank.sharma@amd.com> wrote:
> >>
> >>
> >>
> >> On 3/10/2022 4:24 PM, Rob Clark wrote:
> >>> On Thu, Mar 10, 2022 at 1:55 AM Christian K=C3=B6nig
> >>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> Am 09.03.22 um 19:12 schrieb Rob Clark:
> >>>>> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
> >>>>> <contactshashanksharma@gmail.com> wrote:
> >>>>>> From: Shashank Sharma <shashank.sharma@amd.com>
> >>>>>>
> >>>>>> This patch adds a new sysfs event, which will indicate
> >>>>>> the userland about a GPU reset, and can also provide
> >>>>>> some information like:
> >>>>>> - process ID of the process involved with the GPU reset
> >>>>>> - process name of the involved process
> >>>>>> - the GPU status info (using flags)
> >>>>>>
> >>>>>> This patch also introduces the first flag of the flags
> >>>>>> bitmap, which can be appended as and when required.
> >>>>> Why invent something new, rather than using the already existing de=
vcoredump?
> >>>>
> >>>> Yeah, that's a really valid question.
> >>>>
> >>>>> I don't think we need (or should encourage/allow) something drm
> >>>>> specific when there is already an existing solution used by both dr=
m
> >>>>> and non-drm drivers.  Userspace should not have to learn to support
> >>>>> yet another mechanism to do the same thing.
> >>>>
> >>>> Question is how is userspace notified about new available core dumps=
?
> >>>
> >>> I haven't looked into it too closely, as the CrOS userspace
> >>> crash-reporter already had support for devcoredump, so it "just
> >>> worked" out of the box[1].  I believe a udev event is what triggers
> >>> the crash-reporter to go read the devcore dump out of sysfs.
> >>
> >> I had a quick look at the devcoredump code, and it doesn't look like
> >> that is sending an event to the user, so we still need an event to
> >> indicate a GPU reset.
> >
> > There definitely is an event to userspace, I suspect somewhere down
> > the device_add() path?
> >
>
> Let me check that out as well, hope that is not due to a driver-private
> event for GPU reset, coz I think I have seen some of those in a few DRM
> drivers.
>

Definitely no driver private event for drm/msm .. I haven't dug
through it all but this is the collector for devcoredump, triggered
somehow via udev.  Most likely from event triggered by device_add()

https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/crash-reporte=
r/udev_collector.cc

BR,
-R
