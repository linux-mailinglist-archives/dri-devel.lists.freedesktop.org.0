Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491ED2C4634
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 18:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F966EA55;
	Wed, 25 Nov 2020 17:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847F76EA54
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 17:03:03 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id t143so3538789oif.10
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 09:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IUsoYH9UfIVVcykEVMChFcFvDOVK9fjkUz5PsSbBKY4=;
 b=Y4noN/AuajGaOeCp9TzS3SGgouUAz0CxwuuMoGRc/JZvjiJ56AzhZqQIX3TDoanYOh
 tailsffkXB3uZoaASZcZPXk5HyHaVawfXUgasvjni6h19HM4Y+w3XgRDNYCpregAYwzD
 3No2Ay6/Hf8JvZGgrxyYpgb2wILYCFehtLAY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IUsoYH9UfIVVcykEVMChFcFvDOVK9fjkUz5PsSbBKY4=;
 b=PFEsDXsQN6teIl7/0nkdCl7e/BM+wlLjf3m7XNVOD49HeknUYFCY6/QmSyXkCi02/c
 Lfw0cNv0paaKcvYD0jK02Wkijzx6dVxWpa+GuWLhT0lpbdNOBGvHKLecdJvBoqPLdiRL
 ybdtPpyKIzHzAozdmgJOJUFIPYb9Z9B/W+svxdUrclu//ju0Blh6TV0JAPzUqISsD4hv
 uKcSuqxVsWKWbWMaSPwIFUS7cyXHGQGdZ5AaAFLkY4ceICF2f7UhfyNGEgGS45lPJImm
 Crt5yO/N78larqde0q5xbTdVJa9958JNZNAe9hli8DLa+j12IjDjWUWd7ojm9U+pXXRj
 uhyg==
X-Gm-Message-State: AOAM530uF+v06h9KsvZTRHgIlPv1KbKNjd3OI3ucGEmMjU8hNB3t+vj8
 j5Rkp04adjfR5PUK3rCnkRTy3ZekiLPplPe6BH4tTT+IBpM=
X-Google-Smtp-Source: ABdhPJwfM9p0Re3rpoo3rBTEznJf7PPtniciR2ZDsggmBTCHLyfTiUzfMOtkaiOAd9de2fHXv+OSW5v4fArBG+1X4ZE=
X-Received: by 2002:aca:4f14:: with SMTP id d20mr2886595oib.14.1606323782777; 
 Wed, 25 Nov 2020 09:03:02 -0800 (PST)
MIME-Version: 1.0
References: <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <20201125104021.GV401619@phenom.ffwll.local>
 <71683ae7-f443-c15a-7003-6ba4ad3d4b15@gmail.com>
 <6669f4ca-bfca-e54e-6d24-ee1bff0c17db@daenzer.net>
In-Reply-To: <6669f4ca-bfca-e54e-6d24-ee1bff0c17db@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 25 Nov 2020 18:02:51 +0100
Message-ID: <CAKMK7uFZnk22EhYQKOPctZz+-YPspWGqh4EWAO3H_stesgpVRA@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjUsIDIwMjAgYXQgNTo1NiBQTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPgo+IE9uIDIwMjAtMTEtMjUgMTo1NyBwLm0uLCBDaHJpc3RpYW4g
S8O2bmlnIHdyb3RlOgo+ID4KPiA+IFdlbGwgdGhpbmtpbmcgbW9yZSBhYm91dCB0aGlzLCBpdCBz
ZWVtcyB0byBiZSBhIGFub3RoZXIgcmVhbGx5IGdvb2QKPiA+IGFyZ3VtZW50IHdoeSBtYXBwaW5n
IHBhZ2VzIGZyb20gRE1BLWJ1ZnMgaW50byBhcHBsaWNhdGlvbiBhZGRyZXNzIHNwYWNlCj4gPiBk
aXJlY3RseSBpcyBhIHZlcnkgYmFkIGlkZWEgOikKPgo+IEFwb2xvZ2llcyBmb3IgZ29pbmcgb2Zm
IG9uIGEgdGFuZ2VudCBoZXJlLi4uCj4KPiBTaW5jZSBhbGxvd2luZyB1c2Vyc3BhY2UgbW1hcCB3
aXRoIGRtYS1idWYgZmRzIHNlZW1zIHRvIGJlIGEgdHJhcCBpbgo+IGdlbmVyYWxbMF0sIEkgd29u
ZGVyIGlmIHRoZXJlJ3MgYW55IHdheSB3ZSBjb3VsZCBzdG9wIHN1cHBvcnRpbmcgdGhhdD8KPgo+
Cj4gWzBdIEUuZy4gbXV0dGVyIGhhZCB0byBkaXNhYmxlIGhhbmRpbmcgb3V0IGRtYS1idWZzIGZv
ciBzY3JlZW4gY2FwdHVyZQo+IGJ5IGRlZmF1bHQgd2l0aCBub24taTkxNSBmb3Igbm93LCBiZWNh
dXNlIGluIHBhcnRpY3VsYXIgd2l0aCBkaXNjcmV0ZQo+IEdQVXMsIGRpcmVjdCBDUFUgcmVhZHMg
Y2FuIGJlIHVudXNhYmx5IHNsb3cgKHRoaW5rIHNpbmdsZS1kaWdpdCBmcmFtZXMKPiBwZXIgc2Vj
b25kKSwgYW5kIG9mIGNvdXJzZSB0aGVyZSdzIG90aGVyIHVzZXJzcGFjZSB3aGljaCBnb2VzICJv
b2gsCj4gZG1hLWJ1ZiwgbGV0J3MgbWFwIGFuZCByZWFkISIuCgpJIHRoaW5rIGEgcGlsZSBvZiBh
cHBsaWNhdGlvbnMgKGNyb3MgaW5jbHVkZWQpIHVzZSBpdCB0byBkbyB1cGxvYWRzCmFjcm9zcyBw
cm9jZXNzIGJvdW5kYXJpZXMuIFRoaW5rIGxvY2tlZCBkb3duIGpwZWcgZGVjb2RlciBhbmQgc3R1
ZmYKbGlrZSB0aGF0LiBGb3IgdGhhdCB1c2UtY2FzZSBpdCBzZWVtcyB0byB3b3JrIG9rLgoKQnV0
IHllYWggZG9uJ3QgcmVhZCBmcm9tIGRtYS1idWYuIEknbSBwcmV0dHkgc3VyZSBpdCdzIGRlYWQg
c2xvdyBvbgphbG1vc3QgZXZlcnl0aGluZywgZXhjZXB0IGludGVncmF0ZWQgZ3B1IHdoaWNoIGhh
dmUgQSkgYSBjb2hlcmVudApmYWJyaWMgd2l0aCB0aGUgZ3B1IGFuZCBCKSB0aGF0IGZhYnJpYyBp
cyBhY3R1YWxseSBmYXN0ZXIgZm9yCnJlbmRlcmluZyBpbiBnZW5lcmFsLCBub3QganVzdCBmb3Ig
ZGVkaWNhdGVkIGJ1ZmZlcnMgYWxsb2NhdGVkIGZvcgpkb3duL3VwbG9hZC4KLURhbmllbAotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
