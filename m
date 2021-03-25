Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87283348CEA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA0A6ECEE;
	Thu, 25 Mar 2021 09:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 473 seconds by postgrey-1.36 at gabe;
 Thu, 25 Mar 2021 08:24:58 UTC
Received: from vulcan.natalenko.name (vulcan.natalenko.name [104.207.131.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646BF6EB40
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 08:24:58 +0000 (UTC)
Received: from localhost (kaktus.kanapka.ml [151.237.229.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id 983589F89B3;
 Thu, 25 Mar 2021 09:17:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1616660222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bh7wP2L3MUfdWgUnQuBUElgHs80OttJY20MheoOX9z0=;
 b=kQTslmY70D+XU8hjEh8DFuJnXj25xjL2XNEaBKRcuvuP2/wrjZ8BMGKZKdUcDE9WV77jTD
 ub2HCCrifZzp4J45mkD5VPV2wM3IWielQptu5QYeAXofs7jz8r4RcLAmCBXZicV6VMlhoU
 oexebAnGATmsBpI5eo35dMt2nO1eBFQ=
Date: Thu, 25 Mar 2021 09:17:02 +0100
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org
Subject: Re: WARNING: AMDGPU DRM warning in 5.11.9
Message-ID: <20210325081702.5kdzp7moqhcox65b@spock.localdomain>
References: <CAK2bqVJ+=nHTK-hnUC=qL1mcOvHWTCwDMYPBKJp77QCbBvBGGw@mail.gmail.com>
 <a38a3c04-4ac8-01a6-da69-a2bdaa54f61d@pp.inet.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a38a3c04-4ac8-01a6-da69-a2bdaa54f61d@pp.inet.fi>
X-Mailman-Approved-At: Thu, 25 Mar 2021 09:30:06 +0000
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
Cc: David Airlie <airlied@linux.ie>, Chris Rankin <rankincj@gmail.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Huang Rui <ray.huang@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Ilkka Prusi <ilkka.prusi@pp.inet.fi>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8uCgpPbiBUaHUsIE1hciAyNSwgMjAyMSBhdCAwNzo1NzozM0FNICswMjAwLCBJbGtrYSBQ
cnVzaSB3cm90ZToKPiBPbiAyNC4zLjIwMjEgMTYuMTYsIENocmlzIFJhbmtpbiB3cm90ZToKPiA+
IEhpLAo+ID4gCj4gPiBUaGVlZSB3YXJuaW5ncyBhcmVzIG5vdCBwcmVzZW50IGluIG15IGRtZXNn
IGxvZyBmcm9tIDUuMTEuODoKPiA+IAo+ID4gWyAgIDQzLjM5MDE1OV0gLS0tLS0tLS0tLS0tWyBj
dXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gPiBbICAgNDMuMzkzNTc0XSBXQVJOSU5HOiBDUFU6IDIg
UElEOiAxMjY4IGF0Cj4gPiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jOjUxNyB0dG1fYm9f
cmVsZWFzZSsweDE3Mi8weDI4MiBbdHRtXQo+ID4gWyAgIDQzLjQwMTk0MF0gTW9kdWxlcyBsaW5r
ZWQgaW46IG5mX25hdF9mdHAgbmZfY29ubnRyYWNrX2Z0cCBjZmc4MDIxMQo+IAo+IENoYW5naW5n
IFdBUk5fT04gdG8gV0FSTl9PTl9PTkNFIGluIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMK
PiB0dG1fYm9fcmVsZWFzZSgpIHJlZHVjZXMgdGhlIGZsb29kIG9mIG1lc3NhZ2VzIGludG8gc2lu
Z2xlIHNwbGF0Lgo+IAo+IFRoaXMgd2FybmluZyBhcHBlYXJzIHRvIGNvbWUgZnJvbSA1N2ZjZDU1
MGViMTViY2UgKCJkcm0vdHRtOiBXYXJuIG9uIHBpbm5pbmcKPiB3aXRob3V0IGhvbGRpbmcgYSBy
ZWZlcmVuY2UpIiBhbmQgcmV2ZXJ0aW5nIGl0IG1pZ2h0IGJlIG9uZSBjaG9pY2UuCj4gCj4gCj4g
PiAKPiA+IFRoZXJlIGFyZSBvdGhlcnMsIGJ1dCBJIGFtIGFzc3VtaW5nIHRoZXJlIGlzIGEgY29t
bW9uIGNhdXNlIGhlcmUuCj4gPiAKPiA+IENoZWVycywKPiA+IENocmlzCj4gPiAKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMKPiBpbmRleCBhNzZlYjJjMTRlOGMuLjUwYjUzMzU1YjI2NSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYwo+IEBAIC01MTQsNyArNTE0LDcgQEAgc3RhdGljIHZvaWQgdHRtX2JvX3Jl
bGVhc2Uoc3RydWN0IGtyZWYgKmtyZWYpCj4gICAgICAgICAgICAgICAgICAqIHNocmlua2Vycywg
bm93IHRoYXQgdGhleSBhcmUgcXVldWVkIGZvcgo+ICAgICAgICAgICAgICAgICAgKiBkZXN0cnVj
dGlvbi4KPiAgICAgICAgICAgICAgICAgICovCj4gLSAgICAgICAgICAgICAgIGlmIChXQVJOX09O
KGJvLT5waW5fY291bnQpKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChXQVJOX09OX09OQ0UoYm8t
PnBpbl9jb3VudCkpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBiby0+cGluX2NvdW50ID0g
MDsKPiAgICAgICAgICAgICAgICAgICAgICAgICB0dG1fYm9fZGVsX2Zyb21fbHJ1KGJvKTsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICB0dG1fYm9fYWRkX21lbV90b19scnUoYm8sICZiby0+bWVt
KTsKPiAKPiAKPiAKPiAtLQo+ICAtIElsa2thCj4gCgpXQVJOX09OX09OQ0UoKSB3aWxsIGp1c3Qg
aGlkZSB0aGUgdW5kZXJseWluZyBwcm9ibGVtLiBEbyB3ZSBrbm93IHdoeQp0aGlzIGhhcHBlbnMg
YXQgYWxsPwoKU2FtZSBmb3IgbWUsIEJUVywgd2l0aCB2NS4xMS45OgoKYGBgClt+XT4gbHNwY2kg
fCBncmVwIFZHQQowYTowMC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IEFkdmFuY2VkIE1p
Y3JvIERldmljZXMsIEluYy4gW0FNRC9BVEldIExleGEgUFJPIFtSYWRlb24gNTQwLzU0MFgvNTUw
LzU1MFggLyBSWCA1NDBYLzU1MC81NTBYXSAocmV2IGM3KQoKWyAzNjc2LjAzMzE0MF0gLS0tLS0t
LS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tClsgMzY3Ni4wMzMxNTNdIFdBUk5JTkc6IENQ
VTogNyBQSUQ6IDEzMTggYXQgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYzo1MTcgdHRtX2Jv
X3JlbGVhc2UrMHgzNzUvMHg1MDAgW3R0bV0K4oCmClsgMzY3Ni4wMzMzNDBdIEhhcmR3YXJlIG5h
bWU6IEFTVVMgU3lzdGVtIFByb2R1Y3QgTmFtZS9Qcm8gV1MgWDU3MC1BQ0UsIEJJT1MgMzMwMiAw
My8wNS8yMDIxCuKApgpbIDM2NzYuMDMzNDY5XSBDYWxsIFRyYWNlOgpbIDM2NzYuMDMzNDczXSAg
dHRtX2JvX21vdmVfYWNjZWxfY2xlYW51cCsweDFhYi8weDNhMCBbdHRtXQpbIDM2NzYuMDMzNDc4
XSAgYW1kZ3B1X2JvX21vdmUrMHgzMzQvMHg4NjAgW2FtZGdwdV0KWyAzNjc2LjAzMzU4MF0gIHR0
bV9ib192YWxpZGF0ZSsweDFmMS8weDJkMCBbdHRtXQpbIDM2NzYuMDMzNTg1XSAgYW1kZ3B1X2Nz
X2JvX3ZhbGlkYXRlKzB4OWIvMHgxYzAgW2FtZGdwdV0KWyAzNjc2LjAzMzY2NV0gIGFtZGdwdV9j
c19saXN0X3ZhbGlkYXRlKzB4MTE1LzB4MTUwIFthbWRncHVdClsgMzY3Ni4wMzM3NDNdICBhbWRn
cHVfY3NfaW9jdGwrMHg4NzMvMHgyMGEwIFthbWRncHVdClsgMzY3Ni4wMzM5NjBdICBkcm1faW9j
dGxfa2VybmVsKzB4YjgvMHgxNDAgW2RybV0KWyAzNjc2LjAzMzk3N10gIGRybV9pb2N0bCsweDIy
Mi8weDNjMCBbZHJtXQpbIDM2NzYuMDM0MDcxXSAgYW1kZ3B1X2RybV9pb2N0bCsweDQ5LzB4ODAg
W2FtZGdwdV0KWyAzNjc2LjAzNDE0NV0gIF9feDY0X3N5c19pb2N0bCsweDgzLzB4YjAKWyAzNjc2
LjAzNDE0OV0gIGRvX3N5c2NhbGxfNjQrMHgzMy8weDQwCuKApgpbIDM2NzYuMDM0MTcxXSAtLS1b
IGVuZCB0cmFjZSA2NmU5ODY1YjAyNzExMmYzIF0tLS0KYGBgCgpUaGFua3MuCgotLSAKICBPbGVr
c2FuZHIgTmF0YWxlbmtvIChwb3N0LWZhY3R1bSkKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
