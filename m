Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D725F544
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E9B6E26F;
	Mon,  7 Sep 2020 08:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A596E26F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:31:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l9so13325811wme.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ySsNtcs5UcFSTPwIzIvCIudN0fz1lYf569K/MGAFkmg=;
 b=efCQLB2jOpSJOD5U616iCYxr1SeEkKFwPOAjnkKLmA8daA4ShO1HgSZlaWDlbPmaxG
 0k3nF3WJvw5e+g7EsXn+Ji8/F51m1wA1PukyuB5obU58HkLR2kNZNvzxnXpqlOkumTCZ
 +6ln6AUJ/t8bVypI4bM57aUst+rzi8Ivi3XiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ySsNtcs5UcFSTPwIzIvCIudN0fz1lYf569K/MGAFkmg=;
 b=lfUXCbr8RVvS50nrw6kGdj6eVfOu/epxq9PS334+aa1SzAH4nv4fVE+CbZvsiWr6rZ
 RKtLLayy/wWNrPb+zA3sw0YqhLsgKB+EGqgZpWBKvQ0meVjwr7KgBQtrSxICt5T3rH1Z
 2DdIWohTKqUfBjPLU0W5YvZ4haJLhhZBnNM4PhbfBahJyhW0Nj5aijax74FlonDSAk43
 L/Wl+KdWB/KbS1fkEkjcpMkRcWkCsjKXhq96wkmxigB68c1kGcwsm/U+4dJOTi/fz3gj
 sGMd0ZB+fXanPtJ4AK7l+rEquMFE0DLIP9+BhEZ1yXKlTRTk6Bw9jyo7u2O/U1Jt2QPH
 7e5w==
X-Gm-Message-State: AOAM530ZSthCRtDGjRXrZi3oFY0GsYTQIablZeUbyU++Rwbq9k4GauMQ
 1CPyxEH8eiUkbs1HbezzPugJrA==
X-Google-Smtp-Source: ABdhPJzyk0bjaMpAOHUvSo0sSZqFuDf2O1oTPP3RWuojSNMrtbdiurhlFCg7iqKK+bqwRh2pGDkzIw==
X-Received: by 2002:a1c:6187:: with SMTP id v129mr19019776wmb.35.1599467496559; 
 Mon, 07 Sep 2020 01:31:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 2sm28063865wrs.64.2020.09.07.01.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:31:35 -0700 (PDT)
Date: Mon, 7 Sep 2020 10:31:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required for
 fb
Message-ID: <20200907083133.GS2352366@phenom.ffwll.local>
References: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
 <t3hHLqZ0yNm5FdxpyJovgjEVzs-OD7qD5nYrYXug8UhkBykhekB0_hOqPltEvFH3daJ3HYtY_3FInv3U5xIHprg1FS7b2SP8fCf48r7DvVg=@emersion.fr>
 <CAKMK7uFztTjjvQvM-toeZv3hps+NMJFXV7s=Dzs5PwG3J+7wjw@mail.gmail.com>
 <ap5W_r98yx5DpM1jFkrof6yWGWPtxbyObFp3iIP1-hm-SD_-Jij72KZK2VhVV2p-34EqdVE6T1JeW4zAgjnNsxv_CtULfvg2ASY3xECXMuY=@emersion.fr>
 <CAKMK7uGs2vQNf1+=4spQV4aCncOPE4+E7g95xqZ7kcD8pp5bTg@mail.gmail.com>
 <55Yt-xRb-j_BnxyoixpIT6a4aOd2-SMetoyIVRBwOBFc98R5A3-gAcYcFo5Sjj-7TcvLdy3669gwn5eCOoOi85A2MlZaUwqpQETei77426A=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55Yt-xRb-j_BnxyoixpIT6a4aOd2-SMetoyIVRBwOBFc98R5A3-gAcYcFo5Sjj-7TcvLdy3669gwn5eCOoOi85A2MlZaUwqpQETei77426A=@emersion.fr>
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

T24gV2VkLCBTZXAgMDIsIDIwMjAgYXQgMDI6NTk6NDlQTSArMDAwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IE9uIFdlZG5lc2RheSwgU2VwdGVtYmVyIDIsIDIwMjAgNDoyOSBQTSwgRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4gCj4gPiBPbiBXZWQsIFNlcCAyLCAy
MDIwIGF0IDI6NDkgUE0gU2ltb24gU2VyIGNvbnRhY3RAZW1lcnNpb24uZnIgd3JvdGU6Cj4gPgo+
ID4gPiBPbiBXZWRuZXNkYXksIFNlcHRlbWJlciAyLCAyMDIwIDI6NDQgUE0sIERhbmllbCBWZXR0
ZXIgZGFuaWVsLnZldHRlckBmZndsbC5jaCB3cm90ZToKPiA+ID4KPiA+ID4gPiA+IEkgc3VwcG9z
ZSBzb21ldGhpbmcgc2ltaWxhciBoYXBwZW5zIGluIHVzZXItc3BhY2U6IGdibV9ib19jcmVhdGUK
PiA+ID4gPiA+IHdpdGhvdXQgbW9kaWZpZXJzIG5lZWRzIHRvIHByb3Blcmx5IHNldCB0aGUgaW1w
bGljaXQgbW9kaWZpZXIsIGllLgo+ID4gPiA+ID4gZ2JtX2JvX2dldF9tb2RpZmllciBuZWVkcyB0
byByZXR1cm4gdGhlIGVmZmVjdGl2ZSBtb2RpZmllci4gSXMgdGhpcwo+ID4gPiA+ID4gc29tZXRo
aW5nIGFscmVhZHkgZG9jdW1lbnRlZD8KPiA+ID4gPgo+ID4gPiA+IEkgZG9uJ3QgdGhpbmsgdGhh
dCBoYXBwZW5zLCBidXQgaXQgaGFzIGNvbWUgdXAgaW4gZGlzY3Vzc2lvbnMuIEl0J3MKPiA+ID4g
PiBraW5kYSBkaWZmZXJlbnQgc2NlbmFyaW8gdGhvdWdoOiBnZXRmYjIgaXMgZm9yIGNyb3NzLWNv
bXBvc2l0b3Igc3R1ZmYsCj4gPiA+ID4gZW5hYmxpbmcgc21vb3RoIHRyYW5zaXRpb25zIGF0IGJv
b3QtdXAgYW5kIHdoZW4gc3dpdGNoaW5nLiBTbyB5b3UgaGF2ZQo+ID4gPiA+IGEgbGVnaXQgcmVh
c29uIGZvciBtaXhpbmcgbW9kaWZpZXItYXdhcmUgdXNlcnNwYWNlIHdpdGgKPiA+ID4gPiBub24t
bW9kaWZpZXItYXdhcmUgdXNlcnNwYWNlLiBBbmQgdGhlIG1vZGlmaWVyLWF3YXJlIHVzZXJzcGFj
ZSB3b3VsZAo+ID4gPiA+IGxpa2UgdGhhdCBldmVyeXRoaW5nIHdvcmtzIHdpdGggbW9kaWZpZXJz
IGNvbnNpc3RlbnRseSwgaW5jbHVkaW5nCj4gPiA+ID4gZ2V0ZmIyLiBCdXQgZ2JtIGlzIGp1c3Qg
d2l0aGluIGEgc2luZ2xlIHByb2Nlc3MsIGFuZCB0aGF0IHNob3VsZAo+ID4gPiA+IGVpdGhlciBy
dW4gYWxsIHdpdGggbW9kaWZpZXJzLCBvciBub3QgYXQgYWxsLCBzaW5jZSB0aGVzZSB3b3JsZHMg
anVzdAo+ID4gPiA+IGRvbnQgbWl4IHdlbGwuIEhlbmNlIEknbSBub3Qgc2VlaW5nIG11Y2ggdXNl
IGZvciB0aGF0LCAtbW9kZXNldHRpbmcKPiA+ID4gPiBiZWluZyBhIGNvbmZ1c2VkIG1lc3Mgbm9u
d2l0aHN0YW5kaW5nIDotKQo+ID4gPgo+ID4gPiBXZWxs4oCmIFRoZXJlJ3MgYWxzbyB0aGUgY2Fz
ZSB3aGVyZSBzb21lIGxlZ2FjeSBXYXlsYW5kIGNsaWVudCB0YWxrcyB0byBhCj4gPiA+IG1vZGlm
aWVyLWF3YXJlIGNvbXBvc2l0b3IuIGdibV9ib19pbXBvcnQgd291bGQgYmUgY2FsbGVkIHdpdGhv
dXQgYQo+ID4gPiBtb2RpZmllciwgYnV0IHRoZSBjb21wb3NpdG9yIGV4cGVjdHMgZ2JtX2JvX2dl
dF9tb2RpZmllciB0byB3b3JrLgo+ID4gPiBBbHNvLCB3bHJvb3RzIHdpbGwgY2FsbCBnYm1fYm9f
Y3JlYXRlIHdpdGhvdXQgYSBtb2RpZmllciB0byBvbmx5IGxldAo+ID4gPiB0aGUgZHJpdmVyIHBp
Y2sgInNhZmUiIG1vZGlmaWVycyBpbiBjYXNlIHBhc3NpbmcgdGhlIGZ1bGwgbGlzdCBvZgo+ID4g
PiBtb2RpZmllcnMgcmVzdWx0cyBpbiBhIGJsYWNrIHNjcmVlbi4gTGF0ZXIgb24gd2xyb290cyB3
aWxsIGNhbGwKPiA+ID4gZ2JtX2JvX2dldF9tb2RpZmllciB0byBmaWd1cmUgb3V0IHdoYXQgbW9k
aWZpZXIgdGhlIGRyaXZlciBwaWNrZWQuCj4gPgo+ID4gZ2JtX2JvX2ltcG9ydCBpcyBhIGRpZmZl
cmVudCB0aGluZyBmcm9tIGdibV9ib19jcmVhdGUuIEZvcm1lciBJIGFncmVlCj4gPiBzaG91bGQg
ZmlndXJlIG91dCB0aGUgcmlnaHQgbW9kaWZpZXJzIChhbmQgSSB0aGluayBpdCBkb2VzIHRoYXQs
IGF0Cj4gPiBsZWFzdCBvbiBpbnRlbCBtZXNhKS4gRm9yIGdibV9ib19jcmVhdGUgSSdtIG5vdCBz
dXJlIHdlIHNob3VsZC9uZWVkIHRvCj4gPiByZXF1aXJlIHRoYXQuCj4gCj4gSSBndWVzcyB0aGUg
Y29tcG9zaXRvciB3aWxsIGp1c3QgZm9yd2FyZCB0aGUgdmFsdWUgcmV0dXJuZWQgYnkKPiBnYm1f
Ym9fZ2V0X21vZGlmaWVyIGluIGFueSBjYXNlLCBzbyByZXR1cm5pbmcgSU5WQUxJRCB3b3VsZCBi
ZSBmaW5lCj4gdG9vICh0byBtZWFuICJpbXBsaWNpdCBtb2RpZmllciIpLgo+IAo+IEluIGJvdGgg
dGhlIGNyZWF0ZSBhbmQgaW1wb3J0IGNhc2VzLCBvdGhlciBtZXRhZGF0YSBsaWtlIHBpdGNoZXMg
YW5kCj4gb2Zmc2V0cyBzaG91bGQgYmUgY29ycmVjdGx5IHNldCBJIHRoaW5rPwoKV2VsbCBpZiB5
b3UgaGF2ZSBhIG1vZGlmaWVyIGZvcm1hdCB1bmRlcm5lYXRoLCB0aGUgbm9uLW1vZGlmaWVyZWQg
b2Zmc2V0cwphbmQgcGl0Y2hlcyBtaWdodCBiZSBwdXJlIGZpY3Rpb24uIEFsc28sIHRoZXkgbWln
aHQgbm90IGJlIHN1ZmZpY2llbnQsIGlmCnRoZSBtb2RpZmllciBhZGRzIG1vcmUgcGxhbmVzLgoK
U28gSSdtIG5vdCBzdXJlIGhvdyB3ZSBjYW4gbGV0IHRoZSAiaW1wbGljaXQgbW9kaWZpZXIiIGdv
IHRocm91Z2ggb25jZSBhCnN0YWNrIGlzIGNvbnZlcnRlZCB0byBzdXBwb3J0IG1vZGlmaWVycy4g
SW4gYSB3YXkgbW9kaWZpZXJzIGFyZSBvbmUtd2F5CmNvbXBhdGlibGUgb25seTogaW1wbGljaXQg
bW9kaWZpZXJzIC0+IGV4cGxpY2l0IG1vZGlmaWVycyBzaG91bGQgYmUKd2VsbC1kZWZpbmVkLCB0
aGUgb3RoZXIgd2F5IGp1c3QgbG9vc2VzIGluZm9ybWF0aW9uIGFuZCBkb2Vzbid0IHdvcmsuCi1E
YW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
