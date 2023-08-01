Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3EF76B4A0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 14:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4EA10E349;
	Tue,  1 Aug 2023 12:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta02.prd.rdg.aluminati.org (mta02.prd.rdg.aluminati.org
 [94.76.243.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7172F10E349
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 12:21:35 +0000 (UTC)
Received: from mta02.prd.rdg.aluminati.org (localhost [127.0.0.1])
 by mta02.prd.rdg.aluminati.org (Postfix) with ESMTP id C658B1FE3F;
 Tue,  1 Aug 2023 13:21:33 +0100 (BST)
Authentication-Results: mta02.prd.rdg.aluminati.org; dkim=pass (2048-bit key;
 unprotected) header.d=cantab.net header.i=@cantab.net header.a=rsa-sha256
 header.s=dkim header.b=wXTUNQsF; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mta02.prd.rdg.aluminati.org (Postfix) with ESMTP id BE715407;
 Tue,  1 Aug 2023 13:21:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cantab.net; h=
 user-agent:message-id:date:date:x-mailer:references:in-reply-to
 :subject:subject:from:from:received:received:received; s=dkim;
 t=1690892492; bh=dz+kwgn9KDTHA5JzjchqB0v45IBECVx68+rYq02+WNI=; b=
 wXTUNQsFP0Ds9TYjHN87F29frLCbt70HhmAg0T6IYrVVaBOdxpOqNf1VwDRvltld
 w5ghJHw2ZHgiGyORXxFv6xFXt5nBe+Q5LkUGnQhvUX4dFKq2NRJgXkoDiQBCk7dj
 6NZX92xbZFQAagt79z/MBQSo7OpqQCx2xzHlxu2pRKfrGwX5fZgxwgCwK1yvlSUd
 A/1EMd+d/T3u0udsszlgzSBgEM+hJt6XqGnTGlaQ4D7U+H34sswh3fm5jL05FFs6
 dxYz0MXmyGEHRViqN/1IE5ByGGVPlhkUNvUleg5XVQLvgrc1ll0YC9ljbCreoLeq
 rW6kDxAAi5fZ2na3tp8FAw==
X-Quarantine-ID: <telMfgZJ4JvM>
X-Virus-Scanned: Debian amavisd-new at mta02.prd.rdg.aluminati.org
Received: from mta.aluminati.local ([127.0.0.1])
 by localhost (mta02.prd.rdg.aluminati.org [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id telMfgZJ4JvM; Tue,  1 Aug 2023 13:21:32 +0100 (BST)
Received: from revelation.localdomain (static-87-75-118-217.vodafonexdsl.co.uk
 [87.75.118.217])
 by svc01-1.prd.rdg.aluminati.org (Postfix) with ESMTPSA id 1D3F31C0003;
 Tue,  1 Aug 2023 13:21:28 +0100 (BST)
Received: by revelation.localdomain (Postfix, from userid 1000)
 id 4281F120333; Tue,  1 Aug 2023 13:21:28 +0100 (BST)
From: Roger Sewell <roger.sewell@cantab.net>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
In-reply-to: Your message of Tue, 1 Aug 2023 12:11:26 +0200
 <548751aa-6184-a5b0-2b90-d96ca04a8640@redhat.com>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727223438.4658@revelation.broadband>
 <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
 <3ff67cb3-c477-b834-3d6c-4eb99952d59b@redhat.com>
 <20230728131253.5411@revelation.broadband>
 <548751aa-6184-a5b0-2b90-d96ca04a8640@redhat.com>
X-Mailer: MH-E 8.6+git; GNU Mailutils 3.13; GNU Emacs 27.2
Date: Tue, 01 Aug 2023 13:21:28 +0100
Message-ID: <20230801132128.4379@revelation.broadband>
User-Agent: MH (GNU Mailutils 3.13)
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Jocelyn, Thomas,

Jocelyn, your patch works perfectly - thank you.

May I leave it to the two of you to decide what should happen about
propagating this patch ? (I have set out my user's point of view about
it in my email of Fri, 28 Jul 2023 10:11:00 +0100, but obviously my
opinion is not binding on either of you.) 

I would be glad to hear what you eventually decide between you.

Many thanks indeed for your help !
Roger.
