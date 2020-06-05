Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152ED1EF27C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635856E8A7;
	Fri,  5 Jun 2020 07:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA556E8A7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 07:53:17 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id w15so5189998lfe.11
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jun 2020 00:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=zQHOIho/2prlWyXsDdz1JLyl95gQVOI9c3rzY167mvc=;
 b=FLrRV3+KxVlnQaw0orjNio8fInbLvotu4w16xEupZbMSEFBnFB116a5Bd5nA3I0f2M
 2YzD6MeHU1l+1Jgy+U9DnPlGWJXE2gG+Mg8SabWIzU8u5WsSOrOLMw5Vl6cgaO7oeuhU
 0yHPmS3ihkQkyVfi8BSTZQzTasHaH1rTYVl8vpCcnQXCpAKuzadRHvUpwUdjPGEnsvl4
 h3AVPtvnHKggyjYFA/2pmsyiLHhOJwpQsM6yz9TgAPeA9je3xwhj/3bq0vWWfrv8/wUB
 RKkJbbaTm0R9bXjOTgsUL0Ny86ye2X8DoqaAiud+QzA5z62E609zZ2tMtYCAm9XRRSMM
 Jsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=zQHOIho/2prlWyXsDdz1JLyl95gQVOI9c3rzY167mvc=;
 b=ZdiDVKN0RF7R6psjNfyW717d13+9bh96ERoo5gDNNO4JJaf+8d2QsIlKwyvQOIQhnh
 7eaqdC8jQ3F1dS4N08jq6HxIX+DnM70egvScHUgwGHeLCZ+273IboRcpO5VAzMJr4R5E
 OJiQ2S1I/pkHLY4GByMIFdND4IJ8IZi22K0hndMzv0oB2vEX4yFePw76J0rvl94+MYr2
 2n2vKX84Tj4sDYgNyeujIQ4DIb9Q1EboYLB2brMnDrq014YBLOiVYLpQ2jKIvAMiYN5B
 PZbNp1csXSenHLkd90d2Su/Qfy62dpww82DDSJiZGwvvRaW6F8Bg2BubwFRiM8CVHmrl
 Tqxw==
X-Gm-Message-State: AOAM532C5ppr1/o0ZVeNMI1A/aT/auyqz4gRXJowNuH3awb1SukR3tL1
 P+kb2yAIkp8RvKi8plaXaGg=
X-Google-Smtp-Source: ABdhPJwwPXbaFzHpkplaAh3JVTf8laRalpE8t1Obfpb3WlyLGWeZJmQfBFokDpW3iusMnEWyfTrlpQ==
X-Received: by 2002:a19:be87:: with SMTP id o129mr4581430lff.217.1591343596055; 
 Fri, 05 Jun 2020 00:53:16 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id w15sm565130lfl.51.2020.06.05.00.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 00:53:15 -0700 (PDT)
Date: Fri, 5 Jun 2020 10:53:04 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Dynamically change enumeration list of DRM enumeration property
Message-ID: <20200605105304.4f022b38@eldfell.localdomain>
In-Reply-To: <9f8d8c47-e8a0-d3ea-a913-db550199d31f@kwiboo.se>
References: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
 <20200526103921.0817ee0b@eldfell.localdomain>
 <CAKMK7uHG1P9hwT1CBqWUfL6sBwZwyS7q0scXSUuXNiJMmRz-+g@mail.gmail.com>
 <CAL3Fm-L-iwGu60Zf15aYf9Xm9201sT2vU888Fv46Tv7x37Aq6Q@mail.gmail.com>
 <20200528082445.GR206103@phenom.ffwll.local>
 <CAL3Fm-+G0MJoYLb2CJKTW5w6Qk4K=j5if+6hLDE_ustW=e933Q@mail.gmail.com>
 <20200528154804.02fb8901@eldfell.localdomain>
 <CAL3Fm-Jspwx7=famPO5nOzPwL2wrBnMtZj0FTDjypvwdWZXPiA@mail.gmail.com>
 <20200601114942.5ae2d3ad@eldfell.localdomain>
 <CAL3Fm-K215Ws7y2sA6zFvMUxQCN0G58kWd5uvvT=Bek+LfgLZg@mail.gmail.com>
 <20200603121223.70fe0416@eldfell.localdomain>
 <9f8d8c47-e8a0-d3ea-a913-db550199d31f@kwiboo.se>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Yogish Kulkarni <yogishkulkarni@gmail.com>
Content-Type: multipart/mixed; boundary="===============1992874669=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1992874669==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3btKQeQ3eHMGUpUkx2Lz.zl"; protocol="application/pgp-signature"

--Sig_/3btKQeQ3eHMGUpUkx2Lz.zl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 03 Jun 2020 20:20:44 +0000 (UTC)
Jonas Karlman <jonas@kwiboo.se> wrote:

> Hi,
>=20
> On 2020-06-03 11:12, Pekka Paalanen wrote:
> > On Wed, 3 Jun 2020 10:50:28 +0530
> > Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
> >  =20

...

> >> The primary reason for why content producer masters video/gfx content =
as
> >> limited range is for compatibility with sinks which only support limit=
ed
> >> range, and not because video decoders are not capable of decoding
> >> full-range content. =20
> >=20
> > What I was asking is, even if the video content is limited range, why
> > would one not decode it into full-range pixels always and if the sink
> > need limited range, then convert again in hardware? When done right, it
> > makes no difference in output compared to using limited range
> > through-out if both content and sink use limited range. =20
>=20
> For the Allwinner/Amlogic/Rockchip arm devices I mainly play with the
> video decoder does not support range conversion (to my knowledge) and will
> produce NV12/YU12 framebuffers in the range the video was encoded in.
>=20
> These devices typically lack a high-performance GPU/3D-accelerator
> and may have limited CSC capabilities in the display controller.
> The HDMI block can usually do simple RGB/YUV and full/limited conversions,
> but using these conversions typically produce banding effects.
>=20
> Being able to passthrough decoded framebuffers in the entire pipeline from
> decoder, display controller and hdmi block typically produce best results.

This is very helpful. It means I really do need to take range into
account in Wayland protocol and make sure it can be communicated.


Thanks,
pq

--Sig_/3btKQeQ3eHMGUpUkx2Lz.zl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7Z+eAACgkQI1/ltBGq
qqdYuQ//dj3VHkKWXGJq5DnzWlTHqMuyQSL/YWVei3W6IlOXQ8k+l2Qn96xEe/0B
1USslnCdbsq7Ic0NlwzzmifRDZqHAQz3cFSWBLj/noCqKdnsiDpPFMQstSL8ArsW
B1fMHocBbDWMWjCvHaRGH1zntHNvVkUz+2bmqtP/y+IyUkj8YuelemfnOUK1yljm
QwAhSXh+ZnOU8avQRriRpgTCKsQg5bwGeS7cCaXZqdbSMmVlpb3WovltaBL6vumU
Dn7viIY6CaBS0N7NdiF5c/r/LAofLrwb11YFs6BINwCudZ52R7oLus5/QzA3fTYd
mxJHDq4GKaEKZw0sA1UhXFV8NxVgiKSsG+s4ssvr9wtnsTZ7McAdvdx0vHamVEew
erzQuIaYBvgYH4EAvwZvLULUZvgwrGfE8o7EUWz31BC+/A4lz5wHPcNl7tpDQpdw
xi6E+2h68OAuVLLHnv2rBiHIiGElHnBIqPFaqBoii4wNSeTohswMjrgBi1SmHy+P
67mswvhlr/w8YGxgkc40OTpe7R8Z4sn48WVAj9rfsEs9bvOWZ7rTqDX5EUwvqaAE
BnYdO0/nMG12Pra1z/81PW9/j0AVWYvd8ffqp1NdQjzQC95Lmu5LLZ3xjEhlJ4wp
3iWnayfGPIwzARIQwSmhKU4e+0kchHDbsTeU2WGejl+65YjRb+0=
=7ZZn
-----END PGP SIGNATURE-----

--Sig_/3btKQeQ3eHMGUpUkx2Lz.zl--

--===============1992874669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1992874669==--
