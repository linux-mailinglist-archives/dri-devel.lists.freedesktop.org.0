Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5833876963B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 14:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9274E10E27C;
	Mon, 31 Jul 2023 12:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8F110E27C
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:25:10 +0000 (UTC)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk
 [IPv6:2a01:4f8:1c1c:f269::1])
 by madras.collabora.co.uk (Postfix) with ESMTP id 17F5166020AE;
 Mon, 31 Jul 2023 13:25:06 +0100 (BST)
From: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <CAF6AEGtan-bQ7syKAwOKDY=044aKu26SLPQ0j1ieLqXNyQQS3g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Mon, 31 Jul 2023 13:25:05 +0100
To: "Rob Clark" <robdclark@gmail.com>
MIME-Version: 1.0
Message-ID: <282e-64c7a800-77-46253680@38053863>
Subject: =?utf-8?q?Re=3A?= [PATCH v10] =?utf-8?q?drm=3A?= Add initial ci/ 
 subdirectory
User-Agent: SOGoMail 5.8.4
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

Hello all,

Thanks for your comments.

On Friday, July 28, 2023 11:37 -03, Rob Clark <robdclark@gmail.com> wro=
te:

> On Thu, Jul 27, 2023 at 10:26=E2=80=AFPM Daniel Stone <daniel@fooishb=
ar.org> wrote:
> >
> > On Thu, 27 Jul 2023 at 22:47, Rob Clark <robdclark@gmail.com> wrote=
:
> > > > I did run into a bit of a chicken vs. egg problem with testing =
the "in
> > > > tree" version (compared to earlier versions which kept most of =
the yml
> > > > and scripts in a separate tree), is that it actually requires t=
his
> > > > commit to exist in the branch you want to run CI on.  My earlie=
r
> > > > workaround of pulling the drm/ci commit in via
> > > > ${branchname}-external-fixes no longer works.
> > >
> > > After unwinding some more gitlab repo settings that were for the
> > > previous out-of-tree yml setup, I have this working.
> > >
> > > Tested-by: Rob Clark <robdclark@gmail.com>
> > > Acked-by: Rob Clark <robdclark@gmail.com>
> >
> > And it's also:
> > Acked-by: Daniel Stone <daniels@collabora.com>
> >
> > It's been back and forth a few times by now and reviewed pretty
> > heavily by all the people who are across the CI details. I think th=
e
> > next step is to answer all the workflow questions by actually getti=
ng
> > it into trees and using it in anger. There was some discussion abou=
t
> > whether this should come in from drm-misc, or the core DRM tree, or=
 a
> > completely separate pull, but I'm not sure what the conclusion was =
...
> > maintainers, thoughts?
>=20
> I'd prefer a separate pull, so that I could merge it into msm-next as
> well without having to pull in all of drm-misc

Should we create a drm-ci ?

>=20
> Possibly some other driver trees would like to do similar?
>=20
> BR,
> -R

Also, please wait for v11, I have a few adjustments to make as pointer =
by
some comments, and also regarding xfails list and how the configs shoul=
d
be organized (unless if you are fine merging this version and I can sub=
mit
the adjustments later).

Thanks,
Helen

