Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53385EE739
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 19:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290996E7E2;
	Mon,  4 Nov 2019 18:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC31D6E7E2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 18:19:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t1so12318206wrv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 10:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=Qfg3/OhENOhgHzvHvbxDHTYQ7dgyHpgpR3Q3h/hLkOE=;
 b=rrvzQxnarPGkSAGqqXIu4wNxP7RxfyCBRSz7x1ycrNK2nSE5+YyybCSV+V7+3+/Q/A
 3MKSztWJOzrILeUasNVHUmNLVHr0/nM3DL8XSeXhQV6QLNdYT+pNPmZnXQdBh9V/GZi8
 LHHI1Wd4LiEpChE42sB7xK25ZpQwR80bLFBaCm4C7PNTGpjvcSzH+ls9THEyxiSk5vv9
 P8So08rbt3kLo4kUGISegwP5lY+JaUwoJJ0caUXkr24Ch/Y4bgU0L1KqFKIiqgglcG/5
 YlU08+HEWXPatEO1S2dQDu1D3snI20lHhEvdbtjCQC7267/svHiCJ6GKyqTuOBTEsWBd
 ilQA==
X-Gm-Message-State: APjAAAUtcErSN5cuZMfqP9EznNHjPCOSNk2hpdTWwyvzAuKJgB/iLNa5
 IBFF580K6Hc6qO2e9a0NjKHxAdkT1cI=
X-Google-Smtp-Source: APXvYqzyNg3sXHFnQDm+gajzHEmP+Sqmi0HVIhd7GKvcRWFfi/tYWvfUdKRE7PACl7E/z0xmll/zhg==
X-Received: by 2002:adf:f70f:: with SMTP id r15mr25585980wrp.262.1572891576303; 
 Mon, 04 Nov 2019 10:19:36 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id p12sm19639397wrm.62.2019.11.04.10.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 10:19:35 -0800 (PST)
Date: Mon, 4 Nov 2019 19:19:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Subject: Re: [PATCH] drm/doc: Adding VKMS module description and use to
 "Testing and Validation"
Message-ID: <20191104181933.GR10326@phenom.ffwll.local>
Mail-Followup-To: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
 outreachy-kernel@googlegroups.com, manasi.d.navare@intel.com,
 rodrigosiqueiramelo@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie,
 corbet@lwn.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
References: <20191101042706.2602-1-gabrielabittencourt00@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191101042706.2602-1-gabrielabittencourt00@gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qfg3/OhENOhgHzvHvbxDHTYQ7dgyHpgpR3Q3h/hLkOE=;
 b=fn+K0JebeyPggpWIrakbcYMmMywkz8WCAdLPRUAUoAtqIBUspiPN7tD3QProjEFSDP
 nLRQVnCWYlJKioXnZylDFjZ9CvozxWOKgd65NLtZqd17WmgPpSzRe+AzdbWMQMwiKEAh
 Qm0FkocWIVWPD+J6wOxMRhwzLkNS66oy4IFOE=
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
Cc: rodrigosiqueiramelo@gmail.com, corbet@lwn.net, airlied@linux.ie,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 manasi.d.navare@intel.com, outreachy-kernel@googlegroups.com,
 lkcamp@lists.libreplanetbr.org, dri-devel@lists.freedesktop.org,
 sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDE6Mjc6MDZBTSAtMDMwMCwgR2FicmllbGEgQml0dGVu
Y291cnQgd3JvdGU6Cj4gQWRkIGEgZGVzY3JpcHRpb24gb24gVktNUyBtb2R1bGUgYW5kIHRoZSBj
YXNlcyBpbiB3aGljaCBpdCBzaG91bGQgYmUgdXNlZC4KPiBUaGVyZSdzIGEgYnJpZWYgZXhwbGFu
YXRpb24gb24gaG93IHRvIHNldCBpdCBhbmQgdXNlIGl0IGluIGEgVk0sIGFsb25nIHdpdGgKPiBh
biBleGFtcGxlIG9mIHJ1bm5pbmcgYW4gaWd0LXRlc3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2Fi
cmllbGEgQml0dGVuY291cnQgPGdhYnJpZWxhYml0dGVuY291cnQwMEBnbWFpbC5jb20+Cj4gCj4g
LS0tCj4gCj4gSGkgRFJNLWNvbW11bml0eSwKPiB0aGlzIGlzIG15IGZpcnN0IChvZiBtYW55LCBJ
IGhvcGUpICBwYXRjaCBpbiB0aGlzIHN1YnN5c3RlbS4gSSBob3BlIHRvIGhhdmUKPiBhIGxvdCBv
ZiBsZWFybmluZyAoYW5kIGZ1biA6KSkgd29ya2luZyB3aXRoIHlvdSBndXlzLgo+IEknbSBzdGFy
dGluZyBieSBkb2N1bWVudGluZyB0aGUgVktNUyBkcml2ZXIgaW4gIlVzZXJsYW5kIGludGVyZmFj
ZXMiLCBpZiBJCj4gaGF2ZSBiZWVuIGluYWNjdXJhdGUgaW4gbXkgZGVzY3JpcHRpb24gb3IgaWYg
SSBtaXN1bmRlcnN0b29kIHNvbWUgY29uY2VwdCwKPiBwbGVhc2UgbGV0IG1lIGtub3cuCgpPaCBh
d2Vzb21lLCB0aGlzIHNvdW5kcyBncmVhdCwgcmVhbGx5IGxvb2tpbmcgZm9yIG1vcmUgcGVvcGxl
IGhhY2tpbmcgb24Kdmttcy4gRG9jcyBsZ3RtLCBidXQgSSdsbCBsZXQgU2lxdWVpcmEgaGF2ZSBh
IGxvb2sgYW5kIG1lcmdlIGl0LiBQbHMgcGluZwppbiBjYXNlIHRoaXMgcGF0Y2ggZ2V0cyBsb3N0
LgotRGFuaWVsCgoKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0IHwgMzgg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzgg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tdWFw
aS5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QKPiBpbmRleCA5NGY5MDUyMWY1
OGMuLjdkNmM4NmI3YWY3NiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tdWFw
aS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QKPiBAQCAtMjg1LDYg
KzI4NSw0NCBAQCBydW4tdGVzdHMuc2ggaXMgYSB3cmFwcGVyIGFyb3VuZCBwaWdsaXQgdGhhdCB3
aWxsIGV4ZWN1dGUgdGhlIHRlc3RzIG1hdGNoaW5nCj4gIHRoZSAtdCBvcHRpb25zLiBBIHJlcG9y
dCBpbiBIVE1MIGZvcm1hdCB3aWxsIGJlIGF2YWlsYWJsZSBpbgo+ICAuL3Jlc3VsdHMvaHRtbC9p
bmRleC5odG1sLiBSZXN1bHRzIGNhbiBiZSBjb21wYXJlZCB3aXRoIHBpZ2xpdC4KPiAgCj4gK1Vz
aW5nIFZLTVMgdG8gdGVzdCBEUk0gQVBJCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
Kwo+ICtWS01TIGlzIGEgc29mdHdhcmUtb25seSBtb2RlbCBvZiBhIEtNUyBkcml2ZXIgdGhhdCBp
cyB1c2VmdWwgZm9yIHRlc3RpbmcKPiArYW5kIGZvciBydW5uaW5nIGNvbXBvc2l0b3JzLiBWS01T
IGFpbXMgdG8gZW5hYmxlIGEgdmlydHVhbCBkaXNwbGF5IHdpdGhvdXQKPiArdGhlIG5lZWQgZm9y
IGEgaGFyZHdhcmUgZGlzcGxheSBjYXBhYmlsaXR5LiBUaGVzZSBjaGFyYWN0ZXJpc3RpY3MgbWFk
ZSBWS01TCj4gK2EgcGVyZmVjdCB0b29sIGZvciB2YWxpZGF0aW5nIHRoZSBEUk0gY29yZSBiZWhh
dmlvciBhbmQgYWxzbyBzdXBwb3J0IHRoZQo+ICtjb21wb3NpdG9yIGRldmVsb3Blci4gVktNUyBo
ZWxwcyB1cyB0byB0ZXN0IERSTSBjb3JlIGZ1bmN0aW9uIGluIGEgdmlydHVhbAo+ICttYWNoaW5l
LCB3aGljaCBtYWtlcyBpdCBlYXN5IHRvIHRlc3Qgc29tZSBvZiB0aGUgY29yZSBjaGFuZ2VzLgo+
ICsKPiArVG8gVmFsaWRhdGUgY2hhbmdlcyBpbiBEUk0gQVBJIHdpdGggVktNUywgc3RhcnQgc2V0
dGluZyB0aGUga2VybmVsLiBUaGUKPiArVktNUyBtb2R1bGUgaXMgbm90IGVuYWJsZWQgYnkgZGVm
YXV0LCBzbyBlbmFibGUgaXQgaW4gdGhlIG1lbnVjb25maWc6Ogo+ICsKPiArCSQgbWFrZSBtZW51
Y29uZmlnCj4gKwo+ICtDb21waWxlIHRoZSBrZXJuZWwgd2l0aCB0aGUgVktNUyBlbmFibGVkIGFu
ZCBpbnN0YWxsIGl0IGluIHRoZSB0YXJnZXQKPiArbWFjaGluZS4gVktNUyBjYW4gYmUgcnVuIGlu
IGEgVmlydHVhbCBNYWNoaW5lIChRRU1VLCB2aXJ0bWUgb3Igc2ltaWxhcikuCj4gK0l0J3MgcmVj
b21tZW5kZWQgdGhlIHVzZSBvZiBLVk0gd2l0aCB0aGUgbWluaW11bSBvZiAxR0Igb2YgUkFNIGFu
ZCBmb3VyCj4gK2NvcmVzLgo+ICsKPiArSXQncyBwb3NzaWJsZSB0byBydW4gdGhlIElHVC10ZXN0
cyBpbiBhIFZNIGluIHR3byB3YXlzOgo+ICsxLiBVc2UgSUdUIGluc2lkZSBhIFZNCj4gKzIuIFVz
ZSBJR1QgZnJvbSB0aGUgaG9zdCBtYWNoaW5lIGFuZCB3cml0ZSB0aGUgcmVzdWx0cyBpbiBhIHNo
YXJlZCBkaXJlY3RvcnkuCj4gKwo+ICtBcyBmb2xsb3csIHRoZXJlIGlzIGFuIGV4YW1wbGUgb2Yg
dXNpbmcgYSBWTSB3aXRoIGEgc2hhcmVkIGRpcmVjdG9yeSB3aXRoCj4gK3RoZSBob3N0IG1hY2hp
bmUgdG8gcnVuIGlndC10ZXN0cy4gQXMgZXhhbXBsZSBpdCdzIHVzZWQgdmlydG1lOjoKPiArCj4g
KwkkIHZpcnRtZS1ydW4gLS1yd2RpciAvcGF0aC9mb3Ivc2hhcmVkX2RpciAtLWtkaXI9cGF0aC9m
b3Iva2VybmVsL2RpcmVjdG9yeSAtLW1vZHM9YXV0bwo+ICsKPiArUnVuIHRoZSBpZ3QtdGVzdHMs
IGFzIGV4YW1wbGUgaXQncyByYW4gdGhlICdrbXNfZmxpcCcgdGVzdHM6Ogo+ICsKPiArCSQgL3Bh
dGgvZm9yL2lndC1ncHUtdG9vbHMvc2NyaXB0cy9ydW4tdGVzdHMuc2ggLXAgLXMgLXQgImttc19m
bGlwLioiIC12Cj4gKwo+ICtJbiB0aGlzIGV4YW1wbGUgaW5zdGVhZCBvZiBidWlsZCB0aGUgaWd0
X3J1bm5lciBpdCdzIHVzZWQgUGlnbGl0Cj4gKygtcCBvcHRpb24pOyBpdCdzIGNyZWF0ZWQgaHRt
bCBzdW1tYXJ5IG9mIHRoZSB0ZXN0cyByZXN1bHRzIGFuZCBpdCdzIHNhdmVkCj4gK2luIHRoZSBm
b2xkZXIgImlndC1ncHUtdG9vbHMvcmVzdWx0cyI7IGl0J3MgZXhlY3V0ZWQgb25seSB0aGUgaWd0
LXRlc3RzCj4gK21hdGNoaW5nIHRoZSAtdCBvcHRpb24uCj4gKwo+ICBEaXNwbGF5IENSQyBTdXBw
b3J0Cj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgCj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
