Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65418C9C1A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 12:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC676E9A1;
	Thu,  3 Oct 2019 10:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4550B6E9A1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 10:22:58 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o18so2284028wrv.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 03:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1jR6Vlrhk5n8xdNCiK+AfK7Qyv9fHZ3u4P5zPUviBBA=;
 b=nj30nbqGfwTw0rELkEyzfTUv9rksLeKTJGCjxfudy+hOUaq8Gq4Z+dL6WL3G6T8tNc
 koP1XHtUSkAOC4/gYqEsS35cinN9EwsgwE5DTmcV1w1oLlkSR/dEUPtJm+7T81m1jD29
 KaZE7Ui56UiJZWREXuFO98Y14nu9fN2h1ODY5gZJ/aRLOFxzNUFM7Kb4YYc7aVh7MDKG
 3vPe/zWXqDjRcu9Y14XXe8i6NVtvJngll5MLWLM6KFPuLjmnclqGVbiEVbkmNZj4+JJ5
 wRyRrch2HXdIEYgQjyFI98NZHsblrlfP21JrKsX3BfZYpH9FhRLqLlbrEoNoJUMQmjlA
 Ck9w==
X-Gm-Message-State: APjAAAUAwV7/ZGms/Q+LYSVllU1kc5ILxOh07fLeXvbTwUg72tq/ltWi
 Wotn7d7YnkuS+oT72zcF6zZBLA==
X-Google-Smtp-Source: APXvYqzGJWrEvT2IWWZZL9JYJSB1703dS2++pm8TSNDU1dHt3ZiFaN4rX/fBHhbqLudcii3fH7HH6w==
X-Received: by 2002:adf:e64e:: with SMTP id b14mr6952182wrn.16.1570098176821; 
 Thu, 03 Oct 2019 03:22:56 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d193sm2240931wmd.0.2019.10.03.03.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2019 03:22:56 -0700 (PDT)
Date: Thu, 3 Oct 2019 11:22:54 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: New sysfs interface for privacy screens
Message-ID: <20191003102254.dmwl6qimdca3dbrv@holly.lan>
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <20191002094650.3fc06a85@lwn.net> <87muei9r7i.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87muei9r7i.fsf@intel.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1jR6Vlrhk5n8xdNCiK+AfK7Qyv9fHZ3u4P5zPUviBBA=;
 b=PzAJzkrwyJdxr7vpeDPwT6M7e45aC+OHAA+kuLA4A0Vzohz/oWf1Ujiym2yaZdRo7C
 MI/wP8eM9cQJP36FyFTYeZes55Sh0K9j6SyLAiMXCzd0+mIXlecFqVpBu1KediWDR8O7
 ty6GSsTwOgwfULvypBuhnYFcfLrLZ2O7dBP9uF9KW1WO2hjQrfpcsiKPeEC32mQjEZMm
 6oxffSXFSCT7anOV7AjhAX+cpqJbK2LVjwB2ZCCsohc9+5AOqrmxubhevbMm9p6qOYv2
 5YR23WtUCknr8nE3RDSAR332Gv8Jw1oC1Veo2IcSTZg8jr7ZYen/y5kV3YXTDrpr4fVL
 ERcw==
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rafael@kernel.org,
 gregkh@linuxfoundation.org, Jonathan Corbet <corbet@lwn.net>,
 Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mat King <mathewk@google.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rajat Jain <rajatja@google.com>,
 Lee Jones <lee.jones@linaro.org>, Alexander Schremmer <alex@alexanderweb.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMTE6MTk6MTNBTSArMDMwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gV2VkLCAwMiBPY3QgMjAxOSwgSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5l
dD4gd3JvdGU6Cj4gPiBPbiBUdWUsIDEgT2N0IDIwMTkgMTA6MDk6NDYgLTA2MDAKPiA+IE1hdCBL
aW5nIDxtYXRoZXdrQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+PiBJIGhhdmUgYmVlbiBsb29r
aW5nIGludG8gYWRkaW5nIExpbnV4IHN1cHBvcnQgZm9yIGVsZWN0cm9uaWMgcHJpdmFjeQo+ID4+
IHNjcmVlbnMgd2hpY2ggaXMgYSBmZWF0dXJlIG9uIHNvbWUgbmV3IGxhcHRvcHMgd2hpY2ggaXMg
YnVpbHQgaW50byB0aGUKPiA+PiBkaXNwbGF5IGFuZCBhbGxvd3MgdXNlcnMgdG8gdHVybiBpdCBv
biBpbnN0ZWFkIG9mIG5lZWRpbmcgdG8gdXNlIGEKPiA+PiBwaHlzaWNhbCBwcml2YWN5IGZpbHRl
ci4gSW4gZGlzY3Vzc2lvbnMgd2l0aCBteSBjb2xsZWFndWVzIHRoZSBpZGVhIG9mCj4gPj4gdXNp
bmcgZWl0aGVyIC9zeXMvY2xhc3MvYmFja2xpZ2h0IG9yIC9zeXMvY2xhc3MvbGVkcyBidXQgdGhp
cyBuZXcKPiA+PiBmZWF0dXJlIGRvZXMgbm90IHNlZW0gdG8gcXVpdGUgZml0IGludG8gZWl0aGVy
IG9mIHRob3NlIGNsYXNzZXMuCj4gPgo+ID4gRldJVywgaXQgc2VlbXMgdGhhdCB5b3UncmUgbm90
IGFsb25lIGluIHRoaXM7IDUuNCBnb3Qgc29tZSBzdXBwb3J0IGZvcgo+ID4gc3VjaCBzY3JlZW5z
IGlmIEkgdW5kZXJzdGFuZCB0aGluZ3MgY29ycmVjdGx5Ogo+ID4KPiA+ICAgaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2Nv
bW1pdC8/aWQ9MTEwZWExZDgzM2FkCj4gCj4gT2gsIEkgZGlkbid0IHJlYWxpemUgaXQgZ290IG1l
cmdlZCBhbHJlYWR5LCBJIHRob3VnaHQgdGhpcyB3YXMKPiByZWxhdGVkLi4uCj4gCj4gU28gd2Un
dmUgYWxyZWFkeSByZXBsaWNhdGVkIHRoZSBiYWNrbGlnaHQgc3lzZnMgaW50ZXJmYWNlIHByb2Js
ZW0gZm9yCj4gcHJpdmFjeSBzY3JlZW5zLiA6KAoKSSBndWVzcy4uLiBhbHRob3VnaCB0aGUgVGhp
bmtwYWQgY29kZSBoYXNuJ3QgYWRkZWQgYW55IHN0YW5kYXJkCmludGVyZmFjZXMgKG5vIG90aGVy
IGxhcHRvcCBzaG91bGQgYmUgcGxhY2luZyBjb250cm9scyBmb3IgYSBwcml2YWN5CnNjcmVlbiBp
biAvcHJvYy9hY3BpL2libS8uLi4gKS4gTWF5YmUgaXRzIG5vdCB0b28gbGF0ZS4KCgpEYW5pZWwu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
