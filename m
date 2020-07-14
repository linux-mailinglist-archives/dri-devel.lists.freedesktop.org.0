Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1224321E978
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91CA6E94D;
	Tue, 14 Jul 2020 07:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD65F6E8D1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 06:43:29 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id t15so1058965pjq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 23:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=svRq6Iqlrn/tFxtJY/DjGrWoqYIhD74lfdweZy6zFV8=;
 b=kc+Jcvl3OJXsMwC2pJGthFzMlIi4Z+p/EjQlp1fucAxYfP/P3JQyb1wmM+O36g8AbR
 Cn9GHBVqR0fXbfImOHjRSkvkMg6lR+FkkoKIYgfN2NzfvT9vwC8I+W2axg2Egl6gQ4DZ
 JgMQ0SpcaRot1GtHzP2/Ol/kuLQ/j71vDFBuMYg0l6riowcSLJW1dD/C3E55mU0/um/b
 KLulucPiDyoNTLMHEnssmvnmaT+/FGZ+mVq7Aan7R6gmFR8Z0qzXLYzoojREIumZ63Da
 5UYIP0pq5NOBzNYroTLSlsYL6BTO5hd/LhoCFeoWW/DMu/nV8iLT9Ya5+UaWjiGjbup9
 OrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=svRq6Iqlrn/tFxtJY/DjGrWoqYIhD74lfdweZy6zFV8=;
 b=g8FJJCxUqjdD8oOlwHlubkOaXc2khfqH9A0TCUeqvWWZ8cdW+oCXdk3JXwdn8xUoNE
 MeFMs6Anid3tICG3yTrpfbm/Dx7YCGdJdK0X5SvBOva0jh5T2udhPxLMZL1j9LYhruLZ
 A5yW7SD30XRvTHvy7QosCtmDigWdTzjBb41MOFlCn+5NiqcubfmtjrqNOE/ZhAtmPJ7i
 u/aq0b4mFtmra50yNPwtaESSaJFBQb7m9AnQDG+Sg6lsUfSB2oK+gUy2TsWsgk+K5Tl0
 v/kBwhw/G8juNgWC5TVF0dX4V6nXJTAmnOSDhjKIqbiwrHg8jfxnwCVngY96R94JcXqE
 kCzg==
X-Gm-Message-State: AOAM532mskFaNnddvIhJkbBJVU2Eo+8VzsMWrWOte/AEKeSAQx52FtlB
 dDK4RYv9kv31eLSlrB9Zfqc=
X-Google-Smtp-Source: ABdhPJyhi7ygvdZi0LQUqmE4M7wc2DNyyX3DF5F3w2YVzKer28wAcsaxjugomnADZYxvqoIkOSLTGA==
X-Received: by 2002:a17:90b:1b4e:: with SMTP id
 nv14mr3203899pjb.30.1594709009369; 
 Mon, 13 Jul 2020 23:43:29 -0700 (PDT)
Received: from blackclown ([103.88.82.220])
 by smtp.gmail.com with ESMTPSA id q20sm16593653pfn.111.2020.07.13.23.43.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Jul 2020 23:43:28 -0700 (PDT)
Date: Tue, 14 Jul 2020 12:13:23 +0530
From: Suraj Upadhyay <usuraj35@gmail.com>
To: Benjamin Poirier <benjamin.poirier@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH 4/6] staging: qlge: qlge_main: Simplify while statements.
Message-ID: <20200714064323.GB12651@blackclown>
References: <cover.1594642213.git.usuraj35@gmail.com>
 <1bb472c5595d832221fd142dddb68907feeeecbe.1594642213.git.usuraj35@gmail.com>
 <20200714054137.GA49448@f3>
MIME-Version: 1.0
In-Reply-To: <20200714054137.GA49448@f3>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:44 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1685199169=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1685199169==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2020 at 02:41:37PM +0900, Benjamin Poirier wrote:
> On 2020-07-13 17:50 +0530, Suraj Upadhyay wrote:
> > Simplify while loops into more readable and simple for loops.
> >=20
> > Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> > ---
> [...]
> > @@ -1824,7 +1821,7 @@ static struct sk_buff *ql_build_rx_skb(struct ql_=
adapter *qdev,
> >  			sbq_desc->p.skb =3D NULL;
> >  			skb_reserve(skb, NET_IP_ALIGN);
> >  		}
> > -		do {
> > +		for (; length > 0; length -=3D size, i++) {
> >  			lbq_desc =3D ql_get_curr_lchunk(qdev, rx_ring);
> >  			size =3D min(length, qdev->lbq_buf_size);
> > =20
> > @@ -1839,7 +1836,7 @@ static struct sk_buff *ql_build_rx_skb(struct ql_=
adapter *qdev,
> >  			skb->truesize +=3D size;
> >  			length -=3D size;
> >  			i++;
> > -		} while (length > 0);
> > +		}
>=20
> Looks like length and i modification should be removed from here. But in
> this instance, maybe the original was better anyways.
=20
Thanks for pointing that out. It nearly slipped.

> Agreed with Dan. At least some of those loops can be converted to "count
> up" loops for a more familiar appearance.

I mostly tried to convert the do-while loops, which I think are't that
obvious than while and for loops.

Thanks,

Suraj Upadhyay.


--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8NVAoACgkQ+gRsbIfe
747gZhAAqmjqDCHmzSP1HenEF63cKPYyve1oHdtZQYylYRaN2L9DFakZyAKZOAzG
BuQss5guy5Na3tvPENwNQa/WUcBNkBsmoYdbdiaMfdCIIiCCaS738NCe3zX+iJDn
XYjNutWTL1bPWgGUpODUfMbEB64FwZQO+fF2tXIF2EE+XbFHu9UXg4yvAmVOAuZ4
9TO+NYxOJZ4er23xW2QHw9Q2KN9L72h13BLRObkMqw/c0cVI1Q/Rs54/RpqnYC/H
UYRgNOu5Y+H5B//QoWYdzRPJRyp0z/ITjWwSqcJ20nbN3oBP20QK4iyAjrl2PMaD
ht6z5JjIAsS1hgLaMIKxEtnR23SzHrzWQyH6l6wbMIKLoWTxByZ4eZfivTtZCIqW
1fDv8jzsVfTY+RF18LaLcAAllncRYTwiEMA0wfdYQnDO7UcpoikOfTIyrZuizoDu
AHX5UEza5v4T9yJKa1GnpAQlrXtN3Vle+/otwU3jAchin7OaAPa/J0AbWxRqjBZY
35jZ3nYFEj/uT3EDgOCHtHKuiAKbIDgTGHdMs/fmaeaQ9b7QcayRs7p97a3m/68f
PTFfDce+NHxdpVS++epyhdCUdYY+RluazeTZTwOHHcMj5EgUkYcB9KXl/QBJLvR4
gcwAKr1h+FAzBq23aC+psURXYpznTvTG2u/vuTwjpuQrB8nPBS4=
=St0d
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--

--===============1685199169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1685199169==--
