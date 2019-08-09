Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A29A3879E5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 14:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D516EDF7;
	Fri,  9 Aug 2019 12:26:13 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BE46EDF7
 for <dri-devel@freedesktop.org>; Fri,  9 Aug 2019 12:26:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 05:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="186653335"
Received: from bvonhage-mobl2.ger.corp.intel.com (HELO [10.252.35.153])
 ([10.252.35.153])
 by orsmga002.jf.intel.com with ESMTP; 09 Aug 2019 05:26:10 -0700
Subject: Re: [PATCH v4 1/1] drm/syncobj: add sideband payload
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@freedesktop.org
References: <20190809113030.2547-1-lionel.g.landwerlin@intel.com>
 <20190809113030.2547-2-lionel.g.landwerlin@intel.com>
 <156535104115.29541.10253048719287893942@skylake-alporthouse-com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <ee964f2a-088d-cce7-4040-0eff143d9b8b@intel.com>
Date: Fri, 9 Aug 2019 15:26:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156535104115.29541.10253048719287893942@skylake-alporthouse-com>
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
Cc: Christian Koenig <Christian.Koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDkvMDgvMjAxOSAxNDo0NCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgTGlvbmVs
IExhbmR3ZXJsaW4gKDIwMTktMDgtMDkgMTI6MzA6MzApCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3VhcGkvZHJtL2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm0uaAo+PiBpbmRleCA4YTViMmY4
ZjhlYjkuLjFjZTgzODUzZjk5NyAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm0u
aAo+PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybS5oCj4+IEBAIC03ODUsNiArNzg1LDIyIEBA
IHN0cnVjdCBkcm1fc3luY29ial90aW1lbGluZV9hcnJheSB7Cj4+ICAgICAgICAgIF9fdTMyIHBh
ZDsKPj4gICB9Owo+PiAgIAo+PiArc3RydWN0IGRybV9zeW5jb2JqX2JpbmFyeV9hcnJheSB7Cj4+
ICsgICAgICAgLyogQSBwb2ludGVyIHRvIGFuIGFycmF5IG9mIHUzMiBzeW5jb2JqIGhhbmRsZXMu
ICovCj4+ICsgICAgICAgX191NjQgaGFuZGxlczsKPj4gKyAgICAgICAvKiBBIHBvaW50ZXIgdG8g
YW4gYXJyYXkgb2YgdTMyIGFjY2VzcyBmbGFncyBmb3IgZWFjaCBoYW5kbGUuICovCj4+ICsgICAg
ICAgX191NjQgYWNjZXNzX2ZsYWdzOwo+PiArICAgICAgIC8qIFRoZSBiaW5hcnkgdmFsdWUgb2Yg
YSBzeW5jb2JqIGlzIHJlYWQgYmVmb3JlIGl0IGlzIGluY3JlbWVudGVkLiAqLwo+PiArI2RlZmlu
ZSBJOTE1X0RSTV9TWU5DT0JKX0JJTkFSWV9JVEVNX1ZBTFVFX1JFQUQgKDF1IDw8IDApCj4+ICsj
ZGVmaW5lIEk5MTVfRFJNX1NZTkNPQkpfQklOQVJZX0lURU1fVkFMVUVfSU5DICAoMXUgPDwgMSkK
PiBZb3UncmUgbm90IGluIEthbnNhcyBhbnltb3JlIDspCj4gLUNocmlzCj4KV2hpY2ggbWVhbnM/
IDopCgoKLUxpb25lbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
