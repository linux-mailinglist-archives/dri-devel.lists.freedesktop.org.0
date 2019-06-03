Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A432EBF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 13:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23168925A;
	Mon,  3 Jun 2019 11:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58A089189
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 10:42:17 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id AA3B03AE682
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 09:59:09 +0000 (UTC)
Received: from starbug-2.treewalker.org (unknown [193.22.133.58])
 (Authenticated sender: relay@treewalker.org)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 69DCF200019;
 Mon,  3 Jun 2019 09:58:43 +0000 (UTC)
Received: from hyperion.localnet (hyperion.local.treewalker.org [192.168.0.43])
 by starbug-2.treewalker.org (Postfix) with ESMTP id 8419F99E971;
 Mon,  3 Jun 2019 11:58:39 +0200 (CEST)
From: Maarten ter Huurne <maarten@treewalker.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] drm/panel: Add Novatek NT39016 panel support
Date: Mon, 03 Jun 2019 11:58:39 +0200
Message-ID: <4433088.CzTouAtFss@hyperion>
In-Reply-To: <20190602184453.GB10060@ravnborg.org>
References: <20190602164844.15659-1-paul@crapouillou.net>
 <20190602164844.15659-2-paul@crapouillou.net>
 <20190602184453.GB10060@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Jun 2019 11:37:53 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuZGF5LCAyIEp1bmUgMjAxOSAyMDo0NDo1MyBDRVNUIFNhbSBSYXZuYm9yZyB3cm90ZToK
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4K
PiAKPiBUaGlzIGRyaXZlciBpcyBhdXRob3JlZCBieSBNYWFydGVuIHRlciBIdXVybmUgPG1hYXJ0
ZW5AdHJlZXdhbGtlci5vcmc+Cj4gYXMgd2VsbCBhcyB5b3UuCj4gQ291bGQgeW91IGdldCBhIHMt
by1iIG9yIGF0IGxlYXN0IHNvbWUgb3RoZXIgZm9ybWFsCj4gYXR0cmlidXRpb24gb2YgTWFhcnRl
biBpbiB0aGUgY2hhbmdlbG9nLgoKVGhpcyBpcyBiYXNlZCBvbiBhIGRyaXZlciBJIHdyb3RlIGZv
ciB0aGUgR0NXIFplcm8gYmFjayB3aGVuIHdlIHdlcmUgCnVzaW5nIGZiZGV2LiBQYXVsIHVwZGF0
ZWQgaXQgZm9yIGRybSBhbmQgZGlkIGFkZGl0aW9uYWwgY2xlYW51cHMuCgpTaWduZWQtb2ZmLWJ5
OiBNYWFydGVuIHRlciBIdXVybmUgPG1hYXJ0ZW5AdHJlZXdhbGtlci5vcmc+CgpCeWUsCgkJTWFh
cnRlbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
