Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0382FA757
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 18:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC676E454;
	Mon, 18 Jan 2021 17:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4359789FFD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 17:21:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d26so17197482wrb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 09:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=mcabCZTC0ctiX7BvFOy/77rikMOebwMRiE/IMCNir9k=;
 b=FjF9TW8nhy9Gz0TiRekI5y1nTijSy4HtuPqCGx12ibM5MDuMQU2SZeRC0/Lc5gDYGj
 prdGv6KdTrJBUmZB+iYWo5a1SHtCqcpGY5u/97TLyhONFJhRAZnorcCWbDfP35u16ZjJ
 FAr8o8af5u1l+gbHg+CA1mUXcGe+bYC38S/4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=mcabCZTC0ctiX7BvFOy/77rikMOebwMRiE/IMCNir9k=;
 b=MAnGKsWfktFvdqtTMj3ruEXAu9O7B50Y0DC+//GiSz9FVfsRTgTyCxYIYdE6yibi3L
 9atf/81lZXjcDA35msIHmAvi/PMw/q4JlcY1Upurg9VuAb/eQzSKSzeV+IKIdRM7GVzQ
 ZWd4pFVlY10fn4Krke2S41qB4Ou4dxJe2mIjWdCemz7j7cPu1qTaMz3vQMtUNTeUvID7
 eftaGh/jHyxByqHjmfWmYkZMgQG2GR9V25wHvS9zTXW3L+I7IMYBIcXnRLNtZH5ToWh1
 CxUufDDZN2Eb+Iek1JZnm5hyiIHK2lQ2fod9Ko8I2RGWDTKkiy3plgZoSLxgNprBFSZs
 XtxQ==
X-Gm-Message-State: AOAM531gCOvS76CjtPXIxGb6dg0wKikD9xk8YelJfv0x2RR9nSEIiX3K
 OsgfGZ5UpHaJuXZFGTIj/J/dhg==
X-Google-Smtp-Source: ABdhPJzY2WOEnEaMMZ51nvju1fIaYxTXy8mS3+BIiF2xcI5bBHn2eizXQ4q3XaruAJ3Wybg/kV0QDA==
X-Received: by 2002:a5d:47af:: with SMTP id 15mr489829wrb.205.1610990469978;
 Mon, 18 Jan 2021 09:21:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d2sm30963689wre.39.2021.01.18.09.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 09:21:08 -0800 (PST)
Date: Mon, 18 Jan 2021 18:21:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/29] [Set 15] Finally rid W=1 warnings from GPU!
Message-ID: <YAXDgmWMR9s4OgxN@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 Zack Rusin <zackr@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eddie Dong <eddie.dong@intel.com>, Eric Anholt <eric@anholt.net>,
 Faith <faith@valinux.com>, Gareth Hughes <gareth@valinux.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jackie Li <yaodong.li@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jan Safrata <jan.nikitenko@gmail.com>,
 Jesse Barnes <jesse.barnes@intel.com>, jim liu <jim.liu@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Keith Packard <keithp@keithp.com>,
 Kevin Tian <kevin.tian@intel.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Min He <min.he@intel.com>,
 Niu Bing <bing.niu@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Pei Zhang <pei.zhang@intel.com>, Ping Gao <ping.a.gao@intel.com>,
 Rob Clark <rob.clark@linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tina Zhang <tina.zhang@intel.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhiyuan Lv <zhiyuan.lv@intel.com>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
 <YAWhDRkSOHbJ+2Le@phenom.ffwll.local> <20210118150945.GE4903@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210118150945.GE4903@dell>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Jackie Li <yaodong.li@intel.com>, David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jesse Barnes <jesse.barnes@intel.com>, Tina Zhang <tina.zhang@intel.com>,
 Jan Safrata <jan.nikitenko@gmail.com>, Gareth Hughes <gareth@valinux.com>,
 Pei Zhang <pei.zhang@intel.com>, Rob Clark <rob.clark@linaro.org>,
 Min He <min.he@intel.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Niu Bing <bing.niu@intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, jim liu <jim.liu@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Keith Packard <keithp@keithp.com>, Eddie Dong <eddie.dong@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Faith <faith@valinux.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ping Gao <ping.a.gao@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zhiyuan Lv <zhiyuan.lv@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTgsIDIwMjEgYXQgMDM6MDk6NDVQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIE1vbiwgMTggSmFuIDIwMjEsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gCj4gPiBPbiBG
cmksIEphbiAxNSwgMjAyMSBhdCAwNjoyNzoxNVBNICswMDAwLCBaYWNrIFJ1c2luIHdyb3RlOgo+
ID4gPiAKPiA+ID4gPiBPbiBKYW4gMTUsIDIwMjEsIGF0IDEzOjE1LCBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiBUaGlzIHNldCBpcyBwYXJ0
IG9mIGEgbGFyZ2VyIGVmZm9ydCBhdHRlbXB0aW5nIHRvIGNsZWFuLXVwIFc9MQo+ID4gPiA+IGtl
cm5lbCBidWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3
aXRoCj4gPiA+ID4gbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KPiA+ID4gPiAKPiA+ID4gPiBMYXN0
IHNldCEgIEFsbCBjbGVhbiBhZnRlciB0aGlzIGZvcjsgQXJtLCBBcm02NCwgUFBDLCBNSVBTIGFu
ZCB4ODYuCj4gPiA+IAo+ID4gPiBUaGFua3MhIEZvciBhbGwgdGhlIHZtd2dmeCBiaXRzOgo+ID4g
PiBSZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4KPiA+IAo+ID4gT2sg
SSBtZXJnZWQgZXZlcnl0aGluZyBleGNlcHQgdm13Z2Z4ICh0aGF0J3MgZm9yIFphY2spIGFuZCBp
OTE1L25vdXZlYXUKPiA+ICh0aG9zZSBnZW5lcmFsbHkgZ28gdGhyb3VnaCBvdGhlciB0cmVlcywg
cGxzIGhvbGxlciBpZiB0aGV5J3JlIHN0dWNrKS4KPiAKPiBUaGFua3MgRGFuaWVsLCB5b3UncmUg
YSBzdXBlcnN0YXIhCj4gCj4gU28gWmFjayB3aWxsIHRha2UgdGhlIHZtd2dmeCBwYXJ0cz8gIERl
c3BpdGUgcHJvdmlkaW5nIGEgUi1iPwoKSSBvbmx5IG1lcmdlIHN0dWZmIHRoYXQncyBkZWZhY3Rv
IGFiYW5kb25lZCBhbHJlYWR5LiBFdmVyeXRoaW5nIGVsc2UgSSB0cnkKdG8gb2ZmbG9hZCB0byB3
aG9tZXZlciBhY3R1YWxseSBjYXJlcyA6LSkKLURhbmllbAoKPiAKPiA+IE5vdGUgdGhhdCB3ZSBo
YXZlIHNvbWUgYnVpbGQgaXNzdWUgb24gc29tZSBvZiB0aGUgY29uZmlncyBzZnIgdXNlcywgc28g
ZHJtCj4gPiB0cmVlcyBhcmUgc3RpbGwgc3R1Y2sgb24gb2xkIHZlcnNpb25zIGluIGxpbnV4LW5l
eHQuIEhvcGVmdWxseSBzaG91bGQgZ2V0Cj4gPiByZXNvbHZlZCBzb29uLCB0aGUgYnVnZml4IGlz
IGluIHNvbWUgc3VidHJlZSBJJ3ZlIGhlYXJkLgo+IAo+IE5vIHdvcnJpZXMuICBUaGFua3MgZm9y
IGxldHRpbmcgbWUga25vdy4KPiAKPiAtLSAKPiBMZWUgSm9uZXMgW+adjueQvOaWr10KPiBTZW5p
b3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKPiBMaW5hcm8ub3JnIOKUgiBP
cGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKPiBGb2xsb3cgTGluYXJvOiBGYWNlYm9v
ayB8IFR3aXR0ZXIgfCBCbG9nCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
