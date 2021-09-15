Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CA940C790
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 16:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48F76E94A;
	Wed, 15 Sep 2021 14:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D07C6E94A;
 Wed, 15 Sep 2021 14:36:59 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bq5so6469972lfb.9;
 Wed, 15 Sep 2021 07:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=nnK3LOd5mGhle7C9O0pai/1eE+LkUBEndIN3eM1uGHA=;
 b=lFC1GAbHPY2LQopRFdoUnZWUOZuCv55k7jwUWh3MaGLg9ETBrfPLia76Uh00NVKesg
 Qc6cCpxV7fa437kClxd742/kyuDrdMRKNKqd4wkQC3IYX0UKafa4gll5haHHT7CaUlsi
 n5Tt1VhkO/6/Y1oUSj1Y1te4ttyLrCsPj/O9vjEV7W5lXoisYFs578kw0Q7KktVbnxos
 YPu3P6+LbVe0+TbiZ28sfDcAzdsDoqGf8FY1ymnMZWyzpZx5Zh+AWeSttLQjpjF+LBwy
 67XEfhQX+jgQHDBH/CdnuTthOMp3QxOco+VBYHcCAi1C5qq13RnHuvcAzzjplN/sWmis
 kYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=nnK3LOd5mGhle7C9O0pai/1eE+LkUBEndIN3eM1uGHA=;
 b=uMPS5X0NY0Pl/NWtIQ91DTUZa1Zr+bVDQI7E57DA0Zsj/eLtU/cKlZfDiWbflSqHVX
 L54PRuPWZE+2V3mTgtR1PeIply6ycnaKBSC5USSQQRMGS5z+MZUzpeg05oSwpJ8CHiOY
 7kNZDuLanuuugpwS5p+JqwZgjd55ijUVu4Jb4ykgHnAy8sAHRY7yBb45v/KzXI3cu/Gq
 IC0v3JOenP1FVZHEEuhfsGT3r+C7XRNh4uoWrdigq8+M5xun2ypwisGfP2MIU4VQIatk
 5vNzoTg/EbpiPQy/4Ju5eI+mbejBIdAqxqRyAhkNMsBNiy3ZZz6eVM2eeXF30QQLUm5u
 lgzA==
X-Gm-Message-State: AOAM533jrB2FNuwJucaIeDIUXYv/W9ItH4ihEozakeSpJ0Dmzt4b89oY
 BkL3Nwaw50KH2GQv+qEV+AM=
X-Google-Smtp-Source: ABdhPJycOsscTAN0m0/NDlcC7OzuLIOQCKCjkhUlnsVUtoojj3Gp8WgvPr1KS/4IH8u/WSaL/JUXBQ==
X-Received: by 2002:a05:6512:2201:: with SMTP id
 h1mr165284lfu.307.1631716617258; 
 Wed, 15 Sep 2021 07:36:57 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k11sm716lfg.300.2021.09.15.07.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 07:36:56 -0700 (PDT)
Date: Wed, 15 Sep 2021 17:36:53 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: sebastian@sebastianwick.net
Cc: Harry Wentland <harry.wentland@amd.com>, Brian Starkey
 <brian.starkey@arm.com>, "Sharma, Shashank" <shashank.sharma@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mcasas@google.com, jshargo@google.com, Deepak.Sharma@amd.com,
 Shirish.S@amd.com, Vitaly.Prosyak@amd.com, aric.cyr@amd.com,
 Bhawanpreet.Lakha@amd.com, Krunoslav.Kovac@amd.com, hersenxs.wu@amd.com,
 Nicholas.Kazlauskas@amd.com, laurentiu.palcu@oss.nxp.com,
 ville.syrjala@linux.intel.com, nd@arm.com, uma.shankar@intel.com
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Message-ID: <20210915173653.1e81418a@eldfell>
In-Reply-To: <a2fc2bd00af431a4f6e3842c6db072a2@sebastianwick.net>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210802163042.2phdkytybie236x4@000377403353>
 <4e13504d-20ec-ae9c-7cb0-f79376d0f98b@amd.com>
 <20210816111029.74cisnhblllindcv@000377403353>
 <ace8dcf8-fe01-ad1e-8cfb-92e559f01d2f@amd.com>
 <a2fc2bd00af431a4f6e3842c6db072a2@sebastianwick.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NMWim2bAS+n86CnR4Mxp4sH";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/NMWim2bAS+n86CnR4Mxp4sH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Aug 2021 15:37:23 +0200
sebastian@sebastianwick.net wrote:

> On 2021-08-16 14:40, Harry Wentland wrote:
> > On 2021-08-16 7:10 a.m., Brian Starkey wrote: =20
> >> On Fri, Aug 13, 2021 at 10:42:12AM +0530, Sharma, Shashank wrote: =20
> >>> Hello Brian,
> >>> (+Uma in cc)
> >>>=20
> >>> Thanks for your comments, Let me try to fill-in for Harry to keep the=
=20
> >>> design
> >>> discussion going. Please find my comments inline.
> >>>  =20
> >=20
> > Thanks, Shashank. I'm back at work now. Had to cut my trip short
> > due to rising Covid cases and concern for my kids.
> >  =20
> >>> On 8/2/2021 10:00 PM, Brian Starkey wrote: =20
> >>>>  =20
> >>=20
> >> -- snip --
> >>  =20
> >>>>=20
> >>>> Android doesn't blend in linear space, so any API shouldn't be built
> >>>> around an assumption of linear blending.
> >>>>  =20
> >=20
> > This seems incorrect but I guess ultimately the OS is in control of
> > this. If we want to allow blending in non-linear space with the new
> > API we would either need to describe the blending space or the
> > pre/post-blending gamma/de-gamma.
> >=20
> > Any idea if this blending behavior in Android might get changed in
> > the future? =20
>=20
> There is lots of software which blends in sRGB space and designers
> adjusted to the incorrect blending in a way that the result looks right.
> Blending in linear space would result in incorrectly looking images.

Hi,

yes, and I'm guilty of that too, at least by negligence. ;-)

All Wayland compositors do it, since that's what everyone has always
been doing, more or less. It's still physically wrong, but when all you
have is sRGB and black window shadows and rounded corners as the only
use case, you don't mind.

When you start blending with colors other than black (gradients!), when
you go to wide gamut, or especially with HDR, I believe the problems
start to become painfully obvious.

But as long as you're stuck with sRGB only, people expect the "wrong"
result and deviating from that is a regression.

Similarly, once Weston starts doing color management and people turn it
on and install monitor profiles, I expect to get reports saying "all
old apps look really dull now". That's how sRGB is defined to look
like, they've been looking at something else for all that time.
:-)

Maybe we need a sRGB "gamut boost" similar to SDR luminance boost. ;-)

> >> I still think that directly exposing the HW blocks and their
> >> capabilities is the right approach, rather than a "magic" tonemapping
> >> property.
> >>=20
> >> Yes, userspace would need to have a good understanding of how to use
> >> that hardware, but if the pipeline model is standardised that's the
> >> kind of thing a cross-vendor library could handle.
> >>  =20
> >=20
> > One problem with cross-vendor libraries is that they might struggle
> > to really be cross-vendor when it comes to unique HW behavior. Or
> > they might pick sub-optimal configurations as they're not aware of
> > the power impact of a configuration. What's an optimal configuration
> > might differ greatly between different HW.
> >=20
> > We're seeing this problem with "universal" planes as well. =20
>=20
> I'm repeating what has been said before but apparently it has to be said
> again: if a property can't be replicated exactly in a shader the
> property is useless. If your hardware is so unique that it can't give us
> the exact formula we expect you cannot expose the property.

=46rom desktop perspective, yes, but I'm nowadays less adamant about it.
If kernel developers are happy to maintain multiple alternative UAPIs,
then I'm not going to try to NAK that - I'll just say when I can and
cannot make use of them. Also everything is always up to some
precision, and ultimately here it is a question of whether people can
see the difference.

Entertainment end user audience is also much more forgiving than
professional color management audience. For the latter, I'd hesitate to
use non-primary KMS planes at all.

> Either way if the fixed KMS pixel pipeline is not sufficient to expose
> the intricacies of real hardware the right move would be to make the KMS
> pixel pipeline more dynamic, expose more hardware specifics and create a
> hardware specific user space like mesa. Moving the whole compositing
> with all its policies and decision making into the kernel is exactly the
> wrong way to go.
>=20
> Laurent Pinchart put this very well:
> https://lists.freedesktop.org/archives/dri-devel/2021-June/311689.html

Thanks for digging that up, saved me the trouble. :-)


Thanks,
pq

--Sig_/NMWim2bAS+n86CnR4Mxp4sH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFCBQUACgkQI1/ltBGq
qqcD9hAAqL1vGWKGo6zg2ZBgmDzsdzvR/hYCDGubR3CYdn9NjEwtZ4R22Uf9qtJ5
1TBOYxS6FLR6CxZWKAkNGhNrmpXBlPzTmtrAmpljbHs51kDhTeSlcZj46yfzZMzK
VCNOQn4VpgSF7UJOqtzKhGGGsFfp/hKP9xkKtBbTWxkcwudU0g1jFntP27Yxguyf
3mk5TN9b+Hl9SL8nT4p09AtLXb9oj+ID7EqgUNHui7eCl75xjAwEhkGQVLc4/mR2
P9m9IP9xXl7HfxgslzMQaCef6CsJlZVtEnFjFZvUx+KbQnhwiQhACpN+hksfItH4
7SSr3ZKiCMciJUtlIV3F6Ubt1RbNoK5cA4CDfoIOCgea1mNu+7Gs3+f6NxQgGSgp
g9gQfBCIabI+4ziRZ01QrDkMTOr8RZ+T1YDpU/23cCgDg1ViN11C5q6fiHM3PjG/
oHnBLY3/un6UaQjZbWoPl0IudMg31lbWd4z2BRMqY+az8YE3vF+63Q3vBYeZh8Dp
2gI/dTWF1wxQY9F3IExjruFcRIDJeif91wfteJKPtXLlT1azsmV+CDvz9zQ8NTPT
F0JyHd8mv65Qlfv5IjOZxRGt1KeK0p+8D8lnY3dqTtgEx+MZF1cis/60mYG2+kHC
tGu9Zskab9vZ1W/xJ3xbQ9K/4YTTb3yWir1SL/WVrrXfXy9dKRU=
=At5z
-----END PGP SIGNATURE-----

--Sig_/NMWim2bAS+n86CnR4Mxp4sH--
