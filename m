Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93EE5D266
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B64189CE3;
	Tue,  2 Jul 2019 15:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EEB89AEA;
 Tue,  2 Jul 2019 15:08:19 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id p144so14238047qke.11;
 Tue, 02 Jul 2019 08:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S9xA51zv/GRMu9EWqnEkCiUuTilo4EgcogHBD4UUys8=;
 b=jfbmAvWEP1LIV+hHjhNwIExIlNO85Khj/vnbouJHchONsTM0ju20WFSHJEeUS0JZQy
 QkBo0DAMFd3CzHK8jwLoKiMxdkY5JmMVIauuQAtPmql+2xHlJcVeAtpIr08u2RABSFHu
 H7lDy1HWcjxbyBtd9sxvZ0MeomuswfNVyCMjPUyyK0gIYI0lpdbDZV1rACu9ISLjt49m
 brDnmzYx0NT4NoiQM24DbIyQw0sts+YDLf227fIgJX/xeENmZZTlUZCn3q4W6BWe/iuv
 EgcxPVFLvB0IVs0DU+kfd111zAiD/9CEgw6uidi+GDJ+Lxys59eEUSGc0h6Gi0+oUrf4
 XIFQ==
X-Gm-Message-State: APjAAAUO2oPy4184NPnUea94mg9HNVVrz47Jikdh27tkHKBrjUMS5gTc
 Ct1wJkZbkWdTd4CJmZQ5i8MlHo6CeLKqJGjkpPI=
X-Google-Smtp-Source: APXvYqxVSrlATNlVbhJVg9/xnGfnuLiEbR8snekrKy78a7q1t5jecx7SD2PWaGuXLsIU2gvnvumFqEYUAlyES1OdfCI=
X-Received: by 2002:ab0:2789:: with SMTP id t9mr17791002uap.69.1562080098556; 
 Tue, 02 Jul 2019 08:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <20190628164514.GS12905@phenom.ffwll.local>
In-Reply-To: <20190628164514.GS12905@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jul 2019 16:08:30 +0100
Message-ID: <CACvgo502Yt90z9Tf+a8f_n3pgFa_NxFQ1LnEGmukT_jB2XaFzA@mail.gmail.com>
Subject: Re: [PATCH v3 00/22] Associate ddc adapters with connectors
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 kernel@collabora.com, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Dave Airlie <airlied@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, 
 Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 CK Hu <ck.hu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jsarha@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric Anholt <eric@anholt.net>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Huang Rui <ray.huang@amd.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 "Y.C. Chen" <yc_chen@aspeedtech.com>, Douglas Anderson <dianders@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Allison Randal <allison@lohutok.net>, Todor Tomov <todor.tomov@linaro.org>, 
 Mamta Shukla <mamtashukla555@gmail.com>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 LAKML <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-tegra@vger.kernel.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=S9xA51zv/GRMu9EWqnEkCiUuTilo4EgcogHBD4UUys8=;
 b=bw1pXEfKXRuMcifGGxJJy44p7S65Z/DS18lPEI1J6ea0G6qkun9SEXdtzDQL9oZmF3
 lSzgzmc87lYTnHAc3cGFvKPCBqqkqbzrIJWf7inROni3k1QZP8b46mD8JFmrYv0nqpkH
 D52mXnPBMPuamVS6nLaHjdMJf5IqDA8OTUShB/lIRSeIa0v6JLCFGd2le5e0BUTk2qJJ
 gPzoYjmRnBjGjAIm2m1+UNTEOV9PUz93aF15wmRYojHF3tYG+ZwoMyMgeM9L7vMwcOQa
 jJw/a1iSNCkKKYX9OW3gn3fMROR9O0CDp9ARPzoVRpDm4GMJu1ijmKuT2QxUDfxLi3jW
 dj1g==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOCBKdW4gMjAxOSBhdCAxNzo0NSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDI4LCAyMDE5IGF0IDA2OjAxOjE0UE0gKzAyMDAs
IEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiA+IEl0IGlzIGRpZmZpY3VsdCBmb3IgYSB1
c2VyIHRvIGtub3cgd2hpY2ggb2YgdGhlIGkyYyBhZGFwdGVycyBpcyBmb3Igd2hpY2gKPiA+IGRy
bSBjb25uZWN0b3IuIFRoaXMgc2VyaWVzIGFkZHJlc3NlcyB0aGlzIHByb2JsZW0uCj4gPgo+ID4g
VGhlIGlkZWEgaXMgdG8gaGF2ZSBhIHN5bWJvbGljIGxpbmsgaW4gY29ubmVjdG9yJ3Mgc3lzZnMg
ZGlyZWN0b3J5LCBlLmcuOgo+ID4KPiA+IGxzIC1sIC9zeXMvY2xhc3MvZHJtL2NhcmQwLUhETUkt
QS0xL2RkYwo+ID4gbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1biAyNCAxMDo0MiAvc3lzL2Ns
YXNzL2RybS9jYXJkMC1IRE1JLUEtMS9kZGMgXAo+ID4gICAgICAgLT4gLi4vLi4vLi4vLi4vc29j
LzEzODgwMDAwLmkyYy9pMmMtMgo+ID4KPiA+IFRoZSB1c2VyIHRoZW4ga25vd3MgdGhhdCB0aGVp
ciBjYXJkMC1IRE1JLUEtMSB1c2VzIGkyYy0yIGFuZCBjYW4gZS5nLiBydW4KPiA+IGRkY3V0aWw6
Cj4gPgo+ID4gZGRjdXRpbCAtYiAyIGdldHZjcCAweDEwCj4gPiBWQ1AgY29kZSAweDEwIChCcmln
aHRuZXNzICAgICAgICAgICAgICAgICAgICApOiBjdXJyZW50IHZhbHVlID0gICAgOTAsIG1heCB2
YWx1ZSA9ICAgMTAwCj4gPgo+ID4gVGhlIGZpcnN0IHBhdGNoIGluIHRoZSBzZXJpZXMgYWRkcyBz
dHJ1Y3QgaTJjX2FkYXB0ZXIgcG9pbnRlciB0byBzdHJ1Y3QKPiA+IGRybV9jb25uZWN0b3IuIElm
IHRoZSBmaWVsZCBpcyB1c2VkIGJ5IGEgcGFydGljdWxhciBkcml2ZXIsIHRoZW4gYW4KPiA+IGFw
cHJvcHJpYXRlIHN5bWJvbGljIGxpbmsgaXMgY3JlYXRlZCBieSB0aGUgZ2VuZXJpYyBjb2RlLCB3
aGljaCBpcyBhbHNvIGFkZGVkCj4gPiBieSB0aGlzIHBhdGNoLgo+ID4KPiA+IFRoZSBzZWNvbmQg
cGF0Y2ggaXMgYW4gZXhhbXBsZSBvZiBob3cgdG8gY29udmVydCBhIGRyaXZlciB0byB0aGlzIG5l
dyBzY2hlbWUuCj4gPgo+ID4gdjEuLnYyOgo+ID4KPiA+IC0gdXNlZCBmaXhlZCBuYW1lICJkZGMi
IGZvciB0aGUgc3ltYm9saWMgbGluayBpbiBvcmRlciB0byBtYWtlIGl0IGVhc3kgZm9yCj4gPiB1
c2Vyc3BhY2UgdG8gZmluZCB0aGUgaTJjIGFkYXB0ZXIKPiA+Cj4gPiB2Mi4udjM6Cj4gPgo+ID4g
LSBjb252ZXJ0ZWQgYXMgbWFueSBkcml2ZXJzIGFzIHBvc3NpYmxlLgo+ID4KPiA+IFBBVENIRVMg
My8yMi0yMi8yMiBTSE9VTEQgQkUgQ09OU0lERVJFRCBSRkMhCj4KPiBUaGVyZSdzIGEgbG90IG1v
cmUgZHJpdmVycyB0aGFuIHRoaXMgSSB0aGluayAoaTkxNSBpcyBhYnNlbnQgYXMgYW4KPiBleGFt
cGxlLCBidXQgdGhlcmUgc2hvdWxkIGJlIHRvbnMgbW9yZSkuIFdoeSBhcmUgdGhvc2Ugbm90IHBv
c3NpYmxlPwoKV2hpbGUgSSBmdWxseSBhZ3JlZSB0aGVyZSBhcmUgbW9yZSBkcml2ZXJzLCBhdCB0
aGUgc2FtZSB0aW1lIEkgd29uZGVyLgpJcyBpdCBhIGdvb2QgaWRlYSB0byBleHBlY3QgYWxsIG9m
IHRob3NlIHRvIGJlIGZpeGVkIGluIG9uZSBnbyBhbmQKYmxvY2sgcGF0Y2hlcyBhZGRyZXNzaW5n
IDE1KyBkcml2ZXJzPwoKUGVyc29uYWxseSBJIHRoaW5rIGl0J3MgcmVhc29uYWJsZSB0byBoYXZl
IHRoaXMsIGFsb25nc2lkZSBhIFRPRE8KZW50cnkgZm9yIG90aGVyIGRyaXZlcnMuCgpIVEgKRW1p
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
