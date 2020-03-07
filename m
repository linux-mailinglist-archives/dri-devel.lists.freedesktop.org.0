Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6199717CEC8
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 15:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055AB6E21B;
	Sat,  7 Mar 2020 14:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988136E21B
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 14:39:02 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h18so5301230ljl.13
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2020 06:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t/WcMDSzwfYzQmRuWEmm+pSOa1L1zd4g+YHoLKNww2w=;
 b=fpr7C3M/xhPchKx+fQyooD3/w9rANaSGTyBQptulrD+rWySSDVetO5bcgNptVuT4c+
 1XmpDYvb7k3xaFRenM+EkwSmNBDiEHTORoptwWDbNWHzYhPxEhGKwvN5ph48L9cRLqSn
 aqWIBhmTTc+rDf2roscoVHBRnLlXKItMShOODoXqt7L2qs8+G9Ueqh33pWw9K905QncI
 SAhutqYZJHJy/j2IGixhgKMvlyXME76PcEtHzA9RubC1cn0e1aBAa3SB3hDHbpbsjZDP
 YMfGTG3ki5hLMxRQuekCaoT2ahY8eBDVtVeAhlXBhpaHs9TZqCzvhOjkMiPkBPky5y1f
 YdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t/WcMDSzwfYzQmRuWEmm+pSOa1L1zd4g+YHoLKNww2w=;
 b=GeNv8WF4VLm6o8dKMZdBGZ57deMP90JL3J+h24IDbYaTlAIWmfE0VdFi5QMjFLJ5rY
 qyQlBmJcsAxRKHZR7o2I317Z8FzHdfzACcgrgblrGtFIaTwfsdb4hGNf3YjymK1HiYdC
 qqqcuccyDKqE0Du0cDlbhPO5p5leZJKw5D8abz8erM63HaR9LutejaAxHkwovmEWjLsO
 d+QYTCQZicDN1ee34ArKyKZXXPd5nkUHejgLMeb4KhLrONTUqL7ZKoLJI/OQFn+juP2d
 11w3XWdWR7KVSCLQLW4s4H8F6qAgeLkn+6RHhgimd7AJ3EPRygGtDQgRckfkPZ3butuq
 eyig==
X-Gm-Message-State: ANhLgQ257WYwu13pYviKKBobHa9zDnD85EW4JwNmf7a5/4KLbLEnG5MR
 71wcRxCEPqlycwCcoxGz8vVRV4200CFvk585yKOMdA==
X-Google-Smtp-Source: ADFU+vsYvZpVdEipQjSZrB1h4wDKox+b7o6MEiaMSfgPmwIJruUk7gfsto0WVhsX1PkA3CIe1u6mOJjakobVMrevStU=
X-Received: by 2002:a2e:894d:: with SMTP id b13mr4273508ljk.99.1583591940994; 
 Sat, 07 Mar 2020 06:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20200302203452.17977-5-ville.syrjala@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 7 Mar 2020 15:38:49 +0100
Message-ID: <CACRpkdY2Erbiky8yevDSEVip3o=rDEqSik6cuCfEmGQcnqeXxA@mail.gmail.com>
Subject: Re: [PATCH 04/33] drm/panel-ilitek-ili9322: Fix dotclocks
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Thierry Reding <treding@nvidia.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUhCgpPbiBNb24sIE1hciAyLCAyMDIwIGF0IDk6MzUgUE0gVmlsbGUgU3lyamFsYQo8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Cj4gVGhlIGN1cnJlbnRseSBs
aXN0ZWQgZG90Y2xvY2tzIGRpc2FncmVlIHdpdGggdGhlIGN1cnJlbnRseQo+IGxpc3RlZCB2cmVm
cmVzaCByYXRlcy4gQ2hhbmdlIHRoZSBkb3RjbG9ja3MgdG8gbWF0Y2ggdGhlIHZyZWZyZXNoLgo+
Cj4gU29tZW9uZSB0ZWxsIG1lIHdoaWNoIChpZiBlaXRoZXIpIG9mIHRoZSBkb3RjbG9jayBvciB2
cmVyZXNoIGlzCj4gY29ycmVjdD8KPgo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc+Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KClRoaXMgZGlzcGxheSBpcyBwYXJ0aWN1bGFybHkgcGVjdWxpYXIgc2luY2UgaXQgdXNl
cwp0aGUgSVRVLVQgcGFja2VkIHN0cmVhbXMgYW5kIGxpa2UgRFNJIHRob3NlIGhhdmUKYSBkaWZm
ZXJlbnQgY2xvY2tpbmcgdGhhbiB3aGF0ZXZlciBpcyBjbG9ja2VkIG91dCB0byB0aGUKYWN0dWFs
IGRpc3BsYXkgYnkgdGhlIHBpeGVsIGNsb2NrLgoKRGF0YXNoZWV0IGlzIGhlcmU6Cmh0dHBzOi8v
ZGZsdW5kLnNlL350cmlhZC9rcmFkL2RsaW5rLWRpci02ODUvSUxJOTMyMkRTX1YxLjEyLnBkZgoK
SSBzZWUgSSBoYXZlIGNvbnNpc3RlbnRseSBzZXQgdGhlIGNsb2NrcyB0d28gb3JkZXJzIG9mCm1h
Z25pdHVkZSB3cm9uZyBpbiB0aGlzIGRyaXZlciwgbWVhIGN1bHBhIDpQCkJ1dCBJIGNoZWNrZWQg
dGhlbSBhbGwgYW5kIHdoYXQgSSB0aGluayB5b3Ugc2hvdWxkCmRvIGlzIGp1c3QgZGl2aWRlIHRo
ZW0gYWxsIGJ5IDEwMCBhbmQgbGVhdmUgYXMtaXMuCgo+ICAvKiBTZXJpYWwgUkdCIG1vZGVzICov
Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBzcmdiXzMyMHgyNDBfbW9k
ZSA9IHsKPiAtICAgICAgIC5jbG9jayA9IDI0NTM1MDAsCj4gKyAgICAgICAuY2xvY2sgPSAxNDQ3
OCwKClBsZWFzZSBzZXQgdG8gMjQ1MzUuCgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgc3JnYl8zNjB4MjQwX21vZGUgPSB7Cj4gLSAgICAgICAuY2xvY2sgPSAyNzAwMDAw
LAo+ICsgICAgICAgLmNsb2NrID0gMTAwMTQsCgpQbGVhc2Ugc2V0IHRvIDI3MDAwLgoKPiAgLyog
VGhpcyBpcyB0aGUgb25seSBtb2RlIGxpc3RlZCBmb3IgcGFyYWxsZWwgUkdCIGluIHRoZSBkYXRh
c2hlZXQgKi8KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHByZ2JfMzIw
eDI0MF9tb2RlID0gewo+IC0gICAgICAgLmNsb2NrID0gNjQwMDAwMCwKPiArICAgICAgIC5jbG9j
ayA9IDY0MjksCgpQbGVhc2Ugc2V0IHRvIDY0MDAwLgoKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlIHl1dl82NDB4MzIwX21vZGUgPSB7Cj4gLSAgICAgICAuY2xvY2sgPSAy
NDU0MDAwLAo+ICsgICAgICAgLmNsb2NrID0gMTg5NTQsCgpQbGVhc2Ugc2V0IHRvIDI0NTQwLgoK
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHl1dl83MjB4MzYwX21vZGUg
PSB7Cj4gLSAgICAgICAuY2xvY2sgPSAyNzAwMDAwLAo+ICsgICAgICAgLmNsb2NrID0gMjI5MTEs
CgpQbGVhc2Ugc2V0IHRvIDI3MDAwLgoKPiAgLyogQlQuNjU2IFZHQSBtb2RlLCA2NDB4NDgwICov
Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBpdHVfcl9idF82NTZfNjQw
X21vZGUgPSB7Cj4gLSAgICAgICAuY2xvY2sgPSAyNDU0MDAwLAo+ICsgICAgICAgLmNsb2NrID0g
Mjc0ODAsCgpQbGVhc2Ugc2V0IHRvIDI0NTQwLgoKPiAgLyogQlQuNjU2IEQxIG1vZGUgNzIweDQ4
MCAqLwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgaXR1X3JfYnRfNjU2
XzcyMF9tb2RlID0gewo+IC0gICAgICAgLmNsb2NrID0gMjcwMDAwMCwKPiArICAgICAgIC5jbG9j
ayA9IDI5ODgwLAoKUGxlYXNlIHNldCB0byAyNzAwMC4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
