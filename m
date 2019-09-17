Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4A5B4E9B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 14:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158546EC51;
	Tue, 17 Sep 2019 12:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE65D6EC51
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 12:58:18 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r9so3206901edl.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 05:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=JXHXCUn3xM+axjQAgcuFy2E9zY+IExK3yfeI1AgqjB4=;
 b=Bh+sfUuYNGw74F9OerQmDeGgbmueeQEl/pX5IsP1qtBVTNtDOGRktpMTQV0nNLomRU
 2lEpaFcPVFyoJ1BpCb4OlJU1LstBByJzGGfopanZnYU4cOxArgKb3PpkTlwKeuVwQKa6
 yfsA3FsJZNlr9KvKvyFN5UW5kDuEApPiadkLPUoIFaE3WoqzkrI2ClJwK5x9o+kpPCr9
 aR1OBIQKn0MJUWYU3ZloNPxkN4Vmp2T+i84yFs0CabPdE+qUU12Wka0WXQ+ACjzb4teQ
 i3mFle8YpnosZFrFPz21axJ3AZ5jnFhkmg24mLRDrlUbp1UzLArYeG3bMUgZ2KaUMD0j
 EEBA==
X-Gm-Message-State: APjAAAXNzMPXcqhwO043D6ucw4lPRd6DI+lGOWji9ohKr7yE8xmkK490
 CL4brpp3WrxzewdSvul8M3r2RSjqJDM=
X-Google-Smtp-Source: APXvYqwf2E3f40RP0ReqpIf9aZ1TLZgS52+Wgx+6ACEfQaxosSIzrNsstrvKcAOYE/POx7VVeBQCsw==
X-Received: by 2002:a17:906:31c3:: with SMTP id
 f3mr4727778ejf.296.1568725097303; 
 Tue, 17 Sep 2019 05:58:17 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j8sm333049edy.44.2019.09.17.05.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 05:58:16 -0700 (PDT)
Date: Tue, 17 Sep 2019 14:58:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] drm/selftests: fix spelling mistake "misssing" ->
 "missing"
Message-ID: <20190917125814.GS3958@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
 David Airlie <airlied@linux.ie>,
 Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20190911091227.5710-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911091227.5710-1-colin.king@canonical.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=JXHXCUn3xM+axjQAgcuFy2E9zY+IExK3yfeI1AgqjB4=;
 b=Tmu3YdHSFA/P+RkVYRWHFlE/3X1GgBFXNXG6wy3twbQw9KPZwRbZYwc5AmDRKzeN6g
 SS9cEfqNtVkP0Wsa/59olR50tqTVxpASsF/9EQ0z/X/nry4N1NLvE/wemSdYQMZ/JU8t
 98iX46vz2p7axxaycWCzoz+LQGBLFndkR5hGU=
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
Cc: David Airlie <airlied@linux.ie>,
 Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMTA6MTI6MjdBTSArMDEwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IFRoZXJlIGlzIGEgc3BlbGxpbmcgbWlzdGFrZSBpbiBhIGxpdGVyYWwgc3RyaW5nLCBmaXggaXQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2Fs
LmNvbT4KCkFwcGxpZWQsIHRoYW5rcy4KLURhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3NlbGZ0ZXN0cy90ZXN0LWRybV9mcmFtZWJ1ZmZlci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9mcmFtZWJ1ZmZlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9mcmFtZWJ1ZmZlci5jCj4gaW5kZXggNzRkNTU2MWE4NjJi
Li4yZDI5ZWE2ZjkyZTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90
ZXN0LWRybV9mcmFtZWJ1ZmZlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90
ZXN0LWRybV9mcmFtZWJ1ZmZlci5jCj4gQEAgLTEyNiw3ICsxMjYsNyBAQCBzdGF0aWMgc3RydWN0
IGRybV9mcmFtZWJ1ZmZlcl90ZXN0IGNyZWF0ZWJ1ZmZlcl90ZXN0c1tdID0gewo+ICAJCSAuaGFu
ZGxlcyA9IHsgMSwgMSwgMCB9LCAucGl0Y2hlcyA9IHsgTUFYX1dJRFRILCBNQVhfV0lEVEggLSAx
LCAwIH0sCj4gIAl9Cj4gIH0sCj4gLXsgLmJ1ZmZlcl9jcmVhdGVkID0gMCwgLm5hbWUgPSAiTlYx
MiBJbnZhbGlkIG1vZGlmaWVyL21pc3NzaW5nIERSTV9NT0RFX0ZCX01PRElGSUVSUyBmbGFnIiwK
PiAreyAuYnVmZmVyX2NyZWF0ZWQgPSAwLCAubmFtZSA9ICJOVjEyIEludmFsaWQgbW9kaWZpZXIv
bWlzc2luZyBEUk1fTU9ERV9GQl9NT0RJRklFUlMgZmxhZyIsCj4gIAkuY21kID0geyAud2lkdGgg
PSBNQVhfV0lEVEgsIC5oZWlnaHQgPSBNQVhfSEVJR0hULCAucGl4ZWxfZm9ybWF0ID0gRFJNX0ZP
Uk1BVF9OVjEyLAo+ICAJCSAuaGFuZGxlcyA9IHsgMSwgMSwgMCB9LCAubW9kaWZpZXIgPSB7IERS
TV9GT1JNQVRfTU9EX1NBTVNVTkdfNjRfMzJfVElMRSwgMCwgMCB9LAo+ICAJCSAucGl0Y2hlcyA9
IHsgTUFYX1dJRFRILCBNQVhfV0lEVEgsIDAgfSwKPiAtLSAKPiAyLjIwLjEKPiAKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
