Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5819FE9F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 11:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0CC897E0;
	Wed, 28 Aug 2019 09:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74C1897E0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 09:37:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 02:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="264592725"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.6]) ([10.239.13.6])
 by orsmga001.jf.intel.com with ESMTP; 28 Aug 2019 02:37:03 -0700
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Thomas Zimmermann <tzimmermann@suse.de>, Feng Tang <feng.tang@intel.com>
References: <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
 <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
 <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
 <370747ca-4dc9-917b-096c-891dcc2aedf0@suse.de>
 <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
 <20190812072545.GA63191@shbuild999.sh.intel.com>
 <20190813093616.GA65475@shbuild999.sh.intel.com>
 <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
Date: Wed, 28 Aug 2019 17:37:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
Content-Language: en-US
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, michel@daenzer.net, lkp@01.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKT24gOC8yOC8xOSAxOjE2IEFNLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToK
PiBIaQo+Cj4gQW0gMjcuMDguMTkgdW0gMTQ6MzMgc2NocmllYiBDaGVuLCBSb25nIEE6Cj4+IEJv
dGggcGF0Y2hlcyBoYXZlIGxpdHRsZSBpbXBhY3Qgb24gdGhlIHBlcmZvcm1hbmNlIGZyb20gb3Vy
IHNpZGUuCj4gVGhhbmtzIGZvciB0ZXN0aW5nLiBUb28gYmFkIHRoZXkgZG9lc24ndCBzb2x2ZSB0
aGUgaXNzdWUuCj4KPiBUaGVyZSdzIGFub3RoZXIgcGF0Y2ggYXR0YWNoZWQuIENvdWxkIHlvdSBw
bGVhc2UgdGVzdHMgdGhpcyBhcyB3ZWxsPwo+IFRoYW5rcyBhIGxvdCEKPgo+IFRoZSBwYXRjaCBj
b21lcyBmcm9tIERhbmllbCBWZXR0ZXIgYWZ0ZXIgZGlzY3Vzc2luZyB0aGUgcHJvYmxlbSBvbiBJ
UkMuCj4gVGhlIGlkZWEgb2YgdGhlIHBhdGNoIGlzIHRoYXQgdGhlIG9sZCBtZ2FnMjAwIGNvZGUg
bWlnaHQgZGlzcGxheSBtdWNoCj4gbGVzcyBmcmFtZXMgdGhhdCB0aGUgZ2VuZXJpYyBjb2RlLCBi
ZWNhdXNlIG1nYWcyMDAgb25seSBwcmludHMgZnJvbQo+IG5vbi1hdG9taWMgY29udGV4dC4gSWYg
d2Ugc2ltdWxhdGUgdGhpcyB3aXRoIHRoZSBnZW5lcmljIGNvZGUsIHdlIHNob3VsZAo+IHNlZSBy
b3VnaGx5IHRoZSBvcmlnaW5hbCBwZXJmb3JtYW5jZS4KPgo+CgpJdCdzIGNvb2wsIHRoZSBwYXRj
aCAidXNlY2Fuc2xlZXAucGF0Y2giIGNhbiBmaXggdGhlIGlzc3VlLgoKY29tbWl0OgogwqAgZjFm
ODU1NWRmYjkgZHJtL2JvY2hzOiBVc2Ugc2hhZG93IGJ1ZmZlciBmb3IgYm9jaHMgZnJhbWVidWZm
ZXIgY29uc29sZQogwqAgOTBmNDc5YWU1MWEgZHJtL21nYWcyMDA6IFJlcGxhY2Ugc3RydWN0IG1n
YV9mYmRldiB3aXRoIGdlbmVyaWMgCmZyYW1lYnVmZmVyIGVtdWxhdGlvbgogwqAgYjk3NmIwNGMy
YmMgb25seSBzY2hlZHVsZSB3b3JrZXIgZnJvbSBub24tYXRvbWljIGNvbnRleHQKCmYxZjg1NTVk
ZmI5YTcwYTLCoCA5MGY0NzlhZTUxYWZhNDVlZmFiOTdhZmRkZSBiOTc2YjA0YzJiY2YzMzE0OGQ2
YzdiYzFhMsKgIAp0ZXN0Y2FzZS90ZXN0cGFyYW1zL3Rlc3Rib3gKLS0tLS0tLS0tLS0tLS0tLcKg
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0twqAg
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogwqDCoMKgwqDCoMKgwqDCoCAlc3RkZGV2wqDC
oMKgwqDCoCBjaGFuZ2XCoMKgwqDCoMKgwqDCoMKgICVzdGRkZXbCoMKgwqDCoMKgIGNoYW5nZSAl
c3RkZGV2CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFzCoMKgwqDCoMKgwqDCoMKgwqAgfCBcCiDCoMKg
wqDCoCA0MjkxMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtMTUlwqDCoMKgwqDCoCAzNjUxNyA0
NDA5MyAKdm0tc2NhbGFiaWxpdHkvcGVyZm9ybWFuY2UtMzAwcy04VC1hbm9uLWNvdy1zZXEtaHVn
ZXRsYi9sa3Ata25tMDEKIMKgwqDCoMKgIDQyOTEywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0x
NSXCoMKgwqDCoMKgIDM2NTE3IDQ0MDkzwqDCoMKgwqDCoMKgwqAgR0VPLU1FQU4gCnZtLXNjYWxh
YmlsaXR5Lm1lZGlhbgoKQmVzdCBSZWdhcmRzLApSb25nIENoZW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
