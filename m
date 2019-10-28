Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6516CE7730
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 18:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CD46E991;
	Mon, 28 Oct 2019 17:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7CC6E990
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 17:03:04 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 10:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="210917617"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2019 10:02:57 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iP8Pw-00099G-J0; Tue, 29 Oct 2019 01:02:56 +0800
Date: Tue, 29 Oct 2019 01:02:45 +0800
From: kbuild test robot <lkp@intel.com>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v8 3/6] ASoC: rockchip_max98090: Optionally support HDMI
 use case
Message-ID: <201910290006.S8dvoBpK%lkp@intel.com>
References: <20191025133007.11190-4-cychiang@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025133007.11190-4-cychiang@chromium.org>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Liam Girdwood <lgirdwood@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 kbuild-all@lists.01.org, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hlbmctWWksCgpJIGxvdmUgeW91ciBwYXRjaCEgUGVyaGFwcyBzb21ldGhpbmcgdG8gaW1w
cm92ZToKClthdXRvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiByb2NrY2hpcC9mb3ItbmV4dF0KW2Fs
c28gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIHY1LjQtcmM1IG5leHQtMjAxOTEwMjhdCltpZiB5b3Vy
IHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBwbGVhc2UgZHJvcCB1cyBh
IG5vdGUgdG8gaGVscAppbXByb3ZlIHRoZSBzeXN0ZW0uIEJUVywgd2UgYWxzbyBzdWdnZXN0IHRv
IHVzZSAnLS1iYXNlJyBvcHRpb24gdG8gc3BlY2lmeSB0aGUKYmFzZSB0cmVlIGluIGdpdCBmb3Jt
YXQtcGF0Y2gsIHBsZWFzZSBzZWUgaHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9hLzM3NDA2OTgy
XQoKdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL0NoZW5n
LVlpLUNoaWFuZy9BZGQtSERNSS1qYWNrLXN1cHBvcnQtb24tUkszMjg4LzIwMTkxMDI4LTIxMjUw
MgpiYXNlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L21taW5kL2xpbnV4LXJvY2tjaGlwLmdpdCBmb3ItbmV4dApyZXByb2R1Y2U6CiAgICAgICAgIyBh
cHQtZ2V0IGluc3RhbGwgc3BhcnNlCiAgICAgICAgIyBzcGFyc2UgdmVyc2lvbjogdjAuNi4xLWRp
cnR5CiAgICAgICAgbWFrZSBBUkNIPXg4Nl82NCBhbGxtb2Rjb25maWcKICAgICAgICBtYWtlIEM9
MSBDRj0nLWZkaWFnbm9zdGljLXByZWZpeCAtRF9fQ0hFQ0tfRU5ESUFOX18nCgpJZiB5b3UgZml4
IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnClJlcG9ydGVkLWJ5OiBrYnVpbGQg
dGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KCgpzcGFyc2Ugd2FybmluZ3M6IChuZXcgb25lcyBw
cmVmaXhlZCBieSA+PikKCj4+IHNvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5j
OjQ3NToyMzogc3BhcnNlOiBzcGFyc2U6IHN5bWJvbCAncmtfY2FyZF9jb25maWdzJyB3YXMgbm90
IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwoKUGxlYXNlIHJldmlldyBhbmQgcG9zc2li
bHkgZm9sZCB0aGUgZm9sbG93dXAgcGF0Y2guCgotLS0KMC1EQVkga2VybmVsIHRlc3QgaW5mcmFz
dHJ1Y3R1cmUgICAgICAgICAgICAgICAgT3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50ZXIKaHR0
cHM6Ly9saXN0cy4wMS5vcmcvcGlwZXJtYWlsL2tidWlsZC1hbGwgICAgICAgICAgICAgICAgICAg
SW50ZWwgQ29ycG9yYXRpb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
