Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FC25B527
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 08:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EADC89E23;
	Mon,  1 Jul 2019 06:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD8389E0E;
 Mon,  1 Jul 2019 06:38:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3063B4E92A;
 Mon,  1 Jul 2019 06:38:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1F37648D0;
 Mon,  1 Jul 2019 06:38:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 22AB217446; Mon,  1 Jul 2019 08:38:43 +0200 (CEST)
Date: Mon, 1 Jul 2019 08:38:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 09/33] drm/qxl: drop use of drmP.h
Message-ID: <20190701063843.qhkzyxuyfdv2wyw4@sirius.home.kraxel.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-10-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190630061922.7254-10-sam@ravnborg.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 01 Jul 2019 06:38:44 +0000 (UTC)
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
Cc: Dave Airlie <airlied@redhat.com>, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMDg6MTg6NThBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IERyb3AgdXNlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIgZmlsZS4KPiBX
aGlsZSB0b3VjaGluZyB0aGUgZmlsZXMgZGl2aWRlZCBpbmNsdWRlcyBpbiBibG9ja3MsCj4gYW5k
IHdoZW4gbmVlZGVkIHNvcnQgdGhlIGJsb2Nrcy4KPiBGaXggZmFsbG91dC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IERhdmUgQWlybGll
IDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQu
Y29tPgo+IENjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwo+IENj
OiBzcGljZS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKCkFja2VkLWJ5OiBHZXJkIEhvZmZt
YW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
