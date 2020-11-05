Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE362A85CA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 19:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0256EDD7;
	Thu,  5 Nov 2020 18:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630616EDD7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 18:12:29 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a3so2697309wrx.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 10:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ic+OQ+6OsCx7cFXr4JAm3oNxN2Q6/gjUkT+ZKV1Hdn8=;
 b=z7PPYcDnQviEoc/NsFlZZbqRuYfpjYIygazPCOrkSgHhTI2t+ZgLTpPzO3Zl8poseB
 0rZqhEErwPkjLRMiEaevcCKADxlaiGS0QHxhYz6fV+wLpLfina9I0+F3jr2OSBSj+k5W
 SeqXNp0L+q2rgHZsfM9EmRUTPBi8upchSzrxXPOh9POtBeBFsOHeJyobHvKMeX7WP91k
 5HIkeJVdb32QoUO6rO+DBO7yBqn35/4s5G6uYQRkUqNie8K5vk0tuYMXCr9PZy3Hadxc
 VUmKB/NkmFLZDX1EdjK52aYAb4gkUdWu5L3I1ddLvzodlid/pTO69skeMQk4zG8pK5Zg
 oNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ic+OQ+6OsCx7cFXr4JAm3oNxN2Q6/gjUkT+ZKV1Hdn8=;
 b=eQ0cDC4nAav3Q+UUZCiy5EbYE6nGstj+J6KRoAD2db4bHdp7wYKrZ7w/ZZfIpbWdMl
 3S3NLJuzRhE1LTOKqwalO0NghhC71zA6XyVutG9sHNxSSSFqDlvNKv3KP4wbk7D8AqAc
 AciZk6j+Vj8vGWQivzF15qnE53+OnRSpoBHWNFzSxums3MvG1N7wa+5exsYcz2/93lOg
 SsSit++FTA18n8su+nWXRiXZshAC9/JI1Wmc+0chF68lTyOgdL5PYVIUaoZbodSG5SR8
 N9cPLG+v3SPsnyeev/ZmGJriRdNWvH3CVsHKy4YA4FcNDoGb6+EO8X8NmnwzpRlx3ORG
 19GQ==
X-Gm-Message-State: AOAM531H+3tELky+t/Oc+/LLlDoWZlKi2gKEDYO2w+QVCYkzPl6JI48m
 hPPc3uxFtz3CvTWxTIojUsyLhA==
X-Google-Smtp-Source: ABdhPJwTA5RTYhIiZWN3Q1b8BKggEpACTRVotMVkDJ/e+Bs6VZmMVWLdr8tXiLM5Q6NXEuVyXn6Zbw==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr4571549wrq.106.1604599948074; 
 Thu, 05 Nov 2020 10:12:28 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id s12sm3394261wmc.6.2020.11.05.10.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 10:12:27 -0800 (PST)
Date: Thu, 5 Nov 2020 18:12:23 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 00/19] [Set 1] Rid W=1 warnings from GPU
Message-ID: <20201105181223.GQ4488@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105163831.GA86540@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105163831.GA86540@ravnborg.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Huang Rui <ray.huang@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Gareth Hughes <gareth@valinux.com>, David Francis <David.Francis@amd.com>,
 Jingoo Han <jg1.han@samsung.com>, amd-gfx@lists.freedesktop.org,
 Rob Clark <rob.clark@linaro.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 linaro-mm-sig@lists.linaro.org, linux-tegra@vger.kernel.org,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jason Yan <yanaijie@huawei.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwNSBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUuCj4gCj4g
T24gVGh1LCBOb3YgMDUsIDIwMjAgYXQgMDI6NDQ6NThQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gVGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGluZyB0byBj
bGVhbi11cCBXPTEKPiA+IGtlcm5lbCBidWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3Zlcndo
ZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4gPiBuaWdnbHkgbGl0dGxlIHdhcm5pbmdzLgo+IAo+IFRo
YW5rcyBmb3IgbG9va2luZyBpbnRvIHRoaXMuCj4gCj4gPiBUaGVyZSBhcmUgNTAwMCB3YXJuaW5n
cyB0byB3b3JrIHRocm91Z2guCj4gPiAKPiA+IEl0IHdpbGwgdGFrZSBhIGNvdXBsZSBtb3JlIHNl
dHMuCj4gOi0pCj4gCj4gPiAgIGdwdTogZHJtOiBwYW5lbDogcGFuZWwtc2ltcGxlOiBGaXggJ3N0
cnVjdCBwYW5lbF9kZXNjJ3MgaGVhZGVyCj4gSSBoYXZlIGEgcGF0Y2ggaGVyZSB0aGF0IGlubGlu
ZSB0aGUgY29tbWVudHMgLSBhbmQgZml4IHRoZSB3YXJuaW5nIGFzIGEKPiBzaWRlIGVmZmVjdC4g
SSB3aWxsIGdldCBpdCBwb3N0ZWQgdG9uaWdodCBhcyB0aGlzIGlzIGJldHRlci4KPiAKPiA+ICAg
Z3B1OiBkcm06IGJyaWRnZTogYW5hbG9naXg6IGFuYWxvZ2l4X2RwX3JlZzogUmVtb3ZlIHVudXNl
ZCBmdW5jdGlvbgo+ID4gICAgICdhbmFsb2dpeF9kcF93cml0ZV9ieXRlX3RvX2RwY2QnCj4gV2hl
biBJIGxvb2tlZCBhdCBoaXMgSSBoYWQgYW5vdGhlciB1bnVzZWQgZnVuY3Rpb24gYWZ0ZXIgcmVt
b3ZpbmcgdGhlCj4gZmlyc3QuCj4gCj4gPiAgIGdwdTogZHJtOiBwYW5lbDogcGFuZWwtaWxpdGVr
LWlsaTkzMjI6IERlbW90ZSBub24tY29uZm9ybWFudAo+ID4gICAgIGtlcm5lbC1kb2MgaGVhZGVy
Cj4gQWdyZWUgb24gdGhpcyBzaW1wbGUgYXBwcm9jaCwgd2lsbCBhcHBseS4KPiAKPiA+ICAgZ3B1
OiBkcm06IGJyaWRnZTogYW5hbG9naXg6IGFuYWxvZ2l4X2RwX3JlZzogUmVtb3ZlIHVudXNlZCBm
dW5jdGlvbgo+ID4gICAgICdhbmFsb2dpeF9kcF9zdGFydF9hdXhfdHJhbnNhY3Rpb24nCj4gT0ss
IHRoaXMgd2FzIHRoZSBvbmUgSSByZWZlcnJlZCB0byBhYm92ZS4gVGhleSBzaG91bGQgYmUgc3F1
YXNoZWQgaW50bwo+IG9uZSBwYXRjaC4KCkkgY2FuIHNxdWFzaCB0aGVtIGlmIHlvdSBwcmVmZXIu
CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVs
b3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJt
IFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
