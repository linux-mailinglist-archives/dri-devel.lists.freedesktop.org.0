Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D888B5C89D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 07:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072A789B98;
	Tue,  2 Jul 2019 05:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8276189B98
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 05:09:06 +0000 (UTC)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D21DA216C8;
 Tue,  2 Jul 2019 05:09:05 +0000 (UTC)
Date: Mon, 1 Jul 2019 22:09:04 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Shayenne Moura <shayenneluzmoura@gmail.com>
Subject: Reminder: 1 open syzbot bug in drm subsystem
Message-ID: <20190702050904.GB23743@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562044146;
 bh=qD/cPgBzB+Tff1DoDVD2ln4oue0nPLIwH/PxdReN9xo=;
 h=Date:From:To:Cc:Subject:From;
 b=LYNSzhC2SmdfHPSQk0J93Mo7zK4p1VS1/JUUXSW12cD0PkyWKF6A46oEwaWsA4ed7
 W6yV4nPiEoHlEGqC2k6CrLRd+QAe7i8szAIV7M63MyJ+VZzasc8gny9pQg4MGXnEiO
 EdhTbv34J0E/+fRY5P2YzR2S9euCetTUTgqtKK8Q=
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1RoaXMgZW1haWwgd2FzIGdlbmVyYXRlZCBieSBhIHNjcmlwdC4gIExldCBtZSBrbm93IGlmIHlv
dSBoYXZlIGFueSBzdWdnZXN0aW9ucwp0byBtYWtlIGl0IGJldHRlciwgb3IgaWYgeW91IHdhbnQg
aXQgcmUtZ2VuZXJhdGVkIHdpdGggdGhlIGxhdGVzdCBzdGF0dXMuXQoKT2YgdGhlIGN1cnJlbnRs
eSBvcGVuIHN5emJvdCByZXBvcnRzIGFnYWluc3QgdGhlIHVwc3RyZWFtIGtlcm5lbCwgSSd2ZSBt
YW51YWxseQptYXJrZWQgMSBvZiB0aGVtIGFzIHBvc3NpYmx5IGJlaW5nIGEgYnVnIGluIHRoZSBk
cm0gc3Vic3lzdGVtLgoKSWYgeW91IGJlbGlldmUgdGhpcyBidWcgaXMgbm8gbG9uZ2VyIHZhbGlk
LCBwbGVhc2UgY2xvc2UgdGhlIHN5emJvdCByZXBvcnQgYnkKc2VuZGluZyBhICcjc3l6IGZpeCcs
ICcjc3l6IGR1cCcsIG9yICcjc3l6IGludmFsaWQnIGNvbW1hbmQgaW4gcmVwbHkgdG8gdGhlCm9y
aWdpbmFsIHRocmVhZCwgYXMgZXhwbGFpbmVkIGF0IGh0dHBzOi8vZ29vLmdsL3Rwc21FSiNzdGF0
dXMKCklmIHlvdSBiZWxpZXZlIEkgbWlzYXR0cmlidXRlZCB0aGlzIGJ1ZyB0byB0aGUgZHJtIHN1
YnN5c3RlbSwgcGxlYXNlIGxldCBtZQprbm93LCBhbmQgaWYgcG9zc2libGUgZm9yd2FyZCB0aGUg
cmVwb3J0IHRvIHRoZSBjb3JyZWN0IHBlb3BsZSBvciBtYWlsaW5nIGxpc3QuCgpIZXJlIGlzIHRo
ZSBidWc6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpUaXRsZTogICAgICAgICAgICAgIFdBUk5J
TkcgaW4gdmttc192Ymxhbmtfc2ltdWxhdGUKTGFzdCBvY2N1cnJlZDogICAgICAwIGRheXMgYWdv
ClJlcG9ydGVkOiAgICAgICAgICAgMTQwIGRheXMgYWdvCkJyYW5jaGVzOiAgICAgICAgICAgTWFp
bmxpbmUgYW5kIG90aGVycwpEYXNoYm9hcmQgbGluazogICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFw
cHNwb3QuY29tL2J1Zz9pZD0wYmExN2Q3MGQwNjJiMjU5NWUxZjA2MTIzMTQ3NDgwMGYwNzZjN2Ni
Ck9yaWdpbmFsIHRocmVhZDogICAgaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvbGttbC8wMDAwMDAw
MDAwMDAxMWM5MzEwNTgxYTU3OWU4QGdvb2dsZS5jb20vVC8jdQoKVGhpcyBidWcgaGFzIGEgQyBy
ZXByb2R1Y2VyLgoKVGhpcyBidWcgd2FzIGJpc2VjdGVkIHRvOgoKCWNvbW1pdCAwOWVmMDliNGFi
OTVkYzQwNWFkNDE3MWVjMmNkOGE0ZmY1MjI3MTA4CglBdXRob3I6IFNoYXllbm5lIE1vdXJhIDxz
aGF5ZW5uZWx1em1vdXJhQGdtYWlsLmNvbT4KCURhdGU6ICAgV2VkIEZlYiA2IDIwOjA4OjEzIDIw
MTkgKzAwMDAKCgnCoMKgZHJtL3ZrbXM6IFdBUk4gd2hlbiBocnRpbWVyX2ZvcndhcmRfbm93IGZh
aWxzCgpUaGUgb3JpZ2luYWwgdGhyZWFkIGZvciB0aGlzIGJ1ZyByZWNlaXZlZCAxIHJlcGx5LCAx
MTIgZGF5cyBhZ28uCgpJZiB5b3UgZml4IHRoaXMgYnVnLCBwbGVhc2UgYWRkIHRoZSBmb2xsb3dp
bmcgdGFnIHRvIHRoZSBjb21taXQ6CiAgICBSZXBvcnRlZC1ieTogc3l6Ym90KzA4NzFiMTRjYTJl
MmZiNjRmNmUzQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KCklmIHlvdSBzZW5kIGFueSBlbWFp
bCBvciBwYXRjaCBmb3IgdGhpcyBidWcsIHBsZWFzZSBjb25zaWRlciByZXBseWluZyB0byB0aGUK
b3JpZ2luYWwgdGhyZWFkLiAgRm9yIHRoZSBnaXQgc2VuZC1lbWFpbCBjb21tYW5kIHRvIHVzZSwg
b3IgdGlwcyBvbiBob3cgdG8gcmVwbHkKaWYgdGhlIHRocmVhZCBpc24ndCBpbiB5b3VyIG1haWxi
b3gsIHNlZSB0aGUgIlJlcGx5IGluc3RydWN0aW9ucyIgYXQKaHR0cHM6Ly9sa21sLmtlcm5lbC5v
cmcvci8wMDAwMDAwMDAwMDAxMWM5MzEwNTgxYTU3OWU4QGdvb2dsZS5jb20KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
