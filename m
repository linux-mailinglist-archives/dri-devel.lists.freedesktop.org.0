Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C2886E1
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 01:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63646EF0F;
	Fri,  9 Aug 2019 23:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828BB6EF0F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 23:23:42 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([188.99.127.234]) by mail.gmx.com
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MvsEx-1iCfO92FuB-00srYV for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug
 2019 01:23:38 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v1] meson: fix libdl/shared library support detection
 for nouveau tests
Date: Sat, 10 Aug 2019 01:23:37 +0200
Message-Id: <20190809232337.22307-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:rvWimmy1sKIfjO7qyJPvo2LGOpeMEwZ6nLLcP81GpsJSJozkR8L
 8R5fMgAm94pu0dDVAWLYy+DbPBZa4oDFaf7Gqh9Q/yOvK69NUGDJtxxFwctvnnqX1nNZyJO
 go3ewhZz9QBzGwxC3iHmrZIgTe9IlManeTSWg0adf1AlS3m5D3sOOJXLYswMXTdRO+DKKFe
 4ALyOFmSnZz/z6rkBP34g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ki2xtX8BHHA=:Mwe1Xvo+Kgt/Rqbz3yae0V
 WkGspiOe3JuE0usnMyXkEjXra+WesRWqGwjKdrWNGO7qXTuwKlWKhd3uQbDKi1foiGdDw3hKV
 +/+EH4IHBdNnYm0G4TYnLOSvHsgbGBpGjifw212phxfuwGVZbwWaeDxfZ7e33YFEs/ksWGmZE
 rt3GdkdHgcyE5YWRpsxrgau1hmeaP8ym0UCq+coo3ReTFWeoc4+RaokkpaYU0mhltAxnua0LP
 tMctu4wK9YKQci/Y5+E99hQBNSgPxZQwFcA9iVBC5IqepZifoldQ8d7nmkGCfFDcYd1CmTTw5
 VMh9zVifkdj7j9N9OT+Li2Qzk3aSdybwabDhEnIszmg6OvsjYrIcLqxdw1rlg7GLJPGg7CTo0
 81k5mxexynFVCNqpKKGNt90AV4CmHvNw7CNp1jzR/oX+e6DGuBqLwiGzTBkGX3Ei5wZCdUgd8
 l1EakDfVMj34lq+SzVorDyivYuWCQqEMVya4oQbOllIiZdg2zTWgDsdZtHBEFY4fQiL0e+Vcn
 vAppF+XD1q7OBxslHvuuJVGnmqJhcekrZ3CxKzoxH0Nll/Id1Sp1fRCpR91JYE1aHzVyRtmwW
 yX9t27vIFS/u6SWGsGHaNvZLyDtAGPP/z4fixI0m6PBuh5q1GzvBbUdIaXjefyByqX5qORrE2
 ohRu4eg8Z1cBUTCKMAz6PoENU3dMQc0aEpHFMcfOKxqitN+rJKxslJeAc452y+XFIyi2BBJx/
 q5pnDJtRvfhnf/dv7Fj6k61rYPucz10w2R+/k7fIS8q8j4jTzNzGwLtBYp0yshahe0h6Mwr8j
 hebGWpcvJWXACg/MCeOamdvKwQyjWNBkRKPT6UXur8WOr0wpg3Qad4noKVfaYCaxR8/Fwje51
 7jDtqL5CVAYRxR5ECybSTMo+PiKw79hDg5KqM2QwQzKFtTcGwLAT1q9mMvlCh5b4FjzF8dmj1
 fL5ZT8KpqAeJMWoudZe0/vUOvCHxVinnTXCx11AEM6mv/Pf6p+yjNaYo+vAA1kmnHR/Xh0bVd
 iGmGaBDfQb5dqCQqbImtK0RDQj7Y65qhWYfm5msn6UmzYiWZwSsXcNObHsSvcB1rdIBtnSx2G
 1Pwm6GY1nmvybSNJLibfu6OXO9IDgrVV1tI5mVI9BjbLcx13VP4CfRlgg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1565393018;
 bh=66KW3W48yP5Tp9fWWS7mIVjqvzUh41RPk27R/VZQhU0=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=YCOfviuIsCofCUxAfHnG1eamXy5ECBxYpKknzKQkW+klA877oqRZ84FRXVThpu+1w
 CZB59BDODwTg6vGohxzitrhmSk8HZ63zK/LF9GKX03s50WcM4WUbnuUALTetgXqAZB
 MdFMQmtoJUmRT1h2nq5JzDej30irAsFNwQkDHO2c=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSB0b29sY2hhaW5zIChlLmcuIGJyLWFybS1jb3J0ZXgtbTQtZnVsbCkgcHJvdmlkZSBlbXB0
eSBsaWJkbApsaWJyYXJpZXMuIFRoaXMgZm9vbHMgdGhlIGR5bmFtaWMvc3RhdGljIGRldGVjdGlv
biBmb3IgdGVzdHMvbm91dmVhdSwKc28gZXhwbGljaXQgY2hlY2sgZm9yIGxpYnJhcnkgdHlwZSBp
bnN0ZWFkLgoKRml4ZXM6CgogIC4uL3Rlc3RzL25vdXZlYXUvdGhyZWFkZWQuYzoyNDoxMDogZmF0
YWwgZXJyb3I6IGRsZmNuLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKClNpZ25lZC1vZmYt
Ynk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KLS0tCiBtZXNvbi5idWlsZCAg
ICAgICB8IDEgKwogdGVzdHMvbWVzb24uYnVpbGQgfCA1ICsrKystCiAyIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxk
IGIvbWVzb24uYnVpbGQKaW5kZXggYWRhYWYyMi4uYjc4ZDllNSAxMDA2NDQKLS0tIGEvbWVzb24u
YnVpbGQKKysrIGIvbWVzb24uYnVpbGQKQEAgLTE2OCw2ICsxNjgsNyBAQCBlbmRpZgoKICMgQW1v
bmcgb3RoZXJzIEZyZWVCU0QgZG9lcyBub3QgaGF2ZSBhIHNlcGFyYXRlIGRsIGxpYnJhcnkuCiBp
ZiBub3QgY2MuaGFzX2Z1bmN0aW9uKCdkbHN5bScpCisgICMgZm9vbGVkIGluIGNhc2UgZW1wdHkg
bGliZGwgcHJvdmlkZWQsIGUuZy4gdG9vbGNoYWluIGJyLWFybS1jb3J0ZXgtbTQtZnVsbAogICBk
ZXBfZGwgPSBjYy5maW5kX2xpYnJhcnkoJ2RsJywgcmVxdWlyZWQgOiB3aXRoX25vdXZlYXUpCiBl
bHNlCiAgIGRlcF9kbCA9IFtdCmRpZmYgLS1naXQgYS90ZXN0cy9tZXNvbi5idWlsZCBiL3Rlc3Rz
L21lc29uLmJ1aWxkCmluZGV4IDZjOGRkZDkuLmY3Y2I1ZjAgMTAwNjQ0Ci0tLSBhL3Rlc3RzL21l
c29uLmJ1aWxkCisrKyBiL3Rlc3RzL21lc29uLmJ1aWxkCkBAIC00NCw4ICs0NCwxMSBAQCBlbmRp
ZgogaWYgd2l0aF9ldG5hdml2CiAgIHN1YmRpcignZXRuYXZpdicpCiBlbmRpZgorbGliX3R5cGUg
PSBnZXRfb3B0aW9uKCdkZWZhdWx0X2xpYnJhcnknKQogaWYgd2l0aF9ub3V2ZWF1Ci0gIHN1YmRp
cignbm91dmVhdScpCisgIGlmIGxpYl90eXBlICE9ICdzdGF0aWMnCisgICAgc3ViZGlyKCdub3V2
ZWF1JykKKyAgZW5kaWYKIGVuZGlmCgogZHJtc2wgPSBleGVjdXRhYmxlKAotLQoyLjIyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
