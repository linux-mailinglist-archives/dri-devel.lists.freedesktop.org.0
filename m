Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC69546407
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B9E89ABA;
	Fri, 14 Jun 2019 16:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CE089AB5;
 Fri, 14 Jun 2019 16:27:55 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g135so2966930wme.4;
 Fri, 14 Jun 2019 09:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=En91ZM497paAG93CENXf8AKnQ/meTrVQfMgFrHK1sHA=;
 b=jvoaP+7pn3eXkVqRCSpRar2nMXbKUs0jHekfXCPUISoKhf9TUuii8UJPUVR1K/3JBP
 NhEMSaCXosHq4ZDx/fQfXfd2WfQCKwgIJFYMnVz2We4xeJrGTGHLNZD5P5O0mbRTgIFH
 5SFWgVhu2eR/+Ejugx3/KVcAE1LvTfGUoJKMIIiht/Ze4g2C51WbS2QBlFoo5BApEDj2
 hO93Bs7j8dvI2zJGIedAQZbgfYRb/mzbwLelxuh0FQ63XniuHsN+XLkxwC+u3RgOZ641
 BAEVRc1eDgIEWSCUMJzeFz4tL9lB9dpBOomeOgO6OPSu29SYA6dA0J3S6Kp7q9QiRhLl
 UuEg==
X-Gm-Message-State: APjAAAVaEiNI7XKdDQh0qaFaYP5DJEsfizREtEIjg/uZR4E9YYo8y9m4
 XtYoGB1FECBBVdukMwXy6oU=
X-Google-Smtp-Source: APXvYqztsX0qESCaH6Xc4mMZJV2aV0kLEhcWgmxhkirzwUDik5fO70u4i+ydQh6VwKjZwB8Py1Qbpg==
X-Received: by 2002:a1c:be0a:: with SMTP id o10mr8571862wmf.91.1560529673841; 
 Fri, 14 Jun 2019 09:27:53 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id r5sm6008737wrg.10.2019.06.14.09.27.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 09:27:52 -0700 (PDT)
Date: Fri, 14 Jun 2019 17:25:56 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190614162556.GD32412@arch-x1c3>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=En91ZM497paAG93CENXf8AKnQ/meTrVQfMgFrHK1sHA=;
 b=Iu2Dr62MJq26hw4oPlccEg+URr/TPUu9TjffDVBfKSrWEPmlAHoxDWry4132gIbvrZ
 5pcA3OReSxUkeLpaff5JyufeCBHAFDDDHsS9aCQC6pCUtVi/eLQdW6AIJrg99du7kFgE
 RV/2gfjnoN7AmLpx7QiRUS/3GCBcKMavmtm3BqEbTiRkHDkOnimJLIT8j7Gmysb1zK4c
 3cgiiHyTtpeTUfwq7OITS0IlJs46e7UBho4xBzsfhJ/ThKI5Awui1ava8DLid+Lc+z6r
 3C4EEQG0QBMcPYVuvPkjvyotQjzbn9TVBNt/IFPpKNeLqYvcv0cNwIum1izgTw7EWl/W
 bv+g==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNi8xNCwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMTQuMDYuMTkgdW0g
MTc6NTMgc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4gPiBPbiAyMDE5LzA2LzE0LCBLb2VuaWcsIENo
cmlzdGlhbiB3cm90ZToKPiA+PiBBbSAxNC4wNi4xOSB1bSAxNDowOSBzY2hyaWViIEVtaWwgVmVs
aWtvdjoKPiA+Pj4gT24gMjAxOS8wNS8yNywgRW1pbCBWZWxpa292IHdyb3RlOgo+ID4+PiBbU05J
UF0KPiA+Pj4gSGkgQ2hyaXN0aWFuLAo+ID4+Pgo+ID4+Pgo+ID4+PiBJbiB0aGUgZm9sbG93aW5n
LCBJIHdvdWxkIGxpa2UgdG8gc3VtbWFyaXNlIGFuZCBlbXBoYXNpemUgdGhlIG5lZWQgZm9yCj4g
Pj4+IERSTV9BVVRIIHJlbW92YWwuIEkgd291bGQga2luZGx5IGFzayB5b3UgdG8gc3BlbmQgYSBj
b3VwbGUgb2YgbWludXRlcwo+ID4+PiBleHRyYSByZWFkaW5nIGl0Lgo+ID4+Pgo+ID4+Pgo+ID4+
PiBUb2RheSBEUk0gZHJpdmVycyogZG8gbm90IG1ha2UgYW55IGRpc3RpbmN0aW9uIGJldHdlZW4g
cHJpbWFyeSBhbmQKPiA+Pj4gcmVuZGVyIG5vZGUgY2xpZW50cy4KPiA+PiBUaGF0IGlzIGFjdHVh
bGx5IG5vdCAxMDAlIGNvcnJlY3QuIFdlIGhhdmUgYSBzcGVjaWFsIGNhc2Ugd2hlcmUgYSBEUk0K
PiA+PiBtYXN0ZXIgaXMgYWxsb3dlZCB0byBjaGFuZ2UgdGhlIHByaW9yaXR5IG9mIHJlbmRlciBu
b2RlIGNsaWVudHMuCj4gPj4KPiA+IENhbiB5b3UgcHJvdmlkZSBhIGxpbms/IEkgY2Fubm90IGZp
bmQgdGhhdCBjb2RlLgo+IAo+IFNlZSBhbWRncHVfc2NoZWRfaW9jdGwoKS4KPiAKPiA+Pj4gVGh1
cyBmb3IgYSByZW5kZXIgY2FwYWJsZSBkcml2ZXIsIGFueSBwcmVtaXNlIG9mCj4gPj4+IHNlcGFy
YXRpb24sIHNlY3VyaXR5IG9yIG90aGVyd2lzZSBpbXBvc2VkIHZpYSBEUk1fQVVUSCBpcyBhIGZh
bGxhY3kuCj4gPj4gWWVhaCwgdGhhdCdzIHdoYXQgSSBhZ3JlZSBvbi4gSSBqdXN0IGRvbid0IHRo
aW5rIHRoYXQgcmVtb3ZpbmcgRFJNX0FVVEgKPiA+PiBub3cgaXMgdGhlIHJpZ2h0IGRpcmVjdGlv
biB0byB0YWtlLgo+ID4+Cj4gPiBDb3VsZCBoYXZlIGJlZW4gY2xlYXJlciAtIEknbSB0YWxraW5n
IGFib3V0IERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVwo+ID4gaW9jdGxzLgo+ID4KPiA+IFRo
YXQgYXNpZGUsIGNhbiB5b3UgcHJvcG9zZSBhbiBhbHRlcm5hdGl2ZSBzb2x1dGlvbiB0aGF0IGFk
ZHJlc3NlcyB0aGlzCj4gPiBhbmQgdGhlIHNlY29uZCBwb2ludCBqdXN0IGJlbG93Pwo+IAo+IEdp
dmUgbWUgYSBmZXcgZGF5cyB0byB3b3JrIG9uIHRoaXMsIGl0J3MgYWxyZWFkeSBGcmlkYXkgNnBt
IGhlcmUuCj4gCkdyZWF0IHRoYW5rcy4gRndpdyBJIHdhcyBhc2tpbmcgZm9yIGEgaWRlYXMvcHJv
cG9zYWwsIHdhcyBub3QgZXhwZWN0aW5nIHlvdQp0byB3cml0ZSB0aGUgcGF0Y2hlcyA7LSkKCkVt
aWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
