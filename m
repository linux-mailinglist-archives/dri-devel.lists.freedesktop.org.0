Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ED121B652
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 15:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFFF6EC43;
	Fri, 10 Jul 2020 13:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB1F6EC43
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 13:27:35 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BB192082E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594387655;
 bh=mNW++VsEqP3S7PL2ngGMIOCMSfxmahBdnZ67NyJxUvU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y29NVJdkXAxsgk2xI3t1jiVzttBFvTNx8HCPIKiN8ZM7ftE9wB6zTnP1BMb0MkiHU
 QendZh5SWBTBNOnp2LBOwt7y9i89bCxloiL/H5BpHgUTMz/HsVGIVwSr+QGFlWIjcr
 y7jk4l2N4ARxgyR+SRTlUkcRkdfqRggSEE0L6X1I=
Received: by mail-oi1-f182.google.com with SMTP id 12so4783877oir.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 06:27:35 -0700 (PDT)
X-Gm-Message-State: AOAM531d7j2W8lsqnZ2rsd52vFg//sfh78aMLn/W1du41NoVt9N64/Ro
 IfjwF6+YVdjuCZZUPMtZJq8PdXgIB1U6xGW97OU=
X-Google-Smtp-Source: ABdhPJx27k85cRD5Br4iASr1hfkX2ZBE1Hh91r9eyyCurmoSEz5t5x80h7mauiVvJR80iRujQZjgdIQ5i6DKyNJJWKM=
X-Received: by 2002:aca:d643:: with SMTP id n64mr4195802oig.33.1594387654399; 
 Fri, 10 Jul 2020 06:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200610141052.13258-1-jgross@suse.com>
 <094be567-2c82-7d5b-e432-288286c6c3fb@suse.com>
 <CGME20200709091750eucas1p18003b0c8127600369485c62c1e587c22@eucas1p1.samsung.com>
 <ec21b883-dc5c-f3fe-e989-7fa13875a4c4@suse.com>
 <170e01b1-220d-5cb7-03b2-c70ed3ae58e4@samsung.com>
In-Reply-To: <170e01b1-220d-5cb7-03b2-c70ed3ae58e4@samsung.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Jul 2020 16:27:23 +0300
X-Gmail-Original-Message-ID: <CAMj1kXGE52Y6QQhGLU6r_9x6TVftZqfS7zyLCiDusZhV4tbhjg@mail.gmail.com>
Message-ID: <CAMj1kXGE52Y6QQhGLU6r_9x6TVftZqfS7zyLCiDusZhV4tbhjg@mail.gmail.com>
Subject: Re: [PATCH] efi: avoid error message when booting under Xen
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 linux-fbdev@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Peter Jones <pjones@redhat.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMCBKdWwgMjAyMCBhdCAxMzoxNywgQmFydGxvbWllaiBab2xuaWVya2lld2ljego8
Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+Cj4gWyBhZGRlZCBFRkkgTWFpbnRh
aW5lciAmIE1MIHRvIENjOiBdCj4KPiBIaSwKPgo+IE9uIDcvOS8yMCAxMToxNyBBTSwgSsO8cmdl
biBHcm/DnyB3cm90ZToKPiA+IE9uIDI4LjA2LjIwIDEwOjUwLCBKw7xyZ2VuIEdyb8OfIHdyb3Rl
Ogo+ID4+IFBpbmc/Cj4gPj4KPiA+PiBPbiAxMC4wNi4yMCAxNjoxMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiA+Pj4gZWZpZmJfcHJvYmUoKSB3aWxsIGlzc3VlIGFuIGVycm9yIG1lc3NhZ2UgaW4g
Y2FzZSB0aGUga2VybmVsIGlzIGJvb3RlZAo+ID4+PiBhcyBYZW4gZG9tMCBmcm9tIFVFRkkgYXMg
RUZJX01FTU1BUCB3b24ndCBiZSBzZXQgaW4gdGhpcyBjYXNlLiBBdm9pZAo+ID4+PiB0aGF0IG1l
c3NhZ2UgYnkgY2FsbGluZyBlZmlfbWVtX2Rlc2NfbG9va3VwKCkgb25seSBpZiBFRklfUEFSQVZJ
UlQKPiA+Pj4gaXNuJ3Qgc2V0Lgo+ID4+PgoKV2h5IG5vdCB0ZXN0IGZvciBFRklfTUVNTUFQIGlu
c3RlYWQgb2YgRUZJX0JPT1Q/CgoKPiA+Pj4gRml4ZXM6IDM4YWMwMjg3YjdmNCAoImZiZGV2L2Vm
aWZiOiBIb25vdXIgVUVGSSBtZW1vcnkgbWFwIGF0dHJpYnV0ZXMgd2hlbiBtYXBwaW5nIHRoZSBG
QiIpCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
PiA+Pj4gLS0tCj4gPj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9lZmlmYi5jIHwgMiArLQo+ID4+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4+Pgo+
ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9lZmlmYi5jIGIvZHJpdmVycy92
aWRlby9mYmRldi9lZmlmYi5jCj4gPj4+IGluZGV4IDY1NDkxYWU3NDgwOC4uZjVlY2NkMTM3M2U5
IDEwMDY0NAo+ID4+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZiLmMKPiA+Pj4gKysr
IGIvZHJpdmVycy92aWRlby9mYmRldi9lZmlmYi5jCj4gPj4+IEBAIC00NTMsNyArNDUzLDcgQEAg
c3RhdGljIGludCBlZmlmYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCj4gPj4+
ICAgICAgIGluZm8tPmFwZXJ0dXJlcy0+cmFuZ2VzWzBdLmJhc2UgPSBlZmlmYl9maXguc21lbV9z
dGFydDsKPiA+Pj4gICAgICAgaW5mby0+YXBlcnR1cmVzLT5yYW5nZXNbMF0uc2l6ZSA9IHNpemVf
cmVtYXA7Cj4gPj4+IC0gICAgaWYgKGVmaV9lbmFibGVkKEVGSV9CT09UKSAmJgo+ID4+PiArICAg
IGlmIChlZmlfZW5hYmxlZChFRklfQk9PVCkgJiYgIWVmaV9lbmFibGVkKEVGSV9QQVJBVklSVCkg
JiYKPiA+Pj4gICAgICAgICAgICFlZmlfbWVtX2Rlc2NfbG9va3VwKGVmaWZiX2ZpeC5zbWVtX3N0
YXJ0LCAmbWQpKSB7Cj4gPj4+ICAgICAgICAgICBpZiAoKGVmaWZiX2ZpeC5zbWVtX3N0YXJ0ICsg
ZWZpZmJfZml4LnNtZW1fbGVuKSA+Cj4gPj4+ICAgICAgICAgICAgICAgKG1kLnBoeXNfYWRkciAr
IChtZC5udW1fcGFnZXMgPDwgRUZJX1BBR0VfU0hJRlQpKSkgewo+ID4+Pgo+ID4+Cj4gPgo+ID4g
SW4gY2FzZSBJIHNlZSBubyByZWFjdGlvbiBmcm9tIHRoZSBtYWludGFpbmVyIGZvciBhbm90aGVy
IHdlZWsgSSdsbCB0YWtlCj4gPiB0aGlzIHBhdGNoIHRocm91Z2ggdGhlIFhlbiB0cmVlLgo+Cj4g
RnJvbSBmYmRldiBQT1YgdGhpcyBjaGFuZ2UgbG9va3MgZmluZSB0byBtZSBhbmQgSSdtIE9LIHdp
dGggbWVyZ2luZyBpdAo+IHRocm91Z2ggWGVuIG9yIEVGSSB0cmVlOgo+Cj4gQWNrZWQtYnk6IEJh
cnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPgo+IEJl
c3QgcmVnYXJkcywKPiAtLQo+IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKPiBTYW1zdW5nIFIm
RCBJbnN0aXR1dGUgUG9sYW5kCj4gU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
