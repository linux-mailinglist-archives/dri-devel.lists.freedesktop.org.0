Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C11A8E772F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 18:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E63E6E990;
	Mon, 28 Oct 2019 17:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C766E990
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 17:03:03 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 10:03:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="203319319"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 28 Oct 2019 10:02:57 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iP8Pw-0009Bk-RH; Tue, 29 Oct 2019 01:02:56 +0800
Date: Tue, 29 Oct 2019 01:02:46 +0800
From: kbuild test robot <lkp@intel.com>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [RFC PATCH] ASoC: rockchip_max98090: rk_card_configs[] can be static
Message-ID: <20191028170246.5uhqmm4gc576yrsh@4978f4969bb8>
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

CkZpeGVzOiAwY2MwOTIyYWU4NDkgKCJBU29DOiByb2NrY2hpcF9tYXg5ODA5MDogT3B0aW9uYWxs
eSBzdXBwb3J0IEhETUkgdXNlIGNhc2UiKQpTaWduZWQtb2ZmLWJ5OiBrYnVpbGQgdGVzdCByb2Jv
dCA8bGtwQGludGVsLmNvbT4KLS0tCiByb2NrY2hpcF9tYXg5ODA5MC5jIHwgICAgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
c291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX21heDk4MDkwLmMgYi9zb3VuZC9zb2Mvcm9ja2No
aXAvcm9ja2NoaXBfbWF4OTgwOTAuYwppbmRleCA1NTBlNTc3ODk3MTk4Li5hNDc2NzQ5OTMxMzg3
IDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYworKysg
Yi9zb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYwpAQCAtNDcyLDcgKzQ3Miw3
IEBAIHN0YXRpYyBpbnQgc25kX3JrX21jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RydWN0IHJrX2NhcmRfY29uZmlnIHJrX2NhcmRfY29u
Zmlnc1tdID0geworc3RhdGljIHN0cnVjdCBya19jYXJkX2NvbmZpZyBya19jYXJkX2NvbmZpZ3Nb
XSA9IHsKIAlbUktfVVNFX01BWDk4MDkwXSA9IHsKIAkJLnVzYWdlID0gUktfVVNFX01BWDk4MDkw
LAogCQkuY2FyZCA9ICZyb2NrY2hpcF9tYXg5ODA5MF9jYXJkLApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
