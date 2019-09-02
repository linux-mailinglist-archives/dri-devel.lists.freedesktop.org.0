Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC7DA52D8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 11:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178C28997C;
	Mon,  2 Sep 2019 09:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AE28997C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 09:31:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t17so13756053wmi.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 02:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=r8AwJSmMaHIEN05eTIkJ4SIO7fhuuHmNGUIve5f+2G0=;
 b=QgsPdyBJcJWG+0X8OpOS7u5JknpipFbICl/VGSiKhe6lOpGd+t0wr9LUbpkOSi48F8
 N4dmHSAUqoLEQ/TOCbJghYUfjBoaCwOyM6af4UH9eDY0Zmq6bahb+/61y0d4QfcB/E5G
 sjzMwyGz37Gb28t3/hiVuvRNQl5FpJKvXPdX2hCKoe2Dg+GoAIQ7yEf7pBWa9AeYu9yU
 +V+9nLd2W1uP2lRmwYb2GF2ymjHagDQZjTjxsWJoNjhNdC8njGHSB4MSG6Rh2435Z91a
 PnAWbB5coX7GtGbvG5BBl8CqakkzWqKZIWgwGx9sky0vKbg8rPM4I75IO0QqS7d9g1NV
 D/sQ==
X-Gm-Message-State: APjAAAV6EPW+sUTWoAmb2m472vyhTKxVCVrN27gnevY4xaftSNJc+of0
 7XYoqvVxwG15NAsQrt+3As7jIA==
X-Google-Smtp-Source: APXvYqwSoSdzmSThKSMRUEmWnqBIzy3JLEQjsMsy3WU0XrIZvapOFxa+yJldgHFiQ3VCIhTfJdp9Wg==
X-Received: by 2002:a1c:1f89:: with SMTP id
 f131mr33287131wmf.140.1567416699794; 
 Mon, 02 Sep 2019 02:31:39 -0700 (PDT)
Received: from dell ([95.147.198.93])
 by smtp.gmail.com with ESMTPSA id v186sm33030150wmb.5.2019.09.02.02.31.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Sep 2019 02:31:39 -0700 (PDT)
Date: Mon, 2 Sep 2019 10:31:37 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
Message-ID: <20190902093137.GI32232@dell>
References: <20190724082508.27617-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=r8AwJSmMaHIEN05eTIkJ4SIO7fhuuHmNGUIve5f+2G0=;
 b=Bt1VuYPsJX1pxqRR6NEEzZF0cAq3QqZSMeTnegdO8wAJVFRb/Jr0Ly4BgdgOysPSWb
 IZVVibSQpS0gOBIr0OUQUsZUwFVf97qS4uto28oZHVLLEWbqLvQ/+C9xlwxydZuudplm
 81UaLsko8zsLIGQXBw/VgDV7HZkHqUWUkEUWbs1UvWxFqMMsnxf+J2SceviM8fe7Ws7D
 QYXzlFLYLoRmtUnbMXQLOVXJVHdGzIcoMqNyU2TC4Psa6PULLHTj9RdtGxZtxSu3bTkm
 cnU2J3ip/ZBkcrqgo6YoEsJv/uU/p04nUgNpCOBqikubhWlYP2WpFFKnrv4ETvEbbXKA
 p5Dg==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNCBKdWwgMjAxOSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKCj4gRnJvbTog
QmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPiAKPiBXaGls
ZSB3b3JraW5nIG9uIG15IG90aGVyIHNlcmllcyByZWxhdGVkIHRvIGdwaW8tYmFja2xpZ2h0WzFd
IEkgbm90aWNlZAo+IHRoYXQgd2UgY291bGQgc2ltcGxpZnkgdGhlIGRyaXZlciBpZiB3ZSBtYWRl
IHRoZSBvbmx5IHVzZXIgb2YgcGxhdGZvcm0KPiBkYXRhIHVzZSBHUElPIGxvb2t1cHMgYW5kIGRl
dmljZSBwcm9wZXJ0aWVzLiBUaGlzIHNlcmllcyB0cmllcyB0byBkbwo+IHRoYXQuCj4gCj4gVGhl
IGZpcnN0IHBhdGNoIGFkZHMgYWxsIG5lY2Vzc2FyeSBkYXRhIHN0cnVjdHVyZXMgdG8gZWNvdmVj
MjQuIFBhdGNoCj4gMi83IHVuaWZpZXMgbXVjaCBvZiB0aGUgY29kZSBmb3IgYm90aCBwZGF0YSBh
bmQgbm9uLXBkYXRhIGNhc2VzLiBQYXRjaGVzCj4gMy00LzcgcmVtb3ZlIHVudXNlZCBwbGF0Zm9y
bSBkYXRhIGZpZWxkcy4gTGFzdCB0aHJlZSBwYXRjaGVzIGNvbnRhaW4KPiBhZGRpdGlvbmFsIGlt
cHJvdmVtZW50cyBmb3IgdGhlIEdQSU8gYmFja2xpZ2h0IGRyaXZlciB3aGlsZSB3ZSdyZSBhbHJl
YWR5Cj4gbW9kaWZ5aW5nIGl0Lgo+IAo+IEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhpcyBIVyBi
dXQgaG9wZWZ1bGx5IHRoaXMgd29ya3MuIE9ubHkgY29tcGlsZQo+IHRlc3RlZC4KPiAKPiBbMV0g
aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvNi8yNS85MDAKPiAKPiB2MSAtPiB2MjoKPiAtIHJl
YmFzZWQgb24gdG9wIG9mIHY1LjMtcmMxIGFuZCBhZGp1c3RlZCB0byB0aGUgcmVjZW50IGNoYW5n
ZXMgZnJvbSBBbmR5Cj4gLSBhZGRlZCBhZGRpdGlvbmFsIHR3byBwYXRjaGVzIHdpdGggbWlub3Ig
aW1wcm92ZW1lbnRzCj4gCj4gdjIgLT4gdjM6Cj4gLSBpbiBwYXRjaCA3Lzc6IHVzZWQgaW5pdGlh
bGl6ZXJzIHRvIHNldCB2YWx1ZXMgZm9yIHBkYXRhIGFuZCBkZXYgbG9jYWwgdmFycwo+IAo+IEJh
cnRvc3ogR29sYXN6ZXdza2kgKDcpOgo+ICAgc2g6IGVjb3ZlYzI0OiBhZGQgYWRkaXRpb25hbCBw
cm9wZXJ0aWVzIHRvIHRoZSBiYWNrbGlnaHQgZGV2aWNlCj4gICBiYWNrbGlnaHQ6IGdwaW86IHNp
bXBsaWZ5IHRoZSBwbGF0Zm9ybSBkYXRhIGhhbmRsaW5nCj4gICBzaDogZWNvdmVjMjQ6IGRvbid0
IHNldCB1bnVzZWQgZmllbGRzIGluIHBsYXRmb3JtIGRhdGEKPiAgIGJhY2tsaWdodDogZ3Bpbzog
cmVtb3ZlIHVudXNlZCBmaWVsZHMgZnJvbSBwbGF0Zm9ybSBkYXRhCj4gICBiYWNrbGlnaHQ6IGdw
aW86IHJlbW92ZSBkZXYgZnJvbSBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQKPiAgIGJhY2tsaWdodDog
Z3BpbzogcmVtb3ZlIGRlZl92YWx1ZSBmcm9tIHN0cnVjdCBncGlvX2JhY2tsaWdodAo+ICAgYmFj
a2xpZ2h0OiBncGlvOiB1c2UgYSBoZWxwZXIgdmFyaWFibGUgZm9yICZwZGV2LT5kZXYKPiAKPiAg
YXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jICAgICAgICAgfCAzMyArKysrKyst
LQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jICAgICB8IDgyICsr
KysrLS0tLS0tLS0tLS0tLS0tCj4gIGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncGlvX2Jh
Y2tsaWdodC5oIHwgIDMgLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDc0
IGRlbGV0aW9ucygtKQoKQ2FuIHlvdSBjb2xsZWN0IGFsbCB5b3VyIEFja3MgYW5kIHJlLXN1Ym1p
dCBwbGVhc2U/CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNo
bmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNv
Q3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
