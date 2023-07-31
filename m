Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA628769A18
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 16:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30E710E2AC;
	Mon, 31 Jul 2023 14:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D63E10E2AC
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 14:51:21 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31751d7d96eso3861056f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690815079; x=1691419879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fAPrkbK19s/j5Zx9BvuYAYuY534VPCFu5UMSEPN+FAE=;
 b=ONefshDkN1jXMyg0wZ8QEmmAPXYcp3mA7Y4rLHbZ0B/sSm8FGewPffgqtdxTL/X1iT
 AtnNYgJ+osFjNol3DgEwCoRMsRzED9sEjdYo+XNB6jA/vpUD06z0WPGVpFwk6veFO9OU
 ibatrDvsrl3GB3m2uFuEY1sklgbBbV+M1ieeB/BLXlqQriOZZEEhJRnlTc6k3zry1pGI
 8gT4pqVcCYAqeSjkliWxyT6pMGXOg8y1USl58BKNqUR4FGu0Ju4rskBjkX0SaL4zQ9IR
 mABJjkmvgdQUqRb0sebjRifxOKcjyv4RmV6FD7aKFsKCahByl3oE/ln33nEvLUOnN/IR
 cPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690815079; x=1691419879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fAPrkbK19s/j5Zx9BvuYAYuY534VPCFu5UMSEPN+FAE=;
 b=iKj4DVclFioMGkvbTRWT/nXUjMWWygwqmPFJmg1ZIBCuOhzxQ/EIhO1IdGbr8fzJST
 uYoaDu8pz5vfN3bHUJpvK6cOraHWksvMb/EMqT/gxlr9LP7spaca8yZnjeWaxHhS9W9q
 BT89gTmP8z+X4TqCVV9uvMywwwpmY35vMV1AenLtb3/RhiQe5ODhYlPkOxTGODRhDZpK
 0o1yL6uwBFcyhb75cGKgVaicHr+gKhPbfPyeNGWYOukVgEvfPE2KyFT1599Bu9DD471i
 KobX2N/8nlxrYf/iYWV/PXr3hScwSKwRUdkfjzjrnFazifyfusMi12QdkRlWmd0X+TSf
 X1og==
X-Gm-Message-State: ABy/qLY9l3UJLVwlNnzb5VMWhMvhGGZuCC7kWpEbvORhkom4CeIg6mqA
 H9C63qH4OW9gs//af/hESb5+DxFN1h/1wcLiT0A=
X-Google-Smtp-Source: APBJJlHp9CxGwet2vmvPctm3AruUc8MW3kWbH5+YX2xIIUpW5tevxLfL1O+U73H0pP1U9NLaYEZRubIxIr3M2m/csAQ=
X-Received: by 2002:adf:e752:0:b0:314:3f98:a788 with SMTP id
 c18-20020adfe752000000b003143f98a788mr58676wrn.7.1690815079341; Mon, 31 Jul
 2023 07:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGtan-bQ7syKAwOKDY=044aKu26SLPQ0j1ieLqXNyQQS3g@mail.gmail.com>
 <282e-64c7a800-77-46253680@38053863>
In-Reply-To: <282e-64c7a800-77-46253680@38053863>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 31 Jul 2023 07:51:07 -0700
Message-ID: <CAF6AEGufEzyOygPt6-tCbSC75GSD7sOB=FHE4nNGwPre6kHuOA@mail.gmail.com>
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net,
 khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 david.heidelberg@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com, mripard@kernel.org,
 anholt@google.com, linux-mediatek@lists.infradead.org,
 robclark@freedesktop.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 31, 2023 at 5:25=E2=80=AFAM Helen Mae Koike Fornazier
<helen.koike@collabora.com> wrote:
>
> Hello all,
>
> Thanks for your comments.
>
> On Friday, July 28, 2023 11:37 -03, Rob Clark <robdclark@gmail.com> wrote=
:
>
> > On Thu, Jul 27, 2023 at 10:26=E2=80=AFPM Daniel Stone <daniel@fooishbar=
.org> wrote:
> > >
> > > On Thu, 27 Jul 2023 at 22:47, Rob Clark <robdclark@gmail.com> wrote:
> > > > > I did run into a bit of a chicken vs. egg problem with testing th=
e "in
> > > > > tree" version (compared to earlier versions which kept most of th=
e yml
> > > > > and scripts in a separate tree), is that it actually requires thi=
s
> > > > > commit to exist in the branch you want to run CI on.  My earlier
> > > > > workaround of pulling the drm/ci commit in via
> > > > > ${branchname}-external-fixes no longer works.
> > > >
> > > > After unwinding some more gitlab repo settings that were for the
> > > > previous out-of-tree yml setup, I have this working.
> > > >
> > > > Tested-by: Rob Clark <robdclark@gmail.com>
> > > > Acked-by: Rob Clark <robdclark@gmail.com>
> > >
> > > And it's also:
> > > Acked-by: Daniel Stone <daniels@collabora.com>
> > >
> > > It's been back and forth a few times by now and reviewed pretty
> > > heavily by all the people who are across the CI details. I think the
> > > next step is to answer all the workflow questions by actually getting
> > > it into trees and using it in anger. There was some discussion about
> > > whether this should come in from drm-misc, or the core DRM tree, or a
> > > completely separate pull, but I'm not sure what the conclusion was ..=
.
> > > maintainers, thoughts?
> >
> > I'd prefer a separate pull, so that I could merge it into msm-next as
> > well without having to pull in all of drm-misc
>
> Should we create a drm-ci ?

I guess we can just wait and see how often it is that drm/ci updates
need to be merged into multiple driver trees.  Hopefully most of the
drm/ci changes are just expectation file updates which should go via
driver tree.  Maybe i-g-t uprevs, if they have a lot of expectation
changes would be something drivers would want to merge into their own
tree?  But I guess we can see how it goes.

> >
> > Possibly some other driver trees would like to do similar?
> >
> > BR,
> > -R
>
> Also, please wait for v11, I have a few adjustments to make as pointer by
> some comments, and also regarding xfails list and how the configs should
> be organized (unless if you are fine merging this version and I can submi=
t
> the adjustments later).

Ok

BR,
-R

> Thanks,
> Helen
>
