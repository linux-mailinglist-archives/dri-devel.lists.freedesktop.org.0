Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28979223DFD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 16:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C776EDD5;
	Fri, 17 Jul 2020 14:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA576EDD5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 14:25:29 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id rk21so11068976ejb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mUVdR+ZDJVxSmd7ZbQVSsi764XMpQahMmDvfOF22gQY=;
 b=e99KnuVGCS6dPPckmUblnQ/Eq5Pt0qMRRfY1ARV29XHavDg6gElhKrIaEDpBLGpuds
 P5FHLwnwgL07Jn0MnjcLpQ9PvpecGEu96QTkn24/clTC27J7zVna4p0PTDdn1Mx8DXhP
 t0TXqYHl0sfJBoJibUYV3CdQFO+K2xZuud8PpDxPXaY4lLsgUh+oAkCt8nZ++lqC5qps
 2zNBx4zcV0160Grno+DH4jd12dqPucjjjo2mZzy3TAsCmc0crUPAuT5mzRaDaGdR/ll+
 2AunOn2TjQGBbiGS8LS4T2yBBEyswfI6F2qVP3yDg1f5QDVWQDLFKLERr+d8NUhqcsTZ
 El7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mUVdR+ZDJVxSmd7ZbQVSsi764XMpQahMmDvfOF22gQY=;
 b=nztu8ZzkMEexW2GuU3gqQ69txHeZ42Sd2fPqOTe8hCatP/slbqc0mG/tEBwouN7lwy
 TckhlMsDKf29Ra0rnZL9Sdai12xVzdTBcqIL0Te6M9rVNrC1yEWPEjVnJj3MvIGMYAst
 qFWh2dVGc0LwVHUavWeEdDUZ6slnaHWWJzuYWnAHijFzoyotjqT/viRIXUfmi/Mxy1KT
 oMcPDWxJEKs4JKNuAPBnJaO8kBaua8S+yP3nmw4wVotcRCePpB4l9LaqNLDdJnlQpO39
 C+mWcpF5zpdYtArt1H8ENVPhe+UVbWb9NizWa0MFPOrnZ78RcKHdGgO5C7gWg3V4L7y7
 38dQ==
X-Gm-Message-State: AOAM531MYw0VKKXGQ5HcPcgcWfT0l3pIUUnOVO+QQ+l0YPTCFSnNBsuF
 srWEbERbJGf/1bLJk7eSaHbVbHVt
X-Google-Smtp-Source: ABdhPJyu7NsACW41OKjti0Dmecq5SwVTGW26QQC4foUalOjXrZcuCwKG78N9LWqnKSZwGFISKNM07A==
X-Received: by 2002:a17:906:d286:: with SMTP id
 ay6mr8804419ejb.400.1594995927698; 
 Fri, 17 Jul 2020 07:25:27 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p14sm8475984edr.23.2020.07.17.07.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 07:25:26 -0700 (PDT)
Date: Fri, 17 Jul 2020 16:25:24 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: miaoqinglang <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] gpu: host1x: Convert to DEFINE_SHOW_ATTRIBUTE
Message-ID: <20200717142524.GA1218823@ulmo>
References: <20200716090323.13274-1-miaoqinglang@huawei.com>
 <20200716133450.GJ535268@ulmo>
 <5684dcb3-c5a4-96c1-dd96-c44f5a94938f@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5684dcb3-c5a4-96c1-dd96-c44f5a94938f@huawei.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
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
Cc: linux-tegra@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1360056418=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1360056418==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 09:32:21AM +0800, miaoqinglang wrote:
>=20
> =E5=9C=A8 2020/7/16 21:34, Thierry Reding =E5=86=99=E9=81=93:
> > On Thu, Jul 16, 2020 at 05:03:23PM +0800, Qinglang Miao wrote:
> > > From: Yongqiang Liu <liuyongqiang13@huawei.com>
> > >=20
> > > Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> > >=20
> > > Signed-off-by: Yongqiang Liu <liuyongqiang13@huawei.com>
> > > ---
> > >   drivers/gpu/host1x/debug.c | 28 ++++------------------------
> > >   1 file changed, 4 insertions(+), 24 deletions(-)
> > This doesn't apply. Can you please resend, based on something like
> > linux-next?
> >=20
> > Thanks,
> > Thierry
> Hi, Thierry
>=20
> =C2=A0 Sorry I didn't mention it in commit log, but this patch is based on
> linux-next where commit <4d4901c6d7> has switched over direct=C2=A0 seq_r=
ead
> method calls to seq_read_iter, this is why there's conflict in=C2=A0 your=
 apply.
>=20
> =C2=A0 Do you think I should send a new patch based on 5.8rc?

No need to. I'm about to send out the pull request for v5.9-rc1, so I'll
just defer this to v5.10 since it doesn't look like it's anything
urgent.

Thierry

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8RtM8ACgkQ3SOs138+
s6Hj6g/+MgjmNXDQakxoDHLk0m84f7i97cY0lrI0Z0XFp0ZsuZp4VHLS0Rzd2wt8
3tb6OLbwu6Q456lBZIw/FKa7i4zJ3bRzV1+dnvZaXPWgVUzSRMEgo6AugBNGQqhy
eQJH+5NfpN75sWFtXjhA/PscNW1v6oR/QkTKa2kcYFtP5xbSWHxVkdRUK/Xl5s15
TGaYsskrZehPE8k+6xNH6c0RIpt6ERO1NxnjrapApW3w98IYen1X8ONjILhJhjny
ZjUJN3WbTaZVo7WtxZWG9G5AMR+5LK8qByRzjf1VoWWpFbiuZaPae/ewRFm8CZeg
jNS3PYpAuSW9Bv0j5o2EEXUK4LV9gAC8ET140dTMmupSLH73Eu1ML7+Lm0TAGkK0
MPmJ8jLc0TMTERdA2Jt5s5sNZttMjaABxgPvl2igT+2zVA3yzyE1E3EO5qpyVQSF
R2AWrcyc9gVdyCElBq5Z39td7OkL4ylG/sboo6xxudgW5gcYo2K2w541CEES9TKm
JWeo5cf8YiBWcoF6ppg+OkTw61NILMjiMopyrd5ZDSOnwAi/oprOyGT7TfQJqazJ
y78QPzi3GrAzlZzMovNWNw+7MIIuig0tYtxVMz1i5/uBAE89ngZjN+09a4G14q4z
0giSD+1Iya4q2w/DBhCIwiyhT53pHp76KrCj/+Xy1+8FUVHUprU=
=J7AY
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--

--===============1360056418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1360056418==--
