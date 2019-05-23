Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2631E28493
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 19:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA226E041;
	Thu, 23 May 2019 17:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C826E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 17:12:39 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id k24so7608205qtq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 10:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=vDNJN8bEd9Yh4fMOJ0peDCFHARDIqG9m54hbvEEPNgw=;
 b=r9U3NJpVpm6rtRLgIkrAnI/7MI5TzIoBsWSZFPao/ZFFHyCiLSkeVPgzFLcLdKTnIb
 /rgVXIof4w6K/cRMVkr3ArnewqUzImBkbTbUouG2pqTf7ePj6r8Qs1owYZQYREuRvlwd
 sHg+Lm8dNTBpcAFzM5bm+8SEE63Iful3WzGAz22pBPp/MvXeUZj/TMjUnqoQD+7X57Yh
 j1WL15StnVajZVz7ZZKSdkAuTDLx0PDEczlG/NO1UBfpbozVO+7PuJA7C1rvVvusroKj
 70hfnIcdkzA1aM/E2GI37zF4dT/7rPHgDwSnri5VCYKZ1aRdZ1KaqSBpzAnyBEeWtpgl
 Q6Vg==
X-Gm-Message-State: APjAAAUpBhULWNyn/RN0kdPweMu3mPx7CEEBmK4TCkU0Zjd2DsZvibUJ
 /GLjRMnk3XaYEcYSssebic3RCQ==
X-Google-Smtp-Source: APXvYqzWJkE4AfQCBYO4RiNlvpUtz+Y7BPM4A74JlReLYm+Fudbm8E+F73NOHoDxPhADSg7xzgVO+A==
X-Received: by 2002:ac8:1a59:: with SMTP id q25mr82697732qtk.154.1558631558700; 
 Thu, 23 May 2019 10:12:38 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id x10sm2691348qkl.84.2019.05.23.10.12.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 10:12:38 -0700 (PDT)
Date: Thu, 23 May 2019 13:12:37 -0400
From: Sean Paul <sean@poorly.run>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH] drm/edid: Fix docbook in
 drm_hdmi_infoframe_set_hdr_metadata()
Message-ID: <20190523171237.GD17077@art_vandelay>
References: <20190523135504.184354-1-sean@poorly.run>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F8203029D@BGSMSX104.gar.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E7C9878FBA1C6D42A1CA3F62AEB6945F8203029D@BGSMSX104.gar.corp.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=vDNJN8bEd9Yh4fMOJ0peDCFHARDIqG9m54hbvEEPNgw=;
 b=D62GeshsxKORMN57+kFrEgrOvbDqxjFyi43477Bc4b45hLHGyez95Is6P/pYmOfhZE
 /5x+FUHTOTmtGDoCLnZ4U7Jit6fqJChc8e5Lw8sO79VkrHGwzIp3RyqpUY8siOYLeItK
 IQiUH8XOFidjlwKh2ENCmdZgwUuNSBylFBS/HeiAZ/nhdebxb7XsQKknwtxJPJagOtTi
 7H4yqLY+wN71VP7gJh7i9dbfX6s+LZqLBFPyr0UsHVG8ntL9LELEyri/aBDNIlC6k3GR
 wJmNrXmQ9AO7dDVMNMw46IEVQl4SR8bumSJtMBr3L2mHxS4t8uWTiF7lD0p0oDDMJSwY
 FWYQ==
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hans Verkuil <hansverk@cisco.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDI6Mzg6MzdQTSArMDAwMCwgU2hhbmthciwgVW1hIHdy
b3RlOgo+IAo+IAo+ID4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID5Gcm9tOiBTZWFuIFBh
dWwgW21haWx0bzpzZWFuQHBvb3JseS5ydW5dCj4gPlNlbnQ6IFRodXJzZGF5LCBNYXkgMjMsIDIw
MTkgNzoyNSBQTQo+ID5UbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID5DYzog
U2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+OyBTaGFua2FyLCBVbWEgPHVtYS5zaGFu
a2FyQGludGVsLmNvbT47Cj4gPlNoYXJtYSwgU2hhc2hhbmsgPHNoYXNoYW5rLnNoYXJtYUBpbnRl
bC5jb20+OyBWaWxsZSBTeXJqw6Rsw6QKPiA+PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
PjsgTWFhcnRlbiBMYW5raG9yc3QKPiA+PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT47IE1heGltZSBSaXBhcmQKPiA+PG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+OyBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj47IERhdmlkIEFpcmxpZQo+ID48YWlybGllZEBsaW51eC5pZT47
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IEJhcnRsb21pZWogWm9sbmllcmtpZXdp
Y3oKPiA+PGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT47IEhhbnMgVmVya3VpbCA8aGFuc3ZlcmtA
Y2lzY28uY29tPjsgbGludXgtCj4gPmZiZGV2QHZnZXIua2VybmVsLm9yZwo+ID5TdWJqZWN0OiBb
UEFUQ0hdIGRybS9lZGlkOiBGaXggZG9jYm9vayBpbiBkcm1faGRtaV9pbmZvZnJhbWVfc2V0X2hk
cl9tZXRhZGF0YSgpCj4gPgo+ID5Gcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9y
Zz4KPiA+Cj4gPkZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZ3M6Cj4gPi4uL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jOjQ5MjU6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1i
ZXIKPiA+J2Nvbm5fc3RhdGUnIG5vdCBkZXNjcmliZWQgaW4gJ2RybV9oZG1pX2luZm9mcmFtZV9z
ZXRfaGRyX21ldGFkYXRhJwo+ID4uLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYzo0OTI1OiB3
YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyCj4gPidoZHJfbWV0YWRhdGEnIGRlc2Ny
aXB0aW9uIGluICdkcm1faGRtaV9pbmZvZnJhbWVfc2V0X2hkcl9tZXRhZGF0YScKPiAKPiBUaGFu
a3MgU2VhbiBQYXVsIGZvciBmaXhpbmcgdGhpcy4KPiBSZXZpZXdlZC1ieTogVW1hIFNoYW5rYXIg
PHVtYS5zaGFua2FyQGludGVsLmNvbT4KClB1c2hlZCB0byAtbWlzYy1uZXh0LCB0aGFuayB5b3Ug
Zm9yIHRoZSByZXZpZXchCgpTZWFuCgo+IAo+ID5GaXhlczogMmNkYmZkNjZhODI5ICgiZHJtOiBF
bmFibGUgSERSIGluZm9mcmFtZSBzdXBwb3J0IikKPiA+Q2M6IFVtYSBTaGFua2FyIDx1bWEuc2hh
bmthckBpbnRlbC5jb20+Cj4gPkNjOiBTaGFzaGFuayBTaGFybWEgPHNoYXNoYW5rLnNoYXJtYUBp
bnRlbC5jb20+Cj4gPkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgo+ID5DYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KPiA+Q2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5j
b20+Cj4gPkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+Q2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiA+Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiA+Q2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5n
LmNvbT4KPiA+Q2M6ICJWaWxsZSBTeXJqw6Rsw6QiIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KPiA+Q2M6IEhhbnMgVmVya3VpbCA8aGFuc3ZlcmtAY2lzY28uY29tPgo+ID5DYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID5DYzogbGludXgtZmJkZXZAdmdlci5rZXJu
ZWwub3JnCj4gPlNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
Pgo+ID4tLS0KPiA+IGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgMiArLQo+ID4gMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID5kaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
YyBpbmRleAo+ID4yNjI1MTBjMmE2NzAuLmQ4N2Y1NzRmZWVjYSAxMDA2NDQKPiA+LS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiA+KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlk
LmMKPiA+QEAgLTQ5MTQsNyArNDkxNCw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19lb3RmX3N1
cHBvcnRlZCh1OCBvdXRwdXRfZW90ZiwgdTgKPiA+c2lua19lb3RmKQo+ID4gICogZHJtX2hkbWlf
aW5mb2ZyYW1lX3NldF9oZHJfbWV0YWRhdGEoKSAtIGZpbGwgYW4gSERNSSBEUk0gaW5mb2ZyYW1l
IHdpdGgKPiA+ICAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBIRFIg
bWV0YWRhdGEgZnJvbSB1c2Vyc3BhY2UKPiA+ICAqIEBmcmFtZTogSERNSSBEUk0gaW5mb2ZyYW1l
Cj4gPi0gKiBAaGRyX21ldGFkYXRhOiBoZHJfc291cmNlX21ldGFkYXRhIGluZm8gZnJvbSB1c2Vy
c3BhY2UKPiA+KyAqIEBjb25uX3N0YXRlOiBDb25uZWN0b3Igc3RhdGUgY29udGFpbmluZyBIRFIg
bWV0YWRhdGEKPiA+ICAqCj4gPiAgKiBSZXR1cm46IDAgb24gc3VjY2VzcyBvciBhIG5lZ2F0aXZl
IGVycm9yIGNvZGUgb24gZmFpbHVyZS4KPiA+ICAqLwo+ID4tLQo+ID5TZWFuIFBhdWwsIFNvZnR3
YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwo+IAoKLS0gClNlYW4gUGF1bCwgU29m
dHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
