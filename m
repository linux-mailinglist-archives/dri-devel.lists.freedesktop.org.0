Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85086E9476
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 02:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F076E865;
	Wed, 30 Oct 2019 01:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024A56E865
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 01:11:17 +0000 (UTC)
Received: from capuchin.riseup.net (capuchin-pn.riseup.net [10.0.1.176])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 472r3n10czzFcJB;
 Tue, 29 Oct 2019 18:10:29 -0700 (PDT)
X-Riseup-User-ID: 933637BF2E7D017EA4A2906B15B24361C5666363174E02422C90E521559AC9F2
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by capuchin.riseup.net (Postfix) with ESMTPSA id 472r3k5hZWz8sc8;
 Tue, 29 Oct 2019 18:10:26 -0700 (PDT)
From: Leandro Ribeiro <leandrohr@riseup.net>
To: dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
 lkcamp@lists.libreplanetbr.org
Subject: [PATCH] drm/doc: Update IGT documentation
Date: Tue, 29 Oct 2019 22:12:11 -0300
Message-Id: <20191030011211.47942-1-leandrohr@riseup.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=riseup.net; s=squak; 
 t=1572397877; bh=gBJR6T6YqbSmxXHokDGY8foxTQohteoAmKPEP43fU0I=;
 h=From:To:Cc:Subject:Date:From;
 b=iQh1NTRpbAy/wMamrrXEDmHKMP9AbDlYpHFmOpxxEFDJQ5S9T0IDZQEQhw/oxTHFe
 8uLe6mIkOhwZdBHxHwjyu+JA8RT5eiFJvXr5/O1nezdd02mqlu+HATa1YbsLjx0Qtp
 ebza/INyXfv3gaJNQwI84kQtXrygXHnZ650v+u9U=
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
Cc: Leandro Ribeiro <leandrohr@riseup.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIElHVCBkb2N1bWVudGF0aW9uIGluIHRoaXMgcGFnZSBpcyB0ZWxsaW5nIHVzIHRvIGJ1aWxk
IGl0IHVzaW5nCm1ha2UuIEFjY29yZGluZyB0byBjb21taXQgNjc5OTNjMSAoImF1dG9tYWtlOiBQ
b2ludCBidWlsZGVycyBhdAptZXNvbiIpIGZyb20gdGhlIElHVCBwcm9qZWN0LCB0aGlzIGlzIGRl
cHJlY2F0ZWQgYW5kIElHVCBzaG91bGQgYmUKYnVpbHQgd2l0aCBtZXNvbi4gSW5zdGVhZCBvZiBo
YXZpbmcgYSBkb2N1bWVudGF0aW9uIGZvciBJR1QgaW4gdGhpcwpwYWdlLCBwb2ludCB0byB0aGVp
ciBHaXRMYWIgUkVBRE1FLCB3aGljaCBzaG91bGQgYWx3YXlzIGJlIHVwIHRvCmRhdGUuCgpTaWdu
ZWQtb2ZmLWJ5OiBMZWFuZHJvIFJpYmVpcm8gPGxlYW5kcm9ockByaXNldXAubmV0PgotLS0KIERv
Y3VtZW50YXRpb24vZ3B1L2RybS11YXBpLnJzdCB8IDMyICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QgYi9Eb2N1bWVu
dGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QKaW5kZXggOTRmOTA1MjFmNThjLi45OTZmNzM1NGUwNWMg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS11YXBpLnJzdAorKysgYi9Eb2N1bWVu
dGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QKQEAgLTI1NCwzNiArMjU0LDggQEAgVmFsaWRhdGluZyBj
aGFuZ2VzIHdpdGggSUdUCiBUaGVyZSdzIGEgY29sbGVjdGlvbiBvZiB0ZXN0cyB0aGF0IGFpbXMg
dG8gY292ZXIgdGhlIHdob2xlIGZ1bmN0aW9uYWxpdHkgb2YKIERSTSBkcml2ZXJzIGFuZCB0aGF0
IGNhbiBiZSB1c2VkIHRvIGNoZWNrIHRoYXQgY2hhbmdlcyB0byBEUk0gZHJpdmVycyBvciB0aGUK
IGNvcmUgZG9uJ3QgcmVncmVzcyBleGlzdGluZyBmdW5jdGlvbmFsaXR5LiBUaGlzIHRlc3Qgc3Vp
dGUgaXMgY2FsbGVkIElHVCBhbmQKLWl0cyBjb2RlIGNhbiBiZSBmb3VuZCBpbiBodHRwczovL2Nn
aXQuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLy4KLQotVG8gYnVpbGQgSUdULCBz
dGFydCBieSBpbnN0YWxsaW5nIGl0cyBidWlsZCBkZXBlbmRlbmNpZXMuIEluIERlYmlhbi1iYXNl
ZAotc3lzdGVtczo6Ci0KLQkjIGFwdC1nZXQgYnVpbGQtZGVwIGludGVsLWdwdS10b29scwotCi1B
bmQgaW4gRmVkb3JhLWJhc2VkIHN5c3RlbXM6OgotCi0JIyBkbmYgYnVpbGRkZXAgaW50ZWwtZ3B1
LXRvb2xzCi0KLVRoZW4gY2xvbmUgdGhlIHJlcG9zaXRvcnk6OgotCi0JJCBnaXQgY2xvbmUgZ2l0
Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMKLQotQ29uZmlndXJl
IHRoZSBidWlsZCBzeXN0ZW0gYW5kIHN0YXJ0IHRoZSBidWlsZDo6Ci0KLQkkIGNkIGlndC1ncHUt
dG9vbHMgJiYgLi9hdXRvZ2VuLnNoICYmIG1ha2UgLWo2Ci0KLURvd25sb2FkIHRoZSBwaWdsaXQg
ZGVwZW5kZW5jeTo6Ci0KLQkkIC4vc2NyaXB0cy9ydW4tdGVzdHMuc2ggLWQKLQotQW5kIHJ1biB0
aGUgdGVzdHM6OgotCi0JJCAuL3NjcmlwdHMvcnVuLXRlc3RzLnNoIC10IGttcyAtdCBjb3JlIC1z
Ci0KLXJ1bi10ZXN0cy5zaCBpcyBhIHdyYXBwZXIgYXJvdW5kIHBpZ2xpdCB0aGF0IHdpbGwgZXhl
Y3V0ZSB0aGUgdGVzdHMgbWF0Y2hpbmcKLXRoZSAtdCBvcHRpb25zLiBBIHJlcG9ydCBpbiBIVE1M
IGZvcm1hdCB3aWxsIGJlIGF2YWlsYWJsZSBpbgotLi9yZXN1bHRzL2h0bWwvaW5kZXguaHRtbC4g
UmVzdWx0cyBjYW4gYmUgY29tcGFyZWQgd2l0aCBwaWdsaXQuCitpdHMgY29kZSBhbmQgaW5zdHJ1
Y3Rpb25zIHRvIGJ1aWxkIGFuZCBydW4gY2FuIGJlIGZvdW5kIGluCitodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMvLgogCiBEaXNwbGF5IENSQyBTdXBwb3J0
CiAtLS0tLS0tLS0tLS0tLS0tLS0tCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
