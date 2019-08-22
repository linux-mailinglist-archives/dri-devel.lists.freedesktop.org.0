Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A6B99866
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 17:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A386E6E517;
	Thu, 22 Aug 2019 15:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592A26E517;
 Thu, 22 Aug 2019 15:45:47 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id x19so8533844eda.12;
 Thu, 22 Aug 2019 08:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GYu7zsBdj1jnCt6c3x3YjXV2Cnd1ioGPP+PRK3JHESc=;
 b=l1vTkNx+zn2Ap48WF/3f+Wn8addfDWZ2+oo+V/HBmL4ZgU3WBsvfMIfD1ByZgucQpA
 8BGdT+4yPA1TNRdjj/XJNzode1gajAHbtyIwopXVGfzAllTOw1UdovkVMRNrLEGyD0hY
 Fg6dNIkIwxUrxQFaQLJ5+/49G95UOJTuLgKUeVuMP1vMm+PWQ8trGMRKqQnD2RzAVs0Y
 xJeFkivIyl+EXjkdA0QqRy8Qp69UHy1kQD9dnPN7yPAHuZ9zZOV1Ax661sVnDMLRYCiV
 fzuxZ5JQ/5VN7tAAU0np5j6BIc4IFuSyS2UnOLKROjq9M3HpgwJQCnb3d+gZJTpdBasw
 yA5Q==
X-Gm-Message-State: APjAAAWA8at8jjV4pTvqQn/E8uGEBvMYmNqfOKwhWw9IkoiQUSaFF9xt
 lLzm2Ajy9DbRCnqZr7DoIcFzKd6q+39GeHqdXqs=
X-Google-Smtp-Source: APXvYqw6+5qAoTilFTwi7FVNMPf6lYbD6sLsar4I5GBuXGtchjEIQXsi/LtP+QemR24ZypLxHTOFZiYB9fSrC2jZYrM=
X-Received: by 2002:a17:906:228e:: with SMTP id
 p14mr3235779eja.258.1566488745872; 
 Thu, 22 Aug 2019 08:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190822015756.30807-1-robdclark@gmail.com>
 <20190822122652.GM5942@intel.com>
In-Reply-To: <20190822122652.GM5942@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 Aug 2019 08:45:34 -0700
Message-ID: <CAF6AEGv4=PTJtD6au1=j-fe0BaDMsDHW0dTe+-GojOD1sh+o+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add rotation property
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GYu7zsBdj1jnCt6c3x3YjXV2Cnd1ioGPP+PRK3JHESc=;
 b=IGE5sSHQKv6OSUMGtyTjSZSn712cmN6asq206J67r0R5nE9K9ajyrPYzS8mf3698xO
 /Bf1k1CfJv5B/Di5xZZK2l8vrXDhw36tvH84o/gVegxcYI7CnOSHUFVaxvNnYWwfdKuD
 tFEHWpeHgWMDehvzUMuM1ossD++xxpRK7QIEx+ISMSqfzpRMTKEaVW0nU0xsSrKmblEb
 0IfyFft60u/eVwjp12clVdCIf/njfXBlxp/E+xiwnj9EHc6AtPvJZ5hZ0WEZw3FR28Ac
 rE1+oZaurtozP2Ku1CeI9x8OiEqRhc1W6xSleNS31lsz8CL5mq5DFP02ReZYtyAo+SkM
 j4lg==
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
Cc: Rob Clark <robdclark@chromium.org>, Fritz Koenig <frkoenig@google.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Bruce Wang <bzwang@chromium.org>,
 Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgNToyNiBBTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDIxLCAyMDE5IGF0
IDA2OjU3OjI0UE0gLTA3MDAsIFJvYiBDbGFyayB3cm90ZToKPiA+IEZyb206IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfcGxhbmUuYyB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfcGxhbmUuYwo+ID4gaW5kZXggNDViZmFjOWUzYWY3Li5jNTY1Mzc3MWU4
ZmEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcGxh
bmUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3BsYW5lLmMK
PiA+IEBAIC0xMDQwLDggKzEwNDAsMjEgQEAgc3RhdGljIHZvaWQgZHB1X3BsYW5lX3NzcHBfYXRv
bWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBzdGF0ZS0+bXVsdGlyZWN0X21vZGUpOwo+ID4KPiA+ICAgICAgIGlmIChw
ZHB1LT5waXBlX2h3LT5vcHMuc2V0dXBfZm9ybWF0KSB7Cj4gPiArICAgICAgICAgICAgIHVuc2ln
bmVkIGludCByb3RhdGlvbjsKPiA+ICsKPiA+ICAgICAgICAgICAgICAgc3JjX2ZsYWdzID0gMHgw
Owo+ID4KPiA+ICsgICAgICAgICAgICAgcm90YXRpb24gPSBkcm1fcm90YXRpb25fc2ltcGxpZnko
c3RhdGUtPnJvdGF0aW9uLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBEUk1fTU9ERV9ST1RBVEVfMCB8Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX1JFRkxFQ1RfWCB8Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX1JFRkxFQ1Rf
WSk7Cj4gPiArCj4gPiArICAgICAgICAgICAgIGlmIChyb3RhdGlvbiAmIERSTV9NT0RFX1JFRkxF
Q1RfWCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBzcmNfZmxhZ3MgfD0gRFBVX1NTUFBfRkxJ
UF9VRDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgaWYgKHJvdGF0aW9uICYgRFJNX01PREVfUkVG
TEVDVF9ZKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHNyY19mbGFncyB8PSBEUFVfU1NQUF9G
TElQX0xSOwo+ID4gKwo+Cj4gVUQgdnMuIExSIChhc3N1bWluZyB0aG9zZSBtZWFuIHdoYXQgSSB0
aGluayB0aGV5IG1lYW4pIHNlZW0gdGhlIHdyb25nCj4gd2F5IGFyb3VuZCBoZXJlLgoKYWhoLCBy
aWdodCwgcmVmbGVjdCAiYWxvbmciIHZzICJhcm91bmQiLi4KCkJSLAotUgoKPgo+ID4KPiA+ICAg
ICAgICAgICAgICAgLyogdXBkYXRlIGZvcm1hdCAqLwo+ID4gICAgICAgICAgICAgICBwZHB1LT5w
aXBlX2h3LT5vcHMuc2V0dXBfZm9ybWF0KHBkcHUtPnBpcGVfaHcsIGZtdCwgc3JjX2ZsYWdzLAo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHN0YXRlLT5tdWx0aXJlY3RfaW5kZXgp
Owo+ID4gQEAgLTE1MjIsNiArMTUzNSwxMyBAQCBzdHJ1Y3QgZHJtX3BsYW5lICpkcHVfcGxhbmVf
aW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gICAgICAgaWYgKHJldCkKPiA+ICAgICAg
ICAgICAgICAgRFBVX0VSUk9SKCJmYWlsZWQgdG8gaW5zdGFsbCB6cG9zIHByb3BlcnR5LCByYyA9
ICVkXG4iLCByZXQpOwo+ID4KPiA+ICsgICAgIGRybV9wbGFuZV9jcmVhdGVfcm90YXRpb25fcHJv
cGVydHkocGxhbmUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgRFJNX01PREVfUk9UQVRFXzAs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgRFJNX01PREVfUk9UQVRFXzAgfAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIERSTV9NT0RFX1JPVEFURV8xODAgfAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIERSTV9NT0RFX1JFRkxFQ1RfWCB8Cj4gPiArICAgICAgICAgICAgICAgICAgICAgRFJN
X01PREVfUkVGTEVDVF9ZKTsKPiA+ICsKPiA+ICAgICAgIGRybV9wbGFuZV9lbmFibGVfZmJfZGFt
YWdlX2NsaXBzKHBsYW5lKTsKPiA+Cj4gPiAgICAgICAvKiBzdWNjZXNzISBmaW5hbGl6ZSBpbml0
aWFsaXphdGlvbiAqLwo+ID4gLS0KPiA+IDIuMjEuMAo+ID4KPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Cj4gLS0KPiBWaWxsZSBT
eXJqw6Rsw6QKPiBJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
