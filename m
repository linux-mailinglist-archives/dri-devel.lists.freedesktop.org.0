Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFBCF601C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2019 16:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED096E398;
	Sat,  9 Nov 2019 15:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BA06E398;
 Sat,  9 Nov 2019 15:49:24 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iTSzK-00027O-63; Sat, 09 Nov 2019 15:49:22 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Charlene Liu <Charlene.Liu@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: remove duplicated comparison expression
Date: Sat,  9 Nov 2019 15:49:21 +0000
Message-Id: <20191109154921.223093-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGlz
IGNvbXBhcmlzb24gZXhwcmVzc2lvbiB0aGF0IGlzIGR1cGxpY2F0ZWQgYW5kIGhlbmNlIG9uZQpv
ZiB0aGUgZXhwcmVzc2lvbnMgY2FuIGJlIHJlbW92ZWQuICBSZW1vdmUgaXQuCgpBZGRyZXNzZXMt
Q292ZXJpdHk6ICgiU2FtZSBvbiBib3RoIHNpZGVzIikKRml4ZXM6IDEyZTJiMmQ0YzY1ZiAoImRy
bS9hbWQvZGlzcGxheTogYWRkIGRjYyBwcm9ncmFtbWluZyBmb3IgZHVhbCBwbGFuZSIpClNpZ25l
ZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyB8IDEgLQogMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGMuYwppbmRleCAxZmRiYTEzYjNkMGYuLjFmYTI1NWUwNzdkMCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCkBAIC0xNDkxLDcgKzE0OTEsNiBAQCBzdGF0aWMgZW51
bSBzdXJmYWNlX3VwZGF0ZV90eXBlIGdldF9wbGFuZV9pbmZvX3VwZGF0ZV90eXBlKGNvbnN0IHN0
cnVjdCBkY19zdXJmYQogCX0KIAogCWlmICh1LT5wbGFuZV9pbmZvLT5wbGFuZV9zaXplLnN1cmZh
Y2VfcGl0Y2ggIT0gdS0+c3VyZmFjZS0+cGxhbmVfc2l6ZS5zdXJmYWNlX3BpdGNoCi0JCQl8fCB1
LT5wbGFuZV9pbmZvLT5wbGFuZV9zaXplLnN1cmZhY2VfcGl0Y2ggIT0gdS0+c3VyZmFjZS0+cGxh
bmVfc2l6ZS5zdXJmYWNlX3BpdGNoCiAJCQl8fCB1LT5wbGFuZV9pbmZvLT5wbGFuZV9zaXplLmNo
cm9tYV9waXRjaCAhPSB1LT5zdXJmYWNlLT5wbGFuZV9zaXplLmNocm9tYV9waXRjaCkgewogCQl1
cGRhdGVfZmxhZ3MtPmJpdHMucGxhbmVfc2l6ZV9jaGFuZ2UgPSAxOwogCQllbGV2YXRlX3VwZGF0
ZV90eXBlKCZ1cGRhdGVfdHlwZSwgVVBEQVRFX1RZUEVfTUVEKTsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
