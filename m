Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456CC8CB4A1
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 22:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5ECE10E1D0;
	Tue, 21 May 2024 20:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="qILuSzRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E2410E1D0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 20:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1716322829; x=1716927629; i=markus.elfring@web.de;
 bh=/9aJTNuA6pnci53Ve+OUeYBzwYFSE2CeDkBygRRm59g=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qILuSzRdTrgUMnsc4QpigO2TZXL8A0BhsJPzrynsu7rrr3d8k9kHouqHUX1zbFAM
 CBmqKGoM7BgIRj9mp0REzMz5SmZB2v37pvu4T9JYUMnijXXVwezgyGf6F1ADruDJ6
 dT/6O6075oWTsEQqvSnhFQS3Rj2wiG1vfsi4T5rToAdzrPoLoxeYRhWWw1bttFANO
 +aJZu92WMIBXwXASID5hi+wT62bwr766G2gZHUw3mFb9nKxTu7xQmfAq1Y8V6BGn1
 m0jW/4EPaw3zV4HA5pfksbr2pQpWoAkYmAryUC9c1SavExbercQ0OM0l5E+bwxUfI
 3rH8G0sRey4r5WWl9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mae3q-1shCtT1L10-00byUi; Tue, 21
 May 2024 22:20:29 +0200
Message-ID: <3a12e09d-9a1d-4aa3-8114-83797290a724@web.de>
Date: Tue, 21 May 2024 22:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Aradhya Bhatia <a-bhatia1@ti.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jyri Sarha <jyri.sarha@iki.fi>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Nishanth Menon
 <nm@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>,
 Udit Kumar <u-kumar1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20240511153051.1355825-6-a-bhatia1@ti.com>
Subject: Re: [PATCH 5/7] drm/bridge: cdns-dsi: Support atomic bridge APIs
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240511153051.1355825-6-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4YQQRdwKiPutjczFXvMWniMXGjriuJnx7Q/D5rQhHqGPgLZYwAR
 LQYe8g8eb5ynwTghmOA8F+dcuWjxa0QH7gZIljat00ooKdm29HZC7xRIMIcnrK41NEMgpJi
 Zy0l1tDPLqGc/Ct+7DCxuvSjVb/hY3sAGOac3pPS57vGZqMbbYg2SiEJrIFX1o4r9al/kC5
 oSGQzEZZd3ljWCtV7buXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Zcpg8i+p0DI=;PKbrw9hi43jmMaCbO31CO+HkuEJ
 QkZXdNDi0pjHbH7ld8kzYFbUozwH9NyeKLqemGr9LHh4TW2amYXLE5Mk4z4AZseRJkDzH+6K/
 KbtH/pUVgMehnt8iow+De5tuWgrUmwAnJXTtjpO2sDrdARRFaYaneJTJNBmvx90R1VZn9AXo0
 8AQfgSikBPeXLG1WYkfDnSaMIU3vUiE/ihrZPje+Xy0sd4UB5rxg4MNX2k7kv/wHRG0zZNX+G
 ZQkdCk3rD8fb0e1bIiTjc+dEBZolktc5B9vo3N5H+Faq+dE/XZP8h3AZEoY/L5Q/LtBbBPAej
 x889vZO/vXDzhMo1Cjg9tfSD3TCQKeWBN0lY8NGNoJkGiTNI8vIzOVfpwng7APKohC7F1pnvH
 WS5U6jmK85k3FqyN1wT1gf9G0gZ5VTHsg3mtbGYH4bIxkhRV1j5WX4LkQTBd1qnMLwLNqu5eb
 GhUL4h/VDJwJMlLYv/nQ249apjzULISVD3fsyi4JlSS5VjBlufRMh9DnYxaasZpHRovFEj9kO
 +yJFJ875glyTGdb628aTwqeGIfwYSM9xV07wwkFKeaIZE1QKV1pgD3By1P/ksYabuM6uSa37v
 jN8nxfz+PkSE6PqALcW6IV7az+XXEroHtOnTCo8UxBTBmPgyuLteO70ujHoX2nKmuKDA2PyAk
 fIClu4sE+IuL6AbTneEvan8m6jxy1V+cemqFpn/3XaADcZ3RarasV7D9zZG4gHaXYUaGOzU0h
 DH1/5KQM7N6/SBtAXEdbRk0pyn5iL4jXvARVqPSEgTokK7CIYDBts55MJWed+hE2uw0/LtpLq
 lPWfrio3SzNjBdm78AYqwiAo6FuVoiGV4J8h6/ldMcQdY=
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

> Change the existing (and deparacated) bridge hooks, =E2=80=A6
                           deprecated?

Regards,
Markus
