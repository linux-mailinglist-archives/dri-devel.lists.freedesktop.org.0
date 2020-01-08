Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAB21349CD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 18:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070086E20E;
	Wed,  8 Jan 2020 17:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC416E1F9;
 Wed,  8 Jan 2020 17:51:46 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b19so3444437wmj.4;
 Wed, 08 Jan 2020 09:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aSdZ3aFnA3oyaNn1PxZQVkM/xC6wM/NzLRYNPjDKtGk=;
 b=UJhDdgdsjUO4ywVeJCCVBEmXe8zl1IVqpO8NefBS2jzudGUW4Ae1UiSDzymlFkIjwi
 npZKTirPA9lIsiJKG3hqeOv+ke6PPLyf+Io8IIMEuw69PfOiPlK9UnqHHwGos51O83Xj
 ZEkv0zTlRoT+k3SZtoh6xRRyyA/Jn9S2LetiBTUNeYN6CduaKdEs6zOC81C0sLdtneJL
 7uD2jnziR0kXpdYo6IkvIIJJkELJjM+VSh4aiKMzcukzjGS7adDJtTEflxGBdTdAl548
 asURoyc2sTGOOzwgqlv7EuE0tu9xuIs7jS3XmN/ysLbLU+Spq1yWM+/wxYjuSSv0BPWq
 kuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aSdZ3aFnA3oyaNn1PxZQVkM/xC6wM/NzLRYNPjDKtGk=;
 b=jmXS/j11cwXWCCu2yYJB1FkpVcRQ+0BlTZRHBI5nP1SmmmtDn2BmnDEqEsz201qCa3
 DWXqZzGli5FsN+7t0qB1hWIGlsbfZ6VXKJmVoAf+WyQ63gDHJsep24Ey6rEQXVSL7XvC
 CrKRjBpHXDqGNjh0VvbnM+D3bnPpKnhxKHCdH7JuNCUTb666m+bURX+OAAfii+fzTxOR
 s4Vt8psSw7DEArWm2fk29EB/3kBMaMaEeSW9kVfDSGo5m+jMxNHu/9dOOaYKzFUENP4O
 bt68pkrqMNQ1gOUN9HYTkX1mJLllnWoxKzWScvV/X9BCKv5HgmXGF5t36zCT1zzLInPI
 LFsw==
X-Gm-Message-State: APjAAAWg1AGpXzYpYhqgL2dPNIRXzt+A6o9vdppZjWXJlazerYnznIQf
 CNEO7r9KnLHVWWyqDMt3p5zi2xQwpLpoDEOXDSM=
X-Google-Smtp-Source: APXvYqxq2sDXTbxb3S/PFtXkOw3vuLm8LBRlfNKToeO7JJ0ai3l9PSPUe8NacQTzdquRiCfMd9pHXIWsiukQguGIiQ4=
X-Received: by 2002:a1c:f30e:: with SMTP id q14mr5231788wmq.65.1578505904939; 
 Wed, 08 Jan 2020 09:51:44 -0800 (PST)
MIME-Version: 1.0
References: <20200107192555.20606-1-tli@digitalocean.com>
 <b5984995-7276-97d3-a604-ddacfb89bd89@amd.com>
 <202001080936.A36005F1@keescook>
In-Reply-To: <202001080936.A36005F1@keescook>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Jan 2020 12:51:33 -0500
Message-ID: <CADnq5_NLS=CuHD39utCTnTVsY_izuTPXFfsew6TpMjovgFoT5g@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/radeon: have the callers of set_memory_*() check
 the return value
To: Kees Cook <keescook@chromium.org>
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
Cc: kernel-hardening@lists.openwall.com, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tianlin Li <tli@digitalocean.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gOCwgMjAyMCBhdCAxMjozOSBQTSBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9t
aXVtLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEphbiAwOCwgMjAyMCBhdCAwMTo1Njo0N1BNICsw
MTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4gQW0gMDcuMDEuMjAgdW0gMjA6MjUgc2No
cmllYiBUaWFubGluIExpOgo+ID4gPiBSaWdodCBub3cgc2V2ZXJhbCBhcmNoaXRlY3R1cmVzIGFs
bG93IHRoZWlyIHNldF9tZW1vcnlfKigpIGZhbWlseSBvZgo+ID4gPiBmdW5jdGlvbnMgdG8gZmFp
bCwgYnV0IGNhbGxlcnMgbWF5IG5vdCBiZSBjaGVja2luZyB0aGUgcmV0dXJuIHZhbHVlcy4KPiA+
ID4gSWYgc2V0X21lbW9yeV8qKCkgcmV0dXJucyB3aXRoIGFuIGVycm9yLCBjYWxsLXNpdGUgYXNz
dW1wdGlvbnMgbWF5IGJlCj4gPiA+IGluZmFjdCB3cm9uZyB0byBhc3N1bWUgdGhhdCBpdCB3b3Vs
ZCBlaXRoZXIgc3VjY2VlZCBvciBub3Qgc3VjY2VlZCBhdAo+ID4gPiBhbGwuIElkZWFsbHksIHRo
ZSBmYWlsdXJlIG9mIHNldF9tZW1vcnlfKigpIHNob3VsZCBiZSBwYXNzZWQgdXAgdGhlCj4gPiA+
IGNhbGwgc3RhY2ssIGFuZCBjYWxsZXJzIHNob3VsZCBleGFtaW5lIHRoZSBmYWlsdXJlIGFuZCBk
ZWFsIHdpdGggaXQuCj4gPiA+Cj4gPiA+IE5lZWQgdG8gZml4IHRoZSBjYWxsZXJzIGFuZCBhZGQg
dGhlIF9fbXVzdF9jaGVjayBhdHRyaWJ1dGUuIFRoZXkgYWxzbwo+ID4gPiBtYXkgbm90IHByb3Zp
ZGUgYW55IGxldmVsIG9mIGF0b21pY2l0eSwgaW4gdGhlIHNlbnNlIHRoYXQgdGhlIG1lbW9yeQo+
ID4gPiBwcm90ZWN0aW9ucyBtYXkgYmUgbGVmdCBpbmNvbXBsZXRlIG9uIGZhaWx1cmUuIFRoaXMg
aXNzdWUgbGlrZWx5IGhhcyBhCj4gPiA+IGZldyBzdGVwcyBvbiBlZmZlY3RzIGFyY2hpdGVjdHVy
ZXM6Cj4gPiA+IDEpSGF2ZSBhbGwgY2FsbGVycyBvZiBzZXRfbWVtb3J5XyooKSBoZWxwZXJzIGNo
ZWNrIHRoZSByZXR1cm4gdmFsdWUuCj4gPiA+IDIpQWRkIF9fbXVzdF9jaGVjayB0byBhbGwgc2V0
X21lbW9yeV8qKCkgaGVscGVycyBzbyB0aGF0IG5ldyB1c2VzIGRvCj4gPiA+IG5vdCBpZ25vcmUg
dGhlIHJldHVybiB2YWx1ZS4KPiA+ID4gMylBZGQgYXRvbWljaXR5IHRvIHRoZSBjYWxscyBzbyB0
aGF0IHRoZSBtZW1vcnkgcHJvdGVjdGlvbnMgYXJlbid0IGxlZnQKPiA+ID4gaW4gYSBwYXJ0aWFs
IHN0YXRlLgo+ID4gPgo+ID4gPiBUaGlzIHNlcmllcyBpcyBwYXJ0IG9mIHN0ZXAgMS4gTWFrZSBk
cm0vcmFkZW9uIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgb2YKPiA+ID4gc2V0X21lbW9yeV8qKCku
Cj4gPgo+ID4gSSdtIGEgbGl0dGxlIGhlc2l0YXRlIG1lcmdlIHRoYXQuIFRoaXMgaGFyZHdhcmUg
aXMgPjE1IHllYXJzIG9sZCBhbmQgbm9ib2R5Cj4gPiBvZiB0aGUgZGV2ZWxvcGVycyBoYXZlIGFu
eSBzeXN0ZW0gbGVmdCB0byB0ZXN0IHRoaXMgY2hhbmdlIG9uLgo+Cj4gSWYgdGhhdCdzIHRydWUg
aXQgc2hvdWxkIGJlIHJlbW92ZWQgZnJvbSB0aGUgdHJlZS4gV2UgbmVlZCB0byBiZSBhYmxlIHRv
Cj4gY29ycmVjdGx5IG1ha2UgdGhlc2Uga2luZHMgb2YgY2hhbmdlcyBpbiB0aGUga2VybmVsLgoK
VGhpcyBkcml2ZXIgc3VwcG9ydHMgYWJvdXQgMTUgeWVhcnMgb2YgaGFyZHdhcmUgZ2VuZXJhdGlv
bnMuICBOZXdlcgpjYXJkcyBhcmUgc3RpbGwgcHJldmFsZW50LCBidXQgdGhlIG9sZGVyIHN0dWZm
IGlzIGxlc3Mgc28uICBJdCBzdGlsbAp3b3JrcyBhbmQgcGVvcGxlIHVzZSBpdCBiYXNlZCBvbiBm
ZWVkYmFjayBJJ3ZlIHNlZW4sIGJ1dCB0aGUgb2xkZXIKc3R1ZmYgaGFzIG5vIGFjdGl2ZSBkZXZl
bG9wbWVudCBhdCB0aGlzIHBvaW50LiAgVGhpcyBjaGFuZ2UganVzdApoYXBwZW5zIHRvIHRhcmdl
dCB0aG9zZSBvbGRlciBjaGlwcy4KCkFsZXgKCj4KPiA+IFdvdWxkIGl0IGJlIHRvIG11Y2ggb2Yg
YSBwcm9ibGVtIHRvIGp1c3QgYWRkIHNvbWV0aGluZyBsaWtlOiByID0KPiA+IHNldF9tZW1vcnlf
KigpOyAodm9pZClyOyAvKiBJbnRlbnRpb25hbGx5IGlnbm9yZWQgKi8uCj4KPiBUaGlzIHNlZW1z
IGxpa2UgYSBiYWQgaWRlYSAtLSB3ZSBzaG91bGRuJ3QgYmUgcGFwZXJpbmcgb3ZlciBmYWlsdXJl
cwo+IGxpa2UgdGhpcyB3aGVuIHRoZXJlIGlzIGxvZ2ljIGF2YWlsYWJsZSB0byBkZWFsIHdpdGgg
aXQuCj4KPiA+IEFwYXJ0IGZyb20gdGhhdCBjZXJ0YWlubHkgYSBnb29kIGlkZWEgdG8gYWRkIF9f
bXVzdF9jaGVjayB0byB0aGUgZnVuY3Rpb25zLgo+Cj4gQWdyZWVkIQo+Cj4gLUtlZXMKPgo+IC0t
Cj4gS2VlcyBDb29rCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
