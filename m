Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38468896
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 14:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511CC898EE;
	Mon, 15 Jul 2019 12:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB206898EE;
 Mon, 15 Jul 2019 12:10:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v19so14958854wmj.5;
 Mon, 15 Jul 2019 05:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=pEcal0+gNYMOse192pwhFV3knMKfeOuiQUG/tqwM8c8=;
 b=NGEo0MRpdRcdIsm9lf8mNTyNhLWiXSFPQxb42FWJqj2SYCxk0m0OOGUGIdqijM71Hq
 QbEQLHs/uz3jDkJN9en5PMnbw/1JoVA50EtwwND69KYIrglHWD3oc5J8Q+Vkhz6vSAs9
 +tVavH2DApHiUNXA8sCQ1r7ieNhnC9R8oeaWQSwIEytGSYfYNSUoEGRyJ6hafhkS7kov
 N/0iRKOI2QAomcCxJ26fJru4nfVWDhkA5oGpjXzYR7QD/3rzO8Fn7ygjJLlEa4f6RUd4
 xNNg+zMzENVjWsC6YlC0NiW8KnBb3Nu52Q8VHgc42s2wdg6HcTUUBB35yH9K5DZ63I75
 pemQ==
X-Gm-Message-State: APjAAAWXBBT76Im/fAytV08FWRDYdVuR5VEcX46wkexRmFc9e/xzUM9H
 wAbChDNTT5hDS/jGPePWK+t0Ci2i
X-Google-Smtp-Source: APXvYqwbiUpMKYH0qCWvbXO3w7tv6UnATIpc1fSA2cSxIFkNOxyWySJiCYlexzy5hYvsHU7aDsMXkQ==
X-Received: by 2002:a1c:f515:: with SMTP id t21mr25563566wmh.39.1563192614644; 
 Mon, 15 Jul 2019 05:10:14 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c3sm17877059wrx.19.2019.07.15.05.10.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 05:10:13 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: extend AMDGPU_CTX_PRIORITY_NORMAL comment
To: Emil Velikov <emil.l.velikov@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20190614173335.30907-1-emil.l.velikov@gmail.com>
 <b3b4b6d8-1b64-7860-88e5-ec91b9d2f711@amd.com>
 <CACvgo51LkcF6LydoH8BCaKwK4trfrm0EQkjMricQ3b0RXcrhrA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <61429d92-640b-b092-08b2-378e28aa10e8@gmail.com>
Date: Mon, 15 Jul 2019 14:10:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CACvgo51LkcF6LydoH8BCaKwK4trfrm0EQkjMricQ3b0RXcrhrA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=pEcal0+gNYMOse192pwhFV3knMKfeOuiQUG/tqwM8c8=;
 b=o69o27je0ZpLEFYc3di6FJnMKTh0wBu8o3fzecKw0kb9ImYjaVDhtMm3X/QLGusJYi
 tTsAufSvlJOkNqIxIAszqNne3r2uS79Dwg5CVJGFie3p6ViKpx+ZGSTz6Nt+GZfgm64j
 wj8p+ANYdk227XyoKaXeIuA5iQpX+1Nmwiz0Fp821Kjo0R/3S+3RLoTWtopn1deh4L5i
 pPXKJry7bXN8jLRSvjUQNQ0C9rr5NzWu2LyvdAqJTAmMaFH10V9xLV/9I82JSR0rW+3u
 957X+H6GgId1vVW+nQh0IPLRZBfG+6zq1IkEfyijq8ia/kfw/lLbS/8HtLQdo+HG0dj5
 uerQ==
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
Reply-To: christian.koenig@amd.com
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDIuMDcuMTkgdW0gMTk6MTUgc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4gT24gRnJpLCAxNCBK
dW4gMjAxOSBhdCAxOTowMiwgS29lbmlnLCBDaHJpc3RpYW4KPiA8Q2hyaXN0aWFuLktvZW5pZ0Bh
bWQuY29tPiB3cm90ZToKPj4gQW0gMTQuMDYuMTkgdW0gMTk6MzMgc2NocmllYiBFbWlsIFZlbGlr
b3Y6Cj4+PiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+
Pj4KPj4+IEN1cnJlbnRseSB0aGUgQU1ER1BVX0NUWF9QUklPUklUWV8qIGRlZmluZXMgYXJlIHVz
ZWQgaW4gYm90aAo+Pj4gZHJtX2FtZGdwdV9jdHhfaW46OnByaW9yaXR5IGFuZCBkcm1fYW1kZ3B1
X3NjaGVkX2luOjpwcmlvcml0eS4KPj4+Cj4+PiBFeHRlbmQgdGhlIGNvbW1lbnQgdG8gbWVudGlv
biB0aGUgQ0FQX1NZU19OSUNFIG9yIERSTV9NQVNURVIgcmVxdWlyZW1lbnQKPj4+IGlzIG9ubHkg
YXBwbGljYWJsZSB3aXRoIHRoZSBmb3JtZXIuCj4+Pgo+Pj4gQ2M6IEJhcyBOaWV1d2VuaHVpemVu
IDxiYXNAYmFzbmlldXdlbmh1aXplbi5ubD4KPj4+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlr
b3ZAY29sbGFib3JhLmNvbT4KPj4+IC0tLQo+Pj4gTWlsZGx5IGN1cmlvdXM6IHdoeSBkaWRuJ3Qg
b25lIGV4dGVuZCBjdHhfYW1kZ3B1X2N0eCBpbnN0ZWFkIG9mIGFkZGluZwo+Pj4gZHJtX2FtZGdw
dV9zY2hlZD8gTmV3IGZsYWcgKyBfdTMyIGZkIGF0IHRoZSBlbmQgKGZvciB0aGUgZm9ybWVyKSB3
b3VsZAo+Pj4gaGF2ZSBiZWVuIGVub3VnaCAoYW5kIHR3ZWFraW5nIHRoZSBpb2N0bCBwZXJtaXNz
aW9uIHRoaW5neSkuCj4+IFRoZSBkcm1fYW1kZ3B1X3NjaGVkIGlzIG9ubHkgYWxsb3dlZCBmb3Ig
RFJNX01BU1RFUi4KPj4KPiBGYWlyIGVub3VnaC4KPgo+IElzIHRoZSBwYXRjaCB3cm9uZyBvciBk
aWQgaXQgc2xpcCB0aHJvdWdoIHRoZSBjcmFja3M/IEkgY2Fubm90IHNlZSBpdAo+IGluIEFsZXgn
cyB0cmVlLgoKTG9va3MgbGlrZSBBbGV4IGp1c3QgbWlzc2VkIHRoaXMgb25lIGFuZCBJIHdhcyBv
biB2YWNhdGlvbi9vdXQgb2Ygb2ZmaWNlIApmb3IgYSB3aGlsZS4KCkkndmUgZ29uZSBhaGVhZCBh
ZGRlZCBteSByYiBhbmQganVzdCBwdXNoZWQgaXQuCgpUaGFua3MsCkNocmlzdGlhbi4KCj4KPiAt
RW1pbAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
