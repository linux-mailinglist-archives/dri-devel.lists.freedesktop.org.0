Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1190918C9A5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 10:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3405B6E053;
	Fri, 20 Mar 2020 09:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14A76E053
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 09:13:10 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id s1so3917016lfd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 02:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=oZkzrxFENkgUgs4EFUFUfSaWwQVz9BPCYLNPnTSYJd8=;
 b=Q8zcSC8MS7m0bw1RY+WkU3oSuOhnjsyVlX8fXmHbYUz5oDrmgl5LNgjTkd12qXQjPd
 aey73yeel0Xn0geQE5tXi9ryHVnK4Z5WOWDqsV1glajj9X5pdlHZjGNtvfHtyL5/fZWA
 8OACEVDvut/o0+JdejN8dU1Q2b24MMCQ3N9PslgyLKi6jRuYNl4dCHalmCAwnCGY8+qY
 bnwxgcUaQn3oXO1E9DqzwLCnrOIp/5Gyf3rxeHCWS8C8CsAkDqMdsBPs3dcOrGgIschA
 IbQUmGbrmqZNNRUpo2BeuidQ5rOd7hwzK6IT4g+cXBbSFpB8Pj9aGn918zbdNrUlXfDs
 PHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=oZkzrxFENkgUgs4EFUFUfSaWwQVz9BPCYLNPnTSYJd8=;
 b=TK0xdXPok8tRAxtCjUpsnTy9QyOE8ji3JxLfVKQNkDynAocDGFW9XWzkdBtT42vwWh
 Ltonk5T2yAMnRYoHy0qobnz2OPgcf8B+Ek0LHaeSeJF4q/xz1KT3nGlfDad10bjsFCFN
 hfiC95fVOiRC1d8Lch7enVenIVcxZLRQFVDulvgOQm8pHvN0agRwSuOFHyCjUAjzgiyQ
 ovfD4vY+uxuBidXutrhpE2Qv/SR5UyUkiyEpxlCIvfJHqEBxubrICXN//7ElFX/oRs2Z
 I6llnsMO41rAC0KQtsCTi1caRKaO2q+xdKXDgsbqoZNf98P+naRlDBisGFtaVwgDNeRQ
 r7jw==
X-Gm-Message-State: ANhLgQ3U/HsVWRI7EC6GYgHbWvNWXXA02HoqQntviMGFOoduVMa1HHn0
 kAkMQZ6ZbwjwNg+IlTU/9yQ=
X-Google-Smtp-Source: ADFU+vtkWTf+bP5KpxbDSfPZFDDGDh0QHljgkhpqp4uPRC+p7xaj5oXizMlsajvy74O0tOHg76ABPg==
X-Received: by 2002:a05:6512:3191:: with SMTP id
 i17mr4678063lfe.33.1584695589095; 
 Fri, 20 Mar 2020 02:13:09 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r4sm3557715ljg.36.2020.03.20.02.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 02:13:08 -0700 (PDT)
Date: Fri, 20 Mar 2020 11:13:04 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= (VMware)" <thomas_os@shipmail.org>
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
Message-ID: <20200320111304.67c4dd01@eldfell.localdomain>
In-Reply-To: <3f0b858c-aa1b-2391-a936-6d1c8e36c0df@shipmail.org>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <20200319120028.56d3427a@eldfell.localdomain>
 <8b9c1aac-3398-ab97-a065-014359d40220@redhat.com>
 <20200319145842.4b7db322@eldfell.localdomain>
 <c8c75790-9b56-9f7f-98d6-1dd2410d70b2@redhat.com>
 <20200319171633.2ee4afa4@eldfell.localdomain>
 <217ab553-9c16-329d-bbbd-02067a2ccd6e@redhat.com>
 <cusw9Ckx7IvPc-ZlCsXaODZMOjTyxPm5__u0Ufcri1Ug8ulqzDDcXZDK2joUHyK8EbwuYV_e0fj5ejMi_4oVfZi6WHgAlKBcz0LZoyvmcjA=@emersion.fr>
 <817f61b4-2b27-fd96-9e42-79ba2a6889bc@redhat.com>
 <da1Sy2AQg2pW3xtrqoF7yjUF5NpTkwSyooPGrnbBX8P5AEM283ODYI-kLYU1R76B27Zx7WT3uTg3s2B9ko1-KVTYRM7S0dpkjSPJM-Ehm8w=@emersion.fr>
 <3f0b858c-aa1b-2391-a936-6d1c8e36c0df@shipmail.org>
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
Cc: Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: multipart/mixed; boundary="===============1700486753=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1700486753==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hJFTCBMRdyJD4VasoGGdVIN"; protocol="application/pgp-signature"

--Sig_/hJFTCBMRdyJD4VasoGGdVIN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Mar 2020 23:57:09 +0100
Thomas Hellstr=C3=B6m (VMware) <thomas_os@shipmail.org> wrote:

> Hi,
>=20
> On 3/19/20 10:07 PM, Simon Ser wrote:
> >>>>> Is that something that should be done?
> >>>>> If the hotspot property also had a "disabled" value, then Weston co=
uld
> >>>>> set the hotspot to disabled when it is using the cursor plane for
> >>>>> non-cursor content and not lose the feature. And of course set hots=
pot
> >>>>> correctly when it in fact is a cursor (but for what input?). =20
> >>>> I believe cursor planes in the affected virtual gfx-cards do not
> >>>> really have a mode where they can actually be used as a generic over=
lay
> >>>> plane, certainly not in a useful manner (if anything works it will a=
ll
> >>>> be software emulation), implementing a hotspot disabled mode would be
> >>>> tricky and this would needs to be duplicated in all virtual-gfx cards
> >>>> kms drivers.
> >>>>
> >>>> If I understood Daniel's proposal for how to deal with this properly,
> >>>> then only cursor planes which actually need them would get the new
> >>>> hotspot x/y properties. If we do that then Weston could use the
> >>>> presence of the hotspot x/y properties to detect if it is dealing
> >>>> with a proper hw plane which can also be used as a generic
> >>>> plane; or a virtual-gfx cards cursor-plane, and then just not
> >>>> bother with trying to use the plane as a generic hw plane.
> >>>>
> >>>> Would that work? =20
> >>> That would need to at least be hidden behind a DRM capability, otherw=
ise
> >>> it would break existing user-space ignoring the hotspot props (e.g.
> >>> current Weston). =20
> >> Current Weston is already broken, fixing that is what this whole
> >> thread is about.
> >>
> >> The virtual gfx-cards drivers simply must now the hotspot for things to
> >> work; and a capability is not going to help here for 2 reasons:
> >>
> >> 1) Short of disabling seamless mode there is nothing the virtual
> >> gfx-cards drivers can do when clients do not pass the hotspot info;
> >> and in some cases they cannot even do this as it is under control
> >> of a userspace agent process with its own channel to the hypervisor.
> >>
> >> 2) Most existing clients which obviously do not set this to-be-introdu=
ced
> >> capability already pass the hotspot info using the DRM_IOCTL_MODE_CURS=
OR2
> >> ioctl. Disabling seamless mode when this to-be-introduced capability is
> >> not set would cause a huge regression for all these existing clients. =
=20
> > Compositors which don't support the hotspot prop are and will continue =
to break
> > seamless mode. Setting the prop will never be mandatory, because all us=
er-space
> > today doesn't do it.
> >
> > Since we need to update all user-space to add support for this prop, it=
 would
> > be a good idea to recognize user-space that doesn't support it. Doing s=
omething
> > sensible with user-space that doesn't support the prop is up to the vir=
tual
> > driver.
> >
> > If we have a capability, the virtual driver could for instance not adve=
rtise a
> > cursor plane at all if user-space won't correctly set the hotspot anywa=
y. =20
>=20
> What compositors do we have around today that wouldn't want to support=20
> setting the hotspot correctly? Do we like to keep them that way, and do=20
> we want to encourage any new compositors to also not do this properly?

All compositors that sometimes want to use cursor planes for non-cursor
content. If a cursor plane does not actually have any performance
benefits, then somehow userspace would need to know to not use it in
that case.

I think the capability is a well-designed solution: a driver that
knows the cursor plane will not be always exactly like userspace
programs it should not advertise the cursor plane at all if userspace
does not set the new cap, and the cap is a promise that userspace will
set the hotspot correctly.

This cap will not break userspace that uses DRM_IOCTL_MODE_CURSOR2 with
correct hotspot info because that is a legacy KMS API and we are
talking about atomic here. The legacy ioctl can continue to ignore the
new cap.

It does mean that if legacy KMS userspace uses the cursor plane for
non-cursor content, it keeps being broken for drivers that mangle cursor
planes. I can certainly live with that.

It seems people are also forgetting the problem of associating the
cursor plane with an input device, so that whatever is looking to
mangle the cursor plane behind the KMS app's back would know how to do
it right.

My first thought for that is a new cursor plane property with the value
of major, minor of the kernel input device that userspace is using to
control the cursor plane. This property should be set by userspace only
when there is exactly one kernel input device it uses for controlling
the cursor plane. Setting this property to none/disabled would be a
clear indication that "seamless mode" would be unwanted. The DRM
driver or whatever it talks to could then check if the cursor plane is
indeed controlled by the input it so far has only assumed and
automatically choose correctly between seamless mode or not.

Anyway, these are just ideas. Use them if you wish, I won't NAK
anything if you don't.

Now you know what Weston currently does. If Weston needs to change, I
guess that is fine with me.


Thanks,
pq

--Sig_/hJFTCBMRdyJD4VasoGGdVIN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl50iSAACgkQI1/ltBGq
qqea1g//T6kxeuIn/jSOXf0hHLOWvgn65cCfEJ01UfZB10wvDLxc0XHRQYugwynb
dpZdh0d/U1sumHQ1xHxrGAByrOzbcs6S1geHt3oFUbaFefFIjt6DQrNhECn0lCbl
AdZHJJiUSIBYQNHvMqPhio1NOZEaT39PKlbGdHnbbySeg8VD8rjPiWhpE3zLsMhs
D4dD5LCr1EQ9IJDfmyNUXPTdl3e1ciXtP3pyMAqP3WkG8YsDyEPzpJwbQtERYMug
l0nYDJlXt5k4YvuKb6oM2B2fSDcVjDtw3numhCGzDDiTlNJ/Zc7oPB5AKmLGrIHh
zC4T90CqsrxjyZsqUCwPUoFNe6Y4wPmKiiOSwTh0ODs+86Lo7y9U08WBejsWGWJB
Z0BsTU3xTGCL4PGRMKdPPNhb/qGpiKl9W4ZazD9iLZyP7uo00D4nZpIJAi6duaKn
oQXpxLI3qYAmc0SaaP40DKof30dvgunjQlqrOaxf6aGFixclAUo6viWPrVOXnaBt
iMpJD78ddFMjfW6PePZD37XEJ9iU4A/7N13NmsBHEm/wbtp7vMUG71oWvPr1dJTG
NkhW2dl/sDybUseQk30nAv45GpNsAN+kdTcFz2+ZC3zsyI3BwyuqxtQ9+fFA6IHP
oy5IYNtwk3+fJ1UnFfwF80zljD0txd0b9lw92Biz3vdzC4GZs+s=
=HTaa
-----END PGP SIGNATURE-----

--Sig_/hJFTCBMRdyJD4VasoGGdVIN--

--===============1700486753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1700486753==--
