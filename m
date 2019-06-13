Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031D43414
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 10:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F5D897F5;
	Thu, 13 Jun 2019 08:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B123D897F5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 08:23:51 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z25so29950143edq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 01:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=Bn9xqnDM/Ok90ZnjEVBJg4kKO4htMBt6EOE/1PNGbnY=;
 b=JTdNooAY5Hgb20NK+dxpqZRQ86+RZVCSWcxq+AYnoRy94ZHPp+ks0MEfNAyfFAJ6ZO
 HyETMkrX/KILSa3hfqCOVd644knOD2MMM2QtrJ3Q4jQI8++lpqbEz16EeJYm+mpexOVR
 ViMSnUhqoT2XPyQazQ5AamtwlV48tqIJutuRGShpC7CMt5/5rYSK+MlM6zSqSCsmaGxo
 nl9qnd2XKudpW3keY8gw1aK/ruDOC64bKwmZ+LP700IlFlQwxtdNNQExJPJzhuftHG16
 79bHxRyT/iYTps0Ztp8QYV4k7D1ESrzoa5QLhyuHy84bwPvXVh6VIc6L3tT7TKByqIby
 nFUg==
X-Gm-Message-State: APjAAAXOMhRIO86dTdjMqEBa3m/yXd+zMgxEgviOhVrrYQ6Trph3nE5n
 oCf4j+jpkESpHowK5aAC6p+gGQ==
X-Google-Smtp-Source: APXvYqwxpvYDtacITPIdTW/7to+7XC+PPO1+2atPD+W6vFoXNBpF2kvJ27BXQ7Kw1crdOAPDQ9j4Lg==
X-Received: by 2002:a50:d1d8:: with SMTP id i24mr87310538edg.57.1560414230421; 
 Thu, 13 Jun 2019 01:23:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a3sm669461edr.48.2019.06.13.01.23.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 01:23:49 -0700 (PDT)
Date: Thu, 13 Jun 2019 10:23:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix compilation error
Message-ID: <20190613082346.GH23020@phenom.ffwll.local>
Mail-Followup-To: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Tony Cheng <tony.cheng@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Charlene Liu <charlene.liu@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>,
 Gloria Li <geling.li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190613023208.GA29690@hari-Inspiron-1545>
 <CADnq5_PU_jvOskC-=+oRQdvYXZvu_n26ogoWTxLRxnW+ke4wDw@mail.gmail.com>
 <20190613024854.GA25104@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613024854.GA25104@hari-Inspiron-1545>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=Bn9xqnDM/Ok90ZnjEVBJg4kKO4htMBt6EOE/1PNGbnY=;
 b=Tx4JYWhFEQ4paC9UQ1Ati/km78v81wLDRhSY/EalqBBnEClwSXCW9SqfMkR5Vrt97P
 asT6jG34nVFATlS4QY9GC03yFsuX84G1WiY/34dLIHU4OzW53IBMnx5nM3J8Q9aRFyxv
 ibza93j6ghZQ06OAwkUKXmZmbeAEPcVcyZX8Q=
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
Cc: linux-kernel@vger.kernel.org, Yongqiang Sun <yongqiang.sun@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 Gloria Li <geling.li@amd.com>, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Tony Cheng <tony.cheng@amd.com>, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDg6MTg6NTRBTSArMDUzMCwgSGFyaXByYXNhZCBLZWxh
bSB3cm90ZToKPiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAxMDozNToyNlBNIC0wNDAwLCBBbGV4
IERldWNoZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAxMDozNCBQTSBIYXJp
cHJhc2FkIEtlbGFtCj4gPiA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiB0aGlzIHBhdGNoIGZpeGVzIGJlbG93IGNvbXBpbGF0aW9uIGVycm9yCj4gPiA+Cj4g
PiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBf
aHdfc2VxdWVuY2VyLmM6IEluCj4gPiA+IGZ1bmN0aW9uIOKAmGRjbjEwX2FwcGx5X2N0eF9mb3Jf
c3VyZmFjZeKAmToKPiA+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9k
Yy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYzoyMzc4OjM6Cj4gPiA+IGVycm9yOiBpbXBsaWNp
dCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJh1ZGVsYXnigJkKPiA+ID4gWy1XZXJyb3I9aW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gPiA+ICAgIHVkZWxheSh1bmRlcmZsb3dfY2hl
Y2tfZGVsYXlfdXMpOwo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBIYXJpcHJhc2FkIEtlbGFt
IDxoYXJpcHJhc2FkLmtlbGFtQGdtYWlsLmNvbT4KPiA+IAo+ID4gV2hhdCBicmFuY2ggaXMgdGhp
cyBwYXRjaCBiYXNlZCBvbj8KPiA+IAo+ID4gQWxleAo+IAo+IEhpIEFsZXgsCj4gCj4gSXQgaXMg
b24gbGludXgtbmV4dAoKZHJtLW1pc2MtbmV4dCBoYXMgU2FtJ3MgaGVhZGVyIGNsZWFudXAuIEkg
Z3Vlc3Mgd2UgcHVsbCBsaW51eC9kZWxheS5oIGluCmltcGxpY2l0bHkgc29tZXdoZXJlLCBidXQg
bm90IGZvciBhbGwgY29uZmlncy4KLURhbmllbAoKPiAKPiBUaGFua3MsCj4gSGFyaXByYXNhZCBr
Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2Rj
bjEwX2h3X3NlcXVlbmNlci5jIHwgMSArCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwo+ID4gPiBpbmRleCBkMjM1Mjk0OS4u
MWFjOWE0ZiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwo+ID4gPiBAQCAtMjMsNiAr
MjMsNyBAQAo+ID4gPiAgICoKPiA+ID4gICAqLwo+ID4gPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4
L2RlbGF5Lmg+Cj4gPiA+ICAjaW5jbHVkZSAiZG1fc2VydmljZXMuaCIKPiA+ID4gICNpbmNsdWRl
ICJjb3JlX3R5cGVzLmgiCj4gPiA+ICAjaW5jbHVkZSAicmVzb3VyY2UuaCIKPiA+ID4gLS0KPiA+
ID4gMi43LjQKPiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiA+ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+ID4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
