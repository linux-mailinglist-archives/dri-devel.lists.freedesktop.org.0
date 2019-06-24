Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8C1508D5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 12:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A333D898E8;
	Mon, 24 Jun 2019 10:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C458898E8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 10:24:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id f15so3393860wrp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 03:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aK8XkDlL7MMc2zv2AaSwKO+X0HQ+yOPhxOZQGinvgYc=;
 b=RCjOVRDgzkgqK8T/9Y2z+c4IiOw8dmO3f4qOUgjzpjbsPwCi9/30c4oDqa1ywyC/Ay
 nOS/O7ipxYs96VIwFXepPIO2k5xiD6sY2+/GYNAJglXKoUiMuvh7vln54hxicLSXnGP8
 01sq3rTDeEJoDB40KqT1w/LiWEWIFlFco/DgwQ8VyCKg2mAOaJAsILezWP1lwrkTMNhp
 pyGwM14AiKGiuVUgotrlvx/sV9stYjsgzbKFUJNZHYj1dfcqF/cUWLUagh55hKTheOSk
 gAp5lFQ8XUyPylr/FfAIwUprmO/HLDyLDr/td5eO0uy9LnlRl709llW7rDEvuBUBItiG
 us9A==
X-Gm-Message-State: APjAAAXYSvmR0GXiv7p0Ml6VbZIeB8Br89if7P0fCaZKqPLbh7nH/c1z
 0BMrWIMAsup1HRwE5pX99seTrQ==
X-Google-Smtp-Source: APXvYqzTMeWorFbZD/xA4jLN9mvDivMcGHns6J6XG042zkNh+ouInszrIm7hm6X0cgedvvVH0PpqfQ==
X-Received: by 2002:a5d:66ce:: with SMTP id k14mr43881869wrw.308.1561371847706; 
 Mon, 24 Jun 2019 03:24:07 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id y19sm14127474wmc.21.2019.06.24.03.24.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 03:24:07 -0700 (PDT)
Date: Mon, 24 Jun 2019 11:24:05 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
Message-ID: <20190624102405.gg2lnlw6wmfvjrxu@holly.lan>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd>
 <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
 <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
 <20190621221325.GA2343@amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621221325.GA2343@amd>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aK8XkDlL7MMc2zv2AaSwKO+X0HQ+yOPhxOZQGinvgYc=;
 b=kUFxXEBJvfFjSUQEw/fxMb9WsI7+QgHIBeKYcO5L8+mOlcw4o2dLdtCb9Y+AWPOzQh
 790jPCWgwJ5vmGvpzZgLLc7rvYs1rs7j0EPKSjkrCJd/TCNJo6j31ft3gKPOWXXHRxaj
 t2Q59z59gdmcmVADPrvxZYFmploRfJnDS0Aqax4g4DMhJOJ8mZHfVtdM2nKhE0zofhk7
 XWw5VLGiNc4NPty6MR1ESKbyOTRVBzL40tdcRC6835BtNFiDTX4YvNscBxoOhaXIXrC2
 6h9iarYszg0tOxs9xifkeHlV3EWnZslKC1RBZSu2GH3rBmUDsF8JZEdGIx7R14CRmFjD
 meVg==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Brian Dodge <bdodge09@gmail.com>, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, Peter Bacon <pbacon@psemi.com>,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMjIsIDIwMTkgYXQgMTI6MTM6MjVBTSArMDIwMCwgUGF2ZWwgTWFjaGVrIHdy
b3RlOgo+IEhpIQo+IAo+ID4gW1NvcnJ5IHRvIHRob3NlIHJlY2VpdmluZyB0aGlzIHR3aWNlLi4u
IGhhZCB0byBkaWcgdGhpcyBvdXQgZnJvbSB0aGUKPiA+IGFyY2hpdmVzIGFuZCBzZW50IGl0IHRv
IHRoZSBsaXN0cyBmcm9tIHRoZSB3cm9uZyBtYWlsZXJdCj4gPiAKPiA+IE9uIDI3LzExLzIwMTgg
MDA6NDQsIEJyaWFuIERvZGdlIHdyb3RlOgo+ID4gPlRoYW5rIHlvdSBQYXZlbCwgdGhhdCBpcyBh
IGdvb2QgcG9pbnQuCj4gPiA+Cj4gPiA+VGhlIGNoaXAgdmVuZG9yIGhhcyBpbmRpY2F0ZWQgdGhh
dCB0aGVyZSBpcyBubyByZWFzb24gdG8gbWFpbnRhaW4gdGhlCj4gPiA+b2xkL2ltcHJvcGVyIHBy
ZWZpeCBhbmQgd2lzaGVzIHRvIGdvIGZvcndhcmQgKG9ubHkpIHdpdGggdGhlICJhcmN0aWMiCj4g
PiA+cHJlZml4IGFuZCBhbnkgZXhpc3RpbmcgZHRzIGZpbGVzIGFyZSBvciB3aWxsIGJlIHVwZGF0
ZWQuCj4gPiAKPiA+IExvb2tzIGxpa2UgdGhpcyBwYXRjaCBzZXJpZXMgaGFzIGZhbGxlbiBpbnRv
IHRoZSBjcmFja3MgYSBsaXR0bGUuCj4gPiAKPiA+IEkgdGhpbmsgSSBhc3N1bWVkIHRoaXMgaW5m
byB3b3VsZCBlbmQgaW4gdGhlIGRlc2NyaXB0aW9uIG9mIHBhdGNoIHYyIDEvMyAoaW4KPiA+IG9y
ZGVyIHRvIGFuc3dlciBSb2IncyBmZWVkYmFjaykgYW5kIEkgc2F0IGFuZCB3YWl0ZWQgZm9yIGEg
cmVzcGluLiBPbiB0aGUKPiA+IG90aGVyIGhhbmQuLi4gSSBkaWRuJ3QgYWN0dWFsbHkgc2F5IHRo
YXQgZXhwbGljaXRseSBhbnl3aGVyZSEgU28uLi4gSSdkCj4gPiByZWNvbW1lbmQgYSByZXNwaW4g
cGVyaGFwcyB3aXRoIGEgc21hbGwgYml0IG9mIHRleHQgZXhwbGFpbmluZyBob3cgdGhlCj4gPiB2
ZW5kb3IgY2FuIHN0YXRlIHRoYXQgYW55IGV4aXN0aW5nIGR0cyBmaWxlcyB3aWxsIGJlIHVwZGF0
ZWQuIFRoaXMgaXMgYQo+ID4gcGVyaXBoZXJhbCBkZXZpY2Ugc28gdGhlc2Ugc3RyaW5ncyBhcmUg
cHJvYmFibHkgZW1iZWRkZWQgaW50byBPRU0KPiA+IGRldmljZXRyZWVzIHJhdGhlciB0aGFuIGV4
Y2x1c2l2ZWx5IHVuZGVyIHRoZSBjb250cm9sIG9mIHRoZSB2ZW5kb3IuCj4gCj4gU28gaW4gbmV4
dCBlbWFpbCB5b3UgZ2l2ZSBnb29kIHJlYXNvbiBub3QgdG8gYXBwbHkgdGhpcyA6LSkuCgpBZnJh
aWQgc28uLi4gaXQgd2FzIG9uIHBhZ2UgMiBvZiBteSBnb29nbGUgc2VhcmNoIHNvIEkgZGlkIGEg
cXVpY2sKc2VhcmNoLCBzZW50IHRoZSBmaXJzdCBtYWlsIGFuZCB0aGVuIHdlbnQgYmFjayB0byBt
eSB3ZWIgYnJvd3Nlci4KCkl0IHdhcyBhdCB0aGF0IG1vbWVudCB0aGF0IEkgZGVjaWRlZCBhIHF1
aWNrIHNlYXJjaCB3YXNuJ3QgZW5vdWdoIGFuZApkZWNpZGVkIHRvIGdvdCBhIGxpdHRsZSBkZWVw
ZXIhCgoKRGFuaWVsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
