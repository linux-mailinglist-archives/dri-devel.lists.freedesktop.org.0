Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B03403734
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 11:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603CF6E165;
	Wed,  8 Sep 2021 09:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480166E165
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 09:44:33 +0000 (UTC)
Date: Wed, 08 Sep 2021 09:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631094270;
 bh=rSk28GkuWh3M5H+W53Ewnx813Q96UwM/xHTjLWSxCC0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=T1te/RgP3nuxt1i2hODI1zxpiU2i886I8ri4pToNu9ZdnJ/b0LyEGBmCzRuovR20f
 QgGiEQdN1IkWfgTagliZRD7ny7cwfhKcsrPnwBqVde/ieBHyZosL+AFDJDhei3YFXX
 jCxQpvnNKqjzILglikyj/OQEmHsK4+D6lc9VvttRxeptb8hl7LeRkIm5W2v7ua5bbg
 yPVvw26zPnjcDHt/KX7eeUzu4r0+C474KqqO3ua+yIAMR3PPrQYgKiPmRzIKocAOSJ
 tfDaCcvOMQ4QcC+Kcb5PWf1w6kej/+f53H09zUQXJ57cykLbMTkYhZo+YGVTi7h3Pq
 lBTYn/Uvk393g==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 Robert Beckett <bob.beckett@collabora.com>
Subject: Re: [PATCH] doc: gpu: Add document describing buffer exchange
Message-ID: <a_9frwKbA7AcZbDet-XMAADdlHbhTczh-d1o5rP2HQkkLXvor5XWt51MDaHvpgo_Sox1e3tt7xmfHlMyAI7Na6wcqcgQIPrbtqAblnM8mQ0=@emersion.fr>
In-Reply-To: <20210908123406.33ced2d6@eldfell>
References: <20210905122742.86029-1-daniels@collabora.com>
 <20210908123406.33ced2d6@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> stride
> =09????

I think what's clear is:

- Per-plane property
- In bytes
- Offset between two consecutive rows

How that applies to weird YUV formats is the tricky question=E2=80=A6

> Btw. there was a fun argument whether the same modifier value could
> mean different things on different devices. There were also arguments
> that a certain modifier could reference additional implicit memory on
> the device - memory that can only be accessed by very specific devices.
>
> I think AMLOGIC_FBC_LAYOUT_SCATTER was one of those.

A recent exmaple of this is [1].

[1]: https://patchwork.freedesktop.org/patch/452461/
