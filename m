Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC15F1D5FE5
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 11:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48836E03D;
	Sat, 16 May 2020 09:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1EA6E03D
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 09:12:54 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF679207D3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 09:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589620374;
 bh=nImC5Lqhf3m2EzWrtneElBAhRDJ15TlDvFtmSiX6f7A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wbsupaP1ar8iPmoMPYJDWi5irNzvBB6pqH5pcSytYnMSwUsz02TPYvpQQ2/l0nP/E
 /g9o22SpfjLQ3NVmz2589opIlVQ4VhXTv9gIQACgziZ51GuoovNEdiMI3Zu0AQ2R4p
 LPjNZy8Sjy2viK3RRvNBSLVm2qC0nfnN+mtvv5xE=
Received: by mail-ej1-f47.google.com with SMTP id s3so4352821eji.6
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 02:12:53 -0700 (PDT)
X-Gm-Message-State: AOAM531ptDt6mhzx/2LyamiqJMLnwqsOJ6qQj0Xr85fZYcC+1CB86ZLj
 OAfU3BhKkPHjsgbWSOmmdjfzWiPOt08OsCoAnA==
X-Google-Smtp-Source: ABdhPJxqXiBmi+YOlaHROm44eIZV54f3axqEuGxo7+ttRmcSCa8fZsoluwuiSKiAlI4IsRpaXMHAB1+wPGTuO+pbJpk=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr2519194ejx.360.1589620372129; 
 Sat, 16 May 2020 02:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200504141408.60877-1-enric.balletbo@collabora.com>
 <CAAOTY_8vMG1k86V+qBhs0YH5QHELmgtJ0PNOAzWTHoTy2j=R2Q@mail.gmail.com>
In-Reply-To: <CAAOTY_8vMG1k86V+qBhs0YH5QHELmgtJ0PNOAzWTHoTy2j=R2Q@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 16 May 2020 17:12:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9PdpKTwN46ZwpnRyOw-Ky758oxX11mLer6EksZgfsXSw@mail.gmail.com>
Message-ID: <CAAOTY_9PdpKTwN46ZwpnRyOw-Ky758oxX11mLer6EksZgfsXSw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Convert mtk-dpi to drm_bridge API
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAy
MDIw5bm0NeaciDEw5pelIOmAseaXpSDkuIrljYg5OjI05a+r6YGT77yaCj4KPiBIaSwgRW5yaWM6
Cj4KPiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29t
PiDmlrwgMjAyMOW5tDXmnIg05pelIOmAseS4gCDkuIvljYgxMDoxNOWvq+mBk++8mgo+ID4KPiA+
IFRoZSBtdGstZHBpIGRyaXZlciBzdGlsbCB1c2VzIHRoZSBkcm1fZW5jb2RlciBBUEkgd2hpY2gg
aXMgbm93IHNvbWVob3cKPiA+IGRlcHJlY2F0ZWQuIFdlIHN0YXJ0ZWQgdG8gbW92ZSBhbGwgdGhl
IE1lZGlhdGVrIGRyaXZlcnMgdG8gdGhlIGRybV9icmlkZ2UgQVBJLAo+ID4gbGlrZSB3ZSBkaWQg
Zm9yIHRoZSBtdGstZHNpIGRyaXZlciBbMV0sIHRoaXMgaXMgYW5vdGhlciBzbWFsbCBzdGVwIHRv
IGJlIGFibGUgdG8KPiA+IGZ1bGx5IGNvbnZlcnQgdGhlIERSTSBNZWRpYXRlayBkcml2ZXJzIHRv
IHRoZSBkcm1fYnJpZGdlIEFQSS4gQSBkdW1teQo+ID4gZHJtX2VuY29kZXIgaXMgbWFpbnRhaW5l
ZCBpbiB0aGUgbXRrLWRwaSBkcml2ZXIgYnV0IHRoZSBlbmQgZ29hbCBpcyBtb3ZlIGFsbCB0aGUK
PiA+IGR1bW15IGRybV9lbmNvZGVyIChtdGstZHNpLCBtdGstZHBpLCBldGMpIHRvIHRoZSBtYWlu
IG10a19kcm1fZHJ2IGRyaXZlci4KPgo+IEZvciB0aGlzIHNlcmllcywgYXBwbGllZCB0byBtZWRp
YXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KPgo+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1t
ZWRpYXRlay1kcm0tbmV4dAo+CgpJIHJlbW92ZSB0aGlzIHNlcmllcyBmcm9tIG1lZGlhdGVrLWRy
bS1uZXh0IGJlY2F1c2UgZHJtIGJyaWRnZSBkcml2ZXIKbmVlZCBhY2sgb2YgZHJtIGJyaWRnZSBt
YWludGFpbmVyLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gUmVnYXJkcywKPiBDaHVuLUt1YW5n
Lgo+Cj4gPgo+ID4gQmVzdCByZWdhcmRzLAo+ID4gIEVucmljCj4gPgo+ID4gWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wcm9qZWN0L2xrbWwvbGlzdC8/c2VyaWVzPTQ0MTU1
OQo+ID4KPiA+IEVucmljIEJhbGxldGJvIGkgU2VycmEgKDMpOgo+ID4gICBkcm0vbWVkaWF0ZWs6
IG10a19kcGk6IFJlbmFtZSBicmlkZ2UgdG8gbmV4dF9icmlkZ2UKPiA+ICAgZHJtL21lZGlhdGVr
OiBtdGtfZHBpOiBDb252ZXJ0IHRvIGJyaWRnZSBkcml2ZXIKPiA+ICAgZHJtL21lZGlhdGVrOiBt
dGtfZHBpOiBVc2Ugc2ltcGxlIGVuY29kZXIKPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYyB8IDg0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkKPiA+Cj4gPiAt
LQo+ID4gMi4yNi4yCj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
