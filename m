Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AA72EFA5A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 22:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3139189320;
	Fri,  8 Jan 2021 21:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6B789320;
 Fri,  8 Jan 2021 21:24:49 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id 9so12928658oiq.3;
 Fri, 08 Jan 2021 13:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=auD7mbSMX/XpHUok2f7h/lpQb4MboPYfCPmFvkXVnf0=;
 b=e5eWhLc6AKzo+0/H5kiPOp8zABjRQimjDbdTgufmBkHLoYKpOZWtnS+/XZKIdwBBsM
 L1ebh1nosR7hviVAn5L47/g2R8UUnf0R5+PpNkERBfvD4EwD2+vjw2Ty5bUKMJ75viF8
 NrXhPG+R7oo4epfnscKqKypjUGSdMHatpqmXa2N4GxP5urZWtsDEexrigFhOGZzd4FSk
 r2rr/rpPk8FLf2FSuXLfrLEA8yso6yxeTCMWUP99xX576i0E3DOgfHoCsItwaDb8RUUz
 K06kMlVXPYuNhuPRVcPRn/uJ2yEDKGuP5QQDywgC/sL/pRD4lUBK41KOwVOgD8TsbMfg
 ueYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=auD7mbSMX/XpHUok2f7h/lpQb4MboPYfCPmFvkXVnf0=;
 b=D4d0Eq93ocQSQbZdEwLZuecHGu/alvi6+oC5EKwA2mlznKToxvzCHaaanQsKJNufj9
 PCM+258hIaMAoQS7kRR8Z0ZwBkkXQmTtexBefrOqLFpXLpgIXoUVrAxWfyek+vBxzJYH
 2cC2vrcaTZJNSrs8ltNvuM0azjcGOS6j/SiYjki9lc+LlOzWzLZPbU6fEh7H8L3dIHKG
 w/mC7yzcpDWXWwEct6/doE8e3ukTCyd1S0iRRukzHpwuLU6neV12CcJVDe0lIkYyxtyV
 tAhhCubd/KFpRMxyJP+DLvh6blvxAwGaJmOPdUtErDjkjpNBW1Tk1hqAgpXM5E5Dvata
 FyaA==
X-Gm-Message-State: AOAM531hElFUkeAObh/kspxwLGPAKF0C3Wb+bMBwOD3yKiV7uiZH604Q
 ntwxes0jrNklNFIMP3jwyBygKRmvxX6YCoo4U6k=
X-Google-Smtp-Source: ABdhPJyaS/QWrXyCB59tCxKopFR4J1F5TFDQyUTG+B8t/fvPSX9e8d78847ZnKfyBF0J22jUSwXCMQnKv0x4062FbV0=
X-Received: by 2002:aca:6202:: with SMTP id w2mr3387318oib.5.1610141089341;
 Fri, 08 Jan 2021 13:24:49 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-38-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-38-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 16:24:38 -0500
Message-ID: <CADnq5_NHZ6V9R3P22vWNBmWtn0Xz840K-r8kxV-1dv=0UPSECQ@mail.gmail.com>
Subject: Re: [PATCH 37/40] drm/amd/display/dc/dce/dce_i2c_sw: Make a bunch of
 local functions static
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE2IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9k
Y2UvZGNlX2kyY19zdy5jOjM0Mjo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9y
IOKAmGRjZV9pMmNfc3dfZW5naW5lX3NldF9zcGVlZOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9pMmNf
c3cuYzozNTY6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2VfaTJj
X3N3X2VuZ2luZV9hY3F1aXJlX2VuZ2luZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9pMmNfc3cuYzo0
MDA6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2VfaTJjX3N3X2Vu
Z2luZV9zdWJtaXRfY2hhbm5lbF9yZXF1ZXN04oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2kyY19zdy5j
OjQ0Mzo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZV9pMmNfc3df
ZW5naW5lX3N1Ym1pdF9wYXlsb2Fk4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPgo+IENjOiBI
YXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExpIDxzdW5w
ZW5nLmxpQGFtZC5jb20+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4CgoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaTJjX3N3LmMg
fCA5ICsrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y2UvZGNlX2kyY19zdy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
aTJjX3N3LmMKPiBpbmRleCA4N2Q4NDI4ZGY2YzQ2Li42ODQ2YWZkODM3MDFiIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2kyY19zdy5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaTJjX3N3LmMKPiBAQCAt
MzM5LDcgKzMzOSw3IEBAIHN0YXRpYyBib29sIHN0YXJ0X3N5bmNfc3coCj4gICAgICAgICByZXR1
cm4gZmFsc2U7Cj4gIH0KPgo+IC12b2lkIGRjZV9pMmNfc3dfZW5naW5lX3NldF9zcGVlZCgKPiAr
c3RhdGljIHZvaWQgZGNlX2kyY19zd19lbmdpbmVfc2V0X3NwZWVkKAo+ICAgICAgICAgc3RydWN0
IGRjZV9pMmNfc3cgKmVuZ2luZSwKPiAgICAgICAgIHVpbnQzMl90IHNwZWVkKQo+ICB7Cj4gQEAg
LTM1Myw3ICszNTMsNyBAQCB2b2lkIGRjZV9pMmNfc3dfZW5naW5lX3NldF9zcGVlZCgKPiAgICAg
ICAgICAgICAgICAgZW5naW5lLT5jbG9ja19kZWxheSA9IDEyOwo+ICB9Cj4KPiAtYm9vbCBkY2Vf
aTJjX3N3X2VuZ2luZV9hY3F1aXJlX2VuZ2luZSgKPiArc3RhdGljIGJvb2wgZGNlX2kyY19zd19l
bmdpbmVfYWNxdWlyZV9lbmdpbmUoCj4gICAgICAgICBzdHJ1Y3QgZGNlX2kyY19zdyAqZW5naW5l
LAo+ICAgICAgICAgc3RydWN0IGRkYyAqZGRjKQo+ICB7Cj4gQEAgLTM5Nyw3ICszOTcsNyBAQCBi
b29sIGRjZV9pMmNfZW5naW5lX2FjcXVpcmVfc3coCj4KPgo+Cj4gLXZvaWQgZGNlX2kyY19zd19l
bmdpbmVfc3VibWl0X2NoYW5uZWxfcmVxdWVzdCgKPiArc3RhdGljIHZvaWQgZGNlX2kyY19zd19l
bmdpbmVfc3VibWl0X2NoYW5uZWxfcmVxdWVzdCgKPiAgICAgICAgIHN0cnVjdCBkY2VfaTJjX3N3
ICplbmdpbmUsCj4gICAgICAgICBzdHJ1Y3QgaTJjX3JlcXVlc3RfdHJhbnNhY3Rpb25fZGF0YSAq
cmVxKQo+ICB7Cj4gQEAgLTQ0MCw3ICs0NDAsOCBAQCB2b2lkIGRjZV9pMmNfc3dfZW5naW5lX3N1
Ym1pdF9jaGFubmVsX3JlcXVlc3QoCj4gICAgICAgICAgICAgICAgIEkyQ19DSEFOTkVMX09QRVJB
VElPTl9TVUNDRUVERUQgOgo+ICAgICAgICAgICAgICAgICBJMkNfQ0hBTk5FTF9PUEVSQVRJT05f
RkFJTEVEOwo+ICB9Cj4gLWJvb2wgZGNlX2kyY19zd19lbmdpbmVfc3VibWl0X3BheWxvYWQoCj4g
Kwo+ICtzdGF0aWMgYm9vbCBkY2VfaTJjX3N3X2VuZ2luZV9zdWJtaXRfcGF5bG9hZCgKPiAgICAg
ICAgIHN0cnVjdCBkY2VfaTJjX3N3ICplbmdpbmUsCj4gICAgICAgICBzdHJ1Y3QgaTJjX3BheWxv
YWQgKnBheWxvYWQsCj4gICAgICAgICBib29sIG1pZGRsZV9vZl90cmFuc2FjdGlvbikKPiAtLQo+
IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
