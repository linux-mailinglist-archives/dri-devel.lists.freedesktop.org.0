Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D31520B36C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 16:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1BB6ECA6;
	Fri, 26 Jun 2020 14:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from o1.b.az.sendgrid.net (o1.b.az.sendgrid.net [208.117.55.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615EE6ECA6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
 content-transfer-encoding;
 s=001; bh=FEGBRfIR1s0iOSC2ksl+oI8rZYqeM0zR23Uk0jXoKPc=;
 b=jvWP7omtX/XrEkbtoiUz8aVRP7W6fn2S5YZgNCGD1+yYGeGNnWtDNA3Z/c8OtxpI9Sq2
 IkSwSqRj6OMw8PeYGYci25iHhPU0N0BmjB1f96fw1MgFsmFJtwckyFNJBYvQ1JCJsgSubt
 DeZkN7J3QfX6dZ7ZJ8N49vxrQJKC4/FYI=
Received: by filterdrecv-p3las1-7754f7d4cc-h4ckv with SMTP id
 filterdrecv-p3las1-7754f7d4cc-h4ckv-20-5EF60409-55
 2020-06-26 14:19:53.796366727 +0000 UTC m=+72377.440658206
Received: from [10.13.72.114] (unknown)
 by ismtpd0007p1lon1.sendgrid.net (SG) with ESMTP
 id zPf15BMQRF-Lidn4m7Cubg Fri, 26 Jun 2020 14:19:53.332 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm: drm_fourcc: add NV20 YUV
 =?UTF-8?B?Zm9ybWF044CQ6K+35rOo5oSP77yM6YKu5Lu255SxbGludXgtcm9ja2NoaXAtYm91bmNlcytzYQ==?=
 =?us-ascii?Q?ndy=2Ehuang=3Drock-chips=2Ecom=40lists=2Einfradea?=
 =?UTF-8?B?ZC5vcmfku6Plj5HjgJE=?=
References: <20200607202521.18438-1-jonas@kwiboo.se>
 <20200607202521.18438-2-jonas@kwiboo.se>
 <d503eed1-571f-3e37-858b-b5de04cb79f7@rock-chips.com>
From: Jonas Karlman <jonas@kwiboo.se>
Message-ID: <f5c46547-3278-2226-e194-929fbfa95864@kwiboo.se>
Date: Fri, 26 Jun 2020 14:19:53 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d503eed1-571f-3e37-858b-b5de04cb79f7@rock-chips.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hy6P=2FSOgwow3R0Z8y?=
 =?us-ascii?Q?W1KoHyhm09b7AooB6A2o7db6A8+5y6zT2UI+303?=
 =?us-ascii?Q?MS9NESYX+3Km3PkmWA=2FsT9auOwL7KKFnQDKNG5H?=
 =?us-ascii?Q?4NCkW9oXZozkAglslePit1yFH6YjBLkTJDSPqca?=
 =?us-ascii?Q?gaSjOTjx+GWR7meCxxZfnAt5maVowTLsws0Cw43?=
 =?us-ascii?Q?WT6scW=2Fk=2FeTOid0rokL1Q=3D=3D?=
To: Huang Jiachai <hjc@rock-chips.com>, Heiko =?iso-8859-1?q?St=FCbner?=
 <heiko@sntech.de>
Content-Language: sv
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?b?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
 Ben Davis <ben.davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNi0xNyAxNDowNywgSHVhbmcgSmlhY2hhaSB3cm90ZToKPiBIaSBKb25hcyBLYXJs
bWFuLAo+IAo+ICDCoMKgwqAgSXMgdGhlcmUgYW4gYW5vdGhlciB5dXYgMTBiaXQgZm9ybWF0IHdp
dGggNDo0OjQgc3ViLXNpbXBsaW5nIGJ1dCAKPiBoYXMgbm8gcGFkZGluZz8KPiAKPiAgwqBNYXli
ZSB3ZSBjYW4gY2FsbCBpdCBEUk1fRk9STUFUX05WMzA6Cj4gCj4geyAuZm9ybWF0ID0gRFJNX0ZP
Uk1BVF9OVjMwLAkJLmRlcHRoID0gMCwKPiAgICAubnVtX3BsYW5lcyA9IDIsIC5jaGFyX3Blcl9i
bG9jayA9IHsgNSwgNSwgMCB9LAo+ICAgIC5ibG9ja193ID0geyA0LCAyLCAwIH0sIC5ibG9ja19o
ID0geyAxLCAxLCAwIH0sIC5oc3ViID0gMSwKPiAgICAudnN1YiA9IDEsIC5pc195dXYgPSB0cnVl
IH0sCj4gCj4gdGhpcyBmb3JtYXQgY2FuIHN1cHBvcnRlZCBieSByb2NrY2hpcCByazMyODgvcmsz
Mzk5Li4uIHBsYXRmb3JtLCBjYW4geW91IAo+IGFkZCB0aGlzIGZvcm1hdCBhdCB0aGlzIHNlcmll
cyBwYXRjaGVzPwoKSSB3aWxsIHNlbmQgYSB2MiBpbmNsdWRpbmcgdGhpcyA0OjQ6NCBmb3JtYXQg
bGF0ZXIgdGhpcyB3ZWVrZW5kLgoKSXMgdGhlcmUgYW55IGh3IGJsb2NrIG9uIHJrMzI4OC9yazMz
OTkgdGhhdCBjYW4gcHJvZHVjZSBhIGJ1ZmZlciBpbiBzdWNoIGZvcm1hdD8KSWYgSSBhbSBub3Qg
bWlzdGFrZW4gcmt2ZGVjIG9ubHkgc3VwcG9ydCAxMC1iaXQgaDI2NCBpbiA0OjI6MC80OjI6MiBh
bmQKaGV2YyA0OjI6MCAxMC1iaXQsIHRob3NlIGFyZSB0aGUgZm9ybWF0cyBJIGhhdmUgYmVlbiBh
YmxlIHRvIHRlc3Qgc28gZmFyLgoKUmVnYXJkcywKSm9uYXMKCj4gCj4g5ZyoIDIwMjAvNi84IDQ6
MjUsIEpvbmFzIEthcmxtYW4g5YaZ6YGTOgo+PiBEUk1fRk9STUFUX05WMjAgaXMgYSAyIHBsYW5l
IGZvcm1hdCBzdWl0YWJsZSBmb3IgbGluZWFyIG1lbW9yeSBsYXlvdXQuCj4+IFRoZSBmb3JtYXQg
aXMgc2ltaWxhciB0byBQMjEwIHdpdGggNDoyOjIgc3ViLXNhbXBsaW5nIGJ1dCBoYXMgbm8gcGFk
ZGluZwo+PiBiZXR3ZWVuIGNvbXBvbmVudHMuIEluc3RlYWQsIGx1bWluYW5jZSBhbmQgY2hyb21p
bmFuY2Ugc2FtcGxlcyBhcmUgZ3JvdXBlZAo+PiBpbnRvIDRzIHNvIHRoYXQgZWFjaCBncm91cCBp
cyBwYWNrZWQgaW50byBhbiBpbnRlZ2VyIG51bWJlciBvZiBieXRlczoKPj4KPj4gWVlZWSA9IFVW
VVYgPSA0ICogMTAgYml0cyA9IDQwIGJpdHMgPSA1IGJ5dGVzCj4+Cj4+IFRoZSAnMjAnIHN1ZmZp
eCByZWZlcnMgdG8gdGhlIG9wdGltdW0gZWZmZWN0aXZlIGJpdHMgcGVyIHBpeGVsIHdoaWNoIGlz
Cj4+IGFjaGlldmVkIHdoZW4gdGhlIHRvdGFsIG51bWJlciBvZiBsdW1pbmFuY2Ugc2FtcGxlcyBp
cyBhIG11bHRpcGxlIG9mIDQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEthcmxtYW4gPGpv
bmFzQGt3aWJvby5zZT4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYyAg
fCA0ICsrKysKPj4gICBpbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCB8IDEgKwo+PiAgIDIg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZvdXJjYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYwo+PiBp
bmRleCA3MjJjN2ViZTRlODguLjJhOWM4YWU3MTllZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9mb3VyY2MuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5j
Cj4+IEBAIC0yNzgsNiArMjc4LDEwIEBAIGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKl9f
ZHJtX2Zvcm1hdF9pbmZvKHUzMiBmb3JtYXQpCj4+ICAgCQkgIC5udW1fcGxhbmVzID0gMiwgLmNo
YXJfcGVyX2Jsb2NrID0geyA1LCA1LCAwIH0sCj4+ICAgCQkgIC5ibG9ja193ID0geyA0LCAyLCAw
IH0sIC5ibG9ja19oID0geyAxLCAxLCAwIH0sIC5oc3ViID0gMiwKPj4gICAJCSAgLnZzdWIgPSAy
LCAuaXNfeXV2ID0gdHJ1ZSB9LAo+PiArCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WMjAsCQku
ZGVwdGggPSAwLAo+PiArCQkgIC5udW1fcGxhbmVzID0gMiwgLmNoYXJfcGVyX2Jsb2NrID0geyA1
LCA1LCAwIH0sCj4+ICsJCSAgLmJsb2NrX3cgPSB7IDQsIDIsIDAgfSwgLmJsb2NrX2ggPSB7IDEs
IDEsIDAgfSwgLmhzdWIgPSAyLAo+PiArCQkgIC52c3ViID0gMSwgLmlzX3l1diA9IHRydWUgfSwK
Pj4gICAJCXsgLmZvcm1hdCA9IERSTV9GT1JNQVRfUTQxMCwJCS5kZXB0aCA9IDAsCj4+ICAgCQkg
IC5udW1fcGxhbmVzID0gMywgLmNoYXJfcGVyX2Jsb2NrID0geyAyLCAyLCAyIH0sCj4+ICAgCQkg
IC5ibG9ja193ID0geyAxLCAxLCAxIH0sIC5ibG9ja19oID0geyAxLCAxLCAxIH0sIC5oc3ViID0g
MCwKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVk
ZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPj4gaW5kZXggYjViZjFjMGU2MzBlLi4yNDRkMzI0MzNh
NjcgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4+ICsrKyBi
L2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4+IEBAIC0yNDIsNiArMjQyLDcgQEAgZXh0
ZXJuICJDIiB7Cj4+ICAgICogaW5kZXggMSA9IENyOkNiIHBsYW5lLCBbMzk6MF0gQ3IxOkNiMTpD
cjA6Q2IwIGxpdHRsZSBlbmRpYW4KPj4gICAgKi8KPj4gICAjZGVmaW5lIERSTV9GT1JNQVRfTlYx
NQkJZm91cmNjX2NvZGUoJ04nLCAnVicsICcxJywgJzUnKSAvKiAyeDIgc3Vic2FtcGxlZCBDcjpD
YiBwbGFuZSAqLwo+PiArI2RlZmluZSBEUk1fRk9STUFUX05WMjAJCWZvdXJjY19jb2RlKCdOJywg
J1YnLCAnMicsICcwJykgLyogMngxIHN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgKi8KPj4gICAKPj4g
ICAvKgo+PiAgICAqIDIgcGxhbmUgWUNiQ3IgTVNCIGFsaWduZWQKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
