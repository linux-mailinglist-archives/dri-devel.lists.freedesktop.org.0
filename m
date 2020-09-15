Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A9826A3D8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 13:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9634F6E235;
	Tue, 15 Sep 2020 11:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80ED6E231
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 11:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GWe1kxX/X61YaBd3+sgGR1kBcW44l/c7WKlet3NJe+8=; b=Iic6iRCjVNoed4pmyzensccdmf
 T/fJ949WCVy3Po9+oeF/UVXUptIPJTgNBCeUqaMOtMVv2sJbC3wYB0KUs7zivF5PCozLGnzaiNR1S
 gXhL/jl8DnpM/h18L5A2Wm6NtidWl8pFcGjEUWbD+EW0/NrZK4vLmqaMGv0cX/AOsowLW7s5VPb+g
 8ksZWd6s2wZfZY3WPHhv/aEqPbih6XrhI0edRn9sSdWT5kqELt8P2CEkoJHLRiQYeLmnWPj8jKqAr
 sj3D4u02Tfct3gm0/jVionbLA+mT7aXScrxOs6SAws5e7XkQ1MxZA0c+B9DORR3FGgPF5jxG5Wmab
 A7kukDug==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kI8pW-0007ex-Si; Tue, 15 Sep 2020 14:08:58 +0300
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
 <3b3b7d35-e96c-1b6e-ddd0-24fd8a9dd5bf@gmail.com>
 <6d317f3f-51c8-6ed5-0a27-00e72f204941@kapsi.fi>
 <dba5e023-23d5-7e8a-f45e-bf41abf66ef6@gmail.com>
 <27ee1096-d7fa-da63-f60e-93dbdd679893@kapsi.fi>
 <7244cec7-a1e5-e3ad-f4f5-31f8034fb270@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <7923986d-c884-c6e6-3ea5-4e45ff4d1d13@kapsi.fi>
Date: Tue, 15 Sep 2020 14:08:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7244cec7-a1e5-e3ad-f4f5-31f8034fb270@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA5LzExLzIwIDc6MzAgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAxMS4wOS4yMDIw
IDEyOjU5LCBNaWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPj4gT24gOS8xMS8yMCAxMjo1NyBB
TSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gMDkuMDkuMjAyMCAxMTozNiwgTWlra28gUGVy
dHR1bmVuINC/0LjRiNC10YI6Cj4+PiAuLi4KPj4+Pj4KPj4+Pj4gRG9lcyBpdCBtYWtlIHNlbnNl
IHRvIGhhdmUgdGltZW91dCBpbiBtaWNyb3NlY29uZHM/Cj4+Pj4+Cj4+Pj4KPj4+PiBOb3Qgc3Vy
ZSwgYnV0IGJldHRlciBoYXZlIGl0IGEgYml0IG1vcmUgZmluZS1ncmFpbmVkIHJhdGhlciB0aGFu
Cj4+Pj4gY29hcnNlLWdyYWluZWQuIFRoaXMgc3RpbGwgZ2l2ZXMgYSBtYXhpbXVtIHRpbWVvdXQg
b2YgNzEgbWludXRlcyBzbyBJCj4+Pj4gZG9uJ3QgdGhpbmsgaXQgaGFzIGFueSBuZWdhdGl2ZXMg
Y29tcGFyZWQgdG8gbWlsbGlzZWNvbmRzLgo+Pj4KPj4+IElmIHRoZXJlIGlzIG5vIGdvb2QgcmVh
c29uIHRvIHVzZSBtaWNyb3NlY29uZHMgcmlnaHQgbm93LCB0aGVuIHNob3VsZCBiZQo+Pj4gYmV0
dGVyIHRvIGRlZmF1bHQgdG8gbWlsbGlzZWNvbmRzLCBJTU8uIEl0IHNob3VsZG4ndCBiZSBhIHBy
b2JsZW0gdG8KPj4+IGV4dGVuZCB0aGUgSU9DTFQgd2l0aCBhIG1pY3Jvc2Vjb25kcyBlbnRyeSwg
aWYgZXZlciBiZSBuZWVkZWQuCj4+Pgo+Pj4gewo+Pj4gIMKgwqDCoMKgX191MzIgdGltZW91dF9t
czsKPj4+IC4uLgo+Pj4gIMKgwqDCoMKgX191MzIgdGltZW91dF91czsKPj4+IH0KPj4+Cj4+PiB0
aW1lb3V0ID0gdGltZW91dF9tcyArIDEwMDAgKiB0aW1lb3V0X3VzOwo+Pj4KPj4+IFRoZXJlIHNo
b3VsZG4ndCBiZSBhIG5lZWQgZm9yIGEgbG9uZyB0aW1lb3V0cywgc2luY2UgYSBqb2IgdGhhdCB0
YWtlcwo+Pj4gb3ZlciAxMDBtcyBpcyBwcm9iYWJseSB0b28gdW5wcmFjdGljYWwuIEl0IGFsc28g
c2hvdWxkIGJlIHBvc3NpYmxlIHRvCj4+PiBkZXRlY3QgYSBwcm9ncmVzc2luZyBqb2IgYW5kIHRo
ZW4gZGVmZXIgdGltZW91dCBpbiB0aGUgZHJpdmVyLiBBdCBsZWFzdAo+Pj4gdGhpcyBpcyB3aGF0
IG90aGVyIGRyaXZlcnMgZG8sIGxpa2UgZXRuYXZpdiBkcml2ZXIgZm9yIGV4YW1wbGU6Cj4+Pgo+
Pj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuOS1yYzQvc291cmNlL2RyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfc2NoZWQuYyNMMTA3Cj4+Pgo+Pj4KPj4KPj4gSSBz
dGlsbCBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHdoeSBpdCdzIGJldHRlciB0byBkZWZhdWx0IHRv
Cj4+IG1pbGxpc2Vjb25kcz8gQXMgeW91IHNheSwgdGhlcmUgaXMgbm8gbmVlZCB0byBoYXZlIGEg
bG9uZyB0aW1lb3V0LCBhbmQKPj4gaWYgd2UgZ28gbWljcm9zZWNvbmRzIG5vdywgdGhlbiB0aGVy
ZSB3b3VsZG4ndCBiZSBhIG5lZWQgdG8gZXh0ZW5kIGluCj4+IHRoZSBmdXR1cmUuCj4gCj4gSXQg
d2lsbCBuaWNlciB0byBhdm9pZCB1bm5lY2Vzc2FyeSB1bml0LWNvbnZlcnNpb25zIGluIHRoZSBj
b2RlIGluIG9yZGVyCj4gdG8ga2VlcCBpdCBjbGVhbmVyLgoKV2UgY2FuIGNoYW5nZSBhbGwgdGhl
IGludGVybmFscyB0byB1c2UgbWljcm9zZWNvbmRzIGFzIHdlbGwuIFdlIApldmVudHVhbGx5IGhh
dmUgdG8gY29udmVydCBpdCB0byBqaWZmaWVzIGFueXdheSwgc28gdGhlIHVuaXQgYmVmb3JlIHRo
YXQgCnNob3VsZG4ndCBtYXR0ZXIgbXVjaC4KCj4gCj4gSSdtIG5vdyBhbHNvIGEgYml0IGR1Ymlv
dXMgYWJvdXQgdGhhdCB0aGUgdGltZW91dCBmaWVsZCBvZiB0aGUgc3VibWl0Cj4gSU9DVEwgd2ls
bCBiZSBpbiB0aGUgZmluYWwgVUFQSSB2ZXJzaW9uIGJlY2F1c2UgaXQgc2hvdWxkIGJlY29tZQo+
IG9ic29sZXRlIG9uY2UgZHJtLXNjaGVkdWxlciB3aWxsIGJlIGhvb2tlZCB1cCwgc2luY2UgdGhl
IGh1bmctY2hlY2sKPiB0aW1lb3V0IHdpbGwgYmUgc3BlY2lmaWVkIHBlci1oYXJkd2FyZSBlbmdp
bmUgd2l0aGluIHRoZSBrZXJuZWwgZHJpdmVyCj4gYW5kIHRoZXJlIHdvbid0IGJlIG11Y2ggdXNl
IGZvciB0aGUgdXNlci1kZWZpbmVkIHRpbWVvdXQuCj4gCgpQZXJoYXBzIHdlIGNhbiBvbWl0IHRo
aXMgZmllbGQgZm9yIG5vdy4gTG9va2luZyBhdCBpdCwgaXQncyBwcmltYXJpbHkgCnVzZWQgZm9y
IHRlc3RzLCBhbmQgZm9yIHRoYXQgd2UgY291bGQgYWRkIGEgZGVidWdmcyBrbm9iIHRvIGFkanVz
dCB0aGUgCnRpbWVvdXQgaWYgbmVlZGVkLgoKTWlra28KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
