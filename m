Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A9F2775B
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 09:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D20897B5;
	Thu, 23 May 2019 07:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B0B897B5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 07:45:45 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id p26so7882205edr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 00:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zcZNWFhbFfJQ2YJR3RMy8RLxv+am/SNxNspWdV0HcRU=;
 b=p16PrPKaKJT1bMGQtPg+si9WpOLWySSH2wrjInbvtNGNKwVyehJIxvi5RpneHfP0l9
 J9b+vWOKIeIP5Pb1FgR9WeSdgBD74jTGo20q5YUYT/53NmBRgl9gAQ6/xi1kECMFEIzJ
 rBI8VwM4wJABVRZcjzWa0/Yco+xmH1CYwnVoI+Llq1Tmw/qzQNEKzNFmQNQPC3KFdQqN
 kGv3aJYAu9kVduEc/W2YBUCPlMZD1M/LTl/O7NhoHp+TcmKX/hwwTuU+p9MCGQX0VTY2
 giQnt4gWR432vLX2oEbMpAQcdVoVJ7vDd8e77eht0rz4+pPg5Ulg0W6p+XnBUCQSJfn5
 3WBA==
X-Gm-Message-State: APjAAAUPshmjuw8VQKdH5uzKNGIMTKwO248yhxDh7qPTWh/qB+BvZdc+
 vmHbAYCSRLTP8lwExuvphh8SL6GnqEs=
X-Google-Smtp-Source: APXvYqyIA6/pDn65ga/NbnYYtcHCle4KuYHYZj/H84C9qmyJgGxlkRukQ9hS4BGkwQ3qLj+5fIFEHg==
X-Received: by 2002:a17:906:ecee:: with SMTP id
 qt14mr70874920ejb.96.1558597544061; 
 Thu, 23 May 2019 00:45:44 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id r14sm7742214eda.65.2019.05.23.00.45.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 00:45:43 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id w13so5039860wru.11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 00:45:43 -0700 (PDT)
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr1789132wrn.201.1558597238896; 
 Thu, 23 May 2019 00:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190523065013.2719D68B05@newverein.lst.de>
 <20190523065352.8FD7668B05@newverein.lst.de>
In-Reply-To: <20190523065352.8FD7668B05@newverein.lst.de>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 23 May 2019 15:40:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66+1+goJfnY7nWTGN2fupqMUm5o+gkPdUW6nxcwQEDwog@mail.gmail.com>
Message-ID: <CAGb2v66+1+goJfnY7nWTGN2fupqMUm5o+gkPdUW6nxcwQEDwog@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/bridge: extract some Analogix I2C DP common code
To: Torsten Duwe <duwe@lst.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMjo1NCBQTSBUb3JzdGVuIER1d2UgPGR1d2VAbHN0LmRl
PiB3cm90ZToKPgo+IEZyb206IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPgo+IFNv
bWUgY29kZSBjYW4gYmUgc2hhcmVkIHdpdGhpbiBkaWZmZXJlbnQgRFAgYnJpZGdlcyBieSBBbmFs
b2dpeC4KPgo+IEV4dHJhY3QgdGhlbSB0byBhIG5ldyBtb2R1bGUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4gU2lnbmVkLW9mZi1ieTogVmFzaWx5
IEtob3J1emhpY2sgPGFuYXJzb3VsQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBUb3JzdGVu
IER1d2UgPGR1d2VAc3VzZS5kZT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9LY29uZmlnICAgICAgICAgICAgfCAgIDQgKwo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2FuYWxvZ2l4L01ha2VmaWxlICAgICAgICAgICB8ICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4eC5jIHwgMTQ2ICstLS0tLS0tLS0tLS0tLS0t
LQo+ICAuLi4vZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtaTJjLWRwdHguYyAgICB8
IDE2OSArKysrKysrKysrKysrKysrKysrKysKPiAgLi4uL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L2FuYWxvZ2l4LWkyYy1kcHR4LmggICAgfCAgIDIgKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDE3OCBp
bnNlcnRpb25zKCspLCAxNDUgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWkyYy1kcHR4LmMKPgoKLi4uCgo+
ICBzdGF0aWMgaW50IGFueDc4eHhfc2V0X2hwZChzdHJ1Y3QgYW54Nzh4eCAqYW54Nzh4eCkKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1pMmMt
ZHB0eC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1pMmMtZHB0
eC5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjljYjMwOTYy
MDMyZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxv
Z2l4L2FuYWxvZ2l4LWkyYy1kcHR4LmMKPiBAQCAtMCwwICsxLDE2OSBAQAo+ICsvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsvKgo+ICsgKiBDb3B5cmlnaHQoYykgMjAxNyBJ
Y2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4gKyAqCj4gKyAqIEJhc2VkIG9uIGFuYWxv
Z2l4LWFueDc4eHguYywgd2hpY2ggaXM6Cj4gKyAqICAgQ29weXJpZ2h0KGMpIDIwMTYsIEFuYWxv
Z2l4IFNlbWljb25kdWN0b3IuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCgpJZiB0aGlzIHdhcyBzaW1w
bGUgY29kZSBtb3ZlbWVudCwgdGhlbiB0aGUgb3JpZ2luYWwgY29weXJpZ2h0IHN0aWxsIGFwcGxp
ZXMuCkEgZGlmZmVyZW50IGNvcHlyaWdodCBub3RpY2Ugc2hvdWxkIG5vdCBiZSB1c2VkLiBJIHN1
cHBvc2UgdGhlIHNhbWUgYXBwbGllcwp0byB0aGUgbW9kdWxlIGF1dGhvci4KCkNoZW5ZdQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
