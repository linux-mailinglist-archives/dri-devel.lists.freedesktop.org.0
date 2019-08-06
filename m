Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C0682EAC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 11:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07E26E345;
	Tue,  6 Aug 2019 09:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 569 seconds by postgrey-1.36 at gabe;
 Tue, 06 Aug 2019 09:29:12 UTC
Received: from mail.h4ck.space (mx.h4ck.space [136.243.22.202])
 by gabe.freedesktop.org (Postfix) with ESMTP id 574CF6E345
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 09:29:12 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a00:e67:1a6:0:e67c:76b0:918a:5b92])
 by mail.h4ck.space (Postfix) with ESMTPSA id 191141C02CA;
 Tue,  6 Aug 2019 09:19:42 +0000 (UTC)
From: andi@dri-devel.l.notmuch.email
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] meson: support for custom nm path
Date: Tue,  6 Aug 2019 11:19:25 +0200
Message-Id: <20190806091925.6558-1-andi@dri-devel.l.notmuch.email>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: =?UTF-8?q?J=C3=B6rg=20Thalheim?= <joerg@thalheim.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSsO2cmcgVGhhbGhlaW0gPGpvZXJnQHRoYWxoZWltLmlvPgoKV2hlbiBjcm9zcy1jb21w
aWxpbmcgdGFyZ2V0IHRvb2xjaGFpbnMgaS5lLiBiaW51dGlscyBhcmUgb2Z0ZW4KcHJlZml4ZWQg
YnkgaXRzIHRhcmdldCBhcmNoaXRlY3R1cmUuIFRoaXMgcGF0Y2ggZ2l2ZXMgdGhlIHVzZXIKdG8g
b3B0aW9uIHRvIHNwZWNpZnkgdGhlIG5tIHVzZWQgZHVyaW5nIHRoZSBidWlsZCBwcm9jZXNzLgoK
U2lnbmVkLW9mZi1ieTogSsO2cmcgVGhhbGhlaW0gPGpvZXJnQHRoYWxoZWltLmlvPgotLS0KIG1l
c29uLmJ1aWxkICAgICAgIHwgMiArLQogbWVzb25fb3B0aW9ucy50eHQgfCA2ICsrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCmluZGV4IGUyOTI1NTRhLi42NDYwNzEzOSAxMDA2
NDQKLS0tIGEvbWVzb24uYnVpbGQKKysrIGIvbWVzb24uYnVpbGQKQEAgLTMyNyw3ICszMjcsNyBA
QCBwa2cuZ2VuZXJhdGUoCiApCiAKIGVudl90ZXN0ID0gZW52aXJvbm1lbnQoKQotZW52X3Rlc3Qu
c2V0KCdOTScsIGZpbmRfcHJvZ3JhbSgnbm0nKS5wYXRoKCkpCitlbnZfdGVzdC5zZXQoJ05NJywg
ZmluZF9wcm9ncmFtKGdldF9vcHRpb24oJ25tLXBhdGgnKSkucGF0aCgpKQogCiBpZiB3aXRoX2xp
YmttcwogICBzdWJkaXIoJ2xpYmttcycpCmRpZmYgLS1naXQgYS9tZXNvbl9vcHRpb25zLnR4dCBi
L21lc29uX29wdGlvbnMudHh0CmluZGV4IDhhZjMzZjFjLi5iNGY0NmE1MiAxMDA2NDQKLS0tIGEv
bWVzb25fb3B0aW9ucy50eHQKKysrIGIvbWVzb25fb3B0aW9ucy50eHQKQEAgLTE0MSwzICsxNDEs
OSBAQCBvcHRpb24oCiAgIHZhbHVlIDogZmFsc2UsCiAgIGRlc2NyaXB0aW9uIDogJ0VuYWJsZSBz
dXBwb3J0IGZvciB1c2luZyB1ZGV2IGluc3RlYWQgb2YgbWtub2QuJywKICkKK29wdGlvbigKKyAg
J25tLXBhdGgnLAorICB0eXBlIDogJ3N0cmluZycsCisgIGRlc2NyaXB0aW9uIDogJ3BhdGggdG8g
bm0nLAorICB2YWx1ZSA6ICdubScKKykKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
