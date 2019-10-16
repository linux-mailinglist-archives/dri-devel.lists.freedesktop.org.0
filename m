Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D89D9A88
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 21:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEBB6E441;
	Wed, 16 Oct 2019 19:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447596E441
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 19:58:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m18so120651wmc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 12:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=QwGBNF2mfPZCSaxVM5L9gL5V9TjNG0cRrtA4XmOd9ig=;
 b=qVS0W+E1HDQPEo/kl0l6RfB7Lp9bHuilNmcai0BmnAYu284Krln/KfdqC0kT5+8TZW
 4aCzMViL3QH5HCWE7lkrIDGUZQEwQZ3NwFrdSr0BmzTKUbjc/FGayugHqEcm7vFbw7Ie
 Lkqwvoe+H7JuN6s8fVAOVUQ1tAJa94eYnfx6gCADXxiMQFlWQWVNv78KRi9RNn2NMcGL
 HjJPL6Le3eWP2YhMnJqaVj7m4Ai187Arkp3guYyjqeABnbrvSJ8Jp/wwjVBDsFufnPBO
 vpL1JrQLusQ9zHXgltwBEyzHCCjDebOiX7PmUt3FLoMDeSkdhWhXCsMxDt/ggfe4Y6XX
 rvKA==
X-Gm-Message-State: APjAAAXxMGdxkMeAmutWz3I0JC1ASnNoLGfgR/UUBBidz70IhrlK+c99
 0Ac9kfa7CyNrzQxPg2udwNtWDg==
X-Google-Smtp-Source: APXvYqxZwgDuBJqSQKKYZXwM7ec49oPND5H+SOWCdy5OpKj8FB3a3dMYc2MHsfEQE7nd+AiWGjbncA==
X-Received: by 2002:a05:600c:40f:: with SMTP id
 q15mr4805361wmb.30.1571255887783; 
 Wed, 16 Oct 2019 12:58:07 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z189sm5560530wmc.25.2019.10.16.12.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 12:58:07 -0700 (PDT)
Date: Wed, 16 Oct 2019 21:58:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 28/34] drm/i810: Refer to `PREEMPTION' in comment
Message-ID: <20191016195804.GT11828@phenom.ffwll.local>
Mail-Followup-To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, tglx@linutronix.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-29-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015191821.11479-29-bigeasy@linutronix.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=QwGBNF2mfPZCSaxVM5L9gL5V9TjNG0cRrtA4XmOd9ig=;
 b=KgWCWfmOZGpSCZNWMRYQhncy0eSsPeH2NqSIWrW8U4soudxZrxYIUKF/yJ1A8BXJhW
 HfTp/eXqF1pKVvAYqaC7aemOzRNKbIatlTsXU+nTfKYc8paWI/riU2Y2Q49gzcop2N/R
 25AjagpuFiB+h1pWC0elrJSbnQIE7F10qziqA=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tglx@linutronix.de,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDk6MTg6MTVQTSArMDIwMCwgU2ViYXN0aWFuIEFuZHJ6
ZWogU2lld2lvciB3cm90ZToKPiBUaGUgZGVwZW5kZW5jeSBoYXMgYmVlbiBjaGFuZ2VkIGZyb20g
YFBSRUVNUFQnIHRvIGBQUkVFTVBUSU9OJy4gUmVmbGVjdAo+IHRoaXMgY2hhbmdlIGluIHRoZSBj
b21tZW50Lgo+IAo+IFVzZSBgUFJFRU1QVElPTicgaW4gdGhlIGNvbW1lbnQuCj4gCj4gQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6
IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBDYzogU2VhbiBQYXVsIDxzZWFu
QHBvb3JseS5ydW4+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciA8
YmlnZWFzeUBsaW51dHJvbml4LmRlPgoKUXVldWVkIGZvciA1LjUgaW4gZHJtLW1pc2MsIHRoYW5r
cyBmb3IgeW91ciBwYXRjaC4KLURhbmllbAo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZp
ZyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnIGIvZHJpdmVycy9ncHUv
ZHJtL0tjb25maWcKPiBpbmRleCBlNjdjMTk0YzJhY2FkLi41ZjZkY2JiZWIwYzFiIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL0tj
b25maWcKPiBAQCAtMzk3LDcgKzM5Nyw3IEBAIGNvbmZpZyBEUk1fUjEyOAo+ICAKPiAgY29uZmln
IERSTV9JODEwCj4gIAl0cmlzdGF0ZSAiSW50ZWwgSTgxMCIKPiAtCSMgIVBSRUVNUFQgYmVjYXVz
ZSBvZiBtaXNzaW5nIGlvY3RsIGxvY2tpbmcKPiArCSMgIVBSRUVNUFRJT04gYmVjYXVzZSBvZiBt
aXNzaW5nIGlvY3RsIGxvY2tpbmcKPiAgCWRlcGVuZHMgb24gRFJNICYmIEFHUCAmJiBBR1BfSU5U
RUwgJiYgKCFQUkVFTVBUSU9OIHx8IEJST0tFTikKPiAgCWhlbHAKPiAgCSAgQ2hvb3NlIHRoaXMg
b3B0aW9uIGlmIHlvdSBoYXZlIGFuIEludGVsIEk4MTAgZ3JhcGhpY3MgY2FyZC4gIElmIE0gaXMK
PiAtLSAKPiAyLjIzLjAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
