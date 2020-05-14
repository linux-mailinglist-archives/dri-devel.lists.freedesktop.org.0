Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB1A1D34F9
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 17:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E2E6E33E;
	Thu, 14 May 2020 15:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 776296E33E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 15:23:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3C8D1FB;
 Thu, 14 May 2020 08:23:27 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 842E03F71E;
 Thu, 14 May 2020 08:23:27 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 4AEF76822A7; Thu, 14 May 2020 16:23:26 +0100 (BST)
Date: Thu, 14 May 2020 16:23:26 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 13/36] drm/arm: remove _unlocked suffix in
 drm_object_put_unlocked
Message-ID: <20200514152326.GM159988@e110455-lin.cambridge.arm.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-14-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507150822.114464-14-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDcsIDIwMjAgYXQgMDQ6MDc6NTlQTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4g
Cj4gU3BlbGxpbmcgb3V0IF91bmxvY2tlZCBmb3IgZWFjaCBhbmQgZXZlcnkgZHJpdmVyIGlzIGEg
YW5ub3lpbmcuCj4gRXNwZWNpYWxseSBpZiB3ZSBjb25zaWRlciBob3cgbWFueSBkcml2ZXJzLCBk
byBub3Qga25vdyAob3IgbmVlZCB0bykKPiBhYm91dCB0aGUgaG9ycm9yIHN0b3JpZXMgaW52b2x2
aW5nIHN0cnVjdF9tdXRleC4KPiAKPiBKdXN0IGRyb3AgdGhlIHN1ZmZpeC4gSXQgbWFrZXMgdGhl
IEFQSSBjbGVhbmVyLgo+IAo+IERvbmUgdmlhIHRoZSBmb2xsb3dpbmcgc2NyaXB0Ogo+IAo+IF9f
ZnJvbT1kcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQKPiBfX3RvPWRybV9nZW1fb2JqZWN0X3B1
dAo+IGZvciBfX2ZpbGUgaW4gJChnaXQgZ3JlcCAtLW5hbWUtb25seSAkX19mcm9tKTsgZG8KPiAg
IHNlZCAtaSAgInMvJF9fZnJvbS8kX190by9nIiAkX19maWxlOwo+IGRvbmUKPiAKPiBDYzogTGl2
aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxp
dml1LmR1ZGF1QGFybS5jb20+CgpUaGFua3MgZm9yIHRoZSBjbGVhbnVwIQoKQmVzdCByZWdhcmRz
LApMaXZpdQoKPiBDYzogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgo+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gU2lnbmVkLW9mZi1ieTogRW1pbCBW
ZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYyB8IDYgKysrLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jICAgICAgICAgICAgICAgICAgICAgICAg
fCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9mcmFtZWJ1ZmZlci5jCj4gaW5kZXggMWIwMWE2MjVmNDBlLi4xNzBmOWRjOGVjMTkg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZnJhbWVidWZmZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2ZyYW1lYnVmZmVyLmMKPiBAQCAtMTksNyArMTksNyBAQCBzdGF0aWMgdm9pZCBrb21l
ZGFfZmJfZGVzdHJveShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYikKPiAgCXUzMiBpOwo+ICAK
PiAgCWZvciAoaSA9IDA7IGkgPCBmYi0+Zm9ybWF0LT5udW1fcGxhbmVzOyBpKyspCj4gLQkJZHJt
X2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKGZiLT5vYmpbaV0pOwo+ICsJCWRybV9nZW1fb2JqZWN0
X3B1dChmYi0+b2JqW2ldKTsKPiAgCj4gIAlkcm1fZnJhbWVidWZmZXJfY2xlYW51cChmYik7Cj4g
IAlrZnJlZShrZmIpOwo+IEBAIC0xMDMsNyArMTAzLDcgQEAga29tZWRhX2ZiX2FmYmNfc2l6ZV9j
aGVjayhzdHJ1Y3Qga29tZWRhX2ZiICprZmIsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiAgCXJl
dHVybiAwOwo+ICAKPiAgY2hlY2tfZmFpbGVkOgo+IC0JZHJtX2dlbV9vYmplY3RfcHV0X3VubG9j
a2VkKG9iaik7Cj4gKwlkcm1fZ2VtX29iamVjdF9wdXQob2JqKTsKPiAgCXJldHVybiAtRUlOVkFM
Owo+ICB9Cj4gIAo+IEBAIC0xOTksNyArMTk5LDcgQEAga29tZWRhX2ZiX2NyZWF0ZShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsCj4gIAo+ICBlcnJfY2xlYW51
cDoKPiAgCWZvciAoaSA9IDA7IGkgPCBrZmItPmJhc2UuZm9ybWF0LT5udW1fcGxhbmVzOyBpKysp
Cj4gLQkJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKGtmYi0+YmFzZS5vYmpbaV0pOwo+ICsJ
CWRybV9nZW1fb2JqZWN0X3B1dChrZmItPmJhc2Uub2JqW2ldKTsKPiAgCj4gIAlrZnJlZShrZmIp
Owo+ICAJcmV0dXJuIEVSUl9QVFIocmV0KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9tYWxpZHBfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYwo+IGlu
ZGV4IGRlZjhjOWZmYWZjYS4uYzI1MDdiN2Q4NTEyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vbWFsaWRwX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBf
ZHJ2LmMKPiBAQCAtMzQ5LDExICszNDksMTEgQEAgbWFsaWRwX3ZlcmlmeV9hZmJjX2ZyYW1lYnVm
ZmVyX3NpemUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgCWlmIChvYmpzLT5zaXplIDwgYWZi
Y19zaXplKSB7Cj4gIAkJRFJNX0RFQlVHX0tNUygiYnVmZmVyIHNpemUgKCV6dSkgdG9vIHNtYWxs
IGZvciBBRkJDIGJ1ZmZlciBzaXplID0gJXVcbiIsCj4gIAkJCSAgICAgIG9ianMtPnNpemUsIGFm
YmNfc2l6ZSk7Cj4gLQkJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9ianMpOwo+ICsJCWRy
bV9nZW1fb2JqZWN0X3B1dChvYmpzKTsKPiAgCQlyZXR1cm4gZmFsc2U7Cj4gIAl9Cj4gIAo+IC0J
ZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9ianMpOwo+ICsJZHJtX2dlbV9vYmplY3RfcHV0
KG9ianMpOwo+ICAKPiAgCXJldHVybiB0cnVlOwo+ICB9Cj4gLS0gCj4gMi4yNS4xCj4gCgotLSAK
PT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29ybGQs
ICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2UgY29k
ZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
