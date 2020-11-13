Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 961E42B1644
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 08:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B386E3FC;
	Fri, 13 Nov 2020 07:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213316E3FC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 07:19:36 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d12so8534296wrr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 23:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bnJYl7E+i8htBIliisICLU3QBRLhtKX5V6IRkESXblI=;
 b=k2FznTBmuBtIdb9vmIsFnefvjPAL49o04oAcgtmRfuhjCi1voMK9DNvTeL35Q98Bhu
 Fnf3X2PwBuYGCK20FoLEl2g44owGkYJtgK/wfjvrWCE7wV4vO3Qzj4WQmEzejwEMA6Yb
 kviwwk3HRP1j8xVxthJ+mlkPqqOhNp5S+8BTy3cRjICoDu8VhF+Bou9AyoksJLEbjn9k
 v4kqsqfHj+s9oOvojGisAZTtWXB0ZNtFBTsgmnUeVXgSUm62p/yO6OThk/S2tB0lfgeL
 9L7cp5IzV1+lAmgYnDOL0xxue73LP/tMrLwEdt0vAeEv6ZMPSnp/Rtxgq7P0ICuqI0gv
 2/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bnJYl7E+i8htBIliisICLU3QBRLhtKX5V6IRkESXblI=;
 b=G52iMBck/EyHXs0smTp5u0DNE1DCyUaQpVRxnq3nT9qvNqmCLHIaZwa15qit9HrPVJ
 HeiSRp8os1+7Rk2885PHHqp0BhI/PsUEZYEKZ4pJIQStoMBtQtXq0GNySEz+aUPf3+eB
 XTjbik09MgFkFmQznfJ21xedPj7UXWrkQHdU8uOgdv1WqqQh9+/bMe61RBSKEfCjPX0N
 CGoVG5fNwFiEjD6QQ3tNChanirvaPiAcyrf484CA8EzcgYvYfAGn14gnvb4QAEiY1VCZ
 6ZG0mYINQsf9Cxz1hs+SX+i7fdk1/mgV0kU5U9Sg5oRNEZCw3XFWgTIGAe9ELOwp9Hc0
 wcqQ==
X-Gm-Message-State: AOAM530yw+TSr9J7Rr9r1I0F2GXdeufUUwALEfq0aeDgG5YAYvW2nK67
 aImMl7gxwR6sf5ixE9+vfBiqAA==
X-Google-Smtp-Source: ABdhPJwyloqmRo9bTH+UlgyIYTE0cdzl4YZHqxc71/L1xDZmUoB+GN0sXlank69DctPsSMAdjz0T1Q==
X-Received: by 2002:adf:fd03:: with SMTP id e3mr1494073wrr.303.1605251974761; 
 Thu, 12 Nov 2020 23:19:34 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t4sm9631123wmb.20.2020.11.12.23.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 23:19:34 -0800 (PST)
Date: Fri, 13 Nov 2020 07:19:32 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Andy Gross <andy.gross@ti.com>,
 by <jhartmann@precisioninsight.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 Faith <faith@valinux.com>, Gareth Hughes <gareth@valinux.com>,
 Harry Wentland <harry.wentland@amd.com>, Huang Rui <ray.huang@amd.com>,
 Jeff Hartmann <jhartmann@valinux.com>,
 Keith Whitwell <keith@tungstengraphics.com>,
 Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <rob.clark@linaro.org>, Rob Clark <rob@ti.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 00/19] [Set 2] Rid W=1 warnings from GPU
Message-ID: <20201113071932.GF2787115@dell>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwNiBOb3YgMjAyMCwgTGVlIEpvbmVzIHdyb3RlOgoKPiBUaGlzIHNldCBpcyBwYXJ0
IG9mIGEgbGFyZ2VyIGVmZm9ydCBhdHRlbXB0aW5nIHRvIGNsZWFuLXVwIFc9MQo+IGtlcm5lbCBi
dWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4g
bmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KPiAKPiBUaGVyZSBhcmUgNTAwMCB3YXJuaW5ncyB0byB3
b3JrIHRocm91Z2guICBJdCB3aWxsIHRha2UgYSBjb3VwbGUgbW9yZQo+IHNldHMuICBBbHRob3Vn
aCwgKCJkcm0vYW1kL2Rpc3BsYXkvZGMvYmFzaWNzL2ZpeHB0MzFfMzI6IE1vdmUKPiB2YXJpYWJs
ZXMgdG8gd2hlcmUgdGhleSdyZSB1c2VkIikgZG9lcyB0YWtlIGNhcmUgb2YgMjAwMCBvZiB0aGVt
IQo+IAo+IExlZSBKb25lcyAoMTkpOgo+ICAgZHJtL3R0bS90dG1fcmFuZ2VfbWFuYWdlcjogRGVt
b3RlIG5vbi1jb25mb3JtYW50IGtlcm5lbC1kb2MgaGVhZGVyCj4gICBkcm0vcjEyOC9hdGlfcGNp
Z2FydDogU291cmNlIGZpbGUgaGVhZGVycyBhcmUgbm90IGdvb2QgY2FuZGlkYXRlcyBmb3IKPiAg
ICAga2VybmVsLWRvYwo+ICAgZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyOiBN
b3ZlCj4gICAgICdzaWRlYmFuZF9tc2dfcmVxX2VuY29kZV9kZWNvZGUnIG9udG8gdGhlIGhlYXAK
PiAgIGRybS9tZ2EvbWdhX2RtYTogRGVtb3RlIGtlcm5lbC1kb2MgYWJ1c2VycyB0byBzdGFuZGFy
ZCBjb21tZW50IGJsb2Nrcwo+ICAgZHJtL21nYS9tZ2Ffc3RhdGU6IFJlbW92ZSB1bnVzZWQgdmFy
aWFibGUgJ2J1Zl9wcml2Jwo+ICAgZHJtL3JhZGVvbi9hdG9tOiBNb3ZlIHByb3RvdHlwZSBpbnRv
IHNoYXJlZCBsb2NhdGlvbgo+ICAgZHJtL3JhZGVvbi9yYWRlb25fa21zOiBJbmNsdWRlIGhlYWRl
ciBjb250YWluaW5nIG91ciBvd24gcHJvdG90eXBlcwo+ICAgZHJtL29tYXBkcm0vb21hcF9nZW06
IEZpeCBtaXNuYW1lZCBhbmQgbWlzc2luZyBwYXJhbWV0ZXIgZGVzY3JpcHRpb25zCj4gICBkcm0v
b21hcGRybS9vbWFwX2RtbV90aWxlcjogRGVtb3RlIGFidXNpdmUgdXNlIG9mIGtlcm5lbC1kb2Mg
Zm9ybWF0Cj4gICBkcm0vcmFkZW9uL3JhZGVvbjogTW92ZSBwcm90b3R5cGUgaW50byBzaGFyZWQg
aGVhZGVyCj4gICBkcm0vcmFkZW9uL3JhZGVvbl9kcnY6IFNvdXJjZSBmaWxlIGhlYWRlcnMgYXJl
IG5vdCBnb29kIGNhbmRpZGF0ZXMgZm9yCj4gICAgIGtlcm5lbC1kb2MKPiAgIGRybS9hbWQvZGlz
cGxheS9kYy9iYXNpY3MvZml4cHQzMV8zMjogTW92ZSB2YXJpYWJsZXMgdG8gd2hlcmUgdGhleSdy
ZQo+ICAgICB1c2VkCj4gICBkcm0vcmFkZW9uL3JhZGVvbl9kcnY6IE1vdmUgcHJvdG90eXBlcyB0
byBhIHNoYXJlZCBoZWFkZXJmaWxlCj4gICBkcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlOiBQ
cm92aWRlIGRvY3VtZW50YXRpb24gZm9yICdyZWdfYWRkcicKPiAgICAgcGFyYW1zCj4gICBkcm0v
cmFkZW9uOiBNb3ZlIHByb3RvdHlwZXMgdG8gc2hhcmVkIGhlYWRlcgo+ICAgZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2ttczogUmVtb3ZlICdzdHJ1Y3QgZHJtX2FtZGdwdV9pbmZvX2RldmljZQo+ICAg
ICBkZXZfaW5mbycgZnJvbSB0aGUgc3RhY2sKPiAgIGRybS9yYWRlb24vcmFkZW9uX2ttczogRml4
IG1pc25hbWluZyBvZiAncmFkZW9uX2luZm9faW9jdGwncyBkZXYgcGFyYW0KPiAgIGRybS9yYWRl
b24vYXRvbWJpb3NfY3J0YzogUmVtb3ZlIGRlc2NyaXB0aW9uIG9mIG5vbi1leGlzdGVudCBmdW5j
dGlvbgo+ICAgICBwYXJhbSAnZW5jb2RlcicKPiAgIGRybS92M2QvdjNkX2RydjogUmVtb3ZlIHVu
dXNlZCBzdGF0aWMgdmFyaWFibGUgJ3YzZF92M2RfcG1fb3BzJwo+IAo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgfCAgIDIgKwo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgICAgICAgfCAxMDQgKysrKysrKysrLS0tLS0tLS0t
Cj4gIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvYmFzaWNzL2ZpeHB0MzFfMzIuYyAgICB8ICAgNSAr
Cj4gIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZml4ZWQzMV8zMi5oICB8ICAgNiAt
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX2RtYS5jICAgICAgICAgICAgICAgICB8ICAxMCAr
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9zdGF0ZS5jICAgICAgICAgICAgICAgfCAgIDIg
LQo+ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2RtbV90aWxlci5jICAgICAgfCAgIDYg
Ky0KPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyAgICAgICAgICAgIHwgICAz
ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9yMTI4L2F0aV9wY2lnYXJ0LmMgICAgICAgICAgICB8ICAg
MiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b20uaCAgICAgICAgICAgICAgICAgfCAg
IDYgKwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b21iaW9zX2NydGMuYyAgICAgICAgfCAg
IDEgLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b21iaW9zX2VuY29kZXJzLmMgICAgfCAg
IDQgLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oICAgICAgICAgICAgICAgfCAg
IDYgKwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYyAgICAgICAgfCAg
IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuaCAgICAgICAgfCAg
MzIgKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYyAgICAg
ICB8ICAgNCAtCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jICAgICAgICAg
ICB8ICAxMSArLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuaCAgICAgICAg
ICAgfCAgIDcgKysKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMgICAgICAg
ICAgIHwgICAzICstCj4gIC4uLi9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIu
YyAgICB8ICAxMSArLQo+ICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9yYW5nZV9tYW5hZ2VyLmMg
ICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2LmMgICAgICAgICAg
ICAgICAgIHwgIDM2IC0tLS0tLQo+ICAyMiBmaWxlcyBjaGFuZ2VkLCAxMzggaW5zZXJ0aW9ucygr
KSwgMTI2IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZGV2aWNlLmgKClN0aWxsIG5vIFJhZGVvbiBwYXRjaGVzIGluIHRvZGF5
J3MgLW5leHQuCgpJIHJlYWxseSB3YW50ZWQgdG8gaGF2ZSBoYWQgdGhpcyBzZXQgcmViYXNlZCBi
eSBub3cuCgpIb3cgbG9uZyBkbyB0aGV5IHRha2UgdG8gcGVjdWxhdGUgdGhyb3VnaD8KCi0tIApM
ZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNl
cnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpG
b2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
