Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8F3D6628
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 17:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BF989DA7;
	Mon, 14 Oct 2019 15:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E79E89DA7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 15:33:33 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a15so15190524edt.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 08:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=w9mlgI2kR839Z5/4gH9FpOIFXEfNmboTdDmci4yowm8=;
 b=k66UbSnYtShASTV9dEgtihSXDCgthZZaQ/bVbcpRQTTKv3UfDiLHvBUSJs1V6/bH5v
 ErMdyvIOuqPbqdNwmjmLsy+S+S2iXAHJOCyOk1zyEo866my48QDmaLOUGPceZ61MMb7P
 QikRpY9S3cWtTDR5/99E1l7FfMOIQTcMGDSggyxsIqaq90ekM9CwvRwSOBwQC5BybtEM
 Io0hqUObzhqHlxmB+AW42bcGVuGN6F8GBuPJYHCtQxYeKRjgxY7xsQyNfvxWzM3SLCfP
 Qdl8YoYjo9RnOWGhtYuNvjLeicz/xPQ646Tj58+KUOEf4b3N95qlmIXZ8ZijtLIZbrfJ
 Sx4Q==
X-Gm-Message-State: APjAAAVkQCXByaB9GcrqSA9FY/C39H24V3amGf4XGdTVoC+t/HGcKBW3
 ckHRemNOEG5T892cclPVFzMf2Q==
X-Google-Smtp-Source: APXvYqzZcsbz6zCpy73n7rhQtamC1Ycdf9UyLjYi1OUVk/a9VHHjnxKszGDz64+a9FPgQ9SaIDgJIg==
X-Received: by 2002:aa7:dd18:: with SMTP id i24mr29588611edv.239.1571067211516; 
 Mon, 14 Oct 2019 08:33:31 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z20sm3235235edb.3.2019.10.14.08.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 08:33:30 -0700 (PDT)
Date: Mon, 14 Oct 2019 17:33:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Message-ID: <20191014153327.GL11828@phenom.ffwll.local>
Mail-Followup-To: "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, 
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>, nd <nd@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Oscar Zhang (Arm Technology China)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
 "Channing Chen (Arm Technology China)" <Channing.Chen@arm.com>,
 "Yiqi Kang (Arm Technology China)" <Yiqi.Kang@arm.com>,
 "Thomas Sun (Arm Technology China)" <thomas.Sun@arm.com>,
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
References: <20191011054240.17782-1-james.qian.wang@arm.com>
 <20191011054240.17782-2-james.qian.wang@arm.com>
 <20191014085605.GF11828@phenom.ffwll.local>
 <20191014095813.GA15227@jamwan02-TSP300>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014095813.GA15227@jamwan02-TSP300>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=w9mlgI2kR839Z5/4gH9FpOIFXEfNmboTdDmci4yowm8=;
 b=XBpnqvo/R+SLAG7D0cXXtujk7Wn+hKWHZlRrLXhUr7SQJ0NqAEJG4I4+VDKgVFKG4I
 S9moF74zaFswuasxTslog93qudtZdAL6ALRRP80j125m0eqnUZygTij90BgJ/RfCxTFQ
 /jTM/I23xTFE4LpqaEb5GAC+L34qdaXaluD0Y=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDk6NTg6MjBBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gTW9uLCBPY3QgMTQsIDIwMTkgYXQg
MTA6NTY6MDVBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIEZyaSwgT2N0IDEx
LCAyMDE5IGF0IDA1OjQzOjA5QU0gKzAwMDAsIGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiBBZGQgYSBuZXcgaGVscGVyIGZ1bmN0aW9uIGRybV9jb2xv
cl9jdG1fczMxXzMyX3RvX3FtX24oKSBmb3IgZHJpdmVyIHRvCj4gPiA+IGNvbnZlcnQgUzMxLjMy
IHNpZ24tbWFnbml0dWRlIHRvIFFtLm4gMidzIGNvbXBsZW1lbnQgdGhhdCBzdXBwb3J0ZWQgYnkK
PiA+ID4gaGFyZHdhcmUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IGphbWVzIHFpYW4gd2Fu
ZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPiA+ID4g
LS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYyB8IDIzICsrKysrKysr
KysrKysrKysrKysrKysrCj4gPiA+ICBpbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oICAgICB8
ICAyICsrCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPiA+ID4KPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMKPiA+ID4gaW5kZXggNGNlNWM2ZDhkZTk5Li4zZDUz
M2QwYjQ1YWYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdt
dC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4gPiA+IEBA
IC0xMzIsNiArMTMyLDI5IEBAIHVpbnQzMl90IGRybV9jb2xvcl9sdXRfZXh0cmFjdCh1aW50MzJf
dCB1c2VyX2lucHV0LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKQo+ID4gPiAgfQo+ID4gPiAgRVhQ
T1JUX1NZTUJPTChkcm1fY29sb3JfbHV0X2V4dHJhY3QpOwo+ID4gPgo+ID4gPiArLyoqCj4gPiA+
ICsgKiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uCj4gPiA+ICsgKgo+ID4gPiArICogQHVz
ZXJfaW5wdXQ6IGlucHV0IHZhbHVlCj4gPiA+ICsgKiBAbTogbnVtYmVyIG9mIGludGVnZXIgYml0
cwo+ID4gPiArICogQG46IG51bWJlciBvZiBmcmFjdGluYWwgYml0cwo+ID4gPiArICoKPiA+ID4g
KyAqIENvbnZlcnQgYW5kIGNsYW1wIFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0byBRbS5uIDIncyBj
b21wbGVtZW50Lgo+ID4KPiA+IFdoYXQncyB0aGUgUSBtZWFuaW5nIGhlcmU/IEFsc28gbWF5YmUg
c3BlY2lmeSB0aGF0IHRoZSBoaWdoZXIgYml0cyBhYm92ZQo+ID4gbStuIGFyZSBjbGVhcmVkIHRv
IGFsbCAwIG9yIGFsbCAxLiBVbml0IHRlc3Qgd291bGQgYmUgbG92ZWx5IHRvby4gQW55d2F5Ogo+
IAo+IFRoZSBRIHVzZWQgdG8gcmVwcmVzZW50IHNpZ25lZCB0d28ncyBjb21wbGVtZW50Lgo+IAo+
IEZvciBkZXRhaWw6IGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL1FfKG51bWJlcl9mb3Jt
YXQpCj4gCj4gQW5kIGl0IFEgaXMgMidzIGNvbXBsZW1lbnQsIHNvIHRoZSB2YWx1ZSBvZiBoaWdo
ZXIgYml0IGVxdWFsIHRvCj4gc2lnbi1iaXQuCj4gQWxsIDEgaWYgaXQgaXMgbmVnYXRpdmUKPiAw
IGlmIGl0IGlzIHBvc2l0aXZlLgoKQWggSSBkaWRuJ3Qga25vdyBhYm91dCB0aGlzIG5vdGF0aW9u
LCBJIHRoaW5rIGluIG90aGVyIGRybSBkb2NzIHdlIGp1c3QKdXNlZCBtLm4gMidzIGNvbXBsZW1l
bnQgdG8gZGVub3RlIHRoaXMgbGF5b3V0LiBVcCB0byB5b3UgSSB0aGluay4KLURhbmllbAoKPiAK
PiBKYW1lcwo+IAo+ID4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+Cj4gPgo+ID4gPiArICovCj4gPiA+ICt1aW50NjRfdCBkcm1fY29sb3JfY3RtX3Mz
MV8zMl90b19xbV9uKHVpbnQ2NF90IHVzZXJfaW5wdXQsCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50MzJfdCBtLCB1aW50MzJfdCBuKQo+ID4gPiArewo+ID4gPiAr
ICAgdTY0IG1hZyA9ICh1c2VyX2lucHV0ICYgfkJJVF9VTEwoNjMpKSA+PiAoMzIgLSBuKTsKPiA+
ID4gKyAgIGJvb2wgbmVnYXRpdmUgPSAhISh1c2VyX2lucHV0ICYgQklUX1VMTCg2MykpOwo+ID4g
PiArICAgczY0IHZhbDsKPiA+ID4gKwo+ID4gPiArICAgLyogdGhlIHJhbmdlIG9mIHNpZ25lZCAy
cyBjb21wbGVtZW50IGlzIFstMl5uK20sIDJebittIC0gMV0gKi8KPiA+ID4gKyAgIHZhbCA9IGNs
YW1wX3ZhbChtYWcsIDAsIG5lZ2F0aXZlID8gQklUKG4gKyBtKSA6IEJJVChuICsgbSkgLSAxKTsK
PiA+ID4gKwo+ID4gPiArICAgcmV0dXJuIG5lZ2F0aXZlID8gMGxsIC0gdmFsIDogdmFsOwo+ID4g
PiArfQo+ID4gPiArRVhQT1JUX1NZTUJPTChkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKTsK
PiA+ID4gKwo+ID4gPiAgLyoqCj4gPiA+ICAgKiBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdCAt
IGVuYWJsZSBjb2xvciBtYW5hZ2VtZW50IHByb3BlcnRpZXMKPiA+ID4gICAqIEBjcnRjOiBEUk0g
Q1JUQwo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKPiA+ID4gaW5kZXggZDFjNjYyZDkyYWI3Li42MGZl
YTU1MDE4ODYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgK
PiA+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaAo+ID4gPiBAQCAtMzAsNiAr
MzAsOCBAQCBzdHJ1Y3QgZHJtX2NydGM7Cj4gPiA+ICBzdHJ1Y3QgZHJtX3BsYW5lOwo+ID4gPgo+
ID4gPiAgdWludDMyX3QgZHJtX2NvbG9yX2x1dF9leHRyYWN0KHVpbnQzMl90IHVzZXJfaW5wdXQs
IHVpbnQzMl90IGJpdF9wcmVjaXNpb24pOwo+ID4gPiArdWludDY0X3QgZHJtX2NvbG9yX2N0bV9z
MzFfMzJfdG9fcW1fbih1aW50NjRfdCB1c2VyX2lucHV0LAo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdWludDMyX3QgbSwgdWludDMyX3Qgbik7Cj4gPiA+Cj4gPiA+ICB2
b2lkIGRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQgZGVnYW1tYV9sdXRfc2l6ZSwKPiA+
ID4gLS0KPiA+ID4gMi4yMC4xCj4gPiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+ID4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+ID4KPiA+IC0tCj4gPiBEYW5p
ZWwgVmV0dGVyCj4gPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiA+IGh0
dHA6Ly9ibG9nLmZmd2xsLmNoCj4gSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRo
aXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxz
byBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBw
bGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0
aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwg
b3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91
Lgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
