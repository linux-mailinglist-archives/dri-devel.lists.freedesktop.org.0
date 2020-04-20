Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D266F1B045E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 10:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2F48921D;
	Mon, 20 Apr 2020 08:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50038921D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 08:27:16 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id h6so7207367lfc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 01:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=mjfEPMlPvHbtRsfYrtr2lqjfHh/qWe9aOir+0r9/G70=;
 b=VwBgQdplvc34BPUyRmmK8GdUhgecP/DCU93tSbTk2He6CnKY00dSKCu4hfnG04P4mU
 h3P/ilL/ag1Ke1E616wGEjeWsDSGXDJiUvdfGmEGGn8jBFrOoHGveDdoJp/wSkpeeD3t
 ZR7eDlcEhMxGkI8fSTIPY/9g6rNxaFuSvCVJEhS+RRvVU56N7DjGMzdwTAJNr7UpVBbD
 k1n5Zs11ncH1IdRuULdGvnzuov71Rd26sscqjsd36zIOT0UVgmMjbXrYO1Ek/qqbBiYu
 CQeliFHfvclW8VzRiVrowMiUeksD8SSozBFzCLP+os7dVnDfQJFQFpJyNkr2s7RiStmW
 DGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=mjfEPMlPvHbtRsfYrtr2lqjfHh/qWe9aOir+0r9/G70=;
 b=eJLhcquLa6liLb/5OkJIarIfkVgt8VHhEFD/C8B5W6DO9czERAqNLcoxLisxrg0ID5
 FkNQlrp4dQANbRCUpDpZNg67irVtbQjrZ4ej/0ARd45O6FBmO7qRVFWvCYipUX+PaVXK
 wHSFOvOuJ3VFUBbDGNHi4/tRdaMMRY/heYrt8QlVvdkMtppE2tuxFxeRJcM3SW2kPFbE
 NyHazhXufAoxCYSfqSzLR4iEGYNg04D+UTedN7HdG1XwjRZDGZldBO/L/5loUHv7JhGp
 lc8wnCaDvL8+EIF4VglhnSItb3Be9aLGXncDxiVehMkle5L4dTlJI9++rQyGCaZfTVGm
 CKVA==
X-Gm-Message-State: AGi0Pubr4wpzwFe0M23r49RDAoV48p+VzVGe5en02Yl9Dz9LprCqdYPQ
 M+xdF0s2KPcTgMnBRGBjTys=
X-Google-Smtp-Source: APiQypKBwPK/xegS8kQHfb2L/cTBoN2B+3RVKAAqQ77+Cc4K1fXt0iMAKoghX0CzTbh9g0szQNt0bQ==
X-Received: by 2002:a05:6512:3f4:: with SMTP id
 n20mr9957846lfq.100.1587371234905; 
 Mon, 20 Apr 2020 01:27:14 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id i3sm362868ljg.82.2020.04.20.01.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 01:27:14 -0700 (PDT)
Date: Mon, 20 Apr 2020 11:27:04 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Operating KMS UAPI (Re: RFC: Drm-connector properties managed by
 another driver / privacy screen support)
Message-ID: <20200420112704.68d02472@eldfell.localdomain>
In-Reply-To: <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Benjamin Berg <bberg@redhat.com>, David Airlie <airlied@linux.ie>,
 Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nitin Joshi1 <njoshi1@lenovo.com>, Rajat Jain <rajatja@google.com>,
 Mark Pearson <mpearson@lenovo.com>
Content-Type: multipart/mixed; boundary="===============1563125147=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1563125147==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/N8/lUunJtCOVuZCbfn41kZ."; protocol="application/pgp-signature"

--Sig_/N8/lUunJtCOVuZCbfn41kZ.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Apr 2020 16:17:18 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, Apr 17, 2020 at 11:02 AM Pekka Paalanen <ppaalanen@gmail.com> wro=
te:
> >
> > Hi,
> >
> > let's think about how userspace uses atomic KMS UAPI. The simplest way
> > to use atomic correctly is that userspace will for every update send the
> > full, complete set of all properties that exist, both known and unknown
> > to userspace (to recover from temporarily VT-switching to another KMS
> > program that changes unknown properties). Attempting to track which
> > properties already have their correct values in the kernel is extra
> > work for just extra bugs. =20
>=20
> Uh if you do that you'll get random surprising failures if you don't
> also set ALLOW_MODESET, because that way you'll automatically repair
> link failures and stuff like that. I'm assuming your userspace only
> supplies all the properties for crtc and planes, and leaves connectors
> as-is? Otherwise you already have some fun bugs.
>=20
> In general I'd say userspace shouldn't write stuff it doesn't
> understand. If you limit yourself to just the properties you do want
> to (re)set, that's safe. But if you just blindly write everything all
> the time, random modesets, and hence random failures if you don't set
> ALLOW_MODESET.

Hi,

how should userspace KMS program A recover from the situation when
switching the VT back from KMS program B who changed properties that
program A does not recognise? (I believe Weston does not recover at
the moment.) This is very important for getting e.g. reliable color
reproduction, since not all KMS programs are always up-to-date with
everything the kernel exposes and people may switch between them. Not
resetting everything may even encourage people to write hacks where you
temporarily VT-switch away, run a KMS program to set one property, and
then switch back assuming the property remains set. I have already seen
someone mention they can enable VRR behind the display server's back
like this.

I don't think Weston records and re-sets unknown properties yet, but I
assumed it is what it needs to do to be able to reliably recover from
VT-switches. In that case ALLOW_MODESET is of course set since all
state is unknown and assumed bad.

I do believe Weston re-submits *everything* it knows about every
update, except for CRTCs and connectors it has already disabled and
knows are in disabled state (this could change though).

However, during steady-state operation when ALLOW_MODESET should not be
necessary, is it still harmful to re-program *all* properties on every
update?

After all, the kernel will just no-op all property setting where the
value is already the right one, does it not?

The only "random" KMS state is the properties the userspace KMS
program does not know that are set on start-up. I have been assuming
that as long as you had fbdev active before the KMS program started,
the unknown properties have "harmless" default values. And maybe even at
driver device init if fbdev does not exist?

Is there something more up-to-date than
https://blog.ffwll.ch/2016/01/vt-switching-with-atomic-modeset.html ?

> > Assuming the property is userspace-writable: if kernel goes and
> > changes the property value on its own, it will very likely be just
> > overwritten by userspace right after if userspace does not manage to
> > process the uevent first. If that happens and userspace later
> > processes the uevent, userspace queries the kernel for the current
> > proprerty state which is now what userspace wrote, not what firmware
> > set.
> >
> > Therefore you end up with the firmware hotkey working only randomly.
> >
> > It would be much better to have the hotkey events delivered to
> > userspace so that userspace can control the privacy screen and
> > everything will be reliable, both the hotkeys and any GUI for it. The
> > other reliable option is that userspace must never be able to change
> > privacy screen state, only the hardware hotkeys can. =20
>=20
> We have fancy new uevents which give you both the connector and the
> property, so you know what's going on.

Yeah, userspace can know what changed, but not the new value with the
uevent.

> Also, a property which userspace and the kernel can race like you
> describe above is broken. We don't have these, and we won't merge
> them.

That's what I would expect, yes, but I'm not that optimistic that the
knowledgeable maintainers can always catch them all, which is why I try
to comment on UAPI additions that look fishy to me.

> The ones we do have the state transitions are a lot clearer, and
> userspace overwriting what the kernel has done is not actually going
> to cause a big pain. At least in the sense of the transition will be
> lost, since for e.g. both link_status and hdcp the value the kernel
> sets is not a value userspace can set. But it can result in problems
> if you just blindly write them again causing modesets you'd not
> expect.

Yeah, HDCP "Content Protection" is very carefully engineered to cope
with the awkwardness that both userspace and kernel will write it. It's
cumbersome.

Btw. I searched for all occurrences of link_status in
https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html and it seems it
only has two possible values, good and bad, and no mention whether it
is writable. Looks like it's writable. There does not seem to be a) an
explanation how exactly it needs to the handled (writing it does
something? what can you write?) or b) any way discern between kernel
and userspace set values like HDCP "Content Protection" has.

Weston does not support link_status yet, FWIW.

Unless you have some other idea on how to reset unknown KMS state to
sensible defaults that are always the same, I think any KMS property
where the query can return a value that cannot be written back to it
with ALLOW_MODESET is broken.


Thanks,
pq

--Sig_/N8/lUunJtCOVuZCbfn41kZ.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6dXNgACgkQI1/ltBGq
qqfxHw/9GZZANVQaaMueTPysm9/N4wmvu4BgdcjDTEpmA+TGmvzLo+5yTDPZxCmP
wF7HhuSN4EvQfbCgeHEidXJ5pGo+5xSL9NxpTVgKn5ZjQI5zEUtdHvG22gmJHnuW
TRzOJ5L4NJF3T4d+/snqH3ASqzSVG4V3ritNFL/0ZhMJlw3Q1HBvpqg6Cacbnnn9
W5XdcHx6x6nw5eRfwXO8bpjsyIG5FXfu5Q+CbBQbD1Nrk6huNZe5s0p2zAvLKN9n
gOgwYE/CokLDqgVTAjI7w4e0RGBl5Ru4TW8kibpXQoJORtKQoVcXhA9HMhwtXgaN
++TSNxKMZ97GtET0V1zA0hilaWWlMWb7ct1cyqL7ESH2EH3IWejNISWu0T9bpRlu
hA4REHvVMexjOoWpAZmsDmPrzhv+8HrcbMr+F821UZ0QH9zMX41LAqPrctmC6PBE
eOvZUyOxBPGzKg6f5g+nUQ/TXlGoab3VlZgC2xpQNoZWa+hGXX5uD/wERqWkFRKA
LKQo13Iybc2mQYPKqZQiHAxfpr/owMO1c0uB8v+CeAuFO0/9XId5CEFW284X54ZS
o6jIukee3luJkPgKAxNbDEciEi5XCXjIrEhOBJinB6S6/AkGvNu3HTTZRvis5QP5
EHqW21lau80bwohtmahfgrEsqDZkYLZzc88XTDr/xsh4qwqZ+NI=
=QiMa
-----END PGP SIGNATURE-----

--Sig_/N8/lUunJtCOVuZCbfn41kZ.--

--===============1563125147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1563125147==--
