Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA63210B50F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 19:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD706E563;
	Wed, 27 Nov 2019 18:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51496E563
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 18:05:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l1so8074940wme.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9oVHy1y6RMaXWx6nU2J1vEuaN6G88wEXawp2NVxMucI=;
 b=XoIyb4zVibH5iaQANdmw3HNqn04klnJ9V4Hg3D+yoYe+47CZd55fBD7QPWEiZZRN7R
 +/HMFUkLRAV67zRgFsEd2Bht/Gk0zqeL4VAUD988UVHFq3mwSfQxpqEu2PWLh05i/h1j
 l7RvlmS+ZsWWziTdRbQPxPcyGnWXBfBt7t5qYIf9KHIAs3a365KPeaEgx+En2tiFJ9eI
 kW+8vF04r3i90KNpqJWl6dZNOUcRrsJMIyfgKjeGQ22nrvBsO8TylxYrVyP7xOrW9IjF
 o6AzUX13AUEm2c13GFSqpFPlPniAUIvNwclFiNhLxO4+hn0PwcAc2s7OVmGHEkeOwi1x
 fB8w==
X-Gm-Message-State: APjAAAVU7KB/suPuCDKJtLK0GybJVQHcg+gcHAEGbEGrZoU1GkxyU8IN
 hdGfC3GsTqJizWnRMwRtobINpYFkGJU=
X-Google-Smtp-Source: APXvYqwQk1tQ3L18EL1jtC6TFapG+FIqwV5i5Br/M2nn3V+am3ZpP9qRw1hUII3+e6ChLWhHvPHXxA==
X-Received: by 2002:a1c:6144:: with SMTP id v65mr5773584wmb.53.1574877899321; 
 Wed, 27 Nov 2019 10:04:59 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id i71sm22076577wri.68.2019.11.27.10.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 10:04:58 -0800 (PST)
Date: Wed, 27 Nov 2019 19:04:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 5/5] drm: drop DRM_AUTH from PRIME_TO/FROM_HANDLE ioctls
Message-ID: <20191127180456.GD406127@phenom.ffwll.local>
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
 <20191101130313.8862-5-emil.l.velikov@gmail.com>
 <20191127084104.1ceb1f62@collabora.com>
 <CACvgo52UB-sAv55_kREgHbRsg6b5KXv7At0TbgUPdc0e1E+QaA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo52UB-sAv55_kREgHbRsg6b5KXv7At0TbgUPdc0e1E+QaA@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9oVHy1y6RMaXWx6nU2J1vEuaN6G88wEXawp2NVxMucI=;
 b=cWLAvMr0OaCzZhcTtzR8ZeRddCAZd8SK+k+kIQY9Q1+UWZwGG9r3UIbV/pIywTOwA1
 cz3nEvl1ddptFY8aqmpntvBV0zFiQV/2Xbs2KSoG9WweVcmooxBNqVo8vNac6Iq6y7oJ
 z+4Eo2DqLCe3Qgd8jTlMehaTFO+3DfppRWvQ0=
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <sean@poorly.run>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDQ6Mjc6MjlQTSArMDAwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IE9uIFdlZCwgMjcgTm92IDIwMTkgYXQgMDc6NDEsIEJvcmlzIEJyZXppbGxvbgo+IDxi
b3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgRW1pbCwKPiA+
Cj4gPiBPbiBGcmksICAxIE5vdiAyMDE5IDEzOjAzOjEzICswMDAwCj4gPiBFbWlsIFZlbGlrb3Yg
PGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBGcm9tOiBFbWlsIFZl
bGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4gPgo+ID4gPiBBcyBtZW50aW9u
ZWQgYnkgQ2hyaXN0aWFuLCBmb3IgZHJpdmVycyB3aGljaCBzdXBwb3J0IG9ubHkgcHJpbWFyeSBu
b2Rlcwo+ID4gPiB0aGlzIGNoYW5nZXMgdGhlIHJldHVybmVkIGVycm9yIGZyb20gLUVBQ0NFUyBp
bnRvIC1FT1BOT1RTVVBQLy1FTk9TWVMuCj4gPgo+ID4gQXJlIHlvdSBzdXJlIHRoaXMgaXMgdHJ1
ZSBmb3IgTU9ERVNFVC1vbmx5IG5vZGVzICh0aG9zZSB0aGF0IGRvIG5vdAo+ID4gaGF2ZSB0aGUg
UkVOREVSIGNhcCBzZXQpIGltcGxlbWVudGluZyAtPntmZF90b19oYW5kbGUsaGFuZGxlX3RvX2Zk
fSgpPwo+ID4gU2hvdWxkbid0IHRoZSBpc19hdXRoZW50aWNhdGVkKCkgY2hlY2sgc3RpbGwgYmUg
ZG9uZSBpbiB0aGF0IGNhc2U/Cj4gPgo+IFRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcy4gSnVzdCBz
ZW50IG91dCB2Miwgd2hpY2ggSSBzaG91bGQgYWRkcmVzcyB0aGUgY29uY2Vybi4KCldoeSBkbyB3
ZSBuZWVkIHRoaXMgYWRkaXRpb25hbCBjaGVjayBpbiB2Mj8gV2hhdCBjYW4gZ28gd3Jvbmcgb24g
bW9kZXNldApkcml2ZXJzIGlmIG5vbi1hdXRoZW50aWNhdGVkIGxlZ2FjeSB0aGluZ3MgY2FuIHVz
ZSB0aGlzPyBtb2Rlc2V0LW9ubHkKZHJpdmVycyBoYXZlIGFsbCB0aGVpciByZXNvdXJjZXMgc2Vn
cmVnYXRlZCBieSB0aGUgZHJtIGNvcmUgKGRybV9mYiwKbW1hcHMsIGJ1ZmZlciBsaXN0cyksIHNv
IHRoZXJlJ3MgcmVhbGx5IG5vIGFjY2VzcyBsaW1pdGF0aW9ucyB0aGF0IGNhbiBnbwp3cm9uZyBo
ZXJlLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
