Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C940D103021
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FC66E2B0;
	Tue, 19 Nov 2019 23:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70866E3A6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 16:58:52 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d6so17669246lfc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:58:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xiX0EqzPXmfl9+8cycQGn6gTe/lI1705Bk47uYfm4oU=;
 b=jLbQekgK286KQn0QDuuhNShJG2j0Lw28DeF7q30VFgEqiqgZkipCK5C8HJ4CiMXndP
 Kh2/UsZUZWqJLuiGCmBCCoAjwedGJPz6EaRM6c45QU+3EKIJkersjVzJVPYpf7Q0Ndf7
 o7Kg/MbqpYRpI1JCdWgd5COsv+yJiLzz0Hyw830+Aq7WL6VDHA3Pn+sDxRVuhg+9Pw76
 TzwUbyXiWhnMe8PX1escU62Vd55JQsQ4uEUXxu05gU8HfPKsp+h/fs4xQUZRk/ZCgO5g
 ECV4b+Limi/e7httDP+m38P05TAeKUtZ6Nphm6/ZT237xE83tIujHyfjEbUN1fZnB4nx
 ucdA==
X-Gm-Message-State: APjAAAVg8iaxysoAPBYfBThx26pG113crw1UDFQO25jwVR6ZvYRm79eX
 SmcMY9I7CvuZd65U+UmmxzE=
X-Google-Smtp-Source: APXvYqxOFPeDqctZEbuJVO4GYrRKbyIayL3pi6tIsdyQWNkua6J7ci15SiL5pULo3eySWzEJD8Bv1A==
X-Received: by 2002:ac2:5216:: with SMTP id a22mr4824691lfl.169.1574182731139; 
 Tue, 19 Nov 2019 08:58:51 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id 141sm10189491ljj.37.2019.11.19.08.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 08:58:50 -0800 (PST)
Subject: Re: [PATCH v1 12/29] interconnect: Add memory interconnection
 providers for NVIDIA Tegra SoCs
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-13-digetx@gmail.com> <20191119063002.GE2462695@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a16b54bf-a881-84d0-4437-993dc275487c@gmail.com>
Date: Tue, 19 Nov 2019 19:58:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191119063002.GE2462695@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xiX0EqzPXmfl9+8cycQGn6gTe/lI1705Bk47uYfm4oU=;
 b=ktleR1QkiRWXpJ1PymOF+AnwE7Q9PBQG4UVHVcltdxluMcrO7oMme2qW6uYcxu9BmM
 5eVsufxlWyMMLypvEN5Rft13s81NH2I12Nhodkw5VzivVryLVBn78eJPsiCjavVjwiVE
 crv4IfEd/KThz46OLInqN0ZxYZerI0Hz0a6/Poj40xkFmg6RM/xpzNyhzSLIfslGeSXP
 SU+ZGVH00vtrS+muuiIgHjd1kYOHNSL7kDvVA88gYYRKFLMJKQRkf+pCNKLlHuLPlKV7
 ZFY4YR6GsuOrwjsGk5fH9j0kpxj7xB02oBoAd1mNClvz1VZ5Wtewa9dBJZQbsw5VgAKE
 VqaQ==
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTkuMTEuMjAxOSAwOTozMCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBNb24sIE5v
diAxOCwgMjAxOSBhdCAxMTowMjozMFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IEFsbCBOVklESUEgVGVncmEgU29DcyBoYXZlIGlkZW50aWNhbCB0b3BvbG9neSBpbiByZWdhcmRz
IHRvIG1lbW9yeQo+PiBpbnRlcmNvbm5lY3Rpb24gYmV0d2VlbiBtZW1vcnkgY2xpZW50cyBhbmQg
bWVtb3J5IGNvbnRyb2xsZXJzLgo+PiBUaGUgbWVtb3J5IGNvbnRyb2xsZXIgKE1DKSBhbmQgZXh0
ZXJuYWwgbWVtb3J5IGNvbnRyb2xsZXIgKEVNQykgYXJlCj4+IHByb3ZpZGluZyBtZW1vcnkgY2xp
ZW50cyB3aXRoIHJlcXVpcmVkIG1lbW9yeSBiYW5kd2lkdGguIFRoZSBtZW1vcnkKPj4gY29udHJv
bGxlciBwZXJmb3JtcyBhcmJpdHJhdGlvbiBiZXR3ZWVuIG1lbW9yeSBjbGllbnRzLCB3aGlsZSB0
aGUKPj4gZXh0ZXJuYWwgbWVtb3J5IGNvbnRyb2xsZXIgdHJhbnNmZXJzIGRhdGEgZnJvbS90byBE
UkFNIGFuZCBwaXBlcyB0aGF0Cj4+IGRhdGEgZnJvbS90byBtZW1vcnkgY29udHJvbGxlci4gTWVt
b3J5IGNvbnRyb2xsZXIgaW50ZXJjb25uZWN0IHByb3ZpZGVyCj4+IGFnZ3JlZ2F0ZXMgYmFuZHdp
ZHRoIHJlcXVlc3RzIGZyb20gbWVtb3J5IGNsaWVudHMgYW5kIHNlbmRzIHRoZSBhZ2dyZWdhdGVk
Cj4+IHJlcXVlc3QgdG8gRU1DIHByb3ZpZGVyIHRoYXQgc2NhbGVzIERSQU0gZnJlcXVlbmN5IGlu
IG9yZGVyIHRvIHNhdGlzZnkgdGhlCj4+IGJhbmR3aWR0aCByZXF1aXJlbWVudC4gTWVtb3J5IGNv
bnRyb2xsZXIgcHJvdmlkZXIgY291bGQgYWRqdXN0IGhhcmR3YXJlCj4+IGNvbmZpZ3VyYXRpb24g
Zm9yIGEgbW9yZSBvcHRpbWFsIGFyYml0cmF0aW9uIGRlcGVuZGluZyBvbiBiYW5kd2lkdGgKPj4g
cmVxdWlyZW1lbnRzIGZyb20gbWVtb3J5IGNsaWVudHMsIGJ1dCB0aGlzIGlzIHVuaW1wbGVtZW50
ZWQgZm9yIG5vdy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhA
Z21haWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvaW50ZXJjb25uZWN0L0tjb25maWcgICAgICAg
ICAgICAgICB8ICAgMSArCj4+ICBkcml2ZXJzL2ludGVyY29ubmVjdC9NYWtlZmlsZSAgICAgICAg
ICAgICAgfCAgIDEgKwo+PiAgZHJpdmVycy9pbnRlcmNvbm5lY3QvdGVncmEvS2NvbmZpZyAgICAg
ICAgIHwgICA2ICsKPj4gIGRyaXZlcnMvaW50ZXJjb25uZWN0L3RlZ3JhL01ha2VmaWxlICAgICAg
ICB8ICAgNCArCj4+ICBkcml2ZXJzL2ludGVyY29ubmVjdC90ZWdyYS90ZWdyYS1pY2MtZW1jLmMg
fCAxMzggKysrKysrKysrKysrKysrKysrKysrCj4+ICBkcml2ZXJzL2ludGVyY29ubmVjdC90ZWdy
YS90ZWdyYS1pY2MtbWMuYyAgfCAxMzAgKysrKysrKysrKysrKysrKysrKwo+PiAgaW5jbHVkZS9z
b2MvdGVncmEvbWMuaCAgICAgICAgICAgICAgICAgICAgIHwgIDI2ICsrKysKPj4gIDcgZmlsZXMg
Y2hhbmdlZCwgMzA2IGluc2VydGlvbnMoKykKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2ludGVyY29ubmVjdC90ZWdyYS9LY29uZmlnCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9pbnRlcmNvbm5lY3QvdGVncmEvTWFrZWZpbGUKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2ludGVyY29ubmVjdC90ZWdyYS90ZWdyYS1pY2MtZW1jLmMKPj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2ludGVyY29ubmVjdC90ZWdyYS90ZWdyYS1pY2MtbWMuYwo+IAo+IFdoeSBk
b2VzIHRoaXMgaGF2ZSB0byBiZSBzZXBhcmF0ZSBmcm9tIHRoZSBtZW1vcnkgY29udHJvbGxlciBk
cml2ZXIgaW4KPiBkcml2ZXJzL21lbW9yeS90ZWdyYT8gSXQgc2VlbXMgbGlrZSB0aGlzIHJlcXVp
cmVzIGEgYnVuY2ggb2YgYm9pbGVycGxhdGUKPiBqdXN0IHNvIHRoYXQgdGhpcyBjb2RlIGNhbiBs
aXZlIGluIHRoZSBkcml2ZXJzL2ludGVyY29ubmVjdCBkaXJlY3RvcnkuCgpJdCBmaXRzIHdpdGgg
dGhlIElPTU1VIHNlcGFyYXRpb24uIFRvIG1lIHRoYXQgaXQncyBhIGJpdCBuaWNlciB0byBoYXZl
CnRoZSBzZXBhcmF0aW9uIGZvciB0aGUgSUNDIGFzIHdlbGwsIGJ1dCBoYXZpbmcgSUNDIHdpdGhp
biBtZW1vcnkKY29udHJvbGxlciBkcml2ZXIgYWxzbyB3aWxsIGJlIGZpbmUuCgpJbmRlZWQgaXQg
bG9va3MgbGlrZSB0aGVyZSBpcyBub3QgbXVjaCBpbiB0aGUgTUMncyBwcm92aWRlciBjb2RlIHJp
Z2h0Cm5vdywgYnV0IG1heWJlIG1vcmUgc3R1ZmYgd2lsbCBiZSBhZGRlZCBsYXRlciBvbi4KCj4g
SWYgR2VvcmdpIGRvZXNuJ3QgaW5zaXN0LCBJJ2QgcHJlZmVyIGlmIHdlIGNhcnJpZWQgdGhpcyBj
b2RlIGRpcmVjdGx5IGluCj4gdGhlIGRyaXZlcnMvbWVtb3J5L3RlZ3JhIGRpcmVjdG9yeSBzbyB0
aGF0IHdlIGRvbid0IGhhdmUgc28gbWFueQo+IGluZGlyZWN0aW9ucy4KPiAKPiBBbHNvLCBhbmQg
SSBhbHJlYWR5IGJyaWVmbHkgbWVudGlvbmVkIHRoaXMgaW4gYW5vdGhlciByZXBseSwgSSB0aGlu
ayB3ZQo+IGRvbid0IG5lZWQgdHdvIHByb3ZpZGVycyBoZXJlLiBUaGUgb25seSBvbmUgd2UncmUg
cmVhbGx5IGludGVyZXN0ZWQgaW4KPiBpcyB0aGUgbWVtb3J5LWNsaWVudCB0byBtZW1vcnktY29u
dHJvbGxlciBwYXRocy4gVGhlIE1DIHRvIEVNQyBwYXRoIGlzCj4gc3RhdGljLgoKUGVyaGFwcyBp
dCBpcyBmaW5lIHRvIGRyb3AgRU1DIHBhdGgsIEknbGwgcmV2aXNpdCBpdC4KCltzbmlwXQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
