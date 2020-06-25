Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 172CA20A3C7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 19:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212C16E0A5;
	Thu, 25 Jun 2020 17:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677926E0A5;
 Thu, 25 Jun 2020 17:13:33 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id d15so4784785edm.10;
 Thu, 25 Jun 2020 10:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lF0qy+v5jV2ozFLzJY/1pgZYkmaMzm6mj03LWcgaglI=;
 b=jPgOdrRnDqP9La2AS9BXce1BmmIbaFOEUW3CixHK2BhdlVEpkRoOtKfWRIEMvwm17L
 Lp539xjc0v1B+Ihc/Fs0IJ6FND5+yd0f37vTIvzrdTOrArGinK7sLcl4DURwD0EF+Vyg
 pCKLVGRCujS70k/tK3yP/wX1Qa2x8mRr7BrckSlmrurdj712DIKJl5F+VMuRtth8DuK6
 BG/ETuBSA/Zte+ds/HR238GG63voOnaHqUPLEljQ+78b7FVI9/WDVSWXd4yriwmDmsve
 bThLYojVNgW3+dnUOeKpdFWjr8FjL9wSnugHXaRZpjW3LWOriEZV+Z43B7p0/QvdP7uy
 p7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lF0qy+v5jV2ozFLzJY/1pgZYkmaMzm6mj03LWcgaglI=;
 b=ArbghgTzeHYD2bbfVtRk8fSAunbseUJfobdqRwm6s0oFlobpQ18deGa6Z3+7Z5odO9
 rJANlB+RycK/sBLyPOZT8DZ1nCqY+9ej21f+xx0/dei5AvoSVPcR+x73pXzr3ow7FU6H
 Q1S1pUMhh7+i98MO56Oiclx0sLL1taPkngotrd//Gp1B7H60V+j9PCJ+/eVEJQ6vGGJK
 TX1O19k7NJx4WXHoAvuoq3Ac6L3XIrpb8hIyzHQlKMacHMSYX/FwjLOReGVp29WtvPoh
 bvoXLRG0hV62W3URg6UCSyCQfLKgvVh2kFIrzK4rEqr6zgHo3Ln5zajsav8aAUOFT3dT
 AJbw==
X-Gm-Message-State: AOAM5331ExVKYK5kml4qIFH0F8rxR2BKXU0aUdakD0goujvSgSwfBxBY
 kjZuDlfV+O20kuxF4Bfgx6qXKgBQN4N/jBRojNfs/uwcm68=
X-Google-Smtp-Source: ABdhPJz0HWigy/NA7BtGI9NCz7O7hufdrwRFM2qLcrGtpp3tTp0QKQxbqO3RQEoBiW8dUTLEpOeHLxDHT6Vmxmva+bE=
X-Received: by 2002:a05:6402:796:: with SMTP id
 d22mr23294291edy.78.1593105211936; 
 Thu, 25 Jun 2020 10:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <51e00eed-c8f1-aabf-ec2c-07be0453ab3b@amd.com>
In-Reply-To: <51e00eed-c8f1-aabf-ec2c-07be0453ab3b@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 26 Jun 2020 03:13:20 +1000
Message-ID: <CAPM=9txhX5TVUdWibRFc1C+ip5a8-c07jZawds=k5T5pBTPASA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] Revert "dma-buf: Report signaled links
 inside dma-fence-chain"
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, venkata.s.dhanalakota@intel.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V1RVRj8KCkhvdyBkaWQgdGhpcyBldmVyIGxhbmQgaW4gbXkgdHJlZSwgdGhlcmUgaXMgbm8gQUNL
IG9uIHRoaXMgZnJvbSBhbnlvbmUKaW4gY29yZSBkbWEtYnVmLAoKSW50ZWwgdGVhbSwgY2xlYW4g
eW91ciBob3VzZSB1cCBoZXJlLCBJJ20gZ29pbmcgdG8gaGF2ZSB0byBhc2sgeW91IHRvCnN0b3Ag
Q2hyaXMgbWVyZ2luZyBzdHVmZiB3aXRob3V0IG92ZXJzaWdodCwgaWYgdGhpcyBzb3J0IG9mIHRo
aW5nCmhhcHBlbnMsIHRoaXMgaXMgdG90YWxseSB1bmFjY2VwdGFibGUuCgpEYXZlLgoKCiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KICAgIFRl
c3RlZC1ieTogVmVua2F0YSBTYW5kZWVwIERoYW5hbGFrb3RhIDx2ZW5rYXRhLnMuZGhhbmFsYWtv
dGFAaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IFZlbmthdGEgU2FuZGVlcCBEaGFuYWxha290
YSA8dmVua2F0YS5zLmRoYW5hbGFrb3RhQGludGVsLmNvbT4KCgpPbiBUaHUsIDI1IEp1biAyMDIw
IGF0IDIyOjQzLCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdy
b3RlOgo+Cj4gQW0gMjUuMDYuMjAgdW0gMTQ6MzQgc2NocmllYiBMaW9uZWwgTGFuZHdlcmxpbjoK
PiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgNWRlMzc2YmI0MzRmODBhMTMxMzhmMGViZWRjODM1MWFi
NzNkOGIwZC4KPiA+Cj4gPiBUaGlzIGNoYW5nZSBicmVha3Mgc3luY2hyb25pemF0aW9uIG9mIGEg
dGltZWxpbmUuCj4gPiBkbWFfZmVuY2VfY2hhaW5fZmluZF9zZXFubygpIG1pZ2h0IGJlIGEgYml0
IG9mIGEgY29uZnVzaW5nIG5hbWUgYnV0Cj4gPiB0aGlzIGZ1bmN0aW9uIGlzIG5vdCB0cnlpbmcg
dG8gZmluZCBhIHBhcnRpY3VsYXIgc2Vxbm8sIGlzIHN1cHBvc2VkIHRvCj4gPiBnaXZlIGEgZmVu
Y2UgdG8gd2FpdCBvbiBmb3IgYSBwYXJ0aWN1bGFyIHBvaW50IGluIHRoZSB0aW1lbGluZS4KPiA+
Cj4gPiBJbiBhIHRpbWVsaW5lLCBhIHBhcnRpY3VsYXIgdmFsdWUgaXMgcmVhY2hlZCB3aGVuIGFs
bCB0aGUgcG9pbnRzIHVwIHRvCj4gPiBhbmQgaW5jbHVkaW5nIHRoYXQgdmFsdWUgaGF2ZSBzaWdu
YWxlZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcu
bGFuZHdlcmxpbkBpbnRlbC5jb20+Cj4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9kbWEtYnVm
L2RtYS1mZW5jZS1jaGFpbi5jIHwgNyAtLS0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LWNoYWluLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMKPiA+IGluZGV4IGM0
MzViYmJhODUxYy4uM2QxMjM1MDJmZjEyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9kbWEtYnVm
L2RtYS1mZW5jZS1jaGFpbi5jCj4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNo
YWluLmMKPiA+IEBAIC05OSwxMiArOTksNiBAQCBpbnQgZG1hX2ZlbmNlX2NoYWluX2ZpbmRfc2Vx
bm8oc3RydWN0IGRtYV9mZW5jZSAqKnBmZW5jZSwgdWludDY0X3Qgc2Vxbm8pCj4gPiAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4KPiA+ICAgICAgIGRtYV9mZW5jZV9jaGFpbl9mb3Jf
ZWFjaCgqcGZlbmNlLCAmY2hhaW4tPmJhc2UpIHsKPiA+IC0gICAgICAgICAgICAgaWYgKCgqcGZl
bmNlKS0+c2Vxbm8gPCBzZXFubykgeyAvKiBhbHJlYWR5IHNpZ25hbGVkICovCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgZG1hX2ZlbmNlX3B1dCgqcGZlbmNlKTsKPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAqcGZlbmNlID0gTlVMTDsKPiA+IC0gICAgICAgICAgICAgICAgICAgICBicmVhazsK
PiA+IC0gICAgICAgICAgICAgfQo+ID4gLQo+ID4gICAgICAgICAgICAgICBpZiAoKCpwZmVuY2Up
LT5jb250ZXh0ICE9IGNoYWluLT5iYXNlLmNvbnRleHQgfHwKPiA+ICAgICAgICAgICAgICAgICAg
IHRvX2RtYV9mZW5jZV9jaGFpbigqcGZlbmNlKS0+cHJldl9zZXFubyA8IHNlcW5vKQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gQEAgLTIyOCw3ICsyMjIsNiBAQCBFWFBPUlRf
U1lNQk9MKGRtYV9mZW5jZV9jaGFpbl9vcHMpOwo+ID4gICAgKiBAY2hhaW46IHRoZSBjaGFpbiBu
b2RlIHRvIGluaXRpYWxpemUKPiA+ICAgICogQHByZXY6IHRoZSBwcmV2aW91cyBmZW5jZQo+ID4g
ICAgKiBAZmVuY2U6IHRoZSBjdXJyZW50IGZlbmNlCj4gPiAtICogQHNlcW5vOiB0aGUgc2VxdWVu
Y2UgbnVtYmVyIChzeW5jcHQpIG9mIHRoZSBmZW5jZSB3aXRoaW4gdGhlIGNoYWluCj4gPiAgICAq
Cj4gPiAgICAqIEluaXRpYWxpemUgYSBuZXcgY2hhaW4gbm9kZSBhbmQgZWl0aGVyIHN0YXJ0IGEg
bmV3IGNoYWluIG9yIGFkZCB0aGUgbm9kZSB0bwo+ID4gICAgKiB0aGUgZXhpc3RpbmcgY2hhaW4g
b2YgdGhlIHByZXZpb3VzIGZlbmNlLgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBJbnRlbC1nZnggbWFpbGluZyBsaXN0Cj4gSW50ZWwtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
