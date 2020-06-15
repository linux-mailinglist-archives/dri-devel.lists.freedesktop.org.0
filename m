Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824291FA9A9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 09:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0773D6E826;
	Tue, 16 Jun 2020 07:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFA96E4BB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 18:07:54 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a9so20346863ljn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 11:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NNImWCHhqtVojGsejk+J9a5xVKeWHP7W32GZw/jq2rU=;
 b=PhMfsiax1F0GGmU/3UlPcnuAdoANLNF0BEfPxiOqIPK1akEnQxyIgigJivXEqMaXo0
 a1qHBTdoHDqU628wXUXrX4pF/ySYe7Tb+Mb7PBD+JGteidbWgcKR/lHS+w4eEv0Y/XHC
 X51dcTQjHHT1n1QYZ0YIJX057l07QPNIcqygM+gVP7pkeEnpm5xfzRUYoqFj2TWlEBtt
 Lkm5ShpF/pfwZzxQX4q0xlQCySYBNxPtvyShbRykK97+sbUavl0hGJ4zu9smWN8LwYwU
 KOm48VEI/Kreye82qxJtoEujLnviMUqzNNePJFWILkD2y8xUE3aGutF5D1n3XlEJXjrV
 4R3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NNImWCHhqtVojGsejk+J9a5xVKeWHP7W32GZw/jq2rU=;
 b=FdjYLL0DmWimDul3V9GePlPltfrOEh7beLZShQQGiqFp6OXj7KqWccxcobukYnWHgx
 XS2xlqkQ1EWRilu9r+ka64HqeZLBIPRH+X+QhocqY68qIQrVr4pqVQkrICZMmMcOCMsv
 /7T91qZpJD5KcwSkyRpg9WRlqnywms3QtQBL8GP8yy7obd6HJ7Q7hq8MJ+J2HCVK3qof
 ONxoUmH0MwYVtMoqG1W/FjYw+OmXxutwB2w1dCY57ARqHiW62dmgdNh325LCGgQUnuXF
 qfhYcUbmSWAoIzusJ5y831b6rY38v97V/7KgzxqhGCpJOMEASvpPPx5NaOgn2Mi0uANN
 2JrA==
X-Gm-Message-State: AOAM530joBnwStPoYQ4L5INnxt40FSninL+kwVRxrSA7OEGGOqimU8Fz
 Mcecs4Tpn/xO5yBsb5aaC6mozG3w
X-Google-Smtp-Source: ABdhPJxamRu1no/0/HxGYEY1/YGWpSzM/ErZw9qvr5rjj+WTz8FcixUS/8+BKmChF630FnamwPhT3A==
X-Received: by 2002:a2e:81d4:: with SMTP id s20mr13376914ljg.184.1592244472721; 
 Mon, 15 Jun 2020 11:07:52 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id o16sm4678233ljg.90.2020.06.15.11.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 11:07:51 -0700 (PDT)
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v2_5/5=5d_drm/tegra=3a_plane=3a_Support_18?=
 =?UTF-8?Q?0=c2=b0_rotation?=
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200614200121.14147-1-digetx@gmail.com>
 <20200614200121.14147-6-digetx@gmail.com> <20200615165758.GR6112@intel.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a22285cb-21d9-bb0e-3b6b-3b1876ebbb59@gmail.com>
Date: Mon, 15 Jun 2020 21:07:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200615165758.GR6112@intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 16 Jun 2020 07:09:12 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Derek Basehore <dbasehore@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTUuMDYuMjAyMCAxOTo1NywgVmlsbGUgU3lyasOkbMOkINC/0LjRiNC10YI6Cj4gT24gU3VuLCBK
dW4gMTQsIDIwMjAgYXQgMTE6MDE6MjFQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+
PiBDb21iaW5pbmcgaG9yaXpvbnRhbCBhbmQgdmVydGljYWwgcmVmbGVjdGlvbnMgZ2l2ZXMgdXMg
MTgwIGRlZ3JlZXMgb2YKPj4gcm90YXRpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBP
c2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZGMuYyB8IDEzICsrKysrKysrKysrKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCj4+IGluZGV4IGYzMWJjYTI3
Y2RlNC4uZGRkOWI4OGY4ZmNlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
ZGMuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+PiBAQCAtNjA4LDYgKzYw
OCw3IEBAIHN0YXRpYyBpbnQgdGVncmFfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lLAo+PiAgewo+PiAgCXN0cnVjdCB0ZWdyYV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3Rh
dGUgPSB0b190ZWdyYV9wbGFuZV9zdGF0ZShzdGF0ZSk7Cj4+ICAJdW5zaWduZWQgaW50IHJvdGF0
aW9uID0gRFJNX01PREVfUk9UQVRFXzAgfAo+PiArCQkJCURSTV9NT0RFX1JPVEFURV8xODAgfAo+
IAo+IExlYXZlIHRoaXMgb3V0IC4uLgo+IAo+PiAgCQkJCURSTV9NT0RFX1JFRkxFQ1RfWCB8Cj4+
ICAJCQkJRFJNX01PREVfUkVGTEVDVF9ZOwo+PiAgCXN0cnVjdCB0ZWdyYV9ib190aWxpbmcgKnRp
bGluZyA9ICZwbGFuZV9zdGF0ZS0+dGlsaW5nOwo+PiBAQCAtNjU5LDYgKzY2MCwxNCBAQCBzdGF0
aWMgaW50IHRlZ3JhX3BsYW5lX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwK
Pj4gIAllbHNlCj4+ICAJCXBsYW5lX3N0YXRlLT5yZWZsZWN0X3kgPSBmYWxzZTsKPj4gIAo+PiAr
CWlmICh0ZWdyYV9mYl9pc19ib3R0b21fdXAoc3RhdGUtPmZiKSkKPj4gKwkJcGxhbmVfc3RhdGUt
PnJlZmxlY3RfeSA9IHRydWU7Cj4+ICsKPj4gKwlpZiAocm90YXRpb24gJiBEUk1fTU9ERV9ST1RB
VEVfMTgwKSB7Cj4+ICsJCXBsYW5lX3N0YXRlLT5yZWZsZWN0X3ggPSAhcGxhbmVfc3RhdGUtPnJl
ZmxlY3RfeDsKPj4gKwkJcGxhbmVfc3RhdGUtPnJlZmxlY3RfeSA9ICFwbGFuZV9zdGF0ZS0+cmVm
bGVjdF95Owo+PiArCX0KPiAKPiAuLi4gYW5kIGRybV9yb3RhdGlvbl9zaW1wbGlmeSgpIHdpbGwg
ZG8gdGhpcyBmb3IgeW91LgoKSGVsbG8gVmlsbGUsCgpJbmRlZWQsIHRoYW5rIHlvdSBmb3IgdGhl
IHN1Z2dlc3Rpb24hCgo+IFRob3VnaCB0aGUgYm90dGltX3VwKCkgdGhpbmcgd2lsbCBuZWVkIGEg
c2xpZ2h0bHkgZGlmZmVyZW50IHR3ZWFrIEkKPiBndWVzcy4KPiAKPiBJJ2Qgd3JpdGUgdGhpcyBh
cyBzb21laHRpbmcgbGlrZToKPiByb3RhdGlvbiA9IHN0YXRlLT5yb3RhdGlvbjsKPiBpZiAoYm90
dG9tX3VwKCkpCj4gCXJvdGF0aW9uIF49IERSTV9NT0RFX1JFRkxFQ1RfWTsKPiByb3RhdGlvbiA9
IGRybV9yb3RhdGlvbl9zaW1wbGlmeShyb3RhdGlvbiwKPiAJCQkJIERSTV9NT0RFX1JPVEFURV8w
IHwKPiAJCQkJIERSTV9NT0RFX1JFRkxFQ1RfWCB8Cj4gCQkJCSBEUk1fTU9ERV9SRUZMRUNUX1k7
Cj4gCj4gQWxzbyBub3RlIG15IHVzZSBvZiBYT1IgZm9yIHRoZSBib3R0b21fdXAoKSBoYW5kbGlu
Zy4gSSBzdXNwZWN0Cj4gdGhlIGN1cnJlbnQgY29kZSBpcyBhbHJlYWR5IGJyb2tlbiBpZiB5b3Ug
Y29tYmluZSBib3R0b21fdXAoKQo+IGFuZCBSRUZMRUNUX1kgc2luY2UgaXQganVzdCB1c2VzIGFu
IE9SIGluc3RlYWQgb2YgYW4gWE9SLiBUaGF0J3MKPiBhc3N1bWluZyBteSBodWNuaCB3aGF0IGJv
dHRvbV91cCgpIGlzIHN1cHBvc2VkIHRvIGRvIGlzIGNvcnJlY3QuCgpUaGUgYm90dG9tX3VwKCkg
aXMgYSBsZWdhY3kgd2F5IG9mIHNwZWNpZnlpbmcgcmVmbGVjdF95IGZsYWcgb2YgdGhlCm1vZGVy
biBEUk0ncyByb3RhdGlvbiBwcm9wZXJ0eS4gSXQncyB3YXMgdXNlZCBieSBvbGRlciB1c2Vyc3Bh
Y2UgYmVmb3JlClRlZ3JhIERSTSBkcml2ZXIgZ290IHN1cHBvcnQgZm9yIHRoZSByb3RhdGlvbiBw
cm9wZXJ0eSBhbmQgd2Uga2VlcCBpdAp0b2RheSBpbiBvcmRlciB0byBtYWludGFpbiBiYWNrd2Fy
ZHMgY29tcGF0aWJpbGl0eSB3aXRoIG9sZGVyIHVzZXJzcGFjZS4KQWx0aG91Z2gsIG1heWJlIGl0
J3MgYWJvdXQgdGltZSB0byByZXRpcmUgaXQgc2luY2UgSSBkb24ndCB0aGluayB0aGF0CnN1Y2gg
b2xkIHVzZXJzcGFjZSBleGlzdHMgYW55bW9yZS4KClRoZSBsZWdhY3kgYm90dG9tX3VwKCkgZHVw
bGljYXRlcyB0aGUgbW9kZXJuIHJlZmxlY3RfeSBmbGFnLCBzbyB0aGVzZQphcmUgbm90IG11dHVh
bGx5IGV4Y2x1c2l2ZS4gQ29tYmluaW5nIHdpdGggeW91cnMgc3VnZ2VzdGlvbiBhYm92ZSwgd2UK
Y2FuIHdyaXRlIGl0IGluIHRoaXMgd2F5OgoKICAvKgogICAqIE9sZGVyIHVzZXJzcGFjZSB1c2Vk
IGN1c3RvbSBCTyBmbGFnIGluIG9yZGVyIHRvIHNwZWNpZnkKICAgKiB0aGUgWSByZWZsZWN0aW9u
LCB3aGlsZSBtb2Rlcm4gdXNlcnNwYWNlIHVzZXMgdGhlIGdlbmVyaWMKICAgKiBEUk0gcm90YXRp
b24gcHJvcGVydHkgaW4gb3JkZXIgdG8gYWNoaWV2ZSB0aGUgc2FtZSByZXN1bHQuCiAgICogVGhl
IGxlZ2FjeSBCTyBmbGFnIGFtZW5kcyB0aGUgbW9kZXJuIHJvdGF0aW9uIHByb3BlcnR5CiAgICog
d2hlbiBib3RoIGFyZSBzZXQuCiAgICovCiAgaWYgKHRlZ3JhX2ZiX2lzX2JvdHRvbV91cChzdGF0
ZS0+ZmIpKQogICAgcm90YXRpb24gPSBkcm1fcm90YXRpb25fc2ltcGxpZnkoc3RhdGUtPnJvdGF0
aW9uIHwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX1JFRkxF
Q1RfWSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJvdGF0aW9uKTsKICBl
bHNlCiAgICByb3RhdGlvbiA9IGRybV9yb3RhdGlvbl9zaW1wbGlmeShzdGF0ZS0+cm90YXRpb24s
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByb3RhdGlvbik7CgpUaGFuayB5
b3UgdmVyeSBtdWNoIGZvciB0YWtpbmcgYSBsb29rIGF0IHRoaXMgcGF0Y2ghIEknbGwgcHJlcGFy
ZSB2MyBpbgphY2NvcmRhbmNlIHRvIHlvdXJzIGNvbW1lbnRzLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
