Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DEE2913EF
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B065C6E212;
	Sat, 17 Oct 2020 19:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from script.cs.helsinki.fi (script.cs.helsinki.fi [128.214.11.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1A76EC41
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 08:49:43 +0000 (UTC)
X-DKIM: Courier DKIM Filter v0.50+pk-2017-10-25 mail.cs.helsinki.fi Thu,
 15 Oct 2020 11:49:41 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.helsinki.fi;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version:content-type:content-id; s=dkim20130528; bh=g68CM2
 hFxvGCdEsrlmiEWo4/rsu6Gl1+Qo3XA1E8EiI=; b=IYoNFkhENIUCvh16AOrCB5
 WldtXE4FAHfoMm54T/BzDp5UIdhmHi7S3qAcY3QiMzd29V7iJzIT/xhdVLWkPnzz
 rFKUrNUH+sdPWPQTSmC8Eo/sHzrdUsV6sBYNUbNnLo2xj/v320OTOuAMcJsUvRIr
 eCLLCC0Z9ZCbg7lU2+1MQ=
Received: from whs-18.cs.helsinki.fi (whs-18.cs.helsinki.fi [128.214.166.46])
 (TLS: TLSv1/SSLv3,256bits,AES256-GCM-SHA384)
 by mail.cs.helsinki.fi with ESMTPS; Thu, 15 Oct 2020 11:49:41 +0300
 id 00000000005A1C71.000000005F880D25.000031FF
Date: Thu, 15 Oct 2020 11:49:41 +0300 (EEST)
From: "=?ISO-8859-15?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@cs.helsinki.fi>
X-X-Sender: ijjarvin@whs-18.cs.helsinki.fi
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
In-Reply-To: <20201015102958.1ce776f5@linux-uq9g>
Message-ID: <alpine.DEB.2.20.2010151135300.21509@whs-18.cs.helsinki.fi>
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <5a3537c3-2c81-b9de-e4c7-c00577cdd43d@suse.de>
 <alpine.DEB.2.20.2009171407330.6530@whs-18.cs.helsinki.fi>
 <4ccd1076-29e3-044a-0696-fd205b100374@suse.de>
 <alpine.DEB.2.20.2010140938100.6967@whs-18.cs.helsinki.fi>
 <20201014090913.727e79bb@linux-uq9g>
 <alpine.DEB.2.20.2010151048080.21509@whs-18.cs.helsinki.fi>
 <20201015102958.1ce776f5@linux-uq9g>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=_script-12824-1602751781-0001-2"
Content-ID: <alpine.DEB.2.20.2010151144510.21509@whs-18.cs.helsinki.fi>
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_script-12824-1602751781-0001-2
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-ID: <alpine.DEB.2.20.2010151144511.21509@whs-18.cs.helsinki.fi>

On Thu, 15 Oct 2020, Thomas Zimmermann wrote:
> On Thu, 15 Oct 2020 11:10:48 +0300 (EEST) "Ilpo J=E4rvinen"
> <ilpo.jarvinen@cs.helsinki.fi> wrote:
> > On Wed, 14 Oct 2020, Thomas Zimmermann wrote:
> > > On Wed, 14 Oct 2020 09:58:37 +0300 (EEST) "Ilpo J=E4rvinen"
> > > <ilpo.jarvinen@cs.helsinki.fi> wrote:
> > > > While a large redrawing operation is going on, mouse cursor stops
> > > > moving normally until it is over and it then jumps to catch up. W=
hen
> > > > the mouse is over something that doesn't require large redraw, it =
seems
> > > > to work quite normally.
> > > >=20
> > >=20
> > > That sounds bad. The cursor is drawn by hardware, so I'd expect it =
to move
> > > smoothly across the screen. Maybe the position update is blocked fr=
om the
> > > framebuffer's memcpy within the kernel code.
> > >=20
> > > I was hoping the performance would be acceptable, but this sounds l=
ike a
> > > dealbreaker to me. I can look a bit closer if there are issues/bugs =
in the
> > > code that make it run slow. Not holding my breath for it though...
> >=20
> > Yeah, with like 5fps with full redraw it's not really acceptable (it'=
s a=20
> > bit hard to estimate exactly but certainly less than 10fps). Writing =
to=20
> > video mem / normally working memcpy itself really cannot be this slow =
as=20
> > it would impact fps in non-shmem case too I think.
>=20
> I guess you run X for testing? In the current upstream kernel, X11 shou=
ld use
> an internal shadow buffer to compose the displayed image; and then do i=
t's own
> memcpy into video RAM.

Yes I run X, however, the slow redraws are already visible during boot
up with the text console. It very noticeable while the text "scrolls"=20
(=3Dslowly redraws) with 4-10fps.

I picked up that shadow buffer difference related while comparing the X=20
log files. When I noticed that I was even considering whether to test als=
o=20
with that "extra" shadow buffer to see if it helps any but discarded the=20
idea as I cannot really see how it would help.

My point was that also in the upstream case there's memcpy from the shado=
w=20
buffer to video RAM which cannot be as slow as the copying now in shmem=20
case because it would also fail to reach normal fps.

> If you go to a lower resolution is the performance similar to the
> current upstream kernel?

I'll try to remember to do that once I boot next time.

> > Also, there's more into this. I noticed that after using this kernel,
> > I cannot boot normally neither warm nor even cold boot after poweroff=20
> > (POST is slower than usual, beeps one less and gets stuck, I didn't=20
> > manage to switch into textual POST messages to see if there's any inf=
o as=20
> > the tab key for swithing got also broken). Sadly those beeps don't ma=
tch=20
> > to the motherboard manual in ok nor broken case so I've no idea what =
they=20
> > mean and whether the beeps really related to POST or e.g. from graphi=
cs=20
> > init.
> >=20
> > Only after cutting power entirely from the machine, the boot again=20
> > succeeds. To me those symptoms sounds like it somehow managed to brea=
k=20
> > something related to IPMI because IPMI is reinitialized only if I rem=
ove=20
> > the power. If I've understood correctly IPMI is somehow connected to=20
> > graphics side within the AST.
>=20
> The AST chip does all kinds of things. It's hard to say if it's related=
.
>=20
> >=20
> > I haven't yet tested with the plain 5.9-rc5 to rule out it breaking=20
> > the boot (but I find it less likely to be case here).
> >=20
> >=20
>=20
> I can rebase the patch onto a more recent upstream kernel and send out =
an
> update.

It's actually a bit more work for me to change the base.

--=20
 i.
--=_script-12824-1602751781-0001-2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=_script-12824-1602751781-0001-2--
