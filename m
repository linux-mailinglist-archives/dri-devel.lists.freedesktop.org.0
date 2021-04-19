Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DFC3640C3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 13:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0656E24E;
	Mon, 19 Apr 2021 11:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E5B6E24E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNNDgS/DJt2QoriZuV2s4KpJFXyuczWKmKTdkPTzwJc=;
 b=GV5b9jgOPC6wyHw6L97sPQJ1K9s0dHlGDCdfs9aLhVycdXXr9qGdvvWO0qg0ZMi2+Bye65
 SVod2wF3HcciilqSc+6P+GG20OY+WQ/m+ah1xdregCx9lV2IbXXyfgfH+2C0G9e2oaBiGW
 juE/yN84nX1hUZZg91ptzMsjO8m/OrA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-O9XEQ1ZdOYyH7RqFyXVxCQ-1; Mon, 19 Apr 2021 07:46:13 -0400
X-MC-Unique: O9XEQ1ZdOYyH7RqFyXVxCQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 l18-20020a0560000232b02901026f4b8548so8936831wrz.10
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 04:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZNNDgS/DJt2QoriZuV2s4KpJFXyuczWKmKTdkPTzwJc=;
 b=mCT7YBOxsgYCssh5vQQEp3DIu8R/CudS9zNztPxP18t/5vvX5nVpyPPyQMbuI4e5Eb
 EhWCW2Reyo6fhBXvjiDzg8MVxWjBvuZyfi8W199vMqJIrxUxy8i2eqNR5MJEBxvwkroh
 iHJyYrRpygkZiVWOU8F51DxTPSQoS3wnpXdqS+sAWb77iLuoKOslt/ThbcWkoh6BkCxR
 5yW0WqrW4xdXVRrTtIO1+ITb7Ggi5LTGjSeuJAFncOK9nyFkNroUq9E9QitdJe/MGcA6
 waGk8EPPtCEHj+AKgTs9n+03d5K4dxHdl7+uUIkiLHMrcS6FzUt90DLSICPe1OjeHTGV
 m9AA==
X-Gm-Message-State: AOAM5316+e+eugPpFFK3bLJirOUCQ6FkBt3XPq/1iE1qGE2Ks5m6sEbx
 J4lDyQnycxeCMCVdN0UbbwY2YSZB9ZgCIZeRhFJaVp2Jz2ygCK4Oxz/8Lg1lM8pfASkxkXz4MHl
 1+HHPaMTXcodK6e2zSfuJHXXdVIlEpsqQ/ZCnRXjMjHbk
X-Received: by 2002:a1c:b656:: with SMTP id g83mr21220079wmf.163.1618832772824; 
 Mon, 19 Apr 2021 04:46:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc36e3XbifOKjDUWSKMAEVxvDyobteKY+iWwQTENq4j97KWY9GuD+Osi2UrIND/jrqWxZZjJydw+YBSnHR6jQ=
X-Received: by 2002:a1c:b656:: with SMTP id g83mr21220070wmf.163.1618832772716; 
 Mon, 19 Apr 2021 04:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-11-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-11-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:46:02 +0200
Message-ID: <CACO55tu=3H=vEcE6zDA951CqQf1wmKJrVMvBy=EEpp+R5MZG0w@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 10/40] drm/nouveau/dispnv50/disp: Remove unused
 variable 'ret' from function returning void
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMTYsIDIwMjEgYXQgNDozOCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzog
SW4gZnVuY3Rpb24g4oCYbnY1MF9tc3RtX2NsZWFudXDigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzoxMzU3OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKA
mSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+CgpzYW1lIGNv
bW1lbnQgaGVyZTogd2Ugc2hvdWxkIHJlYWxseSBjaGVjayBpZiBpdCdzIGJldHRlciB0byBoYW5k
bGUgdGhlCmVycm9yIGFuZCByZXBvcnQgaXQgYmFjayB0aGF0IHNvbWV0aGluZyBmYWlsZWQgb3Ig
c28uLgoKPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IENjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBub3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUw
L2Rpc3AuYyB8IDUgKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNw
bnY1MC9kaXNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiBp
bmRleCA0ODAxYWFmZDk1NTJiLi4zNTFmOTU0OTg5NTMwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwo+IEBAIC0xMzg2LDEyICsxMzg2LDExIEBAIG52NTBfbXN0
bV9jbGVhbnVwKHN0cnVjdCBudjUwX21zdG0gKm1zdG0pCj4gIHsKPiAgICAgICAgIHN0cnVjdCBu
b3V2ZWF1X2RybSAqZHJtID0gbm91dmVhdV9kcm0obXN0bS0+b3V0cC0+YmFzZS5iYXNlLmRldik7
Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7Cj4gLSAgICAgICBpbnQgcmV0
Owo+Cj4gICAgICAgICBOVl9BVE9NSUMoZHJtLCAiJXM6IG1zdG0gY2xlYW51cFxuIiwgbXN0bS0+
b3V0cC0+YmFzZS5iYXNlLm5hbWUpOwo+IC0gICAgICAgcmV0ID0gZHJtX2RwX2NoZWNrX2FjdF9z
dGF0dXMoJm1zdG0tPm1ncik7Cj4gKyAgICAgICBkcm1fZHBfY2hlY2tfYWN0X3N0YXR1cygmbXN0
bS0+bWdyKTsKPgo+IC0gICAgICAgcmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQyKCZt
c3RtLT5tZ3IpOwo+ICsgICAgICAgZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQyKCZtc3RtLT5t
Z3IpOwo+Cj4gICAgICAgICBkcm1fZm9yX2VhY2hfZW5jb2RlcihlbmNvZGVyLCBtc3RtLT5vdXRw
LT5iYXNlLmJhc2UuZGV2KSB7Cj4gICAgICAgICAgICAgICAgIGlmIChlbmNvZGVyLT5lbmNvZGVy
X3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9EUE1TVCkgewo+IC0tCj4gMi4yNy4wCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IE5vdXZlYXUgbWFp
bGluZyBsaXN0Cj4gTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
