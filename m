Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B88E1D9AEB
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 17:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CA689C6B;
	Tue, 19 May 2020 15:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC1789C6B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 15:14:06 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B9CD2081A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 15:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589901246;
 bh=ScSGe8jrv3hfKhjCdizhN+Uxf0LNOAIcifPOI6l0k1Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FKp/kLhhACiUYxTanjepKan9en1fyjUm9fL4lkrMfnS6meFg+txGACCaV1MW6ciFs
 TL1A1kdD/qDFJVvRZ6lUs05xiyHRTPYkNV0tJF1kY254vAZTmeSO4gXHNE5rqSRxEw
 8CSoX0Mcj/zyPbInqAEjbZ8AzqM89Sc2bISgLGNY=
Received: by mail-ej1-f44.google.com with SMTP id s3so12242759eji.6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 08:14:06 -0700 (PDT)
X-Gm-Message-State: AOAM530gcPFQq85Xn/lgzFEYXRMhjVgSRpli/CGLfD1QapZuH7gNx80l
 0euffV8zIuCETcrdzGit7IKLacPURfekeEBX+Q==
X-Google-Smtp-Source: ABdhPJyGEMfHqwCecpXfV9Hb2nOIzkFqW5hk23VzHWZF6LNSHpvLL5cECCEgClHrkDVgI7tUHYITO+v3cLGXVoWSYp8=
X-Received: by 2002:a17:906:3041:: with SMTP id
 d1mr13973435ejd.7.1589901244908; 
 Tue, 19 May 2020 08:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200519094115.2448092-1-enric.balletbo@collabora.com>
In-Reply-To: <20200519094115.2448092-1-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 19 May 2020 23:13:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-uyJiBEDNDv8OvGD6MT6jx-jiH1hM4kc6d1v9f2a525g@mail.gmail.com>
Message-ID: <CAAOTY_-uyJiBEDNDv8OvGD6MT6jx-jiH1hM4kc6d1v9f2a525g@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi: Remove debug messages for
 function calls
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ15pyIMTnml6Ug6YCx5LqMIOS4i+WNiDU6NDHlr6vpgZPvvJoK
Pgo+IEVxdWl2YWxlbnQgaW5mb3JtYXRpb24gY2FuIGJlIG5vd2FkYXlzIG9idGFpbmVkIHVzaW5n
IGZ1bmN0aW9uIHRyYWNlcgo+CgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5n
Lmh1QGtlcm5lbC5vcmc+Cgo+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEg
PGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pLmMgICAgICAgICAgICB8IDEyICstLS0tLS0tLS0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19oZG1pX3BoeS5jIHwgIDQgLS0tLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gaW5kZXggYjA1NTVhN2NiM2I0Li4xNzJkNjcyOTQ0
MzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+IEBAIC0xNjM0LDggKzE2
MzQsNiBAQCBzdGF0aWMgaW50IG10a19oZG1pX2F1ZGlvX3N0YXJ0dXAoc3RydWN0IGRldmljZSAq
ZGV2LCB2b2lkICpkYXRhKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsKPgo+IC0gICAgICAgZGV2X2RiZyhkZXYsICIlc1xuIiwgX19m
dW5jX18pOwo+IC0KPiAgICAgICAgIG10a19oZG1pX2F1ZGlvX2VuYWJsZShoZG1pKTsKPgo+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gQEAgLTE2NDUsOCArMTY0Myw2IEBAIHN0YXRpYyB2b2lkIG10a19o
ZG1pX2F1ZGlvX3NodXRkb3duKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkKPiAgewo+
ICAgICAgICAgc3RydWN0IG10a19oZG1pICpoZG1pID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4K
PiAtICAgICAgIGRldl9kYmcoZGV2LCAiJXNcbiIsIF9fZnVuY19fKTsKPiAtCj4gICAgICAgICBt
dGtfaGRtaV9hdWRpb19kaXNhYmxlKGhkbWkpOwo+ICB9Cj4KPiBAQCAtMTY1NSw4ICsxNjUxLDYg
QEAgbXRrX2hkbWlfYXVkaW9fZGlnaXRhbF9tdXRlKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwgYm9vbCBlbmFibGUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBtdGtfaGRtaSAqaGRtaSA9
IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+Cj4gLSAgICAgICBkZXZfZGJnKGRldiwgIiVzKCVkKVxu
IiwgX19mdW5jX18sIGVuYWJsZSk7Cj4gLQo+ICAgICAgICAgaWYgKGVuYWJsZSkKPiAgICAgICAg
ICAgICAgICAgbXRrX2hkbWlfaHdfYXVkX211dGUoaGRtaSk7Cj4gICAgICAgICBlbHNlCj4gQEAg
LTE2NjksOCArMTY2Myw2IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfYXVkaW9fZ2V0X2VsZChzdHJ1
Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHVpbnQ4X3QgKmJ1ZiwKPiAgewo+ICAgICAgICAg
c3RydWN0IG10a19oZG1pICpoZG1pID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4KPiAtICAgICAg
IGRldl9kYmcoZGV2LCAiJXNcbiIsIF9fZnVuY19fKTsKPiAtCj4gICAgICAgICBtZW1jcHkoYnVm
LCBoZG1pLT5jb25uLmVsZCwgbWluKHNpemVvZihoZG1pLT5jb25uLmVsZCksIGxlbikpOwo+Cj4g
ICAgICAgICByZXR1cm4gMDsKPiBAQCAtMTc3MCw3ICsxNzYyLDYgQEAgc3RhdGljIGludCBtdGtf
ZHJtX2hkbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgICAg
ICAgICAgZ290byBlcnJfYnJpZGdlX3JlbW92ZTsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgZGV2
X2RiZyhkZXYsICJtZWRpYXRlayBoZG1pIHByb2JlIHN1Y2Nlc3NcbiIpOwo+ICAgICAgICAgcmV0
dXJuIDA7Cj4KPiAgZXJyX2JyaWRnZV9yZW1vdmU6Cj4gQEAgLTE3OTMsNyArMTc4NCw3IEBAIHN0
YXRpYyBpbnQgbXRrX2hkbWlfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gICAgICAgICBz
dHJ1Y3QgbXRrX2hkbWkgKmhkbWkgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPgo+ICAgICAgICAg
bXRrX2hkbWlfY2xrX2Rpc2FibGVfYXVkaW8oaGRtaSk7Cj4gLSAgICAgICBkZXZfZGJnKGRldiwg
ImhkbWkgc3VzcGVuZCBzdWNjZXNzIVxuIik7Cj4gKwo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0K
Pgo+IEBAIC0xODA4LDcgKzE3OTksNiBAQCBzdGF0aWMgaW50IG10a19oZG1pX3Jlc3VtZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAgICAgICB9
Cj4KPiAtICAgICAgIGRldl9kYmcoZGV2LCAiaGRtaSByZXN1bWUgc3VjY2VzcyFcbiIpOwo+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX2hkbWlfcGh5LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX210ODE3M19oZG1pX3BoeS5jCj4gaW5kZXggYjU1ZjUxNjc1MjA1Li4xYzM1NzUz
NzIyMzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdDgxNzNf
aGRtaV9waHkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX2hk
bWlfcGh5LmMKPiBAQCAtMTU5LDggKzE1OSw2IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfcGxsX3By
ZXBhcmUoc3RydWN0IGNsa19odyAqaHcpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBtdGtfaGRtaV9w
aHkgKmhkbWlfcGh5ID0gdG9fbXRrX2hkbWlfcGh5KGh3KTsKPgo+IC0gICAgICAgZGV2X2RiZyho
ZG1pX3BoeS0+ZGV2LCAiJXNcbiIsIF9fZnVuY19fKTsKPiAtCj4gICAgICAgICBtdGtfaGRtaV9w
aHlfc2V0X2JpdHMoaGRtaV9waHksIEhETUlfQ09OMSwgUkdfSERNSVRYX1BMTF9BVVRPS19FTik7
Cj4gICAgICAgICBtdGtfaGRtaV9waHlfc2V0X2JpdHMoaGRtaV9waHksIEhETUlfQ09OMCwgUkdf
SERNSVRYX1BMTF9QT1NESVYpOwo+ICAgICAgICAgbXRrX2hkbWlfcGh5X2NsZWFyX2JpdHMoaGRt
aV9waHksIEhETUlfQ09OMywgUkdfSERNSVRYX01ITENLX0VOKTsKPiBAQCAtMTc4LDggKzE3Niw2
IEBAIHN0YXRpYyB2b2lkIG10a19oZG1pX3BsbF91bnByZXBhcmUoc3RydWN0IGNsa19odyAqaHcp
Cj4gIHsKPiAgICAgICAgIHN0cnVjdCBtdGtfaGRtaV9waHkgKmhkbWlfcGh5ID0gdG9fbXRrX2hk
bWlfcGh5KGh3KTsKPgo+IC0gICAgICAgZGV2X2RiZyhoZG1pX3BoeS0+ZGV2LCAiJXNcbiIsIF9f
ZnVuY19fKTsKPiAtCj4gICAgICAgICBtdGtfaGRtaV9waHlfY2xlYXJfYml0cyhoZG1pX3BoeSwg
SERNSV9DT04xLCBSR19IRE1JVFhfUExMX1RYRElWX0VOKTsKPiAgICAgICAgIG10a19oZG1pX3Bo
eV9jbGVhcl9iaXRzKGhkbWlfcGh5LCBIRE1JX0NPTjEsIFJHX0hETUlUWF9QTExfQklBU19MUEZf
RU4pOwo+ICAgICAgICAgdXNsZWVwX3JhbmdlKDEwMCwgMTUwKTsKPiAtLQo+IDIuMjYuMgo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
