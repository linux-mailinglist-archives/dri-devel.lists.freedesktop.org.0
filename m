Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC10B10C271
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 03:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961DF6E5E7;
	Thu, 28 Nov 2019 02:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAFC6E5E7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 02:37:21 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e9so26685740ljp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 18:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5REmEVOpMqicZFWt4ii+unqDoEikVdqlvJoPRKCdKbo=;
 b=KKIktuNKmk2BCmvNY9CECSjO6VcGVg1P7ZT8MqVvtoQKyTavRNPb7/eLT+9SlQnMHZ
 PSmyE8EfdsZmotnfrhOPGgDw/3ctH7bz0ZRX7E74mEu0TmqznnOoH6gz+xKaGWafinov
 F+D6bSylQxZpQi48UJFtLgufBWhNNUsG4jvZxgJt04aaKJmHN7BgUt6UwN8b3KdiDB/8
 YwMo5fdelva2ehVP9NXXxAjdVilk+I/Ee+crplpG8+lfCTpDcme0IDbj/SBFlvH7rnLp
 XjFfWZLKWDnWeeZfeyHzjBanVkcPxHNwPChwj/KhOhgaUIk4TqSWYyfYEU+jZFRpVaIN
 IyXw==
X-Gm-Message-State: APjAAAVN+vLMTecdrnzb9CX0kPZWlurIKVz3HJmRbHlLzizPj9AD001L
 l49yj41SXnG+BJdBqwNzJAPil65skf+F9PZ2V0w=
X-Google-Smtp-Source: APXvYqya2Qp6M4J9fgghKq2sCsVrxPF2sfveO3PoJ+Zjj5QngKx+1ACuq2onZ4LY00tt63rnX36CO1bO3kkuHqIK1BA=
X-Received: by 2002:a05:651c:87:: with SMTP id 7mr33530905ljq.20.1574908639457; 
 Wed, 27 Nov 2019 18:37:19 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9ty6MLNc4qYKOAO3-eFDpQtm9hGPg9hPQOm4iRg_8MkmNw@mail.gmail.com>
 <CAHk-=whdhd69G1AiYTQKSB-RApOVbmzmAzO=+oW+yHO-NXLhkQ@mail.gmail.com>
In-Reply-To: <CAHk-=whdhd69G1AiYTQKSB-RApOVbmzmAzO=+oW+yHO-NXLhkQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 28 Nov 2019 12:37:06 +1000
Message-ID: <CAPM=9tz3pFTOO45pGcZv+nGf29He-p03fXHbG4sNoCYxZzXkRQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.5-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5REmEVOpMqicZFWt4ii+unqDoEikVdqlvJoPRKCdKbo=;
 b=L/fh+FfYxt1npHHb26t0HZ9oc+ybSMlfF9Vbyp4+lUCnaWKHLBsLPaVTDI6CtUNHnI
 07OJ32QxcISH3XQ+mD0bUn5itsgSNyn9KBAHH8qbshbIHOoZGA5ggU6pCv201AY9h2ez
 4xH8drxFjr7TLlylEIEVPMdho4qZ+2f8U/6DO9iEpAi+HEkKVFv9FQjw/sFhVR5/uSdo
 itp8xCu305vLuX6kn4vx6zcwEgdAScgMne50ZlJbUs8RPBHsfq+lMih86FSvCoj4ELQd
 q7sJZKtR3rE3ozluM8bOsLR1+OglysejpkxzWvTiVp160Er55cowTlRWhrhFuVEqKiY1
 l/mw==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyOCBOb3YgMjAxOSBhdCAxMTo1MSwgTGludXMgVG9ydmFsZHMKPHRvcnZhbGRzQGxp
bnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTm92IDI3LCAyMDE5IGF0IDQ6
NTkgUE0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBteSBz
YW1wbGUgbWVyZ2UgaXMgaGVyZToKPiA+IGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvfmFp
cmxpZWQvbGludXgvbG9nLz9oPWRybS1uZXh0LTUuNS1tZXJnZWQKPgo+IEhtbS4gSSB0aGluayB5
b3UgbWlzc2VkIGEgY291cGxlOiB5b3UgbGVmdCBhIGR1cGxpY2F0ZQo+IGludGVsX3VwZGF0ZV9y
YXdjbGsoKSBhcm91bmQgKGl0IGdvdCBtb3ZlZCBpbnRvCj4gaW50ZWxfcG93ZXJfZG9tYWluc19p
bml0X2h3KCkgYnkgY29tbWl0IDJmMjE2YTg1MDcxNSAoImRybS9pOTE1Ogo+IHVwZGF0ZSByYXdj
bGsgYWxzbyBvbiByZXN1bWUiKSwgYW5kIHlvdSBsZWZ0IHRoZSAic2VsZWN0Cj4gUkVGQ09VTlRf
RlVMTCIgdGhhdCBubyBsb25nZXIgZXhpc3RzLgoKT29wcyBzbyBJIHNob3VsZCBoYXZlIG1vcmUg
Y2FmZmVpbmUgYmVmb3JlIEkgZGlkIHRoYXQgbWVyZ2UsIHRoYW5rcwpmb3IgY2F0Y2hpbmcgdGhv
c2UuCj4KPiBBbmQgYXBwYXJlbnRseSBub2JvZHkgYm90aGVyZWQgdG8gdGVsbCBtZSBhYm91dCB0
aGUgc2VtYW50aWMgY29uZmxpY3QKPiB3aXRoIHRoZSBtZWRpYSB0cmVlIGR1ZSB0byB0aGUgY2hh
bmdlZCBjYWxsaW5nIGNvbnZlbnRpb24gb2YKPiBjZWNfbm90aWZpZXJfY2VjX2FkYXBfdW5yZWdp
c3RlcigpLiBEaWRuJ3QgdGhhdCBzaG93IHVwIGluIGxpbnV4LW5leHQ/CgpJIGNhbiBzZWUgbm8g
bWVudGlvbiBvZiBpdCwgSSd2ZSBnb3QKCkhhbnMgc2F5aW5nCgoiVGhpcyB3aWxsIG9ubHkgYmUg
YSBwcm9ibGVtIGlmIGEgbmV3IENFQyBhZGFwdGVyIGRyaXZlciBpcyBhZGRlZCB0byB0aGUgbWVk
aWEKc3Vic3lzdGVtIGZvciB2NS41LCBidXQgSSBhbSBub3QgYXdhcmUgb2YgYW55IHBsYW5zIGZv
ciB0aGF0LiIgd2hlbiBJCmxhbmRlZCB0aGF0CmluIG15IHRyZWUsIGJ1dCBJIGFzc3VtZSB0aGUg
YW8tY2VjIGNoYW5nZSBpbiB0aGUgbWVkaWEgdHJlZSBjb2xsaWRlZCB3aXRoIGl0LgoKQnV0IEkg
aGFkbid0IHNlZW4gYW55IG1lbnRpb24gb2YgaXQgZnJvbSAtbmV4dCBiZWZvcmUgeW91IG1lbnRp
b25lZCBpdCBub3cuCgpEYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
