Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA67998F76
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 11:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF186EAD3;
	Thu, 22 Aug 2019 09:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D915C6EAD3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 09:36:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 56312307D921;
 Thu, 22 Aug 2019 09:36:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5C505C21A;
 Thu, 22 Aug 2019 09:36:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1A98411AAF; Thu, 22 Aug 2019 11:36:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] udmabuf: misc tweaks.
Date: Thu, 22 Aug 2019 11:36:51 +0200
Message-Id: <20190822093654.23752-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 22 Aug 2019 09:36:57 +0000 (UTC)
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
Cc: laurent.pinchart@ideasonboard.com, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBub3RpY2VkIGEgYnVuY2ggb2YgdWRtYWJ1ZiB0d2Vha3MgKGFkZCBkb2N1bWVudGF0aW9u
ICYgc2FuaXR5IGNoZWNrcykKYXJlIHN0aWxsIGxpbmdlcmluZyBpbiBhIGxvY2FsIGJyYW5jaC4g
IFJlc2VuZGluZy4KCkdlcmQgSG9mZm1hbm4gKDMpOgogIHVkbWFidWY6IGFkZCBkb2N1bWVudGF0
aW9uCiAgdWRtYWJ1ZjogY2hlY2sgdGhhdCBfX3BhZCBpcyB6ZXJvCiAgdWRtYWJ1ZjogY2hlY2sg
dGhhdCBmbGFncyBoYXMgbm8gdW5zdXBwb3J0ZWQgYml0cyBzZXQKCiBpbmNsdWRlL3VhcGkvbGlu
dXgvdWRtYWJ1Zi5oICAgICAgICAgfCA1MiArKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiBk
cml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jICAgICAgICAgICAgfCAgNSArKysKIERvY3VtZW50YXRp
b24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdCB8ICA4ICsrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDYy
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgotLSAKMi4xOC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
