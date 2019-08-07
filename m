Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABC684BA5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 14:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D1F6E6C4;
	Wed,  7 Aug 2019 12:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC576E6C6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 12:30:37 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id q20so103377221otl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 05:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fgwpTf17DXH60DUDihl4HgV2JZ9Yq6n5uLUQNdMiwHw=;
 b=WWNAw2iyBMxt7XWbtaLuUN2ZUBJK6Clo/Tzad3INp7zbfi9hp++HrjtZHQNFLiGfZW
 Y2oCdpLRaZwxoHcqwLd03nDHiRYWvYDEMR26bMtFvF7Ku0YPkdJFUHfZoQyntG3dCMcQ
 eaZGOBZNBurwVibj6c3ogBTA1ugw1fXWGTiW1QyJSsX+VZXFjVjWbTgEBSYY4T/jVHUe
 USnVIDvYSYwMxY+ikaJk1iaMBD3fePVZn6zmomv9UK1qzxmV7K5BVk+SjtnJ7C5uloFf
 +xhAE/DqC/caKbC6XUsMWveLj4IYKatBuzuK6r602c/6kXEKvAb+SDrOs50iAk1SSN5+
 gacg==
X-Gm-Message-State: APjAAAUAXDGXDaoODPS7NCKIoeRB1DW7y21jXOiewGESLXERp6i++8/C
 kbhJFDf/UN+g9a9y452hiPckcjr4dLe24JmOqYEp5Q==
X-Google-Smtp-Source: APXvYqwKd2LPybiL79kgkyUoTwvujCNUPz4obg4nz6Cerun2jMdZ7LqgL7fDSkSSumGRyiWMpW91uC7c6V0NjQryMUE=
X-Received: by 2002:a05:6830:ce:: with SMTP id
 x14mr8352844oto.188.1565181036735; 
 Wed, 07 Aug 2019 05:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190803104719.gwb6hmreeaqyye6n@flea>
 <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
 <20190806160146.sj7l5wrrjtt5nhbz@flea>
 <20190806161132.GC7444@phenom.ffwll.local>
 <20190807120246.tl4hhztr3qna3qf6@flea>
In-Reply-To: <20190807120246.tl4hhztr3qna3qf6@flea>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 7 Aug 2019 14:30:25 +0200
Message-ID: <CAKMK7uF6+qEoJ9StaB=r2P=VGMV8O+DoNhQZvtV0NKKgJxbi2A@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fgwpTf17DXH60DUDihl4HgV2JZ9Yq6n5uLUQNdMiwHw=;
 b=BfIjIlwNprRAmAWBdCFEiT3WbkrYT330xmWOAC9uPUGT1kQPjQ0ImvZU4V/Jj0TrPV
 V0Sd6Xn7M8XK632PdzdKmx8xx5fFi02hI3ioTMvrxlV2GJ6Zpl0YbTW7oovBzFBIdHhk
 sf1yb+8Fzr2KmO+CKHXbRkYmeqf2xi/rFBp0k=
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgNywgMjAxOSBhdCAyOjAyIFBNIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDA2LCAyMDE5IGF0IDA2OjExOjMy
UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBUdWUsIEF1ZyAwNiwgMjAxOSBh
dCAwNjowMTo0NlBNICswMjAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+ID4gPiBPbiBUdWUsIEF1
ZyAwNiwgMjAxOSBhdCAxMDozMzo1M0FNICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToKPiA+ID4g
PiBPbiBTYXQsIDMgQXVnIDIwMTkgYXQgMjA6NDcsIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhpIERhbmllbCwgRGF2
ZSwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBIZXJlIGlzIHRoZSBmaXJzdCAoYW5kIHByZXR0eSBsYXRl
KSBkcm0tbWlzYy1uZXh0IFBSLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEl0J3MgcHJldHR5IGJpZyBk
dWUgdG8gdGhlIGxhdGVuZXNzLCBidXQgdGhlcmUncyBub3RoaW5nIHJlYWxseSBtYWpvcgo+ID4g
PiA+ID4gc2hvd2luZyB1cC4gSXQncyBwcmV0dHkgbXVjaCB0aGUgdXN1YWwgYnVuY2ggb2YgcmV3
b3JrcywgZml4ZXMsIGFuZAo+ID4gPiA+ID4gbmV3IGhlbHBlcnMgYmVpbmcgaW50cm9kdWNlZC4K
PiA+ID4gPgo+ID4gPiA+IGRpbTogNDE1ZDJlOWUwNzU3ICgiUmV2ZXJ0ICJkcm0vZ2VtOiBSZW5h
bWUgZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQoKQo+ID4gPiA+IHRvIGRybV9nZW1fbWFwX29mZnNl
dCgpIiIpOiBtYW5kYXRvcnkgcmV2aWV3IG1pc3NpbmcuCj4gPiA+ID4gZGltOiBiZTg1NTM4MmJh
Y2IgKCJSZXZlcnQgImRybS9wYW5mcm9zdDogVXNlIGRybV9nZW1fbWFwX29mZnNldCgpIiIpOgo+
ID4gPiA+IG1hbmRhdG9yeSByZXZpZXcgbWlzc2luZy4KPiA+ID4gPiBkaW06IGU0ZWVlOTNkMjU3
NyAoImRybS92Z2VtOiBkcm9wIERSTV9BVVRIIHVzYWdlIGZyb20gdGhlIGRyaXZlciIpOgo+ID4g
PiA+IG1hbmRhdG9yeSByZXZpZXcgbWlzc2luZy4KPiA+ID4gPiBkaW06IDg4MjA5ZDJjNTAzNSAo
ImRybS9tc206IGRyb3AgRFJNX0FVVEggdXNhZ2UgZnJvbSB0aGUgZHJpdmVyIik6Cj4gPiA+ID4g
bWFuZGF0b3J5IHJldmlldyBtaXNzaW5nLgo+ID4gPiA+IGRpbTogY2NkYWU0MjU3NTY5ICgiZHJt
L25vdXZlYXU6IHJlbW92ZSBvcGVuLWNvZGVkIGRybV9pbnZhbGlkX29wKCkiKToKPiA+ID4gPiBt
YW5kYXRvcnkgcmV2aWV3IG1pc3NpbmcuCj4gPiA+ID4KPiA+ID4gPiBQcmV0dHkgc3VyZSByZXZp
ZXcgaW4gZHJtLW1pc2MtbmV4dCBpcyBhIHJ1bGUuIEkgZG9uJ3QgZXZlbiBzZWUgYWNrcwo+ID4g
PiA+IG9uIG1vc3Qgb2YgdGhlc2UuCj4gPiA+Cj4gPiA+IFVnaCwgc29ycnkgZm9yIHRoYXQuIEkg
Z3Vlc3MgSSdtIHN0aWxsIHByZXR0eSBuZXcgdG8gdGhlCj4gPiA+IG1haW50YWluZXItc2lkZSBv
ZiBkaW0sIHdoaWNoIGNvbW1hbmRzIGRpZCB5b3UgdXNlIHRvIGNoZWNrIHRoYXQ/Cj4gPgo+ID4g
ZGltIGFwcGx5LXB1bGwgZG9lcyB0aGlzLiBJZiBhbGwgY29tbWl0dGVycyB1c2UgdGhlIHRvb2xp
bmcgYXMgdGhleSBzaG91bGQKPiA+IHRoZXkgc2hvdWxkbid0IGJlIGFibGUgdG8gcHVzaCBwYXRj
aGVzIHdoaWNoIHZpb2xhdGUgYW55dGhpbmcgaGVyZSwgdGhhdCdzCj4gPiB3aHkgZGltIHJlcXVl
c3QtcHVsbCBkb2Vzbid0IHJlamVjdC4KPgo+IFllYWgsIHN1cmUsIEkgbWVhbnQgdG8gYXNrIGlm
IHRoZXJlIHdhcyBhbnl3YXkgdG8gY2hlY2sgdGhpcyBiZWZvcmUKPiBzZW5kaW5nIHRoZSBQUiBv
biBvdXIgZW5kLgoKSSB0aGluayB3ZSdkIG5lZWQgdG8gY3JlYXRlIG5ldyBjb21tYW5kLiBPciBt
YXliZSB3ZSBzaG91bGQgaW50ZWdyYXRlCml0IGFzIHBhcnQgb2YgdGhlIHB1bGwgcmVxdWVzdCBn
ZW5lcmF0aW9uLCBhcyBhbiBpbmZvcm1hdGlvbi93YXJuaW5nCnRoYXQgdGhlcmUgbWlnaHQgYmUg
cHJvYmxlbXMgeW91IG5lZWQgdG8gZXhwbGFpbi4gV2FudCB0byB3cml0ZSBhIGRpbQpwYXRjaD8K
LURhbmllbAoKPgo+ID4gV2UncmUgbm93IHdvcmtpbmcgb24gcGF0cWNoZXMgdG8gbWFrZSBzdXJl
IHlvdSByZWFsbHkgaGF2ZSB0byB1c2UKPiA+IGRpbSBmb3IgbWFuYWdpbmcgZHJtLW1pc2MgYW5k
IGFwcGx5aW5nIHBhdGNoZXMuCj4KPiBHcmVhdCwgdGhhbmtzCj4KPiBNYXhpbWUKPgo+IC0tCj4g
TWF4aW1lIFJpcGFyZCwgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
