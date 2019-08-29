Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA81EA1C6B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 16:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AEE6E116;
	Thu, 29 Aug 2019 14:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6A06E116
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:09:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y19so3599807wrd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 07:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=IkHNgNXF6D7gCyp+RTOcFkFjmwHzwHacGQCef/fkUxY=;
 b=Xyt4hiKJkSZWK2F2eOIvWhSvfMdDqfE3j6RcgmmrByBtMLKsTQ1RLBKnYQXthDueDr
 dhKLR01xaA1tTK9wSto5Pw0txqazf5dj3E0Yzzbmx8C4dWob4d738NPVTTeDzQ7fFJvG
 D4FSLYaPthC7dBeGOuLPyzygrCAr1htz+HlQeOgVe1UDfmdWRvncniOBxB0SvM7IYnfD
 hxweAx8KJD/KT5ePGTEvaMCn/zFTRMyqwDxvlxmkHHkFGqIagVdHogSCicpdKDTd0mwm
 FzkEdSdW1gdhE11gimjLsgdh7782VFhbt8LdW/TU2JMFu1ee7RfWKGDwTfcf49FzyQVz
 JHhQ==
X-Gm-Message-State: APjAAAXlrTWwPPXBnimM7AULYY38p7u7JouNUI7pJ2NxS0kRaL974Gw/
 w2xwFBQWs5g25P+IP4HM+VHGCQ==
X-Google-Smtp-Source: APXvYqwiMxS8OI3sVqHrlxU2MXj7Dr8WUNvrh5fZlS6vkfDCaJgvdL8CdRuYQ0wj2AMCRBXiyNGY7g==
X-Received: by 2002:a5d:4403:: with SMTP id z3mr12172324wrq.29.1567087748452; 
 Thu, 29 Aug 2019 07:09:08 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id x10sm3753474wrn.39.2019.08.29.07.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 07:09:07 -0700 (PDT)
Date: Thu, 29 Aug 2019 15:09:05 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190829140905.wkv2pwzmhhfyzan4@holly.lan>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
 <20190807201528.GO250418@google.com>
 <510f6d8a-71a0-fa6e-33ea-c4a4bfa96607@linaro.org>
 <20190816175317.GU250418@google.com>
 <20190819100241.5pctjxmsq6crlale@holly.lan>
 <20190819185049.GZ250418@google.com>
 <20190820135617.64urowbu2kwdynib@holly.lan>
 <20190827094459.GB4804@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827094459.GB4804@dell>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=IkHNgNXF6D7gCyp+RTOcFkFjmwHzwHacGQCef/fkUxY=;
 b=xFOj/svuT22SFm97iQcFsK0oNFWzU154jPyVuCgNRf5gyBEcfHhZ2ZsekaoCHfHUm9
 s6hPxGLyB/81mzV7lVqSs/AUJShAiedtr5S85sXwK3ra0J54ydcopngIC6im8ct3ziDM
 jCXSqPriXn4lrUAtUn2oU1+EIn67VeCKSLM5ljZ7yJHmM4TooBhQ7O3TFc3hWlzQsWf6
 HKmgS8YkGFWZwEV79UeejLszdVZJPS7YT+OMKbBA8/OUuPwvsJIhQ69adRXIwa68KfKP
 9MtDV92BUEiGX36sbnzNHwQGQdXswpSiKsjsQGwbJ15TNO2d3vyDdGf5aHTv1C+li7Oz
 uvBg==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTA6NDQ6NTlBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IFsuLi5dCj4gCj4gPiA+IElJVUMgdGhlIGNvbmNsdXNpb24gaXMgdGhhdCB0aGVyZSBpcyBu
byBuZWVkIGZvciBhIHN0cmluZyBhdHRyaWJ1dGUKPiA+ID4gYmVjYXVzZSB3ZSBvbmx5IG5lZWQg
dG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiAncGVyY2VwdHVhbCcgYW5kCj4gPiA+ICdub24tcGVyY2Vw
dHVhbCcuIElmIHRoYXQgaXMgY29ycmVjdCwgZG8geW91IGhhdmUgYW55IHByZWZlcmVuY2UgZm9y
Cj4gPiA+IHRoZSBhdHRyaWJ1dGUgbmFtZSAoJ3BlcmNlcHR1YWxfc2NhbGUnLCAncGVyY2VwdHVh
bCcsIC4uLik/Cj4gPiAKPiA+IE1vcmUgYSBzdW1tYXJ5IHRoYW4gYSBjb25jbHVzaW9uISBUaGVy
ZSBpcyBhIHJlYXNvbiBJIGhhdmUgbGVmdCBhIGJpdCBvcgo+ID4gc3BhY2UgZm9yIG90aGVycyB0
byBjb21tZW50IG9uIHRoaXMgb3ZlciB0aGUgbGFzdCBtb250aCAoYW5kIGEgYml0KS4KPiA+IAo+
ID4gVG8gYmUgY2xlYXIgbXkgUmV2aWV3ZWQtYnk6IG1lYW5zIHRoYXQgSSBiZWxpZXZlIHRoYXQg
dGhlIGtlcm5lbCBpcyBiZXR0ZXIKPiA+IHdpdGggIm5vbi1saW5lYXIvbGluZWFyL3Vua25vd24i
IHRoYW4gd2l0aG91dCBpdCBhbmQgdGhhdCBJIGFtIGNvbWZvcnRhYmxlCj4gPiB0aGUgQVBJIGlz
bid0IGxpa2VseSB0byBiZSBhIG1pbGxzdG9uZSBmb3IgdXMuCj4gPiAKPiA+IExlZSwgSmluZ29v
OiBFaXRoZXIgb2YgeW91IGNhcmUgdG8gb2ZmZXIgJDAuMDIKPiAKPiBObywgbm90IHJlYWxseS4g
IEhhcHB5IHRvIGxlYXZlIGl0IHRvIHlvdXIgZ29vZCBqdWRnZW1lbnQuCgpJbiB0aGF0IGNhc2Uu
Li4gdGhlIHBhdGNoIGhhcyBteSByZXZpZXdlZC1ieSBhbmQgYWx0aG91Z2ggdGhlIGNvbmNlcm5z
CnJhaXNlZCBpbiB0aGUgYXNzb2NpYXRlZCB0aHJlYWRzIGhhdmUgbWVyaXQgSSBkb24ndCB0aGlu
ayB0aGV5IGFyZQplbm91Z2ggdG8gc3RvcCB0aGUgcGF0Y2guCgpQbGVhc2UgbWVyZ2UuCgoKRGFu
aWVsLgoKPiAKPiAtLSAKPiBMZWUgSm9uZXMgW+adjueQvOaWr10KPiBMaW5hcm8gU2VydmljZXMg
VGVjaG5pY2FsIExlYWQKPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QVJNIFNvQ3MKPiBGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
