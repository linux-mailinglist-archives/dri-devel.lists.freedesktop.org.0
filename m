Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C006DCA37
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 19:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932A210E1EE;
	Mon, 10 Apr 2023 17:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D466110E1EE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tWhmGtBxUELj+NALmzMx7P3ohScaP//45di7JbTIfqc=; b=OCqZJxcN81Y3+olGKoql5itLFa
 WgNOwy2AV+I2QtW3+CAFMSu303dFfsLNhA9Eb45b2LE243+G6MLuk1K3ft+MTmDKBlHgu8FP/3VnU
 ClWg6xPnldW9YFKabMbdAK37iFNST1S9EffkXPlwc6dfiB3U4E3qsqG/m1Zjd7DfxIfGts6jwVx8r
 dWp97VQWNX3xaj6D5BoDwtiTYFHkc66++626QeXWGNMdm6Qcei+flUk1/n/jmHVkvBuTkmLUSgoN7
 mm6TSZq8GQv4RWDwXIhvdWOmSQRixvJJGofNHGo8JykFmbq+Rl8fTxDqvdzi60txJS24+Glxw/S/2
 zz7O/knw==;
Received: from [38.44.66.31] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1plvfA-00E0I8-Ju; Mon, 10 Apr 2023 19:50:44 +0200
Date: Mon, 10 Apr 2023 16:50:36 -0100
From: Melissa Wen <mwen@igalia.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/vkms: add module parameter to set background color
Message-ID: <20230410175036.tqjbwrd4ldcnnqlf@mail.igalia.com>
References: <20230410125435.128689-1-mcanal@igalia.com>
 <gY5DtUoeqVhT1HdJU8yjHSqwe9gTIbV6Q2yVDYRyI_JGHS6Lo73Ivjs2G8d_5T_qL2q7pOhjC6O_aPk2Pnn3npdhzh2Y-_nrD98r3ONMrWc=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dughwqgsy7tnmtax"
Content-Disposition: inline
In-Reply-To: <gY5DtUoeqVhT1HdJU8yjHSqwe9gTIbV6Q2yVDYRyI_JGHS6Lo73Ivjs2G8d_5T_qL2q7pOhjC6O_aPk2Pnn3npdhzh2Y-_nrD98r3ONMrWc=@emersion.fr>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dughwqgsy7tnmtax
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/10, Simon Ser wrote:
> I think this should be a KMS property instead of a module parameter.
> Is there a reason why this patch uses a module parameter? It breaks
> user-space expectations.

Hi Simon,

a KMS property is what we have on vkms TODO [1] and the module parameter
was Ma=EDra's first step to open a discussion for this property [2].
AFAIK, we would need to create the KMS property first, but it seems
there isn't an userspace case/need to support this API change.
Do you know any valid use cases to support a bkg color property?

BR,

Melissa

[1] https://dri.freedesktop.org/docs/drm/gpu/vkms.html#add-plane-features
[2] https://lore.kernel.org/dri-devel/20230406172002.124456-1-mcanal@igalia=
=2Ecom/

--dughwqgsy7tnmtax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmQ0TGcACgkQwqF3j0dL
ehx3gA//dlZXMGMTtJl8zxu8S4udoCkeeUjvi1CqegZXJ6fPzvTUTcID6t+PxTfU
LKtoWKdqNR/RZ7luDrkx5beLvrjSEYv3aAiiq6XE4I4C7FCrzs8l+goDr8tLYtDy
Hsm/ST1RggzhfVE3wHWY0dti2FX6lTkMk1TPRcGwBTbS22bIGEim03iDAOfOWj//
579TLuYmNqthsB+U81GdJcMQQ2k2duJ57qv5gaDWIhn9w0+drPLMG5gbjDa+eA5L
Pp6J+TWQTGMPDzbCvkXaW3rjU1y4nMzvq/yxWmYS4EEVo6b1ZqYmYmsz3gKpmn30
RvoVDS32C2YiD9xm5EJn84q0HUQHcUtXJQ4hE27UOZ5hQcrzCsotu+7SAjTaLBtK
6wpj5AYVQi0neQlc3Z8gqwIytgsR8Fwr1xP9qz72aAGaXlFWc1z6EJE1lmPwrHI1
VUl7xR5IG9dj282N/78c6y1IimDj8Kj+BhdU1Rh3zUvDPR4eiAppKZhMKTOzeF32
ke28vbUsDG6Xhc3mhe8NwXB7t7Jx3PATkBUgPw0imZ6oY7EXNDoTmjC38qnl1aey
D+W4KOUPVq6wcSKAUWRN3x8r3+91g4ZwjyUdUtqkCNjx9dUwDjKyzc5EVlIxv8WP
NGnyeLkLCNrKoNQtt7LmaZ3NlfmPHwPTUYO6aOxrP3C0/Nvzcio=
=GGyx
-----END PGP SIGNATURE-----

--dughwqgsy7tnmtax--
