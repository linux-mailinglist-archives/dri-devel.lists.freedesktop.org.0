Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805FE302780
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 17:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EC76E12D;
	Mon, 25 Jan 2021 16:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A326E12D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 16:11:14 +0000 (UTC)
Date: Mon, 25 Jan 2021 16:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1611591072;
 bh=Sn3alBPAz84cU8t6Tl6Dnbn9XfX7qjillso9zMXG3Lk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=aIlJO2OTKXQ6MoHX5pz7RjLX9L+FLHmAEgnVlJIgYO6cOpvIQanNfNhHYYX2MZamV
 eiJ3KaFe21/hhsIU09CBO2SgoQBq/Y8j20RjL2Y/6ono2+D1LB9nONhAlGWKTt6sjq
 WtRJvOeMgJvsu1k9U6MfBJTgC+fzdhJt2csJz1htXZgXb9+TP/mZuHoeJbYPcPAuk8
 sU7NR52OADdWWce0/lrpSOoleGfMdhBBHnQHVHsi2NsTdrhhWPL/5ZMgDBp/MGDCIF
 6gpPGOTOIOz1uUKPF35/2+4r5/Vtf4Wuun/ehri1PODQwjEVwV/xcTjsZSwnCu8GCJ
 OO6EkF9dCtAhQ==
To: Mario Kleiner <mario.kleiner.de@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
Message-ID: <Jjc8KHOHp438eHu0mYwipBkvh2NxEBDDY6A6K5dGbr4di1u8C551_zTx4L0diWTZWYa7KSLQhqHNlaZVP4cmbTYEkKmZ3pQlWt41IPqo_MY=@emersion.fr>
In-Reply-To: <CAEsyxyi2mM=cOT0zRRtm--A=t9p0WsGnpcs=7z7wyoZyHpExTA@mail.gmail.com>
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <86DkveYU9PqmKT4KfDgHvFG_SytoDc4EyfmehALDIJBt7oH3Arn8O97o-pQ3yRU-kfHi-RuwA9zdI-Kz1aZUQBuOSnqmz1GdrRUNPNRsEu4=@emersion.fr>
 <CAEsyxyj-dHAk0qkkpOsycqfpPi_FW5zh_58hs1gi+6h1M_b8-Q@mail.gmail.com>
 <yEq1_Ipkzm_vP4BD6cKlonRVfMbfGXrlvxOG4XDkk_wg1UkPCdLj95I8pknonGjf2Bs1zYeErr1WXerrQjprE3k1vswj3E2Nzq-imF58ytM=@emersion.fr>
 <CAEsyxyhXhJohDYuDDLoQeg-QqhnWQ953GRO0Kf6Puj=f_NkU4w@mail.gmail.com>
 <YA61Aa07PhDucMyG@intel.com>
 <CAEsyxyi2mM=cOT0zRRtm--A=t9p0WsGnpcs=7z7wyoZyHpExTA@mail.gmail.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCBKYW51YXJ5IDI1dGgsIDIwMjEgYXQgNTowOCBQTSwgTWFyaW8gS2xlaW5lciA8
bWFyaW8ua2xlaW5lci5kZUBnbWFpbC5jb20+IHdyb3RlOgoKPsKgSW4gc29tZSB3YXkgaXQgd291
bGQgZXZlbiBiZSBuaWNlIHRvIGhhdmUgYWxsIHRoYXQgaW5mbyBleHBvc2VkIGluCj4gcGFyc2Vk
IGZvcm0gYXMgYSBjb25uZWN0b3IgcHJvcGVydHkgb3Igc3VjaCwgc28gYWxsIGNsaWVudHMgY2Fu
IHVzZQo+IHRoZSBzYW1lIHBhcnNlZCBkYXRhIGluc3RlYWQgb2YgcmVpbnZlbnRpbmcgdGhlIHdo
ZWVsLgoKU28gZmFyIHRoZSBwb2xpY3kgaGFzIG1vcmUgb3IgbGVzcyBiZWVuOiBpZiB0aGUga2Vy
bmVsIGRvZXNuJ3QgbmVlZCB0bwp1bmRlcnN0YW5kIGl0IGFuZCB1c2VyLXNwYWNlIGNhbiBncmFi
IGl0IGZyb20gdGhlIEVESUQsIGRvbid0IGV4cG9zZQppdCBhcyBhIHByb3BlcnR5LiBNYXliZSBh
IHVzZXItc3BhY2UgbGlicmFyeSB3b3VsZCBiZSBiZXR0ZXIgdG8gYXZvaWQKcmVpbnZlbnRpbmcg
dGhlIHdoZWVsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
