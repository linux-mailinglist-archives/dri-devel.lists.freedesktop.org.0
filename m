Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3409626DD7B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEAC6E290;
	Thu, 17 Sep 2020 14:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Thu, 17 Sep 2020 11:22:35 UTC
Received: from script.cs.helsinki.fi (script.cs.helsinki.fi [128.214.11.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147EF6EA61
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 11:22:34 +0000 (UTC)
X-DKIM: Courier DKIM Filter v0.50+pk-2017-10-25 mail.cs.helsinki.fi Thu,
 17 Sep 2020 14:17:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.helsinki.fi;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version:content-type; s=dkim20130528; bh=A15kmi7K9vxj0KLwp
 KIXvNREaizRkZ4bF/zEZ/+lTU8=; b=bqbU403t4f7CCyxuK6I2Nh1JJv4T8kXK7
 A0iIP+Vg/M0dBTZrKb2Qiz5VHBigY/jrU4u8LwSdW6WfdxA8Kgw9EdEwVPdbF4w0
 IBnmAucs6ut3cFQRFwz21NDUy2CwUtoA1sswwT1gYejD2xTgi86cneBjuN7vC4Uz
 ByIokwbmLk=
Received: from whs-18.cs.helsinki.fi (whs-18.cs.helsinki.fi [128.214.166.46])
 (TLS: TLSv1/SSLv3,256bits,AES256-GCM-SHA384)
 by mail.cs.helsinki.fi with ESMTPS; Thu, 17 Sep 2020 14:17:28 +0300
 id 00000000005A0146.000000005F6345C8.0000389B
Date: Thu, 17 Sep 2020 14:17:28 +0300 (EEST)
From: "=?ISO-8859-15?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@cs.helsinki.fi>
X-X-Sender: ijjarvin@whs-18.cs.helsinki.fi
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
In-Reply-To: <5a3537c3-2c81-b9de-e4c7-c00577cdd43d@suse.de>
Message-ID: <alpine.DEB.2.20.2009171407330.6530@whs-18.cs.helsinki.fi>
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <5a3537c3-2c81-b9de-e4c7-c00577cdd43d@suse.de>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=_script-14515-1600341448-0001-2"
X-Mailman-Approved-At: Thu, 17 Sep 2020 14:07:28 +0000
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

--=_script-14515-1600341448-0001-2
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi,

Yes, I can build custom kernels and test but I won't have time for that=20
before the end of September so I'll do it only then.

And thanks a lot :-).

--=20
 i.


On Thu, 17 Sep 2020, Thomas Zimmermann wrote:

> Hi
>=20
> Am 08.07.20 um 12:05 schrieb Ilpo J=E4rvinen:
> > Hi,
> >=20
> > After upgrading kernel from 5.3 series to 5.6.16 something seems to=20
> > prevent me from achieving high resolutions with the ast driver.
>=20
> Are you able to build and run a test kernel?
>=20
> I'm seriously considering moving ast to the SHMEM memory manager, which
> would restore the higher resolutions.
>=20
> If you're able to test, you need the git tree drm-tip/drm-tip and the
> attached patch.
>=20
> Alternatively, I've pushed all to
>=20
>   https://gitlab.freedesktop.org/tzimmermann/linux/-/tree/ast-shmem
>=20
> You'd have to checkout the tree and switch to the ast-shmem branch.
>=20
> Please report back if that solves the issue for you.
>=20
> Best regards
> Thomas
>=20
> >=20
> > With 5.6.16:
> >=20
> > $ xrandr
> > Screen 0: minimum 320 x 200, current 1600 x 1200, maximum 1920 x 2048
> > VGA-1 connected primary 1600x1200+0+0 (normal left inverted right x a=
xis y axis) 519mm x 324mm
> >    1600x1200     60.00*=20
> >    1680x1050     59.95 =20
> >    1280x1024     75.02    60.02 =20
> >    1440x900      59.89 =20
> >    1280x800      59.81 =20
> >    1024x768      75.03    60.00 =20
> >    800x600       75.00    60.32 =20
> >    640x480       75.00    59.94 =20
> >    1920x1200_60.0  59.95 =20
> >=20
> > If I try to change to that manually added high-res mode, I get:
> > xrandr: Configure crtc 0 failed
> >=20
> > With 5.3 series I've this:
> >=20
> > Screen 0: minimum 320 x 200, current 1920 x 1200, maximum 1920 x 2048
> > VGA-1 connected primary 1920x1200+0+0 (normal left inverted right x a=
xis y axis) 519mm x 324mm
> >    1920x1200     59.95*+
> >    1600x1200     60.00 =20
> >    1680x1050     59.95 =20
> >    1280x1024     75.02    60.02 =20
> >    1440x900      59.89 =20
> >    1280x800      59.81 =20
> >    1024x768      75.03    60.00 =20
> >    800x600       75.00    60.32 =20
> >    640x480       75.00    59.94 =20
> >    1920x1200_60.0  59.95 =20
> >=20
> > As I've had issues in getting EDID reliably from the monitor, I provi=
de it=20
> > on kernel command-line (the one dumped from the monitor I use). In=20
> > addition, I've another workaround for past issues related to EDID whi=
ch=20
> > always adds that 1920x1200_60.0 mode but now I cannot use even it to
> > enter a high-res mode.
> >=20
> > If you need some additional info or want me to test a patch, just let =
me=20
> > know (but some delay is expected in testing patches). Thanks.
> >=20
> >=20
>=20
>
--=_script-14515-1600341448-0001-2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=_script-14515-1600341448-0001-2--
