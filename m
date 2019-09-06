Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BABAB31E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7DB6E174;
	Fri,  6 Sep 2019 07:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA3F6E174
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 07:18:48 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id z21so4168976lfe.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 00:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=CMTMu4cP8lqBEnOq+3yeUECTCt8Q5F1tZFVsCniXU+k=;
 b=DDXBwDRatxndp7JZObn6Hako3YzPc8i6qs9PkycKP2pob+cYZdM+XVB8+4EfG4csfY
 9WMJjx9aaBU7qKNNM9wC9I/9JTpVXyWd2b7SPfiBIYY72PjwdOLuL9Rsxc1DPki+N8QW
 wxBGiPdbFJ0NBPSloJ1z1EAx/iag+Kse03yMThcO1oclNIyW82uHAwwcRusOewI4n5lS
 2XIaVZ6cfZJ3/4JbDPuvNyp2TposIUcXJnKsyq5v2mixyCmr7np51mOyXte9FouFevmt
 j8jki7AkZadrKmO4kn4E3LwY3ZEtoInspOhl+KyaIHTWc+bj5G4DRBO37CKsybuJb1NW
 dkKQ==
X-Gm-Message-State: APjAAAUkkon5dBsAJWbKjPOGBRD8XqgTqRvetsAN/9fdcTCTTZNBVziV
 /+s5sKcjCGE4433LjTrdpM1m9MPg6slB/MVxMwk=
X-Google-Smtp-Source: APXvYqxOUF1RH3914HcjSUiThBqloJ8m7nn7h3+HnW6H5vy8XViijHHhIEIAyUEaHmgEoBu+flzQ5ebd18lJgF9Mzi4=
X-Received: by 2002:a19:7715:: with SMTP id s21mr5045709lfc.98.1567754326284; 
 Fri, 06 Sep 2019 00:18:46 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Sep 2019 17:18:34 +1000
Message-ID: <CAPM=9twnS=MQzLZM6sJ5wCtS5reFqd7715DtceP-6+=h2JoKLg@mail.gmail.com>
Subject: [git pull] drm fixes for 5.3-rc8 (or final)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=CMTMu4cP8lqBEnOq+3yeUECTCt8Q5F1tZFVsCniXU+k=;
 b=TQMP5Ag5MmlfO77ESC5/eimx3Un9coIWQbCLG9MB2wN1F4LG0lllG/BTlzullTR10e
 E2HZYXEfIEzrYg1I8gpfSCgKkTUW9n4mzps1lL9rMjkDYsEhIacgFsEMZaffZj3wAau7
 GCHYmytQyhIaf/ddDUDgJXpcHGDki6E0OtERzBDiirjZ/fGc9wjDkKU7VHnOlG0Vy+qN
 3mbpSq4yr6F4EUqCarBkPEWMQuahQd7AlXQq3UEg6B9v1hfEu5bZ8NzLB909HjklRMa0
 cCrUAidFW5OKY1gaUjX2BTjppnDXPfzIoRl8dI1OuxAcF//CzB6PFY1S9rUkZLFrDC92
 fc6w==
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IExpbnVzLAoKTGl2ZSBmcm9tIG15IGZyaWVuZCdzIGNvdWNoIGluIEJhcmNlbG9uYS4gTGF0
ZXN0IHJvdW5kIG9mIGRybSBmaXhlcywKdGhlIGNvbW1hbmQgbGluZSBwYXJzZXIgcmVncmVzc2lv
biBmaXhlcyBsb29rIGEgYml0IGxhcmdlciBiZWNhdXNlCnRoZXkgY29tZSB3aXRoIHNlbGZ0ZXN0
cyBpbmNsdWRlZCBmb3IgdGhlIGJ1Z3MgdGhleSBmaXguIE90aGVyd2lzZSBhCnNpbmdsZSBub3V2
ZWF1LCBzaW5nbGUgaW5nZW5pYyBhbmQgc2luZ2xlIHZtd2dmeCBmaXguCgpEYXZlLgoKZHJtLWZp
eGVzLTIwMTktMDktMDY6CmRybSBmaXhlcyBmb3IgNS4zLXJjOCAob3IgZmluYWwpCgpub3V2ZWF1
OgotIGFkZCBtaXNzaW5nIE1PRFVMRV9GSVJNV0FSRSBkZWZpbml0aW9ucwoKaWdlbmljOgotIGhh
cmRjb2RlIHBhbmVsIHR5cGUgRFBJCgp2bXdnZng6Ci0gZG91YmxlIGZyZWUgZml4Cgpjb3JlOgot
IGNvbW1hbmQgbGluZSBtb2RlIHBhcnNlciBmaXhlcwpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2lu
Y2UgY29tbWl0IDA4OWNmN2Y2ZWNiMjY2YjZhNDE2NDkxOWEyZTY5YmQyZjkzODM3NGE6CgogIExp
bnV4IDUuMy1yYzcgKDIwMTktMDktMDIgMDk6NTc6NDAgLTA3MDApCgphcmUgYXZhaWxhYmxlIGlu
IHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcv
ZHJtL2RybSB0YWdzL2RybS1maXhlcy0yMDE5LTA5LTA2Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5n
ZXMgdXAgdG8gMWUxOWVjNmMzYzQxN2EwODkzZmNmYWU3YWJmYmE2MjNlNzgxZDg3NjoKCiAgTWVy
Z2UgdGFnICdkcm0tbWlzYy1maXhlcy0yMDE5LTA5LTA1JyBvZgpnaXQ6Ly9hbm9uZ2l0LmZyZWVk
ZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MgaW50byBkcm0tZml4ZXMgKDIwMTktMDktMDYKMTY6Mjc6
NDYgKzEwMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCmRybSBmaXhlcyBmb3IgNS4zLXJjOCAob3IgZmluYWwpCgpub3V2
ZWF1OgotIGFkZCBtaXNzaW5nIE1PRFVMRV9GSVJNV0FSRSBkZWZpbml0aW9ucwoKaWdlbmljOgot
IGhhcmRjb2RlIHBhbmVsIHR5cGUgRFBJCgp2bXdnZng6Ci0gZG91YmxlIGZyZWUgZml4Cgpjb3Jl
OgotIGNvbW1hbmQgbGluZSBtb2RlIHBhcnNlciBmaXhlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpCZW4gU2tlZ2dzICgx
KToKICAgICAgZHJtL25vdXZlYXUvc2VjMi9ncDEwMjogYWRkIG1pc3NpbmcgTU9EVUxFX0ZJUk1X
QVJFcwoKRGFuIENhcnBlbnRlciAoMSk6CiAgICAgIGRybS92bXdnZng6IEZpeCBkb3VibGUgZnJl
ZSBpbiB2bXdfcmVjdl9tc2coKQoKRGF2ZSBBaXJsaWUgKDMpOgogICAgICBNZXJnZSBicmFuY2gg
J2xpbnV4LTUuMycgb2YgZ2l0Oi8vZ2l0aHViLmNvbS9za2VnZ3NiL2xpbnV4IGludG8gZHJtLWZp
eGVzCiAgICAgIE1lcmdlIGJyYW5jaCAndm13Z2Z4LWZpeGVzLTUuMycgb2YKZ2l0Oi8vcGVvcGxl
LmZyZWVkZXNrdG9wLm9yZy9+dGhvbWFzaC9saW51eCBpbnRvIGRybS1maXhlcwogICAgICBNZXJn
ZSB0YWcgJ2RybS1taXNjLWZpeGVzLTIwMTktMDktMDUnIG9mCmdpdDovL2Fub25naXQuZnJlZWRl
c2t0b3Aub3JnL2RybS9kcm0tbWlzYyBpbnRvIGRybS1maXhlcwoKTGF1cmVudCBQaW5jaGFydCAo
MSk6CiAgICAgIGRybS9pbmdlbmljOiBIYXJkY29kZSBwYW5lbCB0eXBlIHRvIERQSQoKTWF4aW1l
IFJpcGFyZCAoNCk6CiAgICAgIGRybS9tb2RlczogQWRkIGEgc3dpdGNoIHRvIGRpZmZlcmVudGlh
dGUgZnJlZSBzdGFuZGluZyBvcHRpb25zCiAgICAgIGRybS9tb2RlczogRml4IHRoZSBjb21tYW5k
IGxpbmUgcGFyc2VyIHRvIHRha2UgZm9yY2Ugb3B0aW9ucyBpbnRvIGFjY291bnQKICAgICAgZHJt
L21vZGVzOiBJbnRyb2R1Y2UgYSB3aGl0ZWxpc3QgZm9yIHRoZSBuYW1lZCBtb2RlcwogICAgICBk
cm0vc2VsZnRlc3RzOiBtb2RlczogQWRkIG1vcmUgdW5pdCB0ZXN0cyBmb3IgdGhlIGNtZGxpbmUg
cGFyc2VyCgogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgNTQgKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5j
ICAgICAgICAgICAgICB8ICAgNSArLQogLi4uL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9z
ZWNib290L2dwMTAyLmMgICAgfCAgMTIgKysKIGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvZHJt
X2NtZGxpbmVfc2VsZnRlc3RzLmggIHwgICA3ICsrCiAuLi4vZ3B1L2RybS9zZWxmdGVzdHMvdGVz
dC1kcm1fY21kbGluZV9wYXJzZXIuYyAgICB8IDEzMCArKysrKysrKysrKysrKysrKysrKysKIGRy
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5jICAgICAgICAgICAgICAgIHwgICA4ICst
CiA2IGZpbGVzIGNoYW5nZWQsIDIwMiBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
