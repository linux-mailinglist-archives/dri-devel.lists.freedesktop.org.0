Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F05742B77DE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACB56E3F0;
	Wed, 18 Nov 2020 08:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89906E247
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 14:17:32 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id o24so24415367ljj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 06:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q2TfPNwbFsY7QYd8sTzRZEObhYP03ZOzna0totkapw8=;
 b=tpbjSkvU+/U5bphneMP5zx1QauR++bqzsNpKNWwGkCa+PufVLU6GU2WjJ9CT9ETQLG
 Qr6LmuKTCBC4gjIM9iQ45WLnY6WugGpP7V0JhxxL+f3xrcC+yT2Tc6dwG1BEPQK7Ffbq
 2fUN+9u4h3aF5li4Lrb6Yzcbeurz6YqqGo3uq4IyMd8C5RcNn1cX5SGIiEdz38rmRftB
 jWb011jbyhiyX0Ekj6ReRtAcUXsnnaNzHyMougSnniv5DqFm0paq7PSsVfMnDEZ6bYDr
 hjahkG3/GVm95dt2nJFJnFel61dr9CMeRWr6cZmgn/m7peRvbeMxTm5t31eK9ckl4Oar
 vfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q2TfPNwbFsY7QYd8sTzRZEObhYP03ZOzna0totkapw8=;
 b=X5bt3NS6R1N7YVqG0oYtdeOl4EkUmSFTWELlc0qO6FScsAOo1VDdbpzixOV3o6uLga
 jcpZm3KPzgt2TSTHz5oE9Q3lATuz/AlrItoF0U8XFg0EjS6JBj6AV/+czx7sqHyfKFUu
 DTrM8j+sqgpn+CnbTC3Z/SjqDzkU8JINz5EaooFhLUGEagHp+yMOJwD38YekBaL9UvEB
 xmMwzJX4+bY0sTlpDPXQBIFrit1eqyV82H02WaTKACk7GJPZNx8SzUMEmTFVzYCHSQSG
 QAMPAHEFu/G2jLQbUSWKBz5OwDLl7Ojoli0pyU7Ui9GGqwtSGQsOXQJQfixcdZaCQIIi
 85Nw==
X-Gm-Message-State: AOAM531DqMCVrYAodOL1tUroKEGsYasVQMOe+t3Mib/fswUBvhItpMtj
 d5c1ilcJUP2XzMqqLaZmPX5Gy7nKEZw=
X-Google-Smtp-Source: ABdhPJxSxv4CgsznF1M5m0HlswEk+5u5gaPfsgzrL0V1ke3IMer28jKI+apmnEdu3Hxzfog3p84yag==
X-Received: by 2002:a2e:b164:: with SMTP id a4mr1931742ljm.115.1605622650853; 
 Tue, 17 Nov 2020 06:17:30 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id u12sm3170887lfm.39.2020.11.17.06.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 06:17:29 -0800 (PST)
Subject: Re: [PATCH v9 07/17] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201115212922.4390-1-digetx@gmail.com>
 <20201115212922.4390-8-digetx@gmail.com>
 <20201117100705.i62qr4gosvu76o22@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <956315a9-e806-3b18-6792-f01057a6c511@gmail.com>
Date: Tue, 17 Nov 2020 17:17:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201117100705.i62qr4gosvu76o22@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMTEuMjAyMCAxMzowNywgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTYtMTEtMjAs
IDAwOjI5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggbW92ZXMgQUNUTU9O
IGRyaXZlciBhd2F5IGZyb20gZ2VuZXJhdGluZyBPUFAgdGFibGUgYnkgaXRzZWxmLAo+PiB0cmFu
c2l0aW9uaW5nIGl0IHRvIHVzZSB0aGUgdGFibGUgd2hpY2ggY29tZXMgZnJvbSBkZXZpY2UtdHJl
ZS4gVGhpcwo+PiBjaGFuZ2UgYnJlYWtzIGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlciBkZXZpY2Ut
dHJlZXMgaW4gb3JkZXIgdG8gYnJpbmcKPj4gc3VwcG9ydCBmb3IgdGhlIGludGVyY29ubmVjdCBm
cmFtZXdvcmsgdG8gdGhlIGRyaXZlci4gVGhpcyBpcyBhIG1hbmRhdG9yeQo+PiBjaGFuZ2Ugd2hp
Y2ggbmVlZHMgdG8gYmUgZG9uZSBpbiBvcmRlciB0byBpbXBsZW1lbnQgaW50ZXJjb25uZWN0LWJh
c2VkCj4+IG1lbW9yeSBEVkZTLiBVc2VycyBvZiBsZWdhY3kgZGV2aWNlLXRyZWVzIHdpbGwgZ2V0
IGEgbWVzc2FnZSB0ZWxsaW5nIHRoYXQKPj4gdGhlaXJzIERUIG5lZWRzIHRvIGJlIHVwZ3JhZGVk
LiBOb3cgQUNUTU9OIGlzc3VlcyBtZW1vcnkgYmFuZHdpZHRoIHJlcXVlc3QKPj4gdXNpbmcgZGV2
X3BtX29wcF9zZXRfYncoKSwgaW5zdGVhZCBvZiBkcml2aW5nIEVNQyBjbG9jayByYXRlIGRpcmVj
dGx5Lgo+Pgo+PiBUZXN0ZWQtYnk6IFBldGVyIEdlaXMgPHBnd2lwZW91dEBnbWFpbC5jb20+Cj4+
IFRlc3RlZC1ieTogTmljb2xhcyBDaGF1dmV0IDxrd2l6YXJ0QGdtYWlsLmNvbT4KPj4gQWNrZWQt
Ynk6IENoYW53b28gQ2hvaSA8Y3cwMC5jaG9pQHNhbXN1bmcuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9k
ZXZmcmVxL3RlZ3JhMzAtZGV2ZnJlcS5jIHwgODYgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kZXZmcmVxL3RlZ3JhMzAtZGV2ZnJlcS5jIGIv
ZHJpdmVycy9kZXZmcmVxL3RlZ3JhMzAtZGV2ZnJlcS5jCj4+IGluZGV4IDM4Y2MwZDAxNDczOC4u
ZWQ2ZDQ0NjljOGM3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2RldmZyZXEvdGVncmEzMC1kZXZm
cmVxLmMKPj4gKysrIGIvZHJpdmVycy9kZXZmcmVxL3RlZ3JhMzAtZGV2ZnJlcS5jCj4+IEBAIC0x
OSw2ICsxOSw4IEBACj4+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KPj4gICNpbmNsdWRlIDxs
aW51eC93b3JrcXVldWUuaD4KPj4gIAo+PiArI2luY2x1ZGUgPHNvYy90ZWdyYS9mdXNlLmg+Cj4+
ICsKPj4gICNpbmNsdWRlICJnb3Zlcm5vci5oIgo+PiAgCj4+ICAjZGVmaW5lIEFDVE1PTl9HTEJf
U1RBVFVTCQkJCQkweDAKPj4gQEAgLTE1NSw2ICsxNTcsNyBAQCBzdHJ1Y3QgdGVncmFfZGV2ZnJl
cV9kZXZpY2Ugewo+PiAgCj4+ICBzdHJ1Y3QgdGVncmFfZGV2ZnJlcSB7Cj4+ICAJc3RydWN0IGRl
dmZyZXEJCSpkZXZmcmVxOwo+PiArCXN0cnVjdCBvcHBfdGFibGUJKm9wcF90YWJsZTsKPj4gIAo+
PiAgCXN0cnVjdCByZXNldF9jb250cm9sCSpyZXNldDsKPj4gIAlzdHJ1Y3QgY2xrCQkqY2xvY2s7
Cj4+IEBAIC02MTIsMzQgKzYxNSwxOSBAQCBzdGF0aWMgdm9pZCB0ZWdyYV9hY3Rtb25fc3RvcChz
dHJ1Y3QgdGVncmFfZGV2ZnJlcSAqdGVncmEpCj4+ICBzdGF0aWMgaW50IHRlZ3JhX2RldmZyZXFf
dGFyZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyAqZnJlcSwKPj4gIAkJCQl1
MzIgZmxhZ3MpCj4+ICB7Cj4+IC0Jc3RydWN0IHRlZ3JhX2RldmZyZXEgKnRlZ3JhID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7Cj4+IC0Jc3RydWN0IGRldmZyZXEgKmRldmZyZXEgPSB0ZWdyYS0+ZGV2
ZnJlcTsKPj4gIAlzdHJ1Y3QgZGV2X3BtX29wcCAqb3BwOwo+PiAtCXVuc2lnbmVkIGxvbmcgcmF0
ZTsKPj4gLQlpbnQgZXJyOwo+PiArCWludCByZXQ7Cj4+ICAKPj4gIAlvcHAgPSBkZXZmcmVxX3Jl
Y29tbWVuZGVkX29wcChkZXYsIGZyZXEsIGZsYWdzKTsKPj4gIAlpZiAoSVNfRVJSKG9wcCkpIHsK
Pj4gIAkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZmluZCBvcHAgZm9yICVsdSBIelxuIiwgKmZy
ZXEpOwo+PiAgCQlyZXR1cm4gUFRSX0VSUihvcHApOwo+PiAgCX0KPj4gLQlyYXRlID0gZGV2X3Bt
X29wcF9nZXRfZnJlcShvcHApOwo+PiAtCWRldl9wbV9vcHBfcHV0KG9wcCk7Cj4+IC0KPj4gLQll
cnIgPSBjbGtfc2V0X21pbl9yYXRlKHRlZ3JhLT5lbWNfY2xvY2ssIHJhdGUgKiBLSFopOwo+PiAt
CWlmIChlcnIpCj4+IC0JCXJldHVybiBlcnI7Cj4+IC0KPj4gLQllcnIgPSBjbGtfc2V0X3JhdGUo
dGVncmEtPmVtY19jbG9jaywgMCk7Cj4+IC0JaWYgKGVycikKPj4gLQkJZ290byByZXN0b3JlX21p
bl9yYXRlOwo+PiAgCj4+IC0JcmV0dXJuIDA7Cj4+IC0KPj4gLXJlc3RvcmVfbWluX3JhdGU6Cj4+
IC0JY2xrX3NldF9taW5fcmF0ZSh0ZWdyYS0+ZW1jX2Nsb2NrLCBkZXZmcmVxLT5wcmV2aW91c19m
cmVxKTsKPj4gKwlyZXQgPSBkZXZfcG1fb3BwX3NldF9idyhkZXYsIG9wcCk7Cj4+ICsJZGV2X3Bt
X29wcF9wdXQob3BwKTsKPj4gIAo+PiAtCXJldHVybiBlcnI7Cj4+ICsJcmV0dXJuIHJldDsKPj4g
IH0KPj4gIAo+PiAgc3RhdGljIGludCB0ZWdyYV9kZXZmcmVxX2dldF9kZXZfc3RhdHVzKHN0cnVj
dCBkZXZpY2UgKmRldiwKPj4gQEAgLTY1NSw3ICs2NDMsNyBAQCBzdGF0aWMgaW50IHRlZ3JhX2Rl
dmZyZXFfZ2V0X2Rldl9zdGF0dXMoc3RydWN0IGRldmljZSAqZGV2LAo+PiAgCXN0YXQtPnByaXZh
dGVfZGF0YSA9IHRlZ3JhOwo+PiAgCj4+ICAJLyogVGhlIGJlbG93IGFyZSB0byBiZSB1c2VkIGJ5
IHRoZSBvdGhlciBnb3Zlcm5vcnMgKi8KPj4gLQlzdGF0LT5jdXJyZW50X2ZyZXF1ZW5jeSA9IGN1
cl9mcmVxOwo+PiArCXN0YXQtPmN1cnJlbnRfZnJlcXVlbmN5ID0gY3VyX2ZyZXEgKiBLSFo7Cj4+
ICAKPj4gIAlhY3Rtb25fZGV2ID0gJnRlZ3JhLT5kZXZpY2VzW01DQUxMXTsKPj4gIAo+PiBAQCAt
NzA1LDcgKzY5MywxMiBAQCBzdGF0aWMgaW50IHRlZ3JhX2dvdmVybm9yX2dldF90YXJnZXQoc3Ry
dWN0IGRldmZyZXEgKmRldmZyZXEsCj4+ICAJCXRhcmdldF9mcmVxID0gbWF4KHRhcmdldF9mcmVx
LCBkZXYtPnRhcmdldF9mcmVxKTsKPj4gIAl9Cj4+ICAKPj4gLQkqZnJlcSA9IHRhcmdldF9mcmVx
Owo+PiArCS8qCj4+ICsJICogdGVncmEtZGV2ZnJlcSBkcml2ZXIgb3BlcmF0ZXMgd2l0aCBLSHog
dW5pdHMsIHdoaWxlIE9QUCB0YWJsZQo+PiArCSAqIGVudHJpZXMgdXNlIEh6IHVuaXRzLiBIZW5j
ZSB3ZSBuZWVkIHRvIGNvbnZlcnQgdGhlIHVuaXRzIGZvciB0aGUKPj4gKwkgKiBkZXZmcmVxIGNv
cmUuCj4+ICsJICovCj4+ICsJKmZyZXEgPSB0YXJnZXRfZnJlcSAqIEtIWjsKPj4gIAo+PiAgCXJl
dHVybiAwOwo+PiAgfQo+PiBAQCAtNzc0LDYgKzc2Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2ZnJl
cV9nb3Zlcm5vciB0ZWdyYV9kZXZmcmVxX2dvdmVybm9yID0gewo+PiAgCj4+ICBzdGF0aWMgaW50
IHRlZ3JhX2RldmZyZXFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gIHsK
Pj4gKwl1MzIgaHdfdmVyc2lvbiA9IEJJVCh0ZWdyYV9za3VfaW5mby5zb2Nfc3BlZWRvX2lkKTsK
Pj4gIAlzdHJ1Y3QgdGVncmFfZGV2ZnJlcV9kZXZpY2UgKmRldjsKPj4gIAlzdHJ1Y3QgdGVncmFf
ZGV2ZnJlcSAqdGVncmE7Cj4+ICAJc3RydWN0IGRldmZyZXEgKmRldmZyZXE7Cj4+IEBAIC03ODEs
NiArNzc1LDEzIEBAIHN0YXRpYyBpbnQgdGVncmFfZGV2ZnJlcV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+PiAgCWxvbmcgcmF0ZTsKPj4gIAlpbnQgZXJyOwo+PiAgCj4+ICsJ
LyogbGVnYWN5IGRldmljZS10cmVlcyBkb24ndCBoYXZlIE9QUCB0YWJsZSBhbmQgbXVzdCBiZSB1
cGRhdGVkICovCj4+ICsJaWYgKCFkZXZpY2VfcHJvcGVydHlfcHJlc2VudCgmcGRldi0+ZGV2LCAi
b3BlcmF0aW5nLXBvaW50cy12MiIpKSB7Cj4+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwKPj4gKwkJ
CSJPUFAgdGFibGUgbm90IGZvdW5kLCBwbGVhc2UgdXBkYXRlIHlvdXIgZGV2aWNlIHRyZWVcbiIp
Owo+PiArCQlyZXR1cm4gLUVOT0RFVjsKPj4gKwl9Cj4+ICsKPiAKPiBZb3UgZm9yZ290IHRvIHJl
bW92ZSB0aGlzID8KClllcywgZ29vZCBjYXRjaC4gSSdtIHBsYW5uaW5nIHRvIHJlcGxhY2UgdGhp
cyBjb2RlIHdpdGggYSBjb21tb24gaGVscGVyCnNvbWV0aW1lIHNvb24sIHNvIGlmIHRoZXJlIHdv
bid0IGJlIGFub3RoZXIgcmVhc29ucyB0byBtYWtlIGEgbmV3CnJldmlzaW9uLCB0aGVuIEknZCBw
cmVmZXIgdG8ga2VlcCBpdCBhcy1pcyBmb3Igbm93LgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
