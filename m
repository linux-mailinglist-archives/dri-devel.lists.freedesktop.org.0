Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59411FAA3
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 21:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9195E8920E;
	Wed, 15 May 2019 19:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839B08920E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 19:28:40 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g57so1363873edc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 12:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=uc7c9TG4TC5GzNg2ZfhkDIdgVBlVuolToOkvkDXU2CI=;
 b=ofI4KcSdXFXtwUe2fWVgz2i8j+ot0g+07wn4ywq2ak1bJHCAhcEBVIKoMUJtBgxqSV
 M6h+rwQBx4giGk12AMHyorf1xKBcHPRRx08YJeCw3B/Vwze3y2dS3+5/JgVsHYZzbmwz
 +YWInBkug+D65pg/wfQJkcLjFx8IOSQq+7SXcSby+hYYBECx5UQ5ThOm0a43OiuezvIo
 Zir3ySwvXYagG3nPWk++IkMODEj0d0qFrBYhrqPLv/LiIlyxu8+5KB2DVB1sqOuHIYCw
 ZjGdabeLKDMw++8hMBvfIIB7Bk/jtm53tn21MaFB9snKv9svDzbd5lgNoUA1ZUCaMz1h
 4PeQ==
X-Gm-Message-State: APjAAAUdh6RzvGlQNzV33TOhGOSvHS+6t00mOjsYSGz1HpiBVPzAv+VN
 JIkF5wpDUS0dJCYIFUmoSCn8Sg==
X-Google-Smtp-Source: APXvYqx3ZUboZCcLXdyh4zYOCAb2HP6smIkUDysfyJFvQMt4KsprEYubOZZYMJuOa/sshBT5yZGTfA==
X-Received: by 2002:a50:87b5:: with SMTP id a50mr43696461eda.118.1557948519229; 
 Wed, 15 May 2019 12:28:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id p52sm1061567eda.79.2019.05.15.12.28.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 12:28:38 -0700 (PDT)
Date: Wed, 15 May 2019 21:28:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/fb-helper: Fix drm_fb_helper_hotplug_event() NULL
 ptr argument
Message-ID: <20190515192835.GL17751@phenom.ffwll.local>
References: <20190515132925.48867-1-noralf@tronnes.org>
 <20190515134014.GJ17751@phenom.ffwll.local>
 <20190515135516.GF19380@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515135516.GF19380@kadam>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=uc7c9TG4TC5GzNg2ZfhkDIdgVBlVuolToOkvkDXU2CI=;
 b=EMenQORXcmuzibXJUVH/EN7/HLPxDy9j5//ZgyYpOqT8KJ1iO0q7q/LXmVOg0Vm+M/
 8a82DAvmDiqPpHD0IRMQ6qANuvr3ps+ZBB+L+6gX8yL1/10O4iFC0OFsy7Jf8BCfYTWt
 R+NDH1gdwas5nPIog6HkHEefxPWgrvcV+63+M=
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
Cc: dri-devel@lists.freedesktop.org, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDQ6NTU6MTZQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCAwMzo0MDoxNFBNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDM6Mjk6MjVQTSArMDIw
MCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+ID4gPiBkcm1fZmJfaGVscGVyX2hvdHBsdWdfZXZl
bnQoKSBzaG91bGQgdG9sZXJhdGUgdGhlIGZiX2hlbHBlciBhcmd1bWVudCBiZWluZwo+ID4gPiBO
VUxMLiBDb21taXQgMDNhOTYwNmU3ZmVlICgiZHJtL2ZiLWhlbHBlcjogQXZvaWQgcmFjZSB3aXRo
IERSTSB1c2Vyc3BhY2UiKQo+ID4gPiBpbnRyb2R1Y2VkIGEgZmJfaGVscGVyIGRlcmVmZXJlbmNl
IGJlZm9yZSB0aGUgTlVMTCBjaGVjay4KPiA+ID4gRml4dXAgYnkgbW92aW5nIHRoZSBkZXJlZmVy
ZW5jZSBhZnRlciB0aGUgTlVMTCBjaGVjay4KPiA+ID4gCj4gPiA+IEZpeGVzOiAwM2E5NjA2ZTdm
ZWUgKCJkcm0vZmItaGVscGVyOiBBdm9pZCByYWNlIHdpdGggRFJNIHVzZXJzcGFjZSIpCj4gPiA+
IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+ID4gUmVw
b3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gPiAK
PiA+IEFoIHRoZSBjbGFzc2ljICJJIHNwb3R0ZWQgYSBkZXJlZiBiZWZvcmUgeW91ciBOVUxMIGNo
ZWNrLCBJJ20gZ29pbmcgdG8KPiA+IG9wdGltaXplIHRoaXMgYWxsIGF3YXkgYmVjYXVzZSB5b3Ug
Z290IGl0IHdyb25nIiBub25zZW5zZSBmcm9tIGdjYy4gSQo+ID4gdGhvdWdodCB0aGUga2VybmVs
IHVzZXMgYSBzcGVjaWFsIGNvbXBpbGUgZmxhZyB0byBhdm9pZCB0aGlzIG9wdGltaXphdGlvbgo+
ID4gLi4uCj4gCj4gVGhpcyBpcyBqdXN0IGEgbm9ybWFsIE5VTEwgZGVyZWZlcmVuY2UgYnVnLgo+
IAo+IFlvdSdyZSB0aGlua2luZyBvZiB0aGUgb2xkIHR1bi5jIHZ1bG5lcmFiaWxpdHkuICBUaGF0
IHdhcyBiYWNrIGluIHRoZQo+IGRheSBiZWZvcmUgd2Ugc3RhcnRlZCB1c2luZyAtZm5vLWRlbGV0
ZS1udWxsLXBvaW50ZXItY2hlY2tzLiAgV2hhdAo+IGhhcHBlbmVkIHRoZXJlIHdhcyB0aGUgY29k
ZSBzaG91bGQgaGF2ZSBOVUxMIGRlcmVmZXJlbmNlZCBhbmQgT29wc2VkIGJ1dAo+IEdDQyBvcHRp
bWl6ZWQgaXQgYXdheSBhbmQgaXQgZW5kZWQgdXAgYmVpbmcgYSBwcml2aWxlZ2UgZXNjYWxhdGlv
biBidWcKPiBpbnN0ZWFkLgoKSG0gcmlnaHQsIEkgZ290IGNvbmZ1c2VkLgotRGFuaWVsCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
