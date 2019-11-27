Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 328C610B5D5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 19:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99C26E591;
	Wed, 27 Nov 2019 18:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B486E591
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 18:37:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n1so27907799wra.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:37:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nXnlHex+y37zGW1dAQIQZuUnVG8uziRbH6ilwcRwAM0=;
 b=l0mUnV+ZjVMvHhS/PM7quT1fP3/a4EzEFqroJO78PE7WX8KOGa+nWraK5m1uveWFNI
 OdiaIgZt/7EV1KPtwTPmXLjN5ZkBlhYIFua3GfodkNCEd8Uc9zUyfQ4cVasDlcXbssP4
 jRXcu0IfCanBje9E4dGAQrT2Js4ySQ5eRVcrjAON40ZXz/WnqWvrW6xStW1iw59Rr2Mq
 vZKQQUDB5OFnjFQg3Pf+H3iiLcdobS09q32IBFgiu8gT468mdaLNf1seetn6mR1IRJHV
 DgZtrcrRiFQaeAMf7gl+iKISEfjiPGuob63O9MWQM1ictCdn76nVTjOdSryspG7Npww0
 C3og==
X-Gm-Message-State: APjAAAVOVbn6c235q8n+GvdIpRlMVPURnfz6SBvS5AvMM0UdjBViMBCh
 twKnEavE23K3VtXY4H4g7Kjfeg==
X-Google-Smtp-Source: APXvYqzymOSBNL6l1a613nukwLKfZUcJyuj2PCOFalY+ooMhF+R+AqSwEvzy2RTFecMOmtp1Cb30qg==
X-Received: by 2002:adf:e389:: with SMTP id e9mr11874187wrm.285.1574879824661; 
 Wed, 27 Nov 2019 10:37:04 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id r63sm7890188wma.2.2019.11.27.10.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 10:37:02 -0800 (PST)
Date: Wed, 27 Nov 2019 19:37:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 5/5] drm: drop DRM_AUTH from PRIME_TO/FROM_HANDLE ioctls
Message-ID: <20191127183700.GN406127@phenom.ffwll.local>
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
 <20191101130313.8862-5-emil.l.velikov@gmail.com>
 <20191127084104.1ceb1f62@collabora.com>
 <CACvgo52UB-sAv55_kREgHbRsg6b5KXv7At0TbgUPdc0e1E+QaA@mail.gmail.com>
 <20191127180456.GD406127@phenom.ffwll.local>
 <CACvgo50j0sU18-AqeerkgDq9joJysT_0PuQrgVS1tVhUqV9rcg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50j0sU18-AqeerkgDq9joJysT_0PuQrgVS1tVhUqV9rcg@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nXnlHex+y37zGW1dAQIQZuUnVG8uziRbH6ilwcRwAM0=;
 b=akVveJe6oZAk94/6prXgzKLp8yGY5770vPlkS7wqL3XX6Z/zJEzUWErnrv2yI0tnMi
 kJ8GV8UEE7vDywGC3AcQzW/pjeBDRsWo3VvBGfsNR1ZmY/qHp7D/IyLzF9IPBSWN2fkk
 12uZSnZUOl9GVHMfeHU5uhU1Dw2jrzV0q8g1M=
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDY6MzI6NTZQTSArMDAwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IE9uIFdlZCwgMjcgTm92IDIwMTkgYXQgMTg6MDQsIERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDQ6Mjc6
MjlQTSArMDAwMCwgRW1pbCBWZWxpa292IHdyb3RlOgo+ID4gPiBPbiBXZWQsIDI3IE5vdiAyMDE5
IGF0IDA3OjQxLCBCb3JpcyBCcmV6aWxsb24KPiA+ID4gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJv
cmEuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhpIEVtaWwsCj4gPiA+ID4KPiA+ID4gPiBP
biBGcmksICAxIE5vdiAyMDE5IDEzOjAzOjEzICswMDAwCj4gPiA+ID4gRW1pbCBWZWxpa292IDxl
bWlsLmwudmVsaWtvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiBGcm9tOiBF
bWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4gPiA+ID4KPiA+ID4g
PiA+IEFzIG1lbnRpb25lZCBieSBDaHJpc3RpYW4sIGZvciBkcml2ZXJzIHdoaWNoIHN1cHBvcnQg
b25seSBwcmltYXJ5IG5vZGVzCj4gPiA+ID4gPiB0aGlzIGNoYW5nZXMgdGhlIHJldHVybmVkIGVy
cm9yIGZyb20gLUVBQ0NFUyBpbnRvIC1FT1BOT1RTVVBQLy1FTk9TWVMuCj4gPiA+ID4KPiA+ID4g
PiBBcmUgeW91IHN1cmUgdGhpcyBpcyB0cnVlIGZvciBNT0RFU0VULW9ubHkgbm9kZXMgKHRob3Nl
IHRoYXQgZG8gbm90Cj4gPiA+ID4gaGF2ZSB0aGUgUkVOREVSIGNhcCBzZXQpIGltcGxlbWVudGlu
ZyAtPntmZF90b19oYW5kbGUsaGFuZGxlX3RvX2ZkfSgpPwo+ID4gPiA+IFNob3VsZG4ndCB0aGUg
aXNfYXV0aGVudGljYXRlZCgpIGNoZWNrIHN0aWxsIGJlIGRvbmUgaW4gdGhhdCBjYXNlPwo+ID4g
PiA+Cj4gPiA+IFRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcy4gSnVzdCBzZW50IG91dCB2Miwgd2hp
Y2ggSSBzaG91bGQgYWRkcmVzcyB0aGUgY29uY2Vybi4KPiA+Cj4gPiBXaHkgZG8gd2UgbmVlZCB0
aGlzIGFkZGl0aW9uYWwgY2hlY2sgaW4gdjI/IFdoYXQgY2FuIGdvIHdyb25nIG9uIG1vZGVzZXQK
PiA+IGRyaXZlcnMgaWYgbm9uLWF1dGhlbnRpY2F0ZWQgbGVnYWN5IHRoaW5ncyBjYW4gdXNlIHRo
aXM/IG1vZGVzZXQtb25seQo+ID4gZHJpdmVycyBoYXZlIGFsbCB0aGVpciByZXNvdXJjZXMgc2Vn
cmVnYXRlZCBieSB0aGUgZHJtIGNvcmUgKGRybV9mYiwKPiA+IG1tYXBzLCBidWZmZXIgbGlzdHMp
LCBzbyB0aGVyZSdzIHJlYWxseSBubyBhY2Nlc3MgbGltaXRhdGlvbnMgdGhhdCBjYW4gZ28KPiA+
IHdyb25nIGhlcmUuCj4gCj4gV2VsY29tZSBiYWNrIERhbmllbC4KPiAKPiBJIGhhdmVuJ3QgYXVk
aXRlZCB0aGUgY29yZSBkcm0gY29kZSwgc28gd2Fzbid0IHN1cmUgaWYgdGhlcmUncyBhbnkKPiBp
c3N1ZXMgdGhhdCBtYXkgYXJpc2UuCj4gSGVuY2UgdGhlIGNvbnNlcnZhdGl2ZSBhcHByb2FjaCBp
biB2Mi4KPiAKPiBJZiB5b3UgdGhpbmsgdGhpcyBpcyBmaW5lIGFzLWlzIGEgZm9ybWFsIFJldmll
d2VkLWJ5IHdvdWxkIGJlIGhpZ2hseQo+IGFwcHJlY2lhdGVkLgoKSSB0aGluayB0aGVyZSdzIGEg
bm9uLXplcm8gY2hhbmNlIEknbGwgaGF2ZSB0byBlYXQgYSBmZXcgaGF0cyBvbiB0aGlzLCBidXQK
SSB0aGluayB2MSBpcyBzb2xpZC4KClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgoKPiAKPiBUaGFua3MKPiBFbWlsCgotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
