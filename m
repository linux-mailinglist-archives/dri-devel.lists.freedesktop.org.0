Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5D73550BA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 12:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A968E6E104;
	Tue,  6 Apr 2021 10:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A253D6E104
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 10:21:42 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso9394709pji.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Apr 2021 03:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sPJH6QirhbWWBe6IX++gDDlQT8BPbNxs95bEGDNNMp4=;
 b=PjpjxAu0/8swyFenE28pAjGbjDKj0YbH2Pn+EsV2b6AVqCvfCzf53IFD4VTNiiZ9jW
 rl6pZg2Pj3bLVP79SMS/sVVz/6EP4/zLT665qpgba14Y0FwD8awyS/3lBkR6G+/0GC1g
 uRBcM6r9jjLQ4TXaBEA8tG4FmrFGE9w4ngu5jqnN2gbCUDQGa8ZEUV1RiI/mAhqGPxVi
 2TEj6N/u4V1dqR5FvvMZp9/qxvhU9XtIF4/cd8I/CUyrT/BElFTXNgTf/rL+QSq37CiG
 4unG45mvI+LkVfSBztQqL6h2BMlEa4kFCcIYa1Y3gXDTmtUMOPGN4DSLXCcH8fGuazpW
 4GSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sPJH6QirhbWWBe6IX++gDDlQT8BPbNxs95bEGDNNMp4=;
 b=c+vn0PZc2rq4UF3Z7XdMmt9QO6E0TUntMu3kGVDIfZcQGGbGD0K2Vdkag3Z0uW8rJx
 KRH5b/oXTyH37TQGaIGv6EYd2cR/azNmp5VSJNd1vblALA4xrJNe3u9MAFEtxEIWILTy
 k8MxrHw0ifVOPPcWdm2sgz6MRsbdq+EBBl4kzdIHHOUVN68LiPoDr0p4Sr66z/4fwo6F
 o6/q6aAP0RcDPbkGLfV6MJgBOxUPTPBp/DnTvmav6gz26uPeG0Btf5Mz5V0IT9rMWI78
 T2NXCIX7/A5/EWzV6twFsST0ZAevp7QzDS+UIiOjR/u854OXkjnK8gsQx9zWnWQzTDS0
 1mdQ==
X-Gm-Message-State: AOAM533YLslSTIDv2mZkg2tMfwjdusVnCbZkoaRc0RRMIBHEJGnlFUtd
 mThhX4tETcbmXtyPkk8Fddi0TEMFw7VxhCaDXVbOIg==
X-Google-Smtp-Source: ABdhPJzRICRTLgbK/lqYyX8NKzVUpbzEPj3oEp2uFeuX9dgzSJaEn18ktVH53cpHvxXFnFDtlp++/W/tyadb7IWWqKU=
X-Received: by 2002:a17:902:7e8b:b029:e9:2ba0:20a2 with SMTP id
 z11-20020a1709027e8bb02900e92ba020a2mr5356970pla.69.1617704502090; Tue, 06
 Apr 2021 03:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210406090733.169989-1-zhangjianhua18@huawei.com>
In-Reply-To: <20210406090733.169989-1-zhangjianhua18@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 6 Apr 2021 12:21:31 +0200
Message-ID: <CAG3jFyvC6ozPxQ=TPdPgLAugKky5AhOZGJSiw0Dc3Kn5Pba0cA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/bridge: lt8912b: DRM_LONTIUM_LT8912B select
 GPIOLIB
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
 heying24@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IFpoYW5nCgpPbiBUdWUsIDYgQXByIDIwMjEgYXQgMTE6MDcsIFpoYW5nIEppYW5odWEgPHpo
YW5namlhbmh1YTE4QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gSWYgQ09ORklHX0RSTV9MT05USVVN
X0xUODkxMkI9eSwgdGhlIGZvbGxvd2luZyBlcnJvcnMgd2lsbCBiZSBzZWVuIHdoaWxlCj4gY29t
cGlsaW5nIGxvbnRpdW0tbHQ4OTEyYi5jCj4KPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRp
dW0tbHQ4OTEyYi5jOiBJbiBmdW5jdGlvbgo+IOKAmGx0ODkxMl9oYXJkX3Bvd2VyX29u4oCZOgo+
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5MTJiLmM6MjUyOjI6IGVycm9yOiBp
bXBsaWNpdAo+IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGdwaW9kX3NldF92YWx1ZV9jYW5z
bGVlcOKAmTsgZGlkIHlvdSBtZWFuCj4g4oCYZ3Bpb19zZXRfdmFsdWVfY2Fuc2xlZXDigJk/IFst
V2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgZ3Bpb2Rfc2V0X3ZhbHVl
X2NhbnNsZWVwKGx0LT5ncF9yZXNldCwgMCk7Cj4gICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
PiAgIGdwaW9fc2V0X3ZhbHVlX2NhbnNsZWVwCj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250
aXVtLWx0ODkxMmIuYzogSW4gZnVuY3Rpb24g4oCYbHQ4OTEyX3BhcnNlX2R04oCZOgo+IGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5MTJiLmM6NjI4OjEzOiBlcnJvcjogaW1wbGlj
aXQKPiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhkZXZtX2dwaW9kX2dldF9vcHRpb25hbOKA
mTsgZGlkIHlvdSBtZWFuCj4g4oCYZGV2bV9ncGlvX3JlcXVlc3Rfb25l4oCZPyBbLVdlcnJvcj1p
bXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgIGdwX3Jlc2V0ID0gZGV2bV9ncGlvZF9n
ZXRfb3B0aW9uYWwoZGV2LCAicmVzZXQiLCBHUElPRF9PVVRfSElHSCk7Cj4gICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gICAgICAgICAgICAgIGRldm1fZ3Bpb19yZXF1ZXN0
X29uZQo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5MTJiLmM6NjI4OjUxOiBl
cnJvcjog4oCYR1BJT0RfT1VUX0hJR0jigJkKPiB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhHUElPRl9JTklUX0hJR0jigJk/Cj4gICBncF9y
ZXNldCA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKGRldiwgInJlc2V0IiwgR1BJT0RfT1VUX0hJ
R0gpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgR1BJT0ZfSU5JVF9ISUdICj4KPiBTaWduZWQtb2ZmLWJ5OiBaaGFuZyBKaWFu
aHVhIDx6aGFuZ2ppYW5odWExOEBodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL0tjb25maWcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gaW5kZXggZGJhNjJmOTJkMDUxLi5jYWE5NjU4ZWM5MzMg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gQEAgLTY3LDYgKzY3LDcgQEAgY29uZmlnIERS
TV9MT05USVVNX0xUODkxMkIKPiAgICAgICAgIHNlbGVjdCBEUk1fUEFORUxfQlJJREdFCj4gICAg
ICAgICBzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiAgICAgICAgIHNlbGVjdCBSRUdNQVBfSTJDCj4g
KyAgICAgICBzZWxlY3QgR1BJT0xJQgoKVGhpcyBhcHBlYXJzIGxpa2UgdGhlIHJpZ2h0IGZpeCBm
b3IgdGhpcyBwcm9ibGVtLiBIb3dldmVyLCBhIG51bWJlciBvZgpkcm0vYnJpZGdlIGRyaXZlcnMg
c2VlbSB0byBjYWxsIGJvdGggZ3Bpb19zZXRfdmFsdWVfY2Fuc2xlZXAoKSBhbmQKZGV2bV9ncGlv
ZF9nZXRfb3B0aW9uYWwoKSB3aXRob3V0IGhhdmluZyB0aGUgR1BJT0xJQiBrY29uZmlnIG9wdGlv
bgpzZWxlY3RlZCBzbyB0aGlzIGNhbid0IGJlIGEgbmV3IGlzc3VlLiBNYXliZSBzb21lIG1vcmUg
aW52ZXN0aWdhdGlvbgppcyBpbiBvcmRlci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
