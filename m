Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE74B8DBFF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61206E7A1;
	Wed, 14 Aug 2019 17:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CC06E7A1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:36:59 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id g8so1548539edm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zRD9zM1JjWnEXk0SSw2wodVqrgK6WUYkDFW10hUk1AY=;
 b=F9nJSX8hWVOZNpsJEEzvj3uPSp9AVbyd5eK4q9TZRDGpbXkriF45eIicPVRr2MAh2w
 Fi3AwoDjQpXARvBtFAkQn4fcV0F5IokWqAn68DQgPQFcDyUld8pJH/9jWKTOSUE6m7Rw
 0iARAFcanluOyvM+O+baZK1k6zV4AmRiVyDiVclub+2JkCH/l1m1+4fvzcHYKIOfZ3Ma
 xUjw3a443KN3zyAhfb1DpegOYyRP1/O+nSyFQ8JPLGZDd1u+LkZItgaOXyyjjTdbdNn/
 LY6ggPRLADgrAdzK0H4jLlvv3od15jn4ym/l1cTbPgxF5xuEk5w8++bTVxRQXk3/U0DW
 E7qw==
X-Gm-Message-State: APjAAAV1Dx+9Kv92/8AQHQQIPFkPtGkD7q8IPS71wSfT52gZwJidoFkn
 /e6mScHrjLUaTctZqP5Va1bml4DHBrw=
X-Google-Smtp-Source: APXvYqxOmXGNM2SHSLoruJyAmUEqynYaI1t9IpKukdDQu7QiefZx11JHgLfRT5e1+y0zNKMKoFOQRQ==
X-Received: by 2002:a17:906:948a:: with SMTP id
 t10mr690250ejx.111.1565804218025; 
 Wed, 14 Aug 2019 10:36:58 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id z2sm34123ejp.73.2019.08.14.10.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2019 10:36:56 -0700 (PDT)
Subject: Re: [PATCH] drm/vboxvideo: Make structure vbox_fb_helper_funcs
 constant
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190813062548.24770-1-nishkadg.linux@gmail.com>
 <687f24b1-c3c5-c9d6-9abb-3c84ae009715@redhat.com>
 <20190814172634.GP7444@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3d20c06e-ff9a-ff05-350b-9d54ab5161cb@redhat.com>
Date: Wed, 14 Aug 2019 19:36:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814172634.GP7444@phenom.ffwll.local>
Content-Language: en-US
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxNC0wOC0xOSAxOToyNiwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBUdWUsIEF1
ZyAxMywgMjAxOSBhdCAwOTo1NzoxOUFNICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+PiBI
aSwKPj4KPj4gT24gMTMtMDgtMTkgMDg6MjUsIE5pc2hrYSBEYXNndXB0YSB3cm90ZToKPj4+IFRo
ZSBzdGF0aWMgc3RydWN0dXJlIHZib3hfZmJfaGVscGVyX2Z1bmNzLCBvZiB0eXBlIGRybV9mYl9o
ZWxwZXJfZnVuY3MsCj4+PiBpcyB1c2VkIG9ubHkgd2hlbiBpdCBpcyBwYXNzZWQgYXMgdGhlIHRo
aXJkIGFyZ3VtZW50IHRvCj4+PiBkcm1fZmJfaGVscGVyX2ZiZGV2X3NldHVwKCksIHdoaWNoIGRv
ZXMgbm90IG1vZGlmeSBpdC4gSGVuY2UgbWFrZSBpdAo+Pj4gY29uc3RhbnQgdG8gcHJvdGVjdCBp
dCBmcm9tIHVuaW50ZW5kZWQgbW9kaWZpY2F0aW9ucy4KPj4+IElzc3VlIGZvdW5kIHdpdGggQ29j
Y2luZWxsZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3VwdGEgPG5pc2hrYWRn
LmxpbnV4QGdtYWlsLmNvbT4KPj4KPj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gsIHRoaXMgbG9v
a3MgZ29vZCB0byBtZToKPj4KPj4gUmV2aWV3ZWQtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRl
QHJlZGhhdC5jb20+Cj4gCj4gSSdtIGFzc3VtaW5nIHlvdSdsbCBhcHBseSB0aGlzIHRvIGRybS1t
aXNjLW5leHQgdG9vPyBHb29kIHRvIHN0YXRlIHRoYXQsCj4gdG8gYXZvaWQgY29uZnVzaW9uIGFu
ZCBjb29yZGluYXRpb24gaXNzdWVzLgoKQWN0dWFsbHkgSSdtIHNvIHVzZWQgdG8gdGhlIHdvcmtm
bG93IGluIG90aGVyIHN1YnN5c3RlbXMgSSB3YXMKZXhwZWN0aW5nIHRoZSBzdWJzeXMgbWFpbnRh
aW5lciB0byBwaWNrIGl0IHVwLiBCdXQgSSBrbm93IHRoYXQKaXMgbm90IGhvdyBpdCB3b3JrcyBm
b3IgdGhlIGRybSBzdWJzeXMgYW5kIHNpbmNlIEknbSB0aGUgdmJveHZpZGVvCm1haW50YWluZXIg
SSBndWVzcyBpdCBtYWtlcyBzZW5zZSBmb3IgbWUgdG8gcGljayB0aGlzIHVwIGFuZCBwdXNoIGl0
LgoKU28geWVzIEkgd2lsbCBwaWNrIHRoaXMgdXAgYW5kIHB1c2ggaXQgdG8gZHJtLW1pc2MtbmV4
dCwgc29ycnkKZm9yIHRoZSBjb25mdXNpb24uCgpSZWdhcmRzLAoKSGFucwoKCj4+PiAtLS0KPj4+
ICAgIGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYyB8IDIgKy0KPj4+ICAgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMKPj4+IGluZGV4IDAyNTM3YWI5Y2MwOC4uMmI1N2Vh
MzE5NWYyIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Ry
di5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMKPj4+IEBA
IC0zMiw3ICszMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxp
c3RbXSA9IHsKPj4+ICAgIH07Cj4+PiAgICBNT0RVTEVfREVWSUNFX1RBQkxFKHBjaSwgcGNpaWRs
aXN0KTsKPj4+IC1zdGF0aWMgc3RydWN0IGRybV9mYl9oZWxwZXJfZnVuY3MgdmJveF9mYl9oZWxw
ZXJfZnVuY3MgPSB7Cj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZmJfaGVscGVyX2Z1bmNz
IHZib3hfZmJfaGVscGVyX2Z1bmNzID0gewo+Pj4gICAgCS5mYl9wcm9iZSA9IHZib3hmYl9jcmVh
dGUsCj4+PiAgICB9Owo+Pj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
