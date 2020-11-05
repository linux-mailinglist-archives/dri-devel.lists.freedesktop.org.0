Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F229B2A85BC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 19:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82C26EDD2;
	Thu,  5 Nov 2020 18:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C496EDD2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 18:10:58 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c17so2838064wrc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 10:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FhFtY5ciaW1nlR2U+pWYBqVAzPK41Vz6Hz2tFwAkb5Q=;
 b=GatAPuXOOWtl2nhpT9e99ah3GFLcKM+HdeOOkC5pSs78XvvdyMoY7/8vu0nKhJBTAi
 ULzFLk2UAxyoo+3Evefw/CCJcgxeJdm/3As86gobVyRvGkioR0Yg0Vk06+ly3ZT1Iw4c
 vWDYVSEp7DJ/ryuKbJRodv3lC/n12GCOM19ezNTRqhekjK3J/FUTXtxYyQGZK6Ec+X+u
 4TF1Xpbbx7qXCIt1ap/QpJ/p7OSbix6+UbPt/19fhQThBEaY4kUCHeOHR7xeN5T5ugMQ
 FfV9R50g/c2fPLTAz8eG++boM2RcFaq0a3MzSidP9GytvPcXivsAZCyMSDEbhqPWcOtr
 hZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FhFtY5ciaW1nlR2U+pWYBqVAzPK41Vz6Hz2tFwAkb5Q=;
 b=aoYa7nkIhS4K1bIkHyNV7DhPadWm3AKfP6hlHVmJQyUvIdwNy0WuRBfR5Kl9h3SreS
 kBl8DzEJYAwUpkbpq3ovJ1TWWRLrNvMc5pkG8CXdxvu9IDziPKBCpM2Vlm7RWnzevf2w
 MR+EiQNL9UOPcd7vhVeRKztV4fCG9Mpqane9d1KFTnhObGpDjiJoQEQNy7c1DWbMsttR
 zLTeZnLvkn+hA4MCyXMBuxSA+o4cMXuBBQFTLshZpzEbRMrIbLc48Bc+cJTqdpb2flrE
 7EWYX4952hfJKROhyoCkAzu/mxKOes3CEZ7/ffOYHQXAFM/ZSjYrlgwyzMXYo4t+3bpU
 J5tg==
X-Gm-Message-State: AOAM531sQBuUG3C6vJhTKO7zuyM0xhWsGFc9z3MP+vQ+36P5aXaMcBNF
 RTZ6R3UdzCg5Upn5SyhBzYrq1g==
X-Google-Smtp-Source: ABdhPJxfovDmA2/SEwd5OqdAtrF75aOW/Ch8IL1Xl3o7TEZiRRobO1BFwQiv29SzGPrtgzVY78mRyw==
X-Received: by 2002:a5d:4747:: with SMTP id o7mr4604227wrs.423.1604599856823; 
 Thu, 05 Nov 2020 10:10:56 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id m126sm3705212wmm.0.2020.11.05.10.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 10:10:55 -0800 (PST)
Date: Thu, 5 Nov 2020 18:10:53 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 00/19] [Set 1] Rid W=1 warnings from GPU
Message-ID: <20201105181053.GP4488@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105164841.GH485884@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105164841.GH485884@ulmo>
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
 Gareth Hughes <gareth@valinux.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Francis <David.Francis@amd.com>, Jingoo Han <jg1.han@samsung.com>,
 amd-gfx@lists.freedesktop.org, Rob Clark <rob.clark@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-media@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 linaro-mm-sig@lists.linaro.org, linux-tegra@vger.kernel.org,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jason Yan <yanaijie@huawei.com>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwNSBOb3YgMjAyMCwgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cgo+IE9uIFRodSwgTm92
IDA1LCAyMDIwIGF0IDAyOjQ0OjU4UE0gKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiA+IFRoaXMg
c2V0IGlzIHBhcnQgb2YgYSBsYXJnZXIgZWZmb3J0IGF0dGVtcHRpbmcgdG8gY2xlYW4tdXAgVz0x
Cj4gPiBrZXJuZWwgYnVpbGRzLCB3aGljaCBhcmUgY3VycmVudGx5IG92ZXJ3aGVsbWluZ2x5IHJp
ZGRsZWQgd2l0aAo+ID4gbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KPiA+IAo+ID4gVGhlcmUgYXJl
IDUwMDAgd2FybmluZ3MgdG8gd29yayB0aHJvdWdoLgo+ID4gCj4gPiBJdCB3aWxsIHRha2UgYSBj
b3VwbGUgbW9yZSBzZXRzLgo+ID4gCj4gPiBMZWUgSm9uZXMgKDE5KToKPiA+ICAgZ3B1OiBob3N0
MXg6IGJ1czogQWRkIG1pc3NpbmcgZGVzY3JpcHRpb24gZm9yICdkcml2ZXInCj4gPiAgIGdwdTog
aXB1LXYzOiBpcHUtZGk6IFN0cmlwIG91dCAyIHVudXNlZCAnZGlfc3luY19jb25maWcnIGVudHJp
ZXMKPiA+ICAgZ3B1OiBkcm06IGlteDogaXB1djMtcGxhbmU6IE1hcmsgJ2NydGNfc3RhdGUnIGFz
IF9fYWx3YXlzX3VudXNlZAo+ID4gICBncHU6IGRybTogb21hcGRybTogb21hcF9pcnE6IEZpeCBh
IGNvdXBsZSBvZiBkb2Mtcm90IGlzc3Vlcwo+ID4gICBncHU6IGRybTogc2VsZnRlc3RzOiB0ZXN0
LWRybV9tbTogTWFyayAnaG9sZV9lbmQnIGFzIGFsd2F5c191bnVzZWQKPiA+ICAgZ3B1OiBkcm06
IHNjaGVkdWxlcjogc2NoZWRfbWFpbjogUHJvdmlkZSBtaXNzaW5nIGRlc2NyaXB0aW9uIGZvcgo+
ID4gICAgICdzY2hlZCcgcGFyYW10ZXIKPiA+ICAgZ3B1OiBkcm06IHNjaGVkdWxlcjogc2NoZWRf
ZW50aXR5OiBEZW1vdGUgbm9uLWNvbmZvcm1hbnQga2VybmVsLWRvYwo+ID4gICAgIGhlYWRlcnMK
PiA+ICAgZ3B1OiBkcm06IG9tYXBkcm06IGRzczogZHNpOiBSZXdvcmsgYW5kIHJlbW92ZSBhIGZl
dyB1bnVzZWQgdmFyaWFibGVzCj4gPiAgIGdwdTogZHJtOiBzZWxmdGVzdHM6IHRlc3QtZHJtX2Zy
YW1lYnVmZmVyOiBSZW1vdmUgc2V0IGJ1dCB1bnVzZWQKPiA+ICAgICB2YXJpYWJsZSAnZmInCj4g
PiAgIGdwdTogZHJtOiB0dG06IHR0bV9ibzogRml4IG9uZSBmdW5jdGlvbiBoZWFkZXIgLSBkZW1v
dGUgbG90cyBvZgo+ID4gICAgIGtlcm5lbC1kb2MgYWJ1c2VzCj4gPiAgIGdwdTogZHJtOiBwYW5l
bDogcGFuZWwtc2ltcGxlOiBGaXggJ3N0cnVjdCBwYW5lbF9kZXNjJ3MgaGVhZGVyCj4gPiAgIGdw
dTogZHJtOiBicmlkZ2U6IGFuYWxvZ2l4OiBhbmFsb2dpeF9kcF9yZWc6IFJlbW92ZSB1bnVzZWQg
ZnVuY3Rpb24KPiA+ICAgICAnYW5hbG9naXhfZHBfd3JpdGVfYnl0ZV90b19kcGNkJwo+ID4gICBn
cHU6IGRybTogdHRtOiB0dG1fdHQ6IERlbW90ZSBrZXJuZWwtZG9jIGhlYWRlciBmb3JtYXQgYWJ1
c2VzCj4gPiAgIGdwdTogZHJtOiBzZWxmdGVzdHM6IHRlc3QtZHJtX2RwX21zdF9oZWxwZXI6IFBs
YWNlICdzdHJ1Y3QKPiA+ICAgICBkcm1fZHBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5JyBvbnRvIHRo
ZSBoZWFwCj4gPiAgIGdwdTogZHJtOiByYWRlb246IHJhZGVvbl9kcnY6IFJlbW92ZSB1bnVzZWQg
dmFyaWFibGUgJ3JldCcKPiA+ICAgZ3B1OiBkcm06IHBhbmVsOiBwYW5lbC1pbGl0ZWstaWxpOTMy
MjogRGVtb3RlIG5vbi1jb25mb3JtYW50Cj4gPiAgICAga2VybmVsLWRvYyBoZWFkZXIKPiA+ICAg
Z3B1OiBkcm06IHJhZGVvbjogcmFkZW9uX2RldmljZTogRml4IGEgYnVuY2ggb2Yga2VybmVsLWRv
Ywo+ID4gICAgIG1pc2RlbWVhbm91cnMKPiA+ICAgZ3B1OiBkcm06IGFtZDogYW1kZ3B1OiBhbWRn
cHU6IE1hcmsgZ2xvYmFsIHZhcmlhYmxlcyBhcyBfX21heWJlX3VudXNlZAo+ID4gICBncHU6IGRy
bTogYnJpZGdlOiBhbmFsb2dpeDogYW5hbG9naXhfZHBfcmVnOiBSZW1vdmUgdW51c2VkIGZ1bmN0
aW9uCj4gPiAgICAgJ2FuYWxvZ2l4X2RwX3N0YXJ0X2F1eF90cmFuc2FjdGlvbicKPiAKPiBBcyBj
b21tZW50ZWQgb24gdGhlIG90aGVyIHBhdGNoZXMsIHRoZSBzdWJqZWN0IHByZWZpeGVzIG9uIG1v
c3Qgb2YgdGhlc2UKPiBsb29rIHdyb25nLCBidXQgaXQncyBnZW5lcmFsbHkgYSBuaWNlIGNsZWFu
dXAuCgpUaGUgcHJlZml4ZXMgYXJlIGF1dG9tYXRlZC4gIEknbGwgYWRkIHRoaXMgdG8gbXkgbGlz
dCBvZiBhd2t3YXJkCnN1YnN5c3RlbXMgYW5kIGdvIHRocm91Z2ggdGhlbSBhbGwgbWFudWFsbHkg
YWdhaW4gdG9tb3Jyb3cuIDpECgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNo
bmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVy
IHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
