Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B9BB593B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 03:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D716EDB0;
	Wed, 18 Sep 2019 01:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2A06EDAC;
 Wed, 18 Sep 2019 01:22:21 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c4so5107418edl.0;
 Tue, 17 Sep 2019 18:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jmVlm1jUulhRNDWUAIDhxEV+UjKaBeH5ZgS3p3eH2ow=;
 b=ooBvbqIuoSXaHF7jD5Max1kwQxiE3U5dfraQuIpQ+VJbHXAOCTKj+BFcvX2hrkYGGr
 BP+MyuAwcCMuAT1sLoLKKGW11hXVyNViGZuinO7mtI7J2gSfmd/aebHskXXWYfcZnKso
 IXhSZwwkXXg53Zd2YJ/Gi2G4PG2PozxrwVC2kpA1pYw54FYpbs03TAGdQMIvZFZlt2ho
 +SXPOrwZ6+OkJXazfDODGZQqxiVbcUXA13A957x/i3JXJfMF9GqMwEn6vzuH5gyPECHD
 faJZwD4fqfefY1y5cqCmDdv/wTuHIHg4iPKNVhsofEl1Cfg7+vZlkHbkfX5moDD1v/AQ
 7U8Q==
X-Gm-Message-State: APjAAAVz287LukC1qhXdYVrVapG+q52tnbl1Uy9CMhmXA5CjHW4h+m36
 TKCaxKnz7fg9b56XrtUpoOoPktTez+u7cOYbPk4=
X-Google-Smtp-Source: APXvYqwhWXpzktRd+5vRWfk9UpsttS+IpYu81FG1a3dXaB1RHhj8YAh4LwU6mfV0UMe9SGhJOT6fCHKgk1AqdPdkgZ4=
X-Received: by 2002:a17:906:c79a:: with SMTP id
 cw26mr7214469ejb.265.1568769739678; 
 Tue, 17 Sep 2019 18:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190916201154.212465-1-ddavenport@chromium.org>
 <CAF6AEGurXuCMj=bc5=9CwBqzNM_BKEaJupk+-V7=aYou=wgmDQ@mail.gmail.com>
 <20190917171420.GB25762@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20190917171420.GB25762@jcrouse1-lnx.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 17 Sep 2019 18:22:06 -0700
Message-ID: <CAF6AEGt_isMOiC6NL_xorUSnAEK5YnrzGanQrPV0YP=E5hV0VQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Remove unused function arguments
To: Jordan Crouse <jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jmVlm1jUulhRNDWUAIDhxEV+UjKaBeH5ZgS3p3eH2ow=;
 b=O67gS0zNNb8AG6ODEGN1OqAHrHAVixyyp79QI70EvE0Mpcom7nT8hlTFb3xh8Waekp
 Kamy8iwHkC+j8VfD47sRSZ8jeTbKa7J9hZ4+2hZXtJzr06YsrHb48h5IIidbdP9ndnzE
 ARzB1fGVVCCsSWutrt8/Csnqwe0ONOvnp+x8g9sxUIzqpnWiCj3U5e1csb+kPMSzV9o2
 hudZldSg0qndlVl9qfldI4mOcdWOm1orjNzZwsV4wu6YUxUkPn8WSozxskq+NDgxNqRG
 aaFB+QAanF7yaWNGbmsLVDMUJSaSk1NiY25ElsbPsSzGeJxCYMjClfAmgjj2JOYxwLUT
 mCKg==
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
Cc: Enrico Weigelt <info@metux.net>, Jonathan Marek <jonathan@marek.ca>,
 Sam Ravnborg <sam@ravnborg.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Bruce Wang <bzwang@chromium.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Drew Davenport <ddavenport@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMTA6MTQgQU0gSm9yZGFuIENyb3VzZSA8amNyb3VzZUBj
b2RlYXVyb3JhLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAxNiwgMjAxOSBhdCAwMTozNDo1
NVBNIC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiBPbiBNb24sIFNlcCAxNiwgMjAxOSBhdCAx
OjEyIFBNIERyZXcgRGF2ZW5wb3J0IDxkZGF2ZW5wb3J0QGNocm9taXVtLm9yZz4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IFRoZSBhcmd1bWVudHMgcmVsYXRlZCB0byBJT01NVSBwb3J0IG5hbWUgaGF2ZSBi
ZWVuIHVudXNlZCBzaW5jZQo+ID4gPiBjb21taXQgOTQ0ZmMzNmMzMWVkICgiZHJtL21zbTogdXNl
IHVwc3RyZWFtIGlvbW11IikgYW5kIGNhbiBiZSByZW1vdmVkLgo+ID4gPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBEcmV3IERhdmVucG9ydCA8ZGRhdmVucG9ydEBjaHJvbWl1bS5vcmc+Cj4gPiA+IC0t
LQo+ID4gPiBSb2IsIGluIHRoZSBvcmlnaW5hbCBjb21taXQgdGhlIHBvcnQgbmFtZSBzdHVmZiB3
YXMgbGVmdCBpbnRlbnRpb25hbGx5Lgo+ID4gPiBXb3VsZCBpdCBiZSBhbHJpZ2h0IHRvIHJlbW92
ZSBpdCBub3c/Cj4gPgo+ID4gVXBzdHJlYW0gc3VwcG9ydCBmb3Igc25hcGRyYWdvbiBoYXMgaW1w
cm92ZWQgY29uc2lkZXJhYmx5IHNpbmNlIHRoZW4sCj4gPiBpdCdzIGJlZW4gYXQgbGVhc3QgYSBj
b3VwbGUgeWVhcnMgc2luY2UgSSd2ZSBoYWQgdG8gYmFja3BvcnQgZHJtIHRvIGEKPiA+IGRvd25z
dHJlYW0gYW5kcm9pZCB2ZW5kb3Iga2VybmVsLiAgKEFuZCBJIHRoaW5rIHRoZSBkb3duc3RyZWFt
IHZlbmRvcgo+ID4ga2VybmVsIGlzIGdldHRpbmcgY2xvc2VyIHRvIHVwc3RyZWFtLikgIFNvIEkg
dGhpbmsgd2UgY2FuIGRyb3AgdGhpbmdzCj4gPiB0aGF0IHdlcmUgb3JpZ2luYWxseSBsZWZ0IGlu
IHBsYWNlIHRvIHNpbXBsaWZ5IGJhY2twb3J0aW5nIHRvIHZlbmRvcgo+ID4ga2VybmVsLgo+Cj4g
RG93bnN0cmVhbSBoYXMgZ290dGVuIGNsb3NlIGVub3VnaCB0byB0aGUgSU9NTVUgQVBJIG92ZXIg
dGhlIGxhc3QgZmV3IExUUwo+IGN5Y2xlcyBhbmQgbmVhcmx5IGV2ZXJ5dGhpbmcgb3V0c2lkZSBv
ZiBhMnh4IHRoYXQgY2FuIHdvcmsgb24gYSBtb2Rlcm4KPiBrZXJuZWwgd2lsbCBsaWtlbHkgYmUg
dXNpbmcgYSBhcm0tc21tdS12MiBvciBhIE1NVS01MDAuICBUaGlzIGNvZGUgY2FuIGhhcHBpbHkK
PiBnby4KPgo+ID4gKEFsc28sIHNvbWUgb2YgdGhlIHJlZ3VsYXRvciB1c2FnZSBmYWxscyBpbnRv
IHRoaXMgY2F0ZWdvcnkuLiBhdCBvbmUKPiA+IHBvaW50IHRoZSBkb3duc3RyZWFtIGtlcm5lbCBt
b2RlbGVkIGdkc2MncyBhcyByZWd1bGF0b3JzLCBidXQgdXBzdHJlYW0KPiA+IHVzZXMgZ2VucGQu
KQo+Cj4gRG93bnN0cmVhbSBzdGlsbCB1c2VzIHJlZ3VsYXRvcnMuIElmIHdlIGV2ZXIgbmVlZGVk
IHRvIHVzZSBhIGRvd25zdHJlYW0ga2VybmVsCj4gZm9yIHdoYXRldmVyIHJlYXNvbiB3ZSBjb3Vs
ZCBlYXNpbHkgaGFjayB0aGVtIGJhY2sgaW4gYnV0IEkgZG9uJ3QgZmVlbCBsaWtlIHRoaXMKPiBp
cyBhIGxpa2VseSBzY2VuYXJpby4KCm9rLCBtYXliZSB3ZSBjYW4ga2VlcCB0aGUgcmVndWxhdG9y
IGNydWZ0IGZvciBhIGJpdCBsb25nZXIgdW50aWwKZG93bnN0cmVhbSBtb3ZlcyB0byBnZW5wZC4u
IHdpdGggZHVtbXktcmVndWxhdG9yLCBpdCBkb2Vzbid0IHJlYWxseQpodXJ0IGFueXRoaW5nLgoK
RG8gbGV0IG1lIGtub3cgaWYgZnV0dXJlIGRvd25zdHJlYW0gcmViYXNlIG1vdmVzIHRvIGdlbnBk
LCBJIHN1cHBvc2UKYWZ0ZXIgdGhlIG5leHQgTFRTIGFmdGVyIHRoYXQgd291bGQgYmUgYSBnb29k
IHRpbWUgdG8gZ2FyYmFnZS1jb2xsZWN0CnRoZSByZWd1bGF0b3IgcmVsYXRlZCBnZHNjIG1hbmFn
ZW1lbnQKCkJSLAotUgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
