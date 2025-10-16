Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DDDBE3BBD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 15:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC01610E08A;
	Thu, 16 Oct 2025 13:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bnnSEeWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459B310E06B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 13:36:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 53CE0C041CD;
 Thu, 16 Oct 2025 13:35:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8656A6062C;
 Thu, 16 Oct 2025 13:36:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 213E4102F22EF; 
 Thu, 16 Oct 2025 15:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760621771; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8hlnduBps2CCSYzZqpb5CLnowbo1EYG2ZwR0jxQsXj8=;
 b=bnnSEeWhKYEVbruz9l2dL0xE/3Ra47wG9Ly3XxMwQsX5E0GEZzTOVG6D0eVkvCDLhZyNwO
 FvW7GTPa1KqwsikenCJTxC6ii1WYsNz/kh/NwBxWrtGhtFqqxzJ5ogrw2vXzQbSNATBjCd
 P023c0dKp9XL756GfgsPT1nIO7zo7aLZSpo790eUDblWV6C2QpefCKVo8Ax2fx8njJBba9
 P7jMq13dx/jhpWiIAEZ1x7Gk2Cr/s3PZq+aA6GAmYrwptE0fLfPPE4uCQWZ8srJx0/DmfX
 QUbX7RJtQaoRupKR9vJ1oljYDIU+iTFVcmFD0/h+F1VoGzj1EsKp1Blcvdi1Cg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 15:36:00 +0200
Message-Id: <DDJSBQRQJTMZ.X1W4I5YOURPK@bootlin.com>
To: "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 <dri-devel@lists.freedesktop.org>, "open list"
 <linux-kernel@vger.kernel.org>, <lkft-triage@lists.linaro.org>, "Linux
 Regressions" <regressions@lists.linux.dev>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Simona Vetter"
 <simona@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>, "Dan Carpenter"
 <dan.carpenter@linaro.org>, "Anders Roxell" <anders.roxell@linaro.org>,
 "Ben Copeland" <benjamin.copeland@linaro.org>
Subject: Re: next-20251014: Internal error: Oops:
 drm_bridge_connector_hdmi_cec_init drmm_connector_hdmi_cec_register
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <CA+G9fYuKHp3QgPKjgFY3TfkDdh5Vf=Ae5pCW+eU41Bu=D7th2g@mail.gmail.com>
 <CA+G9fYv_mGoDzFv33v7Y5+6yz6z=xp9FJRiFUBYDapvE_rrBXA@mail.gmail.com>
In-Reply-To: <CA+G9fYv_mGoDzFv33v7Y5+6yz6z=xp9FJRiFUBYDapvE_rrBXA@mail.gmail.com>
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

Hello Naresh,

On Thu Oct 16, 2025 at 12:52 PM CEST, Naresh Kamboju wrote:
> On Thu, 16 Oct 2025 at 16:14, Naresh Kamboju <naresh.kamboju@linaro.org> =
wrote:
>>
>> While booting and loading kernel modules on dragonboard 410c board
>> with Linux next
>> kernel next-20251014 and next-20251015 the following crash noticed,
>>
>> First seen on next-20251014
>> Good: next-20251013
>> Bad:  next-20251014
>>
>> Regression Analysis:
>> - New regression? yes
>> - Reproducibility? yes
>>
>> Boot regressions: next-20251014: Internal error: Oops:
>> drm_bridge_connector_hdmi_cec_init drmm_connector_hdmi_cec_register

Thanks for the report.

This looks like the same issue reported here:
https://lore.kernel.org/all/336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.co=
m/

I'm writing a fix right now, will send it today if all goes well.


> These three patches landed recently,
> $ git log --oneline  next-20251013..next-20251014
> drivers/gpu/drm/display/drm_bridge_connector.c
> 2be300f9a0b6f drm/display: bridge_connector: get/put the stored bridges

^ This is the commit introducing the bug.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
