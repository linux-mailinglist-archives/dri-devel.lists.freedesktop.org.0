Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1117454294
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 09:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBFB6E49F;
	Wed, 17 Nov 2021 08:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09976E499
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 08:25:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F1635C0103;
 Wed, 17 Nov 2021 03:24:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 17 Nov 2021 03:24:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=0
 kh9oPqgqKbfmFgvyhImC3iq+zfeC5Rm6wThNTy1MtM=; b=kTerCJTYY62lRByML
 CSCUwbcVur+EJKeSQ9SU1FucYItMdc+XtuVtVjSaaS3RATxD0cRG5nRiBhJvFbvH
 Ds5Kic9fPLxrLZTHVRILUtyvNzv60IcqpJDin38vs8Nrg/+enKtfD1JY93KJP0Z+
 KuAnCW9Tqn7IHHVRTr3T5f6/1WC7drUWobsxYi62gxa9ayP51RYA+OLGMV8U6orY
 zHlxIminIoBU2wYGSY5gqa+UJio6T5zDl2/52fD4hvee/N1BPIPTGGFu4KqyZtHE
 ozTsbDkaBmPWJp4zRJtWUoPSQY/UnXwWeziixa74AlOvGyt7uezTp3YwjbJT3F4r
 3U3Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=0kh9oPqgqKbfmFgvyhImC3iq+zfeC5Rm6wThNTy1M
 tM=; b=GyZKhQmLd8WXd2w/D+6DGbyujA+qFunRQtFFix12D1i1SXNqdF8lYAcZH
 f9j9oZ/JFxreWt/6mIdRNoEvNgk6lRlOxhdTbdfILlmh702qYCS7Xt7hdWKgL+J0
 jlMki7+In/UFEBMrOep9rcgBOPbHmw4cym6xEMJutHBIK2U+2xoRha/A3UFB7nQs
 EIg68gVXZpWJrDiRBwaSCyeHsGECzff/VMRCuzaZWkYRUptkNnELsjYltlhVLIcT
 tWWeMFiC6v1+oEh6vCTE/rmPDmp/76XNwt39HwK4eoGVw7AQvBSrI0ysyGYcHT+j
 ybVA6ERUcquBfMIar7nWe69lIdQjg==
X-ME-Sender: <xms:WbyUYXUwWNFu7q-crlgbugKuBpk38VVUt6HFO6ZdMhp-uNz7lX24ZQ>
 <xme:WbyUYfnb58fiJzAAlGTX6dfR8PPfB5LGuCkDWNswLRO4rfoGuwh4UnEu3vJoyNhq7
 zZKET7tnGkfR_gbO6g>
X-ME-Received: <xmr:WbyUYTa3RhykQ5decibo1_UuK8UJmh77-1aSHwtb62wYWz0J8FqwXvFYXzKBDp92bN_U1Oovu_Oo_eS_UMopoL75iCIrXDN9Uj1w9mcITG0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeefgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefhueeggfdvieegjeeigeffudeuhfeuveeuieelgfffleelgedtiefgvdev
 ieevvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:WbyUYSXyYZEoMbrzVwuAgdS7Saoa302mGcmeQDXrLkBNtic80uPdIg>
 <xmx:WbyUYRkcoXKK70-ZZJc2QtTOPFL6i6lcvCoPmt5wmUB9HLYpqpCe1g>
 <xmx:WbyUYfcIyqN_pTEnboC-9r7brAE3HqmPe5qSh2MoeA5RHIpjn25TQQ>
 <xmx:WryUYT7ZiTcyxSWko9Gbgwx6HBp8s0EUkEC_FBMXWPmqYSrwVzJF-A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 03:24:57 -0500 (EST)
Date: Wed, 17 Nov 2021 09:24:54 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jian-Hong Pan <jhp@endlessos.org>
Subject: Re: [PATCH 0/6] drm/vc4: kms: Misc fixes for HVS commits
Message-ID: <20211117082454.mcjfeepnrer7on7h@gilmour>
References: <20211115113105.103275-1-maxime@cerno.tech>
 <CAPpJ_eezZHUwbbq1r18jSgBrKa4L9dPcohQsCFBV10fD-TpcbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPpJ_eezZHUwbbq1r18jSgBrKa4L9dPcohQsCFBV10fD-TpcbA@mail.gmail.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Nov 17, 2021 at 03:08:31PM +0800, Jian-Hong Pan wrote:
> Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=8815=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:31=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> > The conversion to DRM commit helpers (f3c420fe19f8, "drm/vc4: kms: Conv=
ert to
> > atomic helpers") introduced a number of issues in corner cases, most of=
 them
> > showing themselves in the form of either a vblank timeout or use-after-=
free
> > error.
> >
> > These patches should fix most of them, some of them still being debugge=
d.
> >
> > Maxime
> >
> > Maxime Ripard (6):
> >   drm/vc4: kms: Wait for the commit before increasing our clock rate
> >   drm/vc4: kms: Fix return code check
> >   drm/vc4: kms: Add missing drm_crtc_commit_put
> >   drm/vc4: kms: Clear the HVS FIFO commit pointer once done
> >   drm/vc4: kms: Don't duplicate pending commit
> >   drm/vc4: kms: Fix previous HVS commit wait
> >
> >  drivers/gpu/drm/vc4/vc4_kms.c | 36 ++++++++++++++---------------------
> >  1 file changed, 14 insertions(+), 22 deletions(-)
> >
> > --
> > 2.33.1
> >
>=20
> Thanks to Maxime's information!
>=20
> I tried to applied this patch series based on the latest mainline
> kernel at commit commit 8ab774587903 ("Merge tag 'trace-v5.16-5' of
> git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace"),
> which almost equals "tags/v5.16-rc1" and tested it on RPi 4B.
> However, the system hangs and becomes dead at the kernel message:
>=20
> [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
>=20
> The full dmesg can be found at
> https://bugzilla.kernel.org/attachment.cgi?id=3D299603
>=20
> If I revert the patch series to the original mainline kernel, system
> can boot up.

Can you share a bit more information on the boot setup you have? Do you
have a display connected? If so, on both output or just a single one?

Thanks!
Maxime
