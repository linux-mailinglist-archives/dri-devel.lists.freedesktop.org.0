Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2110F68510
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 10:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD0F89823;
	Mon, 15 Jul 2019 08:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB9D892BB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 08:19:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 2AFC68035B;
 Mon, 15 Jul 2019 10:19:43 +0200 (CEST)
Date: Mon, 15 Jul 2019 10:19:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v1 33/33] drm/hisilicon: drop use of drmP.h
Message-ID: <20190715081941.GA29177@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-34-sam@ravnborg.org>
 <CACvgo51hO+i6LryjeQhEivq3ta0Vnd=ZxFrrW0Gn8vVQebSybw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51hO+i6LryjeQhEivq3ta0Vnd=ZxFrrW0Gn8vVQebSybw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=QX4gbG5DAAAA:8 a=wcfMLOz0FqR2eML_oIQA:9 a=CjuIK1q_8ugA:10
 a=sA7TO5nKz6cA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
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
Cc: Rongrong Zou <zourongrong@gmail.com>, Jani Nikula <jani.nikula@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
 John Garry <john.garry@huawei.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Junwei Zhang <Jerry.Zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Emil Velikov <emil.velikov@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Allison Randal <allison@lohutok.net>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbC4KCj4gPiAtLS0KPiA+IFRoZSBsaXN0IG9mIGNjOiB3YXMgdG9vIGxhcmdlIHRvIGFk
ZCBhbGwgcmVjaXBpZW50cyB0byB0aGUgY292ZXIgbGV0dGVyLgo+ID4gUGxlYXNlIGZpbmQgY292
ZXIgbGV0dGVyIGhlcmU6Cj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZl
cy9kcmktZGV2ZWwvMjAxOS1KdW5lL3RocmVhZC5odG1sCj4gPiBTZWFyY2ggZm9yICJkcm06IGRy
b3AgdXNlIG9mIGRybXAuaCBpbiBkcm0tbWlzYyIKPiA+Cj4gU3BlYWtpbmcgb2YgbG9uZyBDQyBs
aXN0LCBtb3N0IHBhdGNoZXMgYXJlIG9rIHlldCB0aGlzIGhhcyBnb25lIGEgYml0IGNyYXp5Lgo+
IEhvdyBkaWQgeW91IG1hbmFnZSB0byBwdWxsIHN1Y2ggYSBsb25nIGxpc3Q/IFRoZSBnZXRfbWFp
bnRhaW5lci5wbAo+IHNjcmlwdCBzaG93cyBhIHRvdGFsIG9mIDE3IGZvciBhbGwgb2YgaGlibWMg
YW5kIGtpcmluLgoKU29tZXRpbWVzIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgb3V0cHV0cyBh
IGxvdCBvZiBwZW9wbGUuClNvbWV0aW1lcyBvbmx5IGEgZmV3LgpJIGhhdmUgbm90IGxvb2tlZCBp
bnRvIGRldGFpbHMgd2h5LCBhbmQgZm9yIHRoaXMgcGF0Y2ggc2VyaWVzCkkgdXNlZCAiZGltIGFk
ZC1taXNzaW5nLWNjIiB0byBtb3N0IHBhdGNoZXMuCgo+IEVpdGhlciB3YXksIHNpbmNlIHlvdSd2
ZSBidWlsdC10ZXN0ZWQgdGhlc2UgKGFuZCBjb25mbGljdHMgYXJlIGEKPiBtYXR0ZXIgb2YgI2lu
Y2x1ZGUpIGZvciB0aGUgbG90Ogo+IEFja2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtv
dkBjb2xsYWJvcmEuY29tPgpKdXN0IHRvIGJlIHN1cmUuIFdhcyB0aGlzIGFuIEFjayBmb3IgdGhl
IGZ1bGwgc2VyaWVzIG9yIG9ubHkgdGhpcyBwYXRjaD8KSSBzdGFydGVkIHByb2Nlc3NpbmcgdGhl
IHBhdGNoZXMsIGFuZCB0aGUgb25lcyB3aGVyZSBJIGhhdmUgZ290IGFuCmV4cGxpY2l0IGFjayBv
ciByLWIgaXMgcXVldWVkIGFscmVhZHkgKHdpdGhvdXQgeW91ciBhY2spLgoKVGhlcmUgYXJlIHN0
aWxsIH4yMCBwYXRjaGVzIHdpdGhvdXQgZmVlZGJhY2sgaW4gdGhpcyBzZXJpZXMsCmFuZCBJIHdv
dWxkIGxvdmUgdG8gaGF2ZSB0aGVtIHByb2Nlc3NlZCBhbmQgcHVzaGVkIG91dC4KCglTYW0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
