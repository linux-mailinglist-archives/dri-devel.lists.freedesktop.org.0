Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69B64ABBCE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 12:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E647D10F92C;
	Mon,  7 Feb 2022 11:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E6A10F92C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 11:43:14 +0000 (UTC)
Date: Mon, 07 Feb 2022 11:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1644234192;
 bh=T7O0rwrvjulJ6fWHFE8v6KHt2S6u1DxGJhx2B0hnbwI=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=CACVbJYmt20k9rOvFLpxgw9k8LGHDtkLl5KZ4UGyr4lj9nptVuIpznprZsh148JxP
 nk3gA9qUVU+N0E3TpBF9fvwoj2uc98cj8BDJXVB61mHPHUCdipY26nSxGzJIiPOIon
 lexIEtmRjC5qCtoxEhxnZQULy4wZWlXWh0mxNnw31aESQoaUhWd/BzXZbUkNYUtCPA
 MZN22p2YCnnaFzi1MN/YOjmcG3InrujS5454NOMjsg9mtEIrleFv1QkSDDv8ZHQfty
 NVc2frzz6Pq7GCR0StCoLzSyjQ4/MQTSsaYv1Vg0vyVXdVIKYBLxJzL5iLX1jCKnQZ
 Yf5slZVLiQzDA==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/privacy-screen: Fix sphinx warning
Message-ID: <oW_YQ9nS3nPTTNYd8OplqMpLezdIzohS4_PcYz5aI1bmv4SKcKRGNvqgJ9yJQWehrNgWWBxLhnzICHPylEc0yXIbVcQCuOdTTvVeKqUtGuU=@emersion.fr>
In-Reply-To: <20220126151105.494521-1-hdegoede@redhat.com>
References: <20220126151105.494521-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=3.4.4
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, January 26th, 2022 at 16:11, Hans de Goede <hdegoede@redhat.c=
om> wrote:

> - * A pointer to the drm_privacy_screen's struct is passed as the void *d=
ata
> + * A pointer to the drm_privacy_screen's struct is passed as the void \*=
data

Maybe we can use @data here instead? It's used to refer to arguments or str=
uct
members.

Alternatively, use double backquotes to format it as inline code blocks:

   ``void *data``
