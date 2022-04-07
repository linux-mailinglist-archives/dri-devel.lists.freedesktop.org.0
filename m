Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F9D4F7DB6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE89710E652;
	Thu,  7 Apr 2022 11:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7919C10E6C3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 11:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649330159;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=XDaMI+4EBmGzpAUX/OBVolCDz/2DUisSrJKiCD/9MvE=;
 b=S9f/Upmjtl4bOpU4uELMwYuwzEhCC13kefSZU9WN7g0JgHiRfsDxdR95xH1E6KbzY5
 hw0sw7nh5sJ5U6mjUC0G04rN0AMTZXsvhtlbU2mc/egKb3IeJHhGFuviOMcT9zL2XjOR
 3E2armbpwAvf8OJXPzgkCc/vr+hKL9XkHtSNQ8wWSD3N51qcONJRdZMq9oORKrCKBMIF
 fIPNrkpgDniDEyvZEOjjNH6kGIFy0hkjS6AAUEIVOHS0AahP43Ke9D10l2xOOmFxasOR
 piQBIVqqv7sawpGhgVbdBsThDXmrb93qIIVit9LqlK+UprzBTWh/1d6Lw7ih1TDG61ZY
 +Ong==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8MRqg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.42.2 DYNA|AUTH)
 with ESMTPSA id k708cfy37BFxjx7
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 7 Apr 2022 13:15:59 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v17 6/6] drm/bridge: display-connector: add ddc-en gpio
 support
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <Yk6TJgdoSqthWUiz@pendragon.ideasonboard.com>
Date: Thu, 7 Apr 2022 13:15:58 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <30CEC20F-5EE5-448E-9610-3805E18952A6@goldelico.com>
References: <cover.1649262368.git.hns@goldelico.com>
 <bf90de303a5dbc587517fe4a1bb437e198b90198.1649262368.git.hns@goldelico.com>
 <Yk6TJgdoSqthWUiz@pendragon.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Paul Boddie <paul@boddie.org.uk>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 letux-kernel@openphoenux.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

> Am 07.04.2022 um 09:30 schrieb Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>:
>=20
> Hi Nikolaus,
>=20
> Thank you for the patch.
>=20
> On Wed, Apr 06, 2022 at 06:26:08PM +0200, H. Nikolaus Schaller wrote:
>> "hdmi-connector.yaml" bindings defines an optional property
>> "ddc-en-gpios" for a single gpio to enable DDC operation.
>>=20
>> Usually this controls +5V power on the HDMI connector.
>> This +5V may also be needed for HPD.
>>=20
>> This was not reflected in code but is needed to make the CI20
>> board work.
>>=20
>> Now, the driver activates the ddc gpio after probe and
>> deactivates after remove so it is "almost on".
>>=20
>> But only if this driver is loaded (and not e.g. blacklisted
>> as module).
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Added to v18 (which is needed to remove some now redundant patches
and fix a detail in the ingenic-drm driver).

BR and thanks for review,
Nikolaus

