Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479FAB8D63
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 11:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517D96FBBB;
	Fri, 20 Sep 2019 09:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5CA9D6FBBB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 09:04:54 +0000 (UTC)
X-UUID: 63266cf694af4e0db76126d4cc475171-20190920
X-UUID: 63266cf694af4e0db76126d4cc475171-20190920
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 435764281; Fri, 20 Sep 2019 17:04:47 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 20 Sep 2019 17:04:39 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Fri, 20 Sep 2019 17:04:38 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 0/5] Support mipitx for mt8183
Date: Fri, 20 Sep 2019 17:04:27 +0800
Message-ID: <20190920090432.3308-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24922.005
X-TM-AS-Result: No-7.246900-8.000000-10
X-TMASE-MatchedRID: FtlMm0id6DqKhA2hG2DTqzfu+RTlciXg3I10sp4Pur5UjspoiX02F1cI
 P2h8KmtmWoORQFltGbfQIxN5t4Wy6qG06k9cn1gVx5sgyUhLCNuiNCtus+nPOlhs8uimgHNCJGZ
 0d4KSzVJ7rorDYcwGp6DYSStiU7K3JFTEHHYFNqkD2WXLXdz+ARNWFLeBYxoxjlFfNjQx+AJMEn
 lUJ0kvxRs/944ZgrxWgDLqnrRlXrZ8nn9tnqel2DsAVzN+Ov/s1wB/JHTYLFjBswPqxB5nQXoGZ
 l6/B6fpP4ecY9MSVqwi07x2VoFGHQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.246900-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24922.005
X-TM-SNTS-SMTP: E72900222F02D4BCBCAF82A04967990AB9DF57EDCF8207DAC548FF615E30579E2000:8
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
 stonea168@163.com, cawa.cheng@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hhbmdlcyBzaW5jZSB2NjoKIC0gYWRkIHRoZSBtaXBpdHggZHJpdmluZyBjb250cm9sIGluIGRl
dmljZSB0cmVlLgogLSBjb25maWcgbWlwaXR4IGltcGVkYW5jZSB3aXRoIGNhbGlicmF0aW9uIGRh
dGEuCgpDaGFuZ2VzIHNpbmNlIHY1OgogLSByZW1vdmUgbWlwaV90eC0+cmVmX2NsawogLSByZW1v
dmUgbXQ4MTgzIHBsbCBwcmVwYXJlIHVucHJlcGFyZQoKQ2hhbmdlcyBzaW5jZSB2NDoKIC0gZmlu
ZSB0dW5lIHRoZSBtaXBpX3R4LT5yZWZfY2xrIGFuZCBtaXBpX3R4LT5wbGwgc2VxdWVuY2UKICAg
MS4gUHJlcGFyZSBtaXBpX3R4LT5yZWZfY2xrCiAgIDIuIFByZXBhcmUgbWlwaV90eC0+cGxsCiAg
IDMuIEVuYWJsZSBtaXBpX3R4LT5yZWZfY2xrCiAgIDQuIEVuYWJsZSBtaXBpX3R4LT5wbGwKCkNo
YW5nZXMgc2luY2UgdjM6CiAtIHR1cm4gb2ZmIFBMTCBiZWZvcmUgc2V0dGluZyBQTEwgcGFyYW1l
dGVycy4KCkNoYW5nZXMgc2luY2UgdjI6CiAtIHVwZGF0ZSBBY2tlZC1ieTogUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4KIC0gdXBkYXRlIG10ODE4MyBtYXggYml0IHJhdGUgc3VwcG9ydAoK
Q2hhbmdlcyBzaW5jZSB2MToKIC0gdXBkYXRlIGR0LWJpbmRpbmdzIGRvY3VtZW50IGZvciBtdDgx
ODMgbWlwaXR4LgogLSByZW1vdmUgbXRrX21pcGl0eF9jbGtfZ2V0X29wcyBhbmQgYXNzaWduIGNs
a19vcHMgaW4gcHJvYmUuCiAtIGZpeCB0aGUgbGluY2VuY2UKIC0gcmVtb3ZlIHR4ZGl2MSBmcm9t
IG10a19taXBpX3R4X3BsbF9wcmVwYXJlCgpKaXRhbyBTaGkgKDUpOgogIGR0LWJpbmRpbmdzOiBk
aXNwbGF5OiBtZWRpYXRlazogdXBkYXRlIGRzaSBzdXBwb3J0ZWQgY2hpcHMKICBkcm0vbWVkaWF0
ZWs6IHNlcGFyYXRlIG1pcGlfdHggdG8gZGlmZmVyZW50IGZpbGUKICBkcm0vbWVkaWF0ZWs6IGFk
ZCBtaXBpX3R4IGRyaXZlciBmb3IgbXQ4MTgzCiAgZHJtL21lZGlhdGVrOiBhZGQgdGhlIG1pcGl0
eCBkcml2aW5nIGNvbnRyb2wgaW4gZGV2aWNlIHRyZWUKICBkcm0vbWVkaWF0ZWs6IGNvbmZpZyBt
aXBpdHggaW1wZWRhbmNlIHdpdGggY2FsaWJyYXRpb24gZGF0YQoKIC4uLi9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRzaS50eHQgICAgICAgICB8ICAxNSArLQogZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfbWlwaV90eC5jICAgICAgICB8IDM0NCArKy0tLS0tLS0tLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWlwaV90eC5oICAgICAgICB8ICA1MSArKysKIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX21pcGlfdHguYyB8IDI4OSArKysrKysrKysr
KysrKysKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTgzX21pcGlfdHguYyB8IDIy
MCArKysrKysrKysrKwogNiBmaWxlcyBjaGFuZ2VkLCA2MDMgaW5zZXJ0aW9ucygrKSwgMzE4IGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfbWlwaV90eC5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19tdDgxNzNfbWlwaV90eC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5jCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
