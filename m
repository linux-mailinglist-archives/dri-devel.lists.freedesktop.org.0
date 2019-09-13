Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B71EB26AC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 22:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52AF6F455;
	Fri, 13 Sep 2019 20:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAECA6F455;
 Fri, 13 Sep 2019 20:31:39 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q14so33250798wrm.9;
 Fri, 13 Sep 2019 13:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X8S3gylN05RY/rKxGO/axGrr9tyjunhuZaI855gmiHU=;
 b=SaXITI5gXjCO52zZDCdpDdMTxWNAOzsTxjQvFf93Br+GUnYB2rHKEdNMQC3/SahWRs
 njmw3vOVHGZQ19apjeLQjVR9MWBUELF4/q9P/dPnMICCKa/FZd1EOlhILtB4/Br/fNGJ
 wXBt963hDs27H/yonvqtYY11jgZB7kqUHm4rag0GrSWlaeQD3Ke9pDdwtG8ckBhDLSRY
 FwsOyfRsqN9aIxpxCSwa9MMTtJU/sXxHefvcfySGRMSU2nawds1nU3UFfEmqz+0LAPra
 IYnihUBhV9JevngnMv+9NkiL7HiPoQ5CTJcuf/6A3yw0C15lLminiwYRvdSvqgoi4iZC
 qSaQ==
X-Gm-Message-State: APjAAAUoBCGraU2Zy7cKhyYSSW8xQ//D7/GQJQWuCzOTDNPnses4q3mZ
 IScDGGo7aMK07VWV43F+YtCWh34vLInxEqXmbi4=
X-Google-Smtp-Source: APXvYqwlQ1aHCAVllPD/XYr/DExRKGa8992pHmtY5Sp0V1mXH1xc/pUlsBiThmIqbmeKpmWpf/CayScLBbbDdjBNFNw=
X-Received: by 2002:a5d:6306:: with SMTP id i6mr35935859wru.323.1568406698435; 
 Fri, 13 Sep 2019 13:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190907203238.232005-1-hdegoede@redhat.com>
 <22da19aa-0ab4-ab48-ab70-037ec41c2f87@daenzer.net>
 <3c0eb318-6c30-fc98-4005-80b5c00b8f5e@redhat.com>
 <BN6PR12MB180943F751CF9CCFA8B5B7F0F7B10@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB180943F751CF9CCFA8B5B7F0F7B10@BN6PR12MB1809.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Sep 2019 16:31:26 -0400
Message-ID: <CADnq5_ONUekq0FuEKHzfcPS3sNQFjAdEkhmscMUox5hpmy4UGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Bail earlier when radeon.cik_/si_support=0 is
 passed
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X8S3gylN05RY/rKxGO/axGrr9tyjunhuZaI855gmiHU=;
 b=u2rIXCdD6lfMYXeZuU1VCCkZUlbxv2LjouNT80/EvLDBkPQc/RQxq8HGH0uASSVYsi
 lhbs5CRnHhkQZqsdm5bjWYYPe36sMhFjH5R6YwgSYJjJXdqQx2ZEo8OTtIpbakA4FlK9
 djC0iBr7BeQWhY4wQubhkMPh4pONqYvujI7zKR8yG37LvcfWDviNwyegY2cKZs+yCy7l
 1rluYa0zRzfKc4eIACUC6rJNDq4ZAILqPuYoKSul9YCJ2HZv2jk3DTyrzP08iNChzl58
 AIze5ZC0I3VHc3CTGqiFj+gjdB49DtuWIQkSTN+iVMBAInasBam0+XuxhC7Mpaa9mHFq
 PTKQ==
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMTE6MjkgQU0gRGV1Y2hlciwgQWxleGFuZGVyCjxBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tPiB3cm90ZToKPgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0KPiA+IEZyb206IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gPiBT
ZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTAsIDIwMTkgNTozNiBBTQo+ID4gVG86IE1pY2hlbCBE
w6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+OyBEZXVjaGVyLCBBbGV4YW5kZXIKPiA+IDxBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4KPiA+IDxDaHJpc3RpYW4u
S29lbmlnQGFtZC5jb20+OyBaaG91LCBEYXZpZChDaHVuTWluZykKPiA+IDxEYXZpZDEuWmhvdUBh
bWQuY29tPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC0KPiA+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIGRybS9yYWRlb246IEJhaWwgZWFybGllciB3aGVuCj4gPiByYWRlb24uY2lrXy9zaV9zdXBw
b3J0PTAgaXMgcGFzc2VkCj4gPgo+ID4gSGksCj4gPgo+ID4gT24gOS8xMC8xOSA5OjUwIEFNLCBN
aWNoZWwgRMOkbnplciB3cm90ZToKPiA+ID4gT24gMjAxOS0wOS0wNyAxMDozMiBwLm0uLCBIYW5z
IGRlIEdvZWRlIHdyb3RlOgo+ID4gPj4gQmFpbCBmcm9tIHRoZSBwY2lfZHJpdmVyIHByb2JlIGZ1
bmN0aW9uIGluc3RlYWQgb2YgZnJvbSB0aGUKPiA+ID4+IGRybV9kcml2ZXIgbG9hZCBmdW5jdGlv
bi4KPiA+ID4+Cj4gPiA+PiBUaGlzIGF2b2lkIC9kZXYvZHJpL2NhcmQwIHRlbXBvcmFyaWx5IGdl
dHRpbmcgcmVnaXN0ZXJlZCBhbmQgdGhlbgo+ID4gPj4gdW5yZWdpc3RlcmVkIGFnYWluLCBzZW5k
aW5nIHVud2FudGVkIGFkZCAvIHJlbW92ZSB1ZGV2IGV2ZW50cyB0bwo+ID4gPj4gdXNlcnNwYWNl
Lgo+ID4gPj4KPiA+ID4+IFNwZWNpZmljYWxseSB0aGlzIGF2b2lkcyB0cmlnZ2VyaW5nIHRoZSAo
dXNlcnNwYWNlKSBidWcgZml4ZWQgYnkgdGhpcwo+ID4gPj4gcGx5bW91dGggbWVyZ2UtcmVxdWVz
dDoKPiA+ID4+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9wbHltb3V0aC9wbHltb3V0
aC9tZXJnZV9yZXF1ZXN0cy81OQo+ID4gPj4KPiA+ID4+IE5vdGUgdGhhdCBkZXNwaXRlIHRoYXQg
YmVpbmcgYW4gdXNlcnNwYWNlIGJ1Zywgbm90IHNlbmRpbmcKPiA+ID4+IHVubmVjZXNzYXJ5IHVk
ZXYgZXZlbnRzIGlzIGEgZ29vZCBpZGVhIGluIGdlbmVyYWwuCj4gPiA+Pgo+ID4gPj4gQnVnTGlu
azogaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNDkwNDkwCj4g
PiA+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+
ID4gPgo+ID4gPiBSZXZpZXdlZC1ieTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5j
b20+Cj4gPgo+ID4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LiBJJ3ZlIGRybSBwdXNoIHJpZ2h0
cywgYnV0IEkgZ3Vlc3MgdGhhdCByYWRlb24vYW1kCj4gPiBHUFUgcGF0Y2hlcyBhcmUgY29sbGVj
dGVkIGJ5IHNvbWVvbmUgQEFNRCwgc28gSSBkbyBub3QgbmVlZCB0byAvIHNob3VsZAo+ID4gbm90
IHB1c2ggdGhpcyBteXNlbGYsIHJpZ2h0Pwo+Cj4gSSdsbCBwaWNrIHRoaXMgdXAgbGF0ZXIgdGhp
cyB3ZWVrIHdoZW4gSSBnZXQgaG9tZSBmcm9tIHRyYXZlbC4KCkFwcGxpZWQuICBUaGFua3MhCgpB
bGV4Cgo+Cj4gVGhhbmtzIQo+Cj4gQWxleAo+Cj4gPgo+ID4gPiBhbWRncHUgc2hvdWxkIGJlIGNo
YW5nZWQgY29ycmVzcG9uZGluZ2x5IGFzIHdlbGwuCj4gPgo+ID4gR29vZCBwb2ludC4gSSdtIGN1
cnJlbnRseSB0cmF2ZWxsaW5nIChAcGx1bWJlcnMpIEkgY2FuIGRvIHRoaXMgd2hlbiBJJ20gYmFj
awo+ID4gaG9tZSwgYnV0IGZlZWwgZnJlZSB0byBiZWF0IG1lIHRvIGl0IChpZiB5b3UgZG8gcGxl
YXNlIENjIG1lIHRvIGF2b2lkIGRvdWJsZQo+ID4gd29yaykuCj4gPgo+ID4gUmVnYXJkcywKPiA+
Cj4gPiBIYW5zCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
