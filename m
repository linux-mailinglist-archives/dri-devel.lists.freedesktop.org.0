Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E80117136
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 17:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5AE6E4D4;
	Mon,  9 Dec 2019 16:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9626E4D4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 16:14:13 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id u17so13225172ilq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 08:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wZgJrJc3WdnWHirSjGo/CbwE6tKfhWbMKLyIRdtvpNk=;
 b=e7HRVcRpjX/a608UfKvz0AbebMDS4MDHb2XeY6Z0e9/usL8yQ3tdr+Gkr3X+gZOR0I
 B57lKS4Th/USAxMkrDXYHHuCmHI3xHN0QWU7pKOmBqIhSBlr8llRCLWwT1FklUhxMFV9
 gI35qXL6L2WXT2FZHwozdWyre4J+1qjUpZQPncScXEfesCt/aYSre4iEVYcaHNgQauWl
 8XCA4YF8V6uhkZ5AcZUgsx7QPM82RPbtipsHmIa2zRVJL/sJnwxMUGfR8AMJBhqAI9+v
 38Z2XDrKAOxogFCsIFFT3IQEw1n/ulcQizo0iwEfBteO1uQ6G1dprQv0H4iLQxlCCB5V
 Cd7Q==
X-Gm-Message-State: APjAAAVQBwWIKT6ITSxhdamgsFFX1VBfwfZe/M5PtB0dzV6y52XNs8eH
 YI5Cg2ZrXZD4oq21mng6KSHDIUnrfYuyXIzJaIWzng==
X-Google-Smtp-Source: APXvYqzzpIfTTMiDfhLJvkSlEzkuGGXFeH+uZu3WhLXUehXys8AjiI12ZcfaSyMYfYXzQ/l8gKQv5idArnbFRy+7mt0=
X-Received: by 2002:a92:8655:: with SMTP id g82mr29227596ild.2.1575908052609; 
 Mon, 09 Dec 2019 08:14:12 -0800 (PST)
MIME-Version: 1.0
References: <20191203173638.94919-1-sean@poorly.run>
 <20191203173638.94919-4-sean@poorly.run>
 <20191205193319.GK1208@intel.com> <20191206135509.GE162979@art_vandelay>
 <20191209151846.GQ1208@intel.com>
In-Reply-To: <20191209151846.GQ1208@intel.com>
From: Sean Paul <sean@poorly.run>
Date: Mon, 9 Dec 2019 11:13:36 -0500
Message-ID: <CAMavQKKpk=LiOSzBvD5gJ_Oh5wv9VQQ_c3K62smK0OBCFgf9cg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/11] drm/i915: Disable HDCP signalling on
 transcoder disable
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wZgJrJc3WdnWHirSjGo/CbwE6tKfhWbMKLyIRdtvpNk=;
 b=bhXccmzsxwXs3zgDIxWnTfjxi3aIph0Y4TTZ/d52fUNpWHCKfiwz+JJmvuKgzaft9G
 ecPc+LlJewWVeX9klsFfnoWQ3t9wlYU+YXWs/qbBpH85HQNW9id+vvycXTf9Lf+iqu/v
 nrrh1WBMZeMltxsuErjcthEzMk9dASClKZ8BPXlvfEtZoLv1eJq30DTTNYLjlh5WyG2A
 QcXhwpGhQPqE4dTbNP4pZMNHYQBUyWHX7Qwb/q8NZvD3VuBSTtwOKkjCdgQFqJy4CY6K
 rKU1acGSvSKVpBRlxzZI9GwTwN6KUyP1gLdFsGjjPj0DJlbIO/F6p8/YV6p8zrjrmrwO
 jJaA==
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 ramalingm.c@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgOSwgMjAxOSBhdCAxMDoxOCBBTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgRGVjIDA2LCAyMDE5IGF0
IDA4OjU1OjA5QU0gLTA1MDAsIFNlYW4gUGF1bCB3cm90ZToKPiA+IE9uIFRodSwgRGVjIDA1LCAy
MDE5IGF0IDA5OjMzOjE5UE0gKzAyMDAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiA+ID4gT24g
VHVlLCBEZWMgMDMsIDIwMTkgYXQgMTI6MzY6MjZQTSAtMDUwMCwgU2VhbiBQYXVsIHdyb3RlOgo+
ID4gPiA+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+ID4gPiA+Cj4g
PiA+ID4gQ3VycmVudGx5IHdlIHJlbHkgb24gaW50ZWxfaGRjcF9kaXNhYmxlKCkgdG8gZGlzYWJs
ZSBIRENQIHNpZ25hbGxpbmcgaW4KPiA+ID4gPiB0aGUgRERJIEZ1bmN0aW9uIENvbnRyb2wgcmVn
aXN0ZXIuIFRoaXMgcGF0Y2ggYWRkcyBhIHNhZmV0eSBuZXQgYnkgYWxzbwo+ID4gPiA+IGNsZWFy
aW5nIHRoZSBiaXQgd2hlbiB3ZSBkaXNhYmxlIHRoZSB0cmFuc2NvZGVyLgo+ID4gPiA+Cj4gPiA+
ID4gT25jZSB3ZSBoYXZlIEhEQ1Agb3ZlciBNU1QgYW5kIGRpc2FwcGVhcmluZyBjb25uZWN0b3Jz
LCB3ZSB3YW50IHRvIG1ha2UKPiA+ID4gPiBzdXJlIHRoYXQgdGhlIHNpZ25hbGxpbmcgaXMgdHJ1
bHkgZGlzYWJsZWQgZXZlbiBpZiBIRENQIHRlYXJkb3duIGRvZXNuJ3QKPiA+ID4gPiBnbyBhcyBw
bGFubmVkLgo+ID4gPgo+ID4gPiBXaHkgd291bGRuJ3QgaXQgZ28gYXMgcGxhbm5lZD8KPiA+ID4K
PiA+Cj4gPiBCZWNhdXNlIHRoaW5ncyBjYW4gZmFpbCBpbiB3ZWlyZCBhbmQgd29uZGVyZnVsIHdh
eXMgb24gdW5wbHVnIDotKQo+Cj4gTm90IHJlYWxseS4KPgoKVGhhdCBpcyBhIGJvbGQgcG9zaXRp
b24gdG8gdGFrZSwgYnVncyBoYXBwZW4sIGhhcmR3YXJlIGZsYWtlcywgZXRjLgoKPiA+Cj4gPiBJ
dCdzIGEgc2FmZXR5IG5ldC4gSSBzYXcgdGhpcyBmdW5jdGlvbiBhbmQgZmlndXJlZCBIRENQIHNp
Z25hbGxpbmcgc2hvdWxkIGJlCj4gPiBleHBsaWNpdGx5IGNsZWFyZWQgaGVyZSBhcyB3ZWxsLgo+
Cj4gSSBjYWxsIGl0IGRlYWQgYW5kIGNvbmZ1c2luZyBjb2RlLgoKLi4uYWRkaW5nIGEgYml0IHRv
IGFuIGV4aXN0aW5nIHJlZ2lzdGVyIGNsZWFyIGlzIGNvbmZ1c2luZz8gVGhhdCBtaWdodApiZSBh
IHRvdWNoIGh5cGVyYm9saWMuCgo+IElmIHdlIGdldCBoZXJlIHdpdGggSERDUCBzdGlsbAo+IGVu
YWJsZWQgd2UgaGF2ZSBhIG1vcmUgc2VyaW91cyBidWcgc29tZXdoZXJlIGVsc2UuCj4KCk9rLCBJ
IHN1cHBvc2UgaXQncyB5b3VyIGNhbGwgYXMgdG8gd2hldGhlciB5b3UgdGFrZSB0aGlzIHBhdGNo
LCBmZWVsCmZyZWUgdG8gZHJvcC4KClNlYW4KCj4gLS0KPiBWaWxsZSBTeXJqw6Rsw6QKPiBJbnRl
bAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
