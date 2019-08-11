Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E140891E6
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 15:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A1C6E329;
	Sun, 11 Aug 2019 13:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57466E329
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 13:48:00 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p74so9954764wme.4
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 06:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1RR8k2zq2z+DJMeFFCKSNgkOazPtdAz6+ppJvaFX1zg=;
 b=McafKURu+6daM24hoE91oI2gIQ6+uj9eSmG0okoKZxMnAVPxXzQFL63gAApo10KAB2
 2GJAdNNABC97p0jRucCKEUFSDHIYhnoQ8vCCGnTFMePkRfgtsVLm4q9H0m15bvywZUa6
 2T/Ldk7vNKSQQHZU79o0sMvH0iX/fhJSGNOShEdFBR45haxyhdV1kSUJiIYx5Z2rss3b
 uWt+umKglyQkKy/ghw9n873a4APHD2JxGD6+K/qbi5mPEAgH9x0K+O4v3GK9Q1Vga8yT
 xLawV80tNjEevdqewgGWQxLVK0NCv7kw/bHTgOPc2HeQr1qqk8eO2I2bN8RP3S+cs1Ik
 T8cw==
X-Gm-Message-State: APjAAAVhlEYFgo3RH37VVoXs8Hh5cMGMM4b3zq2uM17Q6R6HRIxE0HqE
 Ad9L9rTTgOQeX2kx1TCvLCVPYA11Ggw=
X-Google-Smtp-Source: APXvYqyfmUDJAN+TZk28Jv9z+D8RtleUuGb3pYQs3xCRu4r6/AcPro6sTi4T+qVRzSZ7kF8Y9SV/eg==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr22837695wmg.111.1565531279149; 
 Sun, 11 Aug 2019 06:47:59 -0700 (PDT)
Received: from dhcp-44-196.space.revspace.nl
 ([2a01:4f8:1c0c:6c86:46e0:a7ad:5246:f04d])
 by smtp.gmail.com with ESMTPSA id k128sm4672297wme.15.2019.08.11.06.47.57
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Aug 2019 06:47:58 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm: gm12u320: Some minor cleanups
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190730133857.30778-1-hdegoede@redhat.com>
 <20190801145922.GA30758@ravnborg.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <4cc772b1-6312-67a9-220d-ffad441f5855@redhat.com>
Date: Sun, 11 Aug 2019 15:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801145922.GA30758@ravnborg.org>
Content-Language: en-US
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiA4LzEvMTkgNDo1OSBQTSwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IEhpIEhhbnMuCj4g
Cj4gT24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDM6Mzg6NTZQTSArMDIwMCwgSGFucyBkZSBHb2Vk
ZSB3cm90ZToKPj4gMyBzbWFsbCBjbGVhbnVwczoKPj4KPj4gMSkgRHJvcCB1bnVzZWQgRFJJVkVS
X1BBVENITEVWRUwKPj4gMikgV2UgZG8gbm90IHNldCBtb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVw
dGgsIHNvIGluc3RlYWQgb2YgcGFzc2luZyB0aGUKPj4gICAgIHVuc2V0IG1vZGVfY29uZmlnLnBy
ZWZlcnJlZF9kZXB0aCB0byBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cAo+PiAgICAgc2ltcGx5IHBh
c3MgMAo+PiAzKSBVc2UgX19tYXliZV91bnVzZWQgaW5zdGVhZCBvZiAjaWZkZWYgQ09ORklHX1BN
IGFyb3VuZCB0aGUgc3VzcGVuZCAvCj4+ICAgICByZXN1bWUgZnVuY3Rpb25zCj4+Cj4+IENjOiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4+IFN1Z2dlc3RlZC1ieTogU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IElmIHlvdSBhZGQ6Cj4gU3VnZ2VzdGVkLWJ5OiBOb3Jh
bGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiBBbmQgYWRqdXN0IHRvIHRoZSBuZXcg
bG9jYXRpb24uCj4gCj4gVGhlbiB0aGlzIGlzOgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcg
PHNhbUByYXZuYm9yZy5vcmc+CgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuIEkgd2lsbCBwdXNo
IHRoaXMgdG8gZHJtLW1pc2MtbmV4dCwgd2l0aAp0aGUgc3VnZ2VzdGVkIGNoYW5nZXMsIHRvbW9y
cm93ICh3aGVuIEknbSBiYWNrIGJlaGluZCBteQp3b3Jrc3RhdGlvbiB3aGljaCBoYXMgYWxsIHRo
ZSBuZWNlc3Nhcnkga2VybmVsIHRyZWVzKS4KClJlZ2FyZHMsCgpIYW5zCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
