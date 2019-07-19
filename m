Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D136E609
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 15:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E28F89139;
	Fri, 19 Jul 2019 13:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1356E829
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 13:04:18 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w20so34401429edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 06:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=C2ah+IrjHWpfswIvLaSplsJRXQO7Wf3qhJprrOcN5T0=;
 b=nPJ4ZhgMZKnnxEElPYu8MLcOqNZuTo7t8WFR9pH8W+I7xL6iaLpVE7Ofwwjk5iPHbs
 oWQBgJtr73MJhjx37N8f6zMdslzd9xvq7x3tjkt9IfqGMcpEp8ur18xvWY9EiBe5PGjj
 6D6d2lMWd/rVDhkN1tM9Iq10+Gf9/DU7icuQJrLT6+GYRIemwaRN9r9uwYXNNup+XGSF
 LX6EsBfzo5afSdLYO2hJi3AwVnRDfiFMZyBJTNL+my+pK39kpdRvCT1CpFWbdOsbw11j
 FGUc7Pus1k9fS7CkPq/sZX9fxlLvv/10jdj3jE6tL2st0ekOmgnRFHct9ECVbQo5Usto
 cpUg==
X-Gm-Message-State: APjAAAW4/n9xmEUGIpLMheYTZQMLG5ZYecYrfAchp++bqhOAYmRih38L
 PnwvaL4h7o/7JPuO//eX+Y+7Scmp
X-Google-Smtp-Source: APXvYqyYP+MT59K1kjO9XslUX+K8m+4YAENsOJz0TlwuPevJJxz6Q/7LQc6D6C6IBMoqRpzH0K3A3w==
X-Received: by 2002:aa7:c554:: with SMTP id s20mr45186190edr.209.1563541457217; 
 Fri, 19 Jul 2019 06:04:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id bq1sm6207902ejb.45.2019.07.19.06.04.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 06:04:16 -0700 (PDT)
Date: Fri, 19 Jul 2019 15:04:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/doc: Document kapi doc expectations
Message-ID: <20190719130414.GO15868@phenom.ffwll.local>
References: <20190625203644.4423-1-daniel.vetter@ffwll.ch>
 <20190704145054.5701-1-daniel.vetter@ffwll.ch>
 <20190705151447.GP15868@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705151447.GP15868@phenom.ffwll.local>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=C2ah+IrjHWpfswIvLaSplsJRXQO7Wf3qhJprrOcN5T0=;
 b=gzAzjh2cr1+tCiLz1bZqdv+v2JweQudomMHMume8fuC9zUZLdakQZ2PuZgK87OQMSQ
 xlH6pC3OpTJto4r2tNQjcJWN9FWTzsGGp5EuENv9taPcV9HrFRDysOdFeeHpcKjt8b6D
 LDVvCQ+spD3I/hURFfjwvw86zx4I6SKcj1uRo=
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDU6MTQ6NDdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIEp1bCAwNCwgMjAxOSBhdCAwNDo1MDo1NFBNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gV2UndmUgaGFkIHRoaXMgYWxyZWFkeSBmb3IgYW55dGhpbmcgbmV3
LiBXaXRoIG15IGRybV9wcmltZS5jIGNsZWFudXAgSQo+ID4gYWxzbyB0aGluayBkb2N1bWVudGF0
aW9uIGZvciBldmVyeXRoaW5nIGFscmVhZHkgZXhpc3RpbmcgaXMgY29tcGxldGUsCj4gPiBhbmQg
d2UgY2FuIGJha2UgdGhpcyBpbiBhcyBhIHJlcXVpcmVtZW50cyBzdWJzeXN0ZW0gd2lkZS4KPiA+
IAo+ID4gdjI6IEltcHJvdmUgd29yZGluZyBhIGJpdCAoTGF1cmVudCksIGZpeCB0eXBvIGluIGNv
bW1pdCBtZXNzYWdlIChTYW0pLgo+ID4gCj4gPiBBY2tlZC1ieTogRW1pbCBWZWxpa292IDxlbWls
LnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiA+IEFja2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5AcG9v
cmx5LnJ1bj4KPiA+IEFja2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+Cj4gPiBBY2tlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4KPiA+IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+Cj4gPiBBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4K
PiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29t
Pgo+IAo+IEZyb20gaXJjOgo+IAo+IEFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4KCkkgZ3Vlc3MgdGhhdCdzIGVub3VnaCBhY2tzLCBhcHBsaWVkIGZvciA1LjQg
aW4gZHJtLW1pc2MtbmV4dC4KLURhbmllbAoKPiAKPiA+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiBDYzogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4g
PiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiA+IENjOiBT
ZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZ3B1
L2ludHJvZHVjdGlvbi5yc3QgfCAxNiArKysrKysrKysrKysrKysrCj4gPiAgRG9jdW1lbnRhdGlv
bi9ncHUvdG9kby5yc3QgICAgICAgICB8IDEzIC0tLS0tLS0tLS0tLS0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvaW50cm9kdWN0aW9uLnJzdCBiL0RvY3VtZW50YXRpb24v
Z3B1L2ludHJvZHVjdGlvbi5yc3QKPiA+IGluZGV4IGZjY2JlMzc1MjQ0ZC4uMjVhNTZlOWMwY2Zk
IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvaW50cm9kdWN0aW9uLnJzdAo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvaW50cm9kdWN0aW9uLnJzdAo+ID4gQEAgLTUxLDYgKzUx
LDIyIEBAIGFuZCAiRklYTUUiIHdoZXJlIHRoZSBpbnRlcmZhY2UgY291bGQgYmUgY2xlYW5lZCB1
cC4KPiA+ICAKPiA+ICBBbHNvIHJlYWQgdGhlIDpyZWY6YGd1aWRlbGluZXMgZm9yIHRoZSBrZXJu
ZWwgZG9jdW1lbnRhdGlvbiBhdCBsYXJnZSA8ZG9jX2d1aWRlPmAuCj4gPiAgCj4gPiArRG9jdW1l
bnRhdGlvbiBSZXF1aXJlbWVudHMgZm9yIGtBUEkKPiA+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+ID4gKwo+ID4gK0FsbCBrZXJuZWwgQVBJcyBleHBvcnRlZCB0byBvdGhl
ciBtb2R1bGVzIG11c3QgYmUgZG9jdW1lbnRlZCwgaW5jbHVkaW5nIHRoZWlyCj4gPiArZGF0YXN0
cnVjdHVyZXMgYW5kIGF0IGxlYXN0IGEgc2hvcnQgaW50cm9kdWN0b3J5IHNlY3Rpb24gZXhwbGFp
bmluZyB0aGUgb3ZlcmFsbAo+ID4gK2NvbmNlcHRzLiBEb2N1bWVudGF0aW9uIHNob3VsZCBiZSBw
dXQgaW50byB0aGUgY29kZSBpdHNlbGYgYXMga2VybmVsZG9jIGNvbW1lbnRzCj4gPiArYXMgbXVj
aCBhcyByZWFzb25hYmxlLgo+ID4gKwo+ID4gK0RvIG5vdCBibGluZGx5IGRvY3VtZW50IGV2ZXJ5
dGhpbmcsIGJ1dCBkb2N1bWVudCBvbmx5IHdoYXQncyByZWxldmFudCBmb3IgZHJpdmVyCj4gPiAr
YXV0aG9yczogSW50ZXJuYWwgZnVuY3Rpb25zIG9mIGRybS5rbyBhbmQgZGVmaW5pdGVseSBzdGF0
aWMgZnVuY3Rpb25zIHNob3VsZCBub3QKPiA+ICtoYXZlIGZvcm1hbCBrZXJuZWxkb2MgY29tbWVu
dHMuIFVzZSBub3JtYWwgQyBjb21tZW50cyBpZiB5b3UgZmVlbCBsaWtlIGEgY29tbWVudAo+ID4g
K2lzIHdhcnJhbnRlZC4gWW91IG1heSB1c2Uga2VybmVsZG9jIHN5bnRheCBpbiB0aGUgY29tbWVu
dCwgYnV0IGl0IHNoYWxsIG5vdAo+ID4gK3N0YXJ0IHdpdGggYSAvKioga2VybmVsZG9jIG1hcmtl
ci4gU2ltaWxhciBmb3IgZGF0YSBzdHJ1Y3R1cmVzLCBhbm5vdGF0ZQo+ID4gK2FueXRoaW5nIGVu
dGlyZWx5IHByaXZhdGUgd2l0aCBgYC8qIHByaXZhdGU6ICovYGAgY29tbWVudHMgYXMgcGVyIHRo
ZQo+ID4gK2RvY3VtZW50YXRpb24gZ3VpZGUuCj4gPiArCj4gPiAgR2V0dGluZyBTdGFydGVkCj4g
PiAgPT09PT09PT09PT09PT09Cj4gPiAgCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9n
cHUvdG9kby5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+ID4gaW5kZXggZTcxN2Yy
ODBmOWFlLi5kYjg4OTY5YTU2ZWUgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90
b2RvLnJzdAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiA+IEBAIC0zMDEs
MTkgKzMwMSw2IEBAIEluIHRoZSBlbmQgbm8gLmMgZmlsZSBzaG91bGQgbmVlZCB0byBpbmNsdWRl
IGBgZHJtUC5oYGAgYW55bW9yZS4KPiA+ICAKPiA+ICBDb250YWN0OiBEYW5pZWwgVmV0dGVyCj4g
PiAgCj4gPiAtQWRkIG1pc3Npbmcga2VybmVsZG9jIGZvciBleHBvcnRlZCBmdW5jdGlvbnMKPiA+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gLQo+ID4g
LVRoZSBEUk0gcmVmZXJlbmNlIGRvY3VtZW50YXRpb24gaXMgc3RpbGwgbGFja2luZyBrZXJuZWxk
b2MgaW4gYSBmZXcgYXJlYXMuIFRoZQo+ID4gLXRhc2sgd291bGQgYmUgdG8gY2xlYW4gdXAgaW50
ZXJmYWNlcyBsaWtlIG1vdmluZyBmdW5jdGlvbnMgYXJvdW5kIGJldHdlZW4KPiA+IC1maWxlcyB0
byBiZXR0ZXIgZ3JvdXAgdGhlbSBhbmQgaW1wcm92aW5nIHRoZSBpbnRlcmZhY2VzIGxpa2UgZHJv
cHBpbmcgcmV0dXJuCj4gPiAtdmFsdWVzIGZvciBmdW5jdGlvbnMgdGhhdCBuZXZlciBmYWlsLiBU
aGVuIHdyaXRlIGtlcm5lbGRvYyBmb3IgYWxsIGV4cG9ydGVkCj4gPiAtZnVuY3Rpb25zIGFuZCBh
biBvdmVydmlldyBzZWN0aW9uIGFuZCBpbnRlZ3JhdGUgaXQgYWxsIGludG8gdGhlIGRybSBib29r
Lgo+ID4gLQo+ID4gLVNlZSBodHRwczovL2RyaS5mcmVlZGVza3RvcC5vcmcvZG9jcy9kcm0vIGZv
ciB3aGF0J3MgdGhlcmUgYWxyZWFkeS4KPiA+IC0KPiA+IC1Db250YWN0OiBEYW5pZWwgVmV0dGVy
Cj4gPiAtCj4gPiAgTWFrZSBwYW5pYyBoYW5kbGluZyB3b3JrCj4gPiAgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gPiAgCj4gPiAtLSAKPiA+IDIuMjAuMQo+ID4gCj4gCj4gLS0gCj4gRGFuaWVs
IFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+IGh0dHA6Ly9i
bG9nLmZmd2xsLmNoCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
