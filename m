Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AECCE48448
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 15:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE5789250;
	Mon, 17 Jun 2019 13:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F9089250
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:43:56 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k8so16246272eds.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 06:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=m5k0RU5bcaWkwEV+Uym4n2+YNMeyuDRphPD0cP/0ZDA=;
 b=IlaPoYx2P1uQJT7zjDqE85LnlZ1PSdthDcbgge0mISDWxw94WNIBqTTStE/1nKGAGU
 zB4aYWnLYpg8YGLYHfzYq1FQWxgf5o448tNBw2Ak8pIfQrYss2HIPTBhpYwmafPmSSsN
 Fshae3ehtA2sYsr/bfuRW+57Q7KvWT7Kt9CQvnRsoHBqkdKrk/IkktZ/tRym30OqTIRU
 LREJsu3kHq9GilxtredxAGBvNNhnqnSRtF9ePdB17OPuylvSy/NKG8Xa/hwrPwC7ouEs
 Ewff/nQA83HxRsderAzEdAseW7cpEn4E3w/8JB+RVqh4rnQ032tN38NQZbr8AE0sAISr
 9PaQ==
X-Gm-Message-State: APjAAAULoUYKvcQKm6d82L6qH6na73Jjjf0dCbic7tPAMX3CtyOWKHM6
 zgNUW3AtpUr91Z38meW6S+/qJg==
X-Google-Smtp-Source: APXvYqzA+ZcL98DxFmp0iSoDjj3sco5uxyQ2BFinehLuXy0VdTfAaApfcXh33wwbWatNM+3ey2PPdA==
X-Received: by 2002:a50:9168:: with SMTP id f37mr10792780eda.242.1560779035260; 
 Mon, 17 Jun 2019 06:43:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b25sm3668523ede.34.2019.06.17.06.43.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 06:43:54 -0700 (PDT)
Date: Mon, 17 Jun 2019 15:43:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH 07/59] drm/arm/komeda: Remove DRIVER_HAVE_IRQ
Message-ID: <20190617134345.GA12905@phenom.ffwll.local>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-8-daniel.vetter@ffwll.ch>
 <20190617062602.GA23827@james-ThinkStation-P300>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617062602.GA23827@james-ThinkStation-P300>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=m5k0RU5bcaWkwEV+Uym4n2+YNMeyuDRphPD0cP/0ZDA=;
 b=TskxqUwMhyBBGm5esF10Ra68nLN9FvKqPVn2WoWaTq+gWHCITQhdagNjfUfblwh84L
 B39KqMeZIUZCJnKdzR62GGCUT0sWo0QOMpj/kZ83a6lVdm1V5DhIpteGtj03a6IteIXI
 xsxa1610cbL4Ak9aF6rjmHn/Mnn12BLSwFp4g=
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
Cc: nd <nd@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDY6MjY6MDhBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQg
MTA6MzU6MjNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IFJlYWQgdGhlIGRvY3Ms
IGtvbWVkYSBpcyBub3QgYW4gb2xkIGVub3VnaCBkcml2ZXIgZm9yIHRoaXMgOi0pCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+
ID4gQ2M6ICJKYW1lcyAoUWlhbikgV2FuZyIgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+ID4g
Q2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgfCAzICstLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiA+IGlu
ZGV4IDBjNjM5NmRjMzIzZi4uYjlkNjk5Y2M3YmJmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gPiBAQCAtNTUsOCArNTUs
NyBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qga29tZWRhX2ttc19pcnFfaGFuZGxlcihpbnQgaXJxLCB2
b2lkICpkYXRhKQo+ID4gIH0KPiA+ICAKPiA+ICBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIga29t
ZWRhX2ttc19kcml2ZXIgPSB7Cj4gPiAtCS5kcml2ZXJfZmVhdHVyZXMgPSBEUklWRVJfR0VNIHwg
RFJJVkVSX01PREVTRVQgfCBEUklWRVJfQVRPTUlDIHwKPiA+IC0JCQkgICBEUklWRVJfSEFWRV9J
UlEsCj4gPiArCS5kcml2ZXJfZmVhdHVyZXMgPSBEUklWRVJfR0VNIHwgRFJJVkVSX01PREVTRVQg
fCBEUklWRVJfQVRPTUlDLAo+ID4gIAkubGFzdGNsb3NlCQkJPSBkcm1fZmJfaGVscGVyX2xhc3Rj
bG9zZSwKPiA+ICAJLmlycV9oYW5kbGVyCQkJPSBrb21lZGFfa21zX2lycV9oYW5kbGVyLAo+IAo+
IEhpIERhbmllbDoKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiAKPiBBbmQgQXlhbiBh
bHNvIHNlbnQgdHdvIHBhdGNoZXMgZm9yIHRoaXMgdG9waWMuIGxpa2U6Cj4gCj4gRm9yIGRyb3Ag
ZHJtX2lycV9pbnN0YWxsOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJp
ZXMvNjE3NjMvCj4gRm9yIG1hbnVhbGx5IHNldCBkcm0tPmlycV9lbmFibGVkOgo+IGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjE3NzYvCj4gCj4gRm9yIGNsZWFyLCBz
ZWVtcyB3ZSdkIGJldHRlciBzcXVhc2ggYWxsIHRoZXNlIHRocmVlIHBhdGNoZXMgaW50byBvbmUK
PiBzaW5nbGUgcGF0Y2guCgpOb3Qgc3VyZSBob3cgdGhlc2Ugb3RoZXIgcGF0Y2hlcyBhcmUgcmVs
YXRlZCB0byBtaW5lIGRpcmVjdGx5LiBUaGlzIGhlcmUKanVzdCByZW1vdmVzIGEgZmxhZyB3aGlj
aCBkb2VzIG5vdGhpbmcsIGJlY2F1c2Uga29tZWRhIGlzIG5vdCBhIGxlZ2FjeQpkcml2ZXIuIEFu
ZCBhY2sgZm9yIG1lcmdpbmcgcmlnaHQgYXdheSB3b3VsZCBiZSBuaWNlLgoKVGhhbmtzLCBEYW5p
ZWwKCj4gCj4gSGkgQXlhbjoKPiBDb3VsZCB5b3UgaGVscCB0aGUgc3F1YXNoIGFsbCB0aGVzZSBw
YXRjaGVzIHRvIGEgc2luZ2xlIG9uZS4KPiAKPiBUaGFua3MKPiBKYW1lcwo+IAo+ID4gIAkuZ2Vt
X2ZyZWVfb2JqZWN0X3VubG9ja2VkCT0gZHJtX2dlbV9jbWFfZnJlZV9vYmplY3QsCj4gPiAtLSAK
PiA+IDIuMjAuMQoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
