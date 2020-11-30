Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0007C2C8307
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 12:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF966E471;
	Mon, 30 Nov 2020 11:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340786E471
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 11:17:04 +0000 (UTC)
Date: Mon, 30 Nov 2020 11:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1606735022;
 bh=fJZdrfjxwuw3OqzmH0/FzsGKFmm/d0eGvArhujn5hFE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=YW6f4EUWktV7eN9W+WyRBMttxMLmzfMIkur+eY0ovBdkOR8nJbN499Qfn48GnLZCe
 VGzvDxcpIR6kJThjXcDAzMfRPcyQUSNFILrGCmz+QtIVtvoC/VYeQClCeLIRxtV+pp
 UfF9ECvJ3TBz+Xwl6qoTJWs4F4mbuBJzknRwhEf2QuOqYJ5FBA3b61xs+hMV2Lxliv
 M76rdA11joJlwa94jNydZof+r1ezBIDTin/MkJe4yFTFyVgGsePpLyluTsIXYZ3him
 03LWqZIESScU8sp7M9jqlRTX88yHgvTjy/Kor7YfT6fSUblNUBRSHpcmnVEWaN4G/M
 CdhsNjf5zURDw==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: detect modes during output initialization
Message-ID: <YRhSWPjik2k5GCYf4l8kqw1zY3oERBjpDYT2eNMzDwKMiO3J1qI7U0kj-6OoR0fjWuOndwgIXknXIGauQYHRzohhiefgzvW7EOfFz-hPf2w=@emersion.fr>
In-Reply-To: <20201130131326.7ac87605@eldfell>
References: <d589025b-76b2-1826-1798-60f61000b14a@collabora.com>
 <20201124143947.GP401619@phenom.ffwll.local>
 <9365f1d0-2bb7-d7e8-dad6-62111abadee8@collabora.com>
 <H5TtDGvtYXHmWmVpmi1NyWShzr17yAkVlxZOuKcP-fekJpvYX_Ec7JQtizWk8Xpkaw95TIkTqhzWZER4xwl0mOguSjIQSGLBgGQVMPAejyY=@emersion.fr>
 <20201130131326.7ac87605@eldfell>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, November 30, 2020 12:13 PM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> where is the discussion?

https://dri.freedesktop.org/~cbrill/dri-log/?channel=intel-gfx&date=2020-11-26

> Please record the justitication for that patch in its commit message.
> "Can't" does not explain anything.

Yeah, sorry about that. I'm just annoyed by all of this get_connector
uAPI, so I don't really want to spend a lot of time documenting why
it's so gross.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
