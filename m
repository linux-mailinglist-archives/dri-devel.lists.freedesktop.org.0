Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE2712A3F
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 11:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FA6895B6;
	Fri,  3 May 2019 09:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA5E8982A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 09:10:46 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hMUDM-0005Jb-5Q; Fri, 03 May 2019 11:10:44 +0200
Message-ID: <1556874643.2590.15.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next for 5.2
From: Lucas Stach <l.stach@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 03 May 2019 11:10:43 +0200
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLCBoaSBEYXZlLAoKdGhpbmdzIGFyZSBzdGlsbCBzbG93IGluIGV0bmF2aXYgbGFu
ZCwgc28gd2UgZG9uJ3QgaGF2ZSBhbnl0aGluZyBtYWpvcgp0byBkZXN0YWdlLiBKdXN0IGEgY291
cGxlIG9mIG5vbi1jcml0aWNhbCBmaXhlcyB0aGF0IEkgd2FudCB0byBsYW5kIGluCjUuMi4KClJl
Z2FyZHMsCkx1Y2FzCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDllOThjNjc4
YzJkNmFlM2ExN2NiMmRlNTVkMTdmNjlkZGRhYTIzMWI6CgogIExpbnV4IDUuMS1yYzEgKDIwMTkt
MDMtMTcgMTQ6MjI6MjYgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoKCiAgaHR0cHM6Ly9naXQucGVuZ3V0cm9uaXguZGUvZ2l0L2xzdC9saW51eCBldG5hdml2
L25leHQKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAyYjc2ZjViZTdjMjc3OGVlMmY2
YmFjZGRjMTkyNDhmNmE0YTQ2N2EwOgoKICBkcm0vZXRuYXZpdjogaW5pdGlhbGl6ZSBpZGxlIG1h
c2sgYmVmb3JlIHF1ZXJ5aW5nIHRoZSBIVyBkYiAoMjAxOS0wNS0wMyAxMDo0MTowNCArMDIwMCkK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KTHVjYXMgU3RhY2ggKDIpOgogICAgICBkcm0vZXRuYXZpdjogY2xlYW4gdXAgZXRu
YXZpdl9nZW1fbmV3X2hhbmRsZQogICAgICBkcm0vZXRuYXZpdjogaW5pdGlhbGl6ZSBpZGxlIG1h
c2sgYmVmb3JlIHF1ZXJ5aW5nIHRoZSBIVyBkYgoKUnVzc2VsbCBLaW5nICgxKToKICAgICAgZHJt
OiBldG5hdml2OiBhdm9pZCBETUEgQVBJIHdhcm5pbmcgd2hlbiBpbXBvcnRpbmcgYnVmZmVycwoK
IGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmMgfCAgNSArKysrKwogZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuaCB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9l
dG5hdml2L2V0bmF2aXZfZ2VtLmMgfCAyNCArKysrKysrKystLS0tLS0tLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMgfCAgNiArKy0tLS0KIDQgZmlsZXMgY2hh
bmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
