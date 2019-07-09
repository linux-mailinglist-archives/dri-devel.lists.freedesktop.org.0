Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F7963368
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 11:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B8D89EFF;
	Tue,  9 Jul 2019 09:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0039D89EFF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 09:31:38 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v19so2417143wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 02:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yJGoyEUVe04ghlPBAiRSMxOfNeRDmZRLOGlGSZ3RhuY=;
 b=NLxLCgXKSzxRnGw6L8jUCwjurGnGiCFtalVWFPUUqttKUSaGcptz305h6tM1Ftpw1/
 lHaqbNfV6hV48NoToPeyPtLKTMc7z/6e6ciKyBMm3hYDYNtIWiXDK9y6SaUX9Vpdj489
 Apcp3qLlIYWBxVV2RC5vwMEVMLYGZ0LFvvXJYL2jjobEALZLeF6y5Y3zG9JgPvYetsh1
 TgR5wkxMjJPPXtGlyvrzvwZnQMrviIo4p0LMFxzjVGAyyAZh+HglZfz574WwILqyvlto
 LZW6ibtj2IEBlWV/FToD/lfXUBGyYZayqqOypoi1OgnZSzRrU8tCVcbTBcgXib6UzRWw
 ZSrw==
X-Gm-Message-State: APjAAAWf86kPp6tCOECpQk6M4w2ojGaklpttGHcFikIIZLilDceXljR2
 XmTQjUtFNIlZwmmpQk/fmnW5Zg==
X-Google-Smtp-Source: APXvYqxaKfA0IPSQWqpEN1DXOFT+NZh2VNo/h4XIwGQO9RD28/m5pNHRYx4x8r8Sj6hw0LG/HUd+3w==
X-Received: by 2002:a1c:1bd7:: with SMTP id b206mr16469516wmb.85.1562664697503; 
 Tue, 09 Jul 2019 02:31:37 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id c14sm15454547wrr.56.2019.07.09.02.31.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 02:31:36 -0700 (PDT)
Date: Tue, 9 Jul 2019 10:31:35 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v2 4/4] backlight: add led-backlight driver
Message-ID: <20190709093135.ceuj5tszmuri52w2@holly.lan>
References: <20190708102700.23138-1-jjhiblot@ti.com>
 <20190708102700.23138-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708102700.23138-5-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yJGoyEUVe04ghlPBAiRSMxOfNeRDmZRLOGlGSZ3RhuY=;
 b=rqnKeKFjvWV2+mKs3dFf/1L6IRTNBJkA4VnQHtXllGQzIsJlwefKhcgiFdS2J01ObC
 HoB3s69MZhZ6+Wt95wiTGoJdHI+oGi+6ATxt5S+sRw/dQzcPqEg2MUhcdiO9OnZskuj8
 XNAC6hB2+Uw/NSI7ARjYIErlAz5FAuiBDVbJSc8x7A7CV+W5emZwsJZlIuI7BNq/4lUt
 O1Hv0JKjg7zfpa6uuo2F/o21JcyaBSlseMFLej56n11uaasGBx/+1It0lmGBW4Vy9ABE
 Eg2EU957+uxwWq2RfZh98sjALcDFDUePr/2Azx/nBObLuxWReaUIIt2tIt6nf9e8I3gZ
 /5OQ==
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
Cc: mark.rutland@arm.com, jingoohan1@gmail.com, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMTI6Mjc6MDBQTSArMDIwMCwgSmVhbi1KYWNxdWVzIEhp
YmxvdCB3cm90ZToKPiBGcm9tOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29t
Pgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBhIGxlZC1iYWNrbGlnaHQgZHJpdmVyIChsZWRfYmwpLCB3
aGljaCBpcyBzaW1pbGFyIHRvCj4gcHdtX2JsIGV4Y2VwdCB0aGUgZHJpdmVyIHVzZXMgYSBMRUQg
Y2xhc3MgZHJpdmVyIHRvIGFkanVzdCB0aGUKPiBicmlnaHRuZXNzIGluIHRoZSBIVy4gTXVsdGlw
bGUgTEVEcyBjYW4gYmUgdXNlZCBmb3IgYSBzaW5nbGUgYmFja2xpZ2h0Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogSmVhbi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9LY29uZmlnICB8ICAgNyArCj4gIGRyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L01ha2VmaWxlIHwgICAxICsKPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVkX2Js
LmMgfCAyMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDI0MyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9sZWRfYmwuYwoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvbGVkX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sZWRfYmwuYwo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi43NjQ0Mjc3Y2ZkYmIKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVkX2JsLmMKPiBAQCAtMCww
ICsxLDIzNSBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsvKgo+
ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTUtMjAxOSBUZXhhcyBJbnN0cnVtZW50cyBJbmNvcnBvcmF0
ZWQgLSAgaHR0cDovL3d3dy50aS5jb20vCj4gKyAqIEF1dGhvcjogVG9taSBWYWxrZWluZW4gPHRv
bWkudmFsa2VpbmVuQHRpLmNvbT4KPiArICoKPiArICogQmFzZWQgb24gcHdtX2JsLmMKPiArICov
Cj4gKwo+ICsjaW5jbHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9n
cGlvL2NvbnN1bWVyLmg+CgpIZWFkZXIgc2hvdWxkIG5vIGxvbmdlciBiZSBuZWVkZWQuCgo+ICtz
dGF0aWMgaW50IGxlZF9ibF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICt7
Cj4gKwlzdHJ1Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMgcHJvcHM7Cj4gKwlzdHJ1Y3QgbGVkX2Js
X2RhdGEgKnByaXY7Cj4gKwlpbnQgcmV0Owo+ICsJaW50IGk7Cj4gKwo+ICsJcHJpdiA9IGRldm1f
a3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsKPiArCWlmICgh
cHJpdikKPiArCQlyZXR1cm4gLUVOT01FTTsKPiArCj4gKwlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShw
ZGV2LCBwcml2KTsKPiArCj4gKwlwcml2LT5kZXYgPSAmcGRldi0+ZGV2Owo+ICsKPiArCXJldCA9
IGxlZF9ibF9wYXJzZV9kdCgmcGRldi0+ZGV2LCBwcml2KTsKPiArCWlmIChyZXQgPCAwKSB7Cj4g
KwkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHBhcnNlIERUIGRhdGFcbiIpOwo+ICsJ
CXJldHVybiByZXQ7Cj4gKwl9Cj4gKwlwcml2LT5sZWRzID0gZGV2bV9remFsbG9jKCZwZGV2LT5k
ZXYsCj4gKwkJCQkgIHNpemVvZihzdHJ1Y3QgbGVkX2NsYXNzZGV2ICopICogcHJpdi0+bmJfbGVk
cywKPiArCQkJCSAgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIXByaXYtPmxlZHMpCj4gKwkJcmV0dXJu
IC1FTk9NRU07Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IHByaXYtPm5iX2xlZHM7IGkrKykgewo+
ICsJCXByaXYtPmxlZHNbaV0gPSBkZXZtX2xlZF9nZXQoJnBkZXYtPmRldiwgaSk7Cj4gKwkJaWYg
KElTX0VSUihwcml2LT5sZWRzW2ldKSkKPiArCQkJcmV0dXJuIFBUUl9FUlIocHJpdi0+bGVkc1tp
XSk7Cj4gKwl9Cj4gKwo+ICsJbWVtc2V0KCZwcm9wcywgMCwgc2l6ZW9mKHN0cnVjdCBiYWNrbGln
aHRfcHJvcGVydGllcykpOwo+ICsJcHJvcHMudHlwZSA9IEJBQ0tMSUdIVF9SQVc7Cj4gKwlwcm9w
cy5tYXhfYnJpZ2h0bmVzcyA9IHByaXYtPm1heF9icmlnaHRuZXNzOwo+ICsJcHJpdi0+YmxfZGV2
ID0gYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXZfbmFtZSgmcGRldi0+ZGV2KSwKPiArCQkJ
JnBkZXYtPmRldiwgcHJpdiwgJmxlZF9ibF9vcHMsICZwcm9wcyk7Cj4gKwlpZiAoSVNfRVJSKHBy
aXYtPmJsX2RldikpIHsKPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gcmVnaXN0
ZXIgYmFja2xpZ2h0XG4iKTsKPiArCQlyZXQgPSBQVFJfRVJSKHByaXYtPmJsX2Rldik7Cj4gKwkJ
Z290byBlcnI7Cgpnb3RvIGlzIHBvaW50bGVzcyBmb3IgYSBwdXJlLWRldm0gZnVuY3Rpb24uCgo+
ICsJfQo+ICsKPiArCXByaXYtPmJsX2Rldi0+cHJvcHMuYnJpZ2h0bmVzcyA9IHByaXYtPmRlZmF1
bHRfYnJpZ2h0bmVzczsKPiArCWJhY2tsaWdodF91cGRhdGVfc3RhdHVzKHByaXYtPmJsX2Rldik7
CgpUaGlzIHdpbGwgbGlnaHQgdXAgdGhlIGJhY2tsaWdodCBkdXJpbmcgYmFja2xpZ2h0IHByb2Jl
LgoKQ2FuIHlvdSB0YWtlIGEgbG9vayBhdCBwd21fYmFja2xpZ2h0X2luaXRpYWxfcG93ZXJfc3Rh
dGUoKSBhbmQgZGVjaWRlCmhvdyBtdWNoIG9mIGl0IGFwcGxpZXMgdG8gYW4gTEVEIGJhc2VkIGJh
Y2tsaWdodCAodGhlIHBoYW5kbGUgc3R1ZmYKY2VydGFpbmx5IGRvZXMpLgoKCkRhbmllbC4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
