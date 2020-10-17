Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC912910E3
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 11:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45B06E03F;
	Sat, 17 Oct 2020 09:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006BC6E03F
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 09:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 517B1FB03;
 Sat, 17 Oct 2020 11:13:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xClCHw0Jhbs4; Sat, 17 Oct 2020 11:13:08 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 55F3B402F3; Sat, 17 Oct 2020 11:13:07 +0200 (CEST)
Date: Sat, 17 Oct 2020 11:13:07 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/3] drm/panel: mantix panel reset fixes
Message-ID: <20201017091307.GA2885@bogon.m.sigxcpu.org>
References: <cover.1602584953.git.agx@sigxcpu.org>
 <20201016142916.GA1184974@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016142916.GA1184974@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,
On Fri, Oct 16, 2020 at 04:29:16PM +0200, Sam Ravnborg wrote:
> Hi Guido.
> On Tue, Oct 13, 2020 at 12:32:45PM +0200, Guido G=FCnther wrote:
[..snip..]
> > =

> > Changes from v1:
> >  - As per review comments by Fabio Estevam
> >    https://lore.kernel.org/dri-devel/CAOMZO5B5ECcConvKej=3DRcaF8wvOxgq7=
nUzKJ-ad0aSAOzUqtbQ@mail.gmail.com/
> >    - Fix typo in commit messages
> >  - As per review comments by Rob Herring
> >    https://lore.kernel.org/dri-devel/20200929174624.GA832332@bogus/
> >    - Don't use an array of reset lines
> > =

> > Guido G=FCnther (3):
> >   drm/panel: mantix: Don't dereference NULL mode
> >   drm/panel: mantix: Fix panel reset
> >   dt-binding: display: Require two resets on mantix panel
> =

> All applied to drm-misc-next and pushed out.
> And then I remembered you had commit right - sigh.

Thanks! Is there any special care needed to get that into 5.10? The
driver landed there in 72967d5616d3f0c714f8eb6c4e258179a9031c45.
Cheers,
 -- Guido

> =

> 	Sam
> =

> > =

> >  .../display/panel/mantix,mlaf057we51-x.yaml   |  4 +++
> >  .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 25 +++++++++++++------
> >  2 files changed, 21 insertions(+), 8 deletions(-)
> > =

> > -- =

> > 2.28.0
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
