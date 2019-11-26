Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78010A09B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 15:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8A36E402;
	Tue, 26 Nov 2019 14:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6A06E402
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 14:44:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 06:44:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="260713664"
Received: from rosenbaf-mobl1.ger.corp.intel.com (HELO [10.252.49.190])
 ([10.252.49.190])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Nov 2019 06:44:27 -0800
Subject: Re: [PATCH] udmabuf: Remove deleted map/unmap handlers.
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191126142516.630200-1-maarten.lankhorst@linux.intel.com>
 <20191126143633.GX29965@phenom.ffwll.local>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <1ea4c2e0-38f6-6dfa-0fc1-5c6b6be9ed98@linux.intel.com>
Date: Tue, 26 Nov 2019 15:44:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191126143633.GX29965@phenom.ffwll.local>
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
Cc: linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMjYtMTEtMjAxOSBvbSAxNTozNiBzY2hyZWVmIERhbmllbCBWZXR0ZXI6Cj4gT24gVHVlLCBO
b3YgMjYsIDIwMTkgYXQgMDM6MjU6MTZQTSArMDEwMCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6
Cj4+IENvbW1pdCA3ZjBkZThkODA4MTYgKCJkbWEtYnVmOiBEcm9wIGRtYV9idWZfayh1biltYXAi
KSByZW1vdmVkIG1hcC91bm1hcAo+PiBoYW5kbGVycywgYnV0IHRoZXkgc3RpbGwgZXhpc3RlZCBp
biB1ZG1hYnVmLiBSZW1vdmUgdGhlbSB0aGVyZSBhcyB3ZWxsCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4+
IEZpeGVzOiA3ZjBkZThkODA4MTYgKCJkbWEtYnVmOiBEcm9wIGRtYV9idWZfayh1biltYXAiKQo+
PiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+PiBDYzogbGludXgtbWVkaWFAdmdl
ci5rZXJuZWwub3JnCj4+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiAvbWUgcHV0cyBvbiBicm93biBwYXBl
ciBiYWcKPgo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgpUaGFua3MsIHB1c2hlZC4gOikKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
