Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DBA2B8E93
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 10:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A506E517;
	Thu, 19 Nov 2020 09:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC4D6E517
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 09:20:22 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r17so5480741ljg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 01:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ocT6OJmOVyTj2vsB/inL8OTug7LUvh68JRuu4GqIgLk=;
 b=XFsSdIYwW+qzl8zIaTli+LNRe57cnWw3WMGsbKzchHfOLVLwK+BG4SYov+GzOvvkFY
 qEbJu2IzaUA1VHfNTre1MEOK4dCfRKkYlAOZ2Be849F6qqv9TimHnzireH1QB9S2hFsz
 EEXV7IbOLLafybCK2no1gIfZlAOnbKB0j97iHgfQCrm7J8CrhIu3OifNHomnN8yfc4SW
 IrbA2KuLfeZceWSoltJpTCRl/Y0+FrQjcIdmelxjIE4sgfiup20aXhRNJkEXFObndVD/
 SRGyqXvN6aJOzO/OLGFYcUNlYjDwwWUHIHEGRYckG4TtkvdDxxs2rD2WsPT7EXiGa2t5
 GTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ocT6OJmOVyTj2vsB/inL8OTug7LUvh68JRuu4GqIgLk=;
 b=F1ychbKOK2hYIu6wo0I8UFktlN3gYtcx7ZoLBzNPLcXomNueFMQClxlIHsnrvk+JXj
 ZgjpXs4iIXbO9JPIoa909fAikmFEliJdGlaiOagUPx6bwHoKBZT1LKnbyLfvVl95R5+m
 Hrw4XpiDWiI7+KMAFDLgrw1mkEVrJsq/PtMihIIT45fu4/VLeGo9gIaMDa1giPaitHDD
 bmVAWd/I3np/5Fvxkycs/6/wZalFwIs7QnDkI7/NYddeiEpiQKQwS5VV38WxnRMwRmZ7
 CwurZKzO43usWuZ7U/Y22BFGT6SFflSxtGDGgiLjgAgctzOW2km+bXM/Og8MNMvXbXNw
 Hmaw==
X-Gm-Message-State: AOAM531W6sZW1+tipH/MnwJXjrTRxC1dBAmJUMduwhYR8hJAvn8XBiJC
 4x8sGw+gNEpHvDEDe1Jlkbg=
X-Google-Smtp-Source: ABdhPJytOSwXqJu8OF+VD4QLuncjIIuGp9+H9ZyV2ggCHi2QgSEq12m8pOXd85jSiW7NAoNYISA77w==
X-Received: by 2002:a05:651c:213:: with SMTP id
 y19mr5192972ljn.250.1605777621124; 
 Thu, 19 Nov 2020 01:20:21 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 139sm3644256ljj.106.2020.11.19.01.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 01:20:20 -0800 (PST)
Date: Thu, 19 Nov 2020 11:20:10 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document drm_mode_get_connector
Message-ID: <20201119112010.352a9b21@eldfell>
In-Reply-To: <zvaqgUJLuDcSaX7hbo6wcjWOCFUkiwPThMV1D8tq7dc@cp3-web-020.plabs.ch>
References: <zvaqgUJLuDcSaX7hbo6wcjWOCFUkiwPThMV1D8tq7dc@cp3-web-020.plabs.ch>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2002682261=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2002682261==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/snvZXkNcKRDH.lR5Pd=Lo9T"; protocol="application/pgp-signature"

--Sig_/snvZXkNcKRDH.lR5Pd=Lo9T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Nov 2020 10:52:12 +0000
Simon Ser <contact@emersion.fr> wrote:

> Document how to perform a forced probe, and when should user-space do it.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/uapi/drm/drm_mode.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 5ad10ab2a577..09647b799f39 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -368,6 +368,19 @@ enum drm_mode_subconnector {
>  #define DRM_MODE_CONNECTOR_WRITEBACK	18
>  #define DRM_MODE_CONNECTOR_SPI		19
> =20
> +/**
> + * struct drm_mode_get_connector - get connector metadata
> + *
> + * If the @count_modes field is set to zero, the kernel will perform a f=
orced
> + * probe on the connector to refresh the connector status, modes and EDI=
D.
> + * A forced-probe can be slow and the ioctl will block.
> + *

Hi,

as I have no prior knowledge at all about how struct
drm_mode_get_connector works, the above paragraph only confuses me.
count_modes sounds totally unrelated to probing, and what does that
even do in this struct at all, how does one use this thing. I only know
the libdrm API for this. So I can't ack this bit.

> + * User-space shouldn't need to force-probe connectors in general: the k=
ernel
> + * will automatically take care of probing connectors that don't support
> + * hot-plug detection when appropriate. However, user-space may force-pr=
obe
> + * connectors on user request (e.g. clicking a "Scan connectors" button,=
 or
> + * opening a UI to manage screens).

This paragraph is good and clear to me.

> + */
>  struct drm_mode_get_connector {
> =20
>  	__u64 encoders_ptr;


Thanks,
pq

--Sig_/snvZXkNcKRDH.lR5Pd=Lo9T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+2OMoACgkQI1/ltBGq
qqf7iw/+LtgMh7X4KC/Kr0ReMjh556PpY2azYkf5vzgUqvu5wGe3tlKLFCFp2OD0
otuLVp+2xtfS8Vh1bhATNqg7gj0kr+XxaTvDa5KMmuEne4AUK/5D4lbFvY2EiuDy
QDlPKXr12Wv1VCXXaOnYJLjeDFc/gEq9EmceDXyIsL62KmngrIslHgMOQJcyzzcn
95VgFhI0CEJSbbgLnBtLoqTzM2tOtfPX/ZLzcSswkYwacMQePZV7Am7WiJ/WSZa8
MpaPsNO1cdrSg2yCf39l2G3QEzQ0p6C4W4ZtDTK1nLGiA8uSyt6mVuab9VfbfpfX
hYXmPjlXJAY2tVr2dWaKoRggwdOOnyH+5y3JA0SjZbe1kx9bzDAfcHVLPNo2t3hN
/NigMVmoNRTYVDiBOuHR+IfFeAoYarUErchHEEgvOuWUCg6tpOLFfS2YTPiklxep
Y/fBMy7hgqQuZ6EoUSbblceZF4whZRBfr7h6qiUDLf5hL8NP/13j88tbIYWmKtC9
qO9y3sZbA8wKYyMJ0JlCevV0GMICxnMuyQ7L/WGa/SEJ7EsWI5hwYN/QC5UUFB6p
c8XnHN6LaD+Ejv+i4CAlM36anhTsd2rco/t2Fn+3uYRa/p4KYa/tsqWwDRExYAfw
oOTde3Lyt1Omk33GNnWYD8o70JTCzucrneKsQgFCbVhB/hk2bMg=
=mSWW
-----END PGP SIGNATURE-----

--Sig_/snvZXkNcKRDH.lR5Pd=Lo9T--

--===============2002682261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2002682261==--
