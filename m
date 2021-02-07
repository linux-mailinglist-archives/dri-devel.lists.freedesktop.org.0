Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 863E7312476
	for <lists+dri-devel@lfdr.de>; Sun,  7 Feb 2021 14:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348296E11E;
	Sun,  7 Feb 2021 13:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F216E11E
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Feb 2021 13:02:18 +0000 (UTC)
Date: Sun, 07 Feb 2021 13:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612702936;
 bh=DBVKJjxxXtX1ZvoEUH+R+KQiMwBS89Owh4tS6f2FPXs=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=LqpNKw0eRp7dr6YIgzogwKcpHRCoqLES81Qk7v7aEph7u1PUZ/FEpRHNl8EBelINl
 iQcedVDjprleNswm2693iIWro8MSC884RGo0zSuXHLHyL8bLaYvj3xmdzm7ENSTfrh
 Wylo+T1H5Tui2insnntI9K14+fiqEdy59sjnJYMYFmFFtYcwp3E28qI9/fKnKj41RM
 IERgMoK4RXbemlahLOWDZcGblm/2/qHHABXId823EDx1Uk8mKE4w3lSha4pO7rEU5t
 KWiauut8tXZSlasIgbLVmTU3/ICHaQQ5W6CD0N64fmwpbjg4O364PvzdmPhxoMWVNi
 JYJ01HDY0mWWA==
To: Marcin Raszka <djraszit@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] I was wondering why I can't set the resolution to
 2560x1080,
 while in windows 7 I can without a problem. I looked at the radeon driver code
 and found it doesn't support this resolution. So I made some changes. I added
 the hdmi_mhz parameter. In cmdline I set radeon.hdmi_mhz=190 Only tested on
 the Radeon HD 5830
Message-ID: <eaIUkjPeScDh6sT15RwxrsEfKG73yvqIrfVsRDK9Ey3v2rNZ_e_riEaBomCImXXeHV8XgCBlziwwZIqu0E7tgR7xIqWPVBe4fcdxuSNj1vk=@emersion.fr>
In-Reply-To: <20210207093952.7087-1-djraszit@gmail.com>
References: <20210207093952.7087-1-djraszit@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please keep the commit message short. You probbly want to send this patch
to amd-gfx@lists.freedesktop.org instead of dri-devel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
