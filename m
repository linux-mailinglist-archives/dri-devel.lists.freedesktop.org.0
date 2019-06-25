Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6246A5593F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8906E237;
	Tue, 25 Jun 2019 20:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369D36E237
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:42:56 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g18so13820821qkl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KcPM526g40BTOG3/c4d95OiVvc56UVFXN8vQom+5QH0=;
 b=LXr7rOObslQKtbt0Ii+tKzbvqjRiqHtQDe1nrVsH0+B13LlYXetIVBnH5vZeJWn3mz
 cXXllxOnuyTyxcnEPx755tMwImNyq8+9XPe6h30RHyNfir8FhQepr1BRohRBx3DQP4Pk
 2s794rvE1WBs43Nu6UICWe1kx5trBB6qhLfb4kY5LuC7jbe++UHejUY//jvBTlKIn4Ji
 YYpKk1ZGiXGWEiEZKjMjFbrKN+U//+5LqMS9+9h/rnh+A5N0W/u1j7xGmhCEfyrB9daK
 9StC1g9UnD2VbDezez8XV/UaKQWorKr/biGEPAVHwLkEfvezZuzbw0ICqM5CqHgQVvIL
 RmRw==
X-Gm-Message-State: APjAAAVFz1GIS3B5fbMMfSfUl2EnKzrhn6OgcRJavn18CTqetw9exLi8
 p/whGgAoXvs/kPlKyrlCbUWepQ==
X-Google-Smtp-Source: APXvYqx1SX+fR64f+10GQRcW8Gu04qepKbf6bOgiI4HvN0Dys/TDZ5dB0VN6u0na7yoWm0SCA74qEw==
X-Received: by 2002:a05:620a:13b9:: with SMTP id
 m25mr650966qki.246.1561495375285; 
 Tue, 25 Jun 2019 13:42:55 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s127sm7319561qkd.107.2019.06.25.13.42.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 13:42:54 -0700 (PDT)
Date: Tue, 25 Jun 2019 16:42:53 -0400
From: Sean Paul <sean@poorly.run>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/doc: Document kapi doc expectations
Message-ID: <20190625204253.GI25413@art_vandelay>
References: <20190625203644.4423-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625203644.4423-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KcPM526g40BTOG3/c4d95OiVvc56UVFXN8vQom+5QH0=;
 b=IsOBmBrTqkOYHUEAKenVIYucos7SRtXbtQGa7w1p5zzr1fjG8LxWAdW/geqdKqyWdj
 DbPkpVPexmhGe9zOXcFir6zUzo2fNu/S2J7cZ1ZO5pjVtbYGzn6IyBkbZ/QaUaPvxWW8
 KQbTT2F+H5GsnwBMlWxHemnrpnyt97tnpJ34ToKbX3TTyTlQNgAdYZ/bTIXVEzRoFpC8
 9861jH3CdWBiZfXCARuCkkG9IKU5qC9skCMD89r7Z9Pnr9G9FxTVZHMN2zZlnHmo7nHe
 VHN0OcXoUWeMfdw6UTw6KcWfxKeE2wxtdjkQ7gCiS3MvtckP5rhV4qpV1XcpSMtbO6DY
 EV/A==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Jani Nikula <jani.nikula@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6MzY6NDRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXZSd2ZSBoYWQgdGhpcyBhbHJlYWR5IGZvciBhbnl0aGluZyBuZXcuIFdpdGggbXkg
ZHJtX3ByaW1lLmMgY2xlYW51cCBJCj4gYWxzbyB0aGluayBkb2N1bWVudGF0aW9ucyBmb3IgZXZl
cnl0aGluZyBhbHJlYWR5IGV4aXN0aW5nIGlzIGNvbXBsZXRlLAo+IGFuZCB3ZSBjYW4gYmFrZSB0
aGlzIGluIGFzIGEgcmVxdWlyZW1lbnRzIHN1YnN5c3RlbSB3aWRlLgo+IAo+IEFja2VkLWJ5OiBK
YW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gQ2M6IEphbmkgTmlrdWxhIDxq
YW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBN
YXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENjOiBTZWFuIFBhdWwg
PHNlYW5AcG9vcmx5LnJ1bj4KCldob2xlaGVhcnRlZGx5LUFja2VkLWJ5OiBTZWFuIFBhdWwgPHNl
YW5AcG9vcmx5LnJ1bj4KCj4gLS0tCj4gcmVzZW5kaW5nIHN0YW5kLWFsb25lIGZvciBtb3JlIHZp
c2liaWxpdHkgYW5kIGEtYiBnYXRoZXJpbmcuCj4gLURhbmllbAo+IC0tLQo+ICBEb2N1bWVudGF0
aW9uL2dwdS9pbnRyb2R1Y3Rpb24ucnN0IHwgMTMgKysrKysrKysrKysrKwo+ICBEb2N1bWVudGF0
aW9uL2dwdS90b2RvLnJzdCAgICAgICAgIHwgMTMgLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2dwdS9pbnRyb2R1Y3Rpb24ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUv
aW50cm9kdWN0aW9uLnJzdAo+IGluZGV4IGZjY2JlMzc1MjQ0ZC4uYTk0YWQ2YWQxZjU0IDEwMDY0
NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2ludHJvZHVjdGlvbi5yc3QKPiArKysgYi9Eb2N1
bWVudGF0aW9uL2dwdS9pbnRyb2R1Y3Rpb24ucnN0Cj4gQEAgLTUxLDYgKzUxLDE5IEBAIGFuZCAi
RklYTUUiIHdoZXJlIHRoZSBpbnRlcmZhY2UgY291bGQgYmUgY2xlYW5lZCB1cC4KPiAgCj4gIEFs
c28gcmVhZCB0aGUgOnJlZjpgZ3VpZGVsaW5lcyBmb3IgdGhlIGtlcm5lbCBkb2N1bWVudGF0aW9u
IGF0IGxhcmdlIDxkb2NfZ3VpZGU+YC4KPiAgCj4gK0RvY3VtZW50YXRpb24gUmVxdWlyZW1lbnRz
IGZvciBrQVBJCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKwo+ICtB
bGwga2VybmVsIEFQSXMgZXhwb3J0ZWQgdG8gb3RoZXIgbW9kdWxlcyBtdXN0IGJlIGRvY3VtZW50
ZWQsIGluY2x1ZGluZyB0aGVpcgo+ICtkYXRhc3RydWN0dXJlcyBhbmQgYXQgbGVhc3QgYSBzaG9y
dCBpbnRyb2R1Y3Rvcnkgc2VjdGlvbiBleHBsYWluaW5nIHRoZSBvdmVyYWxsCj4gK2NvbmNlcHRz
LiBEb2N1bWVudGF0aW9uIHNob3VsZCBiZSBwdXQgaW50byB0aGUgY29kZSBpdHNlbGYgYXMga2Vy
bmVsZG9jIGNvbW1lbnRzCj4gK2FzIG11Y2ggYXMgcmVhc29uYWJsZS4gRG8gbm90IGJsaW5kbHkg
ZG9jdW1lbnQgZXZlcnl0aGluZywgYnV0IGRvY3VtZW50IG9ubHkKPiArd2hhdCdzIHJlbGV2YW50
IGZvciBkcml2ZXIgYXV0aG9yczogSW50ZXJuYWwgZnVuY3Rpb25zIG9mIGRybS5rbyBhbmQgZGVm
aW5pdGVseQo+ICtzdGF0aWMgZnVuY3Rpb25zIHNob3VsZCBub3QgaGF2ZSBmb3JtYWwga2VybmVs
ZG9jIGNvbW1lbnRzLiBVc2Ugbm9ybWFsIEMKPiArY29tbWVudHMgaWYgeW91IGZlZWwgbGlrZSBh
IGNvbW1lbnQgaXMgd2FycmFudGVkLiBTaW1pbGFyIGZvciBkYXRhIHN0cnVjdHVyZXMsCj4gK2Fu
bm90YXRlIGFueXRoaW5nIGVudGlyZWx5IHByaXZhdGUgd2l0aCBgYC8qIHByaXZhdGU6ICovYGAg
Y29tbWVudHMgYXMgcGVyIHRoZQo+ICtkb2N1bWVudGF0aW9uIGd1aWRlLgo+ICsKPiAgR2V0dGlu
ZyBTdGFydGVkCj4gID09PT09PT09PT09PT09PQo+ICAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9ncHUvdG9kby5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+IGluZGV4IGU3
MTdmMjgwZjlhZS4uZGI4ODk2OWE1NmVlIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1
L3RvZG8ucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiBAQCAtMzAxLDE5
ICszMDEsNiBAQCBJbiB0aGUgZW5kIG5vIC5jIGZpbGUgc2hvdWxkIG5lZWQgdG8gaW5jbHVkZSBg
YGRybVAuaGBgIGFueW1vcmUuCj4gIAo+ICBDb250YWN0OiBEYW5pZWwgVmV0dGVyCj4gIAo+IC1B
ZGQgbWlzc2luZyBrZXJuZWxkb2MgZm9yIGV4cG9ydGVkIGZ1bmN0aW9ucwo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IC0KPiAtVGhlIERSTSByZWZlcmVu
Y2UgZG9jdW1lbnRhdGlvbiBpcyBzdGlsbCBsYWNraW5nIGtlcm5lbGRvYyBpbiBhIGZldyBhcmVh
cy4gVGhlCj4gLXRhc2sgd291bGQgYmUgdG8gY2xlYW4gdXAgaW50ZXJmYWNlcyBsaWtlIG1vdmlu
ZyBmdW5jdGlvbnMgYXJvdW5kIGJldHdlZW4KPiAtZmlsZXMgdG8gYmV0dGVyIGdyb3VwIHRoZW0g
YW5kIGltcHJvdmluZyB0aGUgaW50ZXJmYWNlcyBsaWtlIGRyb3BwaW5nIHJldHVybgo+IC12YWx1
ZXMgZm9yIGZ1bmN0aW9ucyB0aGF0IG5ldmVyIGZhaWwuIFRoZW4gd3JpdGUga2VybmVsZG9jIGZv
ciBhbGwgZXhwb3J0ZWQKPiAtZnVuY3Rpb25zIGFuZCBhbiBvdmVydmlldyBzZWN0aW9uIGFuZCBp
bnRlZ3JhdGUgaXQgYWxsIGludG8gdGhlIGRybSBib29rLgo+IC0KPiAtU2VlIGh0dHBzOi8vZHJp
LmZyZWVkZXNrdG9wLm9yZy9kb2NzL2RybS8gZm9yIHdoYXQncyB0aGVyZSBhbHJlYWR5Lgo+IC0K
PiAtQ29udGFjdDogRGFuaWVsIFZldHRlcgo+IC0KPiAgTWFrZSBwYW5pYyBoYW5kbGluZyB3b3Jr
Cj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAKPiAtLSAKPiAyLjIwLjEKPiAKCi0tIApT
ZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
