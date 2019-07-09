Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3874863525
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 13:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5112B89E36;
	Tue,  9 Jul 2019 11:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C7889E36
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 11:47:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jul 2019 04:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="167964894"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [172.28.182.92])
 ([172.28.182.92])
 by orsmga003.jf.intel.com with ESMTP; 09 Jul 2019 04:47:10 -0700
Subject: Re: [PATCH 1/4] ASoC: hdmi-codec: Add an op to set callback function
 for plug event
To: Cheng-Yi Chiang <cychiang@chromium.org>
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-2-cychiang@chromium.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <3d5755cf-34e9-44f7-3b03-6bdfca84ff95@intel.com>
Date: Tue, 9 Jul 2019 13:47:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705042623.129541-2-cychiang@chromium.org>
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
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wNSAwNjoyNiwgQ2hlbmctWWkgQ2hpYW5nIHdyb3RlOgo+ICtzdGF0aWMgdm9p
ZCBoZG1pX2NvZGVjX2phY2tfcmVwb3J0KHN0cnVjdCBoZG1pX2NvZGVjX3ByaXYgKmhjcCwKPiAr
CQkJCSAgIHVuc2lnbmVkIGludCBqYWNrX3N0YXR1cykKPiArewo+ICsJaWYgKCFoY3AtPmphY2sp
Cj4gKwkJcmV0dXJuOwo+ICsKPiArCWlmIChqYWNrX3N0YXR1cyAhPSBoY3AtPmphY2tfc3RhdHVz
KSB7Cj4gKwkJc25kX3NvY19qYWNrX3JlcG9ydChoY3AtPmphY2ssIGphY2tfc3RhdHVzLCBTTkRf
SkFDS19MSU5FT1VUKTsKPiArCQloY3AtPmphY2tfc3RhdHVzID0gamFja19zdGF0dXM7Cj4gKwl9
Cj4gK30KClNpbmdsZSAiaWYiIHN0YXRlbWVudCBpbnN0ZWFkPyBUaGUgZmlyc3QgImlmIiBkb2Vz
IG5vdCBldmVuIGNvdmVyIGFsbCAKY2FzZXMgLSBpZiB0aGUgc2Vjb25kYXJ5IGNoZWNrIGZhaWxz
LCB5b3UnbGwgInJldHVybjsiIHRvby4KCj4gKy8qKgo+ICsgKiBoZG1pX2NvZGVjX3NldF9qYWNr
X2RldGVjdCAtIHJlZ2lzdGVyIEhETUkgcGx1Z2dlZCBjYWxsYmFjawo+ICsgKiBAY29tcG9uZW50
OiB0aGUgaGRtaS1jb2RlYyBpbnN0YW5jZQo+ICsgKiBAamFjazogQVNvQyBqYWNrIHRvIHJlcG9y
dCAoZGlzKWNvbm5lY3Rpb24gZXZlbnRzIG9uCj4gKyAqLwo+ICtpbnQgaGRtaV9jb2RlY19zZXRf
amFja19kZXRlY3Qoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsCj4gKwkJCSAg
ICAgICBzdHJ1Y3Qgc25kX3NvY19qYWNrICpqYWNrKQo+ICt7Cj4gKwlzdHJ1Y3QgaGRtaV9jb2Rl
Y19wcml2ICpoY3AgPSBzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wb25lbnQpOwo+
ICsJaW50IHJldDsKPiArCj4gKwlpZiAoaGNwLT5oY2Qub3BzLT5ob29rX3BsdWdnZWRfY2IpIHsK
PiArCQloY3AtPmphY2sgPSBqYWNrOwo+ICsJCXJldCA9IGhjcC0+aGNkLm9wcy0+aG9va19wbHVn
Z2VkX2NiKGNvbXBvbmVudC0+ZGV2LT5wYXJlbnQsCj4gKwkJCQkJCSAgICBoY3AtPmhjZC5kYXRh
LAo+ICsJCQkJCQkgICAgcGx1Z2dlZF9jYik7Cj4gKwkJaWYgKHJldCkgewo+ICsJCQloY3AtPmph
Y2sgPSBOVUxMOwo+ICsJCQlyZXR1cm4gcmV0Owo+ICsJCX0KPiArCQlyZXR1cm4gMDsKPiArCX0K
PiArCXJldHVybiAtRU9QTk9UU1VQUDsKPiArfQo+ICtFWFBPUlRfU1lNQk9MX0dQTChoZG1pX2Nv
ZGVjX3NldF9qYWNrX2RldGVjdCk7CgppbnQgcmV0ID0gLUVPUE5PVFNVUFA7CiguLi4pCgpyZXR1
cm4gcmV0OwoKSW4gY29uc2VxdWVuY2UsIHlvdSBjYW4gcmVkdWNlIHRoZSBudW1iZXIgb2YgInJl
dHVybihzKSIgYW5kIGFsc28gcmVtb3ZlIAp0aGUgcmVkdW5kYW50IHBhcmVudGhlc2lzIGZvciB0
aGUgaWYtc3RhdGVtZW50IHVzZWQgdG8gc2V0IGphY2sgdG8gTlVMTC4KCkN6YXJlawpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
