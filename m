Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DE9B631A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 14:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231136EF1E;
	Wed, 18 Sep 2019 12:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id B0E246EF1E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 12:25:07 +0000 (UTC)
X-UUID: f339eefe4923486fba72f75c7d7da6b4-20190918
X-UUID: f339eefe4923486fba72f75c7d7da6b4-20190918
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 38987971; Wed, 18 Sep 2019 20:24:57 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 18 Sep 2019 20:24:53 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 18 Sep 2019 20:24:53 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 7/8] dt-bindings: display: panel: add AUO auo,
 b101uan08.3 panel documentation
Date: Wed, 18 Sep 2019 20:24:21 +0800
Message-ID: <20190918122422.17339-8-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918122422.17339-1-jitao.shi@mediatek.com>
References: <20190918122422.17339-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24918.004
X-TM-AS-Result: No-3.344400-8.000000-10
X-TMASE-MatchedRID: LDQTIb3AkScn3vOf0l6OFgPZZctd3P4By733NwuklsIHQvT9S3vHUDgK
 6rBjXxyiwmiM4j3WsDwWIvAeOZ6lZBhzK7qAlTSLCLQsumV/5S9V3dLaYUoCPSS30GKAkBxWie3
 MY7Xv0phqry+54H7wDufAOkxShVgK5TDi4+38dPYgCPGiZqtI8Gp5nbEBTsLkrNaeJrYvUQiKWS
 pN2IMPKUPNs5J6pUBWmkLIyx+kbq+tsBhZwL3bDR23b+lJHvPAhdipnqZWlN6LT3esmGQfwEtTy
 K8ZTWCGZI1BYYTjZ96AMuqetGVetr9k4V4N5ceA3QfwsVk0UbsIoUKaF27lxTdnwF1xCHJtKYQO
 AmHjZDgD1LLVoxzeii+xQL3D9tGhAbtmaE6a4AM6sdVOraIqJAq56lBJ3DH63iB0sOu1KWw/OkL
 s4PpignWznloeB3HaPQzwIbfiR5AMD9LTK+5Nny0c7FwZxihenqg/VrSZEiM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.344400-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24918.004
X-TM-SNTS-SMTP: DFD9AD0DC79652028ABED49A663A5FD45074D0DC07093303310F4DADCA87326C2000:8
X-MTK: N
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRjdW1lbnRhdGlvbiBmb3IgYXVvLGIxMDF1YW4wOC4zLCB3aGljaCBpcyBtaXBpIGRzaSB2
aWRlbyBwYW5lbAphbmQgcmVzb2x1dGlvbiBpcyAxMjAweDE5MjAuCgpTaWduZWQtb2ZmLWJ5OiBK
aXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Ci0tLQogLi4uL2Rpc3BsYXkvcGFuZWwv
YXVvLGIxMDF1YW4wOC4zLnlhbWwgICAgICAgIHwgNjcgKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hdW8sYjEwMXVhbjA4LjMu
eWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL2F1byxiMTAxdWFuMDguMy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVvLGIxMDF1YW4wOC4zLnlhbWwKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi45NjEyNWQ3ZDFmZTcKLS0tIC9kZXYvbnVsbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hdW8s
YjEwMXVhbjA4LjMueWFtbApAQCAtMCwwICsxLDY3IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9kaXNwbGF5L3BhbmVsL2F1byxiMTAxdWFuMDguMy55YW1sIworJHNjaGVtYTogaHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBBVU8g
QjEwMVVBTjA4LjMgRFNJIERpc3BsYXkgUGFuZWwKKworbWFpbnRhaW5lcnM6CisgIC0gVGhpZXJy
eSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KKyAgLSBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+CisgIC0gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KKyAK
K3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgICAgIGNvbnN0OiBhdW8sYjEwMXVhbjA4
LjMKKworICByZWc6CisgICAgZGVzY3JpcHRpb246IHRoZSB2aXJ0dWFsIGNoYW5uZWwgbnVtYmVy
IG9mIGEgRFNJIHBlcmlwaGVyYWwKKworICBlbmFibGUtZ3Bpb3M6CisgICAgZGVzY3JpcHRpb246
IGEgR1BJTyBzcGVjIGZvciB0aGUgZW5hYmxlIHBpbgorCisgIHBwMTgwMC1zdXBwbHk6CisgICAg
ZGVzY3JpcHRpb246IGNvcmUgdm9sdGFnZSBzdXBwbHkKKworICBhdmRkLXN1cHBseToKKyAgICBk
ZXNjcmlwdGlvbjogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgcG9zaXRp
dmUgdm9sdGFnZQorCisgIGF2ZWUtc3VwcGx5OgorICAgIGRlc2NyaXB0aW9uOiBwaGFuZGxlIG9m
IHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyBuZWdhdGl2ZSB2b2x0YWdlCisKKyAgYmFja2xp
Z2h0OgorICAgIGRlc2NyaXB0aW9uOiBwaGFuZGxlIG9mIHRoZSBiYWNrbGlnaHQgZGV2aWNlIGF0
dGFjaGVkIHRvIHRoZSBwYW5lbAorCityZXF1aXJlZDoKKyAtIGNvbXBhdGlibGUKKyAtIHJlZwor
IC0gZW5hYmxlLWdwaW9zCisgLSBwcDE4MDAtc3VwcGx5CisgLSBhdmRkLXN1cHBseQorIC0gYXZl
ZS1zdXBwbHkKKyAtIGJhY2tsaWdodAorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKwor
ZXhhbXBsZXM6CisgIC0gfAorICAgICZkc2kgeworICAgICAgICBwYW5lbEAwIHsKKyAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiYXVvLGIxMDF1YW4wOC4zIjsKKyAgICAgICAgICAgIHJlZyA9IDww
PjsKKyAgICAgICAgICAgIGVuYWJsZS1ncGlvcyA9IDwmcGlvIDQ1IDA+OworICAgICAgICAgICAg
YXZkZC1zdXBwbHkgPSA8JnBwdmFybl9sY2Q+OworICAgICAgICAgICAgYXZlZS1zdXBwbHkgPSA8
JnBwdmFycF9sY2Q+OworICAgICAgICAgICAgcHAxODAwLXN1cHBseSA9IDwmcHAxODAwX2xjZD47
CisgICAgICAgICAgICBiYWNrbGlnaHQgPSA8JmJhY2tsaWdodF9sY2QwPjsKKyAgICAgICAgICAg
IHN0YXR1cyA9ICJva2F5IjsKKyAgICAgICAgICAgIHBvcnQgeworICAgICAgICAgICAgICAgIHBh
bmVsX2luOiBlbmRwb2ludCB7CisgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9
IDwmZHNpX291dD47CisgICAgICAgICAgICAgICAgfTsKKyAgICAgICAgICAgIH07CisgICAgICAg
IH07CisgICAgfTsKKworLi4uClwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
