Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4158536D301
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 09:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AAE6EAAE;
	Wed, 28 Apr 2021 07:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462896EAA6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 07:21:50 +0000 (UTC)
Date: Wed, 28 Apr 2021 07:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1619594507;
 bh=QPLjVaL3QgSoUGQWgZwHZ5lWzVi7SS8ddFZifJ96XQo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=GOACvLDSp4FGKPUbuTWyP5Q3oaMwjKC4Zu9kdFpbAiacNq0yBs/3xjBaARXd4v/Az
 S4vSKtd5/Ijq05ltu1wa0ex/MFbu51dA/shGvyLxXTYwxF13psY6F4NmPNipPkmRqx
 +VDXkTbUDzIUgNbOjnNEMLiJXa5eU2TPOD8ebhZq//1ao62CIk1rYptv4RRvkMd3e0
 6SDETFG4GjpKopUieCfHkW6VT96p0EpaugladeWfV/ThJ0sx6NJpICBh35HoD/lLRD
 42WspH07mrgJQ1mrWvu42OkaXZ2pW6T9NAcJcJU4GCeRON2g0x/XctnxSY7h/9AHuO
 002laiFA2VcLA==
To: Caleb Connolly <caleb@connolly.tech>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Display notch support
Message-ID: <ck2MR5NpcE5l0NZuJnX7O7DLXBGxiFr_1LCqlDlsC0GNC3PEtTEcx1-vfIp8ZLyMhfxmv4_MyGaYBjZBawdTaWzButF0qkbdc-9EYhVFZYk=@emersion.fr>
In-Reply-To: <f8747f99-0695-5be0-841f-4f72ba5d5da3@connolly.tech>
References: <f8747f99-0695-5be0-841f-4f72ba5d5da3@connolly.tech>
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
Cc: martijn@brixit.nl, dri-devel@lists.freedesktop.org,
 dri-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> A solution to make this configuration generic and exposed by the kernel
> would standardise this across Linux

Having a KMS property for this makes sense to me.

Chatting with Jani on IRC, it doesn't seem like there's any EDID or
DisplayID block for this.

Note, Android exposes a data structure [1] with:

- Margin of the cut-out for each edge of the screen
- One rectangle per edge describing the cut-out region
- Size of the curved area for each edge of a waterfall display

I haven't found anything describing the rounded corners of the display.

[1]: https://developer.android.com/reference/android/view/DisplayCutout
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
