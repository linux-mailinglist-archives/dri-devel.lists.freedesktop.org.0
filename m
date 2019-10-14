Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88846D5D49
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 10:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B79689CDF;
	Mon, 14 Oct 2019 08:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC3C89CDF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 08:21:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 01:21:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,295,1566889200"; d="scan'208";a="185427916"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 14 Oct 2019 01:21:12 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iJvbM-000AQz-Ag; Mon, 14 Oct 2019 16:21:12 +0800
Date: Mon, 14 Oct 2019 16:20:35 +0800
From: kbuild test robot <lkp@intel.com>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Message-ID: <201910141613.yQjiYkB1%lkp@intel.com>
References: <55295c49503a963f3417b917fd7163feb26ed0b6.1570760115.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55295c49503a963f3417b917fd7163feb26ed0b6.1570760115.git.xji@analogixsemi.com>
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
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, kbuild-all@lists.01.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWGluLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2ghIFBlcmhhcHMgc29tZXRoaW5nIHRvIGlt
cHJvdmU6CgpbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gbGludXMvbWFzdGVyXQpbY2Fubm90
IGFwcGx5IHRvIHY1LjQtcmMzIG5leHQtMjAxOTEwMTFdCltpZiB5b3VyIHBhdGNoIGlzIGFwcGxp
ZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBwbGVhc2UgZHJvcCB1cyBhIG5vdGUgdG8gaGVscApp
bXByb3ZlIHRoZSBzeXN0ZW0uIEJUVywgd2UgYWxzbyBzdWdnZXN0IHRvIHVzZSAnLS1iYXNlJyBv
cHRpb24gdG8gc3BlY2lmeSB0aGUKYmFzZSB0cmVlIGluIGdpdCBmb3JtYXQtcGF0Y2gsIHBsZWFz
ZSBzZWUgaHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9hLzM3NDA2OTgyXQoKdXJsOiAgICBodHRw
czovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL1hpbi1KaS9kdC1iaW5kaW5ncy1k
cm0tYnJpZGdlLWFueDc2MjUtTUlQSS10by1EUC10cmFuc21pdHRlci1iaW5kaW5nLzIwMTkxMDE0
LTA0MzAxOQpyZXByb2R1Y2U6CiAgICAgICAgIyBhcHQtZ2V0IGluc3RhbGwgc3BhcnNlCiAgICAg
ICAgIyBzcGFyc2UgdmVyc2lvbjogdjAuNi4xLXJjMS00My1nMGNjYjNiNC1kaXJ0eQogICAgICAg
IG1ha2UgQVJDSD14ODZfNjQgYWxsbW9kY29uZmlnCiAgICAgICAgbWFrZSBDPTEgQ0Y9Jy1mZGlh
Z25vc3RpYy1wcmVmaXggLURfX0NIRUNLX0VORElBTl9fJwoKSWYgeW91IGZpeCB0aGUgaXNzdWUs
IGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZwpSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+CgoKc3BhcnNlIHdhcm5pbmdzOiAobmV3IG9uZXMgcHJlZml4ZWQgYnkg
Pj4pCgo+PiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYzo3MzE6MTA6
IHNwYXJzZTogc3BhcnNlOiBzeW1ib2wgJ0FOWF9PVUknIHdhcyBub3QgZGVjbGFyZWQuIFNob3Vs
ZCBpdCBiZSBzdGF0aWM/CgpQbGVhc2UgcmV2aWV3IGFuZCBwb3NzaWJseSBmb2xkIHRoZSBmb2xs
b3d1cCBwYXRjaC4KCi0tLQowLURBWSBrZXJuZWwgdGVzdCBpbmZyYXN0cnVjdHVyZSAgICAgICAg
ICAgICAgICBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlcgpodHRwczovL2xpc3RzLjAxLm9y
Zy9waXBlcm1haWwva2J1aWxkLWFsbCAgICAgICAgICAgICAgICAgICBJbnRlbCBDb3Jwb3JhdGlv
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
