Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52510BEAA22
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0DA10EA51;
	Fri, 17 Oct 2025 16:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LjJoAxXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D4310EA51
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:21:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6D6B24E41146;
 Fri, 17 Oct 2025 16:21:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 439F4606DB;
 Fri, 17 Oct 2025 16:21:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 01A30102F2326; 
 Fri, 17 Oct 2025 18:21:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760718100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=M92WI+PGFdvoEo5x/+VF/yQMrWADVhb1nigV4QXWseo=;
 b=LjJoAxXpFtx6zaAAFyn0jnPHV3jwcS75RTNQnQL3aSoDj+iA6M0I9VAo4P4cX9+vv6t2mX
 sGRWUlywn6/2wGFoIxFhaU2SJ2Up7Sw+t0yF9IsNRkbmOsKKHqkXydQDPtuQT2lzbzrJUW
 LLur9aDt+drjnUsk28si/PDdwcMHgJO0mQ9ekTEq00L2TlD2iRUZg1HiJ91lyrJNwpo4v0
 zUoEB/Kfhh8MdhzzgCSWiwGKNcF8EboAAk29M9jQCljnY4BwiGwd/36r/F38tVM8Hn33aj
 VQ9/1jeFuf/XHTBgVIhAycea1PnNZGDOu/cg/HUwfsVc23iqgSwG6u8rOWTRhg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 18:21:35 +0200
Message-Id: <DDKQH2MIHZ2S.2MPJCNHXMIT4U@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Naresh Kamboju"
 <naresh.kamboju@linaro.org>, <dri-devel@lists.freedesktop.org>, "open list"
 <linux-kernel@vger.kernel.org>, <lkft-triage@lists.linaro.org>, "Linux
 Regressions" <regressions@lists.linux.dev>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Simona Vetter"
 <simona@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>, "Dan Carpenter"
 <dan.carpenter@linaro.org>, "Anders Roxell" <anders.roxell@linaro.org>,
 "Ben Copeland" <benjamin.copeland@linaro.org>
Subject: Re: next-20251014: Internal error: Oops:
 drm_bridge_connector_hdmi_cec_init drmm_connector_hdmi_cec_register
X-Mailer: aerc 0.20.1
References: <CA+G9fYuKHp3QgPKjgFY3TfkDdh5Vf=Ae5pCW+eU41Bu=D7th2g@mail.gmail.com>
 <CA+G9fYv_mGoDzFv33v7Y5+6yz6z=xp9FJRiFUBYDapvE_rrBXA@mail.gmail.com>
 <DDJSBQRQJTMZ.X1W4I5YOURPK@bootlin.com>
In-Reply-To: <DDJSBQRQJTMZ.X1W4I5YOURPK@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello,

On Thu Oct 16, 2025 at 3:36 PM CEST, Luca Ceresoli wrote:
> Hello Naresh,
>
> On Thu Oct 16, 2025 at 12:52 PM CEST, Naresh Kamboju wrote:
>> On Thu, 16 Oct 2025 at 16:14, Naresh Kamboju <naresh.kamboju@linaro.org>=
 wrote:
>>>
>>> While booting and loading kernel modules on dragonboard 410c board
>>> with Linux next
>>> kernel next-20251014 and next-20251015 the following crash noticed,
>>>
>>> First seen on next-20251014
>>> Good: next-20251013
>>> Bad:  next-20251014
>>>
>>> Regression Analysis:
>>> - New regression? yes
>>> - Reproducibility? yes
>>>
>>> Boot regressions: next-20251014: Internal error: Oops:
>>> drm_bridge_connector_hdmi_cec_init drmm_connector_hdmi_cec_register
>
> Thanks for the report.
>
> This looks like the same issue reported here:
> https://lore.kernel.org/all/336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.=
com/
>
> I'm writing a fix right now, will send it today if all goes well.

Here's the fixed version:
https://lore.kernel.org/lkml/20251017-drm-bridge-alloc-getput-bridge-connec=
tor-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
