Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED50546094
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 10:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A8110F7D5;
	Fri, 10 Jun 2022 08:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7757010F035;
 Fri, 10 Jun 2022 08:56:32 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id y29so28866922ljd.7;
 Fri, 10 Jun 2022 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=4TLgXohkOQ7lebfVdxpcEzq6zlQZlNxvTmz/vsYm9ZI=;
 b=bTS1ek1uAnNC8tXgKxOYXIeD5SupIzALOKXT5X/r8Z83g/RQRcxlYGWlKvGE3UoxUm
 Q/PIo5NWCcBzmMWxIr3XLiR1+dO07Ubf3NVIUtYRN6TpqkNtNEdmdixRf5DKicZTFKhv
 YQhqyYZVhza7VlcGmlq8UZu7Z2nMdv8JtTXkqP0UJQ5SKl6KsYW/62iH15A/Ge5cptJA
 0AApkn8kf20CCNoCuI7Cz4KPBccNckGCyBXfjLm31ZSGeEwVnpiVlB7ySkzm4gsl5s/v
 nfxXiVhfrM6TW2qYoggk7RQ54Zu8/bweOUbfIBweJyxFIT8Z5FIOqgobbtsvHwml5KYt
 svmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=4TLgXohkOQ7lebfVdxpcEzq6zlQZlNxvTmz/vsYm9ZI=;
 b=sJ0vA1fChDH/wRKTOZGNDVRDKYOXpwZUZ+uxG0hbiVGRzgkvhl76ahxnvhUOTfFder
 lBVGzYczyopecRgC3SM9i88XLx0lFzIM1Zp+vjpkMCK++jkY+CRIqMA7MAYfVLdyfC6F
 IG2Pf2PNjuGAWuSd6WywWCm9D0/ZYOSmumnWkjN9XcmznkrclvVzAAun2vUDeYcCSioc
 LN7mlncmugYFvVbyR+RLUSZuYvvSQ62Hev57YIHdv9a88gAmm4QHuolQIm5uJniEOtPz
 C0hVeh1gw735sRMhq/WLiLaWWTjTFjpKplgFVBchhNuSLdHuQWp6VsK1GLtqhANy0ILf
 MMVA==
X-Gm-Message-State: AOAM5338GpAMPTbkDT3BcILFk6cxz9RiF6nqjJcKkVks4i4lGvI4b/Hp
 M1PPRbtEAbXig9g+s2FPCZM=
X-Google-Smtp-Source: ABdhPJyy7lEbDslRzht5RBx4MhaRRJF/UfyDTdqZ/3B+rMLoawPlzlpnhMhawszbUPwRGb/6zMTXWw==
X-Received: by 2002:a05:651c:1581:b0:255:48d1:fdae with SMTP id
 h1-20020a05651c158100b0025548d1fdaemr34740691ljq.286.1654851390508; 
 Fri, 10 Jun 2022 01:56:30 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 w25-20020ac254b9000000b0047943248581sm2316182lfk.33.2022.06.10.01.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 01:56:30 -0700 (PDT)
Date: Fri, 10 Jun 2022 11:56:26 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220610115626.5a8a78ac@eldfell>
In-Reply-To: <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A712Eg1UI67ce208R4Xqzyx";
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
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 mombasawalam@vmware.com, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, krastevm@vmware.com,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/A712Eg1UI67ce208R4Xqzyx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Jun 2022 10:41:05 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> Hi all,
>=20
> Kinda top post because the thread is sprawling and I think we need a
> summary/restart. I think there's at least 3 issues here:
>=20
> - lack of hotspot property support, which means compositors can't really
>   support hotspot with atomic. Which isn't entirely true, because you
>   totally can use atomic for the primary planes/crtcs and the legacy
>   cursor ioctls, but I understand that people might find that a bit silly=
 :-)
>=20
>   Anyway this problme is solved by the patch set here, and I think results
>   in some nice cleanups to boot.
>=20
> - the fact that cursors for virtual drivers are not planes, but really
>   special things. Which just breaks the universal plane kms uapi. That
>   part isn't solved, and I do agree with Simon and Pekka that we really
>   should solve this before we unleash even more compositors onto the
>   atomic paths of virtual drivers.
>=20
>   I think the simplest solution for this is:
>   1. add a new DRM_PLANE_TYPE_VIRTUAL_CURSOR, and set that for these
>   special cursor planes on all virtual drivers
>   2. add the new "I understand virtual cursors planes" setparam, filter
>   virtual cursor planes for userspace which doesn't set this (like we do
>   right now if userspace doesn't set the universal plane mode)
>   3. backport the above patches to all stable kernels
>   4. make sure the hotspot property is only set on VIRTUAL_CURSOR planes
>   and nothing else in the rebased patch series
>=20
> - third issue: These special virtual display properties arent documented.
>   Aside from hotspot there's also suggested X/Y and maybe other stuff. I
>   have no idea what suggested X/Y does and what userspace should do with
>   it. I think we need a new section for virtualized drivers which:
>   - documents all the properties involved
>   - documents the new cap for enabling virtual cursor planes
>   - documents some of the key flows that compositors should implement for
>     best experience
>   - documents how exactly the user experience will degrade if compositors
>     pretend it's just a normal kms driver (maybe put that into each of the
>     special flows that a compositor ideally supports)
>   - whatever other comments and gaps I've missed, I'm sure
>     Simon/Pekka/others will chime in once the patch exists.
>=20
> There's a bit of fixing oopsies (virtualized drivers really shouldn't have
> enabled universal planes for their cursors) and debt (all these properties
> predate the push to document stuff so we need to fix that), but I don't
> think it's too much. And I think, from reading the threads, that this
> should cover everything?
>=20
> Anything I've missed? Or got completely wrong?

Hi,

sounds like a good plan to me.


Thanks,
pq

--Sig_/A712Eg1UI67ce208R4Xqzyx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKjBzoACgkQI1/ltBGq
qqfhkA/9EstmuJ08pVp2oM56R1FZnJN3sZ9vs9+hOoecDpNYETqgzfQfEpqFvFef
u92MAZYWT+pnJfmu7eFE6RNiz3b05kNT32Gv89x6migvXkUijh9vECccQh1CKSWW
GmsFCqycDowpbaVBLzjYZXWVrrmAeFjMYvP/XqIn6iDAKkTvAVodIP9fGJWZBKBM
GAoF51pVqqmRovSL0KQhrE4MCAWqK19KuN4TdsLdY4pQGYzI69IcEzlatTO/WmOO
1Or5R8OXowmC6ocYmru4mS62u/0dsRTKT6gNJAXddtoTX4LxFYMrJDmXewbFEWy1
2xlJcx2GcNe10p7pGW+4G1cSxbaeO1DwpaV/Jruh7vbkUJYzi8t4V40teNn9Esxz
6u6nzEY6xaqDHNVbPPaluMXHnlINEIi3rXAjOsGj+MbJaLaH9SI5IYkCrgaw5S+B
wFmToZwREvU0QJyyNMMQaxWfqRPGYCKrBesbmQl3bADqYdvos3cUtbOeV7Ow38VO
zG+3Y1ff5Vul+IrvZufGigRg3Rr0lbBh75MOIyCcNuQn8IXWThJxtbgiAeGJh7El
h0i/BKVpqjP0g5uIjbfsf+WBuEpvZONi5PrGolj6jzIu0FndHxdW/PuuLoFUinaU
4igTY8WI40bDjPiGK1Dtc6yTrbPLnm2M9SN1546w9D/6MA6YCuw=
=wISH
-----END PGP SIGNATURE-----

--Sig_/A712Eg1UI67ce208R4Xqzyx--
