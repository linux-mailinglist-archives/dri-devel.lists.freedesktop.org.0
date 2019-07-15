Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4236990E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 18:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB29D89A88;
	Mon, 15 Jul 2019 16:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A97289A88
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 16:30:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A3A3D8031E;
 Mon, 15 Jul 2019 18:30:02 +0200 (CEST)
Date: Mon, 15 Jul 2019 18:30:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH v1 25/33] drm/scheduler: drop use of drmP.h
Message-ID: <20190715163001.GH27038@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-26-sam@ravnborg.org>
 <c06db8d8-66b8-4738-804f-2dd54f80f426@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c06db8d8-66b8-4738-804f-2dd54f80f426@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=zd2uoN0lAAAA:8 a=-VAfIpHNAAAA:8 a=LpQP-O61AAAA:8 a=pGLkceISAAAA:8
 a=8tHtlLm2SkvdABxeJiUA:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=srlwD-8ojaedGGhPAyx8:22 a=pioyyrs4ZptJ924tMmac:22
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
Cc: David Airlie <airlied@linux.ie>, Sharat Masetty <smasetty@codeaurora.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMTI6MDg6MjZQTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMzAuMDYuMTkgdW0gMDg6MTkgc2NocmllYiBTYW0gUmF2bmJvcmc6Cj4g
PiBEcm9wIHVzZSBvZiB0aGUgZGVwcmVjYXRlZCBkcm1QLmggaGVhZGVyIGZpbGUuCj4gPiBGaXgg
ZmFsbG91dC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiBDYzogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5n
cm9kem92c2t5QGFtZC5jb20+Cj4gPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4gPiBDYzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KPiA+
IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+ID4gQ2M6IEJhcyBOaWV1d2VuaHVp
emVuIDxiYXNAYmFzbmlldXdlbmh1aXplbi5ubD4KPiA+IENjOiBTaGFyYXQgTWFzZXR0eSA8c21h
c2V0dHlAY29kZWF1cm9yYS5vcmc+Cj4gPiBDYzogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFu
Y2VsbG9yQGdtYWlsLmNvbT4KPiA+IENjOiBOYXlhbiBEZXNobXVraCA8bmF5YW4yNmRlc2htdWto
QGdtYWlsLmNvbT4KPiA+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gCj4g
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
ClRoYW5rcywgYXBwbGllZC4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
