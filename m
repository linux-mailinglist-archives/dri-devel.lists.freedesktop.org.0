Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 609F35A13F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 18:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539766E97E;
	Fri, 28 Jun 2019 16:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44AE6E97E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 16:45:20 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id d4so11513961edr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 09:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=uaEHXqEabLSIZfnXeMvp6TP0O0DHLjr6ks1EMWK6Rx4=;
 b=k8hGpwPwrlmEAF+L+LVpriVwGkSkD6JzPjKg2/7c/gMTd6kKj5hIsr2vLr+44kzIjx
 7c3pXjv9ODjpGMDPtv16HzkNJIcwMgps8kAgxfdM1n6RXnaaH8A6U5flDyteAPFnYEfr
 23hrFZq6gDtgZwBkN8l0D4Wq9DtXpp6aU6Bb+spsDU/0N/bvVAJQTRTJVEu9AM/qlLJV
 E68UWv9i5hRvDnTlD3xxPTJadW3bn6rz6xeYIu02sJy7A5r6dsTc+OfaIcHt6uqbsWQP
 L6qckq4qx2eP5+iTPVDR0WPCzzU949DY5rJ8YjXuZadWyEeEg9AsX/R9cXiwpSu5WoLt
 rjWQ==
X-Gm-Message-State: APjAAAUJVxjY4x2ZPKC9RPkjEYEKb4Kmp4aszFdjFXcqK+UsQ8dHvLY6
 PFvgXomgMaW2xO+pGO6s6GdWJQ==
X-Google-Smtp-Source: APXvYqymRlxVowSCat4hUP8uU0OkuhECbgikLYW2l8n04ei9+j5nhtubRATOAKevS4zJTUHKDdqRHw==
X-Received: by 2002:a17:906:5c4e:: with SMTP id
 c14mr6756654ejr.73.1561740319368; 
 Fri, 28 Jun 2019 09:45:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a6sm791167eds.19.2019.06.28.09.45.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 09:45:18 -0700 (PDT)
Date: Fri, 28 Jun 2019 18:45:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v3 00/22] Associate ddc adapters with connectors
Message-ID: <20190628164514.GS12905@phenom.ffwll.local>
Mail-Followup-To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Eric Anholt <eric@anholt.net>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Huang Rui <ray.huang@amd.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Y.C. Chen" <yc_chen@aspeedtech.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Allison Randal <allison@lohutok.net>,
 Todor Tomov <todor.tomov@linaro.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=uaEHXqEabLSIZfnXeMvp6TP0O0DHLjr6ks1EMWK6Rx4=;
 b=PgtN+lSSZimKVCTKcNl2E4gCzrebmYsDEqLpWNc7G05Gb8k9iGtUwyV4qqGXrzRcYU
 pivBM1zfoW3I4cPN13HiPIQo6P89pn3EaOsMP5rUrKejN5jRHwj7TnNvO2MWL+m+2Ktl
 49wIbYxlcerpMBWwF+MJ6ycD06BlRe9ebuKaQ=
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDY6MDE6MTRQTSArMDIwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IEl0IGlzIGRpZmZpY3VsdCBmb3IgYSB1c2VyIHRvIGtub3cgd2hpY2gg
b2YgdGhlIGkyYyBhZGFwdGVycyBpcyBmb3Igd2hpY2gKPiBkcm0gY29ubmVjdG9yLiBUaGlzIHNl
cmllcyBhZGRyZXNzZXMgdGhpcyBwcm9ibGVtLgo+IAo+IFRoZSBpZGVhIGlzIHRvIGhhdmUgYSBz
eW1ib2xpYyBsaW5rIGluIGNvbm5lY3RvcidzIHN5c2ZzIGRpcmVjdG9yeSwgZS5nLjoKPiAKPiBs
cyAtbCAvc3lzL2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9kZGMKPiBscnd4cnd4cnd4IDEgcm9v
dCByb290IDAgSnVuIDI0IDEwOjQyIC9zeXMvY2xhc3MvZHJtL2NhcmQwLUhETUktQS0xL2RkYyBc
Cj4gCS0+IC4uLy4uLy4uLy4uL3NvYy8xMzg4MDAwMC5pMmMvaTJjLTIKPiAKPiBUaGUgdXNlciB0
aGVuIGtub3dzIHRoYXQgdGhlaXIgY2FyZDAtSERNSS1BLTEgdXNlcyBpMmMtMiBhbmQgY2FuIGUu
Zy4gcnVuCj4gZGRjdXRpbDoKPiAKPiBkZGN1dGlsIC1iIDIgZ2V0dmNwIDB4MTAKPiBWQ1AgY29k
ZSAweDEwIChCcmlnaHRuZXNzICAgICAgICAgICAgICAgICAgICApOiBjdXJyZW50IHZhbHVlID0g
ICAgOTAsIG1heCB2YWx1ZSA9ICAgMTAwCj4gCj4gVGhlIGZpcnN0IHBhdGNoIGluIHRoZSBzZXJp
ZXMgYWRkcyBzdHJ1Y3QgaTJjX2FkYXB0ZXIgcG9pbnRlciB0byBzdHJ1Y3QKPiBkcm1fY29ubmVj
dG9yLiBJZiB0aGUgZmllbGQgaXMgdXNlZCBieSBhIHBhcnRpY3VsYXIgZHJpdmVyLCB0aGVuIGFu
Cj4gYXBwcm9wcmlhdGUgc3ltYm9saWMgbGluayBpcyBjcmVhdGVkIGJ5IHRoZSBnZW5lcmljIGNv
ZGUsIHdoaWNoIGlzIGFsc28gYWRkZWQKPiBieSB0aGlzIHBhdGNoLgo+IAo+IFRoZSBzZWNvbmQg
cGF0Y2ggaXMgYW4gZXhhbXBsZSBvZiBob3cgdG8gY29udmVydCBhIGRyaXZlciB0byB0aGlzIG5l
dyBzY2hlbWUuCj4gCj4gdjEuLnYyOgo+IAo+IC0gdXNlZCBmaXhlZCBuYW1lICJkZGMiIGZvciB0
aGUgc3ltYm9saWMgbGluayBpbiBvcmRlciB0byBtYWtlIGl0IGVhc3kgZm9yCj4gdXNlcnNwYWNl
IHRvIGZpbmQgdGhlIGkyYyBhZGFwdGVyCj4gCj4gdjIuLnYzOgo+IAo+IC0gY29udmVydGVkIGFz
IG1hbnkgZHJpdmVycyBhcyBwb3NzaWJsZS4KPiAKPiBQQVRDSEVTIDMvMjItMjIvMjIgU0hPVUxE
IEJFIENPTlNJREVSRUQgUkZDIQoKVGhlcmUncyBhIGxvdCBtb3JlIGRyaXZlcnMgdGhhbiB0aGlz
IEkgdGhpbmsgKGk5MTUgaXMgYWJzZW50IGFzIGFuCmV4YW1wbGUsIGJ1dCB0aGVyZSBzaG91bGQg
YmUgdG9ucyBtb3JlKS4gV2h5IGFyZSB0aG9zZSBub3QgcG9zc2libGU/Ci1EYW5pZWwKCj4gCj4g
QW5kcnplaiBQaWV0cmFzaWV3aWN6ICgyMik6Cj4gICBkcm06IEluY2x1ZGUgZGRjIGFkYXB0ZXIg
cG9pbnRlciBpbiBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcgo+ICAgZHJtL2V4eW5vczogUHJvdmlkZSBk
ZGMgc3ltbGluayBpbiBjb25uZWN0b3IncyBzeXNmcwo+ICAgZHJtOiByb2NrY2hpcDogUHJvdmlk
ZSBkZGMgc3ltbGluayBpbiByazMwNjZfaGRtaSBzeXNmcyBkaXJlY3RvcnkKPiAgIGRybTogcm9j
a2NoaXA6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gaW5ub19oZG1pIHN5c2ZzIGRpcmVjdG9yeQo+
ICAgZHJtL21zbS9oZG1pOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGhkbWkgY29ubmVjdG9yIHN5
c2ZzIGRpcmVjdG9yeQo+ICAgZHJtL3N1bjRpOiBoZG1pOiBQcm92aWRlIGRkYyBzeW1saW5rIGlu
IHN1bjRpIGhkbWkgY29ubmVjdG9yIHN5c2ZzCj4gICAgIGRpcmVjdG9yeQo+ICAgZHJtL21lZGlh
dGVrOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGhkbWkgY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9y
eQo+ICAgZHJtL3RlZ3JhOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIG91dHB1dCBjb25uZWN0b3Ig
c3lzZnMgZGlyZWN0b3J5Cj4gICBkcm0vaW14OiBpbXgtbGRiOiBQcm92aWRlIGRkYyBzeW1saW5r
IGluIGNvbm5lY3RvcidzIHN5c2ZzCj4gICBkcm0vaW14OiBpbXgtdHZlOiBQcm92aWRlIGRkYyBz
eW1saW5rIGluIGNvbm5lY3RvcidzIHN5c2ZzCj4gICBkcm0vdmM0OiBQcm92aWRlIGRkYyBzeW1s
aW5rIGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKPiAgIGRybTogenRlOiBQcm92aWRlIGRk
YyBzeW1saW5rIGluIGhkbWkgY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQo+ICAgZHJtOiB6dGU6
IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gdmdhIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKPiAg
IGRybS90aWxjZGM6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5c2ZzIGRpcmVj
dG9yeQo+ICAgZHJtOiBzdGk6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gaGRtaSBjb25uZWN0b3Ig
c3lzZnMgZGlyZWN0b3J5Cj4gICBkcm0vbWdhZzIwMDogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBj
b25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5Cj4gICBkcm0vYXN0OiBQcm92aWRlIGRkYyBzeW1saW5r
IGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKPiAgIGRybS9icmlkZ2U6IGR1bWItdmdhLWRh
YzogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3Igc3lzZnMKPiAgICAgZGlyZWN0b3J5
Cj4gICBkcm0vYnJpZGdlOiBkdy1oZG1pOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3Rv
ciBzeXNmcyBkaXJlY3RvcnkKPiAgIGRybS9icmlkZ2U6IHRpLXRmcDQxMDogUHJvdmlkZSBkZGMg
c3ltbGluayBpbiBjb25uZWN0b3Igc3lzZnMKPiAgICAgZGlyZWN0b3J5Cj4gICBkcm0vYW1kZ3B1
OiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKPiAgIGRy
bS9yYWRlb246IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9y
eQo+IAo+ICAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jb25uZWN0b3JzLmMgICAgfCA3
MCArKysrKysrKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyAgICAg
ICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMu
YyAgICAgICAgIHwgMTkgKystLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmMgICAgIHwgNDAgKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGkt
dGZwNDEwLmMgICAgICAgICAgICB8IDE5ICsrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lz
ZnMuYyAgICAgICAgICAgICAgICAgICB8ICA3ICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2hkbWkuYyAgICAgICAgICB8IDExICsrLQo+ICBkcml2ZXJzL2dwdS9kcm0vaW14L2lt
eC1sZGIuYyAgICAgICAgICAgICAgICAgfCAxMyArKy0KPiAgZHJpdmVycy9ncHUvZHJtL2lteC9p
bXgtdHZlLmMgICAgICAgICAgICAgICAgIHwgIDggKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pLmMgICAgICAgICAgIHwgIDkgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvbWdhZzIwMF9tb2RlLmMgICAgICAgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2hk
bWkvaGRtaV9jb25uZWN0b3IuYyAgICAgfCAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2Nvbm5lY3RvcnMuYyAgICB8IDgyICsrKysrKysrKysrKysrLS0tLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRtaS5jICAgICAgICAgIHwgMTcgKystLQo+ICBkcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcmszMDY2X2hkbWkuYyAgICAgICAgfCAxNyArKy0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYyAgICAgICAgICAgICAgICB8ICAxICsKPiAgZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWkuaCAgICAgICAgICAgIHwgIDEgLQo+ICBkcml2
ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRtaV9lbmMuYyAgICAgICAgfCAxNCArKy0tCj4gIGRy
aXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uaCAgICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jICAgICAgICAgICAgICAgIHwgMTIgKy0tCj4gIGRy
aXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyAgICAgICAgICAgICAgICAgICB8ICA2ICstCj4gIGRy
aXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jICAgICAgICB8ICAxICsKPiAgZHJp
dmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jICAgICAgICAgICAgICAgIHwgMTYgKystLQo+ICBk
cml2ZXJzL2dwdS9kcm0venRlL3p4X2hkbWkuYyAgICAgICAgICAgICAgICAgfCAyNSArKy0tLS0K
PiAgZHJpdmVycy9ncHUvZHJtL3p0ZS96eF92Z2EuYyAgICAgICAgICAgICAgICAgIHwgMjUgKyst
LS0tCj4gIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCAgICAgICAgICAgICAgICAgICB8IDEx
ICsrKwo+ICAyNiBmaWxlcyBjaGFuZ2VkLCAyNTIgaW5zZXJ0aW9ucygrKSwgMTc2IGRlbGV0aW9u
cygtKQo+IAo+IC0tIAo+IDIuMTcuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
