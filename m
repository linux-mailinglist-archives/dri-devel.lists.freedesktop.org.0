Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E903C2F7BD
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 09:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E24C89F2E;
	Thu, 30 May 2019 07:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B2608916D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 07:10:31 +0000 (UTC)
X-UUID: 4e95dbfb47c6469ab5ffd272f063cf7b-20190530
X-UUID: 4e95dbfb47c6469ab5ffd272f063cf7b-20190530
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1579835748; Thu, 30 May 2019 15:10:29 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 30 May 2019 15:10:26 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 30 May 2019 15:10:26 +0800
Message-ID: <1559200226.23119.4.camel@mtksdaap41>
Subject: Re: [PATCH v3] gpu/drm: mediatek: call mtk_dsi_stop() after
 mtk_drm_crtc_atomic_disable()
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 30 May 2019 15:10:26 +0800
In-Reply-To: <CAJMQK-ir9J-JN9DDZPBA1nVkJUZ_6A+fY4fA6jx6zOh_9q5a-w@mail.gmail.com>
References: <20190528073908.633-1-hsinyi@chromium.org>
 <1559033586.5141.3.camel@mtksdaap41>
 <CAJMQK-ir9J-JN9DDZPBA1nVkJUZ_6A+fY4fA6jx6zOh_9q5a-w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 21091E5AA1B68CD54EA112FEDEABEE38DDE2401439AE716AE08C1FA05B4F42452000:8
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
Cc: David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpPbiBUaHUsIDIwMTktMDUtMzAgYXQgMTA6NTUgKzA4MDAsIEhzaW4tWWkg
V2FuZyB3cm90ZToKPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCA0OjUzIFBNIENLIEh1IDxjay5o
dUBtZWRpYXRlay5jb20+IHdyb3RlOgo+IAo+ID4gSSB0aGluayB3ZSd2ZSBhbHJlYWR5IGRpc2N1
c3NlZCBpbiBbMV0uIEkgbmVlZCBhIHJlYXNvbiB0byB1bmRlcnN0YW5kCj4gPiB0aGlzIGlzIGhh
cmR3YXJlIGJlaGF2aW9yIG9yIHNvZnR3YXJlIGJ1Zy4gSWYgdGhpcyBpcyBhIHNvZnR3YXJlIGJ1
Zywgd2UKPiA+IG5lZWQgdG8gZml4IHRoZSBidWcgYW5kIGNvZGUgY291bGQgYmUgc3ltbWV0cmlj
Lgo+ID4KPiA+IFsxXQo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xp
bnV4LW1lZGlhdGVrLzIwMTktTWFyY2gvMDE4NDIzLmh0bWwKPiA+Cj4gSGkgQ0ssCj4gCj4gSml0
YW8gaGFzIHJlcGxpZWQgaW4gdjJbMV0KPiAiCj4gbXRrX2RzaV9zdGFydCBtdXN0IGFmdGVyIGRz
aSBmdWxsIHNldHRpbmcuCj4gSWYgeW91IHB1dCBpdCBpbiBtdGtfZHNpX2RkcF9zdGFydCwgbXRr
X2RzaV9zZXRfbW9kZSB3b24ndCB3b3JrLiBEU0kKPiB3aWxsIGtlZXAgY21kIG1vZGUuIFNvIHlv
dSBzZWUgbm8gaXJxLgo+IC4uLgo+ICIKPiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
cGF0Y2h3b3JrL3BhdGNoLzEwNTI1MDUvIzEyNzYyNzAKPiAKPiBUaGFua3MKCk9LLCB0aGlzIGxv
b2tzIHRoZSBoYXJkd2FyZSBiZWhhdmlvciwgc28gSSB3b3VsZCBsaWtlIHlvdSB0byBhZGQgY29t
bWVudAppbiB0aGUgY29kZSB0byBkZXNjcmliZSB3aHkgd2UgbmVlZCB0aGlzIGFzeW1tZXRyaWMg
YmVoYXZpb3IuIFRoZQpkZXNjcmlwdGlvbiBzaG91bGQgYmUgY2xlYXIgc28gdGhhdCB3ZSBjb3Vs
ZCBrbm93IGhvdyB0byBtb2RpZnkgdGhlIGNvZGUKZmxvdyBpbiBmdXR1cmUuCgpSZWdhcmRzLApD
SwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
