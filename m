Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A616125F584
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BFB6E3D3;
	Mon,  7 Sep 2020 08:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5466E3D3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:41:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z9so13366903wmk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=HQcAzxe0m5GYzw5qtNvRSAepIT1XJpeAHxrax6yA2LI=;
 b=EztuowMVfVstMIo3LOGngn1+4XHh3nEkdwtiZZ1MOUzovPFVGGLiRtKA2b4417dWCP
 7lGcJwyUyiGiiU0Lf52vVcJXs5pjVDDOFbxjZm6omK1QpMhhmsklQA3c4z3bkuFi6bCU
 kn9a5IdRn6RfPRwQxnkJY/7eSGs16BJrREFj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HQcAzxe0m5GYzw5qtNvRSAepIT1XJpeAHxrax6yA2LI=;
 b=WnmpJy9Ash+VHUyadv35MJt5rho/YZilioNAut9tWwXw+G9UaqEGwZ7Ie0VD3eQb6D
 rW7lRQ6HHsY2T3h15EzY/7ujmNrsYnZ5TsHWfrOkIlq/A/8d0VEgHCB2Wb98BuSuoOgj
 wfAG/KQU88skENc/UL6TmA7XTu3tQyePNO+pMgXn/NT53JBwbT0PQqTsLIEe52o0DLSm
 nhtfd3DfM9XacnWLN3mNtqLSp2WG9InTt2c0ZcTNutDX6oGxt1RVJoqLb0ZMJfYI24n7
 CpCKmn7QrbbR/iDJLZVQBJXC4lBJeEZKnzb3ovhL8ouGwbnZbFfSPCV9oIHkUmlWexeg
 yg/A==
X-Gm-Message-State: AOAM5306UYoRIzW3oBC7wdALso2qcjTSkB0hss0+mvbVdMkpAZTWN80z
 u3ISvSdScb/Ayo0Qx70rH38ARg==
X-Google-Smtp-Source: ABdhPJxaTGwsOfOrKSPmTx3GbenFC1xBPGhYpFFgzhgBrQUhXw+4aDziwIu8ROwFIvD+Qhv0HOjDOw==
X-Received: by 2002:a1c:bcd4:: with SMTP id m203mr19487534wmf.75.1599468099876; 
 Mon, 07 Sep 2020 01:41:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k22sm27542889wrd.29.2020.09.07.01.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:41:39 -0700 (PDT)
Date: Mon, 7 Sep 2020 10:41:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required for
 fb
Message-ID: <20200907084137.GU2352366@phenom.ffwll.local>
References: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
 <t3hHLqZ0yNm5FdxpyJovgjEVzs-OD7qD5nYrYXug8UhkBykhekB0_hOqPltEvFH3daJ3HYtY_3FInv3U5xIHprg1FS7b2SP8fCf48r7DvVg=@emersion.fr>
 <CAKMK7uFztTjjvQvM-toeZv3hps+NMJFXV7s=Dzs5PwG3J+7wjw@mail.gmail.com>
 <ap5W_r98yx5DpM1jFkrof6yWGWPtxbyObFp3iIP1-hm-SD_-Jij72KZK2VhVV2p-34EqdVE6T1JeW4zAgjnNsxv_CtULfvg2ASY3xECXMuY=@emersion.fr>
 <CAKMK7uGs2vQNf1+=4spQV4aCncOPE4+E7g95xqZ7kcD8pp5bTg@mail.gmail.com>
 <55Yt-xRb-j_BnxyoixpIT6a4aOd2-SMetoyIVRBwOBFc98R5A3-gAcYcFo5Sjj-7TcvLdy3669gwn5eCOoOi85A2MlZaUwqpQETei77426A=@emersion.fr>
 <20200907083133.GS2352366@phenom.ffwll.local>
 <jjQkalouYz08npkZ2r2MPoXoGML4DkABCtPEZYJkHgR9dGOQCcICe_oq_rpBVnzkpxK4SwDXY9gF8zlhfMWqiWoHHpP5N08nUmo-tA3jIW4=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <jjQkalouYz08npkZ2r2MPoXoGML4DkABCtPEZYJkHgR9dGOQCcICe_oq_rpBVnzkpxK4SwDXY9gF8zlhfMWqiWoHHpP5N08nUmo-tA3jIW4=@emersion.fr>
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
Cc: Daniel Stone <daniels@collabora.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDcsIDIwMjAgYXQgMDg6Mzc6MzFBTSArMDAwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IE9uIE1vbmRheSwgU2VwdGVtYmVyIDcsIDIwMjAgMTA6MzEgQU0sIERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gCj4gPiBPbiBXZWQsIFNlcCAwMiwgMjAyMCBhdCAw
Mjo1OTo0OVBNICswMDAwLCBTaW1vbiBTZXIgd3JvdGU6Cj4gPgo+ID4gPiBPbiBXZWRuZXNkYXks
IFNlcHRlbWJlciAyLCAyMDIwIDQ6MjkgUE0sIERhbmllbCBWZXR0ZXIgZGFuaWVsLnZldHRlckBm
ZndsbC5jaCB3cm90ZToKPiA+ID4KPiA+ID4gPiBPbiBXZWQsIFNlcCAyLCAyMDIwIGF0IDI6NDkg
UE0gU2ltb24gU2VyIGNvbnRhY3RAZW1lcnNpb24uZnIgd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+
IE9uIFdlZG5lc2RheSwgU2VwdGVtYmVyIDIsIDIwMjAgMjo0NCBQTSwgRGFuaWVsIFZldHRlciBk
YW5pZWwudmV0dGVyQGZmd2xsLmNoIHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBJIHN1
cHBvc2Ugc29tZXRoaW5nIHNpbWlsYXIgaGFwcGVucyBpbiB1c2VyLXNwYWNlOiBnYm1fYm9fY3Jl
YXRlCj4gPiA+ID4gPiA+ID4gd2l0aG91dCBtb2RpZmllcnMgbmVlZHMgdG8gcHJvcGVybHkgc2V0
IHRoZSBpbXBsaWNpdCBtb2RpZmllciwgaWUuCj4gPiA+ID4gPiA+ID4gZ2JtX2JvX2dldF9tb2Rp
ZmllciBuZWVkcyB0byByZXR1cm4gdGhlIGVmZmVjdGl2ZSBtb2RpZmllci4gSXMgdGhpcwo+ID4g
PiA+ID4gPiA+IHNvbWV0aGluZyBhbHJlYWR5IGRvY3VtZW50ZWQ/Cj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IEkgZG9uJ3QgdGhpbmsgdGhhdCBoYXBwZW5zLCBidXQgaXQgaGFzIGNvbWUgdXAgaW4g
ZGlzY3Vzc2lvbnMuIEl0J3MKPiA+ID4gPiA+ID4ga2luZGEgZGlmZmVyZW50IHNjZW5hcmlvIHRo
b3VnaDogZ2V0ZmIyIGlzIGZvciBjcm9zcy1jb21wb3NpdG9yIHN0dWZmLAo+ID4gPiA+ID4gPiBl
bmFibGluZyBzbW9vdGggdHJhbnNpdGlvbnMgYXQgYm9vdC11cCBhbmQgd2hlbiBzd2l0Y2hpbmcu
IFNvIHlvdSBoYXZlCj4gPiA+ID4gPiA+IGEgbGVnaXQgcmVhc29uIGZvciBtaXhpbmcgbW9kaWZp
ZXItYXdhcmUgdXNlcnNwYWNlIHdpdGgKPiA+ID4gPiA+ID4gbm9uLW1vZGlmaWVyLWF3YXJlIHVz
ZXJzcGFjZS4gQW5kIHRoZSBtb2RpZmllci1hd2FyZSB1c2Vyc3BhY2Ugd291bGQKPiA+ID4gPiA+
ID4gbGlrZSB0aGF0IGV2ZXJ5dGhpbmcgd29ya3Mgd2l0aCBtb2RpZmllcnMgY29uc2lzdGVudGx5
LCBpbmNsdWRpbmcKPiA+ID4gPiA+ID4gZ2V0ZmIyLiBCdXQgZ2JtIGlzIGp1c3Qgd2l0aGluIGEg
c2luZ2xlIHByb2Nlc3MsIGFuZCB0aGF0IHNob3VsZAo+ID4gPiA+ID4gPiBlaXRoZXIgcnVuIGFs
bCB3aXRoIG1vZGlmaWVycywgb3Igbm90IGF0IGFsbCwgc2luY2UgdGhlc2Ugd29ybGRzIGp1c3QK
PiA+ID4gPiA+ID4gZG9udCBtaXggd2VsbC4gSGVuY2UgSSdtIG5vdCBzZWVpbmcgbXVjaCB1c2Ug
Zm9yIHRoYXQsIC1tb2Rlc2V0dGluZwo+ID4gPiA+ID4gPiBiZWluZyBhIGNvbmZ1c2VkIG1lc3Mg
bm9ud2l0aHN0YW5kaW5nIDotKQo+ID4gPiA+ID4KPiA+ID4gPiA+IFdlbGzigKYgVGhlcmUncyBh
bHNvIHRoZSBjYXNlIHdoZXJlIHNvbWUgbGVnYWN5IFdheWxhbmQgY2xpZW50IHRhbGtzIHRvIGEK
PiA+ID4gPiA+IG1vZGlmaWVyLWF3YXJlIGNvbXBvc2l0b3IuIGdibV9ib19pbXBvcnQgd291bGQg
YmUgY2FsbGVkIHdpdGhvdXQgYQo+ID4gPiA+ID4gbW9kaWZpZXIsIGJ1dCB0aGUgY29tcG9zaXRv
ciBleHBlY3RzIGdibV9ib19nZXRfbW9kaWZpZXIgdG8gd29yay4KPiA+ID4gPiA+IEFsc28sIHds
cm9vdHMgd2lsbCBjYWxsIGdibV9ib19jcmVhdGUgd2l0aG91dCBhIG1vZGlmaWVyIHRvIG9ubHkg
bGV0Cj4gPiA+ID4gPiB0aGUgZHJpdmVyIHBpY2sgInNhZmUiIG1vZGlmaWVycyBpbiBjYXNlIHBh
c3NpbmcgdGhlIGZ1bGwgbGlzdCBvZgo+ID4gPiA+ID4gbW9kaWZpZXJzIHJlc3VsdHMgaW4gYSBi
bGFjayBzY3JlZW4uIExhdGVyIG9uIHdscm9vdHMgd2lsbCBjYWxsCj4gPiA+ID4gPiBnYm1fYm9f
Z2V0X21vZGlmaWVyIHRvIGZpZ3VyZSBvdXQgd2hhdCBtb2RpZmllciB0aGUgZHJpdmVyIHBpY2tl
ZC4KPiA+ID4gPgo+ID4gPiA+IGdibV9ib19pbXBvcnQgaXMgYSBkaWZmZXJlbnQgdGhpbmcgZnJv
bSBnYm1fYm9fY3JlYXRlLiBGb3JtZXIgSSBhZ3JlZQo+ID4gPiA+IHNob3VsZCBmaWd1cmUgb3V0
IHRoZSByaWdodCBtb2RpZmllcnMgKGFuZCBJIHRoaW5rIGl0IGRvZXMgdGhhdCwgYXQKPiA+ID4g
PiBsZWFzdCBvbiBpbnRlbCBtZXNhKS4gRm9yIGdibV9ib19jcmVhdGUgSSdtIG5vdCBzdXJlIHdl
IHNob3VsZC9uZWVkIHRvCj4gPiA+ID4gcmVxdWlyZSB0aGF0Lgo+ID4gPgo+ID4gPiBJIGd1ZXNz
IHRoZSBjb21wb3NpdG9yIHdpbGwganVzdCBmb3J3YXJkIHRoZSB2YWx1ZSByZXR1cm5lZCBieQo+
ID4gPiBnYm1fYm9fZ2V0X21vZGlmaWVyIGluIGFueSBjYXNlLCBzbyByZXR1cm5pbmcgSU5WQUxJ
RCB3b3VsZCBiZSBmaW5lCj4gPiA+IHRvbyAodG8gbWVhbiAiaW1wbGljaXQgbW9kaWZpZXIiKS4K
PiA+ID4gSW4gYm90aCB0aGUgY3JlYXRlIGFuZCBpbXBvcnQgY2FzZXMsIG90aGVyIG1ldGFkYXRh
IGxpa2UgcGl0Y2hlcyBhbmQKPiA+ID4gb2Zmc2V0cyBzaG91bGQgYmUgY29ycmVjdGx5IHNldCBJ
IHRoaW5rPwo+ID4KPiA+IFdlbGwgaWYgeW91IGhhdmUgYSBtb2RpZmllciBmb3JtYXQgdW5kZXJu
ZWF0aCwgdGhlIG5vbi1tb2RpZmllcmVkIG9mZnNldHMKPiA+IGFuZCBwaXRjaGVzIG1pZ2h0IGJl
IHB1cmUgZmljdGlvbi4gQWxzbywgdGhleSBtaWdodCBub3QgYmUgc3VmZmljaWVudCwgaWYKPiA+
IHRoZSBtb2RpZmllciBhZGRzIG1vcmUgcGxhbmVzLgo+IAo+IEluIHRoaXMgY2FzZSAoZ2JtX2Jv
X2NyZWF0ZSB3aXRob3V0IG1vZGlmaWVycyksIHdlJ3JlIGRpc2N1c3NpbmcKPiB3aGV0aGVyIHdl
IHJlcXVpcmUgZ2JtX2JvX2dldF9tb2RpZmllciB0byByZXR1cm4gYSB2YWxpZCBtb2RpZmllciwg
b3IKPiBpZiBJTlZBTElEIGlzIGZpbmUuCgpIbSB0aGVuIEkgbWlzc2VkIHRoZSB1c2UtY2FzZSBm
b3IgYSBnYm1fYm9fY3JlYXRlIHdpdGhvdXQgbW9kaWZpZXJzLCB3aGVyZQphZnRlcndhcmRzIHVz
ZXJzcGFjZSB3YW50cyB0aGUgbW9kaWZpZXJzLiBUaGF0IHNvdW5kcyBsaWtlIGEgYnVnIChhbmQg
eWVzCi1tb2Rlc2V0dGluZyBpcyBidWdneSB0aGF0IHdheSkuCi1EYW5pZWwKCj4gPiBTbyBJJ20g
bm90IHN1cmUgaG93IHdlIGNhbiBsZXQgdGhlICJpbXBsaWNpdCBtb2RpZmllciIgZ28gdGhyb3Vn
aCBvbmNlIGEKPiA+IHN0YWNrIGlzIGNvbnZlcnRlZCB0byBzdXBwb3J0IG1vZGlmaWVycy4gSW4g
YSB3YXkgbW9kaWZpZXJzIGFyZSBvbmUtd2F5Cj4gPiBjb21wYXRpYmxlIG9ubHk6IGltcGxpY2l0
IG1vZGlmaWVycyAtPiBleHBsaWNpdCBtb2RpZmllcnMgc2hvdWxkIGJlCj4gPiB3ZWxsLWRlZmlu
ZWQsIHRoZSBvdGhlciB3YXkganVzdCBsb29zZXMgaW5mb3JtYXRpb24gYW5kIGRvZXNuJ3Qgd29y
ay4KPiAKPiBUaGF0IG1ha2VzIHNlbnNlIHRvIG1lLCBhbmQgc3RpbGwgd29ya3MgZmluZSB3aXRo
IHRoZSB0d28gdXNlLWNhc2VzCj4gb3V0bGluZWQgYWJvdmUuCgotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
