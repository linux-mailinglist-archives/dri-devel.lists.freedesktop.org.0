Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B488DF12DD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 10:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A766EC92;
	Wed,  6 Nov 2019 09:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA7A6EC91
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 09:51:24 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 47D3D3B5697
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 09:44:32 +0000 (UTC)
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id B2577240015;
 Wed,  6 Nov 2019 09:44:07 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/gma500: Add page flip support on psb/cdv
Date: Wed,  6 Nov 2019 10:43:58 +0100
Message-Id: <20191106094400.445834-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
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
Cc: David Airlie <airlied@linux.ie>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYnJpbmdzLWluIHRoZSByZXF1aXJlZCBiaXRzIHRvIGltcGxlbWVudCBwYWdl
IGZsaXAgc3VwcG9ydApvbiBwb3Vsc2JvIGFuZCBjZWRhcnRyYWlsLiBQYWdlIGZsaXAgc3VwcG9y
dCBpcyByZXF1aXJlZCB0byBydW4gd2VzdG9uCndpdGggdGhlIEdNQTUwMCBkcml2ZXIuCgpUaGlz
IGlzIG9ubHkgbGVnYWN5IHBhZ2UgZmxpcCBzdXBwb3J0LCBub3QgYSBjb252ZXJzaW9uIG9mIHRo
ZSBkcml2ZXIgdG8KYXRvbWljIERSTS4KClBhdWwgS29jaWFsa293c2tpICgyKToKICBkcm0vZ21h
NTAwOiBBZGQgbWlzc2luZyBjYWxsIHRvIGFsbG93IGVuYWJsaW5nIHZibGFuayBvbiBwc2IvY2R2
CiAgZHJtL2dtYTUwMDogQWRkIHBhZ2UgZmxpcCBzdXBwb3J0IG9uIHBzYi9jZHYKCiBkcml2ZXJz
L2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9kaXNwbGF5LmMgfCAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vZ21hNTAwL2dtYV9kaXNwbGF5LmMgICAgICAgfCA0OCArKysrKysrKysrKysrKysrKysrKysr
CiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2dtYV9kaXNwbGF5LmggICAgICAgfCAgNiArKysKIGRy
aXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX2Rpc3BsYXkuYyB8ICAxICsKIGRyaXZlcnMv
Z3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX2Rydi5oICAgICB8ICAzICsrCiBkcml2ZXJzL2dwdS9k
cm0vZ21hNTAwL3BzYl9pcnEuYyAgICAgICAgICAgfCAxOCArKysrKystLQogNiBmaWxlcyBjaGFu
Z2VkLCA3NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
