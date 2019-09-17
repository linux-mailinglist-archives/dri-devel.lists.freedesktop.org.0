Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A647B4F2C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 15:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEFB6EC76;
	Tue, 17 Sep 2019 13:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9626EC76
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 13:28:34 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p2so3288874edx.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 06:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=x6hViGClTEGUi9Ex3nINQANElPUDTXWEwnFA8ofdZpo=;
 b=KczX29zvKu9FMPrV1Hw5NIggpugG47Tea2cmxhZi6G2CJdS8DTxlGZiIVigfYD0T86
 x6mjzZXWmcZ4Sqh7dG/XLEHgXhgp9Lh/VN6he2Gh5KRXz3ErYg7SBaS7pF5dcekOBin1
 WEs0q8nzkLSSg1Si3eAPimFCLwCIzQhq+eSRSDrkbFLsbNoclC7MC6o4bvM6bwlOCZpe
 EoAmBn/s4cy1xunyUHZyb+LsMQBAMj6WcuLjT7ln6w+StB/Fp8F8mm3QpD/vtkHPqsQ/
 sQ9Jycsws8NoJbdvSDs3G8e/+YodHVBGmAZXy0z30N021UvGYY2zqAtZb2NVrFMwFhpx
 4SyA==
X-Gm-Message-State: APjAAAXHy9tW9fiBRWM0gfdeowpjurPaKC3uu0Yj4RFh+UaHOTpPvNgK
 lv9jWdNNYQb1rtlYNiEnsuwMCw==
X-Google-Smtp-Source: APXvYqyrvVIHXDa3hY45ZcpbXd34FoVb3RaZYU57yddrYt7B1TVmPRVFX27kqnE0TAkx8P1s2sT9Jw==
X-Received: by 2002:a50:f00c:: with SMTP id r12mr4688681edl.274.1568726912952; 
 Tue, 17 Sep 2019 06:28:32 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j10sm438549ede.59.2019.09.17.06.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 06:28:32 -0700 (PDT)
Date: Tue, 17 Sep 2019 15:28:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 0/3] drm/encoder: Various doc fixes
Message-ID: <20190917132830.GX3958@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Maxime Ripard <mripard@kernel.org>
References: <20190913222704.8241-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913222704.8241-1-lyude@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=x6hViGClTEGUi9Ex3nINQANElPUDTXWEwnFA8ofdZpo=;
 b=M4iA4bP6kQzHF9qOiyhOOh05qxeTDc57m5lbx/Rfq6wJvYqAPFtN67Uoqw06xEQ2vt
 tu7PNtr7LKSmXPMaHSeqI3uFzUmNtb2tm85BL7hk/D5wuYSvyP3Jp+ZYIn79y3/POUzZ
 SptNxV7TNxyphW4K+gw5bs20Azj5T24F0r9cI=
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
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDY6Mjc6MDBQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBTb21lIHJhbmRvbSBpc3N1ZXMgd2l0aCBkb2N1bWVudGF0aW9uIHRoYXQgSSBub3RpY2Vk
IHdoaWxlIHdvcmtpbmcgb24KPiBub3V2ZWF1IHRoZSBvdGhlciBkYXkuIFRoZXJlIGFyZSBubyBm
dW5jdGlvbmFsIGNoYW5nZXMgaW4gdGhpcyBzZXJpZXMuCgpOaWNlISBPbiBhbGwgdGhyZWU6CgpS
ZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4gCgo+
IEx5dWRlIFBhdWwgKDMpOgo+ICAgZHJtL2VuY29kZXI6IEZpeCBwb3NzaWJsZV9jbG9uZXMgZG9j
dW1lbnRhdGlvbgo+ICAgZHJtL2VuY29kZXI6IEZpeCBwb3NzaWJsZV9jcnRjcyBkb2N1bWVudGF0
aW9uCj4gICBkcm0vZW5jb2RlcjogRG9uJ3QgcmFpc2Ugdm9pY2UgaW4gZHJtX2VuY29kZXJfbWFz
aygpIGRvY3VtZW50YXRpb24KPiAKPiAgaW5jbHVkZS9kcm0vZHJtX2VuY29kZXIuaCB8IDYgKysr
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
Cj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
