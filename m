Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2893DAFF9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 16:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990E96EA7C;
	Thu, 17 Oct 2019 14:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC246EA7C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 14:24:33 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id m13so910596ywa.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 07:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r3GlawNJIAcrX8H3Hr8ORPfwvIhJBEPfZcTTE2swoHc=;
 b=me/rLYKLOtJoLN9Ap8K4cpt+ioAwUG73uHh2/awrmJ5flhd+M0PRgOmrn8NMzeAd+/
 pTCtzmKdMHQCw8tsbygi5wolmNdXJAvu0vmm47IQdg/YeHF4IYOIATjCXqJiuQj0zAQV
 Q7zNllMPMnO+5GKmUF53Zc1it1u3kWRyAPIvvduTi09ZTMVS6BESlc6Gmnp7Dm8WrDWi
 5vhl8Y00E8cYU9PmPb6w4UJQLAfjazpP1QnNRCeqXGx2sE5ZiQTujtpDbZ5sW7o6w6DE
 kEbH0E4+obidRZQU2rjzyn/jQgS5RfBXS208cXygMB1d8XdMbGaUHOitK38T0vLs+9tf
 Mu2w==
X-Gm-Message-State: APjAAAXw0XwH9+ZAgqus/sq6NA4HOVR2racCPzx2XtqJJIpRpg9ZQo5L
 YRs2WNU34ZwHJkTXQVh7Aw92Zg==
X-Google-Smtp-Source: APXvYqxuR5E1eHV2hdFDn3/VsCy5UZmQ2lKvVQqIemjwV0fqE4IZgTDKJaaF7vLbFCQc7Fq47K6fkg==
X-Received: by 2002:a0d:db51:: with SMTP id d78mr2970299ywe.310.1571322272594; 
 Thu, 17 Oct 2019 07:24:32 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id h18sm526322ywm.68.2019.10.17.07.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 07:24:32 -0700 (PDT)
Date: Thu, 17 Oct 2019 10:24:31 -0400
From: Sean Paul <sean@poorly.run>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] drm/mipi_dbi: Use simple right shift instead of
 double negation
Message-ID: <20191017142431.GB85762@art_vandelay>
References: <20191017114912.61522-1-andriy.shevchenko@linux.intel.com>
 <20191017131052.GA85762@art_vandelay>
 <20191017140054.GN32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017140054.GN32742@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=r3GlawNJIAcrX8H3Hr8ORPfwvIhJBEPfZcTTE2swoHc=;
 b=QVh33tgNvPt4TKOuYyeo+aXAtw6UzeomPDCDXORvBrZ13gcwU9mfvOZQ8FtXbQWC4W
 mOYIisyeKQQRTnPMVmHaDapUNwTkZArGx6Ah7iKqWMwz99+gUBeIi0txIglri/2Wq6+7
 RRTuDjSiZxeV8rUoGLIfrHD9rYSetWLb2UdNJjowchX2JEq1jXTGigoSeZ0EkPo9Caru
 NY2/dwJwToP3+mHRfMjwyqC3341+DCBZxsSJN337rxe2sfFZ9lWB5M8gNU4ruFoVs2AB
 avzSaJZ0GSFK6bd10kSStMcxTcAoXXvkUyE+4XYwj67c4+u9nWGBUOAW6KumGLZPTI3p
 Cnog==
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDU6MDA6NTRQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDA5OjEwOjUyQU0gLTA0MDAsIFNlYW4g
UGF1bCB3cm90ZToKPiA+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDAyOjQ5OjEyUE0gKzAzMDAs
IEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiA+ID4gR0NDIGNvbXBsYWlucyBhYm91dCBkdWJpb3Vz
IGJpdHdpc2UgT1Igb3BlcmFuZDoKPiA+ID4gCj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9kcm1fbWlw
aV9kYmkuYzoxMDI0OjQ5OiB3YXJuaW5nOiBkdWJpb3VzOiB4IHwgIXkKPiA+ID4gICBDQyBbTV0g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkubwo+ID4gPiAKPiA+ID4gQXMgbG9uZyBhcyBi
dWZmZXIgaXMgY29uc2lzdCBvZiBieXRlICh1OCkgdmFsdWVzLCB3ZSBtYXkgdXNlCj4gPiA+IHNp
bXBsZSByaWdodCBzaGlmdCBhbmQgc2F0aXNmeSBjb21waWxlci4gSXQgYWxzbyByZWR1Y2VzIGFt
b3VudCBvZgo+ID4gPiBvcGVyYXRpb25zIG5lZWRlZC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgo+
ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYyB8IDIgKy0KPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiAK
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYwo+ID4gPiBpbmRleCAxOTYxZjcxM2FhYWIuLjQ0NWU4
OGIxZmM5YSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5j
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYwo+ID4gPiBAQCAtMTAy
MSw3ICsxMDIxLDcgQEAgc3RhdGljIGludCBtaXBpX2RiaV90eXBlYzNfY29tbWFuZF9yZWFkKHN0
cnVjdCBtaXBpX2RiaSAqZGJpLCB1OCAqY21kLAo+ID4gPiAgCQl1bnNpZ25lZCBpbnQgaTsKPiA+
ID4gIAo+ID4gPiAgCQlmb3IgKGkgPSAwOyBpIDwgbGVuOyBpKyspCj4gPiA+IC0JCQlkYXRhW2ld
ID0gKGJ1ZltpXSA8PCAxKSB8ICEhKGJ1ZltpICsgMV0gJiBCSVQoNykpOwo+ID4gPiArCQkJZGF0
YVtpXSA9IChidWZbaV0gPDwgMSkgfCAoYnVmW2kgKyAxXSA+PiA3KTsKPiA+IAo+ID4gWW91IHNo
b3VsZCBwcm9iYWJseSBoYXZlICgoYnVmW2kgKyAxXSA+PiA3KSAmIDB4MSkgdG8gYmUgc3VwZXIg
c2FmZS4KPiAKPiBUaGlzIGlzIHN1cGVyZmx1b3VzIGFzIGxvbmcgYXMgYnVmIGlzIGRlY2xhcmVk
IGFzIHU4IChzZWUgY29tbWl0IG1lc3NhZ2UpLgo+IAoKWWVhaCwgSSBzYXcgdGhhdCwgaGVuY2Ug
dGhlICJzdXBlciBzYWZlIiBjb21tZW50LiBNeSBwb2ludCBpcyB0aGF0IHdyaXRpbmcgdGhhdApk
aXNjbGFpbWVyIGluIHRoZSBjb21taXQgbWVzc2FnZSBkb2Vzbid0IGFjdHVhbGx5IHByb3RlY3Qg
dGhlIG9wZXJhdGlvbiBpZiB0aGUKdHlwZSBjaGFuZ2VzLCB3aGlsZSBtYXNraW5nIG9mZiB0aGUg
Zmlyc3QgYml0IGRvZXMuCgo+ID4gRG8geW91IGtub3cgYW55dGhpbmcgYWJvdXQgdGhpcyBjb2Rl
PyBJdCBzZWVtcyBsaWtlIG5vdGhpbmcgaXMgcHJvdGVjdGluZyB1cwo+ID4gZnJvbSBvdmVycnVu
bmluZyBidWYgaW4gdGhpcyBsb29wLiBXZSdyZSBqdXN0IGFzc3VtaW5nIHRoYXQgbGVuIDwgdHJb
MV0ubGVuCj4gPiB0aHJvdWdoIHRoaXMgbG9vcCBhbmQgSSdtIG5vdCBzdXJlIHdoYXQncyBwcm90
ZWN0aW5nIHVzIGZyb20gbG9va2luZyB3aGVyZSB3ZQo+ID4gc2hvdWxkbid0Lgo+IAo+IEl0IEkn
bSBub3QgbWlzdGFrZW4gdGhpcyBpcyB0aGUgY2FzZSwgd2UgaGF2ZSBpdCBzdHJvbmcgbGVzcyB0
aGFuIHRyYW5zZmVyCj4gbGVuZ3RoLgo+IAoKVGhhbmtzLCBJIGxvb2tlZCBhdCB0aGUgY29kZSBh
bmQgeW91J3JlIHJpZ2h0LiBUaGUgcG9zc2libGUgdmFsdWVzIG9mIHRyWzFdLmxlbiBhcmUKbGVu
IG9yIGxlbiArIDEuCgpTZWFuCgo+IAo+IC0tIAo+IFdpdGggQmVzdCBSZWdhcmRzLAo+IEFuZHkg
U2hldmNoZW5rbwo+IAo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2ds
ZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
