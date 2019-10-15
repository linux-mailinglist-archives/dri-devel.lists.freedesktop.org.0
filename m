Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ABBD7C09
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C4E6E86F;
	Tue, 15 Oct 2019 16:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903646E24B;
 Tue, 15 Oct 2019 14:19:51 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id u22so30762174qtq.13;
 Tue, 15 Oct 2019 07:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t+OBvzJZqaFe7QJw3zCtKJFI6wE2wmBR2TUW5NFBDPA=;
 b=GS+r9alDOTc87YbWUBrVvQx693ugDmHY+tvNZS878sd5sCG8ieZKvN3yt8hIw8aN2H
 kS+vVzVJGgOmcUQcM8b6xQnQmq5joPDunTnGwQ/yeTRjZ04S0asm/19X9JakljTV1cfl
 HDaDsU4DxQSEw31DxMuBnAWKIPwlO0Y6KC+cPypiXmvTp8TEIsCfz/lNBuSRhvOjBuSC
 lOAyxvseN7eWJHDDJ/jzEwKOKzWo0pN1W08o5Gg2PyN0XZfHBUAD7I4v58/C+fdqhQMs
 9yJspBmlZwc8F2ESDDpuNLyA6AvHGM9DXFhDaTJ2B+/R7dCzEcognJfYNFvFzo0BpdC3
 ypXA==
X-Gm-Message-State: APjAAAXibfRm0oTy7lXBRFsF2+d8d01+MvLV6G1sZuIxAVPv1Il4+IiB
 Qbfl2ea1JH1EwpdCsGO3N86OvCyT0V/fzevVaGM=
X-Google-Smtp-Source: APXvYqyAmtMs5zHwn+YQCum3UwRPWwEQiR8w3ik6mPge8l5yzItOMRraXTY9oVyeQIhqlk3SkjTRkm3PNAGSyWabRJ4=
X-Received: by 2002:ac8:4a84:: with SMTP id l4mr38993752qtq.118.1571149190647; 
 Tue, 15 Oct 2019 07:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191015134012.15165-1-festevam@gmail.com>
In-Reply-To: <20191015134012.15165-1-festevam@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 15 Oct 2019 08:19:39 -0600
Message-ID: <CAOCk7NpoGA8VmTXSk96VxVtGU2yFs0+n8wyBeQkvwR8HZSOCRQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RESEND] drm/msm/adreno: Do not print error on
 "qcom, gpu-pwrlevels" absence
To: Fabio Estevam <festevam@gmail.com>
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=t+OBvzJZqaFe7QJw3zCtKJFI6wE2wmBR2TUW5NFBDPA=;
 b=Z3v79PHekRH7gf4mvR/vwxqDmVnkDcI+ogyxeRUXcFV4+39z7Ujr6zn4JJGm5iTUaj
 Mc2ZLFsbBwPUqME4ZBon0bLGh9UPqYBEYFrq4xBq9lgJu/64stF01Juh+5D8b2jR1yKP
 ZdIaGQzOlgM/1u2pkv7NFWYTfYBYf2B44NTrdQfLXmg6EKcD9dpFh1Wjl8eWstYbPjXw
 kpstAC4GuLeU9KWll0+sQZ/u4BssUcgytmbD+1cYGpv23/OxTGYmxepFvGioijQ5LryY
 5+FbD6XPe4ABAxHZqImT97piZDW75D2By1TTF58l7jBh9or/A3zUhKqNbkI71hetRZi7
 gFeQ==
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
Cc: Jonathan Marek <jonathan@marek.ca>, Sean Paul <sean@poorly.run>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>, cphealy@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgNzo0MCBBTSBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gQm9vdGluZyB0aGUgYWRyZW5vIGRyaXZlciBvbiBhIGlteDUz
IGJvYXJkIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcKPiBlcnJvciBtZXNzYWdlOgo+Cj4gYWRyZW5v
IDMwMDAwMDAwLmdwdTogW2RybTphZHJlbm9fZ3B1X2luaXRdICpFUlJPUiogQ291bGQgbm90IGZp
bmQgdGhlIEdQVSBwb3dlcmxldmVscwo+Cj4gQXMgdGhlICJxY29tLGdwdS1wd3JsZXZlbHMiIHBy
b3BlcnR5IGlzIG9wdGlvbmFsIGFuZCBuZXZlciBwcmVzZW50IG9uCj4gaS5NWDUsIHR1cm4gdGhl
IG1lc3NhZ2UgaW50byBkZWJ1ZyBsZXZlbCBpbnN0ZWFkLgo+Cj4gU2lnbmVkLW9mZi1ieTogRmFi
aW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgoKU2VlbXMgcmVhc29uYWJsZS4gIFJldmll
d2VkLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KCj4gLS0tCj4K
PiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jIHwgMiArLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMKPiBpbmRleCAwNzgzZTRiNTQ4NmEuLjVkN2JkYjRj
ODNjYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMKPiBAQCAt
ODI2LDcgKzgyNiw3IEBAIHN0YXRpYyBpbnQgYWRyZW5vX2dldF9sZWdhY3lfcHdybGV2ZWxzKHN0
cnVjdCBkZXZpY2UgKmRldikKPgo+ICAgICAgICAgbm9kZSA9IG9mX2dldF9jb21wYXRpYmxlX2No
aWxkKGRldi0+b2Zfbm9kZSwgInFjb20sZ3B1LXB3cmxldmVscyIpOwo+ICAgICAgICAgaWYgKCFu
b2RlKSB7Cj4gLSAgICAgICAgICAgICAgIERSTV9ERVZfRVJST1IoZGV2LCAiQ291bGQgbm90IGZp
bmQgdGhlIEdQVSBwb3dlcmxldmVsc1xuIik7Cj4gKyAgICAgICAgICAgICAgIERSTV9ERVZfREVC
VUcoZGV2LCAiQ291bGQgbm90IGZpbmQgdGhlIEdQVSBwb3dlcmxldmVsc1xuIik7Cj4gICAgICAg
ICAgICAgICAgIHJldHVybiAtRU5YSU87Cj4gICAgICAgICB9Cj4KPiAtLQo+IDIuMTcuMQo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBGcmVlZHJl
bm8gbWFpbGluZyBsaXN0Cj4gRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
