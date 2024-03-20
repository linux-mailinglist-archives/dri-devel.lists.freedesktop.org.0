Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA3B880E61
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 10:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7412D10ECB0;
	Wed, 20 Mar 2024 09:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="QJLx4V+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBEC10ED97
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 09:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1710926049; x=1711185249;
 bh=eKTcP6Db/rwHe7s+4BJ6xvLBQHBQjUltmRgCAiybTyI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=QJLx4V+QVQb0yaTUiqOQGVigSUi7om76HTvSu8V8NvOqbV4aeaqRgdo2M/Clxsb5J
 Hr5w5MOS//9CrM6crGY1Z68IvebQWwUYdQDIvDh/C320tTRiwkBpzkIeZlKgcwH4EB
 /IHxqSP8Wzg9omrEtzsr7nKCXa7ulhkTpIPuVatCJLXP/IyBsQT0IAwFKKtB73jr61
 cu08xx8ummxJCu20d/l4UQQnFQLCkZQ8WHBoUm7BmdFYbcbSpfoV74bEYc5YSFm3LR
 1cYceDKaCcMRWPg6oVlI+0RMFChfNenFtoQ0eZBdCBGkyVYpDigavzrhHLgnfy6jEG
 egVrq0apqecvw==
Date: Wed, 20 Mar 2024 09:13:50 +0000
To: Xaver Hugl <xaver.hugl@kde.org>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: Handling pageflip timeouts
Message-ID: <hXoQYJHpZmGxi0KLeVn40XOhT6PkQ-upmpAYRtdQVvd221bo-N4tkS5TylanYafBD8EC1N-ParxnHG72tn6S2TSN5bN74URkGDR88xHx4jw=@emersion.fr>
In-Reply-To: <CAFZQkGznMXLXOPEOujk6DoY_BJZ1=t9GTCQoxNEvT9ndNa=Kyg@mail.gmail.com>
References: <CAFZQkGznMXLXOPEOujk6DoY_BJZ1=t9GTCQoxNEvT9ndNa=Kyg@mail.gmail.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Note, the kernel already sends synthetic page-flip events when a CRTC goes
from on =E2=86=92 off. I think it would make sense to do the same for all p=
ending
page-flips before the device is destroyed in the kernel.
