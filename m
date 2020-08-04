Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA8A23BC71
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 16:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0C86E174;
	Tue,  4 Aug 2020 14:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D566E174
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 14:41:29 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 726D822B42
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 14:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596552089;
 bh=49+4jaBGejOQEj2mBMoA+n/qjCxSINfX1ZlDTF4RB9g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SIo20VzQD1hcKkTqZ3z6GBe+Nk04OJx3rnyojyF0dO0yfKTibSzFTxzo9XexiAGpL
 7kift6qM8OTaCC660NCKLt6bJH6Yq6r+KkBvLatUZlR7pHxBD1y4RuGzEjCe+xwcIQ
 /sG0jMIKiPHNmA+iSLJKMuPh+iI8pcYgGIjtOg34=
Received: by mail-ej1-f45.google.com with SMTP id m19so2200854ejd.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 07:41:29 -0700 (PDT)
X-Gm-Message-State: AOAM533HQvW5UA1VxvM+ibOkqTVM8Nej5ufZp472UB/PCihsuWeKlYWr
 4GOmmf/KCoqtQQSPF1j6Sz+u+YM+njXa8C98qw==
X-Google-Smtp-Source: ABdhPJxZ0G5jQrTt8tCKNFsHW0hKmhaebXxOjBoQebMkyIg/uoMGnJRW5xIni95vs+vqhJWTPzUYNN6/fLd4aQtB8v8=
X-Received: by 2002:a17:906:d92c:: with SMTP id
 rn12mr21013338ejb.187.1596552088025; 
 Tue, 04 Aug 2020 07:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200804105849.70876-1-linux@fw-web.de>
 <20200804105849.70876-5-linux@fw-web.de>
In-Reply-To: <20200804105849.70876-5-linux@fw-web.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 22:41:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Nd9jTiSZPZDUj3YtuqJTWCJTR91y2xjNT6y9f4v1+aQ@mail.gmail.com>
Message-ID: <CAAOTY_-Nd9jTiSZPZDUj3YtuqJTWCJTR91y2xjNT6y9f4v1+aQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/mediatek: dpi/dsi: change the getting
 possible_crtc way
To: Frank Wunderlich <linux@fw-web.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8bGludXhAZnctd2ViLmRlPiDmlrwgMjAyMOW5
tDjmnIg05pelIOmAseS6jCDkuIvljYg3OjAw5a+r6YGT77yaCj4KPiBGcm9tOiBKaXRhbyBTaGkg
PGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4KPiBGb3IgY3VycmVudCBtZWRpYXRlayBkc2kgZW5j
b2RlciwgaXRzIHBvc3NpYmxlIGNydGMgaXMgZml4ZWQgaW4gY3J0Ywo+IDAsIGFuZCBtZWRpYXRl
ayBkcGkgZW5jb2RlcidzIHBvc3NpYmxlIGNydGMgaXMgZml4ZWQgaW4gY3J0YyAxLiBJbgo+IHNv
bWUgU29DIHRoZSBwb3NzaWJsZSBjcnRjIGlzIG5vdCBmaXhlZCBpbiB0aGlzIGNhc2UsIHNvIGNh
bGwKPiBtdGtfZHJtX2ZpbmRfcG9zc2libGVfY3J0Y19ieV9jb21wKCkgdG8gZmluZCBvdXQgdGhl
IGNvcnJlY3QgcG9zc2libGUKPiBjcnRjLgoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNo
dW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0
YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBXdW5kZXJsaWNoIDxm
cmFuay13QHB1YmxpYy1maWxlcy5kZT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcGkuYyB8IDMgKystCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMg
fCAzICsrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IGluZGV4IGQ0ZjBmYjdhZDMxMi4u
ZTQzOTc3MDE1ODQzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gQEAgLTYw
OCw3ICs2MDgsOCBAQCBzdGF0aWMgaW50IG10a19kcGlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiAgICAgICAgIGRybV9lbmNvZGVy
X2hlbHBlcl9hZGQoJmRwaS0+ZW5jb2RlciwgJm10a19kcGlfZW5jb2Rlcl9oZWxwZXJfZnVuY3Mp
Owo+Cj4gICAgICAgICAvKiBDdXJyZW50bHkgRFBJMCBpcyBmaXhlZCB0byBiZSBkcml2ZW4gYnkg
T1ZMMSAqLwo+IC0gICAgICAgZHBpLT5lbmNvZGVyLnBvc3NpYmxlX2NydGNzID0gQklUKDEpOwo+
ICsgICAgICAgZHBpLT5lbmNvZGVyLnBvc3NpYmxlX2NydGNzID0KPiArICAgICAgICAgICAgICAg
bXRrX2RybV9maW5kX3Bvc3NpYmxlX2NydGNfYnlfY29tcChkcm1fZGV2LCBkcGktPmRkcF9jb21w
KTsKPgo+ICAgICAgICAgcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goJmRwaS0+ZW5jb2RlciwgZHBp
LT5icmlkZ2UsIE5VTEwsIDApOwo+ICAgICAgICAgaWYgKHJldCkgewo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYwo+IGluZGV4IDI3MGJmMjJjOThmZS4uYzMxZDljMTJkNGE5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTg5Miw3ICs4OTIsOCBAQCBzdGF0aWMg
aW50IG10a19kc2lfY3JlYXRlX2Nvbm5fZW5jKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVj
dCBtdGtfZHNpICpkc2kpCj4gICAgICAgICAgKiBDdXJyZW50bHkgZGlzcGxheSBkYXRhIHBhdGhz
IGFyZSBzdGF0aWNhbGx5IGFzc2lnbmVkIHRvIGEgY3J0YyBlYWNoLgo+ICAgICAgICAgICogY3J0
YyAwIGlzIE9WTDAgLT4gQ09MT1IwIC0+IEFBTCAtPiBPRCAtPiBSRE1BMCAtPiBVRk9FIC0+IERT
STAKPiAgICAgICAgICAqLwo+IC0gICAgICAgZHNpLT5lbmNvZGVyLnBvc3NpYmxlX2NydGNzID0g
MTsKPiArICAgICAgIGRzaS0+ZW5jb2Rlci5wb3NzaWJsZV9jcnRjcyA9Cj4gKyAgICAgICAgICAg
ICAgIG10a19kcm1fZmluZF9wb3NzaWJsZV9jcnRjX2J5X2NvbXAoZHJtLCBkc2ktPmRkcF9jb21w
KTsKPgo+ICAgICAgICAgLyogSWYgdGhlcmUncyBhIGJyaWRnZSwgYXR0YWNoIHRvIGl0IGFuZCBs
ZXQgaXQgY3JlYXRlIHRoZSBjb25uZWN0b3IgKi8KPiAgICAgICAgIGlmIChkc2ktPmJyaWRnZSkg
ewo+IC0tCj4gMi4yNS4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
