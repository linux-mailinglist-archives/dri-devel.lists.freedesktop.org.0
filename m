Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E63BEF9D3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2F26E97C;
	Tue,  5 Nov 2019 09:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA466E97C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 09:44:39 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-t23L17VTNLqKZpr8FYh34w-1; Tue, 05 Nov 2019 04:44:36 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ADAA8017DE;
 Tue,  5 Nov 2019 09:44:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33BB360BF4;
 Tue,  5 Nov 2019 09:44:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0D41D17535; Tue,  5 Nov 2019 10:44:34 +0100 (CET)
Date: Tue, 5 Nov 2019 10:44:34 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/9] drm/ast: Don't clear base address and offset with
 default values
Message-ID: <20191105094433.ukerwk2ivqpbdjsh@sirius.home.kraxel.org>
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-4-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191028154928.4058-4-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: t23L17VTNLqKZpr8FYh34w-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572947078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+xggJYN5tq6XfPwhpl/BG1DvoKurmQ2NeRarvT5FTI=;
 b=B/pnuIl6Rh6FsCoZ/0b5ScwAIewpnqskeEKmRfnRN/stYH4iF5heu5dT9Ym9zFRBldklWw
 0PTEgeEGwDRbr6mmw/zGU66X1yqnbTnqPkRqWxaL/eCcuh80qBudvbjIm0YN2LW89XrirE
 BFTLvzx3i4FlDZQw4OrBq5R5KHGtLIk=
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
Cc: airlied@redhat.com, chen@aspeedtech.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDQ6NDk6MjJQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGNvbnRlbnQgb2YgdGhlIGJhc2UtYWRkcmVzcyBhbmQgb2Zmc2V0IHJl
Z2lzdGVycyBhcmUgc3RhdGUgb2YKPiB0aGUgcHJpbWFyeSBwbGFuZS4gQ2xlYXJpbmcgaXQgdG8g
ZGVmYXVsdCB2YWx1ZXMgd2lsbCBpbnRlcmZlcmUgd2l0aAo+IHBsYW5lIGZ1bmN0aW9ucyBmb3Ig
YXRvbWljIG1vZGUgc2V0dGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KCkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDgg
KysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCj4gaW5kZXggYjEzZWFhMjYxOWFiLi5iM2Y4MmMy
ZDI3NGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCj4gQEAgLTI1Myw5ICsyNTMsMTMgQEAg
c3RhdGljIHZvaWQgYXN0X3NldF9zdGRfcmVnKHN0cnVjdCBkcm1fY3J0YyAqY3J0Yywgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgKm1vZGUKPiAgCQlhc3Rfc2V0X2luZGV4X3JlZyhhc3QsIEFTVF9J
T19TRVFfUE9SVCwgKGkgKyAxKSAsIGpyZWcpOwo+ICAJfQo+ICAKPiAtCS8qIFNldCBDUlRDICov
Cj4gKwkvKiBTZXQgQ1JUQzsgZXhjZXB0IGJhc2UgYWRkcmVzcyBhbmQgb2Zmc2V0ICovCj4gIAlh
c3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwgMHgxMSwgMHg3Ziwg
MHgwMCk7Cj4gLQlmb3IgKGkgPSAwOyBpIDwgMjU7IGkrKykKPiArCWZvciAoaSA9IDA7IGkgPCAx
MjsgaSsrKQo+ICsJCWFzdF9zZXRfaW5kZXhfcmVnKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwgaSwg
c3RkdGFibGUtPmNydGNbaV0pOwo+ICsJZm9yIChpID0gMTQ7IGkgPCAxOTsgaSsrKQo+ICsJCWFz
dF9zZXRfaW5kZXhfcmVnKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwgaSwgc3RkdGFibGUtPmNydGNb
aV0pOwo+ICsJZm9yIChpID0gMjA7IGkgPCAyNTsgaSsrKQo+ICAJCWFzdF9zZXRfaW5kZXhfcmVn
KGFzdCwgQVNUX0lPX0NSVENfUE9SVCwgaSwgc3RkdGFibGUtPmNydGNbaV0pOwo+ICAKPiAgCS8q
IHNldCBBUiAqLwo+IC0tIAo+IDIuMjMuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
