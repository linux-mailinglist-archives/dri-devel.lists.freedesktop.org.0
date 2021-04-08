Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CC9357FC9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 11:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440726EA4C;
	Thu,  8 Apr 2021 09:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4016EA4C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 09:47:12 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id 11so1394226pfn.9
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 02:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wx8MYiZlUE5pbxRfwsCl1OlR8aGmQOE5tCtoCPsygq4=;
 b=WeLkbj3r/iOMchz9Ce3Si5iRa44gWVC1uBW4P2AjedCLiiR5IDywCZtKbNfVGxlJOF
 WD9GPotB4FQL3zeuaFfZpnE2e2bp9hRgFNWClt/Oe6yZrOLKtTcsesFXV90rJ3tPr7KD
 nk2LC504BsusA3+aI7gJXgcCpM5gajTyNmzuj72cUolCvv+b+l52H3W4P4PAHHFg62II
 iHEV5XNS9J3bqIhnAeoFDVfqBKFcl2XdhN5PEW1GxSqCrWTbgt/8YKG8fb+8FA8JrQmi
 8b4sFrJf06fehM5AVFaAHV17MVqtGvm47q0soXCJpD68g0mghExq+rcBxv53PjTaiAVV
 OxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wx8MYiZlUE5pbxRfwsCl1OlR8aGmQOE5tCtoCPsygq4=;
 b=h3waRtPAX1KB+xL40Llw92t8H6lawSPuSULBw7ix/OAyydeh4sfINeqSUmK8lzbypP
 qmpRjZB+0wjChgUSyMP/3hlmijPIZ282OUDk567LTWq1Sr50KxDeT2gYdgX/HwgK2wij
 B5rtLM8z3VqjUDYpB/QodUAke+p9QOcgkWTPtoXAJ9xJHYlyJaEKPDbvFt1gblAQNmgR
 KqIr8cYhc5vppchb6wLFDLqlsa6WbEJG7j/c38QM9j0DecpoaDbSdAkONHM+mEAFRyZN
 nir2n1PcwU2t8t5neiQ3QdAG9H/4nqCjoEveOC0Ggb5eOoV90Qp2MG7BKIxpr1TQYtHA
 b0Qw==
X-Gm-Message-State: AOAM5337o7caOSGwXbUz6gcqaY8S9jSgFAc6+6+8qyf0JcSjU0PE7Xj9
 mmaJhcT6am2qEVzE+OZDIzeDPCrrVJw/SztxtFCMDifiKa9mcw==
X-Google-Smtp-Source: ABdhPJz3CqwRR9ZuK3onI97NXQdgaNEArs1YyVJb+6DWcf9Ktln4/0MEWwGfWIqhbOluU6wIPlrS61cbUOdbFLDaGMo=
X-Received: by 2002:aa7:98c9:0:b029:242:18fc:562d with SMTP id
 e9-20020aa798c90000b029024218fc562dmr6369255pfm.39.1617875232450; Thu, 08 Apr
 2021 02:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210408093822.207917-1-zhangjianhua18@huawei.com>
In-Reply-To: <20210408093822.207917-1-zhangjianhua18@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 8 Apr 2021 11:47:01 +0200
Message-ID: <CAG3jFysH0Ms_7oP0npKZAv7uXs+uAoO=+FBbCYyBV6dULe3dNg@mail.gmail.com>
Subject: Re: [PATCH -next v3] drm/bridge: lt8912b: Add header file
 <linux/gpio/consumer.h>
To: Zhang Jianhua <zhangjianhua18@huawei.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, johnny.chenyi@huawei.com,
 heying24@huawei.com, Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHVzaGVkIHRvIGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjL2NvbW1p
dC8/aWQ9NzUxM2NlNDkwMjdjODIxOGE2ZmNlN2VjNDVjMzI4OWI5MDNiYTRiZAoKCk9uIFRodSwg
OCBBcHIgMjAyMSBhdCAxMTozOCwgWmhhbmcgSmlhbmh1YSA8emhhbmdqaWFuaHVhMThAaHVhd2Vp
LmNvbT4gd3JvdGU6Cj4KPiBJZiBDT05GSUdfRFJNX0xPTlRJVU1fTFQ4OTEyQj1tLCB0aGUgZm9s
bG93aW5nIGVycm9ycyB3aWxsIGJlIHNlZW4gd2hpbGUKPiBjb21waWxpbmcgbG9udGl1bS1sdDg5
MTJiLmMKPgo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5MTJiLmM6IEluIGZ1
bmN0aW9uCj4g4oCYbHQ4OTEyX2hhcmRfcG93ZXJfb27igJk6Cj4gZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9sb250aXVtLWx0ODkxMmIuYzoyNTI6MjogZXJyb3I6IGltcGxpY2l0Cj4gZGVjbGFyYXRp
b24gb2YgZnVuY3Rpb24g4oCYZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVw4oCZOyBkaWQgeW91IG1l
YW4KPiDigJhncGlvX3NldF92YWx1ZV9jYW5zbGVlcOKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVu
Y3Rpb24tZGVjbGFyYXRpb25dCj4gICBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAobHQtPmdwX3Jl
c2V0LCAwKTsKPiAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgZ3Bpb19zZXRfdmFsdWVf
Y2Fuc2xlZXAKPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5jOiBJbiBm
dW5jdGlvbiDigJhsdDg5MTJfcGFyc2VfZHTigJk6Cj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9s
b250aXVtLWx0ODkxMmIuYzo2Mjg6MTM6IGVycm9yOiBpbXBsaWNpdAo+IGRlY2xhcmF0aW9uIG9m
IGZ1bmN0aW9uIOKAmGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFs4oCZOyBkaWQgeW91IG1lYW4KPiDi
gJhkZXZtX2dwaW9fcmVxdWVzdF9vbmXigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRl
Y2xhcmF0aW9uXQo+ICAgZ3BfcmVzZXQgPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYsICJy
ZXNldCIsIEdQSU9EX09VVF9ISUdIKTsKPiAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4KPiAgICAgICAgICAgICAgZGV2bV9ncGlvX3JlcXVlc3Rfb25lCj4gZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9sb250aXVtLWx0ODkxMmIuYzo2Mjg6NTE6IGVycm9yOiDigJhHUElPRF9PVVRf
SElHSOKAmQo+IHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlv
dSBtZWFuIOKAmEdQSU9GX0lOSVRfSElHSOKAmT8KPiAgIGdwX3Jlc2V0ID0gZGV2bV9ncGlvZF9n
ZXRfb3B0aW9uYWwoZGV2LCAicmVzZXQiLCBHUElPRF9PVVRfSElHSCk7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHUElPRl9J
TklUX0hJR0gKPgo+IFNpZ25lZC1vZmYtYnk6IFpoYW5nIEppYW5odWEgPHpoYW5namlhbmh1YTE4
QGh1YXdlaS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvYmVydCBGb3NzIDxyb2JlcnQuZm9zc0BsaW5h
cm8ub3JnPgo+IC0tLQo+IHYyOgo+IC0gYWRkIGhlYWRlciBmaWxlIDxsaW51eC9ncGlvL2NvbnN1
bWVyLmg+IGZvciBsb250aXVtLWx0ODkxMmIuYyBpbnN0ZWFkCj4gICBvZiBhZGQgY29uZmlnIGRl
cGVuZGVuY2UgZm9yIENPTkZJR19EUk1fTE9OVElVTV9MVDg5MTJCCj4gdjM6Cj4gLSBjaGFuZ2Ug
dGhlICNpbmNsdWRlIGluIGFscGhhYmV0aWNhbCBvcmRlcgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1
bS1sdDg5MTJiLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5jCj4g
aW5kZXggNjE0OTE2MTViYWQwLi40ZjY5MzEyMzk4NWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9sb250aXVtLWx0ODkxMmIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvbG9udGl1bS1sdDg5MTJiLmMKPiBAQCAtNSw2ICs1LDcgQEAKPgo+ICAjaW5jbHVkZSA8
bGludXgvZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ICsjaW5jbHVkZSA8
bGludXgvZ3Bpby9jb25zdW1lci5oPgo+ICAjaW5jbHVkZSA8bGludXgvaTJjLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9ncGlvLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+Cj4gLS0KPiAy
LjE3LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
