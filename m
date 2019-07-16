Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D316B726
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D996E25E;
	Wed, 17 Jul 2019 07:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CC46E130
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 14:16:44 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id o101so21217997ota.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 07:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jVq/zyKNmBTqyWzD5MQLwwT+e3xMbKqpQWodHdoZ+Mk=;
 b=V55RJwfV2cjfnZCU/Rv19+F4LTtAgpms4J92OC0UuGVdC5+icBaB4X7+oXpNjqZEdn
 dT5J9yHZsx9qmUC6Nhcb2hUm724pgWQYoWeKxw/g8IKtwRAgJlPEeuwk8NYIKW3YxOlz
 mrAIKQo4/+7289cccziVu68m6oL5ZzxGqI3/0DtS7IXriVtsPc+PEzMcBJYpp50v9x/o
 BjD9HKj8qgc25O+My1OfwN5GSDVCJN1QgvUkoAocw02Ytg8/7loUUEei5UXYUKcAmEoW
 7GRBibGMKFRFqOeFha7+VP1am65xRbco06aaD5LKLW9kYsteASei9JES/YXFmbS+WO31
 zvxw==
X-Gm-Message-State: APjAAAUpTJaiscihKZ8Mi6Zv56FLzTf2pTGYdybNDIxXbt7lkhV93d6j
 CXTxcx9HQNeUaV8OpY7TqoSuvDXIBpboKOHXAXL9zw==
X-Google-Smtp-Source: APXvYqwN9uylP2hsCV6+LMaCJG6qvXFU449tm2O5OEbnNN4gNeP8+80YgzfQ+LB6vAKflWj5X25PTd+HkjgUEvFFruA=
X-Received: by 2002:a05:6830:1cd:: with SMTP id
 r13mr12627965ota.99.1563286603085; 
 Tue, 16 Jul 2019 07:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190716115725.66558-1-cychiang@chromium.org>
 <20190716115725.66558-6-cychiang@chromium.org>
In-Reply-To: <20190716115725.66558-6-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 16 Jul 2019 22:16:32 +0800
Message-ID: <CA+Px+wXK9gJKZwzsG8BXh1gmoEyscxtMzB_VCrHz-nenBEL9AQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] ASoC: rockchip_max98090: Add HDMI jack support
To: Cheng-Yi Chiang <cychiang@chromium.org>
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jVq/zyKNmBTqyWzD5MQLwwT+e3xMbKqpQWodHdoZ+Mk=;
 b=qYBVXqle+7vCUqLEVGwc67lXP5F/twwhlFE5Z3mnLHfQaL3woXgBZgCVi92TBDhjeJ
 2xYZtFtWIO5evm6dUtiAoTEGoDOsm7fC7AJucP0UX9gFrIopG668rPCYstFNF/deP0NO
 Yow3WDYPuKUXWR6NI8bIKWpEgK5Io9YYvt0wF0VNxQOMp4A/Yvrc6EGJuKBoAyR7WEFk
 BKTpMnxxGFDKUSaSEHeIdUeyft5UdLs/UKvUocHQGm9LDJsZL1rqSQe42AuAX+b4dBhv
 mjMEEk6vcD90usHttnGty2wR67IuGbimfqxxuyyfVqldMtrUTdVGUz7HAU4v4CZXe41f
 chrw==
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Douglas Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgNzo1OCBQTSBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5n
QGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3JvY2tjaGlw
L3JvY2tjaGlwX21heDk4MDkwLmMgYi9zb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgw
OTAuYwo+IGluZGV4IGM4Mjk0OGUzODNkYS4uYzgxYzRhY2RhOTE3IDEwMDY0NAo+IC0tLSBhL3Nv
dW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5jCj4gKysrIGIvc291bmQvc29jL3Jv
Y2tjaGlwL3JvY2tjaGlwX21heDk4MDkwLmMKPiArc3RhdGljIHN0cnVjdCBzbmRfc29jX2phY2sg
cmtfaGRtaV9qYWNrOwo+ICsKPiArc3RhdGljIGludCBya19oZG1pX2luaXQoc3RydWN0IHNuZF9z
b2NfcGNtX3J1bnRpbWUgKnJ1bnRpbWUpCj4gK3sKPiArICAgICAgIHN0cnVjdCBzbmRfc29jX2Nh
cmQgKmNhcmQgPSBydW50aW1lLT5jYXJkOwo+ICsgICAgICAgc3RydWN0IHNuZF9zb2NfY29tcG9u
ZW50ICpjb21wb25lbnQgPSBydW50aW1lLT5jb2RlY19kYWktPmNvbXBvbmVudDsKPiArICAgICAg
IGludCByZXQ7Cj4gKwo+ICsgICAgICAgLyogZW5hYmxlIGphY2sgZGV0ZWN0aW9uICovCj4gKyAg
ICAgICByZXQgPSBzbmRfc29jX2NhcmRfamFja19uZXcoY2FyZCwgIkhETUkgSmFjayIsIFNORF9K
QUNLX0xJTkVPVVQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnJrX2hk
bWlfamFjaywgTlVMTCwgMCk7Cj4gKyAgICAgICBpZiAocmV0KSB7Cj4gKyAgICAgICAgICAgICAg
IGRldl9lcnIoY2FyZC0+ZGV2LCAiQ2FuJ3QgbmV3IEhETUkgSmFjayAlZFxuIiwgcmV0KTsKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1
cm4gaGRtaV9jb2RlY19zZXRfamFja19kZXRlY3QoY29tcG9uZW50LCAmcmtfaGRtaV9qYWNrKTsK
PiArfQpJbiB0aGUgcGF0Y2gsIHlvdSBzaG91bGQgc2VsZWN0IFNORF9TT0NfSERNSV9DT0RFQywg
YmVjYXVzZSB0aGUgcGF0Y2gKdXNlcyBoZG1pX2NvZGVjX3NldF9qYWNrX2RldGVjdCB3aGljaCBk
ZXBlbmRzIG9uIGhkbWktY29kZWMuYy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
