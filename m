Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E4F7942C2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D27310E6D4;
	Wed,  6 Sep 2023 18:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D6710E6D4;
 Wed,  6 Sep 2023 18:06:46 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1c0fcbf7ae4so122087fac.0; 
 Wed, 06 Sep 2023 11:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694023605; x=1694628405; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xnjUXTs6pn0ju4mRyE2WoYS0dp5/lgNA0GigOa0IJOE=;
 b=SoozSE5TCcEPSt9lbW30CGxWutZAjs2U1s99VYqUfWta9lHvdhnKojaTP1gRdxqmCm
 hO4vjU2P/H4W7M7KJU3VIJnuZVomDdpgGy+QN7yFf75iJ9ng8BhZNs3HJ744fdk2gOOw
 M48fk6qu5GgYX6ABm3T1C5Zyp5FYda8Q5csbk6iqcyWYPQ/TQ4WeSRTHgdTgUlQyry6O
 CFKVXg2GmXn8bEkNuaaA1utP6nxa9drr+WFKyH8TwV+ZHnZj9WsVDgmMFp8Uqvqz0XZa
 IcV/bXtTionLS+jn3P4yzlYRcNVi0RzjguU9mrzUk4SGpziUnl/XZfRJudru9G5lWZS3
 C0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694023605; x=1694628405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xnjUXTs6pn0ju4mRyE2WoYS0dp5/lgNA0GigOa0IJOE=;
 b=goVYgA8tfxYqfkEc5qxHaxefblAyDCPQtfEelkMljCcCSo9OOPDD5WcFzIsWTJJ/wo
 QBHufU2j6pfeCc3laKnwKZgPlIZYgQLdo8LQntidNUkjln3ZmgRnKpBB2Iv+rTeBN3se
 oXtAgGhlJcEBCHKDUKnUlSF1qYXEdguW00LldFUgagjOdpzjw4nmpuWSGxW4kYDz2xpi
 ah+1jWkylGmchn2EiDfBUNZM9kftVqNKI7fSCkXUHQ3w4n/5CSXgcaaGnQU4iPbKIHew
 HkwNciMUQ6hif5AVyUp304x2zsBV44RD0tnJoKgS6RcbySPpuiKNKSN03VUNcy5Aeg+z
 uP3w==
X-Gm-Message-State: AOJu0Yw5NBkKgVXolLNLphTUJnqsWWQoZLF84s0l/FU5btUjr5Lt0McM
 OT//vu12LeVJC8ucq0iyN+kdC8It1NGm22xMEas=
X-Google-Smtp-Source: AGHT+IHnL4YXufn9orOCAMqeVB24UhQCchcrVK0uam4MUJbJywzc+ivZOogndzFAOBRpb/+5dkxeUeS0OnRV6OQuMLI=
X-Received: by 2002:a05:6808:3089:b0:39c:93ba:cb92 with SMTP id
 bl9-20020a056808308900b0039c93bacb92mr21643536oib.8.1694023605202; Wed, 06
 Sep 2023 11:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230903184607.272198-1-jim.cromie@gmail.com>
 <20230903184607.272198-4-jim.cromie@gmail.com>
 <ZPV6CMBlDWriMyva@ashyti-mobl2.lan> <ZPir+7VYXcKv117q@intel.com>
In-Reply-To: <ZPir+7VYXcKv117q@intel.com>
From: jim.cromie@gmail.com
Date: Wed, 6 Sep 2023 12:06:18 -0600
Message-ID: <CAJfuBxyRn_FQtGmSiJjtOuJDs+40TPWcjW+JA5u8K-FSrDTHUA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm_dbg: add trailing newlines to msgs
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Fei Yang <fei.yang@intel.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Clark <robdclark@chromium.org>,
 amd-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 intel-gvt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 6, 2023 at 10:42=E2=80=AFAM Rodrigo Vivi <rodrigo.vivi@intel.co=
m> wrote:
>
> On Mon, Sep 04, 2023 at 08:32:40AM +0200, Andi Shyti wrote:
> > Hi Jim,
> >
> > On Sun, Sep 03, 2023 at 12:46:00PM -0600, Jim Cromie wrote:
> > > By at least strong convention, a print-buffer's trailing newline says
> > > "message complete, send it".  The exception (no TNL, followed by a ca=
ll
> > > to pr_cont) proves the general rule.
> > >
> > > Most DRM.debug calls already comport with this: 207 DRM_DEV_DEBUG,
> > > 1288 drm_dbg.  Clean up the remainders, in maintainer sized chunks.
> > >
> > > No functional changes.
> > >
> > > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> >
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
> I pushed this i915 one to our drm-intel-next.
> While doing it I have changed the subject to make it clear
> this is 'drm/i915:'.
>
> I believe you should do similar change to all the other patches
> to make it clear in the subject about which domain that commit
> is touching... instead of only 'drm_dbg'.
>

I will do that, and drop the one you've already pushed.
Thank you both.


> i.e.: 183670347b06 ("drm/i915: add trailing newlines to msgs")
> https://cgit.freedesktop.org/drm-intel/commit/?h=3Ddrm-intel-next&id=3D18=
3670347b060521920a81f84ff7f10e227ebe05
>
> Thanks for the patch,
> Rodrigo.
>
> >
> > Andi
