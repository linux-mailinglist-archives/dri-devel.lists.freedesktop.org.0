Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC92C2C62
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DC76E483;
	Tue, 24 Nov 2020 16:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159966E459;
 Tue, 24 Nov 2020 16:11:48 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l1so22856840wrb.9;
 Tue, 24 Nov 2020 08:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yWBnAsL35h7coYRmd6KCcPiuKL0mldpz6aVNraU0pGg=;
 b=NP4SypGli7x9DynJs7n+UT0Qu+QOMiTALxeTz9iK20T5BS3LeIvpDRXBPeIou2Mfb0
 LOsUwxRA7ufIXwSrtzMrEhSo9J54a6YDU9tOIOAxJGR5yYxkNEWx0sQuPt06gKjS3E2T
 nGh+/Hlksh2xzQj2ZgwAq6hjD2m7aMthGFTLnIuu+///meA/TrJvjqoIRu0Ce6LJkZsS
 UuVI3FFbdMRRjehN67dbdCElKxiN2q96KX78eEugHCYendp+CNPjGw7V+KJ56nLkJskj
 iMKWDD7giCwO6og0jNBCqbatSUBBVt5Ao0zwsjD2yuN9Fn7VL2jPjzMkyg/8I5B1tI68
 3GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yWBnAsL35h7coYRmd6KCcPiuKL0mldpz6aVNraU0pGg=;
 b=W1M45kU6lTlBRv+1lQt7m74nfavO6X8HLR4L2daxMA9pjZDzb14QRuONAttvqKfkWX
 AauAJPIEUEQ5+JiYPN+JEopmwImUGqg0J3ighw3m4qln0tKp32hcftfeCUW+n3hqoabJ
 geKnOHAIV+IJgiVCJMRL5xS5YoK8szPz8N7pcWWNh7/M/GfVtVeURsvEOvWYYlTnk1H8
 qYASh7PqD0e4r7LZ0Yt/iZyZI95aaWV8RLyf3thaET5GDF8DOnGH9j1KY8BbT0LelyCh
 q00dkZ+9byJadJ8R2Yg1xOnzoCW10/HY29lPmPgFfff+kGX7/JMZugJRv6Pku6gZeGaD
 m9OQ==
X-Gm-Message-State: AOAM531D1nxQVWnnqrxJGrCrDdjcDHk2T6kW1/LLdrTSny5Mw3IXSr0L
 Ilc1z2OvPZpGXVL9uAf8f7Oc+Pk48+UlEyh0GNQ=
X-Google-Smtp-Source: ABdhPJw0msurlCJdUlLz8FT84ifhdXHmaoi1gvjtUeAEEZQg/e1bujCJGzGlPH6KS6IgPPLj3bFCVDTL+bjy7xBSEG8=
X-Received: by 2002:adf:8028:: with SMTP id 37mr6136762wrk.111.1606234306840; 
 Tue, 24 Nov 2020 08:11:46 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-24-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-24-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 11:11:35 -0500
Message-ID: <CADnq5_OdaPQrzCMdr3vPs6WOWvbKWhgAV8RvQ6M5roZq3jQ1Xg@mail.gmail.com>
Subject: Re: [PATCH 23/40] drm/amd/include/vega20_ip_offset: Mark top-level
 IP_BASE definition as __maybe_unused
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoyMCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+ICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvdmVnYTIwX3JlZ19pbml0LmM6Mjc6Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2luY2x1ZGUvdmVnYTIwX2lwX29mZnNldC5oOjE1NDoyOTogd2FybmluZzog4oCY
WERNQV9CQVNF4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJs
ZT0KPiAgMTU0IHwgc3RhdGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIFhETUFfQkFTRSA9eyB7IHsg
eyAweDAwMDAzNDAwLCAwLCAwLCAwLCAwLCAwIH0gfSwKPiAgfCBefn5+fn5+fn4KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS92ZWdhMjBfaXBfb2Zmc2V0Lmg6NjM6Mjk6
IHdhcm5pbmc6IOKAmEZVU0VfQkFTReKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
Y29uc3QtdmFyaWFibGU9XQo+ICA2MyB8IHN0YXRpYyBjb25zdCBzdHJ1Y3QgSVBfQkFTRSBGVVNF
X0JBU0UgPXsgeyB7IHsgMHgwMDAxNzQwMCwgMCwgMCwgMCwgMCwgMCB9IH0sCj4gIHwgXn5+fn5+
fn5+Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToK
Pgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJD
aHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9pbmNsdWRlL3ZlZ2EyMF9pcF9vZmZzZXQuaCB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3ZlZ2EyMF9pcF9vZmZzZXQuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvaW5jbHVkZS92ZWdhMjBfaXBfb2Zmc2V0LmgKPiBpbmRleCAyYTJhOWNjOGJl
ZGI2Li4xZGViNjhmM2QzMzQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS92ZWdhMjBfaXBfb2Zmc2V0LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1
ZGUvdmVnYTIwX2lwX29mZnNldC5oCj4gQEAgLTMzLDcgKzMzLDcgQEAgc3RydWN0IElQX0JBU0Vf
SU5TVEFOQ0UKPiAgc3RydWN0IElQX0JBU0UKPiAgewo+ICAgICAgc3RydWN0IElQX0JBU0VfSU5T
VEFOQ0UgaW5zdGFuY2VbTUFYX0lOU1RBTkNFXTsKPiAtfTsKPiArfSBfX21heWJlX3VudXNlZDsK
Pgo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgSVBfQkFTRSBBVEhVQl9CQVNFICAgICAgICAgICAg
PXsgeyB7IHsgMHgwMDAwMEMyMCwgMCwgMCwgMCwgMCwgMCB9IH0sCj4gLS0KPiAyLjI1LjEKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
