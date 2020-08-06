Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B195C23E7E4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 09:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1721C6E97B;
	Fri,  7 Aug 2020 07:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5904A6E92D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 22:57:07 +0000 (UTC)
Received: from fsav401.sakura.ne.jp (fsav401.sakura.ne.jp [133.242.250.100])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 076Mubvo002186;
 Fri, 7 Aug 2020 07:56:37 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav401.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav401.sakura.ne.jp);
 Fri, 07 Aug 2020 07:56:37 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav401.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 076Mub5U002180
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Fri, 7 Aug 2020 07:56:37 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [linux.git drm/ttm]: NULL pointer dereference upon driver probe
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <230cc360-89b9-bb39-ee7e-d68ac037345f@i-love.sakura.ne.jp>
 <e5822548-4373-5020-eb3a-9d6144b74d25@amd.com>
 <CAKMK7uH+roU10xzb4fGdTgzHq_NGwM64A6ryYR-8je4UZW+bfQ@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <2945161e-edfb-f186-2339-cc2b442a24e6@i-love.sakura.ne.jp>
Date: Fri, 7 Aug 2020 07:56:32 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uH+roU10xzb4fGdTgzHq_NGwM64A6ryYR-8je4UZW+bfQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Aug 2020 07:25:55 +0000
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC8wOC8wNyAwOjM5LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFRodSwgQXVnIDYs
IDIwMjAgYXQgNToyOCBQTSBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+IHdyb3RlOgo+Pgo+PiBNeSBiZXN0IGd1ZXNzIGlzIHRoYXQgeW91IGFyZSBmYWNpbmcgdHdv
IHNlcGFyYXRlIGJ1Z3MgaGVyZS4KPj4KPj4gQ3Jhc2ggIzEgaXMgc29tZWhvdyByZWxhdGVkIHRv
IENSVENzIGFuZCBtaWdodCBldmVuIGJlIGNhdXNlIGJ5IHRoZQo+PiBhdG9taWMtaGVscGVyIGNo
YW5nZSB5b3Ugbm90ZWQgYmVsb3cuCj4gCj4gWWVhaCwgYW5kIEkgdGhpbmsgSSBrbm93IHdoYXQn
cyBnb2luZyBvbi4gUGF0Y2ggaW5jb21pbmcuIFdoZW4gdGVzdGluZwo+IHRoYXQgcGF0Y2gsIHBs
ZWFzZSBtYWtlIHN1cmUgeW91J3JlIHRlc3Rpbmcgb24gYSBrZXJuZWwgd2l0aCBzaG93cwo+IGNy
YXNoIHBhdHRlcm4gMSwgYnV0IGlzIG5vdCBicm9rZW4gYnkgY3Jhc2ggcGF0dGVybiAyLgo+IC1E
YW5pZWwKCkkgY29uZmlybWVkIHRoYXQgdGhlIHBhdGNoIGF0IGh0dHBzOi8vbGttbC5rZXJuZWwu
b3JnL3IvMjAyMDA4MDYxNTQyMjcuMjI1NTE5Ny0xLWRhbmllbC52ZXR0ZXJAZmZ3bGwuY2gKY2hh
bmdlcyBjcmFzaCBwYXR0ZXJuIGZyb20gMSB0byAyLiBZb3UgY2FuIHNlbmQgdGhlIHBhdGNoIGZv
ciBhdm9pZGluZyBDcmFzaCAjMS4KCj4gCj4+Cj4+IENyYXNoICMyIGlzIGNhdXNlZCBiZWNhdXNl
IHZtd19ib19jcmVhdGVfYW5kX3BvcHVsYXRlKCkgdHJpZXMgdG8KPj4gbWFudWFsbHkgcG9wdWxh
dGUgYSBCTyBvYmplY3QgaW5zdGVhZCBvZiByZWx5aW5nIG9uIFRUTSB0byBkbyBpdCB3aGVuCj4+
IG5lY2Vzc2FyeS4gVGhpcyBpbmRlZWQgZG9lc24ndCB3b3JrIGFueSBtb3JlIGJlY2F1c2Ugb2Yg
ImRybS90dG06IG1ha2UKPj4gVFQgY3JlYXRpb24gcHVyZWx5IG9wdGlvbmFsIHYzIi4KPj4KPj4g
UXVlc3Rpb24gaXMgd2h5IHZtd2dmeCBpcyBkb2luZyB0aGlzPwo+Pgo+PiBSZWdhcmRzLAo+PiBD
aHJpc3RpYW4uCj4+CgpGLlkuSS4gc3l6Ym90IGlzIHJlcG9ydGluZyBhIHNpbWlsYXIgTlVMTCBw
b2ludGVyIGRlcmVmZXJlbmNlIG9uIHZpcnRpbyBhdCAKaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3Bv
dC5jb20vYnVnP2lkPTk1NTc2MzEwNWE5MTlkZjVkMTliOGVkMjZmMjQ0ZDY5OGVmMTVhYzMgLgpC
aXNlY3Rpb24gYXR0ZW1wdCBpcyBub3QgbWFkZSB5ZXQgYmVjYXVzZSByZXByb2R1Y2VyIGlzIG5v
dCBmb3VuZCB5ZXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
