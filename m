Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E346C347CEB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB4B6EA29;
	Wed, 24 Mar 2021 15:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F64889C94
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:45:33 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u9so3146771ljd.11
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J67g1LYZycnuR5Ntlc3GIVZEd0UIRXmhsdUs45LSnIc=;
 b=HbrG1LxiS/DsjiRPaT3k87IMaNXlS1US2xGqZQUY6RndQIi52ZNz0AYuiCof7NeCSO
 O7heYjxHWV3LHpo+mR4XYz8szjV7R1oJuWgSErZoFSJGoKCAokXT4CvvXYnUfWfjs0T3
 98StExoZmoVoA7iT/9Xj0UfBYU2ZJQAAtFPjeUXwIhI9mcL0BEu4y05IkIiDgtuYUWem
 fzgRHdQJqFcAwYIsEI/uGakth1p20AIvsBRTnrl80MUdWo/touP7Ae5OhdktW6VtwA0P
 50YjiA1kvisH0EX/sJF5ZcWZIDOJacSeyubB5kLHlGbXB94kRugPuKtFM3Bln+AQGoIC
 E/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J67g1LYZycnuR5Ntlc3GIVZEd0UIRXmhsdUs45LSnIc=;
 b=CTopu58/JBhHa5BSwsYCLc9j66ntvt3a5CvNOENb7buHAJ9vpRG+HzLH/CA+Jg+TEv
 soqUFx5JB/Giq6eu2ghBd7KcTfaOt9m6tm3mtNDli0rbDoy/jUalVOT6vztCt4sW700k
 cwBxRD7msDb3tAHW0xVnwp6ql9IpD06XnDnapDcUHZi6+nmx/VwQK+p+v2sfR86UvQUv
 BUCoWuEKLW/g2FhuKBJtf7+MDFB4JzGWfhCBLvycNq17n+sq8nXQvyDaJyNi6tTXQn8I
 CHia6Wg18mKlEVcCLjy/b8xf6+2tnSPga0IAPpRVUfaLkzTqZ/V1gqWN8xIf1krjeGms
 1gOg==
X-Gm-Message-State: AOAM5332Zst3cq4pNg/BDTM8JIaMSVFQhV40MQcgoi6cHFE2IQEWsKwy
 UZQTdxb2EKUBhIqqCh5VPrk=
X-Google-Smtp-Source: ABdhPJzIPYTviHs7vr0lapP/KBEMON2O+agn5rTN2dN8En/5twsHclUU3TGkyusQQLbl/jY5AzyzOA==
X-Received: by 2002:a2e:1612:: with SMTP id w18mr2618929ljd.6.1616600731613;
 Wed, 24 Mar 2021 08:45:31 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru.
 [109.252.193.60])
 by smtp.googlemail.com with ESMTPSA id p22sm265576lfc.23.2021.03.24.08.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 08:45:31 -0700 (PDT)
Subject: Re: [PATCH 6/9] drm/tegra: gem: Add a clarifying comment
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-7-thierry.reding@gmail.com>
 <21d2e691-6404-503b-422a-be97a7b9d1b4@gmail.com>
 <YFtUalHlk9YiH03n@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c231415d-bb4c-6e8a-d384-4ded8f4d27d1@gmail.com>
Date: Wed, 24 Mar 2021 18:45:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFtUalHlk9YiH03n@orome.fritz.box>
Content-Language: en-US
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, David Airlie <airlied@linux.ie>,
 James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjQuMDMuMjAyMSAxODowMiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBXZWQsIE1h
ciAyNCwgMjAyMSBhdCAwNTo0MTowOFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDIzLjAzLjIwMjEgMTg6NTQsIFRoaWVycnkgUmVkaW5nINC/0LjRiNC10YI6Cj4+PiBGcm9tOiBU
aGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+Pj4KPj4+IENsYXJpZnkgd2hlbiBh
IGZpeGVkIElPViBhZGRyZXNzIGNhbiBiZSB1c2VkIGFuZCB3aGVuIGEgYnVmZmVyIGhhcyB0bwo+
Pj4gYmUgbWFwcGVkIGJlZm9yZSB0aGUgSU9WQSBjYW4gYmUgdXNlZC4KPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+Pj4gLS0tCj4+PiAg
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3BsYW5lLmMgfCA4ICsrKysrKysrCj4+PiAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9wbGFuZS5jCj4+PiBpbmRl
eCAxOWU4ODQ3YTE2NGIuLjc5M2RhNWQ2NzVkMiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9wbGFuZS5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvcGxhbmUu
Ywo+Pj4gQEAgLTExOSw2ICsxMTksMTQgQEAgc3RhdGljIGludCB0ZWdyYV9kY19waW4oc3RydWN0
IHRlZ3JhX2RjICpkYywgc3RydWN0IHRlZ3JhX3BsYW5lX3N0YXRlICpzdGF0ZSkKPj4+ICAJCWRt
YV9hZGRyX3QgcGh5c19hZGRyLCAqcGh5czsKPj4+ICAJCXN0cnVjdCBzZ190YWJsZSAqc2d0Owo+
Pj4gIAo+Pj4gKwkJLyoKPj4+ICsJCSAqIElmIHdlJ3JlIG5vdCBhdHRhY2hlZCB0byBhIGRvbWFp
biwgd2UgYWxyZWFkeSBzdG9yZWQgdGhlCj4+PiArCQkgKiBwaHlzaWNhbCBhZGRyZXNzIHdoZW4g
dGhlIGJ1ZmZlciB3YXMgYWxsb2NhdGVkLiBJZiB3ZSdyZQo+Pj4gKwkJICogcGFydCBvZiBhIGdy
b3VwIHRoYXQncyBzaGFyZWQgYmV0d2VlbiBhbGwgZGlzcGxheQo+Pj4gKwkJICogY29udHJvbGxl
cnMsIHdlJ3ZlIGFsc28gYWxyZWFkeSBtYXBwZWQgdGhlIGZyYW1lYnVmZmVyCj4+PiArCQkgKiB0
aHJvdWdoIHRoZSBTTU1VLiBJbiBib3RoIGNhc2VzIHdlIGNhbiBzaG9ydC1jaXJjdWl0IHRoZQo+
Pj4gKwkJICogY29kZSBiZWxvdyBhbmQgcmV0cmlldmUgdGhlIHN0b3JlZCBJT1YgYWRkcmVzcy4K
Pj4+ICsJCSAqLwo+Pj4gIAkJaWYgKCFkb21haW4gfHwgZGMtPmNsaWVudC5ncm91cCkKPj4+ICAJ
CQlwaHlzID0gJnBoeXNfYWRkcjsKPj4+ICAJCWVsc2UKPj4+Cj4+Cj4+IFRoaXMgY29tbWVudCBp
cyBjb3JyZWN0LCBidXQgdGhlIGxvZ2ljIGZlZWxzIGEgYml0IGxhbWUgYmVjYXVzZSBpdAo+PiBz
aG91bGQgYmUgd2FzdGVmdWwgdG8gcmUtbWFwIERNQSBvbiBlYWNoIEZCIGZsaXAuIFBlcnNvbmFs
bHkgSSBkb24ndAo+PiBjYXJlIG11Y2ggYWJvdXQgdGhpcyBzaW5jZSBvbGRlciBUZWdyYXMgdXNl
IHBpbm5lZCBidWZmZXJzIGJ5IGRlZmF1bHQsCj4+IGJ1dCB0aGlzIHNob3VsZG4ndCBiZSBnb29k
IGZvciBUMTI0KyB1c2Vycy4KPiAKPiBJJ20gbm90IHRlcnJpYmx5IHRocmlsbGVkIGJ5IHRoaXMg
ZWl0aGVyLCBidXQgaXQncyB0aGUgb25seSB3YXkgdG8gZG8KPiB0aGlzIHdoZW4gdXNpbmcgdGhl
IERNQSBBUEkgYmVjYXVzZSB3ZSBkb24ndCBrbm93IGF0IGFsbG9jYXRpb24gdGltZSAob3IKPiBp
bXBvcnQgdGltZSBmb3IgdGhhdCBtYXR0ZXIpIHdoaWNoIG9mIHRoZSAodXAgdG8pIDQgZGlzcGxh
eSBjb250cm9sbGVycwo+IGEgZnJhbWVidWZmZXIgd2lsbCBiZSBzaG93biBvbi4gdGVncmFfZGNf
cGluKCkgaXMgdGhlIGVhcmxpZXN0IHdoZXJlCj4gdGhpcyBpcyBrbm93biBhbmQgd29yc3QgY2Fz
ZSB0aGF0J3MgY2FsbGVkIG9uY2UgcGVyIGZsaXAuCj4gCj4gV2hlbiB0aGUgSU9NTVUgQVBJIGlz
IHVzZWQgZXhwbGljaXRseSwgd2UgYWx3YXlzIG1hcCBmcmFtZWJ1ZmZlcnMgaW50bwo+IHRoZSBJ
T01NVSBkb21haW4gc2hhcmVkIGJ5IGFsbCBkaXNwbGF5IGNvbnRyb2xsZXJzIGF0IGFsbG9jYXRp
b24gb3IKPiBpbXBvcnQgdGltZSBhbmQgdGhlbiB3ZSBkb24ndCBuZWVkIHRvIHBpbiBhdCBmbGlw
IHRpbWUgYW55bW9yZS4KPiAKPiBJIGRvIGhhdmUgYSB3b3JrLWluLXByb2dyZXNzIHBhdGNoIHNv
bWV3aGVyZSB0aGF0IGNyZWF0ZXMgYSBtYXBwaW5nCj4gY2FjaGUgdG8gbWl0aWdhdGUgdGhpcyBw
cm9ibGVtIHRvIHNvbWUgZGVncmVlLiBJIG5lZWQgdG8gZGlnIHRoYXQgdXAgYW5kCj4gZG8gYSBm
ZXcgbWVhc3VyZW1lbnRzIGJlY2F1c2UgSSB2YWd1ZWx5IHJlY2FsbCB0aGlzIHNwZWVkaW5nIHVw
IGZsaXBzIGJ5Cj4gcXVpdGUgYSBiaXQgKHdlbGwsIGV4Y2VwdCBmb3IgdGhlIHZlcnkgZmlyc3Qg
bWFwcGluZywgb2J2aW91c2x5KS4KPiAKPj4gUGVyaGFwcyBkdW1iIGJ1ZmZlcnMgc2hvdWxkIGJl
IHBpbm5lZCB0byBkaXNwbGF5IGJ5IGRlZmF1bHQgYW5kIHRoZW4gd2UKPj4gc2hvdWxkIGV4dGVu
ZCB0aGUgVGVncmEgVUFQSSB0byBzdXBwb3J0IEJPIG1hcHBpbmcgdG8gZGlzcGxheSBjbGllbnQo
PykuCj4gCj4gVGhhdCB3b3VsZCBraW5kIG9mIGRlZmVhdCB0aGUgcHVycG9zZSBvZiBhIGdlbmVy
aWMgS01TIFVBUEkuCgpDb3VsZG4ndCB0aGUgQk9zIGJlIG1hcHBlZCB3aGVuIEZCIGlzIGNyZWF0
ZWQsIGkuZS4gYnkgdGVncmFfZmJfY3JlYXRlPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
