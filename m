Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEBF9B337
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 17:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544456ECC4;
	Fri, 23 Aug 2019 15:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC67B6ECC4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 15:21:01 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1i1BN6-0006I8-18; Fri, 23 Aug 2019 17:21:00 +0200
Message-ID: <1566573659.23587.2.camel@pengutronix.de>
Subject: [GIT PULL] drm/imx: IPUv3 image converter fixes and improvements
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 23 Aug 2019 17:20:59 +0200
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKcGxlYXNlIGNvbnNpZGVyIG1lcmdpbmcgdGhlc2UgaW1hZ2UgY29u
dmVydGVyIGZpeGVzIGZvciB2NS40LCB3aGljaAphdm9pZCBpbWFnZSBkZWdyYWRhdGlvbiBkdWUg
dG8gaW50ZXJtZWRpYXRlIGRvd25zY2FsaW5nIGluIHNvbWUgdGlsZWQKY29udmVyc2lvbnMgYW5k
IGZpeCAxOjEgY29udmVyc2lvbnMgdGhhdCBhcmUgbXVsdGlwbGVzIG9mIHRoZSBoYXJkd2FyZQp0
aWxlIHNpemUuIFRoaXMgYWxzbyBhZGRzIFJHQlggYW5kIEJHUlggZm9ybWF0IHN1cHBvcnQgbm93
IHRoYXQgdGhlc2UKYXJlIGRlZmluZWQgZm9yIFY0TDIsIGFuZCB0aGVyZSBpcyBhIHBhdGNoIHRv
IHJlbW92ZSBhIGxlZnRvdmVyIGxpbmUKZnJvbSB0aGUgTWFrZWZpbGUuCgpyZWdhcmRzClBoaWxp
cHAKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNWY5ZTgzMmMxMzcwNzUwNDVk
MTVjZDY4OTlhYjA1MDVjZmIyY2E0YjoKCiAgTGludXMgNS4zLXJjMSAoMjAxOS0wNy0yMSAxNDow
NTozOCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBn
aXQ6Ly9naXQucGVuZ3V0cm9uaXguZGUvcHphL2xpbnV4LmdpdCB0YWdzL2lteC1kcm0tbmV4dC0y
MDE5LTA4LTIzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNGQyNDM3NjM3MGZiZmM4
NzIzMWQ1NDQzNGE2ODNmMjkxM2FiY2NlNDoKCiAgZ3B1OiBpcHUtdjM6IGltYWdlLWNvbnZlcnQ6
IG9ubHkgc2FtcGxlIGludG8gdGhlIG5leHQgdGlsZSBpZiBuZWNlc3NhcnkgKDIwMTktMDgtMTkg
MTY6MjU6MzAgKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRybS9pbXg6IElQVXYzIGltYWdlIGNvbnZlcnRlciBm
aXhlcyBhbmQgaW1wcm92ZW1lbnRzCgpGaXggaW1hZ2UgY29udmVydGVyIHNlYW0gaGFuZGxpbmcg
Zm9yIDEwMjR4MTAyNCBwaXhlbCBoYXJkd2FyZQpsaW1pdGF0aW9uIGF0IHRoZSBtYWluIHByb2Nl
c3Npbmcgc2VjdGlvbiBpbnB1dCwgaW1wcm92ZSBlcnJvcgpoYW5kbGluZywgYW5kIHNsaWdodGx5
IG9wdGltaXplIGZvciAxOjEgY29udmVyc2lvbnMuCkFkZCBzdXBwb3J0IGZvciBuZXdseSBkZWZp
bmVkIDMyLWJpdCBSR0IgVjRMMiBwaXhlbCBmb3JtYXRzLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpHdWlkbyBHw7xudGhl
ciAoMSk6CiAgICAgIGRybS9pbXg6IERyb3AgdW51c2VkIGlteC1pcHV2My1jcnRjLm8gYnVpbGQK
ClBoaWxpcHAgWmFiZWwgKDkpOgogICAgICBncHU6IGlwdS12MzogZW5hYmxlIHJlbWFpbmluZyAz
Mi1iaXQgUkdCIFY0TDIgcGl4ZWwgZm9ybWF0cwogICAgICBncHU6IGlwdS12MzogaW1hZ2UtY29u
dmVydDogZW5hYmxlIFY0TDJfUElYX0ZNVF9CR1JYMzIgYW5kIF9SR0JYMzIKICAgICAgZ3B1OiBp
cHUtdjM6IGltYWdlLWNvbnZlcnQ6IG1vdmUgb3V0cHV0IHNlYW0gdmFsaWQgaW50ZXJ2YWwgY2Fs
Y3VsYXRpb24gaW50byBmaW5kX2Jlc3Rfc2VhbQogICAgICBncHU6IGlwdS12MzogaW1hZ2UtY29u
dmVydDogZml4IG91dHB1dCBzZWFtIHZhbGlkIGludGVydmFsCiAgICAgIGdwdTogaXB1LXYzOiBp
bWFnZS1jb252ZXJ0OiBsaW1pdCBpbnB1dCBzZWFtIHBvc2l0aW9uIHRvIGhhcmR3YXJlIHJlcXVp
cmVtZW50cwogICAgICBncHU6IGlwdS12MzogaW1hZ2UtY29udmVydDogZml4IGltYWdlIGRvd25z
aXplIGNvZWZmaWNpZW50cyBhbmQgdGlsaW5nIGNhbGN1bGF0aW9uCiAgICAgIGdwdTogaXB1LXYz
OiBpbWFnZS1jb252ZXJ0OiBiYWlsIG9uIGludmFsaWQgdGlsZSBzaXplcwogICAgICBncHU6IGlw
dS12MzogaW1hZ2UtY29udmVydDogbW92ZSB0aWxlIGJ1cnN0IGFsaWdubWVudCBvdXQgb2YgbG9v
cAogICAgICBncHU6IGlwdS12MzogaW1hZ2UtY29udmVydDogb25seSBzYW1wbGUgaW50byB0aGUg
bmV4dCB0aWxlIGlmIG5lY2Vzc2FyeQoKIGRyaXZlcnMvZ3B1L2RybS9pbXgvTWFrZWZpbGUgICAg
ICAgICAgIHwgICAxIC0KIGRyaXZlcnMvZ3B1L2lwdS12My9pcHUtY29tbW9uLmMgICAgICAgIHwg
IDE2ICsrLQogZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1jcG1lbS5jICAgICAgICAgfCAgMjYgKysr
LQogZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1pbWFnZS1jb252ZXJ0LmMgfCAyMzAgKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDE3NyBpbnNlcnRpb25z
KCspLCA5NiBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
