Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CD810D9E2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 20:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F7D6EBEA;
	Fri, 29 Nov 2019 19:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CC26EBDF
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 19:05:16 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a131so10843480wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 11:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=5k6XDDNJSOCAqUR2tRQc7K+R/eHncWBomBzmVtKB9I0=;
 b=ZCnrld8oI6v78K6bUeY9nTJ+asbiDLETRbKlsMp99nvKnxS+aAPScROhbNhyKdFPvB
 DO4n2/TldFpLImlSYrcGBNYitgK2q4c6clw8zm6QFXaKNvc3X/g04IBRUyfwTqecgL01
 Ii3YGHeuCL7oCXjM7dr37fqWk1Vz7AZ3wGYWRFxDO17FL+KfMg1AyHSdZhoxKnhgnCCm
 bdP5RQevqcYSeGEEttz0Qg9zo/AxIvy0gSx22CSpGcu8bn6mdKAe7zKoJzGoLR0M14LF
 VGV3ktCK3WWBqGvN3YjmR2U8c/fRun7dUkzi488xsC4UDvd6Ku3jRkW6fRU9XjHlf9Zs
 50lQ==
X-Gm-Message-State: APjAAAXaOvzCXUWzO3W1h5BPdeDqPSSvj/CCE+/RqYaExxxKcJzHd5BT
 Rek6MR6y6REuCuiJL7GCaEd2Fw==
X-Google-Smtp-Source: APXvYqy8iDQFp8FKxrRVuLu0sCrnjfJk9Nx1+BHiJKnfceOT/01pcwgYX/kqlNbG7Di0BlahjaGAQg==
X-Received: by 2002:a7b:c7d3:: with SMTP id z19mr4302666wmk.116.1575054315397; 
 Fri, 29 Nov 2019 11:05:15 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id r63sm12728745wma.2.2019.11.29.11.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 11:05:14 -0800 (PST)
Date: Fri, 29 Nov 2019 20:05:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/todo: Add entry for fb funcs related cleanups
Message-ID: <20191129190512.GN624164@phenom.ffwll.local>
References: <20191127180035.416209-1-daniel.vetter@ffwll.ch>
 <20191127180035.416209-3-daniel.vetter@ffwll.ch>
 <39e84cfd-9a06-bfad-1cc0-030a71ad1c9c@suse.de>
 <20191129185739.GL624164@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129185739.GL624164@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=5k6XDDNJSOCAqUR2tRQc7K+R/eHncWBomBzmVtKB9I0=;
 b=a5RwkS0e+nmAAuCSc/rT+uVZG9uj8AevgbKGdjR1hW6mX98h+VisEzWQP8ea9dVhCb
 aonwEinhJbQXnZXHBdZew6AW5rIfdsudgObWhAygXqUW7d7d/FaPO1mv8RIKNy2uVUZQ
 IAI3Vpo3VOw9fmi3/YOvswrUVcAh5dwCl3qQs=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDc6NTc6MzlQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIE5vdiAyOSwgMjAxOSBhdCAxMDozNDoxMEFNICswMTAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToKPiA+IEhpCj4gPiAKPiA+IEFtIDI3LjExLjE5IHVtIDE5OjAwIHNj
aHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+ID4gV2UncmUgZG9pbmcgYSBncmVhdCBqb2IgZm9yIHJl
YWxseSBzaW1wbGUgZHJpdmVycyByaWdodCBub3csIGJ1dCBzdGlsbAo+ID4gPiBhIGxvdCBvZiBi
b2lsZXJwbGF0ZSBmb3IgdGhlIGJpZ2dlciBvbmVzLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiAKPiA+IEp1c3Qg
YSBzbWFsbCByZW1hcmsgYmVsb3csIG90aGVyd2lzZQo+ID4gCj4gPiBBY2tlZC1ieTogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gPiAKPiA+IAo+ID4gPiAtLS0KPiA+
ID4gIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgMjYgKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4gPiA+IAo+ID4g
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgYi9Eb2N1bWVudGF0aW9u
L2dwdS90b2RvLnJzdAo+ID4gPiBpbmRleCAzZWM1MDkzODFmYzUuLjJkODVmMzcyODRhMSAxMDA2
NDQKPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiA+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiA+ID4gQEAgLTE4Miw2ICsxODIsMzIgQEAgQ29udGFj
dDogTWFpbnRhaW5lciBvZiB0aGUgZHJpdmVyIHlvdSBwbGFuIHRvIGNvbnZlcnQKPiA+ID4gIAo+
ID4gPiAgTGV2ZWw6IEludGVybWVkaWF0ZQo+ID4gPiAgCj4gPiA+ICtkcm1fZnJhbWVidWZmZXJf
ZnVuY3MgYW5kIGRybV9tb2RlX2NvbmZpZ19mdW5jcy5mYl9jcmVhdGUgY2xlYW51cAo+ID4gPiAr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiA+ID4gKwo+ID4gPiArQSBsb3QgbW9yZSBkcml2ZXJzIGNvdWxkIGJlIHN3aXRj
aGVkIG92ZXIgdG8gdGhlIGRybV9nZW1fZnJhbWVidWZmZXIgaGVscGVycy4KPiA+ID4gK1Zhcmlv
dXMgaG9sZC11cHM6Cj4gPiA+ICsKPiA+ID4gKy0gTmVlZCB0byBzd2l0Y2ggb3ZlciB0byB0aGUg
Z2VuZXJpYyBkaXJ0eSB0cmFja2luZyBjb2RlIHVzaW5nCj4gPiA+ICsgIGRybV9hdG9taWNfaGVs
cGVyX2RpcnR5ZmIgZmlyc3QgKGUuZy4gcXhsKS4KPiA+ID4gKwo+ID4gPiArLSBOZWVkIHRvIHN3
aXRjaCB0byBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCgpLCBvdGhlcndpc2UgYSBsb3Qgb2YgdGhl
IGN1c3RvbSBmYgo+ID4gPiArICBzZXR1cCBjb2RlIGNhbid0IGJlIGRlbGV0ZWQuCj4gPiAKPiA+
IEZyb20gd2hhdCBJIHJlbWVtYmVyLCBhbG1vc3QgYWxsIG9mIHRoZSBvYnZpb3VzLCBsb3ctaGFu
Z2luZyBmcnVpdHMgaGF2ZQo+ID4gYmVlbiBwaWNrZWQgaGVyZS4gVGhlIHJlbWFpbmluZyBmYmRl
diB1c2VycyBlaXRoZXIgaGF2ZSBIVyBhY2NlbGVyYXRpb24KPiA+IChub3V2ZWF1LCBnbWE1MDAp
LCBvciB1c2UgdGhlIGNmYiBkcmF3aW5nIGZ1bmN0aW9ucy4KPiAKPiBJIHRoaW5rIGEgYnVuY2gg
b2YgdGhlc2UgKGZyb20geW91KSBhcmVuJ3QgbWVyZ2VkIHlldC4gSSdsbCBhZGQgYSBub3RlCj4g
YWJvdXQgc3lzIHZzIGNmYi4gQWJvdXQgZ21hNTAwL25vdXZlYXUsIEknbSBraW5kYSB0ZW1wdGVk
IHRvIGp1c3QgZGl0Y2gKPiB0aGUgYWNjZWxlcmF0aW9uIC4uLiBidXQgbWF5YmUgc29tZW9uZSBj
YXJlcywgZHVubm8uCgpDb3JyZWN0aW9uLCB3ZSBhbHJlYWR5IGhhdmUgYSB0YXNrIGZvciBkcm1f
ZmJkZXZfZ2VuZXJpY19zZXR1cCwgYW5kIHRoYXQKbWVudGlvbnMgdGhlIHN5cy9jZmIgaXNzdWUg
YWxyZWFkeS4gU28gSSdsbCBsZWF2ZSB0aGlzIGFzLWlzLgotRGFuaWVsCgo+IAo+ID4gVGhlIFRP
RE8gaXRlbSBzaG91bGQgcHJvYmFibHkgbWVudGlvbiB0aGlzLCB3aXRoIHNvbWUgYWR2aXNlIHRv
IGRvIHNvbWUKPiA+IGV4dHJhIHRlc3RpbmcgZm9yIGNvbXBhdGliaWxpdHkgb3IgcGVyZm9ybWFu
Y2UgYWZ0ZXIgbW92aW5nIHRvIGdlbmVyaWMKPiA+IGZiZGV2Lgo+IAo+IFRlc3RpbmcgKGF0IGxl
YXN0IG9uIHg4Nikgd29uJ3QgY2F0Y2ggdGhlIGNmYi9zeXNmYiBzdHVmZiwgc2luY2UgaXQncwo+
IGV4YWN0bHkgdGhlIHNhbWUgYXNtIGluc3RydWN0aW9ucyA6LS8gdGJoIEkgc3RpbGwgZG9uJ3Qg
a25vdyB3aGVyZSB0aGlzCj4gYWN0dWFsbHkgbWFrZXMgYSBkaWZmZXJlbmNlLgo+IC1EYW5pZWwK
PiAKPiA+IAo+ID4gQmVzdCByZWdhcmRzCj4gPiBUaG9tYXMKPiA+IAo+ID4gPiArCj4gPiA+ICst
IE1hbnkgZHJpdmVycyB3cmFwIGRybV9nZW1fZmJfY3JlYXRlKCkgb25seSB0byBjaGVjayBmb3Ig
dmFsaWQgZm9ybWF0cy4gRm9yCj4gPiA+ICsgIGF0b21pYyBkcml2ZXJzIHdlIGNvdWxkIGNoZWNr
IGZvciB2YWxpZCBmb3JtYXRzIGJ5IGNhbGxpbmcKPiA+ID4gKyAgZHJtX3BsYW5lX2NoZWNrX3Bp
eGVsX2Zvcm1hdCgpIGFnYWluc3QgYWxsIHBsYW5lcywgYW5kIHBhc3MgaWYgYW55IHBsYW5lCj4g
PiA+ICsgIHN1cHBvcnRzIHRoZSBmb3JtYXQuIEZvciBub24tYXRvbWljIHRoYXQncyBub3QgcG9z
c2libGUgc2luY2UgbGlrZSB0aGUgZm9ybWF0Cj4gPiA+ICsgIGxpc3QgZm9yIHRoZSBwcmltYXJ5
IHBsYW5lIGlzIGZha2UgYW5kIHdlJ2QgdGhlcmVmb3IgcmVqZWN0IHZhbGlkIGZvcm1hdHMuCj4g
PiA+ICsKPiA+ID4gKy0gTWFueSBkcml2ZXJzIHN1YmNsYXNzIGRybV9mcmFtZWJ1ZmZlciwgd2Un
ZCBuZWVkIGEgZW1iZWRkaW5nIGNvbXBhdGlibGUKPiA+ID4gKyAgdmVyc2lvbiBvZiB0aGUgdmFy
aW9zIGRybV9nZW1fZmJfY3JlYXRlIGZ1bmN0aW9ucy4gTWF5YmUgY2FsbGVkCj4gPiA+ICsgIGRy
bV9nZW1fZmJfY3JlYXRlL193aXRoX2RpcnR5L193aXRoX2Z1bmNzIGFzIG5lZWRlZC4KPiA+ID4g
Kwo+ID4gPiArQ29udGFjdDogRGFuaWVsIFZldHRlcgo+ID4gPiArCj4gPiA+ICtMZXZlbDogSW50
ZXJtZWRpYXRlCj4gPiA+ICsKPiA+ID4gIENsZWFuIHVwIG1tYXAgZm9yd2FyZGluZwo+ID4gPiAg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICAKPiA+ID4gCj4gPiAKPiA+IC0tIAo+ID4g
VGhvbWFzIFppbW1lcm1hbm4KPiA+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKPiA+IFNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSAo+ID4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55Cj4gPiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCj4gPiBHZXNj
aMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCj4gPiAKPiAKPiAKPiAKPiAKPiAtLSAK
PiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4g
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
