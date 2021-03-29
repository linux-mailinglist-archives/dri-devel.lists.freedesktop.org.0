Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC9234D0A2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 14:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951056E217;
	Mon, 29 Mar 2021 12:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFC46E217
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 12:58:02 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id g24so9176439qts.6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=pXwScAbp9Oc9UUM+Y5MFv/NyYb1m2Ax9bkESJHn7OoM=;
 b=jIMlPhrnPxBkc1eIt0loxmUFn7wXXfPXYhzlXGaYPnegO6aUyr7PCPcsU1Q/nPx2fP
 z9dSO77ODJpoGbIqBdLPzf7Hmx+na9zXd2cZJ4qd9BBfUIDW2OzJWYE465wjBIWAuRrr
 NWCMehNEk3cJZY3zjwb6ZOQi1NkbEq5fCcB0n+UlGn7E/x8I9ZccVrQAOLQEjvvAhPgW
 gyvGu7fxdumQ9rlYgMvh+Gznzjnn6Qsqul2TwzNQVb6EA6ue+DdlAwS1sDkE02lS2xyR
 3n4LD+Mz6IiTzqnrhisHrhIHhSDc4vM/80A7UAKxL/KmVUJHzyawP00LVXC3wRmxEBMs
 lnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=pXwScAbp9Oc9UUM+Y5MFv/NyYb1m2Ax9bkESJHn7OoM=;
 b=OPSHDU3V3CpTcExSn4M8rR7S4WtI05ioNlOD/639z64zAOcHaUhrlJH8fvMfr3YByr
 BEqQH0Kas0Ti7KBeMy29/k7uhfeOXS+P/T3Ju8oQdYoreOoLVdjD75v2mI7fVVarOOUp
 99UNK4FGM/kq8emn15N+b9yK88I3T8+F4vqOy0g4mlMtdpO24lTof/Xp10gGqJTe4zIE
 yCCDeqCgmzpEkZS3mPDX8oapezK/R0JGqGnp/vYjEXgTKV8xeyt3r81Pcl3NVt7hIb6z
 9iO36x2JY+Foe8jGRndZ8RKsLif0H/7FJpzO/tVVCsL4Z6+yRf/EVdQkK+gh06DfwTkG
 iEig==
X-Gm-Message-State: AOAM533MIlsTgv1iRcfOVNN8vpyQ6zLlo6wRJihJqBPz7Uauuo31Pz4y
 b/pr7YkXHrdDLtz3ry+gvOY=
X-Google-Smtp-Source: ABdhPJzGuB5bAHBNMyTzE3y0baxdhpY1BDoada/eHGqWehXn5kNmFoyZ95oSsGX4Gf6P46twv8R/cA==
X-Received: by 2002:aed:2ea4:: with SMTP id k33mr22317560qtd.169.1617022681256; 
 Mon, 29 Mar 2021 05:58:01 -0700 (PDT)
Received: from Gentoo ([37.19.198.130])
 by smtp.gmail.com with ESMTPSA id y1sm13368206qki.9.2021.03.29.05.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 05:58:00 -0700 (PDT)
Date: Mon, 29 Mar 2021 18:27:43 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 00/30] DMA: Mundane typo fixes
Message-ID: <YGHOxwiqwhGAs819@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org
References: <cover.1616971780.git.unixbhaskar@gmail.com>
 <20210329052910.GB26495@lst.de> <YGFrvwX8QngvwPbA@Gentoo>
 <YGG+l1EfRuWp0J3A@kroah.com>
MIME-Version: 1.0
In-Reply-To: <YGG+l1EfRuWp0J3A@kroah.com>
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
Cc: dave.jiang@intel.com, Linus Torvalds <torvalds@linux-foundation.org>,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Content-Type: multipart/mixed; boundary="===============0335038417=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0335038417==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5zclouQno4veQbB1"
Content-Disposition: inline


--5zclouQno4veQbB1
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 13:48 Mon 29 Mar 2021, Greg KH wrote:
>On Mon, Mar 29, 2021 at 11:25:11AM +0530, Bhaskar Chowdhury wrote:
>> On 07:29 Mon 29 Mar 2021, Christoph Hellwig wrote:
>> > I really don't think these typo patchbomb are that useful.  I'm all
>> > for fixing typos when working with a subsystem, but I'm not sure these
>> > patchbombs help anything.
>> >
>> I am sure you are holding the wrong end of the wand and grossly failing to
>> understand.
>
>Please stop statements like this, it is not helpful and is doing nothing
>but ensure that your patches will not be looked at in the future.
>
Greg, don't you think you are bit harsh and have an one sided view? People can
say in better way if they don't like some work. I Have always try to get
along.
>> Anyway, I hope I give a heads up ...find "your way" to fix those damn
>> thing...it's glaring....
>
>There is no requirement that anyone accept patches that are sent to
>them.  When you complain when receiving comments on them, that
>shows you do not wish to work with others.
>
Unfortunate you are only seeing my complains...I don't know why you are so
blindfolded.
>Sorry, but you are now on my local blacklist for a while, and I
>encourage other maintainers to just ignore these patches as well.
>
I can not overrule that ...I know my pathes are trivial ..but it seems some
other problems are looming large.

NOT good Greg....not good seriously.
>thanks,
>
>greg k-h

--5zclouQno4veQbB1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBhzsAACgkQsjqdtxFL
KRW2qwf+LpIRIiK3vSyhfOkc5KEs6+JY1kuwY5zK8zNexJI+BFNVlKy2fiJDI5OJ
ohAkhZ7u6VPXdYX4JVipyUMEVaBJRI36ebb2fl5JhhjKdp+xaw+1pP+AMIXET/SS
mxlbUWkBiwZvlebkm26R/LDfJ6BMh8uOTth09mP9SEzfLvL41TJotFlJnCZ7+Akq
RtQfuF4c4a6g4rkBMbKz9GFP35UIl8xrQB9roiynNg8abT7mP0mfBYEa+yofDdA5
dmOmw22RwwuXueZhidrSifQYP4F0h/3zrUTetKYa4MZYUVnIR/Lvpa9K6U6xjuIb
rHZf1I6RXTsmUcErV7E2MR4mZEjStg==
=YLCg
-----END PGP SIGNATURE-----

--5zclouQno4veQbB1--

--===============0335038417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0335038417==--
