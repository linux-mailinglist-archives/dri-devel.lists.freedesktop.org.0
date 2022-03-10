Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8FB4D4FF1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 18:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9033B10E141;
	Thu, 10 Mar 2022 17:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6046E10E141;
 Thu, 10 Mar 2022 17:09:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h15so9002677wrc.6;
 Thu, 10 Mar 2022 09:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9b14HFNiHZ3ijv/Hd5ZGne5lFgNS5ZzHytM/1DAQZTQ=;
 b=l9IUz9MX6tfbxXoT7l8HEYSPpLKqV0S3akLy9OyYd+Y1pJUxSQhiKCPJN0m+dFTRKJ
 CYlOtMIIp1szp/GFx16bi4uAF1K1+IEsY+9HZVHfXS6c9U6xbUtE8ZxJlRAjl5zjXibq
 Xiy7eeIsvjlTlCnb2xBxCBIR5xRSULny8Cro1z11Qm35XNEOfWw8z7kLfNSDBFrfhXNW
 J9A7g0AUPmTov8T/uQWEvskpHobDeScs8a3J6JaZ2rY8K1WuVs2o6IeDZzgBXdFvZH9n
 hK4eGqhXm4r1zSmBKuehiyJ554IyurD5sO5Q2L6lL8ZwEjg8ToVr/2HsgdI/dSjiKUR2
 WJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9b14HFNiHZ3ijv/Hd5ZGne5lFgNS5ZzHytM/1DAQZTQ=;
 b=rqq8Kb8PmW2dbcsseGqC1YFvFZ8CfySiqTyC3IAUKHVKV3aN2bhqAULWYjJYSMeuss
 JEbiowLrFij0yKwHBs2GmP4hs4aufn/QbM9KpV+wTVgf1SNx6Bi6weMFXWE8lfI0wE7+
 IazXf5rmEs/LEuHYwhd5EGuTAflejYO2O9Agb8ZjA60swsXScgsVF1SLGyt+NI1OtA3L
 Y181kU3h73qfE70K8JnHcuLlBNkDCN30wrycD+RvbrNMw4DersgbuPxn7aAJqxZ/bG9L
 8iIeEjSSxhL5W9qxu0WTm96n/4IvKE2I/wQl8ISzS1n2nwgZa8FNRkLGdcRcFAvF44oG
 q5VQ==
X-Gm-Message-State: AOAM531BNGtnMrWOgI8WmCBykFCz0H+bM5ltIoQPWJeiyTKd7ivUWHyF
 B5F77Q9DoIJerg923xJ7RgbGLdyoM0sfB3MQhZs=
X-Google-Smtp-Source: ABdhPJyZDje7Gx1Oo47QT1NkjH9jVj0IWRDHSeew24E2ZFC5tIokrVag1PaigZoQmgcOPbBJ807gLqvFiw4CHLmr/Kg=
X-Received: by 2002:adf:914f:0:b0:1ed:bb92:d0cc with SMTP id
 j73-20020adf914f000000b001edbb92d0ccmr4356796wrj.297.1646932166749; Thu, 10
 Mar 2022 09:09:26 -0800 (PST)
MIME-Version: 1.0
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
In-Reply-To: <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 10 Mar 2022 09:10:05 -0800
Message-ID: <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
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

On Thu, Mar 10, 2022 at 8:21 AM Sharma, Shashank
<shashank.sharma@amd.com> wrote:
>
>
>
> On 3/10/2022 4:24 PM, Rob Clark wrote:
> > On Thu, Mar 10, 2022 at 1:55 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >>
> >>
> >>
> >> Am 09.03.22 um 19:12 schrieb Rob Clark:
> >>> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
> >>> <contactshashanksharma@gmail.com> wrote:
> >>>> From: Shashank Sharma <shashank.sharma@amd.com>
> >>>>
> >>>> This patch adds a new sysfs event, which will indicate
> >>>> the userland about a GPU reset, and can also provide
> >>>> some information like:
> >>>> - process ID of the process involved with the GPU reset
> >>>> - process name of the involved process
> >>>> - the GPU status info (using flags)
> >>>>
> >>>> This patch also introduces the first flag of the flags
> >>>> bitmap, which can be appended as and when required.
> >>> Why invent something new, rather than using the already existing devc=
oredump?
> >>
> >> Yeah, that's a really valid question.
> >>
> >>> I don't think we need (or should encourage/allow) something drm
> >>> specific when there is already an existing solution used by both drm
> >>> and non-drm drivers.  Userspace should not have to learn to support
> >>> yet another mechanism to do the same thing.
> >>
> >> Question is how is userspace notified about new available core dumps?
> >
> > I haven't looked into it too closely, as the CrOS userspace
> > crash-reporter already had support for devcoredump, so it "just
> > worked" out of the box[1].  I believe a udev event is what triggers
> > the crash-reporter to go read the devcore dump out of sysfs.
>
> I had a quick look at the devcoredump code, and it doesn't look like
> that is sending an event to the user, so we still need an event to
> indicate a GPU reset.

There definitely is an event to userspace, I suspect somewhere down
the device_add() path?

BR,
-R
