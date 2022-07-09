Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018A56C90D
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 12:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB9A112644;
	Sat,  9 Jul 2022 10:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72442112644
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 10:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657363417; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZm4gVWjiDEO5u30RuW6VoyxTvmlC8q+Qpm+4tGQ74c=;
 b=RGYSTeN8yc1avmOrmXEF+5G8x0qBiLTYlaLGRTfv0Ur08nsmZIN1nQxFVg8sxhc5jgT/23
 IAres0EXXDFv6C4qMzlSVyxiRiO0wanAYIP+cvBF3mdZimJ043vuUB+zjwrV/GN7GtooZl
 8qxjC9mvgSbDa8qr4SiG6c1CC4I7nEE=
Date: Sat, 09 Jul 2022 11:43:27 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 0/6] drm/ingenic: JZ4760(B) support and random changes
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <FS1RER.IMGKHPGOL0LF1@crapouillou.net>
In-Reply-To: <Ysk88cZO1iQhX/I2@ravnborg.org>
References: <20220708205406.96473-1-paul@crapouillou.net>
 <Ysk88cZO1iQhX/I2@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 list@opendingux.net, Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Le sam., juil. 9 2022 at 10:31:45 +0200, Sam Ravnborg=20
<sam@ravnborg.org> a =C3=A9crit :
> Hi Paul,
>=20
> On Fri, Jul 08, 2022 at 09:54:00PM +0100, Paul Cercueil wrote:
>>  Hi,
>>=20
>>  A small set of changes to the ingenic-drm driver.
>>=20
>>  The most notable thing is that ingenic-ipu is now its own platform
>>  driver.
> It would be nice to know what is achieved by this change, I could
> see the code being a tad simpler, but the cost was more EXPORTs.

Well=E2=80=A6 we now have two separate drivers instead of one driver that=20
deals with two different devices. I thought the benefit here was=20
obvious.

> With the added explanation, which you can add when applying, all=20
> patches are:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

I'll apply the other ones and keep this patch for a V2. You made me=20
realize that I could use namespaced exports instead of global ones.

Thanks,
-Paul


