Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023FB5AE96
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 07:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3D76E9A9;
	Sun, 30 Jun 2019 05:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3826E9A9;
 Sun, 30 Jun 2019 05:10:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 207so12651552wma.1;
 Sat, 29 Jun 2019 22:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/21JLQKbSiGCUYaRJe7+nwJe/s7BHXcW2bb6YBBe9vE=;
 b=JuksYiY1hp0bL3TCqUZkkhRPLWwYNx4tB1J1+MuQB4lEbsclS2BWzaGUbv76T9vA65
 rg1gEHzBxQB36vk0BFh7NYkoTNIXQU/8JcH9HYf3PwGEELnFTImhAymzvG/xtsz+301q
 163PBwgjD2ABNzNnD4NIu2/Ed5KMlX8KPmuL510gMVtRekKGGRQAbtbxouLc52xeQqca
 zf4eg2ztKgyX1JMekyhQZy3vH1kebL8FWJ8VyVhapu9bDl6Tv8sUKcpQ5VRLzh/yIC06
 JmUemwwsn74xGvYtb/D+3lZxgjcUhKRgcnE2tqmNGF9lA3wWZGS2asUE/9SblqG1f6Gn
 dX1A==
X-Gm-Message-State: APjAAAXzsj0SRuVdba1ugy1n69L7mYWOnId1fJqi1zxgoK6DjreBj8Bf
 V5jw1FR8yYXA3jGC3Wj0ek2yOw7VwBdAxMTUE9A=
X-Google-Smtp-Source: APXvYqxpaJBC2iDXF6u5DwDzM9SQtL1TwvLfLxe+y66Lwo3m7+Fkhz6wV6G6nXxJ9B6XU8wJQ2T/O3AgjvDeo4AY21g=
X-Received: by 2002:a1c:9c8a:: with SMTP id f132mr12370472wme.29.1561871439807; 
 Sat, 29 Jun 2019 22:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <CAKMK7uFq7qCpzXqrD4o8Vw_dOwt=ny_oS7TRZFsANpPdC604vw@mail.gmail.com>
In-Reply-To: <CAKMK7uFq7qCpzXqrD4o8Vw_dOwt=ny_oS7TRZFsANpPdC604vw@mail.gmail.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Sun, 30 Jun 2019 01:10:28 -0400
Message-ID: <CAOWid-e-gxFBoiBii4wZs0HMnHwCvJWOQWpNopdPHi8So53gNw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/11] new cgroup controller for gpu/drm subsystem
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/21JLQKbSiGCUYaRJe7+nwJe/s7BHXcW2bb6YBBe9vE=;
 b=sMh5OGxWkcMzotiqbQAZxq5yUs747U8hXAm5IU0xWuMx2HB0QTohc/KWCW+i5xCPRL
 2u51ZA2iwTJZy01MbN4wVlNbrc960x2iOGG+7IGxcR/pPFG4bOqBVRWTbefqZMg6U6Xa
 bPB57rLDSFq5spK5XYoVY9v3X0AjFsPIClCANA6+cRPO1uUyZawZVpoqt1uygaOqvCYI
 JKI4zSLgm6bSb1Pql0InBkG1f8KGby58+V1I1RSCBoHACfmqVPaQT/VIjDWiJo04hPf6
 Ostxl+B+CyubRU11qRC2qlq7tqVEkfSIMvIjD1WLOFPzIjJxFlhe+00xQq0HlKQB47Qg
 Ab1w==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>, Jerome Glisse <jglisse@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, joseph.greathouse@amd.com,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMzoyNCBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+IEFub3RoZXIgcXVlc3Rpb24gSSBoYXZlOiBXaGF0IGFib3V0IEhNTT8g
V2l0aCB0aGUgZGV2aWNlIG1lbW9yeSB6b25lCj4gdGhlIGNvcmUgbW0gd2lsbCBiZSBhIGxvdCBt
b3JlIGludm9sdmVkIGluIG1hbmFnaW5nIHRoYXQsIGJ1dCBJIGFsc28KPiBleHBlY3QgdGhhdCB3
ZSdsbCBoYXZlIGNsYXNzaWMgYnVmZmVyLWJhc2VkIG1hbmFnZW1lbnQgZm9yIGEgbG9uZyB0aW1l
Cj4gc3RpbGwuIFNvIHRoZXNlIG5lZWQgdG8gd29yayB0b2dldGhlciwgYW5kIEkgZmVhciBzbGln
aHRseSB0aGF0IHdlJ2xsCj4gaGF2ZSBtZW1jZyBhbmQgZHJtY2cgZmlnaHRpbmcgb3ZlciB0aGUg
c2FtZSBwaWVjZXMgYSBiaXQgcGVyaGFwcz8KPgo+IEFkZGluZyBKZXJvbWUsIG1heWJlIGhlIGhh
cyBzb21lIHRob3VnaHRzIG9uIHRoaXMuCgpJIGp1c3QgZGlkIGEgYml0IG9mIGRpZ2dpbmcgYW5k
IHRoaXMgbG9va3MgbGlrZSB0aGUgY3VycmVudCBiZWhhdmlvdXI6Cmh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvZG9jL2h0bWwvdjUuMS92bS9obW0uaHRtbCNtZW1vcnktY2dyb3VwLW1lbWNnLWFuZC1y
c3MtYWNjb3VudGluZwoKIkZvciBub3cgZGV2aWNlIG1lbW9yeSBpcyBhY2NvdW50ZWQgYXMgYW55
IHJlZ3VsYXIgcGFnZSBpbiByc3MKY291bnRlcnMgKGVpdGhlciBhbm9ueW1vdXMgaWYgZGV2aWNl
IHBhZ2UgaXMgdXNlZCBmb3IgYW5vbnltb3VzLCBmaWxlCmlmIGRldmljZSBwYWdlIGlzIHVzZWQg
Zm9yIGZpbGUgYmFja2VkIHBhZ2Ugb3Igc2htZW0gaWYgZGV2aWNlIHBhZ2UgaXMKdXNlZCBmb3Ig
c2hhcmVkIG1lbW9yeSkuIFRoaXMgaXMgYSBkZWxpYmVyYXRlIGNob2ljZSB0byBrZWVwIGV4aXN0
aW5nCmFwcGxpY2F0aW9ucywgdGhhdCBtaWdodCBzdGFydCB1c2luZyBkZXZpY2UgbWVtb3J5IHdp
dGhvdXQga25vd2luZwphYm91dCBpdCwgcnVubmluZyB1bmltcGFjdGVkLgoKQSBkcmF3YmFjayBp
cyB0aGF0IHRoZSBPT00ga2lsbGVyIG1pZ2h0IGtpbGwgYW4gYXBwbGljYXRpb24gdXNpbmcgYQps
b3Qgb2YgZGV2aWNlIG1lbW9yeSBhbmQgbm90IGEgbG90IG9mIHJlZ3VsYXIgc3lzdGVtIG1lbW9y
eSBhbmQgdGh1cwpub3QgZnJlZWluZyBtdWNoIHN5c3RlbSBtZW1vcnkuIFdlIHdhbnQgdG8gZ2F0
aGVyIG1vcmUgcmVhbCB3b3JsZApleHBlcmllbmNlIG9uIGhvdyBhcHBsaWNhdGlvbnMgYW5kIHN5
c3RlbSByZWFjdCB1bmRlciBtZW1vcnkgcHJlc3N1cmUKaW4gdGhlIHByZXNlbmNlIG9mIGRldmlj
ZSBtZW1vcnkgYmVmb3JlIGRlY2lkaW5nIHRvIGFjY291bnQgZGV2aWNlCm1lbW9yeSBkaWZmZXJl
bnRseS4iCgpSZWdhcmRzLApLZW5ueQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
