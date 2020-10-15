Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1B528F5C0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 17:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53F36ED64;
	Thu, 15 Oct 2020 15:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32B56ED65
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 15:23:05 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h7so4008546wre.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 08:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=37I63cZBodA+13wzLqZfOcrBqfvt4ww4Wg+i0WcmZ1o=;
 b=T+bebg+YD46I6Hulxd9R88hBGXswgNHgXR0A/YJJrQtmpNN2az61LLTpHx08Ky8qfP
 rg0NBZBPJk2cKDM+H4K3WnVuFEZejqm1XPacEKoLgD1V8exuQRx/JBP47RiMfp0lrNKs
 qSjJ4WyTF02hebJ0G5b1UxVgqX83E1+oYSL74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=37I63cZBodA+13wzLqZfOcrBqfvt4ww4Wg+i0WcmZ1o=;
 b=YSjbOWSLU2OnpJbNk887thpiLVQgK2mOBAqkYSCoczhXc5DZQOtBASKTk3/5kAL6Wb
 rKtiHlgGd544NkzlfvNjNVRSXTG1oeowrf6+gyXo5ZxtAAHevckGJesxbWQHDCEIz8ew
 mTFyO9nCCfUHK+w2bvg0XV6s1nYF9lyP3VNmKkGD9sW103kmylqY+LVJ8hjKgmlCbyGy
 QPGiWWQ29IfkwsmXcgrQW4moVQ15euH6fM1Io2SeljYMjSJGmQGQPi5HN4E3i+JM0Uz2
 ypx2Svd5zwm8xjkc9ac+jPYNDadaEvG185FzJZf0IAU9N0rOSx0bhy+zLOqklwDpqGqX
 J2Yw==
X-Gm-Message-State: AOAM530TQU6AfXm/Fxi0yAbYGAopsp7IahOlBUDdiHTw4LUzfPoTmrhx
 kF4SYrst0XaVaKCwRlOAAiazWw==
X-Google-Smtp-Source: ABdhPJz60cxmP1IUgfdwoRtfsr/U5/cjrhpBEp04wKon+qeZgoUhNl224cILQcKvdUU3iiEaIgb54g==
X-Received: by 2002:a5d:5106:: with SMTP id s6mr4820538wrt.51.1602775384469;
 Thu, 15 Oct 2020 08:23:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x3sm5050001wmi.45.2020.10.15.08.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 08:23:03 -0700 (PDT)
Date: Thu, 15 Oct 2020 17:23:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH v2] drm/of: Consider the state in which the ep is disabled
Message-ID: <20201015152301.GE438822@phenom.ffwll.local>
Mail-Followup-To: Kever Yang <kever.yang@rock-chips.com>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, huangtao@rock-chips.com,
 andy.yan@rock-chips.com, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200707112526.18438-1-hjc@rock-chips.com>
 <5c0cdb9d-8e35-fa0c-35b3-adfa7770fb30@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c0cdb9d-8e35-fa0c-35b3-adfa7770fb30@rock-chips.com>
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
Cc: huangtao@rock-chips.com, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, andy.yan@rock-chips.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTQsIDIwMjAgYXQgMDk6NDg6NDNBTSArMDgwMCwgS2V2ZXIgWWFuZyB3cm90
ZToKPiBIaSBNYWludGFpbmVycywKPiAKPiDCoMKgwqAgRG9lcyB0aGlzIHBhdGNoIHJlYWR5IHRv
IG1lcmdlPwoKV291bGQgbWF5YmUgYmUgZ29vZCB0byBnZXQgc29tZSBhY2tzIGZyb20gb3RoZXIg
ZHJpdmVycyB1c2luZyB0aGlzLCB0aGVuClNhbmR5IGNhbiBwdXNoIHRvIGRybS1taXNjLW5leHQu
Ci1EYW5pZWwKPiAKPiBPbiAyMDIwLzcvNyDkuIvljYg3OjI1LCBTYW5keSBIdWFuZyB3cm90ZToK
PiA+IGRvbid0IG1hc2sgcG9zc2libGVfY3J0Y3MgaWYgcmVtb3RlLXBvaW50IGlzIGRpc2FibGVk
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29t
Pgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYyB8IDMgKysrCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fb2YuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYwo+ID4gaW5kZXgg
ZmRiMDVmYmY3MmEwLi41NjVmMDVmNWYxMWIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX29mLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYwo+ID4gQEAgLTY2
LDYgKzY2LDkgQEAgdWludDMyX3QgZHJtX29mX2ZpbmRfcG9zc2libGVfY3J0Y3Moc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwKPiA+ICAgCXVpbnQzMl90IHBvc3NpYmxlX2NydGNzID0gMDsKPiA+ICAg
CWZvcl9lYWNoX2VuZHBvaW50X29mX25vZGUocG9ydCwgZXApIHsKPiA+ICsJCWlmICghb2ZfZGV2
aWNlX2lzX2F2YWlsYWJsZShlcCkpCj4gPiArCQkJY29udGludWU7Cj4gPiArCj4gPiAgIAkJcmVt
b3RlX3BvcnQgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnQoZXApOwo+ID4gICAJCWlmICghcmVt
b3RlX3BvcnQpIHsKPiA+ICAgCQkJb2Zfbm9kZV9wdXQoZXApOwo+IAo+IExvb2tzIGdvb2QgdG8g
bWUuCj4gCj4gCj4gUmV2aWV3ZWQtYnk6IEtldmVyIFlhbmcgPGtldmVyLnlhbmdAcm9jay1jaGlw
cy5jb20+Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
