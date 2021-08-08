Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 019463E3C7C
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 21:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D25789AEB;
	Sun,  8 Aug 2021 19:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4772E89AEB
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 19:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628449941;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=8x7srcrmZ1/WCTZQFJiINnCxHY92TZ+clMgKoK3VcnA=;
 b=fLeFneLbNeeb+PnUH/azqY+B8iMLLvtOfkUrr7G0dLp4r2fbGkNPez1CDCjmrE4Vmq
 ZEtwuBG3l+9iYZvLaYHD4BZe3Bt0T+pc54NQN4i/ESD48R7evi5HVt2WY/c5FuIB9Wsy
 UlQEWEE1gJrpRWNcpJQMLIyfP5xz9bACzuN8Vl+ERC/bmwOr2KkBPBCuf67igbF0amr6
 VBXb0SNEu4105pt4/PvgHhQIR/mYUKfes96HIDvTc+Da6TKsJtcKk9kfv7J5ZoDNIeyB
 AeSdx/VrKr+E9YLw2CxwWSy/DHnmNl+7SoaBoEV4pIJc8iyj/dnjgYVgxew64zkoUQpO
 wqkQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43u3mM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
 with ESMTPSA id Q02727x78JCLGc2
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sun, 8 Aug 2021 21:12:21 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH 8/8] drm/ingenic: Attach bridge chain to encoders
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <2C83670F-3586-435B-8374-C3CC1C791391@goldelico.com>
Date: Sun, 8 Aug 2021 21:12:20 +0200
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>, linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <137A13EE-9E0E-469E-BE43-677349478A58@goldelico.com>
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-9-paul@crapouillou.net>
 <2AEC5953-FE54-4DD5-88B7-783C4D9E23B2@goldelico.com>
 <4OBJXQ.DA6PDYNSVNYV1@crapouillou.net>
 <2C83670F-3586-435B-8374-C3CC1C791391@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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



> Am 08.08.2021 um 21:06 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>=20
>> Am 08.08.2021 um 21:04 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>> Hi Nikolaus,
>>=20
>> Le dim., ao=C3=BBt 8 2021 at 20:57:09 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>>> Hi Paul,
>>> all other patches apply cleanly but this one fails on top of =
v5.14-rc4.
>>> What base are you using?
>>> BR and thanks,
>>> Nikolaus
>>=20
>> The base is drm-misc (https://cgit.freedesktop.org/drm/drm-misc), =
branch drm-misc-next.
>=20
> Ok, fine!

Contains 3 patches for drm/ingenic and after taking them first, I can =
apply the series.

Again, BR and thanks,
Nikolaus

