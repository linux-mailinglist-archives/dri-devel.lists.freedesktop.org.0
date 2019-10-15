Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FB2D7BEE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFFC6E862;
	Tue, 15 Oct 2019 16:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4B1892F0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:23:59 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iKNjs-0004il-C4; Tue, 15 Oct 2019 15:23:52 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iKNjs-0004M5-1J; Tue, 15 Oct 2019 15:23:52 +0100
From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Subject: [PATCH] drm/syncobj: include <drm/drm_utils.h> for
 drm_timeout_abs_to_jiffies
Date: Tue, 15 Oct 2019 15:23:48 +0100
Message-Id: <20191015142348.16698-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 "Ben Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jbHVkZSA8ZHJtL2RybV91dGlscy5oPiBmb3IgZHJtX3RpbWVvdXRfYWJzX3RvX2ppZmZpZXMK
ZGVmaW5pdG9uIHRvIGZpeCB0aGUgZm9sbG93aW5nIHNwYXJzZSB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2RybV9zeW5jb2JqLmM6MTAxOToxMzogd2FybmluZzogc3ltYm9sICdkcm1fdGltZW91
dF9hYnNfdG9famlmZmllcycgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8K
ClNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KLS0t
CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
PgpDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpDYzogU2VhbiBQYXVsIDxz
ZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9n
cHUvZHJtL2RybV9zeW5jb2JqLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9zeW5jb2JqLmMKaW5kZXggNGI1YzdiMGVkNzE0Li45ZWMzMzQ2NjNjMmQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fc3luY29iai5jCkBAIC0xMzUsNiArMTM1LDcgQEAKICNpbmNsdWRlIDxkcm0vZHJt
X2dlbS5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3N5
bmNvYmouaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3V0aWxzLmg+CiAKICNpbmNsdWRlICJkcm1faW50
ZXJuYWwuaCIKIAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
