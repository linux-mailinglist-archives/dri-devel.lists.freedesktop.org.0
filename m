Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9FB2B4059
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 10:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B9389DD8;
	Mon, 16 Nov 2020 09:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EB589DD8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:58:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d142so23132881wmd.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 01:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iwpceZY1j98cSp2fjy3Tuny1yTyX2G0jni732iKitXE=;
 b=LnKit5YwSONJarUQgElc473djE2H14NhmA7p7SqJUu7DTp73UgBnHGrz/nEFL8tqO1
 jLild64akmtZRT1dp7BJw9eY+uxuT9bnlBZedTS6Rf+bFUcBZoWBJTMSsSsjWGEaOui8
 4qPtlT4uBCLOczmc3SD26yKrDCD/Q9pBxYjBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iwpceZY1j98cSp2fjy3Tuny1yTyX2G0jni732iKitXE=;
 b=HUy0VIGOs0fFYxNTenTd3XRXBQ4jcr368m9RvbfygJXr1lCeBNw//NM2eOQGknMaBO
 EJJlPfSGbt74+GdT1EHCVO4WlbBAnF+lJJ7+TpDWPfzEfw/XshfavVTxScvrS8hoasGu
 pCc00fjwgkmCLjCITBuEhEySkfJufY35apYHwaaTDl04MY2rVycxhcm3KbNns3fXaYFT
 FlAox+0oB5LUFvUC2vkogTzyadqcLbzcvv3+9ZptLhA+0nlVN/7hhQaU3FE/8kJwAVMj
 uplp5UP8QUGMdCez8EEkwGTB2WQgpmDRy/L9CDS8zjvOONtVnoWcaKGtWrn+K5zV8Wbz
 wWZg==
X-Gm-Message-State: AOAM531FehZM6NKs81R8zc75AQCKP9HTG+Wc5BCzV+Wp1o2kiz5Unm3H
 GBqlVz77aGJiTHhwb9yvFdtlyA==
X-Google-Smtp-Source: ABdhPJzyJHPC3SAjVSqWoHCbsix+ay+1rUc0is8EF/Psl3Y3/1na4haz+bG3YyBhVL0JiVcuXUFJ5g==
X-Received: by 2002:a05:600c:2ccb:: with SMTP id
 l11mr12245531wmc.65.1605520723393; 
 Mon, 16 Nov 2020 01:58:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v2sm21732697wrm.96.2020.11.16.01.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 01:58:42 -0800 (PST)
Date: Mon, 16 Nov 2020 10:58:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Message-ID: <20201116095840.GZ401619@phenom.ffwll.local>
References: <SN6PR11MB2558D831991447B9B5C8E646E2270@SN6PR11MB2558.namprd11.prod.outlook.com>
 <121f5f8df1e56294ade98f08a943b9fbb514c5e0.camel@gmail.com>
 <45960d1f-5304-1d5a-53fd-9896e4c322aa@suse.de>
 <2a46700700085e7e2588bb8120595968aae7f8a6.camel@gmail.com>
 <e70a2528-ae5a-f855-ae77-b0bb0a7239af@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e70a2528-ae5a-f855-ae77-b0bb0a7239af@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Deepak Rawat <drawat.floss@gmail.com>, "Jiang, Fei" <fei.jiang@intel.com>,
 "Huang, Yuanjun" <yuanjun.huang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tang,
 Shaofeng" <shaofeng.tang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMTUsIDIwMjAgYXQgMDc6NTg6MDBQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAxNS4xMS4yMCB1bSAxODo1NSBzY2hyaWViIERlZXBhayBS
YXdhdDoKPiA+IE9uIFN1biwgMjAyMC0xMS0xNSBhdCAxMDoxNCArMDEwMCwgVGhvbWFzIFppbW1l
cm1hbm4gd3JvdGU6Cj4gPj4gSGkgRGVlcGFrCj4gPj4KPiA+PiBBbSAxMS4wOS4yMCB1bSAwMjoz
OCBzY2hyaWViIERlZXBhayBSYXdhdDoKPiA+Pj4gT24gVGh1LCAyMDIwLTA5LTEwIGF0IDA4OjE5
ICswMDAwLCBUYW5nLCBTaGFvZmVuZyB3cm90ZToKPiA+Pj4+IEhpIERlZXBhaywKPiA+Pj4+IMKg
Cj4gPj4+PiBEbyB5b3UgaGF2ZSBhIG5ldyB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggbm93Pwo+ID4+
Pj4gSSB0YWtlIGEgdHJ5IHdpdGggaXQuIGFuZCBtZWV0IHNvbWUgdHlwbyBhbmQg4oCcaW5jb21w
YXRpYmxlCj4gPj4+PiBwb2ludGVy4oCdCj4gPj4+PiBlcnJvci4KPiA+Pj4+IElmIHlvdSBoYXZl
IGEgbmV3IHZlcnNpb24sIGNvdWxkIHlvdSBzaGFyZSBpdCB3aXRoIHVzPwo+ID4+Pj4KPiA+Pj4K
PiA+Pj4gSGkgU2hhb2ZlbmcsCj4gPj4+Cj4gPj4+IEl0IHNlZW1zIHlvdSBhcmUgcnVubmluZyB0
aGlzIHdpdGggZ2VuIDIgVk0sIEkgaGF2ZSBhIHBhdGNoIHRvCj4gPj4+IHN1cHBvcnQKPiA+Pj4g
Z2VuIDIgVk0ncyBhdCBodHRwczovL2dpdGh1Yi5jb20vZGVlcGFrLXJhd2F0L2xpbnV4LmdpdMKg
YnJhbmNoCj4gPj4+IGh5cGVydl90Cj4gPj4+IGlueS4KPiA+Pgo+ID4+IEknbSBpbnRlcmVzdGVk
IGluIG1lcmdpbmcgdGhpcyBkcml2ZXIgaW50byB0aGUgRFJNIHVwc3RyZWFtLiBXaGF0J3MKPiA+
PiB0aGUKPiA+PiBzdGF0dXM/IEFyZSB5b3Ugc3RpbGwgd29ya2luZyBvbiBpdD8KPiA+IAo+ID4g
SGkgVGhvbWFzLAo+ID4gCj4gPiBJIGFtIHdvcmtpbmcgb24gYWRkaW5nIGdlbjIgVk0gc3VwcG9y
dCBhbmQgY3Vyc29yIHN1cHBvcnQuIEFsc28gZm9yIG15Cj4gPiBuZXh0IGludGVyYXRpb24gbW92
aW5nIHRoZSBkcml2ZXIgb3V0IG9mIHRpbnkuIFByb2dyZXNzIGlzIHNsb3cgbGF0ZWx5Cj4gPiBh
cyBidXN5IHdpdGggb3RoZXIgc3R1ZmYgYXQgd29yay4gSG9wZWZ1bGx5IEkgd2lsbCBiZSBhYmxl
IHRvIGZpbmlzaAo+ID4gZHVyaW5nIGNvbWluZyBob2xpZGF5cy4KPiAKPiBJIHNlZS4gVGhhbmtz
IGZvciB0aGUgdXBkYXRlLiBJJ2Qgc3VnZ2VzdCB0byBjbGVhbiB1cCB3aGF0IHlvdSBoYXZlIGFu
ZAo+IHNlbmQgaXQgZm9yIHJldmlldy4gSGF2aW5nIGV2ZW4gYSBzaW1wbGUgZHJpdmVyIGluIHVw
c3RyZWFtIG1ha2VzIGl0IHNvCj4gbXVjaCBlYXNpZXIgZm9yIG90aGVycyB0byBjb250cmlidXRl
IGFuZCB5b3UnbGwgZ2V0IG1hbnkgb2YgdGhlIHVwc3RyZWFtCj4gaW1wcm92ZW1lbnRzIGF1dG9t
YXRpY2FsbHkuCgpTZWNvbmRlZCwgb25jZSB3ZSBoYXZlIHNvbWUgYmFzaWNzIChsaWtlIGdlbjEg
b25seSwgbm8gY3Vyc29yIHN1cHBvcnQpCmxhbmRpbmcgaW5jcmVtZW50YWwgY2hhbmdlcyB0ZW5k
cyB0byBiZSBtdWNoIGVhc2llciB0aGFuIHRoZSBpbml0aWFsCmRyaXZlci4KClNvIGFkZGluZyBt
b3JlIGZlYXR1cmVzIGFuZCB0cnlpbmcgdG8gbWFrZSBpdCBhcyBjb21wbGV0ZSBhcyBwb3NzaWJs
ZQpiZWZvcmUgeW91IHdhbnQgdG8gbGFuZCBpdCBtaWdodCBqdXN0IGJlIGRldHJpbWluYWwgdG8g
b3ZlcmFsbCB1cHN0cmVhbWluZwpzcGVlZC4gVXN1YWxseSBhdCBsZWFzdC4KCkNoZWVycywgRGFu
aWVsCgo+IAo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+IAo+ID4gCj4gPiBEZWVwYWsKPiA+IAo+
ID4+Cj4gPj4gQmVzdCByZWdhcmRzCj4gPj4gVGhvbWFzCj4gPj4KPiA+Pj4KPiA+Pj4gSWYgeW91
IHN0aWxsIHJ1biBpbnRvIGVycm9yIGFmdGVyIGFwcGx5aW5nIGdlbjIgcGF0Y2gsIGZlZWwgZnJl
ZSB0bwo+ID4+PiByZWFjaCBvdXQgd2l0aCBkZXRhaWxzLgo+ID4+Pgo+ID4+PiBEZWVwYWsKPiA+
Pj4KPiA+Pj4+IMKgCj4gPj4+PiBCUiwgU2hhb2ZlbmcKPiA+Pj4KPiA+Pj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+Pj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+ID4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPj4+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gPj4+
Cj4gPj4KPiA+IAo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKPiA+IAo+IAo+IC0tIAo+IFRob21hcyBaaW1tZXJtYW5uCj4g
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcgo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSAo+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQo+IChIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykKPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJm
ZmVyCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
