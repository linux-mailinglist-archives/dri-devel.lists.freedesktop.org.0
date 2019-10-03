Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23168C98AE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 08:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1550F6E233;
	Thu,  3 Oct 2019 06:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB98E6E233
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 06:55:43 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q1so3125376ion.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 23:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bU7eEWTqDVJAzVoRac0rizP1WsKz1rzNUUO0iZVJmNQ=;
 b=Is29Fe5QshEwCzXQc5tHUAbuWaPx4ecw2u9gbFXmp1GEDz0XQJKpHzBjvLDu6LVWs5
 0aMu00f8UFlRM3F0Dl5nhKnFdEYiiVfPlITawkhwju5GEMDcgsnD1XxXT1g4YWzgCner
 JoBTfDV6EMGOnjAVKNFqpPVjUoDu+6FN2HlEQrAcI87Qc9qg+mJfz14d9YuXmjHAItJz
 jBb8SXzdSDEUzPlK1WOsnHdqtuqBiTWXBU6bJ7K1+zQ90wsRpC/V1pvMBkbeCdfA0WS3
 3ySFxUZxHZaGIbgwLEb4oJopqirMgUm1OFJBsE3qWF3+Ctx7tCTt4XDn9IarW4MFriFK
 Hjqw==
X-Gm-Message-State: APjAAAWXds9HB5tQp0CplbuMbefdZLug0mTN8IRgNZ2AiG1cCJyoOycR
 s+k5Th0biooSMvsFqV433uqmRLS5O/iXmBKgt7lmwg==
X-Google-Smtp-Source: APXvYqw/JqRqbQzudnEFtsSEFiBBZMcwV+TKk69UO/Ob6QYkQJ0sHL6YVsqN1DKW1le5yW1GE5acz24BJ2zaF85Yy5g=
X-Received: by 2002:a5d:89da:: with SMTP id a26mr6650973iot.61.1570085743213; 
 Wed, 02 Oct 2019 23:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-2-jagan@amarulasolutions.com>
 <DB2FB6E5-E4B5-40F4-A05F-9A2303FCA1AE@aosc.io>
In-Reply-To: <DB2FB6E5-E4B5-40F4-A05F-9A2303FCA1AE@aosc.io>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 3 Oct 2019 12:25:32 +0530
Message-ID: <CAMty3ZDZBctSRcgfMTc3moTzrJZXL_S-tKKNKyOa4jUKT8rW+Q@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v11 1/7] drm/sun4i: dsi: Fix TCON DRQ
 set bits
To: Icenowy Zheng <icenowy@aosc.io>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bU7eEWTqDVJAzVoRac0rizP1WsKz1rzNUUO0iZVJmNQ=;
 b=E1EqupMg730dahrp+6/NFq2OamGjeULfhizL/aUqK1IMHs6JmoAZkeUxeqF1uwf+ZL
 eyQt8lAC4bfdpSCJComxGlNEy5LOrSZvqwfEcLDKooentutky+aiizYXAhwx2FYshOvy
 7A+i90ioBBDKtqAGAwHtOaaD7o5I8h+y5zez8=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMywgMjAxOSBhdCAxMjoyMSBQTSBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFv
c2MuaW8+IHdyb3RlOgo+Cj4KPgo+IOS6jiAyMDE55bm0MTDmnIgz5pelIEdNVCswODowMCDkuIvl
jYgyOjQ1OjIxLCBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4g5YaZ5Yiw
Ogo+ID5UaGUgTENEIHRpbWluZyBkZWZpbml0aW9ucyBiZXR3ZWVuIExpbnV4IERSTSB2cyBBbGx3
aW5uZXIgYXJlCj4gPmRpZmZlcmVudCwKPiA+YmVsb3cgZGlhZ3JhbSBzaG93cyB0aGlzIGNsZWFy
IGRpZmZlcmVuY2VzLgo+ID4KPiA+ICAgICAgICAgICBBY3RpdmUgICAgICAgICAgICAgICAgIEZy
b250ICAgICAgICAgICBTeW5jICAgICAgICAgICBCYWNrCj4gPiAgICAgICAgICAgUmVnaW9uICAg
ICAgICAgICAgICAgICBQb3JjaCAgICAgICAgICAgICAgICAgICAgICAgICAgUG9yY2gKPiA+PC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tPjwtLS0tLS0tLS0tLS0tLS0tPjwtLS0tLS0tLS0tLS0tLT48
LS0tLS0tLS0tLS0tLS0+Cj4gPiAgLy8vLy8vLy8vLy8vLy8vLy8vLy8vL3wKPiA+IC8vLy8vLy8v
Ly8vLy8vLy8vLy8vLy8gfAo+ID4vLy8vLy8vLy8vLy8vLy8vLy8vLy8vICB8Li4uLi4uLi4uLi4u
Li4uLi4uCj4gPi4uLi4uLi4uLi4uLi4uLi4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF9fX19fX19fX19fX19fX18KPiA+PC0tLS0tIFtodl1kaXNwbGF5IC0t
LS0tPgo+ID48LS0tLS0tLS0tLS0tLSBbaHZdc3luY19zdGFydCAtLS0tLS0tLS0tLS0+Cj4gPjwt
LS0tLS0tLS0tLS0tLS0tLS0tLS0gW2h2XXN5bmNfZW5kIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0+
Cj4gPjwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSBbaHZddG90YWwKPiA+LS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPgo+ID4KPiA+PC0tLS0tIGxjZF9beHldIC0tLS0tLS0t
PiAgICAgICAgICAgICAgICA8LSBsY2RfW2h2XXNwdyAtPgo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwtLS0tLS0tLS0tIGxjZF9baHZdYnAgLS0tLS0tLS0tPgo+
ID48LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gbGNkX1todl10Cj4gPi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLT4KPiA+Cj4gPlRoZSBEU0kgZHJpdmVyIG1pc2ludGVycHJl
dGVkIHRoZSBoYnAgdGVybSBmcm9tIHRoZSBCU1AgY29kZSB0byByZWZlcgo+ID5vbmx5IHRvIHRo
ZSBiYWNrcG9yY2gsIHdoZW4gaW4gZmFjdCBpdCB3YXMgYmFja3BvcmNoICsgc3luYy4gVGh1cyB0
aGUKPiA+ZHJpdmVyIGluY29ycmVjdGx5IHVzZWQgdGhlIGhvcml6b250YWwgZnJvbnQgcG9yY2gg
cGx1cyBzeW5jIGluIGl0cwo+ID5jYWxjdWxhdGlvbiBvZiB0aGUgRFJRIHNldCBiaXQgdmFsdWUs
IHdoZW4gaXQgc2hvdWxkIG5vdCBoYXZlIGluY2x1ZGVkCj4gPnRoZSBzeW5jIHRpbWluZy4KPiA+
Cj4gPkluY2x1ZGluZyBhZGRpdGlvbmFsIHN5bmMgdGltaW5ncyBsZWFkcyB0byBmbGlwX2RvbmUg
dGltZWQgb3V0IGFzOgo+Cj4gSSBkb24ndCB0aGluayBhdHRhY2hpbmcgdGhpcyBlcnJvciBpbmZv
bWF0aW9uIGlzIHVzZWZ1bCBhdCBhbGwuCgpTaW5jZSB0aGUgZXJyb3Igd291bGQgYmUgY29tbW9u
IGlycmVzcGVjdGl2ZSBvZiBwYW5lbHMgYW5kIGl0IHdvdWxkCnRyaWdnZXIgZnJvbSBkc2kgY29u
dHJvbGxlciwgSSB0aG91Z2h0IHRoaXMgd291bGQgYmUgdXNlZnVsIGZvcgpyZWZlcmVuY2UuIEkg
aGF2ZSBoYWQgdGhpcyBjb252ZXJzYXRpb24gaW4gcHJldmlvdXMgdmVyc2lvbiBjaGFuZ2VzLApz
byBJIGhhdmUgYWRkZWQgaXQuIGxldCBtZSBrbm93IGlmIGhhdmUgYW55IGNvbW1lbnRzLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
