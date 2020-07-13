Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4475A21E170
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 22:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE606E827;
	Mon, 13 Jul 2020 20:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEBF6E826;
 Mon, 13 Jul 2020 20:31:28 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g20so14941020edm.4;
 Mon, 13 Jul 2020 13:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HnzQkPBt2OC+k9du8OZiIZUdaNF8CWZvobQFWZtz7PY=;
 b=nL2QSyRF4VdhkxgtyvoDIeRb4RfXopS6tkMpm+IFtrPuzigJardjBCFktXQ//PRpIJ
 bqFBi+hg+kUy5bDekzDKXUyylgLe3CHHJG2ppWdO/NS+ljwhP3heCpJdh4lk2NnMEUfU
 ddiMB88lFu0EW/lhkvLbxvu1bX74yl9SAZxy9VD+XJIZZm5g3+WyjM+H36R+72nSUcMz
 hc2JzL2X+Qo8w0sxB69fJLfnqx/NUH8RQtLqZrOAgD/3Ui26wZjCVvHKl4TO8elowm48
 XFQilIER6Vwww/OgWOMYlYRXQ6cLge8urHT9+cBR2T8i9MGj0F5ZMoR7SyOYMpB3H1Yz
 A2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HnzQkPBt2OC+k9du8OZiIZUdaNF8CWZvobQFWZtz7PY=;
 b=e/mHFoAta7kiuy4Qwx2AP9ex/qkH+XTdBP+c9BDa2mTW5kz1+aBNb0gtFI+yvhOl+Q
 WeiENtLSNRg1HMziYatr3CcKSh93C+Ik3eOsBRtSdMDoGX3YfA/B+LehZsq4oGjpG1PV
 6Wi/CWz1HgAedYxdy4XUAQTaN4T3U7f4Fock5lMKy+fN17dv7pKU4bwKx/GYF+QIR392
 kpzya8tBVgq1Yhe+HGLCy2zcBCBae5VBX8SjMgPe99+GnWTpqPB5JUkZOYJaJnp8ppUE
 ueG1nBl/XPPIGHwy6QPTnLC0XTSc+fPcP7ceAekBuOLuC8lFPu4FkosaOp7EPVEzulSp
 WNYA==
X-Gm-Message-State: AOAM533cUpTb7jSWy2Q95+Pbhx+jivYvMyfzp++fQNZbsu68POmiy8Ed
 QBuw6PZCOfpXOIRIEp8G3DqeWnVTD+tVLHH3B1g=
X-Google-Smtp-Source: ABdhPJxPAYikRaQY/XMVDWezfOW6Iwk/c5G8BcDCGjjzvlG6bojjnVvJlH11+w5rhFd3jK7dVcdAJfhqlzC5TvPI8KA=
X-Received: by 2002:a50:ee8a:: with SMTP id f10mr1094484edr.383.1594672287315; 
 Mon, 13 Jul 2020 13:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-2-daniel.vetter@ffwll.ch>
 <20c0a95b-8367-4f26-d058-1cb265255283@amd.com>
 <20200713162610.GS3278063@phenom.ffwll.local>
 <e9e838fb-ec83-f7e0-e978-b57d8892b3f0@amd.com>
In-Reply-To: <e9e838fb-ec83-f7e0-e978-b57d8892b3f0@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 14 Jul 2020 06:31:15 +1000
Message-ID: <CAPM=9tyTd0OqtdX+pGhGm3K1odNkG5EEL+0DZwL=NiVkogOujQ@mail.gmail.com>
Subject: Re: [PATCH 01/25] dma-fence: basic lockdep annotations
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNCBKdWwgMjAyMCBhdCAwMjozOSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDEzLjA3LjIwIHVtIDE4OjI2IHNjaHJpZWIg
RGFuaWVsIFZldHRlcjoKPiA+IEhpIENocmlzdGlhbiwKPiA+Cj4gPiBPbiBXZWQsIEp1bCAwOCwg
MjAyMCBhdCAwNDo1NzoyMVBNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4+IENv
dWxkIHdlIG1lcmdlIHRoaXMgY29udHJvbGxlZCBieSBhIHNlcGFyYXRlIGNvbmZpZyBvcHRpb24/
Cj4gPj4KPiA+PiBUaGlzIHdheSB3ZSBjb3VsZCBoYXZlIHRoZSBjaGVja3MgdXBzdHJlYW0gd2l0
aG91dCBoYXZpbmcgdG8gZml4IGFsbCB0aGUKPiA+PiBzdHVmZiBiZWZvcmUgd2UgZG8gdGhpcz8K
PiA+IERpc2N1c3Npb25zIGRpZWQgb3V0IGEgYml0LCBkbyB5b3UgY29uc2lkZXIgdGhpcyBhIGJs
b2NrZXIgZm9yIHRoZSBmaXJzdAo+ID4gdHdvIHBhdGNoZXMsIG9yIGdvb2QgZm9yIGFuIGFjayBv
biB0aGVzZT8KPgo+IFllcywgSSB0aGluayB0aGUgZmlyc3QgdHdvIGNhbiBiZSBtZXJnZWQgd2l0
aG91dCBjYXVzaW5nIGFueSBwYWluLiBGZWVsCj4gZnJlZSB0byBhZGQgbXkgYWIgb24gdGhlbS4K
Pgo+IEFuZCB0aGUgdGhpcmQgb25lIGNhbiBnbyBpbiBpbW1lZGlhdGVseSBhcyB3ZWxsLgoKQWNr
ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+IGZvciB0aGUgZmlyc3QgMiAr
CmluZGVmaW5pdGUgZXhwbGFpbnMuCgpEYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
