Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7368DF4288
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1F76E04E;
	Fri,  8 Nov 2019 08:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A5B6E04E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 08:50:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e6so6115943wrw.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 00:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=PChg1R2OjgZ9BSjpEhgHq+HyofPime6n5bVt1RbQFFI=;
 b=Xm6QYGWCjfVuMtdYDLOTAjqdklK7oFIg3lcnay3uLdoSSil80T3HHGMJJD/GwVnyY+
 acd8f1jvk6LztRoBbc0g3rnonh5bl0T/ys6hkP382emNFbJVlD3FY4OQRScuYtg6XBkJ
 mF/lwgDCF288jfk1zrXv8xtn/fK1jsJczLonjs7bwZOSCHkHUR9TAtRNZOo7wuhUf7aK
 qNiyHyoYUtxr1a4B7KBdWHoF877r6cVoxQW/HXaODY24tByc/uEqatfInh/tA4i0P2bt
 sjwpuc/lwtvteILBoMbuQ47Re3G3PW7d9v9X+0uG2M7qwGF9ytXfS6T8w/Mg2AZ/9qUz
 kEvw==
X-Gm-Message-State: APjAAAWL+Ww4gXUHWKEmStuxu5b7p1b3m5ry9N1+T9+9XWY9fNtGr9h0
 0V9bLm8oVixkdc76YrEeVwDpuQ==
X-Google-Smtp-Source: APXvYqyaQAIxq+RpQFSc96dl8o6ISzotOTqPCd/NXBSPMvb0KZw55ENHvVBCyz0OaXL7vINafKrGuA==
X-Received: by 2002:adf:c409:: with SMTP id v9mr7257994wrf.41.1573203033458;
 Fri, 08 Nov 2019 00:50:33 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id x205sm8139429wmb.5.2019.11.08.00.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 00:50:32 -0800 (PST)
Date: Fri, 8 Nov 2019 09:50:30 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 0/6] drm: trace: Introduce drm_trace() and instrument
 drm_atomic.c
Message-ID: <20191108085030.GW23790@phenom.ffwll.local>
References: <20191107210316.143216-1-sean@poorly.run>
 <20191108101659.648ef44b@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108101659.648ef44b@eldfell.localdomain>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PChg1R2OjgZ9BSjpEhgHq+HyofPime6n5bVt1RbQFFI=;
 b=dmBsoqqqSHSL0uARdnd50qNK6N/2p5N7GJa3H93fIieAA8gTPqDfXbqkHVGr+BzREj
 lBhMXW1NDtwLV0bc8cCZXjyoo4xwHLhgnjliI3/FqxaZM5SRp/s+w5mETRSHki1bLuG7
 KwD9XhuhdENM89IRrgw0mN8o5Wi91O3dqyhrk=
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, tzimmermann@suse.de,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMTA6MTY6NTlBTSArMDIwMCwgUGVra2EgUGFhbGFuZW4g
d3JvdGU6Cj4gSXMgaXQgb2sgdG8gYnVpbGQgdXNlcnNwYWNlIHRvIHJlbHkgb24gdGhlc2UgdHJh
Y2UgZXZlbnRzIGR1cmluZyBub3JtYWwKPiBvcGVyYXRpb25zLCBlLmcuIGZvciBjb250aW51b3Vz
IGFkanVzdG1lbnQgb2YgdGltaW5ncy90aW1lcnM/CgpBc2lkZSBkaXNjdXNzaW9uIG9uIHRoaXM6
IElmIHdlIGFkZCB0aGlzIChJIHRoaW5rIHVzZXJzcGFjZSBtaWdodCB3YW50CnNvbWUgaW5mb3Jt
YXRpb24gYWJvdXQgdGhlIHBvaW50IG9mIG5vIHJldHVybiBhbmQgd2h5IHdlIG1pc3NlZCBpdCkg
dGhlbiBJCnRoaW5rIHdlIHNob3VsZCBleHBvc2UgdGhhdCB3aXRoIGFuIGltcHJvdmVkIGRybV9l
dmVudCBhbmQgY2xlYXIKc2VtYW50aWNzLgoKSWYgd2Ugc3RhcnQgdG8gZW5jb3VyYWdlIGNvbXBv
c2l0b3JzIHRvIHVzZSB0cmFjZXBvaW50cyB0byBmaWd1cmUgb3V0IHdoeQp0aGUga2VybmVsIGRv
ZXNuJ3QgYmVoYXZlIChURVNUX09OTFkgZmFpbHVyZSwgb3IgbWlzc2VkIGZsaXAgdGFyZ2V0KSwg
YW5kCnVzZSB0aGF0IGZvciBiZWhhdmlvdXIsIHdlJ3ZlIGJha2VkIGltcGxlbWVudGF0aW9uIGRl
dGFpbHMgaW50byB0aGUgdWFwaS4KQW5kIHRoZW4gd2UncmUgc2NyZXdlZC4KClNvIGlmIHlvdSBo
YXZlIGFueSBuZWVkIGZvciB0aW1pbmcgaW5mb3JtYXRpb24gdGhhdCB5b3Ugc2VlIHNvbHZlZCB3
aXRoIGEKdHJhY2Vwb2ludCwgcGxzIGJyaW5nIHRoaXMgdXAgc28gd2UgY2FuIGFkZCBwcm9wZXIg
dWFwaS4gQW5kIHllcyBJIGtub3cKdGhhdCBpZiBzb21lb25lIGRvZXNuJ3Qgd2Ugc3RpbGwgbmVl
ZCB0byBrZWVwIHRoYXQgdHJhY2Vwb2ludCB3b3JraW5nLCBidXQKd2l0aCBhbGwgdGhpbmdzIHVh
cGkgdGhlIHF1ZXN0aW9uIGlzbid0IHdoZXRoZXIgd2UnbGwgc2NyZXcgdXAgKHdlIHdpbGwpLApi
dXQgaG93IG9mdGVuLiBBbmQgbGVzcyBvZnRlbiBpcyBtYXNzaXZlbHkgYmV0dGVyIDotKQotRGFu
aWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
