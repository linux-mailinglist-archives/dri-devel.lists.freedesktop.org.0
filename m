Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B123F6F672B
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 10:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7AF10E1FE;
	Thu,  4 May 2023 08:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C39910E1FE;
 Thu,  4 May 2023 08:21:57 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ac80ed7f26so1375251fa.1; 
 Thu, 04 May 2023 01:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683188514; x=1685780514;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/IFoudUwMeQJ57cBexYXGLexmZWNO4FcrthqWKMIDJc=;
 b=EBd+NTuxZBOnuASL1WcfHbzHpvc6+aYlbfCgxLki1QF3MTCjNN1mmqowUv/PLlOS2f
 vc508tg3YKExyeM9xTBc7l8U2KYbrb0h8LFEwxh6oz98R0btL7uaQg4d3MXtRQ7QXc0U
 +pEnO7ZsjpsOuOxvyATevMhhZcupC5/JvHueZCR9woHLc8X5lel/LMRWOdTmRwkqmqUf
 mqJEaz9Ef11HIwY323wZX/8VfC3WyRDdjE69df04gN2UGSPzbsdV5f5reHy50ikX5wRW
 TzdymgC8TKfn0rYu1ZyQMynH7AYChUE5p9ijP3jDAn2olvxkJsfJBlX8AnUoaTnwBwOs
 kjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683188514; x=1685780514;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/IFoudUwMeQJ57cBexYXGLexmZWNO4FcrthqWKMIDJc=;
 b=YKehjRunkACtxu6P57ejAxjSlQhAB9TlPkp11M8ySFznuQmP+4OZI7e/fP+gg6eNF2
 vOqyVkdol+p+mC2fp9oxCKgQs5vAMm0JxPVtRG4oNn+P3rtVqb9yQTk3z0DPxXUC0We6
 Vxk42+oG0xDHZpl04mGGJA6vw5HjTpN0EZxD1cGxneeeHbxE+k+x1nP7NFHCbgp1pMcL
 i2fYAfF/r2+OEWH+PEyfdZWNN/iCQ4JIWq8SLsKNsghIgTsWhHahUxPZvYPJFC9VjqJU
 H1JUuJlNqdXAMm4EUUnCTGw23T7aCx8K6SRjfKCZlpCzrzhqEngLZWlfB1mvH9CpMe5l
 8mhA==
X-Gm-Message-State: AC+VfDyBZqIqfcH4CxHdY0URJbtOW+hRZ0REB7ZPTEpKciBcfSKptnWT
 mCo4JcO3qwjdmT2b+3WYHV4=
X-Google-Smtp-Source: ACHHUZ54HpilL5HofAMl/x1wsQdsdfjXDzNvpcka0T/gp2c1tBOsAB0UrAuxMyAy36Pb3L/C/gceEQ==
X-Received: by 2002:a2e:9881:0:b0:29f:58c6:986e with SMTP id
 b1-20020a2e9881000000b0029f58c6986emr619815ljj.52.1683188513322; 
 Thu, 04 May 2023 01:21:53 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y6-20020a2e95c6000000b002a77ab1d73dsm1872985ljh.96.2023.05.04.01.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 01:21:52 -0700 (PDT)
Date: Thu, 4 May 2023 11:21:42 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v2 1/8] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
Message-ID: <20230504112142.054e4c9a@eldfell>
In-Reply-To: <00621684a619329ba758f4a7212a591121633198.camel@vmware.com>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-2-zack@kde.org>
 <YvPfedG/uLQNFG7e@phenom.ffwll.local>
 <87lei7xemy.fsf@minerva.mail-host-address-is-not-set>
 <0dd2fa763aa0e659c8cbae94f283d8101450082a.camel@vmware.com>
 <20230503105415.62aa7a8d@eldfell>
 <00621684a619329ba758f4a7212a591121633198.camel@vmware.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WF6CuV3BN9g3x.Wlie/vKwf";
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
Cc: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "belmouss@redhat.com" <belmouss@redhat.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/WF6CuV3BN9g3x.Wlie/vKwf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 4 May 2023 01:43:51 +0000
Zack Rusin <zackr@vmware.com> wrote:

> On Wed, 2023-05-03 at 10:54 +0300, Pekka Paalanen wrote:
> > On Wed, 3 May 2023 03:35:29 +0000
> > Zack Rusin <zackr@vmware.com> wrote:
> >  =20
> > > On Tue, 2023-05-02 at 11:32 +0200, Javier Martinez Canillas wrote: =20
> > > > !! External Email
> > > >=20
> > > > Daniel Vetter <daniel@ffwll.ch> writes:
> > > > =C2=A0  =20
> > > > > On Mon, Jul 11, 2022 at 11:32:39PM -0400, Zack Rusin wrote:=C2=A0=
  =20
> > > > > > From: Zack Rusin <zackr@vmware.com>
> > > > > >=20
> > > > > > Cursor planes on virtualized drivers have special meaning and r=
equire
> > > > > > that the clients handle them in specific ways, e.g. the cursor =
plane
> > > > > > should react to the mouse movement the way a mouse cursor would=
 be
> > > > > > expected to and the client is required to set hotspot propertie=
s on it
> > > > > > in order for the mouse events to be routed correctly.
> > > > > >=20
> > > > > > This breaks the contract as specified by the "universal planes"=
. Fix it
> > > > > > by disabling the cursor planes on virtualized drivers while add=
ing
> > > > > > a foundation on top of which it's possible to special case mous=
e cursor
> > > > > > planes for clients that want it.
> > > > > >=20
> > > > > > Disabling the cursor planes makes some kms compositors which we=
re broken,
> > > > > > e.g. Weston, fallback to software cursor which works fine or at=
 least
> > > > > > better than currently while having no effect on others, e.g. gn=
ome-shell
> > > > > > or kwin, which put virtualized drivers on a deny-list when runn=
ing in
> > > > > > atomic context to make them fallback to legacy kms and avoid th=
is issue.
> > > > > >=20
> > > > > > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > > > > > Fixes: 681e7ec73044 ("drm: Allow userspace to ask for universal=
 plane list
> > > > > > (v2)")=C2=A0  =20
> > > >=20
> > > > [...]
> > > > =C2=A0  =20
> > > > > > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > > > > > index f6159acb8856..c4cd7fc350d9 100644
> > > > > > --- a/include/drm/drm_drv.h
> > > > > > +++ b/include/drm/drm_drv.h
> > > > > > @@ -94,6 +94,16 @@ enum drm_driver_feature {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * synchronization of command sub=
mission.
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 DRIVER_SYNCOBJ_TIMELINE=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D BIT(6),
> > > > > > +=C2=A0=C2=A0=C2=A0 /**
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRIVER_VIRTUAL:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Driver is running on top of virtual=
 hardware. The most significant
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * implication of this is a requiremen=
t of special handling of the
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * cursor plane (e.g. cursor plane has=
 to actually track the mouse
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * cursor and the clients are required=
 to set hotspot in order for
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * the cursor planes to work correctly=
).
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > +=C2=A0=C2=A0=C2=A0 DRIVER_VIRTUAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D BIT(7),=C2=A0  =20
> > > > >=20
> > > > > I think the naming here is unfortunate, because people will vonde=
r why
> > > > > e.g. vkms doesn't set this, and then add it, and confuse stuff co=
mpletely.
> > > > >=20
> > > > > Also it feels a bit wrong to put this onto the driver, when reall=
y it's a
> > > > > cursor flag. I guess you can make it some kind of flag in the drm=
_plane
> > > > > structure, or a new plane type, but putting it there instead of i=
nto the
> > > > > "random pile of midlayer-mistake driver flags" would be a lot bet=
ter.
> > > > >=20
> > > > > Otherwise I think the series looks roughly how I'd expect it to l=
ook.
> > > > > -Daniel
> > > > > =C2=A0  =20
> > > >=20
> > > > AFAICT this is the only remaining thing to be addressed for this se=
ries ?=C2=A0  =20
> > >=20
> > > No, there was more. tbh I haven't had the time to think about whether=
 the above
> > > makes sense to me, e.g. I'm not sure if having virtualized drivers ex=
pose
> > > "support
> > > universal planes" and adding another plane which is not universal (th=
e only
> > > "universal" plane on them being the default one) makes more sense tha=
n a flag
> > > that
> > > says "this driver requires a cursor in the cursor plane". There's cer=
tainly a
> > > huge
> > > difference in how userspace would be required to handle it and it's w=
ay uglier
> > > with
> > > two different cursor planes. i.e. there's a lot of ways in which this=
 could be
> > > cleaner in the kernel but they all require significant changes to use=
rspace,
> > > that go
> > > way beyond "attach hotspot info to this plane". =20
> >  =20
> > > I'd like to avoid approaches that
> > > mean running with atomic kms requires completely separate paths for v=
irtualized
> > > drivers because no one will ever support and maintain it. =20
> >=20
> > Hi Zack,
> >=20
> > you'd like to avoid that, but fundamentally that really is what has to
> > happen in userspace for *nested* KMS drivers (VKMS is a virtual driver
> > but not part of the interest group here) to reach optimality.
> >=20
> > It really is a different path. I see no way around that. But if you
> > accept that fact, then you could possibly gain a lot more benefits by
> > asking userspace to handle nested KMS drivers differently. What those
> > benefits are exactly I'm not sure, but I have a feeling there should be
> > some, where the knowledge of running on a nested KMS driver allows for
> > better decisions that are not possible if the nested KMS driver just
> > pretends to be like any other KMS hardware driver. =20
>=20
> I'm not quite sure I buy the "virtualized drivers return immediately from=
 a flip and
> require two extra integers on the cursor plane, so there's no possible wa=
y drm api
> could handle that" argument because it seems rather flimsy. If the premis=
e is that
> the paravirtualized drivers are so different that drm uapi can not handle=
 them then
> why would they stay in drm? What's the benefit if they'll have their own =
uapi and
> their own interfaces?

Hi Zack,

I never implied to go that far as you make it sound here.

I only pointed out that there definitely are behavioral differences
that userspace MUST acknowledge and handle. The cursor plane being
special is just the start.

It does not invalidate the whole existing KMS UAPI, but *if* you aim
for optimal performance, you cannot ignore the differences or paper
over them either.

This NOT a NAK to this patch series in any way!

> I'd flip the argument and say you'd be a lot happier if you accepted that=
 universal
> planes aren't really universal no matter what. If weston puts a spreadshe=
et app in a
> cursor plane presumably users would be concerned that their mouse cursor =
disappears
> when they enter the spreadsheet app and responding to their concerns with=
 "it's
> cool, the planes are universal" wouldn't quite work. Something needs to s=
pecial case
> cursor plane no matter what. Anyway, I think we went through this argumen=
t of what
> exactly "universal" refers to and whatever the definition of it is why I =
don't see
> why two extra integers on cursor planes violates any part of it so I'll l=
et it go.=C2=A0

If you say so.

But then you need userspace to set those two integers. The concept of
those two integers does not even exist without explicit care in
userspace. You are already letting go of your goal to not need special
case code or changes in userspace like you said in (copied from above):

> > > I'd like to avoid approaches that
> > > mean running with atomic kms requires completely separate paths for v=
irtualized
> > > drivers because no one will ever support and maintain it. =20

You want to make cursor planes special and not universal, which means
userspace needs special code to use them at all. That's a separate code
path. That is good! That is the way to get more performance through
better userspace decisions.

> I have nothing against any of those solutions - from creating whole new k=
ms uapi for
> paravirtualized drivers, through creating a new subsystem for paravirtual=
ized
> drivers. I just have no interest in implementing those myself right now b=
ut if
> someone implemented mutter/kwin code on top of either a new subsystem for
> paravirtualized drivers or implemented atomic kms on top of some new api'=
s for them,
> we'll be sure to port vmwgfx to that.=20

Again, I said half a meter, but you are jumping a mile.

I think you are seeing my comments as NAKs towards everything you try
to do. That's not my intention, and I cannot NAK anything anyway. I am
only pointing out that you seem too fixed to these details to see the
rest of the problems that hinder performance of nested KMS drivers.

See for example
https://gitlab.freedesktop.org/wayland/weston/-/issues/514

It's a nested KMS use case with qemu (would vmwgfx be any different?),
where the goal is to have zero-copy direct scanout from guest
application through guest KMS planes, qemu, host Weston onto host KMS
planes. The direct scanout works, but due to the UAPI design I
explained in my previous email, the only way to make that actually run
at ~full framerate is to very carefully manually tune the timings of
both guest and host Weston instance.

If you deem the cost of gaining that performance too high, that's fine.

However, I do absolutely believe, that if you wanted it, any Wayland
compositor project that aims to be in any way a performant general
purpose compositor for desktops or more would be willing to follow you
in using new UAPI that would make life better with nested KMS drivers.
You just have to ask, instead of assume that userspace won't hear you.
After all, working better is in their interest as well.

I *am* trying to push you forward, not stop you.

Sorry, I'll try to keep quiet from now on since I don't have any stakes
here.


Thanks,
pq

--Sig_/WF6CuV3BN9g3x.Wlie/vKwf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRTaxYACgkQI1/ltBGq
qqc3BBAAqD+lOm+2QLjIxHH8DKOskrQFneGAjryiHbtzCBctzojL4QSFC8yZqyxV
lqYWEejOlSjoNMvATHY3AfVYydH4PSvbOe4aTJgN6g0FVLlH04bWkqjwHIcdqBfG
nLlOQXpEadlD1jn2+Z4lO9wgmBR017SarMFmrHgsqF3RwLeyK8jeO1cVBKcuLsYm
QuO2QFRuURLxkAu/rzBSYRCrdFGnpkhKI6CTF5PaW6wsY2YHtBj9XuTsiVi8xml4
M53MegwmGrRHoro/2Kn+J7kl8VFcGQ+cD41R2mW6uHC5JcdRyKdN8+tYdPeuzH4q
EBMsTlEcIFKLRKPVCEFlKGOXf/B8rvSTzeldgALDknMlYfJiJr7C0ToRMM9yysk5
4PcbOn/vMCc8jPGOZk30V3lIMV5szVx401kHK8PSJz4mby3+U04APw+CmYoRofEL
s3NlaezFM3YeGPo4MM4LL0ilDdxWmhZJE5CfPorWrVDggiMr7y4Ch9f6Kb6yvSlN
/izdobEeX6pgf3qfgU+M6a20Mm/oFJL8tBuMJR1T1MdufeoxaIYklvfy1SDVdC8t
qnr9l9diii9Rfh2nteaJ4IVNur6vadnkEi7pwNFiuw7unAk/dj2qLkb7BZ09pXnw
OzkLy6gsF4s9s4v1eLXfpa1LrhwIQ7CfA+paYow4sEeGjpzD/do=
=0O42
-----END PGP SIGNATURE-----

--Sig_/WF6CuV3BN9g3x.Wlie/vKwf--
