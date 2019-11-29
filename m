Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614EE10DA97
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 21:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38916E998;
	Fri, 29 Nov 2019 20:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCA26E994
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 20:30:11 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u8so855877wmu.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 12:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xsYT5lMEF+x8inV5EK6Q/hgm20RbjUJUPe9EzYmEaa0=;
 b=O0XqRRXAWk9bzaKgvg2AFpAe9e8bMlbyJ6eJOlMB+sguuIgW55ty7HKq5stKS0TMxU
 h7QTG+NJrE96uLpI9AQv3ZiBGH/aXV+ZOoMj1MjY+5KGIeyFxUZXeTURwDiClUTHG1/i
 y7jT5gutsr9go3H0/cW3M5MPoqXVTjM4t+H46HWhPd31t6jeY/CARbG+lFRVzl4KD3YT
 04ps1Qt7dk3uiSiSsQawAati+N0hRK9kmoaO6MT0X+oXji5U3jBUoQRImqSbdPh+bpXp
 MCANNowcNieyu+PPO4aUK0HTE5EGA9f+WRwGuYR073wl6xLYm0MjMQkd5Q2HMM8TViIO
 DywQ==
X-Gm-Message-State: APjAAAU86EMgjxk8tSLq+DnaTHJI5Tf3lxomtxZ7EpzB1bDDwze73im0
 XlGu1FUeg98yhOei/C7nGiEFJw==
X-Google-Smtp-Source: APXvYqzJOztkRm1kwVy9FHEMusVGRjzr9oBrfa/YqQaHG3axAj84vRsSqbnDq+ajtpY9cXXMq9Ay7g==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr16709271wma.38.1575059410403; 
 Fri, 29 Nov 2019 12:30:10 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id s19sm10360892wmc.4.2019.11.29.12.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 12:30:09 -0800 (PST)
Date: Fri, 29 Nov 2019 21:30:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v2 14/14] auxdisplay: constify fb ops
Message-ID: <20191129203007.GV624164@phenom.ffwll.local>
References: <cover.1575022735.git.jani.nikula@intel.com>
 <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
 <20191129152424.GG624164@phenom.ffwll.local>
 <CANiq72kRGg1AZHC-pR_uKykMxmcMPM2+qbXVPVQhHrZRzu723Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72kRGg1AZHC-pR_uKykMxmcMPM2+qbXVPVQhHrZRzu723Q@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xsYT5lMEF+x8inV5EK6Q/hgm20RbjUJUPe9EzYmEaa0=;
 b=lpBVcQxlQWKQlwPnqQn+b4vO/UTKXtp4LuAdhVs1O7y9n6TPwmgND034kKipTpduKr
 7EPSb7daq9j0RmY33ikvf/DWB6DVm6b9To9GctfErQ2TswXvS9imMT1y3BbUJgC4hMaK
 qCcYEf3t0ATUTHdniddf8RMFrzALNO4VE0ZqE=
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
Cc: linux-fbdev@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 Robin van der Gracht <robin@protonic.nl>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDk6MTY6NDJQTSArMDEwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIEZyaSwgTm92IDI5LCAyMDE5IGF0IDQ6MjQgUE0gRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4gPiBPaCwgYW5vdGhlciBkaXNwbGF5IHN1YnN5c3Rl
bT8gSW50cmlndWluZyAuLi4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KPiAKPiBJdCBpcyBpbnRlbmRlZCBmb3IgZGlzcGxheXMgdGhh
dCBhcmUgbm90IGludGVuZGVkIGFzIHRoZSB1c3VhbC9tYWluCj4gZGlzcGxheSwgZS5nLiB2ZXJ5
IHNtYWxsIExDRHMgOikKCldlbGwgd2UgZG8gaGF2ZSB2ZXJ5IHNtYWxsIGxjZCBkaXNwbGF5IGRy
aXZlcnMgaW4gZHJtLCBhbmQgYmVmb3JlIHRoYXQgaW4KZmJkZXYuIEFuZCB5b3UgaGF2ZSBhIGZi
ZGV2IGZyYW1lYnVmZmVyIGRyaXZlciBpbiB0aGVyZSwgd2hpY2ggbG9va3MgYSBiaXQKbWlzcGxh
Y2VkIC4uLgoKQWZhaXVpIHlvdSBhbHNvIGhhdmUgc29tZSBldmVuIHRpbmllciBsY2QgZHJpdmVy
cyB3aGVyZSB5b3UgZG9uJ3QgYWRkcmVzcwpwaXhlbHMsIGJ1dCBqdXN0IGRpcmVjdGx5IHVwbG9h
ZCB0ZXh0LCBhbmQgdGhvc2Ugb2J2aW91c2x5IGRvbid0IGZpdCBpbnRvCmRybS9mYmRldiB3b3Js
ZC4gQnV0IGFueXRoaW5nIHdoZXJlIHlvdSBjYW4gYWRkcmVzcyBwaXhlbHMgdmVyeSBtdWNoIGRv
ZXMuCi1EYW5pZWwKCj4gCj4gUmV2aWV3ZWQtYnk6IE1pZ3VlbCBPamVkYSA8bWlndWVsLm9qZWRh
LnNhbmRvbmlzQGdtYWlsLmNvbT4KPiAKPiBDaGVlcnMsCj4gTWlndWVsCgotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
