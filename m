Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B754824AB9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 23:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDA110E546;
	Thu,  4 Jan 2024 22:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 341 seconds by postgrey-1.36 at gabe;
 Thu, 04 Jan 2024 22:10:38 UTC
Received: from gimli.rothwell.id.au (unknown
 [IPv6:2404:9400:2:0:216:3eff:fee1:997a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0529310E546
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 22:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
 s=201702; t=1704405892;
 bh=If2814HFR+59WDsBz9gf/4ej7C70sl4Dq1sz0ZnVow0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c1KjIIBQ43iscQf/typY4aFGldEFLPGs188eQ0bDYCYo4QYVixsQospEPF3mjw/nG
 48oEEv6kF4Lp4CkVXn5VTr5siaM6CdCpqqSnh0rG2qCLyLzeo3lioBTw4jeBLwDfPu
 xgkyzNl+LFh/uPDQgX/HwdhFMP2qvNExm2rpZgBtSUgHWxN3kjleiI/SzPxGWJWhpg
 cAF0MC9Djf+yISgrjElB/zfsTtLQPY58VijdJYR1pQwS+CeYHFkp4bG84wbOJnsnh6
 ZYlZV1FDd3rWO77YNkKIqjpapDdqlk3saXdgy4Ue+fkqBCzW0KfHSfpz/hyeflILrY
 Uj7JLzqHxOSoQ==
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.rothwell.id.au (Postfix) with ESMTPSA id 4T5gcM013wzyb9;
 Fri,  5 Jan 2024 09:04:50 +1100 (AEDT)
Date: Fri, 5 Jan 2024 09:04:49 +1100
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Sean Young <sean@mess.org>
Subject: Re: (subset) linux-next: build failure after merge of the pwm tree
Message-ID: <20240105090449.5cf240ec@oak>
In-Reply-To: <ZZaplFvjLADNz-2m@gofer.mess.org>
References: <20231221165805.0c4771c1@canb.auug.org.au>
 <170316329164.542553.8341559295114557258.b4-ty@kernel.org>
 <20231221125801.GG10102@google.com>
 <ZYSFUZf8NcK5vvLv@orome.fritz.box> <ZZaCQahr3t8CUumD@archie.me>
 <ZZaplFvjLADNz-2m@gofer.mess.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xW9ccXYMuSXzGh3Fg8i_Q4P";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Flavio Suligoi <f.suligoi@asem.it>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/xW9ccXYMuSXzGh3Fg8i_Q4P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 4 Jan 2024 12:50:28 +0000 Sean Young <sean@mess.org> wrote:
>
> On Thu, Jan 04, 2024 at 05:02:41PM +0700, Bagas Sanjaya wrote:
> > [also add Jingoo (additional backlight maintainer) and Linus]
> >=20
> > On Thu, Dec 21, 2023 at 07:34:57PM +0100, Thierry Reding wrote: =20
> > > On Thu, Dec 21, 2023 at 12:58:01PM +0000, Lee Jones wrote: =20
> > > > On Thu, 21 Dec 2023, Lee Jones wrote:
> > > >  =20
> > > > > On Thu, 21 Dec 2023 16:58:05 +1100, Stephen Rothwell wrote: =20
> > > > > > After merging the backlight tree, today's linux-next build (x86=
_64
> > > > > > allmodconfig) failed like this:
> > > > > >=20
> > > > > > drivers/video/backlight/mp3309c.c: In function 'mp3309c_bl_upda=
te_status':
> > > > > > drivers/video/backlight/mp3309c.c:134:23: error: implicit decla=
ration of function 'pwm_apply_state'; did you mean 'pwm_apply_args'? [-Werr=
or=3Dimplicit-function-declaration]
> > > > > >   134 |                 ret =3D pwm_apply_state(chip->pwmd, &pw=
mstate);
> > > > > >       |                       ^~~~~~~~~~~~~~~
> > > > > >       |                       pwm_apply_args
> > > > > >=20
> > > > > > [...] =20
> > > > >=20
> > > > > Applied, thanks!
> > > > >=20
> > > > > [1/1] linux-next: build failure after merge of the pwm tree
> > > > >       commit: f7baa9ccef93ba1c36a8ecf58c2f4e86fb3181b9 =20
> > > >=20
> > > > Actually it's:
> > > >=20
> > > >   f7baa9ccef93b ("backlight: mp3309c: Rename  pwm_apply_state() to =
pwm_apply_might_sleep()")
> > > >=20
> > > > But don't bank on the commit ID staying the same. =20
> > >=20
> > > This is likely going to break the build on your branch because
> > > pwm_apply_might_sleep() is only available in the PWM tree right now. =
In
> > > any case, I've now pushed a commit that adds pwm_apply_state() back a=
s a
> > > compatibility stub, so it should be okay for you to drop this if you
> > > run into problems. It's always possible that somebody else wants to a=
dd
> > > a new caller of pwm_apply_state() and in retrospect we should've
> > > probably done this from the start, at least as a transitional measure
> > > for one or two cycles.
> > >  =20
> >=20
> > Hi Lee and Thierry,
> >=20
> > I know that we're still on New Year vibes, so some things are not up to=
 full
> > steam for now; but since we're close to v6.7 release and v6.8 merge win=
dow,
> > hence allow me to ask:
> >=20
> > Stephen Rothwell is still complaining about backlight tree build failure
> > due to f7baa9ccef93b, yet it has not been fixed so far. Has the culprit
> > been dropped/reverted as he requested? The worst case is the culprit sl=
ips
> > through and become part of backlight PR and Linus will likely not happy
> > with the build regression (maybe he had to fix by himself). =20
>=20
> This should be fixed by 9a216587a03df, and on current linux-next I can't=
=20
> reproduce the problem any more (x86_64 allmodconfig).

Of course linux-next is fine, because I have fixed it up in there.

Here is the problem:  the backlight tree
(git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git#for-backli=
ght-next)
is broken when built in its own because of the above patch (which is
commit f7baa9ccef93).  In linux-next, I have been merging the previous
working version of the backlight tree (with head commit 7d84a63a39b7).
The patch (commit f7baa9ccef93) can only be applied to the merge of the
backlight tree and the pwm tree
(git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git=
#for-next)
which is merged much later in the linux-next process.  If the backlight
tree was merged by Linus before the pwm tree, it would break his build
(and he would not be happy).  But the patch on the head of the
backlight tree was made unnecessary by commit 9a216587a03d in the pwm
tree.  So, please either revert commit f7baa9ccef93 in the backlight
tree (or simply to a "git reset --hard HEAD^" there).  The patch of
commit f7baa9ccef93 can be applied some time later (after Linus has
merged both trees.

--=20
Cheers,
Stephen Rothwell

--Sig_/xW9ccXYMuSXzGh3Fg8i_Q4P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWXK4EACgkQAVBC80lX
0Gy01Qf6A1C5SMeayXoJVjrb1sBes2bSqA6BnrLQT9O2O/FGzvW678lYwOppq2Z4
vgkvFcEMrBD82x/7DBmRZye3XdnyZwjHwHuHqA7Q+soXunIWOz6DgyaJ89GQ4BBs
Nyndkrfj/f1xNN9PCxxDzB/Uv45RUVNT9EMMWlVdjZLSrcJLj8YL3NWNEE50++K8
8eYw2XF8j6SASp55r+bgZfLJEvygCwrzY4IgrPWt9gP5YXSsZ8MpPvo32UhEqUnJ
Y7vZCwE+W3Geyd1W+ujzT3GnZKyI5L3Jtok5CJI6gzXKC9LYI+aCVwgjy580qtbG
CZC/3XsFPtr2wLlnB32M7KuCRhoAZA==
=M1fR
-----END PGP SIGNATURE-----

--Sig_/xW9ccXYMuSXzGh3Fg8i_Q4P--
