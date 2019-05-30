Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567D52FB0E
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 13:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2BA6E2C7;
	Thu, 30 May 2019 11:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7900E6E2DD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 02:55:39 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id a132so2876294qkb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 19:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hXC4kHzYwJGnl8YXVUWx0puoDDwpLZgED1hwjltNjg4=;
 b=cmat1hb2GvsjCT7MKlpIYHzRKu3P0mB7nJwi7jE2/ViYdNHVqbX70Xbn23sL93kYU4
 XjtollFN1ssOVBcwzLzFAyaVb+Tu1PF7+vznBzN3gG94CKDRSmiGfCSqKgD7dxsgmP0P
 o84sfy2Lr7NWdBIu32P1k2/lLQ1Lpf4bsIj/bCwaKYfXtYVnjJN1ec5FGGhFRG/fBUje
 LuifxqT+4cmEe79stSWLTlKIhYttCIi8wo+6nHIkojN6fSgttT8P0N6sIcKyYQUGr+kh
 VMTTkK6cC4hzXrVRzf9sIy1+XAk3Cvd3FT/MawJlLrUh5YLDgRecntvrsq5hIBkuAmtx
 TKgw==
X-Gm-Message-State: APjAAAVNAyqrpyKk4U3HjnH8PV/ScrrrLNMKnCSab6J8KGJ04FZVAVaQ
 qmskJExCIvPNXNgHZYQpWbwtZIv+9WzvpL8baB+WWQ==
X-Google-Smtp-Source: APXvYqwbvVCUHkyZ1UVrW3CoWKtkXaSs4V4XiLDBo7b0pM95AINVAYXNQOY+l2q5rzTV9S+lLKzvEUHvy1askLPhD+c=
X-Received: by 2002:a05:620a:1425:: with SMTP id
 k5mr1062627qkj.146.1559184938564; 
 Wed, 29 May 2019 19:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190528073908.633-1-hsinyi@chromium.org>
 <1559033586.5141.3.camel@mtksdaap41>
In-Reply-To: <1559033586.5141.3.camel@mtksdaap41>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 30 May 2019 10:55:12 +0800
Message-ID: <CAJMQK-ir9J-JN9DDZPBA1nVkJUZ_6A+fY4fA6jx6zOh_9q5a-w@mail.gmail.com>
Subject: Re: [PATCH v3] gpu/drm: mediatek: call mtk_dsi_stop() after
 mtk_drm_crtc_atomic_disable()
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Thu, 30 May 2019 11:39:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hXC4kHzYwJGnl8YXVUWx0puoDDwpLZgED1hwjltNjg4=;
 b=K6yWGboPMYwUdNCjC32JmzZHDaPsR9bN4M9bMJOWj6QNjlo3n58nUVIKLrzji8AhDW
 7QezzgWoWhv/YRJ2k7nX4f7ltYiLhEMyhrCUrbTEXlKVqJC0bvB2UyywYyuaFizo68zv
 ugWTtb5QNrzFd7wJvqKR8eeF8DfRbkXiaWjn4=
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
Cc: David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgNDo1MyBQTSBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
PiB3cm90ZToKCj4gSSB0aGluayB3ZSd2ZSBhbHJlYWR5IGRpc2N1c3NlZCBpbiBbMV0uIEkgbmVl
ZCBhIHJlYXNvbiB0byB1bmRlcnN0YW5kCj4gdGhpcyBpcyBoYXJkd2FyZSBiZWhhdmlvciBvciBz
b2Z0d2FyZSBidWcuIElmIHRoaXMgaXMgYSBzb2Z0d2FyZSBidWcsIHdlCj4gbmVlZCB0byBmaXgg
dGhlIGJ1ZyBhbmQgY29kZSBjb3VsZCBiZSBzeW1tZXRyaWMuCj4KPiBbMV0KPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtbWVkaWF0ZWsvMjAxOS1NYXJjaC8wMTg0
MjMuaHRtbAo+CkhpIENLLAoKSml0YW8gaGFzIHJlcGxpZWQgaW4gdjJbMV0KIgptdGtfZHNpX3N0
YXJ0IG11c3QgYWZ0ZXIgZHNpIGZ1bGwgc2V0dGluZy4KSWYgeW91IHB1dCBpdCBpbiBtdGtfZHNp
X2RkcF9zdGFydCwgbXRrX2RzaV9zZXRfbW9kZSB3b24ndCB3b3JrLiBEU0kKd2lsbCBrZWVwIGNt
ZCBtb2RlLiBTbyB5b3Ugc2VlIG5vIGlycS4KLi4uCiIKClsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTA1MjUwNS8jMTI3NjI3MAoKVGhhbmtzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
