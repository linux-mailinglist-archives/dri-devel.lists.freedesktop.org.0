Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FFD7BB09
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 10:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721488984F;
	Wed, 31 Jul 2019 08:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F6789363
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 08:00:18 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g67so54787686wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 01:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rYgcjT+9Tm6c8Cyu83F4EFPkgLKy3QCi9/CS9cVFipk=;
 b=G8UkVzoTBuZDG8rUuJC7Bi40455HJZlogoh5Ggiu/BI2RvjScNo31x7fGUDn4A5MHB
 hMkWqL/yNcLfyPe8Sxc2/Tt5aWNi73qW7xdV1UsQEop2dm5fy77dFugSZHeqQYr3MnHf
 OVSMqZge+L4fHjk5two2MU7ick9o/qHtrlBuTaoRhDSoe4s6EhYjWQaFuirdPCTeT1xN
 UH751L6bLRV9dZ1Q2u3QA4kfc6pIDCRYyAwLchx5cJ0AylLXSwpKliIu3CQy5Or9ZxpC
 QI3gzyExncV1xj0kl8IgWAf7X9HF0Ae88aSdtyaFidyGTzRosSxsGcB+5fZXkVrloBEv
 Zneg==
X-Gm-Message-State: APjAAAW4JaNVjpKK0Tjf6UX4kcz/xEaWa4QSTw4gHMR34keB2lj3jLuU
 t2hZ1dpW4NG0SibGWnX8gAfQDA==
X-Google-Smtp-Source: APXvYqxG2jOdodqsWQ5mwtCs76XPGe47ZZXt6Cm+uvj2FaxskGuJ65ytWrAcZXkUELPsNrxYldD21w==
X-Received: by 2002:a1c:20c3:: with SMTP id g186mr96553204wmg.15.1564560017072; 
 Wed, 31 Jul 2019 01:00:17 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g25sm48012719wmk.39.2019.07.31.01.00.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 01:00:16 -0700 (PDT)
Subject: Re: Review required [Was: Associate ddc adapters with connectors]
To: Sam Ravnborg <sam@ravnborg.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <20190726183520.GA22572@ravnborg.org> <20190726185538.GD14981@ravnborg.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <6560f93c-a48f-2a8c-afeb-d5e8e200480d@baylibre.com>
Date: Wed, 31 Jul 2019 10:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726185538.GD14981@ravnborg.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rYgcjT+9Tm6c8Cyu83F4EFPkgLKy3QCi9/CS9cVFipk=;
 b=0lvHjmqrSykuJ+Jw5bafEE/25tA3kTWNwJtg2zPXKrMBI+7E6iywm86cLH4wkEYY7c
 0AX1FQWCaPNechKRb7VfWhJlkNR0SqtoQvIxcezlXqTFuLOVLP+s57+WvjijcL60urRJ
 rIv8/eyGkZbrwTfi+wOCVkIBUmB3NbjIpAhTNYMJCQsHrU+hQZqbk9PZ9YjWi4/milhU
 Eye4QmniBbi4MMdSzYZKyvB9MUxucqjfAWEql8hWffejDtzkIXSqAbBufp+2d4RnUoqY
 0/l1E/EsWAV3NCCSp1KEOfHsW8A0amkvEEzgunu7m80I/LXAXHjvs4UIovmY3C7KC6ss
 sDrQ==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vincent Abriou <vincent.abriou@st.com>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gMjYvMDcvMjAxOSAyMDo1NSwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IEhpIGFs
bC4KPiAKPiBBbmRyemVqIGhhdmUgZG9uZSBhIGdvb2Qgam9iIGZvbGxvd2luZyB1cCBvbiBmZWVk
YmFjayBhbmQgdGhpcyBzZXJpZXMgaXMKPiBub3cgcmVhZHkuCj4gCj4gV2UgbmVlZCBhY2sgb24g
dGhlIHBhdGNoZXMgdG91Y2hpbmcgdGhlIGluZGl2aWR1YWwgZHJpdmVycyBiZWZvcmUgd2UgY2Fu
Cj4gcHJvY2VlZC4KPiBQbGVhc2UgY2hlY2sgeW91ciBkcml2ZXJzIGFuZCBnZXQgYmFjay4KCkkg
Y2FuIGFwcGx5IGFsbCBjb3JlIGFuZCBtYWludGFpbmVyLWFja2VkIHBhdGNoZXMgZm9yIG5vdyA6
CjEsIDIsIDcsIDEwLCAxMSwgMTYsIDE3LCAxOCwgMTksIDIwLCAyMSwgMjIsIDIzCgphbmQgQW5k
cnplaiBjYW4gcmVzZW5kIG5vdCBhcHBsaWVkIHBhdGNoZXMgd2l0aCBZb3VycyBhbmQgRW1pbCdz
IFJldmlld2VkLWJ5LApzbyB3ZSBjYW4gd2FpdCBhIGZldyBtb3JlIGRheXMgdG8gYXBwbHkgdGhl
bS4KCk5laWwKCj4gCj4gCVNhbQo+IAo+PiBIaSBBbmRlemVqLgo+Pgo+PiBPbiBGcmksIEp1bCAy
NiwgMjAxOSBhdCAwNzoyMjo1NFBNICswMjAwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3ogd3JvdGU6
Cj4+PiBJdCBpcyBkaWZmaWN1bHQgZm9yIGEgdXNlciB0byBrbm93IHdoaWNoIG9mIHRoZSBpMmMg
YWRhcHRlcnMgaXMgZm9yIHdoaWNoCj4+PiBkcm0gY29ubmVjdG9yLiBUaGlzIHNlcmllcyBhZGRy
ZXNzZXMgdGhpcyBwcm9ibGVtLgo+Pj4KPj4+IFRoZSBpZGVhIGlzIHRvIGhhdmUgYSBzeW1ib2xp
YyBsaW5rIGluIGNvbm5lY3RvcidzIHN5c2ZzIGRpcmVjdG9yeSwgZS5nLjoKPj4+Cj4+PiBscyAt
bCAvc3lzL2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9kZGMKPj4+IGxyd3hyd3hyd3ggMSByb290
IHJvb3QgMCBKdW4gMjQgMTA6NDIgL3N5cy9jbGFzcy9kcm0vY2FyZDAtSERNSS1BLTEvZGRjIFwK
Pj4+IAktPiAuLi8uLi8uLi8uLi9zb2MvMTM4ODAwMDAuaTJjL2kyYy0yCj4+Pgo+Pj4gVGhlIHVz
ZXIgdGhlbiBrbm93cyB0aGF0IHRoZWlyIGNhcmQwLUhETUktQS0xIHVzZXMgaTJjLTIgYW5kIGNh
biBlLmcuIHJ1bgo+Pj4gZGRjdXRpbDoKPj4+Cj4+PiBkZGN1dGlsIC1iIDIgZ2V0dmNwIDB4MTAK
Pj4+IFZDUCBjb2RlIDB4MTAgKEJyaWdodG5lc3MpOiBjdXJyZW50IHZhbHVlID0gICAgOTAsIG1h
eCB2YWx1ZSA9ICAgMTAwCj4+Pgo+Pj4gVGhlIGZpcnN0IHBhdGNoIGluIHRoZSBzZXJpZXMgYWRk
cyBzdHJ1Y3QgaTJjX2FkYXB0ZXIgcG9pbnRlciB0byBzdHJ1Y3QKPj4+IGRybV9jb25uZWN0b3Iu
IElmIHRoZSBmaWVsZCBpcyB1c2VkIGJ5IGEgcGFydGljdWxhciBkcml2ZXIsIHRoZW4gYW4KPj4+
IGFwcHJvcHJpYXRlIHN5bWJvbGljIGxpbmsgaXMgY3JlYXRlZCBieSB0aGUgZ2VuZXJpYyBjb2Rl
LCB3aGljaCBpcyBhbHNvIGFkZGVkCj4+PiBieSB0aGlzIHBhdGNoLgo+Pj4KPj4+IFBhdGNoIDIg
YWRkcyBhIG5ldyB2YXJpYW50IG9mIGRybV9jb25uZWN0b3JfaW5pdCgpLCBzZWUgdGhlIGNoYW5n
ZWxvZwo+Pj4gYmVsb3cuCj4+Pgo+Pj4gUGF0Y2hlcyAzLi4yNCBhcmUgZXhhbXBsZXMgb2YgaG93
IHRvIGNvbnZlcnQgYSBkcml2ZXIgdG8gdGhpcyBuZXcgc2NoZW1lLgo+Pj4KPj4gLi4uCj4+Pgo+
Pj4gdjUuLnY2Ogo+Pj4KPj4+IC0gaW1wcm92ZWQgc3ViamVjdCBsaW5lIG9mIHBhdGNoIDEKPj4+
IC0gYWRkZWQga2VybmVsLWRvYyBmb3IgZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKCkKPj4+
IC0gaW1wcm92ZWQga2VybmVsLWRvYyBmb3IgdGhlIGRkYyBmaWVsZCBvZiBzdHJ1Y3QgZHJtX2Nv
bm5lY3Rvcgo+Pj4gLSBhZGRlZCBSZXZpZXdlZC1ieSBpbiBwYXRjaGVzIDE3IGFuZCAxOAo+Pj4g
LSBhZGRlZCBBY2tlZC1ieSBpbiBwYXRjaCAyCj4+PiAtIG1hZGUgdGhlIG93bmVyc2hpcCBvZiBk
ZGMgaTJjX2FkYXB0ZXIgZXhwbGljaXQgaW4gYWxsIHBhdGNoZXMsCj4+PiB0aGlzIG1hZGUgdGhl
IGFmZmVjdGVkIHBhdGNoZXMgbXVjaCBzaW1wbGVyCj4+Cj4+IExvb2tzIGdvb2Qgbm93Lgo+PiBQ
YXRjaCAxIGFuZCAyIGFyZToKPj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KPj4KPj4gVGhlIHJlbWFpbmluZyBwYXRjaGVzIGFyZToKPj4gQWNrZWQtYnk6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPj4KPj4gCVNhbQo+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
