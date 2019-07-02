Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7685CD18
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 11:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F06897E9;
	Tue,  2 Jul 2019 09:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3328A897E9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 09:58:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s15so273732wmj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 02:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QRPK0qOkX5Q+M8nvo0n2KeWKFtd7tJOQgBeJJuKeUes=;
 b=pMAqXK1RYrYfpWGM0AbTZKrnQqSE3aJYUgK6cnN5IQLswe5CbF1aAan4u4XIhAnMBV
 Pvhu4z9LOUB7182h34883eS0LXcj0g6/rjDBF67ilNiUFbmSg9SiCASe8hsXcbPVqIn+
 6tmpupFwsTnl7sX0rOZCP5TuYpE6gyd4HdJrlfRKFVOCeasThu1BAPX9CgDcDuD58qXS
 bKikesN4any6IrILwJWKXpFtIfikMqrx/UvYAcQ97AoFHksQURpt0xBk/P9bN+yUzF/w
 5UckFfhRv1FdKhYCPwFtI3MQfn9PhUkBaFVP84+MvTxKN3ZNQsxlQFUebnmRyb5B10yp
 09jQ==
X-Gm-Message-State: APjAAAUszi9LqTBI/gUSWTYgmm7OAs+Db6NFVMVL0EDyfOJFsoMOsf8p
 ovMxayhCs0zC5aFmgsVc2+Locw==
X-Google-Smtp-Source: APXvYqxfrHc8PV4pwgQMDK4hyRg+o6rg2wqmTnwa6gQYNet/g493PWh1vk4Ow79EN1QphwjQ8Ag8Gw==
X-Received: by 2002:a1c:6154:: with SMTP id v81mr2812406wmb.92.1562061531646; 
 Tue, 02 Jul 2019 02:58:51 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id y1sm1969442wma.32.2019.07.02.02.58.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 02:58:51 -0700 (PDT)
Date: Tue, 2 Jul 2019 10:58:49 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH 4/4] devicetree: Add led-backlight binding
Message-ID: <20190702095849.fxlmiqcioihsi3zk@holly.lan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701151423.30768-5-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QRPK0qOkX5Q+M8nvo0n2KeWKFtd7tJOQgBeJJuKeUes=;
 b=EfsmAl9xsk75PZQw1eUJrpmqGtNjtNVcKtdZ3k0Y5L5V8C0VwhUTn6oLj7Z/kwj7xA
 vebq/nBTJvTA3LEqmGJqGE4/JbzssjqYL5LEGjotpbgHycm6BAcppyawnkXy9PlrRg3L
 m1yg8jPukP5KaUGgNhlmW2IACKW10DFYGZDvLG2OAuBzYnmd0hc5m3Now6tquOQG5H3I
 Zc13t3OA3JOiOIDSGmQFaiGawELStthwhCUQZCpAS8Jx3RYX8uenqVmDEERYoVNDehFe
 VEg/hOOQzY0MtOtH+Wx+lVUIQFYeJA5Hrncc+tNoLHvy1COFp6pAoyse9mfU6KYMBU3i
 ZVeg==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jingoohan1@gmail.com,
 tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMDU6MTQ6MjNQTSArMDIwMCwgSmVhbi1KYWNxdWVzIEhp
YmxvdCB3cm90ZToKPiBGcm9tOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29t
Pgo+IAo+IEFkZCBEVCBiaW5kaW5nIGZvciBsZWQtYmFja2xpZ2h0LgoKSSB0aGluayB0aGUgcGF0
Y2hzZXQgaXMgaW4gdGhlIHdyb25nIG9yZGVyOyB0aGUgRFQgYmluZGluZ3MKZG9jdW1lbnRhdGlv
biBzaG91bGQgYXBwZWFyICpiZWZvcmUqIHRoZSBiaW5kaW5nIGlzCmltcGxlbWVudGVkIChhbW91
bmcgb3RoZXIgdGhpbmdzIHRoaXMgcHJldmVudCB0cmFuc2llbnQgY2hlY2twYXRjaAp3YXJuaW5n
cyBhcyB0aGUgcGF0Y2hzZXQgaXMgYXBwbGllZCkuCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUb21p
IFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEplYW4t
SmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmcKPiAtLS0KPiAgLi4uL3ZpZGVvL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dCAg
ICAgICAgIHwgMzkgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5z
ZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3ZpZGVvL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+IAo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmlkZW8vYmFja2xpZ2h0L2xl
ZC1iYWNrbGlnaHQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZpZGVv
L2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi4yMTZjZDUyZDYyNGEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZpZGVvL2JhY2tsaWdodC9sZWQtYmFja2xp
Z2h0LnR4dAo+IEBAIC0wLDAgKzEsMzkgQEAKPiArbGVkLWJhY2tsaWdodCBiaW5kaW5ncwo+ICsK
PiArVGhlIG5vZGUgb2YgdGhlIGJhY2tsaWdodCBkcml2ZXIgSVMgdGhlIG5vZGUgb2YgdGhlIExF
RC4KPiArCj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gKyAgLSBjb21wYXRpYmxlOiAibGVkLWJh
Y2tsaWdodCIKPiArICAtIGJyaWdodG5lc3MtbGV2ZWxzOiBBcnJheSBvZiBkaXN0aW5jdCBMRUQg
YnJpZ2h0bmVzcyBsZXZlbHMuIFRoZXNlCj4gKyAgICAgIGFyZSBpbiB0aGUgcmFuZ2UgZnJvbSAw
IHRvIDI1NSwgcGFzc2VkIHRvIHRoZSBMRUQgY2xhc3MgZHJpdmVyLgo+ICsgIC0gZGVmYXVsdC1i
cmlnaHRuZXNzLWxldmVsOiB0aGUgZGVmYXVsdCBicmlnaHRuZXNzIGxldmVsIChpbmRleCBpbnRv
IHRoZQo+ICsgICAgICBhcnJheSBkZWZpbmVkIGJ5IHRoZSAiYnJpZ2h0bmVzcy1sZXZlbHMiIHBy
b3BlcnR5KQoKSSB0aGluayBicmlnaHRuZXNzLWxldmVscyBhbmQgZGVmYXVsdC1icmlnaHRuZXNz
LWxldmVsIGNvdWxkIGJlCm9wdGlvbmFsIHByb3BlcnRpZXMgc2luY2UgYSBkZWZhdWx0IDE6MSBt
YXBwaW5nIHNlZW1zIHJlYXNvbmFibGUgZ2l2ZW4KaG93IGNvbnN0cmFpbmVkIHRoZSBMRUQgYnJp
Z2h0bmVzcyB2YWx1ZXMgYXJlLgoKCkRhbmllbC4KCgo+ICsKPiArT3B0aW9uYWwgcHJvcGVydGll
czoKPiArICAtIHBvd2VyLXN1cHBseTogcmVndWxhdG9yIGZvciBzdXBwbHkgdm9sdGFnZQo+ICsg
IC0gZW5hYmxlLWdwaW9zOiBjb250YWlucyBhIHNpbmdsZSBHUElPIHNwZWNpZmllciBmb3IgdGhl
IEdQSU8gd2hpY2ggZW5hYmxlcwo+ICsgICAgICAgICAgICAgICAgICBhbmQgZGlzYWJsZXMgdGhl
IGJhY2tsaWdodCAoc2VlIEdQSU8gYmluZGluZ1swXSkKPiArCj4gK1swXTogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vZ3Bpby50eHQKPiArCj4gK0V4YW1wbGU6Cj4gKwo+
ICtsZWRfY3RybCB7Cj4gKwlyZWRfbGVkQDEgewo+ICsJICAgICAgICBsYWJlbCA9ICJyZWQiOwo+
ICsJCXJlZyA9IDwxPjsKPiArCX0KPiArCj4gKwliYWNrbGlnaHRfbGVkQDIgewo+ICsJCWZ1bmN0
aW9uID0gTEVEX0ZVTkNUSU9OX0JBQ0tMSUdIVDsKPiArCQlyZWcgPSA8Mj47Cj4gKwo+ICsJCWNv
bXBhdGlibGUgPSAibGVkLWJhY2tsaWdodCI7Cj4gKwo+ICsJCWJyaWdodG5lc3MtbGV2ZWxzID0g
PDAgNCA4IDE2IDMyIDY0IDEyOCAyNTU+Owo+ICsJCWRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbCA9
IDw2PjsKPiArCj4gKwkJcG93ZXItc3VwcGx5ID0gPCZ2ZGRfYmxfcmVnPjsKPiArCQllbmFibGUt
Z3Bpb3MgPSA8JmdwaW8gNTggMD47Cj4gKwl9Owo+ICt9Owo+IC0tIAo+IDIuMTcuMQo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
