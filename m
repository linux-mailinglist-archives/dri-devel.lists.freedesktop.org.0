Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B87A7CBF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 09:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AC489247;
	Wed,  4 Sep 2019 07:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B80989247
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 07:27:16 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id p3so10732323pgb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 00:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-description:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=9Et9BlRt+SMSDP1Q6IJeQ3vF/J+SFCi5Hqn0dALv4Fc=;
 b=PY8RRLeUmQdux9bqytW9GbUxax8hnWOTI8BfuHZ+0r3f2XL60Woqqbp4AHvBB6Yybf
 cp1yq2Xx41EKksaUjEcrkEe3gKZuPohz0cGJMZ+mAQD9wqK0kI2KWnC3vlTGDDfL7/gm
 YdrKhDWAP+idsmpQKbSbUN/ET8IZoOlMMCSZYQr/lUu9U5UQA+KBOabk382rq+R/WqpX
 byiF1lQ4SpuISzGyEykaiU714zLS3JuopL+ylvpPaqJ6pMxH+jN5s48H8ybo+1TJGChO
 9IZUx0xF4BR3xhddqBpKb1j53/UN9C/396mFQWufFuhKx3nnqAPJTieZNG52j9VjwrrY
 pP0w==
X-Gm-Message-State: APjAAAV7Cwla9OmgNESOl+Ju0Ss+ooR2QnvJDvXLDDeOJMHelo4WmNQt
 R9B4nDNoaiQJR8LbZU32QgM=
X-Google-Smtp-Source: APXvYqwkQ5SISgCkfFL+sDJH0M8PJaVzOA5OiyCjQZB/W197lTkysqAIIuyoI3KzZxUXpS/uPgFEcw==
X-Received: by 2002:a63:1310:: with SMTP id i16mr33404702pgl.187.1567582035511; 
 Wed, 04 Sep 2019 00:27:15 -0700 (PDT)
Received: from raspberrypi ([61.83.141.141])
 by smtp.gmail.com with ESMTPSA id s76sm19416340pgc.92.2019.09.04.00.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 00:27:14 -0700 (PDT)
Date: Wed, 4 Sep 2019 08:27:07 +0100
From: Sidong Yang <realwakka@gmail.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/vkms: Use alpha value to blend values.
Message-ID: <20190904072707.GA29211@raspberrypi>
References: <20190831172546.GA1972@raspberrypi>
 <20190902122858.GU7482@intel.com>
MIME-Version: 1.0
Content-Description: ri-devel@lists.freedesktop.org,
Content-Disposition: inline
In-Reply-To: <20190902122858.GU7482@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-description:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=9Et9BlRt+SMSDP1Q6IJeQ3vF/J+SFCi5Hqn0dALv4Fc=;
 b=NBpZ6A+8AN7oxcEXEc9nIbW6FJSXHK3UU5N0RJjm+KHzTpjtuxFTvGUJBa8Eswyp8Q
 LExWBIQplJX/7J0ailAW0WYmXrfrR0DnRd8OhbGVZa83Bhp85xasVCxvWh3UYGGbufHv
 /iu0w0YwOMpFeWCLHCoESpzHxsGfbEvzX7hS0roRhT8dt+7q3Xp4oSfWPiODpH+IQWPg
 +S1SDcNwPeC7phcGvbIg/c9QRgi+sRCfofKlup3tpyDNesNYlqbK6VLrHvapgqpbXsh6
 ZLy1IXUKl4OEdg1cqFlFORiMgyHGVkEEJiHXL/1LoFbqVUeHNpR4OFUIBg1DK19zTCK1
 yP1w==
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
Cc: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDIsIDIwMTkgYXQgMDM6Mjg6NThQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIFNhdCwgQXVnIDMxLCAyMDE5IGF0IDA2OjI1OjQ2UE0gKzAxMDAsIFNpZG9u
ZyBZYW5nIHdyb3RlOgo+ID4gVXNlIGFscGhhIHZhbHVlIHRvIGJsZW5kIHNvdXJjZSB2YWx1ZSBh
bmQgZGVzdGluYXRpb24gdmFsdWUgSW5zdGVhZCBvZgo+ID4ganVzdCBvdmVyd3JpdGUgd2l0aCBz
b3VyY2UgdmFsdWUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFNpZG9uZyBZYW5nIDxyZWFsd2Fr
a2FAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21w
b3Nlci5jIHwgMTMgKysrKysrKysrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3ZrbXMvdmttc19jb21wb3Nlci5jIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21w
b3Nlci5jCj4gPiBpbmRleCBkNTU4NTY5NWM2NGQuLmI3NzYxODVlNWNiNSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9zZXIuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nlci5jCj4gPiBAQCAtNzUsNiArNzUsOSBAQCBzdGF0
aWMgdm9pZCBibGVuZCh2b2lkICp2YWRkcl9kc3QsIHZvaWQgKnZhZGRyX3NyYywKPiA+ICAJaW50
IHlfbGltaXQgPSB5X3NyYyArIGhfZHN0Owo+ID4gIAlpbnQgeF9saW1pdCA9IHhfc3JjICsgd19k
c3Q7Cj4gPiAgCj4gPiArCXU4ICpzcmMsICpkc3Q7Cj4gPiArCXUzMiBhbHBoYSwgaW52X2FscGhh
Owo+IAo+IFRoZXNlIGNvdWxkIGFsbCBsaXZlIGluIGEgdGlnaHRlciBzY29wZS4KCkhpLCBWaWxs
ZS4KClRoYW5rIHlvdSBmb3IgcmV2aWV3aW5nIG15IHBhdGNoLgpJIHRoaW5rIHRoYXQncyBnb29k
IGlkZWEgYW5kIEknbGwgZG8gdGhhdCBpbiBuZXh0IHZlcnNpb24uCkkgZm91bmQgc29tZSBwYXRj
aCBpbiBtYWlsaW5nIGxpc3QgdGhhdCBpcyBzaW1pbGFyIHdpdGggdGhpcyBwYXRjaC4KU28gc2hv
dWxkIEkgZHJvcCB0aGlzIHBhdGNoIGFuZCBmaW5kIG90aGVyIHRoaW5nPwoKU2lkb25nLgoKPiAK
PiBBcGFydCBmcm9tIHRoYXQgbGd0bQo+IFJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IAo+ID4gKwo+ID4gIAlmb3IgKGkgPSB5X3Ny
YywgaV9kc3QgPSB5X2RzdDsgaSA8IHlfbGltaXQ7ICsraSkgewo+ID4gIAkJZm9yIChqID0geF9z
cmMsIGpfZHN0ID0geF9kc3Q7IGogPCB4X2xpbWl0OyArK2opIHsKPiA+ICAJCQlvZmZzZXRfZHN0
ID0gZGVzdF9jb21wb3Nlci0+b2Zmc2V0Cj4gPiBAQCAtODQsOCArODcsMTQgQEAgc3RhdGljIHZv
aWQgYmxlbmQodm9pZCAqdmFkZHJfZHN0LCB2b2lkICp2YWRkcl9zcmMsCj4gPiAgCQkJCSAgICAg
KyAoaSAqIHNyY19jb21wb3Nlci0+cGl0Y2gpCj4gPiAgCQkJCSAgICAgKyAoaiAqIHNyY19jb21w
b3Nlci0+Y3BwKTsKPiA+ICAKPiA+IC0JCQltZW1jcHkodmFkZHJfZHN0ICsgb2Zmc2V0X2RzdCwK
PiA+IC0JCQkgICAgICAgdmFkZHJfc3JjICsgb2Zmc2V0X3NyYywgc2l6ZW9mKHUzMikpOwo+ID4g
KwkJCXNyYyA9IHZhZGRyX3NyYyArIG9mZnNldF9zcmM7Cj4gPiArCQkJZHN0ID0gdmFkZHJfZHN0
ICsgb2Zmc2V0X2RzdDsKPiA+ICsJCQlhbHBoYSA9IHNyY1szXSArIDE7Cj4gPiArCQkJaW52X2Fs
cGhhID0gMjU2IC0gc3JjWzNdOwo+ID4gKwkJCWRzdFswXSA9IChhbHBoYSAqIHNyY1swXSArIGlu
dl9hbHBoYSAqIGRzdFswXSkgPj4gODsKPiA+ICsJCQlkc3RbMV0gPSAoYWxwaGEgKiBzcmNbMV0g
KyBpbnZfYWxwaGEgKiBkc3RbMV0pID4+IDg7Cj4gPiArCQkJZHN0WzJdID0gKGFscGhhICogc3Jj
WzJdICsgaW52X2FscGhhICogZHN0WzJdKSA+PiA4Owo+ID4gKwkJCWRzdFszXSA9IDB4ZmY7Cj4g
PiAgCQl9Cj4gPiAgCQlpX2RzdCsrOwo+ID4gIAl9Cj4gPiAtLSAKPiA+IDIuMjAuMQo+ID4gCj4g
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKPiAKPiAtLSAKPiBWaWxsZSBTeXJqw6Rsw6QKPiBJbnRlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
