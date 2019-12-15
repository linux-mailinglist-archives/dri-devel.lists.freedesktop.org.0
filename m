Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B152711FA7F
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 19:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A0489C94;
	Sun, 15 Dec 2019 18:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F3F89C94
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 18:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576435375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8HsV4GKyEPd70JM3+HYhy9kTpLbFcibXW5ANrQJD/w=;
 b=hVaxLSc7Ej47WKEuDRnVrGYcPgOlhKyyL7R2xKue0v6ulIOyEBUXuOy/9fozf/9y2z6wSO
 qlXKJ7jr7L72QZCqxelztfoh5vNq6bzLoqVhoRG9jj49TZOQdhSL8GJjmNtUt9hXjzKFKT
 MEz3QTZ1+orilHAKa49bMAwfspoVeNk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-tpJHsVPQM2KaDVV6zR7Wfg-1; Sun, 15 Dec 2019 13:42:49 -0500
Received: by mail-wr1-f69.google.com with SMTP id z10so2486813wrt.21
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 10:42:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I0xEsxYj9YvawI0sr1Y7Fza0Bf52ptk+dtx/qvDusGs=;
 b=SzXXb5T6BnHqSLQYHchkSuTP1NI55ykcMjZts+n0YG1KRTtabHJP8JkrgJMdykZdb0
 fkpf3rFB8A3R5qKet/SoYN81tww2mw1CMRJYxoxFopYw9l5gE2GmaBIZvF9M6DysIIWP
 xud1Dh+dRfKylG6AVHanhLliVIjR3xgGwrwFNafwTX/7QEdj+ZRa9/blSQB+YuTAO0ED
 EtsYaS5rWoYUCGLKNMxHE9E2KUl3AQPCe7yBExpxNCRGFB3t7/I7vIeLuWEhkI1VQfTH
 TKxw2ASpN0DgoIeBQPmyC094JfEfZzE60pe+OoZykYTtMT2+PLhdgZRfxmbAoRJnU3Oe
 hfIg==
X-Gm-Message-State: APjAAAXpf2LZg2iSbKeSmawIvltgM6ewCDojB2jLOIqs48pCBTn1sfwL
 9UGXk3USIdhG3evjM7l+NYvkVR3hXFJjdTYqTZu0IdAggax/NTpVDo32rjUOtPCukIUKz0ECUit
 yHe5AqnQetZWs//rCYBWJTJQdEk4J
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr18183944wrt.339.1576435368191; 
 Sun, 15 Dec 2019 10:42:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxY9jkSQ+Xq3ZDBHHZ1SuggcMrDd1fPAFLlibU19EDYlWFfnX3qDdunQNOAU2H36kGbmQ27sg==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr18183934wrt.339.1576435368013; 
 Sun, 15 Dec 2019 10:42:48 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id p7sm2342340wmp.31.2019.12.15.10.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Dec 2019 10:42:47 -0800 (PST)
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Teclast X89
 tablet
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20191202105055.13201-1-hdegoede@redhat.com>
 <66b14589-aba8-1cf2-21e5-7fd1c205e8da@redhat.com>
Message-ID: <754863a0-38e2-5d5c-fc42-12597e5e48ee@redhat.com>
Date: Sun, 15 Dec 2019 19:42:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <66b14589-aba8-1cf2-21e5-7fd1c205e8da@redhat.com>
Content-Language: en-US
X-MC-Unique: tpJHsVPQM2KaDVV6zR7Wfg-1
X-Mimecast-Spam-Score: 0
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMS0xMi0yMDE5IDE4OjM4LCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+IEhpLAo+IAo+
IEkga25vdyB0aGVzZSBraW5kYSBwYXRjaGVzIGFyZSBzb3J0YSB0cml2aWFsLCBzdGlsbCBJIHBy
ZWZlciB0byBnZXQgYW4KPiBBY2tlZC1ieSBiZWZvcmUgcHVzaGluZyB0aGlzIHRvIGRybS1taXNj
LW5leHQuIENhbiBzb21lb25lIHJldmlldyB0aGlzIHBsZWFzZT8KPiAKPiBBbHRlcm5hdGl2ZSBJ
IGd1ZXNzIHdlIGNvdWxkIGFncmVlIHRoYXQgcHVzaGluZyBwYXRjaGVzIHdoaWNoIGp1c3QgYWRk
IGEgZG1pCj4gcXVpcmsgdG8gZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jIGlzIG9rIHdo
ZW4gdGhlIHBhdGNoIGhhcyBzYXQgb24gdGhlCj4gbGlzdCB3aXRob3V0IGFueSByZXNwb25zZSBm
b3IgYSB3ZWVrID8KCk5ldmVybWluZCwgZm9yIGRldmljZXMgd2l0aCBhbiB1cHNpZGUtZG93biBw
YW5lbCB0aGUgaW5mbyBpcyBpbiB0aGUgVkJUIGFuZAp3ZSBzaG91bGQgdXNlIHRoYXQgaW5zdGVh
ZCBvZiBkb2luZyBhIHF1aXJrLCBzZWxmLW5hY2suCgpSZWdhcmRzLAoKSGFucwoKCgo+IE9uIDAy
LTEyLTIwMTkgMTE6NTAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+IFRoZSBUZWNsYXN0IFg4OSB1
c2VzIGFuIHVwc2lkZS1kb3duIG1vdW50ZWQgZURQIHBhbmVsLCBhZGQgYQo+PiBwYW5lbC1vcmll
bnRhdGlvbiBxdWlyayBmb3IgdGhpcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2Vk
ZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
cGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMgfCAxMyArKysrKysrKysrKysrCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3MuYwo+PiBpbmRleCBmZmQ5NWJmZWFhOTQuLjlmMmQx
MmYyOGE3MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRh
dGlvbl9xdWlya3MuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0
aW9uX3F1aXJrcy5jCj4+IEBAIC0xMDgsNiArMTA4LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX2RtaV9wYW5lbF9vcmllbnRhdGlvbl9kYXRhIGxjZDEyMDB4MTkyMF9yaWdodHNpZGVfdXAg
PSB7Cj4+IMKgwqDCoMKgwqAgLm9yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJ
T05fUklHSFRfVVAsCj4+IMKgIH07Cj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kbWlfcGFu
ZWxfb3JpZW50YXRpb25fZGF0YSB0ZWNsYXN0X3g4OSA9IHsKPj4gK8KgwqDCoCAud2lkdGggPSAx
NTM2LAo+PiArwqDCoMKgIC5oZWlnaHQgPSAyMDQ4LAo+PiArwqDCoMKgIC5iaW9zX2RhdGVzID0g
KGNvbnN0IGNoYXIgKiBjb25zdCBbXSl7ICIxMi8xOS8yMDE0IiwgTlVMTCB9LAo+PiArwqDCoMKg
IC5vcmllbnRhdGlvbiA9IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX0JPVFRPTV9VUCwKPj4g
K307Cj4+ICsKPj4gwqAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIG9yaWVudGF0
aW9uX2RhdGFbXSA9IHsKPj4gwqDCoMKgwqDCoCB7wqDCoMKgIC8qIEFjZXIgT25lIDEwIChTMTAw
MykgKi8KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIC5tYXRjaGVzID0gewo+PiBAQCAtMjA1LDYgKzIx
MiwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgb3JpZW50YXRpb25fZGF0
YVtdID0gewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERNSV9FWEFDVF9NQVRDSChETUlfUFJP
RFVDVF9WRVJTSU9OLCAiTGVub3ZvIGlkZWFwYWQgRDMzMC0xMElHTSIpLAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgfSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICop
JmxjZDEyMDB4MTkyMF9yaWdodHNpZGVfdXAsCj4+ICvCoMKgwqAgfSwge8KgwqDCoCAvKiBUZWNs
YXN0IFg4OSAodFBBRCBpcyB0b28gZ2VuZXJpYywgYWxzbyBtYXRjaCBvbiBiaW9zIGRhdGUpICov
Cj4+ICvCoMKgwqDCoMKgwqDCoCAubWF0Y2hlcyA9IHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBE
TUlfRVhBQ1RfTUFUQ0goRE1JX0JPQVJEX1ZFTkRPUiwgIlRFQ0xBU1QiKSwKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoCBETUlfRVhBQ1RfTUFUQ0goRE1JX0JPQVJEX05BTUUsICJ0UEFEIiksCj4+ICvC
oMKgwqDCoMKgwqDCoCB9LAo+PiArwqDCoMKgwqDCoMKgwqAgLmRyaXZlcl9kYXRhID0gKHZvaWQg
KikmdGVjbGFzdF94ODksCj4+IMKgwqDCoMKgwqAgfSwge8KgwqDCoCAvKiBWSU9TIExUSDE3ICov
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAubWF0Y2hlcyA9IHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJWSU9TIiksCj4+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
