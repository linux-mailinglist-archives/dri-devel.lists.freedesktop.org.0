Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181C943406
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 10:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FF9892BC;
	Thu, 13 Jun 2019 08:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D80892BC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 08:19:18 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m10so29935077edv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 01:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=q9NcFryDEuY5nNQs/opCaCKrPJSkMsq/1dQ25nBXb8w=;
 b=QdlJgtosTC1WGTmhDwhkFP1A8kTkJU5zoMNAaWebwNjJtyRbuL3noZxgVFHOhlrws7
 hln+W/hoWDrwqftpeTHd4/ZNhcXHubfMAbsSeWvkVi/8zzwOsseQAiNDRdlnWrZkHIav
 6hnBJppgJeUgeZaZpb74S/j6d9N1Pe9R3y3dhURABPLf1iiQc4bjzS1lj1pUjkYeAkHX
 vkXp3omPsotcRkuqP0BEVVeUxDOFG21W95hAVttqfhmKUDTbXR+ls/X8FT953OhOgOw3
 rQBIgJ9705zPm9zwJR+ik+uwl3wjFo43aOrR2R5uKZbjRu7Eu7WrJAl/09iGV8d44nwT
 xrMg==
X-Gm-Message-State: APjAAAWnmeJbpMuoNa2WOnteMt1KXOBGX7d+bJWOLKpT/4o1tcbhWw9X
 F5KnqH4LDB2lIMIRl/LriJTUEw==
X-Google-Smtp-Source: APXvYqwx3HpGd/5dzpauz/yzLPpeWmovugwkE+YyPQGqBGX3Gk3ohV9GUjXTbuNHHjFyp/uXXvjZ7w==
X-Received: by 2002:aa7:c88d:: with SMTP id p13mr75879168eds.83.1560413957193; 
 Thu, 13 Jun 2019 01:19:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a53sm680857eda.56.2019.06.13.01.19.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 01:19:16 -0700 (PDT)
Date: Thu, 13 Jun 2019 10:19:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/ast: Drop fb_debug_enter/leave
Message-ID: <20190613081914.GF23020@phenom.ffwll.local>
References: <20190612091253.26413-1-daniel.vetter@ffwll.ch>
 <20190612091253.26413-2-daniel.vetter@ffwll.ch>
 <d5fc5fa6-ae80-e82d-e0f7-94b9559e5af9@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5fc5fa6-ae80-e82d-e0f7-94b9559e5af9@suse.de>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=q9NcFryDEuY5nNQs/opCaCKrPJSkMsq/1dQ25nBXb8w=;
 b=TMZqH9uwANoX6uq7hdRuxxaDRy0Ts40e7YzqtBMYP9hnuDTiY136f/VuUZul8uxU9Q
 5qh2zQ/bpC0LfADPSFUe7sAXR4aVhYozz3MVTGxWjqFOSLPsMFg1KMxPFHoyCwNNKBrZ
 /NdD3dgnq5ijcVH/lZb8VQ6SjbuVvLwp1f+bQ=
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, YueHaibing <yuehaibing@huawei.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDg6NDU6NDlBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPgoKVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rLCBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC4K
LURhbmllbAoKPiAKPiBBbSAxMi4wNi4xOSB1bSAxMToxMiBzY2hyaWViIERhbmllbCBWZXR0ZXI6
Cj4gPiBhc3QgZG9lc24ndCBpbXBsZW1lbnQgdGhlIG1vZGVfc2V0X2Jhc2VfYXRvbWljIGhvb2sg
dGhpcyB3b3VsZCBuZWVkLAo+ID4gc28gdGhpcyBpcyBkZWFkIGNvZGUuCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4gQ2M6
IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4KPiA+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4K
PiA+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiBDYzog
U2FtIEJvYnJvZmYgPHNib2Jyb2ZmQGxpbnV4LmlibS5jb20+Cj4gPiBDYzogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgo+ID4gQ2M6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2Vp
LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2ZiLmMgfCAyIC0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZmIu
Ywo+ID4gaW5kZXggMDVmNDUyMjJiNzAyLi41NDgwY2FlY2RlODYgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9mYi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9mYi5jCj4gPiBAQCAtMTY2LDggKzE2Niw2IEBAIHN0YXRpYyBzdHJ1Y3QgZmJfb3BzIGFz
dGZiX29wcyA9IHsKPiA+ICAJLmZiX3Bhbl9kaXNwbGF5ID0gZHJtX2ZiX2hlbHBlcl9wYW5fZGlz
cGxheSwKPiA+ICAJLmZiX2JsYW5rID0gZHJtX2ZiX2hlbHBlcl9ibGFuaywKPiA+ICAJLmZiX3Nl
dGNtYXAgPSBkcm1fZmJfaGVscGVyX3NldGNtYXAsCj4gPiAtCS5mYl9kZWJ1Z19lbnRlciA9IGRy
bV9mYl9oZWxwZXJfZGVidWdfZW50ZXIsCj4gPiAtCS5mYl9kZWJ1Z19sZWF2ZSA9IGRybV9mYl9o
ZWxwZXJfZGVidWdfbGVhdmUsCj4gPiAgfTsKPiA+ICAKPiA+ICBzdGF0aWMgaW50IGFzdGZiX2Ny
ZWF0ZV9vYmplY3Qoc3RydWN0IGFzdF9mYmRldiAqYWZiZGV2LAo+ID4gCj4gCj4gLS0gCj4gVGhv
bWFzIFppbW1lcm1hbm4KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4gU1VTRSBMaW51eCBH
bWJILCBNYXhmZWxkc3RyYXNzZSA1LCA5MDQwOSBOdWVybmJlcmcsIEdlcm1hbnkKPiBHRjogRmVs
aXggSW1lbmTDtnJmZmVyLCBNYXJ5IEhpZ2dpbnMsIFNyaSBSYXNpYWgKPiBIUkIgMjEyODQgKEFH
IE7DvHJuYmVyZykKPiAKCgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
