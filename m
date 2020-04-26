Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ACD1B8B99
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 05:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C98B6E4AA;
	Sun, 26 Apr 2020 03:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712AC6E4AA
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 03:11:01 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 007602173E
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 03:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587870661;
 bh=5ufY2WNf1d+9zTXd2f3aMGdsxjO3ggnK7WB1Ct27mWo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AoOgEJ/PCHpNCNceEnPC+l4jFraujO8GwZ54QALOYlUi1eslUYlJQgZFhAtDYYnI0
 bCvLruNMB2ngmXYg3t5f5++qHEQG0q1JS7kqvHCkKNSF2AF2Vnr8A183mi/bzybxgf
 /DcO8p2mpk5dVMyUGCfO9UZ3/lOPIOwXq7BD7iNk=
Received: by mail-ed1-f50.google.com with SMTP id g16so10788261eds.1
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 20:11:00 -0700 (PDT)
X-Gm-Message-State: AGi0PuY0qoftqODPGgQowLbQEB9QpoBEiFcXdBo/zDC0KkdR2Mn0XSx2
 0fPG8nz2aDGvdZvYMxI0LeWMgIfKPqkU1JyCmw==
X-Google-Smtp-Source: APiQypKzGcK+rktzR+tfPW/JO9EwaomlqVHqX5FQ7TR3YoCZvSXlsx8Rq/Mgm42CxzCH2NCu/qfo70XhLlXeJ46XxG8=
X-Received: by 2002:aa7:c649:: with SMTP id z9mr14002618edr.288.1587870659255; 
 Sat, 25 Apr 2020 20:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200226112723.649954-1-enric.balletbo@collabora.com>
In-Reply-To: <20200226112723.649954-1-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 26 Apr 2020 11:10:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9tfwd-cqxkwUWXM-B7vuLZoKjF6DhFgZZM3QZp1pmCAg@mail.gmail.com>
Message-ID: <CAAOTY_9tfwd-cqxkwUWXM-B7vuLZoKjF6DhFgZZM3QZp1pmCAg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Remove debug messages for function calls
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQy5pyIMjbml6Ug6YCx5LiJIOS4i+WNiDc6Mjflr6vpgZPvvJoK
Pgo+IEVxdWl2YWxlbnQgaW5mb3JtYXRpb24gY2FuIGJlIG5vd2FkYXlzIG9idGFpbmVkIHVzaW5n
IGZ1bmN0aW9uIHRyYWNlci4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFu
a3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
Y2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMs
CkNodW4tS3VhbmcuCgo+Cj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8
ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KPiAtLS0KPgo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCA1IC0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jICB8IDIgLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ny
dGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IGluZGV4IGEy
MzY0OTkxMjNhYS4uODgyYzY5MGQzZjEzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2NydGMuYwo+IEBAIC0xOTIsNyArMTkyLDYgQEAgc3RhdGljIGludCBtdGtfY3J0Y19k
ZHBfY2xrX2VuYWJsZShzdHJ1Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0YykKPiAgICAgICAgIGlu
dCByZXQ7Cj4gICAgICAgICBpbnQgaTsKPgo+IC0gICAgICAgRFJNX0RFQlVHX0RSSVZFUigiJXNc
biIsIF9fZnVuY19fKTsKPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+ZGRwX2Nv
bXBfbnI7IGkrKykgewo+ICAgICAgICAgICAgICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUo
bXRrX2NydGMtPmRkcF9jb21wW2ldLT5jbGspOwo+ICAgICAgICAgICAgICAgICBpZiAocmV0KSB7
Cj4gQEAgLTIxMiw3ICsyMTEsNiBAQCBzdGF0aWMgdm9pZCBtdGtfY3J0Y19kZHBfY2xrX2Rpc2Fi
bGUoc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gIHsKPiAgICAgICAgIGludCBpOwo+
Cj4gLSAgICAgICBEUk1fREVCVUdfRFJJVkVSKCIlc1xuIiwgX19mdW5jX18pOwo+ICAgICAgICAg
Zm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5kZHBfY29tcF9ucjsgaSsrKQo+ICAgICAgICAgICAg
ICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUobXRrX2NydGMtPmRkcF9jb21wW2ldLT5jbGspOwo+
ICB9Cj4gQEAgLTI1Nyw3ICsyNTUsNiBAQCBzdGF0aWMgaW50IG10a19jcnRjX2RkcF9od19pbml0
KHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQo+ICAgICAgICAgaW50IHJldDsKPiAgICAg
ICAgIGludCBpOwo+Cj4gLSAgICAgICBEUk1fREVCVUdfRFJJVkVSKCIlc1xuIiwgX19mdW5jX18p
Owo+ICAgICAgICAgaWYgKFdBUk5fT04oIWNydGMtPnN0YXRlKSkKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4KPiBAQCAtMjk4LDcgKzI5NSw2IEBAIHN0YXRpYyBpbnQgbXRrX2Ny
dGNfZGRwX2h3X2luaXQoc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gICAgICAgICAg
ICAgICAgIGdvdG8gZXJyX211dGV4X3VucHJlcGFyZTsKPiAgICAgICAgIH0KPgo+IC0gICAgICAg
RFJNX0RFQlVHX0RSSVZFUigibWVkaWF0ZWtfZGRwX2RkcF9wYXRoX3NldHVwXG4iKTsKPiAgICAg
ICAgIGZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+ZGRwX2NvbXBfbnIgLSAxOyBpKyspIHsKPiAg
ICAgICAgICAgICAgICAgbXRrX2RkcF9hZGRfY29tcF90b19wYXRoKG10a19jcnRjLT5jb25maWdf
cmVncywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG10a19jcnRj
LT5kZHBfY29tcFtpXS0+aWQsCj4gQEAgLTM0OCw3ICszNDQsNiBAQCBzdGF0aWMgdm9pZCBtdGtf
Y3J0Y19kZHBfaHdfZmluaShzdHJ1Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0YykKPiAgICAgICAg
IHN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9ICZtdGtfY3J0Yy0+YmFzZTsKPiAgICAgICAgIGludCBp
Owo+Cj4gLSAgICAgICBEUk1fREVCVUdfRFJJVkVSKCIlc1xuIiwgX19mdW5jX18pOwo+ICAgICAg
ICAgZm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5kZHBfY29tcF9ucjsgaSsrKSB7Cj4gICAgICAg
ICAgICAgICAgIG10a19kZHBfY29tcF9zdG9wKG10a19jcnRjLT5kZHBfY29tcFtpXSk7Cj4gICAg
ICAgICAgICAgICAgIGlmIChpID09IDEpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZHJ2LmMKPiBpbmRleCAxN2YxMThlZTBlNTcuLjQ5MzQ4MzQ5NzdiMyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gQEAgLTU3MCw3ICs1NzAsNiBAQCBzdGF0aWMg
aW50IG10a19kcm1fc3lzX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgICAgICAgaW50
IHJldDsKPgo+ICAgICAgICAgcmV0ID0gZHJtX21vZGVfY29uZmlnX2hlbHBlcl9zdXNwZW5kKGRy
bSk7Cj4gLSAgICAgICBEUk1fREVCVUdfRFJJVkVSKCJtdGtfZHJtX3N5c19zdXNwZW5kXG4iKTsK
Pgo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+IEBAIC01ODIsNyArNTgxLDYgQEAgc3RhdGlj
IGludCBtdGtfZHJtX3N5c19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgICAgICAgaW50
IHJldDsKPgo+ICAgICAgICAgcmV0ID0gZHJtX21vZGVfY29uZmlnX2hlbHBlcl9yZXN1bWUoZHJt
KTsKPiAtICAgICAgIERSTV9ERUJVR19EUklWRVIoIm10a19kcm1fc3lzX3Jlc3VtZVxuIik7Cj4K
PiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPiAtLQo+IDIuMjUuMAo+Cj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
