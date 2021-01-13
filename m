Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F6A2F4D76
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28016EA36;
	Wed, 13 Jan 2021 14:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87346EA36
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:46:33 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id by27so2166342edb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=r8OIBaehnZEuiVRJz8/ZFKZGam0GarsWZNfyv9B8C2g=;
 b=UM0LEoDcOvMi5WQlutxwmnd5wPFQINfbMFbSx6fl1FbRJuYPbnF4qHxECFQREBIeTr
 GlGG82y9z7REtcvSOOHrfN3M3yxFAEPePByKzwDWk9WvHO1r0MOjjJkMlbAOfwRaJA8Q
 jdZsn5lhi/8m0YgxhS9RzR1h8OjB/pNEzp7XQhAYKb+tjVFYFD2wMLKSym7acnhXupcO
 oCwmusvlTzr0S7k0mLGRsR/FGrcUT0djsA0JfKIufiLmoZhTZpGizz4oY6+7WyjYNJxy
 7/ag8Xt8BD9PtwQ5p478yT7CkJprSb6xdyg4Bk89UyfCSmZDH7CKEcFutJvJhCHSAl5W
 kE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=r8OIBaehnZEuiVRJz8/ZFKZGam0GarsWZNfyv9B8C2g=;
 b=Ytq2LefvwIJg2pYypIWvubHWuRWR2RbIijIvHxhQ/frqKOSSx27y4t5VwI2IHlf3WC
 FSHiEoO1cIkUZ5ARSvHxLWfGdacaMATTFFzdLmriyJJogLbwoOCGp3k+7Axqwk75Jkwd
 Rw5dFSU6QYEbR6rcljJa8rT/YPVRVIoLhFduLgR69QevXO+cVfap8vJ3Z7h7LONaw5TT
 IsRE/H8QfdtIdVjCsqUXkT3wvMgU3vX60llDnhZHIbVaW/vDO9B9qB0HtvvkO/WItuR/
 Cad0EvdEfRTFXgtg+xqqfajJxxRBrQz63h2rPHKDzH7ASeoOBwsgPX/f3X4ccToJnrq0
 OmCg==
X-Gm-Message-State: AOAM533xbporLmL/kh3InWNUrwzBkz1Fwkw5DipC7oqpo/Oim1OUPIfQ
 cQBct+LVdhVbVl5mdMRReN3l41X/eWM=
X-Google-Smtp-Source: ABdhPJxMdHxm3eH1gbzdtkuTDbtYp13vukCAxk+NIMOi/QIra82gXp/gM+U+X6qQO+jiPJ/ZXAeRIw==
X-Received: by 2002:aa7:c543:: with SMTP id s3mr2036360edr.88.1610549192297;
 Wed, 13 Jan 2021 06:46:32 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t26sm805459eji.22.2021.01.13.06.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 06:46:31 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: stop using GFP_TRANSHUGE_LIGHT
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210113131325.223511-1-christian.koenig@amd.com>
 <X/71UyN5bxZCr3pe@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3e340506-79a6-1fb0-0632-aa2d4a0cc223@gmail.com>
Date: Wed, 13 Jan 2021 15:46:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/71UyN5bxZCr3pe@phenom.ffwll.local>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: hdegoede@redhat.com, ray.huang@amd.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTMuMDEuMjEgdW0gMTQ6Mjcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgSmFu
IDEzLCAyMDIxIGF0IDAyOjEzOjI1UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IFRoZSBvbmx5IGZsYWcgd2UgcmVhbGx5IG5lZWQgaXMgX19HRlBfTk9NRU1BTExPQywgaGlnaG1l
bSBkZXBlbmRzIG9uCj4+IGRtYTMyIGFuZCBtb3ZlYWJsZS9jb21wb3VuZCBzaG91bGQgbmV2ZXIg
YmUgc2V0IGluIHRoZSBmaXJzdCBwbGFjZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IE5lZWRzIEZpeGVzOiBsaW5lIGFu
ZCBSZWZlcmVuY2VzIHRvIHRoZSBHRlBfVFJBTlNIVUdFX0xJR0hUIHJlcG9ydCBmcm9tCj4gSGFu
cyBhbmQgZm9yIHRoZSBjaHJvbWl1bSByZXBvcnQgZm9yIHRoZSBtbWFwIGZhaWwuCgpXaGljaCB0
YWcgc2hvdWxkIEkgdXNlIGZvciB0aGlzPyBKdXN0IExpbms6PwoKPiAgIFdpdGggdGhvc2U6Cj4K
PiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPgo+
IEFsc28gSSBndWVzcyByZWFsbHkgdGltZSBmb3IgbWUgdG8gc3RpdGNoIHRvZ2V0aGVyIHRoYXQg
aGFjayB0byBjYXRjaAo+IGRtYS1idWYgc2dsaXN0IHN0cnVjdCBwYWdlIGFidXNlcnMgLi4uCgpP
aCwgeWVzIHBsZWFzZS4KCkNocmlzdGlhbi4KCj4gLURhbmllbAo+Cj4+IC0tLQo+PiAgIGRyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYyB8IDExICsrKysrKy0tLS0tCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X3Bvb2wuYwo+PiBpbmRleCA4Y2Q3NzZhZGM1OTIuLjExZTAzMTNkYjBlYSAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX3Bvb2wuYwo+PiBAQCAtNzksMTIgKzc5LDEzIEBAIHN0YXRpYyBzdHJ1Y3QgcGFn
ZSAqdHRtX3Bvb2xfYWxsb2NfcGFnZShzdHJ1Y3QgdHRtX3Bvb2wgKnBvb2wsIGdmcF90IGdmcF9m
bGFncywKPj4gICAJc3RydWN0IHBhZ2UgKnA7Cj4+ICAgCXZvaWQgKnZhZGRyOwo+PiAgIAo+PiAt
CWlmIChvcmRlcikgewo+PiAtCQlnZnBfZmxhZ3MgfD0gR0ZQX1RSQU5TSFVHRV9MSUdIVCB8IF9f
R0ZQX05PUkVUUlkgfAo+PiArCS8qIERvbid0IHNldCB0aGUgX19HRlBfQ09NUCBmbGFnIGZvciBo
aWdoZXIgb3JkZXIgYWxsb2NhdGlvbnMuCj4+ICsJICogTWFwcGluZyBwYWdlcyBkaXJlY3RseSBp
bnRvIGFuIHVzZXJzcGFjZSBwcm9jZXNzIGFuZCBjYWxsaW5nCj4+ICsJICogcHV0X3BhZ2UoKSBv
biBhIFRUTSBhbGxvY2F0ZWQgcGFnZSBpcyBpbGxlZ2FsLgo+PiArCSAqLwo+PiArCWlmIChvcmRl
cikKPj4gKwkJZ2ZwX2ZsYWdzIHw9IF9fR0ZQX05PTUVNQUxMT0MgfCBfX0dGUF9OT1JFVFJZIHwK
Pj4gICAJCQlfX0dGUF9LU1dBUERfUkVDTEFJTTsKPj4gLQkJZ2ZwX2ZsYWdzICY9IH5fX0dGUF9N
T1ZBQkxFOwo+PiAtCQlnZnBfZmxhZ3MgJj0gfl9fR0ZQX0NPTVA7Cj4+IC0JfQo+PiAgIAo+PiAg
IAlpZiAoIXBvb2wtPnVzZV9kbWFfYWxsb2MpIHsKPj4gICAJCXAgPSBhbGxvY19wYWdlcyhnZnBf
ZmxhZ3MsIG9yZGVyKTsKPj4gLS0gCj4+IDIuMjUuMQo+PgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
