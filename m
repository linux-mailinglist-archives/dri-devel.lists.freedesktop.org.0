Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A30D4195285
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 09:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD566E9CB;
	Fri, 27 Mar 2020 08:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457606E03B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 02:49:14 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id u59so9381261edc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 19:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=PXUhEFZys2Wr3FyCcp1efqMzQY4prkNOwCawKsBI8uQ=;
 b=PE/Ga0sdax0jKTMH7tjtFyxOJdYy6slgGut54J0GmMnbeOXXRV9nSB5NFNr3Pi3nBA
 aSJlJ+iLbiR708BzXyCyiahOuQApfC6r+T4SELgIPShlf7s3jZR8+sMRyi2JHWA6ZaGR
 QYHOsnqUpjpYYqmgobZ4X/fNkanUea4xwYICtIt/sZXLsbh8ESH9xxTiEJQDU9zF8fm5
 TaWmGGSPL8iWXNfKKnPIujhP0uqL1s7lK+XovFgll7565EKJossZvVyt4N5ol66M+F+l
 hkZpEbGfrvSfkGqDMBGxVjhG7O1N2wCKMd/yJcb/X7aj6n49fuWdsVtvT8HPKAGKG4Zl
 JD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=PXUhEFZys2Wr3FyCcp1efqMzQY4prkNOwCawKsBI8uQ=;
 b=joW0InPVI0t7PnSMA9cRsFZkoHIH2da1UTW4bLrbjQF7Tv2Hqnzw3dJSZUJKJ/OYo3
 81tMi8p/Kb0gt1zE9jrH2Itsd1XbkM8GXtJ9mZ8fXKFdf0A+fGcqSHeQFwOMd4s/GNwH
 nRq+/zWKljmCn+oCG6l1qNHCvOqvKuTUT5ODuxzQ5RFBtl1V7Y4a1xv8+3FqZGW/1OVz
 xMAMWwYeuKw89yNULHQ+z3Fdg6l2NH+yfMQ2sPNUqWv/gn+ximO47kMSMsjazyrEi8iI
 /kGeGZ8YkmaemBZ4fl/Kw1Tt9o4eBIEWdx69jlrf5Y0mN/D2BptWnDlF0TQjOnKrZwFk
 SB7w==
X-Gm-Message-State: ANhLgQ00tiY2Io+W8pfzfd8fKAOkotZWGcTZHo+RM574wZmAKlmpKMJm
 GkFS/1IJ6Gynnlp2MKPYb87xvFylbjIRLGcfEw8=
X-Google-Smtp-Source: ADFU+vvZXFlwhRecbBkliFIrTbTE/3TpJqzn0o0qXMb/DVPv67VsOz4SyDRS3V5jQ3JkHd/E8vyuq9L3ih+BxbnSRj0=
X-Received: by 2002:a50:85c4:: with SMTP id q4mr10664896edh.147.1585277352940; 
 Thu, 26 Mar 2020 19:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190730194911.28453-1-howl.nsp@gmail.com>
In-Reply-To: <20190730194911.28453-1-howl.nsp@gmail.com>
From: =?UTF-8?Q?David_Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>
Date: Fri, 27 Mar 2020 03:49:01 +0100
Message-ID: <CAD4j4=AdUtyoiwenzT5moAdHcR_maM91kJfDQM0AuT2bnM=D9Q@mail.gmail.com>
Subject: Re: [PATCH] drm: panel-orientation-quirks: 320 FHD and D330 HD
To: Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, 
 dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 27 Mar 2020 08:03:27 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyBzdGlsbCB2YWxpZCBhcyBubyBjaGFuZ2VzIHRvIHBhbmVsIG9yaWVudGF0
aW9uIHF1aXJrcwpoYXZlIGJlZW4gZG9uZS4gU29tZW9uZSBjYW4gcmV2aWV3IHRoaXMgdG8gbWVy
Z2U/CgpFbCBtYXIuLCAzMCBqdWwuIDIwMTkgYSBsYXMgMjE6NDksIERhdmlkIFNhbnRhbWFyw61h
IFJvZ2FkbwooPGhvd2wubnNwQGdtYWlsLmNvbT4pIGVzY3JpYmnDszoKPgo+IFRoaXMgYWRkcyB0
aGUgSEQgdmVyc2lvbiBvZiBMZW5vdm8gSWRlYXBhZCBEMzMwCj4gYW5kIEZIRCB2ZXJzaW9uIG9m
IExlbm92byBJZGVhcGFkIE1paXggMzIwLgo+Cj4gVGhpcyBzaG91bGQgd29yayBkZXNwaXRlIHRo
ZSBkbWkgZGF0YSBpcyB0aGUgc2FtZSBiZWNhdXNlCj4gdGhlIHJlc29sdXRpb24gY2hlY2tzLgo+
Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgU2FudGFtYXLDrWEgUm9nYWRvIDxob3dsLm5zcEBnbWFp
bC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVp
cmtzLmMgfCAxOCArKysrKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFu
ZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKPiBpbmRleCBmZmQ5NWJmZWFhOTQuLjg5NmM3ODNjZTEz
NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1
aXJrcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWly
a3MuYwo+IEBAIC0xOTEsMTQgKzE5MSwyOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0
ZW1faWQgb3JpZW50YXRpb25fZGF0YVtdID0gewo+ICAgICAgICAgICAgICAgICAgIERNSV9FWEFD
VF9NQVRDSChETUlfUFJPRFVDVF9WRVJTSU9OLCAiTUlJWCAzMTAtMTBJQ1IiKSwKPiAgICAgICAg
ICAgICAgICAgfSwKPiAgICAgICAgICAgICAgICAgLmRyaXZlcl9kYXRhID0gKHZvaWQgKikmbGNk
ODAweDEyODBfcmlnaHRzaWRlX3VwLAo+IC0gICAgICAgfSwgeyAgICAvKiBMZW5vdm8gSWRlYXBh
ZCBNaWl4IDMyMCAqLwo+ICsgICAgICAgfSwgeyAgICAvKiBMZW5vdm8gSWRlYXBhZCBNaWl4IDMy
MCAoSEQpICovCj4gICAgICAgICAgICAgICAgIC5tYXRjaGVzID0gewo+ICAgICAgICAgICAgICAg
ICAgIERNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkxFTk9WTyIpLAo+ICAgICAgICAg
ICAgICAgICAgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiODBYRiIpLAo+ICAg
ICAgICAgICAgICAgICAgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9WRVJTSU9OLCAiTGVu
b3ZvIE1JSVggMzIwLTEwSUNSIiksCj4gICAgICAgICAgICAgICAgIH0sCj4gICAgICAgICAgICAg
ICAgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmxjZDgwMHgxMjgwX3JpZ2h0c2lkZV91cCwKPiAt
ICAgICAgIH0sIHsgICAgLyogTGVub3ZvIElkZWFwYWQgRDMzMCAqLwo+ICsgICAgICAgfSwgeyAg
ICAvKiBMZW5vdm8gSWRlYXBhZCBNaWl4IDMyMCAoRkhEKSAqLwo+ICsgICAgICAgICAgICAgICAu
bWF0Y2hlcyA9IHsKPiArICAgICAgICAgICAgICAgICBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19W
RU5ET1IsICJMRU5PVk8iKSwKPiArICAgICAgICAgICAgICAgICBETUlfRVhBQ1RfTUFUQ0goRE1J
X1BST0RVQ1RfTkFNRSwgIjgwWEYiKSwKPiArICAgICAgICAgICAgICAgICBETUlfRVhBQ1RfTUFU
Q0goRE1JX1BST0RVQ1RfVkVSU0lPTiwgIkxlbm92byBNSUlYIDMyMC0xMElDUiIpLAo+ICsgICAg
ICAgICAgICAgICB9LAo+ICsgICAgICAgICAgICAgICAuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZs
Y2QxMjAweDE5MjBfcmlnaHRzaWRlX3VwLAo+ICsgICAgICAgfSwgeyAgICAvKiBMZW5vdm8gSWRl
YXBhZCBEMzMwIChIRCkgKi8KPiArICAgICAgICAgICAgICAgLm1hdGNoZXMgPSB7Cj4gKyAgICAg
ICAgICAgICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAiTEVOT1ZPIiksCj4g
KyAgICAgICAgICAgICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNUX05BTUUsICI4MUgz
IiksCj4gKyAgICAgICAgICAgICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNUX1ZFUlNJ
T04sICJMZW5vdm8gaWRlYXBhZCBEMzMwLTEwSUdNIiksCj4gKyAgICAgICAgICAgICAgIH0sCj4g
KyAgICAgICAgICAgICAgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmxjZDgwMHgxMjgwX3JpZ2h0
c2lkZV91cCwKPiArICAgICAgIH0sIHsgICAgLyogTGVub3ZvIElkZWFwYWQgRDMzMCAoRkhEKSAq
Lwo+ICAgICAgICAgICAgICAgICAubWF0Y2hlcyA9IHsKPiAgICAgICAgICAgICAgICAgICBETUlf
RVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJMRU5PVk8iKSwKPiAgICAgICAgICAgICAgICAg
ICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIjgxSDMiKSwKPiAtLQo+IDIuMjEu
MAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
