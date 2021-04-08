Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5625F357E48
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 10:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7359B6EA2B;
	Thu,  8 Apr 2021 08:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3836EA2B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 08:39:32 +0000 (UTC)
Date: Thu, 08 Apr 2021 08:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1617871170;
 bh=QNYRANgy6Jyvq46NAaL2YFy5FuNyWlqkOZg+ZhqVkV0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ayPsomDvqky4BNYpfgfsRNoR8IO75kp0v8T3xpax2+PM3DaRk2i1aQlguoEuZwnpK
 yvd5gd3fbqrSqLCHwkNrCd9nkBIJCPMc5E/aWVifkQrEswhLgn28lem8B05kZ0N9iC
 /unUe9dIu+OvEkHwVewvPVlKXBmyNb4KVLJ+oDKk4mgzUSbrpiUmcpRX/+7Q7rtVl1
 p9HjpbGtE4MKm+FiUAh9AX5F47FClrsXWXN4jF89toImM47r16F0b1ccvY6diLnx+m
 z0Ss+wZ0eYTgkUPSZrl5QeCzJKA0z/FrI2rXiy55Jh+S1/038/hRfwPCmATEGBR6dF
 MMbkOHPhetQcw==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] drm/doc: emphasize difference between plane formats
 and IN_FORMATS blob
Message-ID: <RW8-e8gSvP1pTckh_2alh-dqd3OR_bdl8e5PYdZVWBL4VnBMh0_ZWEfdlRmoQvzI0lGVH62Fp83MCaPqLZxlCE5pjntUhq-zW0v4-S_4Vos=@emersion.fr>
In-Reply-To: <YG24z2oeHVtzvkXy@intel.com>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
 <20210406192118.12313-3-leandro.ribeiro@collabora.com>
 <YG24z2oeHVtzvkXy@intel.com>
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com,
 dri-devel@lists.freedesktop.org,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCBBcHJpbCA3dGgsIDIwMjEgYXQgMzo1MSBQTSwgVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+ID4gKwkgKiBUbyBmaW5k
IG91dCB0aGUgbGlzdCBvZiBmb3JtYXRzIHRoYXQgc3VwcG9ydCBtb2RpZmllcnMsIHVzZXJzcGFj
ZQo+ID4gKwkgKiBtdXN0IHVzZSB0aGUgcGxhbmUgSU5fRk9STUFUUyBibG9iIHByb3BlcnR5Lgo+
ID4gIAkgKi8KPgo+IEFkZGZiMittb2RpZmllcnMgcHJlZGF0ZXMgdGhlIElOX0ZPUk1BVFMgYmxv
Yiwgc28gdGhpcyBkb2Vzbid0Cj4gbWF0Y2ggcmVhbGl0eS4KClRCSCwgSSdtIGluY2xpbmVkIG5v
dCB0byBjYXJlIGFib3V0IHRoaXMgZWRnZS1jYXNlLiBJdCdzIGFscmVhZHkKY29tcGxpY2F0ZWQg
ZW5vdWdoIGZvciB1c2VyLXNwYWNlIHRvIGZpZ3VyZSBvdXQgd2hhdCdzIHRoZSByaWdodCB0aGlu
Zwp0byBkbyB3aGVuIHN1cHBvcnRpbmcgYm90aCBpbXBsaWNpdCBtb2RpZmllcnMgYW5kIGV4cGxp
Y2l0IG1vZGlmaWVycy4KVXNpbmcgbW9kaWZpZXJzIHdpdGhvdXQgSU5fRk9STUFUUyBpcyByaXNr
eSwgc2luY2UgYSB3aG9sZSBwYXJ0IG9mIHRoZQptb2RpZmllciBuZWdvdGlhdGlvbiBtZWNoYW5p
c20gaXMgbWlzc2luZy4KCk1heWJlIHdlIGNhbiBqdXN0IHN0aWNrIGEgInNpbmNlIGtlcm5lbCB4
LnkueiIgaW4gaGVyZSB0byBhZGRyZXNzIHlvdXIKY29uY2Vybi4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
