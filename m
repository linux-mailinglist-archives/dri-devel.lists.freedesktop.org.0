Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B182F6368
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 15:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132706E40A;
	Thu, 14 Jan 2021 14:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1966E40A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 14:47:33 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a12so6019985wrv.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 06:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=LjjYZgklRWjLMMBlb88qLIEN7lLRBVq95xQ8skgikMk=;
 b=cxNrQ/wS5RylS1mLd3vjuHDvzVyo8WuHvwGuRC4FR2heBf7aAMFtd3keuoJEZOZBBr
 N7/B6xT5rjJ5DDp1b7Q51zY/fZqdl0x8q9X7YcXKojVsi6+TdolBneF+XcDVeN3uXx5r
 D7mAhI+GS2FHRYfUfcpAvSo+3womr+L7J98+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=LjjYZgklRWjLMMBlb88qLIEN7lLRBVq95xQ8skgikMk=;
 b=uiep9+pdDYF147jHj7sDpnNITGgwuho+xthfx5DQEc4IHn/jleFVB+6a1t10FkciFW
 EDLTIsImTal7tBHFKeEgR7Qc7GhD8sBABsxsiwXoZtTWv94pEZ3wEia09rxWVR2xsMlD
 eXHrjZz/iBgrSFD8yb2MXChwyXA7XR79STzLQhzm/uidqrUrwboDF4tJ4BiZqAnGWK9e
 iloacEZn13FKdz1aycLR2JO7+UJF8d+JbMQDg0PHOXApdQ4GEKyTi+KWzRSj1klwq8zj
 cHhEwe1EnyhJ+eJ53H324OsAGQ9zCgcRl/AqgtKJHiUnfI2EYXcMDjw7+W3POvZLQAt5
 X2vw==
X-Gm-Message-State: AOAM53352sgZ7BfqMlEvoNdsbO08nDVHJomG4NYna2vJaTVXgqEM3DNX
 6blevU49joK5ulGicr/KFZvl/w==
X-Google-Smtp-Source: ABdhPJyb/IHCh3tcTbtEpGXHIFizVqnfT/d4Np+x9HepjrQC2XMwS3XmP1qV1pVz/sQVFRGmZJo6Lg==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr8359418wrv.397.1610635652487; 
 Thu, 14 Jan 2021 06:47:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n12sm10764911wrg.76.2021.01.14.06.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 06:47:31 -0800 (PST)
Date: Thu, 14 Jan 2021 15:47:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH] drm/vblank: Fix typo in docs
Message-ID: <YABZgVFuL0qZuET8@phenom.ffwll.local>
Mail-Followup-To: Sumera Priyadarsini <sylphrenadin@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210114142245.udr7v2aa43ho56xs@adolin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210114142245.udr7v2aa43ho56xs@adolin>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMTQsIDIwMjEgYXQgMDc6NTI6NDVQTSArMDUzMCwgU3VtZXJhIFByaXlhZGFy
c2luaSB3cm90ZToKPiBGaXggdHlwbyBpbiBpbnRybyBjaGFwdGVyIGluIGRybV92YmxhbmsuYy4K
PiBDaGFuZ2UgJ3NhY24nIHRvICdzY2FuJy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdW1lcmEgUHJp
eWFkYXJzaW5pIDxzeWxwaHJlbmFkaW5AZ21haWwuY29tPgoKTmljZSBjYXRjaCwgYXBwbGllZC4K
LURhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3ZibGFuay5jCj4gaW5kZXggZDMwZTJmMmI4ZjNjLi4zMDkxMmQ4ZjgyYTUgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fdmJsYW5rLmMKPiBAQCAtNzQsNyArNzQsNyBAQAo+ICAgKiAgICAgICAgICAgICAgICB84oaT
4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT
4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT4oaT
4oaTfCAgIHVwZGF0ZXMgdGhlCj4gICAqICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIGZyYW1lIGFzIGl0Cj4gICAqICAgICAgICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIHRyYXZlbHMg
ZG93bgo+IC0gKiAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAoInNhY24gb3V0IikKPiArICogICAgICAgICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgKCJzY2FuIG91dCIpCj4gICAqICAg
ICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBPbGQgZnJhbWUgICAgICAgICAgICAgICAgfAo+
ICAgKiAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwKPiAgICogICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8Cj4gLS0gCj4gMi4yNS4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
