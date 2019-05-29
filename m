Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F552DBAC
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF17B6E2EC;
	Wed, 29 May 2019 11:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116636E079
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 04:19:38 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id i34so972705qta.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 21:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FnqQyLt42DZ9noxJLCU2V14s5enRSAf3rpEHwRX9Kzo=;
 b=AtCW54PuLQQke8p5vaCzViB2kmur+ICpI79+iSr6zEQ69vmkZTzQbfD/9r4U2FXD+B
 N8WvblJvJZ1rNbJNcxLbRxC+QgTCsUSKpMZv3yWdO7Auno+CpMoCcg1eFtLaPQTubjbM
 1nqpmqvRDyvm2YSvO4A2193N0PrZADcSC7gDNG4bx3UlIxuQhHezfzX2q+wfagl1kdut
 DuxIz1TH1a8RrNj1ueDGjZ1jVF35nuYuuna1BtCzx8fXXFAYwXCFlCdMkY1jyTI7yJ+g
 QOaxogOoN6fWoHht3Ag96kygcBYLRlBtHa9H0WXXSf5dfYvXnObcKngxyYspj69cfTuT
 ZisQ==
X-Gm-Message-State: APjAAAX+ILoL1tcnqHqwskh9DAcZtMy/1KcTwJQDBdmSV4hz2XKz0d13
 BNtPa5QFvs0FaljoiAls4eZNPvQMv9v80vHE7pgN2g==
X-Google-Smtp-Source: APXvYqxQjVrzoCeL6L4KHpLXuAIIoAai4JlsMWOYefX4hqGGu7mkiavfm3JE86Sp3YUok2L/Ps2IUpK+ghjSMUbbU7I=
X-Received: by 2002:a0c:b66f:: with SMTP id q47mr23601745qvf.102.1559103577129; 
 Tue, 28 May 2019 21:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190519092537.69053-1-jitao.shi@mediatek.com>
 <20190519092537.69053-2-jitao.shi@mediatek.com>
In-Reply-To: <20190519092537.69053-2-jitao.shi@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 29 May 2019 12:19:11 +0800
Message-ID: <CAJMQK-jST7mtoo-1C-8hU+O4x+_gOF0CuwToPwc=HJe86HDRHA@mail.gmail.com>
Subject: Re: [v3 1/7] drm/mediatek: move mipi_dsi_host_register to probe
To: Jitao Shi <jitao.shi@mediatek.com>
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FnqQyLt42DZ9noxJLCU2V14s5enRSAf3rpEHwRX9Kzo=;
 b=hYOi8BkFEY0SXxqQqLEZF9NnP9Pbvi1wS7yC9BK9JmRFXUan60kY7zFDXyLITqTDUS
 7ll6TdMYTzb7zrvvduAaFLWu3eONcUAliDarfOiByT5Tx+eF5Mcj8TPYuztHIg075hAh
 AaICUAmx02EeefvpAqjSqQcUnil3D9/4DGJhU=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, Sean Paul <seanpaul@chromium.org>,
 linux-pwm@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 eddie.huang@mediatek.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>,
 Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgMTksIDIwMTkgYXQgOToyNSBBTSBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRp
YXRlay5jb20+IHdyb3RlOgoKPiBAQCAtMTA0NSwxMiArMTA0NSw2IEBAIHN0YXRpYyBpbnQgbXRr
X2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lk
ICpkYXRhKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICAgICAgICAgfQo+Cj4gLSAg
ICAgICByZXQgPSBtaXBpX2RzaV9ob3N0X3JlZ2lzdGVyKCZkc2ktPmhvc3QpOwo+IC0gICAgICAg
aWYgKHJldCA8IDApIHsKPiAtICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8g
cmVnaXN0ZXIgRFNJIGhvc3Q6ICVkXG4iLCByZXQpOwo+IC0gICAgICAgICAgICAgICBnb3RvIGVy
cl9kZHBfY29tcF91bnJlZ2lzdGVyOwo+IC0gICAgICAgfQo+IC0KPiAgICAgICAgIHJldCA9IG10
a19kc2lfY3JlYXRlX2Nvbm5fZW5jKGRybSwgZHNpKTsKPiAgICAgICAgIGlmIChyZXQpIHsKPiAg
ICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJFbmNvZGVyIGNyZWF0ZSBmYWlsZWQgd2l0aCAlZFxu
IiwgcmV0KTsKPiBAQCAtMTA2MCw4ICsxMDU0LDYgQEAgc3RhdGljIGludCBtdGtfZHNpX2JpbmQo
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCj4g
ICAgICAgICByZXR1cm4gMDsKPgo+ICBlcnJfdW5yZWdpc3RlcjoKPiAtICAgICAgIG1pcGlfZHNp
X2hvc3RfdW5yZWdpc3RlcigmZHNpLT5ob3N0KTsKPiAtZXJyX2RkcF9jb21wX3VucmVnaXN0ZXI6
Cj4gICAgICAgICBtdGtfZGRwX2NvbXBfdW5yZWdpc3Rlcihkcm0sICZkc2ktPmRkcF9jb21wKTsK
PiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPiBAQCAtMTA5NywzMSArMTA4OSwzNyBAQCBzdGF0
aWMgaW50IG10a19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPgo+ICAg
ICAgICAgZHNpLT5ob3N0Lm9wcyA9ICZtdGtfZHNpX29wczsKPiAgICAgICAgIGRzaS0+aG9zdC5k
ZXYgPSBkZXY7Cj4gKyAgICAgICBkc2ktPmRldiA9IGRldjsKPiArICAgICAgIHJldCA9IG1pcGlf
ZHNpX2hvc3RfcmVnaXN0ZXIoJmRzaS0+aG9zdCk7Cj4gKyAgICAgICBpZiAocmV0IDwgMCkgewo+
ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciBEU0kgaG9z
dDogJWRcbiIsIHJldCk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICB9
Cj4KU2luY2UgbWlwaV9kc2lfaG9zdF9yZWdpc3RlcigpIGlzIG1vdmVkIGZyb20gLmJpbmQgdG8g
LnByb2JlLAptaXBpX2RzaV9ob3N0X3VucmVnaXN0ZXIoKSBzaG91bGQgYWxzbyBiZSBtb3ZlZCBm
cm9tIC51bmJpbmQgdG8KLnJlbW92ZT8KClRoYW5rcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
