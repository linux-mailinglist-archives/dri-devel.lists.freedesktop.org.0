Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E295480BF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 09:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7690610F114;
	Mon, 13 Jun 2022 07:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604C410F10D;
 Mon, 13 Jun 2022 07:45:34 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id g25so5276997ljm.2;
 Mon, 13 Jun 2022 00:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=BO/m0h00Gn73F4kzFvGrNFUqt8cqMAPzMiSuSnYNKyA=;
 b=EhNuglu9Dyc9+2a3HW04yeiYBup5vKpHC7GXg/foOM6wt4pcFwhIYYBvlHqjhVk75C
 XYoWykhtvU3SCCGdg6egKaqOJsWm5zi7T1V3zRO+R74eYa++r5PZWbk7cfOfItZZ5kTi
 iw+RZrcgC1JP+0kOSO7NtVJWa/DG0NueJ59vDAmkjBkz+dVT7CMC5jIzVtQ8t6AvTtqN
 dfJeCsSjMRxdcs7u9flo4k9hnT3W+lsscnr5TmzmLfz0VCXsN8InQxntcs7XE6yNphfo
 FNpvt86F0V5sihJNM4u6BenAfyoJZ16R8j4tq063V0yxH7GRlrGcyto0Q259VS4Vm+pz
 xayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=BO/m0h00Gn73F4kzFvGrNFUqt8cqMAPzMiSuSnYNKyA=;
 b=XOBPu6Fb8d3HqXhwMyRtyeAreOjPSeF3erGzQP6ocNcrOzpoRLEX+JRfW26en/CC9m
 UhStGEbFFxM6HivK6UNGG2gzPX4lsCf/xceu4pi7W/5La6giqtyp77oxw+vHaOAtspVJ
 wmVGRxHbGAQWSziI+K4jBQ6pAIL71DWcpDZh9U2enxl1oOgqhWjWsuHU0qiadCY5/0jR
 tDznr/TF2i8q8uO8XMOaGZY3EX8eA29Pjx1LAUZqK6U9teSdrWZu6N8k06esT5runr7C
 HeeANyBSj02imlDHPogYH0va7iDll+M4rSpgKaxn/tZf9Gbas8iycbr/02YKSt4Q9gg5
 AOAQ==
X-Gm-Message-State: AOAM530c7RtygjTAupXBAZ0vUExcn4ZaLxupEABQKTnbQYGG9I+Q4Vk5
 fxBaX8KKyXzLAKGfAMEvLpc=
X-Google-Smtp-Source: ABdhPJzeCBr8KhEU/relZMZdVoUW2U+6NoXW0YSj2LoWKFBpjixbwB9Mt5mW/Rn1Zx2pAOG0UkwTfg==
X-Received: by 2002:a2e:a315:0:b0:259:e8b:5b23 with SMTP id
 l21-20020a2ea315000000b002590e8b5b23mr534668lje.115.1655106332517; 
 Mon, 13 Jun 2022 00:45:32 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 j15-20020a056512344f00b00479353215b3sm887603lfr.139.2022.06.13.00.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 00:45:32 -0700 (PDT)
Date: Mon, 13 Jun 2022 10:45:29 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220613104529.25fc650a@eldfell>
In-Reply-To: <efdc6bb7-d088-467d-b843-a6e579263c61@redhat.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
 <lcIVipq8mkBAPioQAVQmwsM_Gwo0e9fd2334yGSvIW6uEIEElwUrTe-x9J9h29TB1H3NY3liNCohaXDyjslDFIqxPZNSPbSPJ3vctA2jEAk=@emersion.fr>
 <YqMTk9C8/g1buL+8@phenom.ffwll.local>
 <20220610123629.fgu2em3fto53fpfy@sirius.home.kraxel.org>
 <_D4uOTfLqaVCoV94kNfeXYvOph3EjOL80mbzeJNHm1EPqranCclhnAjS2dj40X32-wE8Nux_QM-m-LBXHSHLkXu0P5oypBYLLK3_MWK4STg=@emersion.fr>
 <efdc6bb7-d088-467d-b843-a6e579263c61@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Bk3ZOO46_t3vleYvIDt+cRI";
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 mombasawalam@vmware.com, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, krastevm@vmware.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Bk3ZOO46_t3vleYvIDt+cRI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 11 Jun 2022 17:34:50 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
>=20
> On 6/10/22 14:53, Simon Ser wrote:
> > On Friday, June 10th, 2022 at 14:36, Gerd Hoffmann <kraxel@redhat.com> =
wrote:
> >  =20
> >> Hi,
> >> =20
> >>>> As Pekka mentionned, I'd also like to have a conversation of how far=
 we want to
> >>>> push virtualized driver features. I think KMS support is a good feat=
ure to have
> >>>> to spin up a VM and have all of the basics working. However I don't =
think it's
> >>>> a good idea to try to plumb an ever-growing list of fancy features
> >>>> (seamless integration of guest windows into the host, HiDPI, multi-m=
onitor,
> >>>> etc) into KMS. You'd just end up re-inventing Wayland or RDP on top =
of KMS.
> >>>> Instead of re-inventing these, just use RDP or waypipe or X11 forwar=
ding
> >>>> directly. =20
> >> =20
> >>>> So I think we need to draw a line somewhere, and decide e.g. that vi=
rtualized
> >>>> cursors are fine to add in KMS, but HiDPI is not. =20
> >>
> >>
> >> What is the problem with HiDPI? qemu generates standard edid blobs,
> >> there should be no need to special-case virtualized drivers in any way.
> >>
> >> What is the problem with multi-monitor? That isn't much different than
> >> physical multi-monitor either.
> >>
> >> One little thing though: On physical hardware you just don't know which
> >> monitor is left and which is right until the user tells you. In case of
> >> a virtual multi-monitor setup we know how the two windows for the two
> >> virtual monitors are arranged on the host and can pass that as hint to
> >> the guest (not sure whenever that is the purpose of the
> >> suggested_{x,y} properties). =20
> >=20
> > The problem with suggested_x/y is described here:
> > https://lore.kernel.org/dri-devel/20220610123629.fgu2em3fto53fpfy@siriu=
s.home.kraxel.org/T/#m119cfbbf736e43831c3105f0c91bd790da2d58fb
> >=20
> > HiDPI would need a way to propagate the scale factor back-and-forth:
> > the VM viewer needs to advertise the preferred scale to the guest
> > compositor, and the guest compositor needs to indicate the scale it
> > renders with to the VM viewer.
> >=20
> > Sounds familiar? Yup, that's exactly the Wayland protocol. Do we really
> > want to replicate the Wayland protocol in KMS? I'm not so sure.
> >  =20
> >>> It's getting a bit far off-topic, but google cros team has an out-of-=
tree
> >>> (at least I think it's not merged yet) wayland-virtio driver for exac=
tly
> >>> this use-case. Trying to move towards something like that for fancy
> >>> virtualized setups sounds like the better approach indeed, with kms j=
ust
> >>> as the bare-bones fallback option. =20
> >>
> >> virtio-gpu got the ability to attach uuids to objects, to allow them
> >> being identified on the host side. So it could be that wayland-virtio
> >> still uses kms for framebuffers (disclaimer: don't know how
> >> wayland-virtio works in detail). But, yes, all the scanout + cursor
> >> handling would be out of the way, virtio-gpu would "only" handle fast
> >> buffer sharing. =20
> >=20
> > wayland-virtio is not used with KMS. wayland-virtio proxies the Wayland
> > protocol between the host and the guest, so the guest doesn't use KMS
> > in that case. =20
>=20
> It would be more correct to say: wayland clients inside the guest
> don't talk to a compositor inside the guest (but rather one
> outside the guest) and thus also don't depend (indirectly) on\
> having kms inside the guest.

Both ways may work. There are many Wayland compositors that can present
to another Wayland display.

In my mind which architecture you use depends on whether you want a root
window for the VM (with the ability to run any desktop in the guest
as-is) or whether you want root-window-less integration of VM/guest
applications into the host desktop.

> But the guest likely still needs kms for e.g. the kernel console
> to e.g. debug boot failures.

Sure. That doesn't need cursor planes at all, or anything else that
virtualised guest KMS drivers are specially adding to make specifically
a desktop experience more smooth.

> Note this could be done over a serial
> console too, so in some cases whatever "video-card" emulation
> the guest has could theoretically go away. But it is also completely
> possible for a guest to have both some emulated video-card which
> offers a kms API to userspace as well as wayland-virtio.

Of course. However the question here is, how far are we willing to
complicate, bend and even break KMS UAPI contract to make the KMS path
work in more fancy ways (likely with sub-optimal performance due to its
fundamental design) when something like wayland-virtio already exists
which allows for much more and in much better ways.


Thanks,
pq

--Sig_/Bk3ZOO46_t3vleYvIDt+cRI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKm6xkACgkQI1/ltBGq
qqevPA/+J57GhHqBE5SNVm87EZcKpfv2AUg7IpzcsTKr+wCRwXMkpvi4qKyHTU2S
jH+pZwsgl9zkNeY6OxfJvgqYS0cytoOn8GZK55ClOmAX1DK4K+8qyjySTXxoH+Dh
ANPjmhCEZ8YJBStEuQ9teF3ukT+oKZQWBqv3daJZnjgwF4hF1bslXMZJZPXVesH8
yJZjHNKFDqkR/yRA7OOGOuGn+AjWS+pB68RmH96QocAU9Lk05TR2+5Pt9rUphYNL
2zphXiGhIHNYBjb9rMTrND5CCV5h9GxHIwOEGwNqFAP5x21ljlMFvUe0gb7r2lCY
nwtwlyfPwTOLeYIGFtrLF/LId11OlwxJg/0xclVCKYdMQIHAmCjzozbZ66000DnM
0rrJAyJqz1RmSJfxil18+pGHCj82j9i25aHTS/j8YoVe4TbksUT18CMc5awO03EI
Qny2fvi4AjG+0cHwlVporRpPNiE2yO46z5qn+bgi3+5Mv+6Ba2Gt7wnVxZ+mDdLO
ebBRcZecxn7uha28L8z6yuqHp/poPFN4nU38gjPyJXGPHtSZrgRgqv/bsObsMrEy
vXXp2O7qZCfJ6JYp1nFd41pUchn9C3DEls05ku6OfKhYwKyI+QaTbuM7PMR9gYB4
UECVSHEZlHh+o8AL1KwcYBzN7yyiK28LsYevDXnkIz8ADW6FouU=
=6wKH
-----END PGP SIGNATURE-----

--Sig_/Bk3ZOO46_t3vleYvIDt+cRI--
