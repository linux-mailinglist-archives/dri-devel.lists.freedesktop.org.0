Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFA23066C8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 22:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A1389CCB;
	Wed, 27 Jan 2021 21:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33336E8AF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 21:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RzYqJl+q1gCm+1GGVn7zeM+eQJYxs7B083hKM09xL6k=; b=oZOh2HvvspN52yo1o/O/dpvVZJ
 QpjKz7xh0L/jQQsoDCEdV3GS6dl3OvHplPiMrhWn97CST69eSmqDSUlwqXbST5mO33z3NSYmjbWJW
 MljqJYmAICz7QaeXicM9kygZBoO/GzFL0Gk5lQXPwxSEQt0x7JqMpoj8BaeJVd/Q6QG0+nKRhQeFj
 d/2BrzMi7u7Y1ybeyJKx4uW5WgzkPGec48/7cVP5U8gToME2g+U5z3cwQBiVaD/uHUlI5P6vY3hfx
 6jsbPqYhsOWXQYcrhcByffF0+zPRiJFfIttzF60TOmlymD1b8UFbYWV2OP9/F8nxS6Mb/6kbJA7rT
 vbkWid8w==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1l4skW-0007Ox-Sg; Wed, 27 Jan 2021 23:53:16 +0200
Subject: Re: [PATCH v5 00/21] sync_file API is not very suitable for DRM
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <c690b17d-7278-5d25-8316-671afd111e01@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <53b7c991-7aa7-2407-eb54-d9db997f00e7@kapsi.fi>
Date: Wed, 27 Jan 2021 23:53:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <c690b17d-7278-5d25-8316-671afd111e01@gmail.com>
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

T24gMS8yNy8yMSAxMTozNSBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDI2LjAxLjIwMjEg
MDU6NDUsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+Pj4gNC4gU3luYyBmaWxlIHNob3Vs
ZG4ndCBiZSBuZWVkZWQgZm9yIHRoZSBwYXJ0IG9mIERSTSBBUEkgd2hpY2ggZG9lc24ndAo+Pj4g
aW50ZXJhY3Qgd2l0aCBleHRlcm5hbCBub24tRFJNIGRldmljZXMuwqAgV2Ugc2hvdWxkIHVzZSBE
Uk0gc3luY29iaiBmb3IKPj4+IGV2ZXJ5dGhpbmcgcmVsYXRlZCB0byBEUk0sIGl0J3MgYSBzdXBl
cmlvciBBUEkgb3ZlciBzeW5jIGZpbGUsIGl0J3MKPj4+IHN1aXRhYmxlIGZvciBEUk0gc2NoZWR1
bGVyLgo+Pgo+PiBDb25zaWRlcmluZyB0aGUgaXNzdWVzIHdpdGggZmlsZW5vIGxpbWl0cywgSSBz
dXBwb3NlIHRoZXJlIGlzIG5vIG90aGVyCj4+IGNob2ljZS4gQ29uc2lkZXJpbmcgdGhlIHJlY2Vu
dCBOVFNZTkMgcHJvcG9zYWwgYnkgV2luZSBkZXZlbG9wZXJzLCBtYXliZQo+PiB3ZSBzaG91bGQg
YWxzbyBoYXZlIE5USEFORExFcyB0byBnZXQgcmlkIG9mIHJlc3RyaWN0aW9ucyBvZiBmaWxlCj4+
IGRlc2NyaXB0b3JzLgo+IAo+IEl0J3Mgb2RkIHRvIG1lIHRoYXQgeW91IHRyeWluZyB0byBhdm9p
ZCB0aGUgZXhpc3RpbmcgRFJNIEFQSS4gVGhpcyBhbGwKPiB3YXMgc29sdmVkIGluIERSTSBsb25n
IHRpbWUgYWdvIGFuZCBncmF0ZSBkcml2ZXJzIGhhdmUgbm8gcHJvYmxlbXMgd2l0aAo+IHVzaW5n
IHRoZSBEUk0gQVBJcy4gRXZlbiBpZiBzb21ldGhpbmcgaXMgcmVhbGx5IG1pc3NpbmcsIHRoZW4g
eW91IHNob3VsZAo+IGFkZCB0aGUgbWlzc2luZyBmZWF0dXJlcyBpbnN0ZWFkIG9mIHJlLWludmVu
dGluZyBldmVyeXRoaW5nIGZyb20gc2NyYXRjaC4KPiAKCkRSTSBpcyBvbmx5IG9uZSBvZiBtYW55
IHN1YnN5c3RlbXMgdGhhdCB3aWxsIGhhdmUgdG8gZGVhbCB3aXRoIApzeW5jcG9pbnRzLCBzbyBJ
IGhhdmUgd2FudGVkIHRvIGhhdmUgYSBjZW50cmFsIHNvbHV0aW9uIGluc3RlYWQgb2YgCnJlaW1w
bGVtZW50aW5nIHRoZSBzYW1lIHN0dWZmIGV2ZXJ5d2hlcmUuIHN5bmNfZmlsZXMgc2VlbSBsaWtl
IHRoZSAKIm1pc3NpbmcgZmVhdHVyZSIsIGJ1dCB0aGV5IGFyZSBkaWZmaWN1bHQgdG8gdXNlIGl0
IHdpdGggdGhlIGZpbGVubyAKbGltaXRzLiBCdXQgYXMgaGFzIGJlZW4gc2FpZCBtYW55IHRpbWVz
LCB0aGV5IGFyZSBpbnRlbmRlZCBvbmx5IHRvIAp0cmFuc2ZlciBmZW5jZXMgYmV0d2VlbiB0aGUg
aW1wbGVtZW50YXRpb25zIGluIGluZGl2aWR1YWwgZHJpdmVycywgc28gSSAKZ3Vlc3MgSSB3aWxs
IGhhdmUgdG8gYWJhbmRvbiB0aGlzIGRyZWFtLgoKPj4gRFJNIHN5bmNvYmpzIG1heSBoYXZlIHNv
bWUgYWR2YW50YWdlcyBvdmVyIHN5bmMgZmlsZXMsIGJ1dAo+PiBhbHNvIGRpc2FkdmFudGFnZXMu
IFRoZXkgY2Fubm90IGJlIHBvbGwoKWVkLCBzbyB0aGV5IGNhbm5vdCBiZSBjb21iaW5lZAo+PiB3
aXRoIHdhaXRzIGZvciBvdGhlciByZXNvdXJjZXMuCj4gCj4gSSdtIG5vdCBzdXJlIGRvIHlvdSBt
ZWFuIGJ5ICJwb2xsIi4gU3luYyBvYmplY3Qgc3VwcG9ydHMgcG9sbGluZyB2ZXJ5IHdlbGwuCj4g
CgpJIG1lYW4gdGhlIHBvbGwvc2VsZWN0IGV0Yy4gc2VyaWVzIG9mIGZ1bmN0aW9ucywgd2hpY2gg
d2FpdCBmb3IgZmlsZSAKZGVzY3JpcHRvcnMgdG8gYmVjb21lIHJlYWR5LiBJZiB0aGVyZSdzIHNv
bWUgdHJpY2sgdGhhdCBhbGxvd3Mgc3luY29ianMgCnRvIGJlIHVzZWQgZm9yIHRoYXQsIHRoZW4g
cGxlYXNlIHRlbGwuCgpNaWtrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
