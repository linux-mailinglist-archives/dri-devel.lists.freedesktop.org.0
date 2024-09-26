Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2E798743B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0C010EB38;
	Thu, 26 Sep 2024 13:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PzTnzD+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE5F10EB38
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727356209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Vque+qul9h3vZ+jBoStnItLqe/P2G1uTsL4XR+Zsvc=;
 b=PzTnzD+QsbS7sNNXHaBZA3drq2E2WxnQa4vbEw/B2IfFZFE98e5VMIzUsD2WtCXCV099kD
 jvfVqbezp6eJCeXI+q7GHwCIaMBhyx8J4OLAYuMW7y7HiKl8w3vtTc6Ee2jFkl7/xJ2Et7
 wl5xaOJ/Vl6g/VC2ETFVvmzOAWONLmU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-ko8PCiQjNk6M3F5pXj0Z7A-1; Thu, 26 Sep 2024 09:10:07 -0400
X-MC-Unique: ko8PCiQjNk6M3F5pXj0Z7A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3787ea79dceso313337f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727356206; x=1727961006;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Vque+qul9h3vZ+jBoStnItLqe/P2G1uTsL4XR+Zsvc=;
 b=jIKlxAfs1Eu150DF/wNPc8LQDBSr7UyAwNrJLBpUEe9mKnj+ZX3plkNll8JkhKyUEo
 3qggbzZ7/QHVZXprsP8orbwlot2ztXIRaIb2miZRpYvgpMqvYzcL9iVuNFtfJVHVnNxO
 B+1bhyA6ZrWempeske2nhTS2eIZ9s8v96jtBnnXb2zUljqMv/6z7gdknFCJp93RgS6he
 AWFxRfY6lkRBCS97SW6aJiSkLiALrW2keAk/bGHMmAFPZp4JdUkP5bNVxBacKxb5gvNS
 w1c9HS3q87xS8WOscD26fhFs7VpDvg6hic7XJuyyWahW/TrYnUK4IwaMvrXGlRXZTIEE
 fc9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2Yr4QWb3Xtwh69Bznn9ZPHeoRY9vri1ngDbUw8yhPEvid+ldPyb5L1k7I9Pgx0O8ZcDPPUQHfF7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWuN7Qc9IvvSlgF40f6c+4tcv8+gVhnwLnHIyXkQT41Xg6Bv4R
 PY6LEJSHs8p6J8QI7ArQc5n/m57iI5qm9QKEI8m1WwYw0YCxTF3RlbnkW6GsKxZzEUlDWVVk3Ka
 /MFyXY6PHypy/a5GCnUp3vhSQmkr3PDpAfhQY7U8xRMeosSREOF0QFOihSIkEzaKjgQ==
X-Received: by 2002:adf:f511:0:b0:37c:d21a:3d61 with SMTP id
 ffacd0b85a97d-37cd21a40d6mr715218f8f.39.1727356206323; 
 Thu, 26 Sep 2024 06:10:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENSrwod7qO/Yf0xqCWSVC7XvI6j4G9Q4A6b9You1+IKoW6KA7RprHpbi2ks7znQVmJD4KXRw==
X-Received: by 2002:adf:f511:0:b0:37c:d21a:3d61 with SMTP id
 ffacd0b85a97d-37cd21a40d6mr715190f8f.39.1727356205689; 
 Thu, 26 Sep 2024 06:10:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cccbf3d03sm2875684f8f.49.2024.09.26.06.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 06:10:04 -0700 (PDT)
Date: Thu, 26 Sep 2024 15:10:04 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: Time for drm-ci-next?
Message-ID: <20240926-successful-mackerel-of-prosperity-8bb6e5@houat>
References: <ZofMlSIjFV9iGZNM@phenom.ffwll.local>
 <CAF6AEGvDFLBC6BWUdC6L1czn044EuTerPWqLib5hhRVkZyEpig@mail.gmail.com>
 <Zouo16MCRRCNyYAs@phenom.ffwll.local>
 <CAF6AEGvGZp=WhGxmqVjqPnR3G33GTng+L0kwABCRxAKb0nHc9g@mail.gmail.com>
 <CAA8EJppyM_-5fBL6VFp+kxyg36LAbjxqUgA+ico9LBuJvaahxQ@mail.gmail.com>
 <20240909-marvellous-ostrich-of-improvement-c7d2c8@houat>
 <CAA8EJpoe=Ei7fjZNd24OCVrapt5Y13ZFk8mheqPOy2FBF1a43Q@mail.gmail.com>
 <CAF6AEGub4O86pRM6iM5xaDKVrR57D=OCm00ifFksG1LT9a4+og@mail.gmail.com>
 <qs72n3l6l63er3d5lrxoravqbjrjllscnyhs7crb6anabvaez4@4hathpqkwnnd>
 <67c8cf4c-f224-4c24-96b2-92aaa3224321@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4mag3l6ip6gofxep"
Content-Disposition: inline
In-Reply-To: <67c8cf4c-f224-4c24-96b2-92aaa3224321@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4mag3l6ip6gofxep
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 05:57:07PM GMT, Vignesh Raman wrote:
> Hi,
>=20
> On 12/09/24 11:18, Dmitry Baryshkov wrote:
> > On Mon, Sep 09, 2024 at 07:34:04AM GMT, Rob Clark wrote:
> > > On Mon, Sep 9, 2024 at 2:54=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >=20
> > > > On Mon, 9 Sept 2024 at 10:50, Maxime Ripard <mripard@redhat.com> wr=
ote:
> > > > >=20
> > > > > Hi,
> > > > >=20
> > > > > On Tue, Jul 09, 2024 at 01:27:51AM GMT, Dmitry Baryshkov wrote:
> > > > > > On Mon, 8 Jul 2024 at 21:38, Rob Clark <robdclark@gmail.com> wr=
ote:
> > > > > > >=20
> > > > > > > On Mon, Jul 8, 2024 at 1:52=E2=80=AFAM Daniel Vetter <daniel.=
vetter@ffwll.ch> wrote:
> > > > > > > >=20
> > > > > > > > On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote:
> > > > > > > > > On Fri, Jul 5, 2024 at 3:36=E2=80=AFAM Daniel Vetter <dan=
iel.vetter@ffwll.ch> wrote:
> > > > > > > > > >=20
> > > > > > > > > > On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wro=
te:
> > > > > > > > > > > On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter =
<daniel.vetter@ffwll.ch> wrote:
> > > > > > > > > > > >=20
> > > > > > > > > > > > On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark=
 wrote:
> > > > > > > > > > > > > On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel V=
etter <daniel@ffwll.ch> wrote:
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob C=
lark wrote:
> > > > > > > > > > > > > > > On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Dani=
el Vetter <daniel@ffwll.ch> wrote:
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > On Wed, Jun 26, 2024 at 11:38:30AM +0300, D=
mitry Baryshkov wrote:
> > > > > > > > > > > > > > > > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, D=
aniel Vetter wrote:
> > > > > > > > > > > > > > > > > > On Mon, Jun 24, 2024 at 10:25:25AM -030=
0, Helen Koike wrote:
> > > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > > On 24/06/2024 02:34, Vignesh Raman wr=
ote:
> > > > > > > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > > > > > > > > > > > > > > > Basically, I often find myself ne=
eding to merge CI patches on top of
> > > > > > > > > > > > > > > > > > > > > msm-next in order to run CI, and =
then after a clean CI run, reset HEAD
> > > > > > > > > > > > > > > > > > > > > back before the merge and force-p=
ush.  Which isn't really how things
> > > > > > > > > > > > > > > > > > > > > should work.
> > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > This sounds more like you want an integ=
ration tree like drm-tip. Get msm
> > > > > > > > > > > > > > > > > > branches integrated there, done. Backme=
rges just for integration testing
> > > > > > > > > > > > > > > > > > are not a good idea indeed.
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > But AFAIU this doesn't help for pre-merge tes=
ting, ie. prior to a
> > > > > > > > > > > > > > > patch landing in msm-next
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > My idea was to have a drm-ci-next managed sim=
ilar to drm-misc-next, if
> > > > > > > > > > > > > > > we have needed drm/ci patches we could push t=
hem to drm-ci-next, and
> > > > > > > > > > > > > > > then merge that into the driver tree (along w=
ith a PR from drm-ci-next
> > > > > > > > > > > > > > > to Dave).
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > I guess I'm confused about what kind of pre-mer=
ge testing we're talking
> > > > > > > > > > > > > > about then ... Or maybe this just doesn't work =
too well with the linux
> > > > > > > > > > > > > > kernel. The model is that you have some pile of=
 trees, they're split up,
> > > > > > > > > > > > > > and testing of all the trees together is done i=
n integration trees like
> > > > > > > > > > > > > > linux-next or drm-tip.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > pre-merge: for msm we've been collecting up patch=
es from list into a
> > > > > > > > > > > > > fast-forward MR which triggers CI before merging =
to msm-next/msm-fixes
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Ideally drm-misc and other trees would do similar=
, we'd catch more
> > > > > > > > > > > > > regressions that way.  For example, in msm-next t=
he nodebugfs build is
> > > > > > > > > > > > > currently broken, because we merged drm-misc-next=
 at a time when
> > > > > > > > > > > > > komeda was broken:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > https://gitlab.freedesktop.org/drm/msm/-/jobs/605=
75681#L9520
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > If drm-misc was using pre-merge CI this would hav=
e been caught and the
> > > > > > > > > > > > > offending patch dropped.
> > > > > > > > > > > >=20
> > > > > > > > > > > > That sounds more like we should push on the drm-mis=
c pre-merge CI boulder
> > > > > > > > > > > > to move it uphill, than add even more trees to make=
 it even harder to get
> > > > > > > > > > > > there long term ...
> > > > > > > > > > > >=20
> > > > > > > > > > > > Short term it helps locally to have finer trees, bu=
t only short term and
> > > > > > > > > > > > only very locally.
> > > > > > > > > > >=20
> > > > > > > > > > > The path to have fewer trees (ideally only one for al=
l of drm) is to
> > > > > > > > > > > use gitlab MRs to land everything :-)
> > > > > > > > > > >=20
> > > > > > > > > > > drm-ci-next is only a stop-gap.. but one that we need=
=2E  The
> > > > > > > > > > > ${branchname}-external-fixes trick covers _most_ case=
s where we need
> > > > > > > > > > > unrelated patches (ie. to fix random ToT breakage out=
side of drm or in
> > > > > > > > > > > core drm), but it doesn't help when the needed change=
s are yml
> > > > > > > > > > > (because gitlab processes all the yml before merging =
the
> > > > > > > > > > > -external-fixes branch).  This is where we need drm-c=
i-next, otherwise
> > > > > > > > > > > we are having to create a separate MR which cherry-pi=
cks drm/ci
> > > > > > > > > > > patches for doing the CI.  This is a rather broken pr=
ocess.
> > > > > > > > > >=20
> > > > > > > > > > So what I don't get is ... if we CI drm-misc, how does =
that not help
> > > > > > > > > > improve the situation here? Step one would be post-merg=
e (i.e. just enable
> > > > > > > > > > CI in the repo), then get MRs going.
> > > > > > > > >=20
> > > > > > > > > I guess post-merge is better than nothing.. but pre-merge=
 is better.
> > > > > > > > >=20
> > > > > > > > > post-merge can work if you have a "sheriff" system where =
someone
> > > > > > > > > (perhaps on a rotation) is actively monitoring results an=
d "revert and
> > > > > > > > > ask questions later" when something breaks.  Pre-merge en=
sures the
> > > > > > > > > interested party is involved in the process ;-)
> > > > > > > >=20
> > > > > > > > So ... make that happen? And it doesn't have to be for all =
of drm-misc,
> > > > > > > > mesa after all switched over to MR also on a bit a driver/a=
rea basis. So
> > > > > > > > agreeing among all drm-ci folks to use gitlab MR in drm-mis=
c for pre-merge
> > > > > > > > testing shouldn't be that hard to make happen. And unlike a=
 separate
> > > > > > > > branch it's not some kind of detour with a good chance to g=
et stuck in a
> > > > > > > > local optimum.
> > > > > > >=20
> > > > > > > Tree vs branch doesn't really have much in the way of distinc=
tion,
> > > > > > > modulo gitlab permissions.  In that it doesn't do much good i=
f drm/ci
> > > > > > > patches are landing on a different branch.
> > > > > > >=20
> > > > > > > I guess what you are suggesting is that we have a single tree=
/branch
> > > > > > > that drm/ci + drm/msm + (plus whoever else wants to get in on=
 the
> > > > > > > drm/ci, so probably at least vkms) lands patches into via git=
lab MRs?
> > > > > >=20
> > > > > > This again brings a separate CI-enabled tree. I think it has be=
en
> > > > > > suggested to start with enabling DRM CI for drm-misc branches. =
Then we
> > > > > > can possibly start landing MRs with CI testing (probably starti=
ng with
> > > > > > vkms).
> > > > >=20
> > > > > It's something we've discussed with Sima for a while, but enablin=
g CI on
> > > > > drm-misc at some point will make sense so we could just as well s=
tart
> > > > > now.
> > > > >=20
> > > > > The biggest unknown at the moment to start doing so is how we cou=
ld keep
> > > > > drm-tip and the rerere repo with MR.
> > > >=20
> > > > Let's do a slow start and begin with post-merge testing. At least t=
his
> > > > gives us an idea of how stable it is (and what does it take to keep=
 it
> > > > green). Maybe we can perform post-merge testing for both drm-misc a=
nd
> > > > drm-tip.
> > >=20
> > > The one thing is that currently the runtime for igt is quite long
> > > (~1hr) because you can't really parallelize kms tests.  So maybe
> > > nightly scheduled runs would be a better idea.
> >=20
> > SGTM. So, the question would be, who can set it up?
> >=20
>=20
> We will test the nightly pipelines in a forked repo and then will
> set it up for drm-misc and drm-tip.

We also had a discussion with Dave and Daniel at Plumbers, and it looks
like setting up a compilation + kunit run for each PR sent to Dave and
Sima would be a good first step.

Maxime

--4mag3l6ip6gofxep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvVdJwAKCRAnX84Zoj2+
didBAYDpY9rTYbSYYVK01vmeyO2JHfpVumnGS6VflwVpUKNHZHpBI56Rfywoxd4S
oNzKcKwBgMwy7Bx5eFxvTg5GlESPcOfz8kzUCM/liG1ryDYKCi0BI90yVUwQMQfx
tiIXj2LFkA==
=IEPe
-----END PGP SIGNATURE-----

--4mag3l6ip6gofxep--

