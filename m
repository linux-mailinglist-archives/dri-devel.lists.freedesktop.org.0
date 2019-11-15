Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7C2FD85F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 10:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F4B6E179;
	Fri, 15 Nov 2019 09:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D226E179
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 09:06:32 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r10so10099307wrx.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 01:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=0D/yrKGEn3A96q8hr6LuXAsWBwmD1Qfdb942fZyqnXM=;
 b=m1H+rF/gt4pN12RACuBU6R2cLVEJzhPMt11wylSIRU5LfSY4UNq/onlJh/5MC2p8s1
 8vkjKbkhA8dB7ejhNWwkncXCdVO/pCqyB57/A3olTcay1TYxzflX2ZFdH99wz92HRLNn
 jx6y8V+dWQl+kYQC8hBqm9OYhZ7i1ZCQMLfJKP5ZNW8g+oOOqXD8iL8H6xw34QPvSwII
 cKYrN+Rwve9aMG0wPCFj7ymM6+QQBPUfaoURmfFfTe9MtANOD5VYtpRYsNgFfxwasB+1
 QS2ISpot1u+MsvJvaPT1QUyP71PJAXfbMkD5vmKHsT2LbMzUuu5+DpNB+Oo52FZ6QuoG
 WJAg==
X-Gm-Message-State: APjAAAWYW0CjT8yMaLVHsEA2rWrjEpkt/5SDn7QGSSqprHbVGueOumor
 0unT+/0u33NIEokbuSzisuU+Cw==
X-Google-Smtp-Source: APXvYqwA2II8ntBiRo8htZfOVzp6rIeWFrXZHRtIYAJLi8+dUddZBJBLgJYQNpdCIgtGbiON2YPINg==
X-Received: by 2002:adf:8147:: with SMTP id 65mr13032952wrm.230.1573808791608; 
 Fri, 15 Nov 2019 01:06:31 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id o1sm10780860wrs.50.2019.11.15.01.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 01:06:31 -0800 (PST)
Date: Fri, 15 Nov 2019 10:06:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: coypu@sdf.org
Subject: Re: drm core/helpers and MIT license
Message-ID: <20191115090629.GA23790@phenom.ffwll.local>
References: <20191114200132.GA11077@SDF.ORG>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114200132.GA11077@SDF.ORG>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0D/yrKGEn3A96q8hr6LuXAsWBwmD1Qfdb942fZyqnXM=;
 b=iTGZAQQsS0AuIXaVsC56/eA314C3G6IoNk7kNpfh07jM6ZbvnOXhTco3jICzdLynX8
 vI5p8x7oj7yCTXX0j8x2ZEqgDR6xqRpwXEd6PIdPp8dTJga6tZuvGIlbtfh0eUt9kESn
 jK2VSExjrTX0vByNoIOC1Wx2KEX4iHCQ1aRbs=
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMDg6MDE6MzJQTSArMDAwMCwgY295cHVAc2RmLm9yZyB3
cm90ZToKPiBIaSBEYW5pZWwsCj4gCj4gSSBkb24ndCB0aGluayB3ZSBjYW4gbWFrZSBhbnkgY29t
cGxhaW50cyBhYm91dCBHUEwgYmVpbmcgbW9yZSB3aWRlbHkKPiB1c2VkIGluIHRoZSBEUk0gY29k
ZS4gSXQncyBuaWNlIHRvIGhhdmUgdGhlIGNvZGUgYXQgYWxsLCB0aGUgTUlUIGxpY2Vuc2UKPiBp
cyBhIGJvbnVzLiBUaGFua3MgZm9yIHdyaXRpbmcgaXQgYW5kIGJlYXJpbmcgd2l0aCB1cy4KPiAK
PiBXb3VsZCByZXdyaXRlcyBkb25lIHB1cmVseSBmb3IgbGljZW5zaW5nIHJlYXNvbnMgYmUgYWNj
ZXB0ZWQgdXBzdHJlYW0/CgpGaWd1cmluZyB0aGF0IG91dCBpcyB3aHkgSSBzdGFydGVkIHRoaXMg
dGhyZWFkLiBUaHVzIGZhciB0aGUgY29uc2Vuc3VzCnNlZW1zIHRvIGJlIGEgZGVhZmVuaW5nICpz
aHJ1ZyosIHNvIG5vIGlkZWEuCgpQZXJzb25hbGx5IEknbSBoYXBweSB0byB0YWtlIGFueSBwYXRj
aGVzIHdpdGggYSBjbGVhciBuZXQgYmVuZWZpdCBpbiB0ZXJtcwpvZiBjb250cmlidXRpb25zL2h3
IHN1cHBvcnQvbWFpbnRlbmFiaWxpdHkgZm9yIGxpbnV4IGdwdSBzdXBwb3J0LgpFdmVyeXRoaW5n
IGVsc2UgcHJvYmFibHkgbmVlZHMgYSBtdWNoIHdpZGVyIHN1cHBvcnQgaW4gdGhlIGNvbW11bml0
eS4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
