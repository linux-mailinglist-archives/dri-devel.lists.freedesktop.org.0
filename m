Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A18183350
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 15:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F229389CB8;
	Tue,  6 Aug 2019 13:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9D289CB8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 13:51:55 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id d4so82413102edr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 06:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=a0lfSnnJaJfMOc9zyVQgg9EwvVgrc5MdyRiRdlcYgws=;
 b=ulNbfgnnL/cxyu//Cv0qaNVzPxi2afdxCTljzrQ//SvHDWQarD80nYPot008BeTiCE
 SSnqGZi4txdER1P2GWMKVtCWh//GI4jLGUYhKj6OI9Rps/zOgeH2l/ytn+b9JkK17QpO
 1KyGqKkNv9T7UzzvLBTLeKT03+wfFVlpYUDnElIeBii2bXoxUj2Fr/KK2EkdyT3nRVs2
 SruwQAHaWaPQIB0/d+nW2Pom3n9bx7PWdpgiCfLFwtapYohYJnzncXHUXWnxmv/heIg5
 XtOjbEQuDYXY/3uyIQJJ5bwO8Ol0nnXNCLj0Y0jNMNMO5zpWbUpujNVtL5awdffmnH4i
 rl/Q==
X-Gm-Message-State: APjAAAUFOj69C5Pl0wCoZFvYbAnz1m9Mk6wAAXsMSfjWqhEATCydDckT
 23jUToOYoNhX7PKx+6eJN6qOYA==
X-Google-Smtp-Source: APXvYqxagDweKqO2v19ELG/DESvr2CN6JpnubzMlCijO/oJz4X47d0dLISuW+sTGFgtO+kKrLnq3zg==
X-Received: by 2002:a50:8828:: with SMTP id b37mr3965848edb.266.1565099514307; 
 Tue, 06 Aug 2019 06:51:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id e12sm20306385edb.72.2019.08.06.06.51.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 06:51:53 -0700 (PDT)
Date: Tue, 6 Aug 2019 15:51:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Subject: Re: [PATCH v3 0/3] Send a hotplug when edid changes
Message-ID: <20190806135150.GZ7444@phenom.ffwll.local>
References: <20190806125551.25761-1-stanislav.lisovskiy@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806125551.25761-1-stanislav.lisovskiy@intel.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a0lfSnnJaJfMOc9zyVQgg9EwvVgrc5MdyRiRdlcYgws=;
 b=abbtLm0tQvbamO2VmD6zJvO9D6RKwCWQ30ILI8It7YoSfFet1VTcCNFJl6GKT4J2BR
 bfM+joRHqXIcrKDJCTUXMHtmJ2bsN0yNK/gUfJr/Wta0AZGTG/65wO2ZBYsziQtla+B1
 HbNE5astAHNupOEaa98kguYbjNfAf1Vft/nLY=
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 martin.peres@intel.com, dri-devel@lists.freedesktop.org,
 jani.saarinen@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDM6NTU6NDhQTSArMDMwMCwgU3RhbmlzbGF2IExpc292
c2tpeSB3cm90ZToKPiBUaGlzIHNlcmllcyBpbnRyb2R1Y2UgdG8gZHJtIGEgd2F5IHRvIGRldGVy
bWluZSBpZiBzb21ldGhpbmcgZWxzZQo+IGV4Y2VwdCBjb25uZWN0aW9uX3N0YXR1cyBoYWQgY2hh
bmdlZCBkdXJpbmcgcHJvYmluZywgd2hpY2gKPiBjYW4gYmUgdXNlZCBieSBvdGhlciBkcml2ZXJz
IGFzIHdlbGwuIEFub3RoZXIgaTkxNSBzcGVjaWZpYyBwYXJ0Cj4gdXNlcyB0aGlzIGFwcHJvYWNo
IHRvIGRldGVybWluZSBpZiBlZGlkIGhhZCBjaGFuZ2VkIHdpdGhvdXQKPiBjaGFuZ2luZyB0aGUg
Y29ubmVjdGlvbiBzdGF0dXMgYW5kIHNlbmQgYSBob3RwbHVnIGV2ZW50LgoKRGlkIHlvdSByZWFk
IHRocm91Z2ggdGhlIGVudGlyZSBodWdlIHRocmVhZCBvbiBhbGwgdGhpcyAod2l0aCBJIHRoaW5r
ClBhdWwsIFBla2thLCBSYW0gYW5kIHNvbWUgb3RoZXJzKT8gSSBmZWVsIGxpa2UgdGhpcyBpcyBt
b3N0bHkgdGFraW5nIHRoYXQKaWRlYSwgYnV0IG5vdCB0YWtpbmcgYSBsb3Qgb2YgdGhlIGRldGFp
bHMgd2UndmUgZGlzY3Vzc2VkIHRoZXJlLgpTcGVjaWZpY2FsbHkgSSdtIG5vdCBzdXJlIGhvdyB1
c2Vyc3BhY2Ugc2hvdWxkIGhhbmRsZSB0aGlzIHdpdGhvdXQgYWxzbwpleHBvc2luZyB0aGUgZXBv
Y2ggY291bnRlciwgb3IgYXQgbGVhc3QgZ2VuZXJhdGluZyBhIGhvdHBsdWcgZXZlbnQgZm9yIHRo
ZQpzcGVjaWZpYyBjb25uZWN0b3IuIEFsbCB0aGF0IGFuZCBtb3JlIHdlIGRpc2N1c3NlZCB0aGVy
ZS4KCkFuZCB0aGVuIHRoZXJlJ3MgdGhlIGZvbGxvdy11cCBxdWVzdGlvbjogV2hhdCdzIHRoZSB1
c2Vyc3BhY2UgZm9yIHRoaXM/CkV4aXN0aW5nIGV4cGVjdGF0aW9ucyBhcmUgYSBtaW5lZmllbGQg
aGVyZSwgc28gZXZlbiBpZiB5b3UgZG9uJ3QgcGxhbiB0bwpjaGFuZ2UgdXNlcnNwYWNlIHdlIG5l
ZWQgdG8ga25vdyB3aGF0IHRoaXMgaXMgYWltZWQgZm9yLCBhbmQgc2VlIGFib3ZlIEkKZG9uJ3Qg
dGhpbmsgdGhpcyBpcyBwb3NzaWJsZSB0byB1c2Ugd2l0aG91dCB1c2Vyc3BhY2UgY2hhbmdlcyAu
Li4KLURhbmllbAoKPiAKPiBTdGFuaXNsYXYgTGlzb3Zza2l5ICgzKToKPiAgIGRybTogQWRkIGhl
bHBlciB0byBjb21wYXJlIGVkaWRzLgo+ICAgZHJtOiBJbnRyb2R1Y2UgY2hhbmdlIGNvdW50ZXIg
dG8gZHJtX2Nvbm5lY3Rvcgo+ICAgZHJtL2k5MTU6IFNlbmQgaG90cGx1ZyBldmVudCBpZiBlZGlk
IGhhZCBjaGFuZ2VkLgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgICAg
ICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgICAgICAgICAgICAg
ICAgICAgfCAzMyArKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3By
b2JlX2hlbHBlci5jICAgICAgICAgICB8IDI5ICsrKysrKysrKysrKysrKy0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAgICAgIHwgMTYgKysrKysrKysrLQo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyAgICB8IDE2ICsrKysrKysr
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9ob3RwbHVnLmMgfCAyMSAr
KysrKysrKysrLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCAgICAgICAgICAgICAg
ICAgIHwgIDMgKysKPiAgaW5jbHVkZS9kcm0vZHJtX2VkaWQuaCAgICAgICAgICAgICAgICAgICAg
ICAgfCAgOSArKysrKysKPiAgOCBmaWxlcyBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4xNy4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
