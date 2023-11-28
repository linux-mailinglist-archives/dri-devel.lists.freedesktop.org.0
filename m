Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BF77FBBA8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CBA10E072;
	Tue, 28 Nov 2023 13:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E028010E072
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1701178455; x=1732714455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k0a3a8btfbsO2VamDqFA7x6/gxa2O/rQP88elj8YSQc=;
 b=ZZTkc0aKVQfkSSOhCKldUx3T7IdVuqOsKqq+NHMfjHYEdpnUol7yvfbp
 1rpbZCHTcZPJjyK+XdhGzCWFpW1Wszq1szJK+cyfWu9E4aRRL7jb3I/2n
 RNHDHQHhXs+5mBKM65Ry6WEsN8VfJWnO3SOGL1Y039ONs9roKCg0YabOS
 iXxuVVLY32DsvERl7S2X1kZNG1lWFDWuE2HGezPn22dwj11IKRSbl1iaR
 eJY2UpAeDiQqaJ7xtzbsfVrki83dCCVUmj0S9y1CckGD9IF8yTkIBXOs3
 yii1tD9a7aBdvRqxpbcDgP8/t7sVqb+IPFFDEzmgUpXpIN+mzirW2c7Wi A==;
X-IronPort-AV: E=Sophos;i="6.04,233,1695679200"; d="scan'208";a="34216192"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 28 Nov 2023 14:34:13 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F3F50280075;
 Tue, 28 Nov 2023 14:34:12 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/2] Improve tc358767 debugging
Date: Tue, 28 Nov 2023 14:34:12 +0100
Message-ID: <4980635.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230817075234.1075736-1-alexander.stein@ew.tq-group.com>
References: <20230817075234.1075736-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Hi,

is there any feedback on this series?

Thanks
Alexander

Am Donnerstag, 17. August 2023, 09:52:32 CET schrieb Alexander Stein:
> this small series improves debugging the tc358767 driver by using
> dev_err_probe for additional information (patch 1) and print IRQ debug
> output only if hotplug status actually changed.
>=20
> Best regards,
> Alexander
>=20
> Alexander Stein (2):
>   drm/bridge: tc358767: Use dev_err_probe
>   drm: bridge: tc358767: Only print GPIO debug output if they actually
>     occur
>=20
>  drivers/gpu/drm/bridge/tc358767.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


