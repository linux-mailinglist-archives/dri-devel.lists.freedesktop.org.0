Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F11358678
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 16:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08AE6EB10;
	Thu,  8 Apr 2021 14:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D2C6EAB5;
 Thu,  8 Apr 2021 14:13:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id r8so4234762lfp.10;
 Thu, 08 Apr 2021 07:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=TTAheYFkvz4xaRUgxArJIxX9gF5vJl8p5ZSt40/QpZ0=;
 b=GVwhx8igUUZ/wt5WgHzBQequvJM6XesCG49OkkgcwJzk4dLkDYrYXweLegC7NO4ZLy
 9ziHpSrFFxImQ5Xmz3XR/Hg8LWH+UqDYmW24/FmIYLre5RPct8Y7O2ZVvPvZDREgFkcJ
 qyKRR0VmZJkj7Q6a7MCTt8EFc8Xf8J2iqJwlXCLBnCr7HRvYO1vV06KBwnOSOcuG/6iC
 a4kCLZNLba6HwAbd80fPmCQVPtHbQ5j9PsZhEA95fE190gx97OEAOC1lJOXdbqE9WTXU
 l5udsBOyBlBrUkkLgLM8LDHB5JpNYOL2CJTSHRfcl34JkzuRn83FT93WrXwU024VS0sA
 eV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=TTAheYFkvz4xaRUgxArJIxX9gF5vJl8p5ZSt40/QpZ0=;
 b=JDUz+qMwTM5U07aJKBLCK6Ju9E385YgMoU5YtY1VwSf8vz+d1iUQ6yt7zTlrr4Y7wP
 YPK0vSUfezl1cCwehJSeNo81Z9HDvGvrGKoAu1wEB42lDg09rg8voSXsQFniDCT7/mpm
 bsj8yi4AA61nlMdG+h6ZgdfIGsJqJqFDL/uEVkn2TAVpO+M8pfaHUR7/JUBIM7zB2bLV
 Q5zw2Yf0Qww2AIq/KL5gJkkLbzSRL+gsGb7SABb8LPr9XQGXBBih/WBvTpbJ7OrfFhsc
 ARcFap2062RIWxK7OeUZxjmIhT21yNY1AnenwdVCsvdIo5p1q6KwnOl8mlzab+ULznkf
 +AvQ==
X-Gm-Message-State: AOAM530Y1F1a90I8ZjB2HEtXGxdj48/993Q8Bu1GrnjVfQHAyzKjscKE
 rwxDc5azCwGrFFoAy4qDWDY=
X-Google-Smtp-Source: ABdhPJwIaI6Yu4gSvrOV74h14X89tnY7tiKGx1w4insUvEDPhTa2XvRmh2nwlHA2+q8t4a8jrE+TZA==
X-Received: by 2002:a05:6512:3e17:: with SMTP id
 i23mr6687392lfv.26.1617891196904; 
 Thu, 08 Apr 2021 07:13:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m3sm2924641lfo.190.2021.04.08.07.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 07:13:15 -0700 (PDT)
Date: Thu, 8 Apr 2021 17:13:11 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: Call for an EDID parsing library
Message-ID: <20210408171311.61f433bd@eldfell>
In-Reply-To: <87r1jkj37y.fsf@intel.com>
References: <20210407114404.13b41822@eldfell>
 <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl>
 <87mtuajshc.fsf@intel.com>
 <33467672-b66a-7658-de04-7bc37153613f@xs4all.nl>
 <87r1jkj37y.fsf@intel.com>
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 xorg-devel@lists.x.org, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0915661584=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0915661584==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=vWgvOjA1xlCScNen0Sc=DR"; protocol="application/pgp-signature"

--Sig_/=vWgvOjA1xlCScNen0Sc=DR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 08 Apr 2021 16:49:37 +0300
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> Anyway, this is only tangentially related to the library. I just think
> we need to take DisplayID better into account also in the *users* of the
> library, as they shouldn't really even look at the EDID if the plain
> DisplayID is there, per E-DDC 1.3 section 3.1.

That makes me wonder what the kernel DRM uAPI for getting a DisplayID
block into userspace would be. A new read-only KMS connector property?

Which means userspace (e.g. Weston) needs to know to read the new
property. If it does that, then it already knows that it should favour
DisplayID over EDID, and there is little the library could do to help
with that.

Unless you think the library should be making DRM ioctls, which doesn't
sound good to me.


Thanks,
pq

--Sig_/=vWgvOjA1xlCScNen0Sc=DR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBvD3cACgkQI1/ltBGq
qqd6Vw//WhzcNLTaOhUP/5Bujl/doTgEFKLDaFbcs9SXSYOhkBOfKxf7k64x/nLL
mGKj4dPGiymkR4Bh2JrZNa3m0VD/SSDCnI7EJXZMYSlzQpxx0WYCdaZDOhA6C8Oh
/MC63OwFa8jnwmCFwDQzgwQsOKaxGT2nOshSmVrDNy04hfeR1a75+A0iCCkrtgxc
2f0R87HC75+wELTy2/bWeTFaLj9KvhHrW2X7K3ZiTupY2b64uwRa7RuVbQlBqq0r
zQoh2NIVfz/gL+1nbXr8pwWic5a36txVOJA6YEN0C3v+JhkY9sPPpp7ScFvIOosB
hxuA5rAU7T6merF6ZPt7FcmnygPEWrP/zAH2P7+5/KnmtGac+fHQFbzldWn2pAsD
hLvaU6THzXJnDaJJs/ztlIIAs9vsBesPlx4lj3PJ2RYnrQJQ/8qKW3ff6gbtpRWq
Rpla9I6VJMagXiGpp0h/WuDBcOBCUP3479mDtb5RaSRpWLr1jfxA2YDdmS9IOjFF
qJC4n6gN5g6UQrMjOixSIt1M2WV94mftmzkm7kHA3pEAaBF/JqHlnHtXQidr9Rv4
ePgNwcam41750+hB8rv0ZPv2hrp57GPg92YMV/GPmZC76sHzd+5Sm7Jast7YLHe7
t1vHlamNe5u81Tf4U4vEqG+uN54tJGq0+AqTp2BUjB5whluhsLc=
=LkAa
-----END PGP SIGNATURE-----

--Sig_/=vWgvOjA1xlCScNen0Sc=DR--

--===============0915661584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0915661584==--
