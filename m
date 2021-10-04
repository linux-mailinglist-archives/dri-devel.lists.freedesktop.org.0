Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 896FB42083A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 11:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05236E99D;
	Mon,  4 Oct 2021 09:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198C16E995
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 09:26:41 +0000 (UTC)
Date: Mon, 04 Oct 2021 09:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1633339598;
 bh=qI9CT3Auo8F6SPJI2o9uF73GR43QjVzpBV/n1cElnr0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=MUvuW1cl+UCQu7X0lggMKWrUbrtKB8kZq4bsAwNvyZCVNhW30HWV5p81eP1TZjp61
 ZuczBjWwIQPt/HjIN6lk2TXTKNZgiJdfG5NQ6qIlK/O84KH4h1uelYVjCEctHdYQKD
 fulEjhSlbE9qggiQesxnIb/E5FZ6QPRhol3UjtKalr8vOgnw7tJe7ojmj6v5uE5BAG
 8EgYKjgZJYvKJwL1wIpqIT6npbs0NUnjvfXm85A1XeMfZMX5bxBDn+d/PBTM3aKwV8
 Ir4/gPERbtOngNs41nBoy7EZz9IWUC4egzufHNeazBwKVE7sZ6eofZ7huZwlbh8qo9
 3l1r4QLjKZzGA==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, Daniel Vetter <daniel@ffwll.ch>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/connector: refer to CTA-861-G in the "content type"
 prop docs
Message-ID: <GxF8v55OzTvCCEXYAM9xPxVNxcb6DOsEG7hJRTlL3Zb_LsEW0CIvOajhn8bKQX2rZfC9cxYbXd0hg2RyIayYuwjsu7L2pLDJM5itUZ0xp1Q=@emersion.fr>
In-Reply-To: <YVrHyUJPQg731vub@intel.com>
References: <20211004091236.82010-1-contact@emersion.fr>
 <YVrHyUJPQg731vub@intel.com>
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

On Monday, October 4th, 2021 at 11:22, Ville Syrj=C3=A4l=C3=A4 <ville.syrja=
la@linux.intel.com> wrote:

> A bit annoying to have to refer to an external spec, but copy pasting
> the whole thing here seems a bit questionable.

Yeah, I'm mostly worried about copyright. We could also invent our own
descriptions (Is that even possible without infringing copyright? The
person inventing the new descriptions needs to read the original spec
to know what to write=E2=80=A6), but I think referring to the original spec=
 is
desirable regardless.
