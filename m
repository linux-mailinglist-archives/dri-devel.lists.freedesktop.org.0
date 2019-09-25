Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D23BD9A7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 10:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EE16E05C;
	Wed, 25 Sep 2019 08:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B98C6E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 08:17:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 01:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; d="scan'208";a="188715471"
Received: from timmpete-desk1.ger.corp.intel.com (HELO [10.252.55.52])
 ([10.252.55.52])
 by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2019 01:17:54 -0700
Subject: Re: [PATCH 1/3] drm: Add some new format DRM_FORMAT_NVXX_10
To: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <1569398801-92201-1-git-send-email-hjc@rock-chips.com>
 <1569398801-92201-2-git-send-email-hjc@rock-chips.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <8cd915d3-9f61-abdc-7fd1-a9241777f29a@linux.intel.com>
Date: Wed, 25 Sep 2019 10:17:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1569398801-92201-2-git-send-email-hjc@rock-chips.com>
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
Cc: Ayan.Halder@arm.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMjUtMDktMjAxOSBvbSAxMDowNiBzY2hyZWVmIFNhbmR5IEh1YW5nOgo+IFRoZXNlIG5ldyBm
b3JtYXQgaXMgc3VwcG9ydGVkIGJ5IHNvbWUgcm9ja2NoaXAgc29jczoKPgo+IERSTV9GT1JNQVRf
TlYxMl8xMC9EUk1fRk9STUFUX05WMjFfMTAKPiBEUk1fRk9STUFUX05WMTZfMTAvRFJNX0ZPUk1B
VF9OVjYxXzEwCj4gRFJNX0ZPUk1BVF9OVjI0XzEwL0RSTV9GT1JNQVRfTlY0Ml8xMAo+Cj4gU2ln
bmVkLW9mZi1ieTogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYyAgfCAxOCArKysrKysrKysrKysrKysrKysKPiAgaW5j
bHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggfCAxNCArKysrKysrKysrKysrKwo+ICAyIGZpbGVz
IGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZvdXJjYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYwo+IGluZGV4IGM2
MzAwNjQuLmYyNWZhODEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2Mu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKPiBAQCAtMjc0LDYgKzI3NCwy
NCBAQCBjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpfX2RybV9mb3JtYXRfaW5mbyh1MzIg
Zm9ybWF0KQo+ICAJCXsgLmZvcm1hdCA9IERSTV9GT1JNQVRfWVVWNDIwXzEwQklULCAgICAuZGVw
dGggPSAwLAo+ICAJCSAgLm51bV9wbGFuZXMgPSAxLCAuY3BwID0geyAwLCAwLCAwIH0sIC5oc3Vi
ID0gMiwgLnZzdWIgPSAyLAo+ICAJCSAgLmlzX3l1diA9IHRydWUgfSwKPiArCQl7IC5mb3JtYXQg
PSBEUk1fRk9STUFUX05WMTJfMTAsCQkuZGVwdGggPSAwLAo+ICsJCSAgLm51bV9wbGFuZXMgPSAy
LCAuY3BwID0geyAwLCAwLCAwIH0sIC5oc3ViID0gMiwgLnZzdWIgPSAyLAo+ICsJCSAgLmlzX3l1
diA9IHRydWUgfSwKPiArCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WMjFfMTAsCQkuZGVwdGgg
PSAwLAo+ICsJCSAgLm51bV9wbGFuZXMgPSAyLCAuY3BwID0geyAwLCAwLCAwIH0sIC5oc3ViID0g
MiwgLnZzdWIgPSAyLAo+ICsJCSAgLmlzX3l1diA9IHRydWUgfSwKPiArCQl7IC5mb3JtYXQgPSBE
Uk1fRk9STUFUX05WMTZfMTAsCQkuZGVwdGggPSAwLAo+ICsJCSAgLm51bV9wbGFuZXMgPSAyLCAu
Y3BwID0geyAwLCAwLCAwIH0sIC5oc3ViID0gMiwgLnZzdWIgPSAxLAo+ICsJCSAgLmlzX3l1diA9
IHRydWUgfSwKPiArCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WNjFfMTAsCQkuZGVwdGggPSAw
LAo+ICsJCSAgLm51bV9wbGFuZXMgPSAyLCAuY3BwID0geyAwLCAwLCAwIH0sIC5oc3ViID0gMiwg
LnZzdWIgPSAxLAo+ICsJCSAgLmlzX3l1diA9IHRydWUgfSwKPiArCQl7IC5mb3JtYXQgPSBEUk1f
Rk9STUFUX05WMjRfMTAsCQkuZGVwdGggPSAwLAo+ICsJCSAgLm51bV9wbGFuZXMgPSAyLCAuY3Bw
ID0geyAwLCAwLCAwIH0sIC5oc3ViID0gMSwgLnZzdWIgPSAxLAo+ICsJCSAgLmlzX3l1diA9IHRy
dWUgfSwKPiArCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WNDJfMTAsCQkuZGVwdGggPSAwLAo+
ICsJCSAgLm51bV9wbGFuZXMgPSAyLCAuY3BwID0geyAwLCAwLCAwIH0sIC5oc3ViID0gMSwgLnZz
dWIgPSAxLAo+ICsJCSAgLmlzX3l1diA9IHRydWUgfSwKPiAgCX07Cj4gIAo+ICAJdW5zaWduZWQg
aW50IGk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5j
bHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiBpbmRleCAzZmVlYWEzLi4wNDc5ZjQ3IDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gKysrIGIvaW5jbHVkZS91
YXBpL2RybS9kcm1fZm91cmNjLmgKPiBAQCAtMjM4LDYgKzIzOCwyMCBAQCBleHRlcm4gIkMiIHsK
PiAgI2RlZmluZSBEUk1fRk9STUFUX05WNDIJCWZvdXJjY19jb2RlKCdOJywgJ1YnLCAnNCcsICcy
JykgLyogbm9uLXN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8KPiAgCj4gIC8qCj4gKyAqIDIgcGxh
bmUgWUNiQ3IgMTBiaXQKPiArICogaW5kZXggMCA9IFkgcGxhbmUsIFs5OjBdIFkKPiArICogaW5k
ZXggMSA9IENyOkNiIHBsYW5lLCBbMTk6MF0KPiArICogb3IKPiArICogaW5kZXggMSA9IENiOkNy
IHBsYW5lLCBbMTk6MF0KPiArICovCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjEyXzEwCWZvdXJj
Y19jb2RlKCdOJywgJ0EnLCAnMScsICcyJykgLyogMngyIHN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUg
Ki8KPiArI2RlZmluZSBEUk1fRk9STUFUX05WMjFfMTAJZm91cmNjX2NvZGUoJ04nLCAnQScsICcy
JywgJzEnKSAvKiAyeDIgc3Vic2FtcGxlZCBDYjpDciBwbGFuZSAqLwo+ICsjZGVmaW5lIERSTV9G
T1JNQVRfTlYxNl8xMAlmb3VyY2NfY29kZSgnTicsICdBJywgJzEnLCAnNicpIC8qIDJ4MSBzdWJz
YW1wbGVkIENyOkNiIHBsYW5lICovCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjYxXzEwCWZvdXJj
Y19jb2RlKCdOJywgJ0EnLCAnNicsICcxJykgLyogMngxIHN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUg
Ki8KPiArI2RlZmluZSBEUk1fRk9STUFUX05WMjRfMTAJZm91cmNjX2NvZGUoJ04nLCAnQScsICcy
JywgJzQnKSAvKiBub24tc3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAqLwo+ICsjZGVmaW5lIERSTV9G
T1JNQVRfTlY0Ml8xMAlmb3VyY2NfY29kZSgnTicsICdBJywgJzQnLCAnMicpIC8qIG5vbi1zdWJz
YW1wbGVkIENiOkNyIHBsYW5lICovCj4gKwo+ICsvKgo+ICAgKiAyIHBsYW5lIFlDYkNyIE1TQiBh
bGlnbmVkCj4gICAqIGluZGV4IDAgPSBZIHBsYW5lLCBbMTU6MF0gWTp4IFsxMDo2XSBsaXR0bGUg
ZW5kaWFuCj4gICAqIGluZGV4IDEgPSBDcjpDYiBwbGFuZSwgWzMxOjBdIENyOng6Q2I6eCBbMTA6
NjoxMDo2XSBsaXR0bGUgZW5kaWFuCgpXaGF0IGFyZSB0aGUgb3RoZXIgYml0cywgdGhleSBhcmUg
bm90IG1lbnRpb25lZD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
