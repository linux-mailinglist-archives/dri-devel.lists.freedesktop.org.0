Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2095C10A06C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 15:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176CD6E3F5;
	Tue, 26 Nov 2019 14:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8526B6E3F5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 14:36:37 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z7so19294003wrl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 06:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=p00g6V9Bama/EwveZj3ADq9UrHHz6k97X5GwWWgTLik=;
 b=g4QZ2tUTSpTR4Oxhl3QxvNrhRUGrgdvSMb/yUe/8bb5Ud56TRpaIlvtV3VQbOT9ajd
 tKPofu+s9Eisk2IrNI93hgrVmmX9LuyLypDFHuBOygR5fRH10aq1m+FVYEDnguxl+bUH
 qArqfqa+Gd9NCRT9+CX4ObTtFoXcNg/PO8PcltJgSA1ksXFUccbJDURcVfkHXe60PfJ3
 lz7Wo8RNL3qgzzQoaw14AcTiUf6HM/+3/JSVePVx/Z1j/r3VBWzgMdU963vcuFtB4LFM
 kcJoZGU1Kiq5DHWUthe9Z8zxW8mlcEV9R4j+dWVS8uwxk3UC1lvBOVUnT/gGgAaETYVM
 D1bg==
X-Gm-Message-State: APjAAAUbuJ9iJQUvHLFhf2LV+YzSp/XwF9gaWvQnXxPtv1++6U3x6mQM
 IXIc1mhpnSVrQ1HmvXjJyEx5relkftk=
X-Google-Smtp-Source: APXvYqw8HQ/k4LCGgSsKbBNHYzWHkOmHPyD+okzuX1cbn03mpFVw5eQaubupR/Gs5k0rar/3fSLlDg==
X-Received: by 2002:adf:f103:: with SMTP id r3mr1153440wro.295.1574778996104; 
 Tue, 26 Nov 2019 06:36:36 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id f67sm3369469wme.16.2019.11.26.06.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 06:36:35 -0800 (PST)
Date: Tue, 26 Nov 2019 15:36:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] udmabuf: Remove deleted map/unmap handlers.
Message-ID: <20191126143633.GX29965@phenom.ffwll.local>
References: <20191126142516.630200-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126142516.630200-1-maarten.lankhorst@linux.intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=p00g6V9Bama/EwveZj3ADq9UrHHz6k97X5GwWWgTLik=;
 b=Ip2kAGO8rTjqdgbz2O4kGbl8LdkKyzbHFIySPm8ADDbhg8vxYr3ImVIhj1+1O2WJtx
 CTuP/vsDYXxJALiIgZf1UHWNa/Z8z+oA9H9QW70Tim+1+wLNu5NgCdFsiQXFLfnlXlqs
 zHnqfW/fB9fBUeJ8P2/oIhrVl+pUhVcXrxKh0=
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
Cc: linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDM6MjU6MTZQTSArMDEwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gQ29tbWl0IDdmMGRlOGQ4MDgxNiAoImRtYS1idWY6IERyb3AgZG1hX2J1Zl9r
KHVuKW1hcCIpIHJlbW92ZWQgbWFwL3VubWFwCj4gaGFuZGxlcnMsIGJ1dCB0aGV5IHN0aWxsIGV4
aXN0ZWQgaW4gdWRtYWJ1Zi4gUmVtb3ZlIHRoZW0gdGhlcmUgYXMgd2VsbAo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5j
b20+Cj4gRml4ZXM6IDdmMGRlOGQ4MDgxNiAoImRtYS1idWY6IERyb3AgZG1hX2J1Zl9rKHVuKW1h
cCIpCj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKCi9tZSBwdXRzIG9uIGJyb3duIHBhcGVy
IGJhZwoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
Cgo+IC0tLQo+ICBkcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jIHwgMTYgLS0tLS0tLS0tLS0tLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCj4gaW5k
ZXggOTYzNTg5NzQ1OGEwLi45ZGU1MzljMWRlZjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEt
YnVmL3VkbWFidWYuYwo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMKPiBAQCAtOTMs
MjYgKzkzLDEwIEBAIHN0YXRpYyB2b2lkIHJlbGVhc2VfdWRtYWJ1ZihzdHJ1Y3QgZG1hX2J1ZiAq
YnVmKQo+ICAJa2ZyZWUodWJ1Zik7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2b2lkICprbWFwX3VkbWFi
dWYoc3RydWN0IGRtYV9idWYgKmJ1ZiwgdW5zaWduZWQgbG9uZyBwYWdlX251bSkKPiAtewo+IC0J
c3RydWN0IHVkbWFidWYgKnVidWYgPSBidWYtPnByaXY7Cj4gLQlzdHJ1Y3QgcGFnZSAqcGFnZSA9
IHVidWYtPnBhZ2VzW3BhZ2VfbnVtXTsKPiAtCj4gLQlyZXR1cm4ga21hcChwYWdlKTsKPiAtfQo+
IC0KPiAtc3RhdGljIHZvaWQga3VubWFwX3VkbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1ZiwgdW5z
aWduZWQgbG9uZyBwYWdlX251bSwKPiAtCQkJICAgdm9pZCAqdmFkZHIpCj4gLXsKPiAtCWt1bm1h
cCh2YWRkcik7Cj4gLX0KPiAtCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX2J1Zl9vcHMgdWRt
YWJ1Zl9vcHMgPSB7Cj4gIAkubWFwX2RtYV9idWYJICA9IG1hcF91ZG1hYnVmLAo+ICAJLnVubWFw
X2RtYV9idWYJICA9IHVubWFwX3VkbWFidWYsCj4gIAkucmVsZWFzZQkgID0gcmVsZWFzZV91ZG1h
YnVmLAo+IC0JLm1hcAkJICA9IGttYXBfdWRtYWJ1ZiwKPiAtCS51bm1hcAkJICA9IGt1bm1hcF91
ZG1hYnVmLAo+ICAJLm1tYXAJCSAgPSBtbWFwX3VkbWFidWYsCj4gIH07Cj4gIAo+IC0tIAo+IDIu
MjQuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
