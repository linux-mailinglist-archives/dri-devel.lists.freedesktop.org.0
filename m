Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1105E72EA0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9576E3F2;
	Wed, 24 Jul 2019 12:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5356E4CF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 09:27:57 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 62so26589373lfa.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 02:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/lxoFTV2NP07iGG4lrW/6fB0F5OOcDNXPeCFzJNVz7Q=;
 b=romqsMowNyieWgP4E9NWJVkFcXdWEp5myAtRqPJ1I5Xx7vlH/3/wrMMgKgQQau2k8D
 rqLUjEo7Iwj9KUEKkgg0gOnuLK8+rlFpPeqbtsqcyHVwH8Vg5Yp+90CZ/1D9WLQVUwMY
 Q8bLgMYtG3KhO348o50RYOOPXKKKMH5lKmRMj0lpDiChNncARHF5qyu6M8BX+2FwJxQX
 4LU75fTIoWyOX2G+xcbD+P0NcVf4jtuNlj8wQI4mj7paUrWYhF8j4UDX119LodadNLId
 78glpkMAL4zDMORFY65S9RSvtnAeZqTiuM0LKIxwMSewvj46lL6FRX3yiFRb/2FFF1ib
 SPmw==
X-Gm-Message-State: APjAAAUfDfTq2yyRv0y4Rvqgr7KYiaM0rNICpaA6+bsEIS/xW1MVcdJp
 P/1kd/vz+WZA6CMducUaw74YypMM
X-Google-Smtp-Source: APXvYqxkdfUPCviiU+7pkuJRFja9wGYPlnRqvkcXlLqCZbpgvZrsXKxAar2CS3a4ltu5Twt5BsrlMA==
X-Received: by 2002:ac2:5dfb:: with SMTP id z27mr37827658lfq.128.1563960475646; 
 Wed, 24 Jul 2019 02:27:55 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru.
 [91.78.220.99])
 by smtp.googlemail.com with ESMTPSA id z22sm8561005ljz.20.2019.07.24.02.27.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 02:27:54 -0700 (PDT)
Subject: Re: [PATCH v3] drm/tegra: sor: Enable HDA interrupts at plug-in
To: Viswanath L <viswanathl@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
References: <1563885610-27198-1-git-send-email-viswanathl@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0ba35efb-44ec-d56c-b559-59f1daa3e6e4@gmail.com>
Date: Wed, 24 Jul 2019 12:27:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563885610-27198-1-git-send-email-viswanathl@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/lxoFTV2NP07iGG4lrW/6fB0F5OOcDNXPeCFzJNVz7Q=;
 b=L8Kx6mdNwCiNdks/Ub1/XRaxPlBWUyUA6Z7rOLPfTJv3ob+28AWMKZOeaulfXRDStb
 580dKVEKg5WA3d9k9xXFv8ksCo5tm5FPTFpkinNvmJA0h7++UKQt8gvTdQ5Wn95V6tDC
 PTt0au5EZ3nPeVlKH49pqPWLytt9k5oW4RWTBE/FdITkrhEsenT6ApGSeO8efK8RU0uf
 tBbI9QEL7Ie8n3bkSGLVIfVOknRxHYkaOQ0KSPjT2hEgQn2tgXfKEMeCx90myDYuGTLg
 l6UP5Qv+b3VvSwj5lB1Uq9XhDBQN6xLkLKlg0eEWr0Wx7kol8EOTOCYwnEXMp6qOO5Dy
 13ig==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDcuMjAxOSAxNTo0MCwgVmlzd2FuYXRoIEwg0L/QuNGI0LXRgjoKPiBIRE1JIHBsdWdvdXQg
Y2FsbHMgcnVudGltZSBzdXNwZW5kLCB3aGljaCBjbGVhcnMgaW50ZXJydXB0IHJlZ2lzdGVycwo+
IGFuZCBjYXVzZXMgYXVkaW8gZnVuY3Rpb25hbGl0eSB0byBicmVhayBvbiBzdWJzZXF1ZW50IHBs
dWctaW47IHNldHRpbmcKPiBpbnRlcnJ1cHQgcmVnaXN0ZXJzIGluIHNvcl9hdWRpb19wcmVwYXJl
KCkgc29sdmVzIHRoZSBpc3N1ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaXN3YW5hdGggTCA8dmlz
d2FuYXRobEBudmlkaWEuY29tPgoKWW91cnMgc2lnbmVkLW9mZi1ieSBhbHdheXMgc2hvdWxkIGJl
IHRoZSBsYXN0IGxpbmUgb2YgdGhlIGNvbW1pdCdzCm1lc3NhZ2UgYmVjYXVzZSB0aGUgdGV4dCBi
ZWxvdyBpdCBiZWxvbmdzIHRvIGEgcGVyc29uIHdobyBhcHBsaWVzIHRoaXMKcGF0Y2gsIFRoaWVy
cnkgaW4gdGhpcyBjYXNlLiBUaGlzIGlzIG5vdCBhIGJpZyBkZWFsIGF0IGFsbCBhbmQgVGhpZXJy
eQpjb3VsZCBtYWtlIGEgZml4dXAgd2hpbGUgYXBwbHlpbmcgdGhlIHBhdGNoIGlmIHdpbGwgZGVl
bSB0aGF0IGFzIG5lY2Vzc2FyeS4KClNlY29uZGx5LCB0aGVyZSBpcyBubyBuZWVkIHRvIGFkZCAi
c3RhYmxlQHZnZXIua2VybmVsLm9yZyIgdG8gdGhlCmVtYWlsJ3MgcmVjaXBpZW50cyBiZWNhdXNl
IHRoZSBwYXRjaCB3aWxsIGZsb3cgaW50byBzdGFibGUga2VybmVsCnZlcnNpb25zIGZyb20gdGhl
IG1haW5saW5lIG9uY2UgaXQgd2lsbCBnZXQgYXBwbGllZC4gVGhhdCBoYXBwZW5zIGJhc2VkCm9u
IHRoZSBzdGFibGUgdGFnIHByZXNlbmNlLCBoZW5jZSBpdCdzIGVub3VnaCB0byBhZGQgdGhlICdD
YycgdGFnIHRvIHRoZQpjb21taXQncyBtZXNzYWdlIGluIG9yZGVyIHRvIGdldCBwYXRjaCBiYWNr
cG9ydGVkLgoKTGFzdGx5LCBuZXh0IHRpbWUgcGxlYXNlIGFkZCBldmVyeW9uZSB0byB0aGUgZW1h
aWwncyByZWNpcGllbnRzIHdob20KeW91J3JlIGV4cGVjdGluZyB0byBnZXQgYSByZXBseS4gT3Ro
ZXJ3aXNlIHRoZXJlIGlzIGEgY2hhbmNlIHRoYXQgcGF0Y2gKd2lsbCBiZSBsZWZ0IHVubm90aWNl
ZC4KCkV2ZXJ5dGhpbmcgZWxzZSBsb29rcyBnb29kIHRvIG1lLCB0aGFua3MhCgpSZXZpZXdlZC1i
eTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgoKPiBGaXhlczogOGUyOTg4YTc2
YzI2ICgiZHJtL3RlZ3JhOiBzb3I6IFN1cHBvcnQgZm9yIGF1ZGlvIG92ZXIgSERNSSIpCj4gQ2M6
IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEv
c29yLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL3Nvci5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCj4gaW5kZXggNWJlNWEw
OC4uMDQ3MGNmZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKPiBAQCAtMjE2NCw2ICsyMTY0LDE1IEBA
IHN0YXRpYyB2b2lkIHRlZ3JhX3Nvcl9hdWRpb19wcmVwYXJlKHN0cnVjdCB0ZWdyYV9zb3IgKnNv
cikKPiAgCj4gIAl2YWx1ZSA9IFNPUl9BVURJT19IREFfUFJFU0VOU0VfRUxEViB8IFNPUl9BVURJ
T19IREFfUFJFU0VOU0VfUEQ7Cj4gIAl0ZWdyYV9zb3Jfd3JpdGVsKHNvciwgdmFsdWUsIFNPUl9B
VURJT19IREFfUFJFU0VOU0UpOwo+ICsKPiArCS8qCj4gKwkgKiBFbmFibGUgYW5kIHVubWFzayB0
aGUgSERBIGNvZGVjIFNDUkFUQ0gwIHJlZ2lzdGVyIGludGVycnVwdC4gVGhpcwo+ICsJICogaXMg
dXNlZCBmb3IgaW50ZXJvcGVyYWJpbGl0eSBiZXR3ZWVuIHRoZSBIREEgY29kZWMgZHJpdmVyIGFu
ZCB0aGUKPiArCSAqIEhETUkvRFAgZHJpdmVyLgo+ICsJICovCj4gKwl2YWx1ZSA9IFNPUl9JTlRf
Q09ERUNfU0NSQVRDSDEgfCBTT1JfSU5UX0NPREVDX1NDUkFUQ0gwOwo+ICsJdGVncmFfc29yX3dy
aXRlbChzb3IsIHZhbHVlLCBTT1JfSU5UX0VOQUJMRSk7Cj4gKwl0ZWdyYV9zb3Jfd3JpdGVsKHNv
ciwgdmFsdWUsIFNPUl9JTlRfTUFTSyk7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIHRlZ3JhX3Nv
cl9hdWRpb191bnByZXBhcmUoc3RydWN0IHRlZ3JhX3NvciAqc29yKQo+IEBAIC0yOTEzLDE1ICsy
OTIyLDYgQEAgc3RhdGljIGludCB0ZWdyYV9zb3JfaW5pdChzdHJ1Y3QgaG9zdDF4X2NsaWVudCAq
Y2xpZW50KQo+ICAJaWYgKGVyciA8IDApCj4gIAkJcmV0dXJuIGVycjsKPiAgCj4gLQkvKgo+IC0J
ICogRW5hYmxlIGFuZCB1bm1hc2sgdGhlIEhEQSBjb2RlYyBTQ1JBVENIMCByZWdpc3RlciBpbnRl
cnJ1cHQuIFRoaXMKPiAtCSAqIGlzIHVzZWQgZm9yIGludGVyb3BlcmFiaWxpdHkgYmV0d2VlbiB0
aGUgSERBIGNvZGVjIGRyaXZlciBhbmQgdGhlCj4gLQkgKiBIRE1JL0RQIGRyaXZlci4KPiAtCSAq
Lwo+IC0JdmFsdWUgPSBTT1JfSU5UX0NPREVDX1NDUkFUQ0gxIHwgU09SX0lOVF9DT0RFQ19TQ1JB
VENIMDsKPiAtCXRlZ3JhX3Nvcl93cml0ZWwoc29yLCB2YWx1ZSwgU09SX0lOVF9FTkFCTEUpOwo+
IC0JdGVncmFfc29yX3dyaXRlbChzb3IsIHZhbHVlLCBTT1JfSU5UX01BU0spOwo+IC0KPiAgCXJl
dHVybiAwOwo+ICB9Cj4gIAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
