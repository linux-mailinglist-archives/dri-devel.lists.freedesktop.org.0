Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A4C3DC991
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 06:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E739C6EA86;
	Sun,  1 Aug 2021 04:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 204116EA86
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 04:06:21 +0000 (UTC)
X-UUID: a75e0143f8a2404fa033d902be4dc94c-20210801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tVl842wftAnMAO9fwQ64B34pCPAJw05tuHgSke2JKe4=; 
 b=V7x4lR2wEadoplFzF4wIcrDWb1gb1tgNB79eydi28JSz8TdVoJhSW6ZQJuTsn+gnzyib6M40L/mK4FGh0WceccKdvO1S++iFvnev5AITtHMTZj0z7NpG29flygqKF+PRP+lfnllummKzuYEUhzSvkz71AGvISRq9Rq41VFBOcqk=;
X-UUID: a75e0143f8a2404fa033d902be4dc94c-20210801
Received: from mtkmrs31.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 461988250; Sun, 01 Aug 2021 12:06:16 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 1 Aug 2021 12:06:14 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 1 Aug 2021 12:06:13 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <shuijing.li@mediatek.com>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v4 2/2] dt-bindings: mediatek: add force_dsi_end_without_null
Date: Sun, 1 Aug 2021 12:05:44 +0800
Message-ID: <20210801040544.104135-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210801040544.104135-1-jitao.shi@mediatek.com>
References: <20210801040544.104135-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 274FAD2CEAB345486A9ACF4D6C3725599FB588F1E24F37B11444DDF0626652F32000:8
X-MTK: N
Content-Transfer-Encoding: base64
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZvcmNlX2RzaV9lbmRfd2l0aG91dF9udWxsIHJlcXVpcmVzIHRoZSBkc2kgaG9zdCBlbnQg
YXQNCnRoZSBzYW1lIHRpbWUgaW4gbGluZS4NCg0KU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxq
aXRhby5zaGlAbWVkaWF0ZWsuY29tPg0KLS0tDQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L2FuYWxvZ2l4LGFueDc2MjUueWFtbCAgICAgICAgICAgfCA2ICsrKysrKw0KIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbmFsb2dpeCxhbng3NjI1LnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW5hbG9naXgsYW54
NzYyNS55YW1sDQppbmRleCBhYjQ4YWIyZjQyNDAuLjhiODY4YTZhM2Q2MCAxMDA2NDQNCi0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbmFsb2dp
eCxhbng3NjI1LnlhbWwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2JyaWRnZS9hbmFsb2dpeCxhbng3NjI1LnlhbWwNCkBAIC00Myw2ICs0MywxMSBAQCBw
cm9wZXJ0aWVzOg0KICAgdmRkMzMtc3VwcGx5Og0KICAgICBkZXNjcmlwdGlvbjogUmVndWxhdG9y
IHRoYXQgcHJvdmlkZXMgdGhlIHN1cHBseSAzLjNWIHBvd2VyLg0KIA0KKyAgZm9yY2VfZHNpX2Vu
ZF93aXRob3V0X251bGw6DQorICAgIGRlc2NyaXB0aW9uOiB8DQorICAgICAgUmVxdWlyZXMgdGhl
IGRzaSBob3N0IHNlbmQgdGhlIGRzaSBwYWNrZXRzIG9uIGFsbCBsYW5lcyBhbGlnbmVkDQorICAg
ICAgYXQgdGhlIGVuZC4NCisNCiAgIHBvcnRzOg0KICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55
YW1sIy9wcm9wZXJ0aWVzL3BvcnRzDQogDQpAQCAtODcsNiArOTIsNyBAQCBleGFtcGxlczoNCiAg
ICAgICAgICAgICB2ZGQxMC1zdXBwbHkgPSA8JnBwMTAwMF9taXBpYnJkZz47DQogICAgICAgICAg
ICAgdmRkMTgtc3VwcGx5ID0gPCZwcDE4MDBfbWlwaWJyZGc+Ow0KICAgICAgICAgICAgIHZkZDMz
LXN1cHBseSA9IDwmcHAzMzAwX21pcGlicmRnPjsNCisgICAgICAgICAgICBmb3JjZV9kc2lfZW5k
X3dpdGhvdXRfbnVsbDsNCiANCiAgICAgICAgICAgICBwb3J0cyB7DQogICAgICAgICAgICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KLS0gDQoyLjI1LjENCg==

