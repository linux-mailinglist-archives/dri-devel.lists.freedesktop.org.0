Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2D728DA25
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2497D6E9F8;
	Wed, 14 Oct 2020 07:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from script.cs.helsinki.fi (script.cs.helsinki.fi [128.214.11.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E206E9F1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 06:58:43 +0000 (UTC)
X-DKIM: Courier DKIM Filter v0.50+pk-2017-10-25 mail.cs.helsinki.fi Wed,
 14 Oct 2020 09:58:37 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.helsinki.fi;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version:content-type; s=dkim20130528; bh=F/7UvvHwaKSkpop2P
 V4kpVg4P6kDTEOtjm08NJyWd7w=; b=JHVZhU1Wh8qx0Ue1NG5WYBAu7PeQaStYI
 S9dAmc6wvgQHhVoXISdxm5yexG4c/d8u0+D6ywYaKZ3r/OlEcDL8qsSDMxgcO2oh
 wzuymcBpEirEALr2n1lmY6qeztznDHdEaV14ee7Y+wigbwHhCvakdq5Wye3R5fck
 2iD6+xdTSI=
Received: from whs-18.cs.helsinki.fi (whs-18.cs.helsinki.fi [128.214.166.46])
 (TLS: TLSv1/SSLv3,256bits,AES256-GCM-SHA384)
 by mail.cs.helsinki.fi with ESMTPS; Wed, 14 Oct 2020 09:58:37 +0300
 id 00000000005A275A.000000005F86A19D.0000187A
Date: Wed, 14 Oct 2020 09:58:37 +0300 (EEST)
From: "=?ISO-8859-15?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@cs.helsinki.fi>
X-X-Sender: ijjarvin@whs-18.cs.helsinki.fi
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
In-Reply-To: <4ccd1076-29e3-044a-0696-fd205b100374@suse.de>
Message-ID: <alpine.DEB.2.20.2010140938100.6967@whs-18.cs.helsinki.fi>
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <5a3537c3-2c81-b9de-e4c7-c00577cdd43d@suse.de>
 <alpine.DEB.2.20.2009171407330.6530@whs-18.cs.helsinki.fi>
 <4ccd1076-29e3-044a-0696-fd205b100374@suse.de>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=_script-6285-1602658717-0001-2"
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_script-6285-1602658717-0001-2
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Sep 2020, Thomas Zimmermann wrote:

> Hi
>=20
> Am 17.09.20 um 13:17 schrieb Ilpo J=E4rvinen:
> > Hi,
> >=20
> > Yes, I can build custom kernels and test but I won't have time for th=
at=20
> > before the end of September so I'll do it only then.
>=20
> No problem, that's still fine.
>=20
> Best regards
> Thomas
>=20
> >=20
> > And thanks a lot :-).
> >=20

The high-res mode works, however, I wasn't expecting it to be this slow=20
though as I can see the slowish sweeps to redraw the screen or large part=
s=20
of it. Maybe you meant all along this slow (I was expecting something lik=
e=20
memcpy slow and this looks definitely much slower)?

While a large redrawing operation is going on, mouse cursor stops moving=20
normally until it is over and it then jumps to catch up. When the mouse i=
s=20
over something that doesn't require large redraw, it seems to work quite=20
normally.

--=20
 i.
--=_script-6285-1602658717-0001-2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=_script-6285-1602658717-0001-2--
