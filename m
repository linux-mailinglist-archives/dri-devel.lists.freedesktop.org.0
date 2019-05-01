Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC08E1063B
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 11:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C66890B3;
	Wed,  1 May 2019 09:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F93890B3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 09:00:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 02:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,417,1549958400"; d="scan'208";a="147311800"
Received: from unknown (HELO [10.103.239.88]) ([10.103.239.88])
 by fmsmga007.fm.intel.com with ESMTP; 01 May 2019 02:00:38 -0700
Subject: Re: [PATCH v2] drm: introduce a capability flag for syncobj timeline
 support
To: Dave Airlie <airlied@gmail.com>
References: <20190416123048.2913-2-lionel.g.landwerlin@intel.com>
 <20190416125750.31370-1-lionel.g.landwerlin@intel.com>
 <CAPM=9twB379VYmmwyR=A=66GUtojfEu8prn0c1p=FOHdHz8USg@mail.gmail.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <8da2a069-801c-a37c-9639-53f8a91bc5b6@intel.com>
Date: Wed, 1 May 2019 10:00:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPM=9twB379VYmmwyR=A=66GUtojfEu8prn0c1p=FOHdHz8USg@mail.gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYvMDQvMjAxOSAyMDo1MywgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4gT24gVHVlLCAxNiBBcHIg
MjAxOSBhdCAyMjo1OCwgTGlvbmVsIExhbmR3ZXJsaW4KPiA8bGlvbmVsLmcubGFuZHdlcmxpbkBp
bnRlbC5jb20+IHdyb3RlOgo+PiBVbmZvcnR1bmF0ZWx5IHVzZXJzcGFjZSB1c2VycyBvZiB0aGlz
IEFQSSBjYW5ub3QgYmUgcHVibGljbHkgZGlzY2xvc2VkCj4+IHlldC4KPj4KPj4gVGhpcyBjb21t
aXQgZWZmZWN0aXZlbHkgZGlzYWJsZXMgdGltZWxpbmUgc3luY29iaiBpb2N0bHMgZm9yIGFsbAo+
PiBkcml2ZXJzLiBFYWNoIGRyaXZlciB3aXNoaW5nIHRvIHN1cHBvcnQgdGhpcyBmZWF0dXJlIHdp
bGwgbmVlZCB0bwo+PiBleHBvc2UgRFJJVkVSX1NZTkNPQkpfVElNRUxJTkUuCj4+Cj4+IHYyOiBB
ZGQgdUFQSSBjYXBhYmlsaXR5IGNoZWNrIChDaHJpc3RpYW4pCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KPj4gUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gKHYx
KQo+PiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IENjOiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhv
dUBhbWQuY29tPgo+IExHVE0sCj4KPiBSZXZpZXdlZC1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRA
cmVkaGF0LmNvbT4KPgo+IE5vdCBzdXJlIGlmIEknbSBkdWUgYW55bW9yZSBtaXNjLW5leHQgcHVs
bHMsIGlmIHNvIHdvdWxkIGJlIGdvb2QgdG8KPiBoYXZlIGl0IGdvIHRoYXQgd2F5LCBidXQgb3Ro
ZXJ3aXNlIEkgY2FuIHB1bGwgaXQgaW50byAtbmV4dCB3aGVuIEkgZ2V0Cj4gc29tZSB0aW1lLgo+
Cj4gRGF2ZS4KPgpDaHJpc3RpYW4sIERhdmUsCgpXaG8gc2hvdWxkIHB1bGwgdGhlc2UgcGF0Y2hl
cyBpbj8KClRoYW5rcywKCi1MaW9uZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
