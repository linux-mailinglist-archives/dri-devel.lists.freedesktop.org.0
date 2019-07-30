Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C727BA6D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5BF6E6AB;
	Wed, 31 Jul 2019 07:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA236E607
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 19:52:30 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w20so63582959edd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 12:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=h991aFC0Gz/ru2ZdH3pMEBTtv1hPxIH0gO33LaSbvsQ=;
 b=mBUIcyE4u8v8cuHA2PdW9dp0qlEjSdtQ9f66OyRuLDorFs9tcyUzVADIpSvoD5Vptr
 VPlc3Ve4QokXVAdbE+Wp4/zOjKkuWuSumYoaBe5qgVZ0YSHeUWqz8AdVRVdAsgJAQThC
 eXsfbzcssPBPgumkd7NLEg2U7b/1IKwmWIVCPF6QTaZuuYbyVaXeMZ04yYGxmgUgeTSX
 YKuOKgWmSqGqC5+OOIt5LL7bp/qxIhVXRJ6xU8SI1jjOncuSZK2eXnZGsPh+FXLCmJOD
 VtGWlza0iB39FYGxRFkgrZk6Kt2RgKI7+xjl9k/Qc3x/aINIDFT9TRF3Pi2r4B+IdCCk
 BX/g==
X-Gm-Message-State: APjAAAWzs2cL4nXpC/elRP1dEQTMUZPIqJh49G3OLwj+zABB7Ry9BfaN
 0MFYBE8RsKSVlaClbfFK2MxjTpNl3423mAbVFdklsg==
X-Google-Smtp-Source: APXvYqw3ABjSiP8lbUbfTL7BuC3d2bT+L2ZtveDx9irzmaVh0IccF/z+oFmQx0t7XtJtcOzNIWtFCH1/VqDmPskXAy0=
X-Received: by 2002:aa7:ce91:: with SMTP id y17mr31852582edv.56.1564516348761; 
 Tue, 30 Jul 2019 12:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190730194911.28453-1-howl.nsp@gmail.com>
In-Reply-To: <20190730194911.28453-1-howl.nsp@gmail.com>
From: =?UTF-8?Q?David_Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>
Date: Tue, 30 Jul 2019 21:52:17 +0200
Message-ID: <CAD4j4=AZz8U7PSX5hhOb1rgH=k942pidNjEoVSfscBf1P3juiA@mail.gmail.com>
Subject: Re: [PATCH] drm: panel-orientation-quirks: 320 FHD and D330 HD
To: Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, 
 dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=h991aFC0Gz/ru2ZdH3pMEBTtv1hPxIH0gO33LaSbvsQ=;
 b=Ta00FP3rKCMcsbbzbIIU/7EBycHC3/b2iYVpbWtZKFZR5vNXffatp29UjjtEYsj0TB
 XWK/cwnmfZzrx1xp+FVJX0pDe6KGWHbAxDv3TBYhgDFBj/ySqNndk9VUKaTv5OcFRIzJ
 Bqsj6A4mU8RZZr/sktPSIF3d509N8xcs4C73KMIsqRmB8MZ7ijNeytj6Zudv6nzasDIs
 Ge1JFAFvJ++ECkh1hdD+zE497sZq6n+tRH6zS7XummhurNdfg3fSexpYtwZmuYdQuMfN
 MkhqSDAJ8p803It/WPdVC5cCFyCeh4l5Kca+YlLeE4GPBgRukD7Tk8wtInOmAwT7Cwtz
 iSgg==
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

VGhpcyBwYXRjaCBpcyBzaW1pbGFyIHRvIHRoZSBwcmV2aW91cyBvbmUgYnV0IGhhdmUgZm91bmQg
dGhhdCBNaWl4IDMyMAphbHNvIGhhdmUgRkhEIHZlcnNpb24sCnNvIGluY2x1ZGUgaXQgd2hpbGUg
YWRkaW5nIEQzMzAgSEQuCgpFbCBtYXIuLCAzMCBqdWwuIDIwMTkgYSBsYXMgMjE6NDksIERhdmlk
IFNhbnRhbWFyw61hIFJvZ2FkbwooPGhvd2wubnNwQGdtYWlsLmNvbT4pIGVzY3JpYmnDszoKPgo+
IFRoaXMgYWRkcyB0aGUgSEQgdmVyc2lvbiBvZiBMZW5vdm8gSWRlYXBhZCBEMzMwCj4gYW5kIEZI
RCB2ZXJzaW9uIG9mIExlbm92byBJZGVhcGFkIE1paXggMzIwLgo+Cj4gVGhpcyBzaG91bGQgd29y
ayBkZXNwaXRlIHRoZSBkbWkgZGF0YSBpcyB0aGUgc2FtZSBiZWNhdXNlCj4gdGhlIHJlc29sdXRp
b24gY2hlY2tzLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgU2FudGFtYXLDrWEgUm9nYWRvIDxo
b3dsLm5zcEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3Jp
ZW50YXRpb25fcXVpcmtzLmMgfCAxOCArKysrKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3MuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKPiBpbmRleCBmZmQ5NWJmZWFhOTQu
Ljg5NmM3ODNjZTEzNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29y
aWVudGF0aW9uX3F1aXJrcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmll
bnRhdGlvbl9xdWlya3MuYwo+IEBAIC0xOTEsMTQgKzE5MSwyOCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRtaV9zeXN0ZW1faWQgb3JpZW50YXRpb25fZGF0YVtdID0gewo+ICAgICAgICAgICAgICAg
ICAgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9WRVJTSU9OLCAiTUlJWCAzMTAtMTBJQ1Ii
KSwKPiAgICAgICAgICAgICAgICAgfSwKPiAgICAgICAgICAgICAgICAgLmRyaXZlcl9kYXRhID0g
KHZvaWQgKikmbGNkODAweDEyODBfcmlnaHRzaWRlX3VwLAo+IC0gICAgICAgfSwgeyAgICAvKiBM
ZW5vdm8gSWRlYXBhZCBNaWl4IDMyMCAqLwo+ICsgICAgICAgfSwgeyAgICAvKiBMZW5vdm8gSWRl
YXBhZCBNaWl4IDMyMCAoSEQpICovCj4gICAgICAgICAgICAgICAgIC5tYXRjaGVzID0gewo+ICAg
ICAgICAgICAgICAgICAgIERNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkxFTk9WTyIp
LAo+ICAgICAgICAgICAgICAgICAgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAi
ODBYRiIpLAo+ICAgICAgICAgICAgICAgICAgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9W
RVJTSU9OLCAiTGVub3ZvIE1JSVggMzIwLTEwSUNSIiksCj4gICAgICAgICAgICAgICAgIH0sCj4g
ICAgICAgICAgICAgICAgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmxjZDgwMHgxMjgwX3JpZ2h0
c2lkZV91cCwKPiAtICAgICAgIH0sIHsgICAgLyogTGVub3ZvIElkZWFwYWQgRDMzMCAqLwo+ICsg
ICAgICAgfSwgeyAgICAvKiBMZW5vdm8gSWRlYXBhZCBNaWl4IDMyMCAoRkhEKSAqLwo+ICsgICAg
ICAgICAgICAgICAubWF0Y2hlcyA9IHsKPiArICAgICAgICAgICAgICAgICBETUlfRVhBQ1RfTUFU
Q0goRE1JX1NZU19WRU5ET1IsICJMRU5PVk8iKSwKPiArICAgICAgICAgICAgICAgICBETUlfRVhB
Q1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIjgwWEYiKSwKPiArICAgICAgICAgICAgICAgICBE
TUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfVkVSU0lPTiwgIkxlbm92byBNSUlYIDMyMC0xMElD
UiIpLAo+ICsgICAgICAgICAgICAgICB9LAo+ICsgICAgICAgICAgICAgICAuZHJpdmVyX2RhdGEg
PSAodm9pZCAqKSZsY2QxMjAweDE5MjBfcmlnaHRzaWRlX3VwLAo+ICsgICAgICAgfSwgeyAgICAv
KiBMZW5vdm8gSWRlYXBhZCBEMzMwIChIRCkgKi8KPiArICAgICAgICAgICAgICAgLm1hdGNoZXMg
PSB7Cj4gKyAgICAgICAgICAgICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAi
TEVOT1ZPIiksCj4gKyAgICAgICAgICAgICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNU
X05BTUUsICI4MUgzIiksCj4gKyAgICAgICAgICAgICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9Q
Uk9EVUNUX1ZFUlNJT04sICJMZW5vdm8gaWRlYXBhZCBEMzMwLTEwSUdNIiksCj4gKyAgICAgICAg
ICAgICAgIH0sCj4gKyAgICAgICAgICAgICAgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmxjZDgw
MHgxMjgwX3JpZ2h0c2lkZV91cCwKPiArICAgICAgIH0sIHsgICAgLyogTGVub3ZvIElkZWFwYWQg
RDMzMCAoRkhEKSAqLwo+ICAgICAgICAgICAgICAgICAubWF0Y2hlcyA9IHsKPiAgICAgICAgICAg
ICAgICAgICBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJMRU5PVk8iKSwKPiAgICAg
ICAgICAgICAgICAgICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIjgxSDMiKSwK
PiAtLQo+IDIuMjEuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
