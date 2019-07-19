Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872666E60C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 15:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C03A6E829;
	Fri, 19 Jul 2019 13:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7736E829
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 13:05:00 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id d4so34458214edr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 06:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=1Y5NlMhSpO0VyQx0ha3QqhFg3+xYgYUJ2KEPauiVoxY=;
 b=Yloc6wpKoW/CQ8LOsnIpVhq7fWjZsGwda9b+qUI31SsFemIeiwvx/B+Oi7dBzlQ3+h
 sMuCL+cS1G2/KeyLcGATcaPcq2atS+Nxtlv55TyBCnXM3DgVIkIxj52ghETw0lHzgA96
 3mh3xN3y1NDlVsZlTHZjKVWVmp+lzbjXTfNCclp/1FusiQUfjuyy/qUmLxoX5x9mLasl
 fzMwy+sigq17b8TTfTkM0GqSH+XL3+J4wuBxzLmvkLkPChgc1xEqdcn4oJG3JhBikLao
 Nwg79J66dSuxTNhtA2dX9KSt9OHB8nV1HOqt3LBxwldds5hyLaKjFwu5KQl2t7DOxn7a
 ocuQ==
X-Gm-Message-State: APjAAAXOvldzSecRM/brlDdFDGYBbJ2FoRau5vUIP9f6GXyM7iZOuUX8
 6C/WiuvaCx9jGe26OzvSZlc=
X-Google-Smtp-Source: APXvYqxPcBIc/kUti8pmP2meIW9/V9n5TtNotZwmEuAS3s2qNUF7hKzZkfvwNTTEOd1u4xQnQwRlhg==
X-Received: by 2002:a17:906:2510:: with SMTP id
 i16mr40718573ejb.130.1563541499029; 
 Fri, 19 Jul 2019 06:04:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id q14sm6151066eju.47.2019.07.19.06.04.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 06:04:57 -0700 (PDT)
Date: Fri, 19 Jul 2019 15:04:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: YueHaibing <yuehaibing@huawei.com>, james.qian.wang@arm.com,
 liviu.dudau@arm.com, brian.starkey@arm.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH -next] drm/komeda: remove set but not used variable 'old'
Message-ID: <20190719130455.GP15868@phenom.ffwll.local>
Mail-Followup-To: YueHaibing <yuehaibing@huawei.com>,
 james.qian.wang@arm.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20190709135808.56388-1-yuehaibing@huawei.com>
 <20190718185150.GC15868@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718185150.GC15868@phenom.ffwll.local>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1Y5NlMhSpO0VyQx0ha3QqhFg3+xYgYUJ2KEPauiVoxY=;
 b=ih1HuuGtn1KrC32/4Glz27f/kABjff30TWWMylH5ohzHv458wMCCVyI5IH0pDOT4ZD
 aoI+8KpssatKdCdvWeqrn69QCNgrHF/LPyVttmhWgGS7HTSY5xeViY5asiPDUQoJMdYU
 CxY2/dTEXR2NFxLCrK2rQJQF4xZDUnNlAGTMI=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDg6NTE6NTBQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIEp1bCAwOSwgMjAxOSBhdCAwOTo1ODowOFBNICswODAwLCBZdWVIYWli
aW5nIHdyb3RlOgo+ID4gRml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJu
aW5nOgo+ID4gCj4gPiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
bGFuZS5jOgo+ID4gIEluIGZ1bmN0aW9uIGtvbWVkYV9wbGFuZV9hdG9taWNfZHVwbGljYXRlX3N0
YXRlOgo+ID4gZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUu
YzoxNjE6MzU6Cj4gPiAgd2FybmluZzogdmFyaWFibGUgb2xkIHNldCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWJ1dC1zZXQtdmFyaWFibGUKPiA+IAo+ID4gSXQgaXMgbm90IHVzZWQgc2luY2UgY29t
bWl0IDk5MGRlZTNhYTQ1NiAoImRybS9rb21lZGE6Cj4gPiBDb21wdXRpbmcgaW1hZ2UgZW5oYW5j
ZXIgaW50ZXJuYWxseSIpCj4gPiAKPiA+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lA
aHVhd2VpLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVh
d2VpLmNvbT4KPiAKPiBRdWV1ZWQgZm9yIDUuMywgdGhhbmtzIGZvciB5b3VyIHBhdGNoLgoKQ29y
cmVjdGlvbiwgdGhpcyBkb2Vzbid0IGV2ZW4gY29tcGlsZS4gUGxlYXNlIGNvbXBpbGUtdGVzdCBw
YXRjaGVzIGJlZm9yZQpzdWJtaXR0aW5nLgoKVGhhbmtzLCBEYW5pZWwKCj4gLURhbmllbAo+IAo+
ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxh
bmUuYyB8IDQgLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5l
LmMKPiA+IGluZGV4IGMwOTVhZjEuLmMxMzgxYWMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCj4gPiBAQCAtMTU4LDgg
KzE1OCw2IEBAIHN0YXRpYyB2b2lkIGtvbWVkYV9wbGFuZV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5l
ICpwbGFuZSkKPiA+ICBzdGF0aWMgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqCj4gPiAga29tZWRh
X3BsYW5lX2F0b21pY19kdXBsaWNhdGVfc3RhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4g
PiAgewo+ID4gLQlzdHJ1Y3Qga29tZWRhX3BsYW5lX3N0YXRlICpuZXcsICpvbGQ7Cj4gPiAtCj4g
PiAgCWlmIChXQVJOX09OKCFwbGFuZS0+c3RhdGUpKQo+ID4gIAkJcmV0dXJuIE5VTEw7Cj4gPiAg
Cj4gPiBAQCAtMTY5LDggKzE2Nyw2IEBAIGtvbWVkYV9wbGFuZV9hdG9taWNfZHVwbGljYXRlX3N0
YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQo+ID4gIAo+ID4gIAlfX2RybV9hdG9taWNfaGVs
cGVyX3BsYW5lX2R1cGxpY2F0ZV9zdGF0ZShwbGFuZSwgJm5ldy0+YmFzZSk7Cj4gPiAgCj4gPiAt
CW9sZCA9IHRvX2twbGFuZV9zdChwbGFuZS0+c3RhdGUpOwo+ID4gLQo+ID4gIAlyZXR1cm4gJm5l
dy0+YmFzZTsKPiA+ICB9Cj4gPiAgCj4gPiAtLSAKPiA+IDIuNy40Cj4gPiAKPiA+IAo+IAo+IC0t
IAo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
PiBodHRwOi8vYmxvZy5mZndsbC5jaAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5l
ZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
