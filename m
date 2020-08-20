Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9316424CE98
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113436EA9E;
	Fri, 21 Aug 2020 07:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0C26E030
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 08:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597911596;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=uXOt2i166nL4Kswd8TwsyRIldcKcFrQUaFJvpehnW/I=;
 b=syf3S0soQSabgFjb76WjH4qNtq66YpeVDk5s4rKicv+hYJwLP70Axf0DGtF60UAt9V
 LjYLcZzyHUEwb0GWAuViw9v3DLIbuGXiDAlDEh6069U9cVWUB4A9L9kxRkFs5AOoCmAv
 vF092semPWyJG+wWzhh3UtZs4+tYjpsgbmkMQqIGyZiw/dChKofeBeaHj/pm8TSBVlBV
 ZX21JhhbGQJJKLkI/BTMJ+h9AuyRtnFo+gbu/pbM0nPaqsyOKVjkCt3GXMBNeQkNz7Md
 6tJfOANm7n1jKfKUEdsSPvvmQLQv/C2X+NMa+e6/Z8hfJ0eDJHk2Z1Lp7bXV9I2xEH/m
 t0Iw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAuw43oTyE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id n03b0dw7K8Jk7uj
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 20 Aug 2020 10:19:46 +0200 (CEST)
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic
 JZ4780)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAAEAJfBxJLyS-EaE82c4Oq3-EFongDmAtYnPtfMLKLL3KAiFxA@mail.gmail.com>
Date: Thu, 20 Aug 2020 10:19:45 +0200
Message-Id: <DABBE9E8-E94F-4F13-BB33-5DD67CAD9DFA@goldelico.com>
References: <1940005.XIBaf5lNV5@jeremy> <7086465.UhkgK7rEtT@jason>
 <32cb6f50-1fe1-1484-0512-04590882d35a@baylibre.com>
 <3158508.CFMi0AOM4G@jason>
 <CAAEAJfBHBqT9Lv5zMaizJLnz=L5+Z3RvYoDf=Ex09_PDSUGe5g@mail.gmail.com>
 <4362AD3D-B072-480E-B424-28A7C9F8061B@goldelico.com>
 <CAAEAJfBxJLyS-EaE82c4Oq3-EFongDmAtYnPtfMLKLL3KAiFxA@mail.gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Paul Boddie <paul@boddie.org.uk>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ezequiel,

> Am 20.08.2020 um 00:26 schrieb Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>:
> 
> On Wed, 19 Aug 2020 at 15:50, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>> 
>> Maybe, can you share your rebased tree to clearly identify the
>> subtle differences? Maybe I have broken something by the rebase.
>> 
> 
> Sure.
> 
> Please give this a try and let me know if it works for you.
> 
> I've cleaned and squashed your changes, hopefully
> I've kept the correct authorship for all of them.
> 
> https://gitlab.collabora.com/linux/0day/-/commits/jz4780-drm-hdmi-v5.9-rc1
> 
> This should be enough to get an fbcon, launch weston, etc.
> However, there are few things that still don't look right.
> Seems planes X,Y offset is not working, and also enabling
> a second plane results in both planes going black for good.

Yes, it works!!!

There are some unexpected things related to CONFIG settings on my setup
(maybe missing modules) but for the first time I can see the boot log on the panel.

> 
> This needs some more investigation, but seems at least a good start.

Yes it is!

I can now git diff the code and the CONFIG.

So it seems we have indeed a breakthrough.

Thanks to all who did contribute (even behind the scenes in the DRM subsystem),
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
