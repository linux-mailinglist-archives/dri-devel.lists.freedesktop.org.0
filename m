Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C179E2C3F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 20:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731AF10EB3E;
	Tue,  3 Dec 2024 19:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="a0Fsxmyj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A0F10EB46
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 19:46:23 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6ef7a0b65f4so27387347b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 11:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1733255183; x=1733859983;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4EQ/buo3pSxVHdBglFrUPi76eBT5Ai9q3NOQz5qCAb8=;
 b=a0FsxmyjhrsknaJ/Nzn+9ZlycntbRZqZL+REBGXLjcljM/B7l5eN6n0F7R1UGDw4xT
 Zhm+znHzv7V6GRxoBh9BEETJn6AoKJ0/J07I6QuJnmSOzEOO/jn3hXgzMsw16rb+nDSu
 7MrUqG0HV04ZGgMrNEweXSsok4aMDrhZNw4Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733255183; x=1733859983;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4EQ/buo3pSxVHdBglFrUPi76eBT5Ai9q3NOQz5qCAb8=;
 b=LyE/hnu9ZHWkbLzs2bmijWMUc5CLvsDc1F/JczX6UdBJxy3ZfvSo4zj2eFFuL4pKMA
 NbG31v73U3uaQBc9KYJLQLl/HlpyAXF18cPdC975TJCwT3uVpORpugmZXXSZoEXilQvC
 soVeYMzPxA0D+4wKuU6eOznppGgHjiP74gktrRRSilZYkdyHStSj0kl1rQ76Qz64rGLu
 oSfcgWC1qeSHeDYchuqIMKEmlnYfdaAccnqo6DChdi0R6UUFaIh+8qq05gRA08qUs8u1
 VuZZe6M7R5n8VNw6ElpdXs7EY29kk3lQprH3xyjcnB5Lpacy2vFdJ5nEeE8xj8KXvr62
 TBuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRrAmUChkLn8w34IcXy0kuPbnFYCMs64GeFIn5gNysGlknUEXcxDELoznEDG/y7x8JKrUllGrY37s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywjtx8GRnaEw1iOMO+/tx/q2F7i8UaymVgldDxMM8DdE3bWpxqo
 nRhKtZgjzMXJuOaFXv9sE+baFqLGagWP2YYgsbUN5y4mUZQMUznMhcgfF5wOStM1S5fQLgNhvNN
 e2lvs41hjQAXsnBFsBRjRKbVSbqKNd9XQHj3M
X-Gm-Gg: ASbGncsp3LApr+DCMRqVvoeiMse9PdUH/dCXvc9gFP6+MJeliu+/Syo8/Ta5Wz4ISay
 N44d4n8FeBSTAZzYtr8by/corOLGJ0Da3
X-Google-Smtp-Source: AGHT+IE1fkuIJuozew1xC00yytIGRqYUn659Lyc569IwYAmy1cIOxK+W3jRJtAxUU3KMrOQqwhfsYelO0FBQoC4TGPI=
X-Received: by 2002:a05:6902:f88:b0:e38:7d0d:d7df with SMTP id
 3f1490d57ef6-e39de29b27fmr1381896276.50.1733255182691; Tue, 03 Dec 2024
 11:46:22 -0800 (PST)
MIME-Version: 1.0
References: <20241119194038.530779-1-ian.forbes@broadcom.com>
 <40815234-baa2-4990-9f30-0a0632871a0c@suse.de> <878qte2oj3.fsf@intel.com>
 <CABQX2QOWGW=Z3Ox8P5-rDktyepzxwqRTrWb5Ycr0MVtnEQH_uA@mail.gmail.com>
 <Z08qdJUuerXOV-dR@gmail.com>
 <CABQX2QOy0sD3QrmG-hxdDgwTrffz0tnPzqvs2BhORQ1w2pTgww@mail.gmail.com>
 <Z08ygwwkmNp8dnHy@gmail.com>
 <CABQX2QPah6M0jY38cTUO4D=kO9_aYDdaJ5hbX8Ah3z2zAucj9w@mail.gmail.com>
 <Z09MN-9qXeQrAXRc@gmail.com>
In-Reply-To: <Z09MN-9qXeQrAXRc@gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 3 Dec 2024 14:46:10 -0500
Message-ID: <CABQX2QPwASbDMJf85XQfcEF4bjeSfULrqhDjQih9GZj73aE=9w@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Add Fake EDID
To: =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org, 
 bcm-kernel-feedback-list@broadcom.com, martin.krastev@broadcom.com, 
 maaz.mombasawala@broadcom.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000007e6596062862ebb7"
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

--0000000000007e6596062862ebb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 1:21=E2=80=AFPM Jonas =C3=85dahl <jadahl@gmail.com> =
wrote:
>
> On Tue, Dec 03, 2024 at 11:39:05AM -0500, Zack Rusin wrote:
> > On Tue, Dec 3, 2024 at 11:32=E2=80=AFAM Jonas =C3=85dahl <jadahl@gmail.=
com> wrote:
> > >
> > > On Tue, Dec 03, 2024 at 11:27:52AM -0500, Zack Rusin wrote:
> > > > On Tue, Dec 3, 2024 at 10:57=E2=80=AFAM Jonas =C3=85dahl <jadahl@gm=
ail.com> wrote:
> > > > >
> > > > > On Wed, Nov 20, 2024 at 07:52:18AM -0500, Zack Rusin wrote:
> > > > > > On Wed, Nov 20, 2024 at 5:22=E2=80=AFAM Jani Nikula <jani.nikul=
a@linux.intel.com> wrote:
> > > > > > >
> > > > > > > On Wed, 20 Nov 2024, Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
> > > > > > > > Hi
> > > > > > > >
> > > > > > > >
> > > > > > > > Am 19.11.24 um 20:40 schrieb Ian Forbes:
> > > > > > > >> Most compositors are using a change in EDID as an indicato=
r to
> > > > > > > >> refresh their connector information on hotplug regardless =
of whether the
> > > > > > > >> connector was previously connected. Originally the hotplug=
_mode_update
> > > > > > > >> property was supposed to provide a hint to userspace to al=
ways refresh
> > > > > > > >> connector info on hotplug as virtual devices such as vmwgf=
x and QXL
> > > > > > > >> changed the connector without disconnecting it first. This=
 was done to
> > > > > > > >> implement Autofit. Unfortunately hotplug_mode_update was n=
ot widely
> > > > > > > >> adopted and compositors used other heuristics to determine=
 whether to
> > > > > > > >> refresh the connector info.
> > > > > > > >>
> > > > > > > >> Currently a change in EDID is the one heuristic that seems=
 to be universal.
> > > > > > > >> No compositors currently implement hotplug_mode_update cor=
rectly or at all.
> > > > > > > >> By implementing a fake EDID blob we can ensure that our ED=
ID changes on
> > > > > > > >> hotplug and therefore userspace will refresh the connector=
 info so that
> > > > > > > >> Autofit will work. This is the approach that virtio takes.
> > > > > > > >>
> > > > > > > >> This also removes the need to add hotplug_mode_update supp=
ort for all
> > > > > > > >> compositors as traditionally this niche feature has fallen=
 on
> > > > > > > >> virtualized driver developers to implement.
> > > > > > > >
> > > > > > > > Why don't you fix the compositors instead?
> > > > > > > >
> > > > > > > > I feel like NAK'ing this patch. The code itself is not so m=
uch a
> > > > > > > > problem, but the commit message.
> > > > > > >
> > > > > > > Oh, I think the code is problematic too.
> > > > > > >
> > > > > > > Please avoid all struct edid based interfaces, in this case
> > > > > > > drm_connector_update_edid_property(). They will be removed in=
 the
> > > > > > > future, and adding more is counter-productive. Everything sho=
uld be
> > > > > > > struct drm_edid based going forward.
> > > > > > >
> > > > > > > Of course, actually grafting the EDID needs struct edid. And =
that's kind
> > > > > > > of annoying too. Do we really want to spread the EDID details=
 all over
> > > > > > > the place? This one combines drm_edid.h structs and magic num=
bers in a
> > > > > > > jumble. I'm kind of hoping we'd get rid of driver usage of st=
ruct edid,
> > > > > > > though that's a long road. But we've made a lot of progress t=
owards it,
> > > > > > > there aren't that many places left that directly look at the =
guts of
> > > > > > > EDID, and most of it is centralized in drm_edid.c.
> > > > > > >
> > > > > > > Of course, not using the standard drm_edid_read* interfaces a=
lso lacks
> > > > > > > on features such as providing the EDID via the firmware loade=
r or
> > > > > > > debugfs, which can be handy for testing and debugging, but th=
at's a
> > > > > > > minor issue.
> > > > > > >
> > > > > > > > Maybe it resolves problems with
> > > > > > > > compositors, but it is a step backwards for the overall eco=
system. If
> > > > > > > > the connector changes, your driver should increment the epo=
ch counter.
> > > > > > > > [1] That will send a hotplug event to userspace. The EDID a=
lone does not
> > > > > > > > say anything about connector status.
> > > > > > >
> > > > > > > Yeah, unplugging and replugging the same display with the sam=
e EDID
> > > > > > > isn't a problem for other drivers, and they don't have to do =
this kind
> > > > > > > of stuff to trick userspace. Maybe vmwgfx should handle (or s=
imulate)
> > > > > > > hotplugs better?
> > > > > >
> > > > > > I don't think that's what Ian is trying to fix. There's two dif=
ferent issues:
> > > > > > 1) The code using struct edid which is frowned upon.
> > > > > > 2) The virtualized drivers not behaving like real GPU's and thu=
s
> > > > > > breaking userspace.
> > > > > >
> > > > > > vmwgfx and qxl do not provide edid at all. It's null. But every=
 time
> > > > > > someone resizes a host side window in which the para-virtualize=
d
> > > > > > driver is displaying, the preferred mode changes. Userspace kep=
t
> > > > > > checking whether the edid changes on each hotplug event to figu=
re out
> > > > > > if it got new modes and refresh if it noticed that edid changed=
.
> > > > > > Because on qxl and vmwgfx the edid never changes (it's always n=
ull)
> > > > > > Dave added hotplug_mode_update property which only qxl and vmwg=
fx send
> > > > > > and its presence indicates that the userspace should refresh mo=
des
> > > > > > even if edid didn't change.
> > > > > >
> > > > > > Because that property is only used by qxl and vmwgfx everyone g=
ets it
> > > > > > wrong. The property was specifically added to fix gnome and Ian
> > > > > > noticed that currently even gnome is broken:
> > > > > > https://gitlab.gnome.org/GNOME/mutter/-/blob/main/src/backends/=
native/meta-kms-connector.c#L940
> > > > > > hotplug_mode_update doesn't change, it's just a flag that indic=
ates
> > > > > > that userspace needs a  full mode rescan.
> > > > >
> > > > > The linked line just means the property value itself not changing
> > > > > doesn't result in a full compositor side monitor reconfiguration.
> > > >
> > > > Right, that's exactly the point I'm making :) The property isn't us=
ed
> > > > correctly because the full-rescan is expected when that property is
> > > > present, not if it changed.
> > >
> > > Well, a full rescan did happen, and the linked code only determines i=
f
> > > anything actually did change, including currently advertised modes, t=
hat
> > > will have any potential effect on the final monitor configuration.
> >
> > The point I'm making is that no one is using this property correctly.
> > Mutter triggering a full-rescan as a result of other changes doesn't
> > change the fact that its usage of that property is broken.
> > I think
> > you're interpreting my comment that usage of that property is broken
> > (or not used at all) everywhere as "Mutter is not refreshing
> > correctly" which is not the case. Mutter does resize correctly despite
> > the fact that the property check is broken.
>
> Ah, yes, I interpret it as something was broken, but I suppose it is
> working as expected.
>
> We're indeed apparently using it incorrectly by reading the property
> value. After having seen this thread, I went and checked the commit
> history, and it seems the implementation has flip flopped between
> reading the property, and checking its existence, for more than a
> decade. I suspect a reason for this might have been that the property
> itself doesn't seem to be documented anywhere. Or is it? I have not yet
> found that it is.

Yea, I think Ian was planning to update docs for it at some point.
It's a confusing one because it's really just a flag. For most
properties it's the fact that they changed between the old and the
current state that implies that a rescan is needed, for
hotplug_mode_update it's the presence i.e. if the property is present
a full-rescan is needed and when it's absent the regular paths can be
taken (i.e. just comparing edid's would be enough).

Plus a lot has changed since that property was introduced e.g.
userspace often performs more checks than just comparing edid's which
means that using the property incorrectly or not using it at all
doesn't necessarily mean that anything is visibly broken.

> The following would probably make the implementation conform to the
> expectations of the property:
>
> ```
> diff --git a/src/backends/native/meta-kms-connector.c b/src/backends/nati=
ve/meta-kms-connector.c
> index cc6cd89f56..a4b9deb85e 100644
> --- a/src/backends/native/meta-kms-connector.c
> +++ b/src/backends/native/meta-kms-connector.c
> @@ -369,7 +369,7 @@ state_set_properties (MetaKmsConnectorState *state,
>
>    prop =3D &props[META_KMS_CONNECTOR_PROP_HOTPLUG_MODE_UPDATE];
>    if (prop->prop_id)
> -    state->hotplug_mode_update =3D prop->value;
> +    state->hotplug_mode_update =3D TRUE;

It's closer. In Mutter there's no reason to compare it at all, e.g. instead=
 of
if (state->hotplug_mode_update !=3D new_state->hotplug_mode_update)
    return META_KMS_RESOURCE_CHANGE_FULL;
it should probably be:
if (state->hotplug_mode_update)
    return META_KMS_RESOURCE_CHANGE_FULL;

z

--0000000000007e6596062862ebb7
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJkMIICYAIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEII0T
Kut6OosrQS1XWJQP81l/zap32UzWJ4c65+XSUMotMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI0MTIwMzE5NDYyM1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJ
KoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBGdnFR1Rc9B1nwXa7/Ajc9
DqC9xIbaWABK4bWFB7dGw0UHzrxgsE77hT9riphpmDiqvg6ajpchQtqM05H0kCdSk+K44cd4Gb3d
ARiBt2jEcRBxMkXgtoqJdVzPCdUyQHPSh4boGykztTIpVP+QrkbBzfKMZzZ5Fbc+RheC+S5EUxY1
hqpkMuqm6yb5Q6zw5t4yVWuGk+HtdmejmolZe70zw6XbLPAD4g8W0JMmzril4/yQkvBdz7t20Hj6
d6L1GOlVjhWd1rTYp6zo9gk/laxZuPxlnp8rcNyXqWx+NBBT6xsPXXZ7qzVrTvjVC8soo8rHiXB1
2PmoyH6CNUSVnQrq
--0000000000007e6596062862ebb7--
