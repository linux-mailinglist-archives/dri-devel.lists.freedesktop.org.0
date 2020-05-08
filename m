Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5331CA884
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 12:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06416E15B;
	Fri,  8 May 2020 10:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A5D6E15B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 10:47:36 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id w188so298816vkf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 03:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZHSJY3vDV6FXsFHSmmRamyUM2Xdmsr7sq/QOhw2cH90=;
 b=I4AIDwxnhpILxnFUiFhbsvMc/+Hfnd5F+/kLYroFcHqp3LVkDAJzyOW9XZ52oRsykM
 QvFwaPaSJkY3iG7iWIDN9ZBOsnZXqzAiHZ/DTOqBw2Mg06N3MqqA6PhmYzopEEiS2wTa
 ohPaxaMlyAxl4vdv2c00TygPKIc8NsoI5KITpvzd5m99SCJ8YuNxrujsl6jHfTf4XrXC
 5r8MAiKtqO430WWy0/NVaxC6zwGjSDwXc18XEOs/q4C2midFx/62thO4lO0dGv4dSCD5
 rKA0noLdslfUfTNvy84LfWf5ipMZzvJ99SHr5kJa+IJ9NEyMxEK8K7EQNd1tchTis6qP
 vpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZHSJY3vDV6FXsFHSmmRamyUM2Xdmsr7sq/QOhw2cH90=;
 b=uRhSQJFfynGr4XlKcNW0AEFeHNS5LNITi48F+zeu0KBroasGLWRPp4C2MScghBehNF
 /r3Ov9/H/d30LXdwm/kSiaEBqRKI32T7lqsfWiLS3AE36s4sE5oYKMs8wu1X+iAClvy5
 qsEUftQvAqa4SgV5PYNp7UzdNqqt62ewIrauEFCVvxp+8a3Cm0QwFf+WczQVs0TJ+Bgt
 9tn7ji4XhJ3tf4h9iQ4hgXdru3DzQOaA/Czxnn5C0/KRrvs8V94YD6zkdBuERnibVKEV
 LMAYy0elBbnl8RhkZkS+cA5SmAEo7wxK+ExJwSX9LObghSbuQa4HVVoYsFlknIATJTHo
 ynVQ==
X-Gm-Message-State: AGi0PuYDNg15EXomB4HiG+ss9JmrLJ9xV+WyBX7BUv8iWhIPKp7XMIg2
 guzyrQj9hNih9ZZT2RMfeYkAgkJ2yf+lCHx7wFQAjj1H
X-Google-Smtp-Source: APiQypIupmbe733hpbcByNlWQGNxs9BkyGwyTgkC1C29z5oz0218a/S4mmFw+Ex7EPxXORLSwrGU1JllqORzyOEvUz0=
X-Received: by 2002:a1f:ac0e:: with SMTP id v14mr1186751vke.28.1588934855413; 
 Fri, 08 May 2020 03:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-13-emil.l.velikov@gmail.com>
 <401b83ce-73bf-952d-e98f-91b323e3adcb@amd.com>
In-Reply-To: <401b83ce-73bf-952d-e98f-91b323e3adcb@amd.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 8 May 2020 11:45:04 +0100
Message-ID: <CACvgo509CnWkeZ6RvQjy0SengxX12R63+EOZqdU0i9MNBihQwQ@mail.gmail.com>
Subject: Re: [PATCH 12/36] drm/amd: remove _unlocked suffix in
 drm_object_put_unlocked
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKT24gRnJpLCA4IE1heSAyMDIwIGF0IDEwOjIzLCBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMDcuMDUuMjAgdW0g
MTc6MDcgc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4gPiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwu
dmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4KPiA+IFNwZWxsaW5nIG91dCBfdW5sb2NrZWQgZm9y
IGVhY2ggYW5kIGV2ZXJ5IGRyaXZlciBpcyBhIGFubm95aW5nLgo+ID4gRXNwZWNpYWxseSBpZiB3
ZSBjb25zaWRlciBob3cgbWFueSBkcml2ZXJzLCBkbyBub3Qga25vdyAob3IgbmVlZCB0bykKPiA+
IGFib3V0IHRoZSBob3Jyb3Igc3RvcmllcyBpbnZvbHZpbmcgc3RydWN0X211dGV4Lgo+ID4KPiA+
IEp1c3QgZHJvcCB0aGUgc3VmZml4LiBJdCBtYWtlcyB0aGUgQVBJIGNsZWFuZXIuCj4KPiBJbiBn
ZW5lcmFsIHNvdW5kcyBsaWtlIGEgZ29vZCBpZGVhIHRvIG1lLCBidXQgSSBkb24ndCBzZWUgdGhl
IGZ1bGwKPiBwYXRjaHNldCBpbiBteSBtYWlsYm94Lgo+ClRoZSBzZXJpZXMgaXMgcXVpdGUgbG9u
ZywgeW91IGNhbiBzZWUgaXQgaGVyZQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
c2VyaWVzLzc3MDQzLwoKPiBXaXRoIHRoZSBjdXJyZW50IGNvZGUgdGhpcyBjaGFuZ2Ugd291bGQg
cHJvYmFibHkgdHJpZ2dlciB0aGUKPiAiV0FSTl9PTighbXV0ZXhfaXNfbG9ja2VkKCZvYmotPmRl
di0+c3RydWN0X211dGV4KSk7IiBpbgo+IGRybV9nZW1fb2JqZWN0X3B1dCgpLgo+CkVhcmxpZXIg
cGF0Y2ggcmVuYW1lcyBkcm1fZ2VtX29iamVjdF9wdXQsIGFkZGluZyBleHBsaWNpdCAiX2xvY2tl
ZCIKc3VmZml4IHRvIGl0LgoKSWYgdGhlIHNlcmllcyBpcyBhcHBsaWVkIGF0b21pY2FsbHksIHRo
ZW4gdGhhdCBpc3N1ZSB3aWxsIG5vdCBoYXBwZW4uCkRvaW5nIHNvIG1pZ2h0IGNhdXNlIHRyaXZp
YWwgbWVyZ2UgY29uZmxpY3RzLCBmb3IgaW5kaXZpZHVhbCBkcml2ZXJzLgpOb3RoaW5nIGEgc2lt
cGxlIGJ1aWxkIGNoZWNrIHdvbid0IGhpZ2hsaWdodC9jYXRjaC4KCkFsdGhvdWdoIGlmIHRoZSBB
TUQgdGVhbSBoYXMgcGVuZGluZyB3b3JrIHdoaWNoIHdpbGwgc2VyaW91c2x5IGNsYXNoCndpdGgg
dGhpcywgY291bGQgZGVsYXkgdGhlICJyZW1vdmUgX3VubG9ja2VkIHN1ZmZpeCIgcGFydCBvZiB0
aGUKc2VyaWVzLgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
