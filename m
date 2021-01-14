Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89562F62AE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 15:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEA06E3E5;
	Thu, 14 Jan 2021 14:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB1D6E3E5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 14:06:35 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id o11so5255784ote.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 06:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FqVRxnaEr6fxC2Np3c8vMV9XMhe2EyasTUleGDdIiio=;
 b=D6MODicRMqbQQrqQVvw89GhxAZYUzTkESKlqdoc3nmD11tujGqgeuWnlkzNHjBMuA/
 rsCgb9LUAd5IvQ5pLw9D9I9tRD9xM2wmqMvyNJhkartSsDQx7kZsRJuu9w+zFVrLqNRG
 RXYnIam3eUm0Onzm6xxIraQEAHClT+3yvDCXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FqVRxnaEr6fxC2Np3c8vMV9XMhe2EyasTUleGDdIiio=;
 b=fc05TwPwKMnaMmGIHVh0h9Yv4krOXfvdZomGTHD4DxaPoSDVMEI7QG6SckCzuJg4BO
 6Ak9iqDVzuQjty36FXfi/XLES748wv9CrSPmEr+kfkNqgGM9u5wXghq0C25mCQGzFxfQ
 oVve6/EOnXpMrUfq9XPQlXlkMcd/LPcKVLY2QMRls7eP0UIJ8AUgrenpbebanJXakcbO
 idcRZpcdsJmwByZ8Wwwq7ErstG+KfoZtYyPELSDitTYOBahaksdszvOot3yde/CiqaTh
 KKWiLp2h2d38x4qpA0ZwotiydfnzpInqCsHCAmRiwxkTifT5bp18lirbWEsP2td3gFH9
 YOQg==
X-Gm-Message-State: AOAM5306KATxZje85/h4bLQY/heFy4ynReaWKbbgaOOH8n3VcPCDo6zD
 csEylzTLheWHO3QlAiQol+W3nJIuDlGXqq/rISEWAA==
X-Google-Smtp-Source: ABdhPJyw9HaWyyzCICTVUTT7wUNnge/s8N2IbJcsIfDuGT9CYuReZqXPAG/KZccfmoHhjVFHWIs/pOYUFiPFjiTQAg8=
X-Received: by 2002:a05:6830:1bef:: with SMTP id
 k15mr4587211otb.303.1610633194394; 
 Thu, 14 Jan 2021 06:06:34 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsPSYh-Nvfig4j4N8073vA6WDdhdg13meAcUgCr_pd5mYw@mail.gmail.com>
 <816e944c-72bc-d94d-449f-bfb915382290@amd.com>
 <6e55d84c-7b9a-167c-34cf-9e980f8e2354@amd.com>
 <CABXGCsM8yYNz7gQW26a4hHwBR+MunXoopHEiyDJdC-muNrRxkQ@mail.gmail.com>
 <77b696b9-3248-d329-4f7d-5e27a21eabff@amd.com>
 <CABXGCsOcBMT4rL-bb4K_TzK70YmQsgNX37sHEHiqp_1kK1_UEQ@mail.gmail.com>
 <5f9e7752-68e8-aa5f-80ff-bb1196ea458d@amd.com>
In-Reply-To: <5f9e7752-68e8-aa5f-80ff-bb1196ea458d@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 14 Jan 2021 15:06:23 +0100
Message-ID: <CAKMK7uHhpEUXmJCS8=EzxYmT0R1UUF-RCRWx0guFKZo0JKTHhw@mail.gmail.com>
Subject: Re: [drm:dm_plane_helper_prepare_fb [amdgpu]] *ERROR* Failed to pin
 framebuffer with error -12
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
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMTQsIDIwMjEgYXQgMjo1NiBQTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMTQuMDEuMjEgdW0gMDE6MjIgc2Nocmll
YiBNaWtoYWlsIEdhdnJpbG92Ogo+ID4gT24gVHVlLCAxMiBKYW4gMjAyMSBhdCAwMTo0NSwgQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiA+PiBCdXQg
d2hhdCB5b3UgaGF2ZSBpbiB5b3VyIGxvZ3Mgc28gZmFyIGFyZSBvbmx5IHVucmVsYXRlZCBzeW1w
dG9tcywgdGhlCj4gPj4gcm9vdCBvZiB0aGUgcHJvYmxlbSBpcyB0aGF0IHNvbWVib2R5IGlzIGxl
YWtpbmcgbWVtb3J5Lgo+ID4+Cj4gPj4gV2hhdCB5b3UgY291bGQgZG8gYXMgd2VsbCBpcyB0byB0
cnkgdG8gZW5hYmxlIGttZW1sZWFrCj4gPiBJIGNhcHR1cmVkIHNvbWUgbWVtbGVha3MuCj4gPiBE
byB0aGV5IGNvbnRhaW4gYW55IHVzZWZ1bCBpbmZvcm1hdGlvbj8KPgo+IFVuZm9ydHVuYXRlbHkg
bm90IG9mIGhhbmQuCj4KPiBJIGFsc28gZG9uJ3Qgc2VlIGFueSBidWcgcmVwb3J0cyBmcm9tIG90
aGVyIHBlb3BsZSBhbmQgY2FuJ3QgcmVwcm9kdWNlCj4gdGhlIGxhc3QgYmFja3RyYWNlIHlvdSBz
ZW5kIG91dCBUVE0gaGVyZS4KPgo+IERvIHlvdSBoYXZlIGFueSBsb2NhbCBtb2RpZmljYXRpb25z
IG9yIHNwZWNpYWwgc2V0dXAgaW4geW91ciBzeXN0ZW0/Cj4gTGlrZSBicGYgc2NyaXB0cyBvciBz
b21ldGhpbmcgbGlrZSB0aGF0PwoKVGhlcmUncyBhbm90aGVyIGJ1ZyByZXBvcnQgKGZvciByY2Fy
LWR1LCBiaXNlY3RlZCB0byB0aGUgYSBzd2l0Y2ggdG8KdXNlIG1vcmUgY21hIGhlbHBlcnMpIGFi
b3V0IGxlYWtpbmcgbW1hcHMsIHdoaWNoIGtlZXBzIHRvbyBtYW55IGZiCmFsaXZlLCBzbyBtYXli
ZSB3ZSBoYXZlIGdhaW5lZCBhIHJlZmNvdW50IGxlYWsgc29tZXdoZXJlIHJlY2VudGx5LiBCdXQK
Y291bGQgYWxzbyBiZSB0b3RhbGx5IHVucmVsYXRlZC4KLURhbmllbAoKCgo+Cj4gQ2hyaXN0aWFu
Lgo+Cj4gPgo+ID4gWzFdIGh0dHBzOi8vcGFzdGViaW4uY29tL24wRkU3SHN1Cj4gPiBbMl0gaHR0
cHM6Ly9wYXN0ZWJpbi5jb20vTVVYNTVMMWsKPiA+IFszXSBodHRwczovL3Bhc3RlYmluLmNvbS9h
M0ZUN0RWRwo+ID4gWzRdIGh0dHBzOi8vcGFzdGViaW4uY29tLzFBTHZKS3o3Cj4gPgo+ID4gLS0K
PiA+IEJlc3QgUmVnYXJkcywKPiA+IE1pa2UgR2F2cmlsb3YuCj4gPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QK
PiA+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCgotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
