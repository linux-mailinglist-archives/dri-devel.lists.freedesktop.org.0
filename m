Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0098100C2E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 20:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B2A6E037;
	Mon, 18 Nov 2019 19:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC666E037
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 19:24:52 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id i2so6292493ywg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 11:24:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RR1Ga3A1uU2EwTdicRD/oRGttbdcdStZ/iHxBYKT5CE=;
 b=tdmRD2p4PMTpTOxkqQO86NhtkquutWR83H47NAF+pVcNPuPTTWsWROqokONMmcskPT
 f+aJGlrIVUb9ErO0KTVmvmUJ6noQzB3x0B5WlI3Z2ec2dAypcT8T+qKgT32EOuTWLYuV
 QbNJrwWgHQaJdORUUmzXr/MtSXBWa3QueeJCyixCohDhIEVNF3LB8+lmYFQBk57RYazT
 BAiqedKFZZ0H3TF5nC5k+pIQeKT29P4yOjbf6mecAyGapU2w+mv9jCGmRRsJInatAtkS
 LfQpKhuvlP5rlxNKJV46LYI7e0SNaJsNILSa/FtnCSUkLBe+7AUpsyDO+7uiuZjOUgq3
 8PQQ==
X-Gm-Message-State: APjAAAWQVyvttqnNlfmH/3XfRsxER3HnOO9wFnzCP/kRmKyC45qmKJFR
 XGohFhSuQGafADAvPjsCatyMqg==
X-Google-Smtp-Source: APXvYqzl9A6vN6o+ULDkUlZz1ITko3Pi29zzVl0fCErvVOD1nwPrfbxJyGG33yD6KHdyQOeaz77hbQ==
X-Received: by 2002:a81:49d1:: with SMTP id
 w200mr19894554ywa.169.1574105091585; 
 Mon, 18 Nov 2019 11:24:51 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id r196sm8953955ywg.102.2019.11.18.11.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 11:24:50 -0800 (PST)
Date: Mon, 18 Nov 2019 14:24:50 -0500
From: Sean Paul <sean@poorly.run>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/2] add new DRM_DEV_WARN macro
Message-ID: <20191118192450.GA135013@art_vandelay>
References: <20191114132436.7232-1-wambui.karugax@gmail.com>
 <8736ep1hm2.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8736ep1hm2.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RR1Ga3A1uU2EwTdicRD/oRGttbdcdStZ/iHxBYKT5CE=;
 b=X3j1TWib3+Ts1yw/h9JSFot/7FOdRZxuSgzhQUhk9RX0px8sG0WBQZhDj4BBYPdlrY
 J4/WP8c5m+JUrfOTQmqzd3YoA61wc3CQh6jEEYyr1o9EJaG1j579HoLiQGB8tkRxyBaW
 XE9aGipx0u+/HUcxEay7fxGgq957hsoo3kGpuXpblgNkQqBm5Z5JhLDCY4uVqqWVtYD4
 WRmNouNlgix/ap6zSk2QUGxa3URJLevajDNFE3t6/jn8ofZ9vf5/RreGwxYmU8os0hcu
 9NGvn1khICOPssu0id2qHZC7cHZboqYSAGyoUNetFiJJAOh8jsKrlhFfeIKuO/tsUCGW
 jOIw==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDE6NTI6NTNQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gVGh1LCAxNCBOb3YgMjAxOSwgV2FtYnVpIEthcnVnYSA8d2FtYnVpLmthcnVnYXhA
Z21haWwuY29tPiB3cm90ZToKPiA+IFRoaXMgYWRkcyBhIG5ldyBEUk1fREVWX1dBUk4gaGVscGVy
IG1hY3JvIGZvciB3YXJuaW5ncyBsb2cgb3V0cHV0IHRoYXQgaW5jbHVkZQo+ID4gZGV2aWNlIHBv
aW50ZXJzLiBJdCBhbHNvIGluY2x1ZGVzIHRoZSB1c2Ugb2YgdGhlIERSTV9ERVZfV0FSTiBtYWNy
byBpbgo+ID4gZHJtL3JvY2tjaGlwIHRvIHJlcGxhY2UgZGV2X3dhcm4uCj4gCj4gSSdtIHRyeWlu
ZyB0byBzb2xpY2l0IG5ldyBzdHJ1Y3QgZHJtX2RldmljZSBiYXNlZCBsb2dnaW5nIG1hY3Jvcywg
YW5kCj4gc3RhcnRpbmcgdG8gY29udmVydCB0byB0aG9zZS4gWzFdCj4gCgpUaGlzIHNvdW5kcyBn
b29kIHRvIG1lLCBJJ2QgbXVjaCBwcmVmZXIgdGhlIG5vbi1jYXBzIHZlcnNpb25zIG9mIHRoZXNl
CmZ1bmN0aW9ucy4gU28gbGV0J3Mgd2FpdCBmb3IgdGhvc2UgdG8gYnViYmxlIHVwIGFuZCB0aGVu
IGNvbnZlcnQgcm9ja2NoaXAgdG8KZHJtX2Rldl8qCgpTZWFuCgo+IEJSLAo+IEphbmkuCj4gCj4g
Cj4gWzFdIGh0dHA6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzYzZDFl
NzJiOTllOWMxM2VlNWIxYjM2MmE2NTNmZjljMjFlMTkxMjQuMTU3MjI1ODkzNi5naXQuamFuaS5u
aWt1bGFAaW50ZWwuY29tCj4gCj4gCj4gCj4gCj4gPgo+ID4gV2FtYnVpIEthcnVnYSAoMik6Cj4g
PiAgIGRybS9wcmludDogYWRkIERSTV9ERVZfV0FSTiBtYWNybwo+ID4gICBkcm0vcm9ja2NoaXA6
IHVzZSBEUk1fREVWX1dBUk4gbWFjcm8gaW4gZGVidWcgb3V0cHV0Cj4gPgo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYyB8IDMgKystCj4gPiAgaW5jbHVkZS9kcm0vZHJt
X3ByaW50LmggICAgICAgICAgICAgIHwgOSArKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiAtLSAKPiBKYW5pIE5pa3VsYSwg
SW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2Fy
ZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
