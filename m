Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8364F33799E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 17:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B6A6E978;
	Thu, 11 Mar 2021 16:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6636E505
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 16:41:12 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id c10so47464216ejx.9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 08:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m/FeYrx17SS+gOiQek3l9jKsFiAYMuTY2tZvPsNdW/4=;
 b=OJM492BxeZxilecBamCl7nKt8yBeJIhTE78QQMXcdE7+1OAkKAovV+mDxfBkpLDBaz
 km/pmr2eoBa6v/kjINxnaTCYiuzShWFSjtdS5GSOMnS6yaD71lfj0vzKtOqFiGiCzdp9
 qZurSQiVGZ2Kwo5Q+DRkx0pbmfzzp69Lc7/7k1yxe0bNKio1rqcnXP/mhqhqwuemzNft
 G0ppIaGzHPqYWlob4mjulfnzU57ze8uSK4zNikjthOXAlh7RT8nmzZBerJ8US7FRwC5d
 ri5mZdN7q8HCAmJnbMa6UivdOMjthLD3dNO4NIQk+VdSdJYofB5rElQRqN2TzZ0RXq+8
 +siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m/FeYrx17SS+gOiQek3l9jKsFiAYMuTY2tZvPsNdW/4=;
 b=nd9yopWB4g77cvsP/bxhNV6CF7pfC/1u1RlyIknd1mpYEucXtXBGDdL4ZECRv1Fww/
 uVaRFmvEAtICBKrnFD1y1NFJL8dJSqOcEUtvgpoERDBApuruUoRyXFEWUPG4RFm1uH0X
 2x2Ar5FDgkjevKysUvKNC9hV7YL4Imz5F6kPK8cJZ1VfEHBWC30/zrhjYDwyAmE14CBn
 t9ix/WJ3yMqIaBzG1FhFFF3R4dhJ5EthYmSoVNdfJ9MjVrsAA90MnePR5N3WV6TwaVRr
 9WxkWikkLew/KGiuY5Z1qMlZVHOTS0MA7Ajphily22Am1KrjGLYT/Bhc0543V1VpKL1D
 XvgQ==
X-Gm-Message-State: AOAM533qX5/rUAZq5mfGLgFs82CT/cQySW50kAGFarxGiZp/ScL/pesn
 Ml9uJfYi1+Yl8qgVXfIGN4uW6mR7dmuAWXAYBuHiOQ==
X-Google-Smtp-Source: ABdhPJyQQ+bOAL/5/cFgJwxxQ7SQHBhA921Krf8AGbq3OhRjpVyR5nFZ6rTK5xs7l0KD8EgAgm9MxCVPhTBZEB2uPDI=
X-Received: by 2002:a17:906:b288:: with SMTP id
 q8mr3919061ejz.210.1615480870640; 
 Thu, 11 Mar 2021 08:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20210310212606.766121-1-jason@jlekstrand.net>
 <20210310215007.782649-1-jason@jlekstrand.net>
 <20210311114432.GB101473@zkempczy-mobl2>
 <161548027193.13836.14203592427794395157@build.alporthouse.com>
In-Reply-To: <161548027193.13836.14203592427794395157@build.alporthouse.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 11 Mar 2021 10:40:59 -0600
Message-ID: <CAOFGe973meQ84Yzhd+bXb+i3Lsc9bXJCiarfcukM8tos78xBFA@mail.gmail.com>
Subject: Re: [PATCH] i915: Drop relocation support on all new hardware (v3)
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMTEsIDIwMjEgYXQgMTA6MzEgQU0gQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+IHdyb3RlOgo+Cj4gUXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kg
KDIwMjEtMDMtMTEgMTE6NDQ6MzIpCj4gPiBPbiBXZWQsIE1hciAxMCwgMjAyMSBhdCAwMzo1MDow
N1BNIC0wNjAwLCBKYXNvbiBFa3N0cmFuZCB3cm90ZToKPiA+ID4gVGhlIFZ1bGthbiBkcml2ZXIg
aW4gTWVzYSBmb3IgSW50ZWwgaGFyZHdhcmUgbmV2ZXIgdXNlcyByZWxvY2F0aW9ucyBpZgo+ID4g
PiBpdCdzIHJ1bm5pbmcgb24gYSB2ZXJzaW9uIG9mIGk5MTUgdGhhdCBzdXBwb3J0cyBhdCBsZWFz
dCBzb2Z0cGluIHdoaWNoCj4gPiA+IGFsbCB2ZXJzaW9ucyBvZiBpOTE1IHN1cHBvcnRpbmcgR2Vu
MTIgZG8uICBPbiB0aGUgT3BlbkdMIHNpZGUsIEdlbjEyKyBpcwo+ID4gPiBvbmx5IHN1cHBvcnRl
ZCBieSBpcmlzIHdoaWNoIG5ldmVyIHVzZXMgcmVsb2NhdGlvbnMuICBUaGUgb2xkZXIgaTk2NQo+
ID4gPiBkcml2ZXIgaW4gTWVzYSBkb2VzIHVzZSByZWxvY2F0aW9ucyBidXQgaXQgb25seSBzdXBw
b3J0cyBJbnRlbCBoYXJkd2FyZQo+ID4gPiB0aHJvdWdoIEdlbjExIGFuZCBoYXMgYmVlbiBkZXBy
ZWNhdGVkIGZvciBhbGwgaGFyZHdhcmUgR2VuOSsuICBUaGUKPiA+ID4gY29tcHV0ZSBkcml2ZXIg
YWxzbyBuZXZlciB1c2VzIHJlbG9jYXRpb25zLiAgVGhpcyBvbmx5IGxlYXZlcyB0aGUgbWVkaWEK
PiA+ID4gZHJpdmVyIHdoaWNoIGlzIHN1cHBvc2VkIHRvIGJlIHN3aXRjaGluZyB0byBzb2Z0cGlu
IGdvaW5nIGZvcndhcmQuCj4gPiA+IE1ha2luZyBzb2Z0cGluIGEgcmVxdWlyZW1lbnQgZm9yIGFs
bCBmdXR1cmUgaGFyZHdhcmUgc2VlbXMgcmVhc29uYWJsZS4KPiA+ID4KPiA+ID4gUmVqZWN0aW5n
IHJlbG9jYXRpb25zIHN0YXJ0aW5nIHdpdGggR2VuMTIgaGFzIHRoZSBiZW5lZml0IHRoYXQgd2Ug
ZG9uJ3QKPiA+ID4gaGF2ZSB0byBib3RoZXIgc3VwcG9ydGluZyBpdCBvbiBwbGF0Zm9ybXMgd2l0
aCBsb2NhbCBtZW1vcnkuICBHaXZlbiBob3cKPiA+ID4gbXVjaCBDUFUgdG91Y2hpbmcgb2YgbWVt
b3J5IGlzIHJlcXVpcmVkIGZvciByZWxvY2F0aW9ucywgbm90IGhhdmluZyB0bwo+ID4gPiBkbyBz
byBvbiBwbGF0Zm9ybXMgd2hlcmUgbm90IGFsbCBtZW1vcnkgaXMgZGlyZWN0bHkgQ1BVLWFjY2Vz
c2libGUKPiA+ID4gY2FycmllcyBzaWduaWZpY2FudCBhZHZhbnRhZ2VzLgo+ID4gPgo+ID4gPiB2
MiAoSmFzb24gRWtzdHJhbmQpOgo+ID4gPiAgLSBBbGxvdyBUR0wtTFAgcGxhdGZvcm1zIGFzIHRo
ZXkndmUgYWxyZWFkeSBzaGlwcGVkCj4gPiA+Cj4gPiA+IHYzIChKYXNvbiBFa3N0cmFuZCk6Cj4g
PiA+ICAtIFdBUk5fT04gcGxhdGZvcm1zIHdpdGggTE1FTSBzdXBwb3J0IGluIGNhc2UgdGhlIGNo
ZWNrIGlzIHdyb25nCj4gPgo+ID4gSSB3YXMgYXNrZWQgdG8gcmV2aWV3IG9mIHRoaXMgcGF0Y2gu
IEl0IHdvcmtzIGFsb25nIHdpdGggZXhwZWN0ZWQKPiA+IElHVCBjaGVjayBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNDIzMzYxLz9zZXJpZXM9ODI5NTQmcmV2PTI1Cj4g
Pgo+ID4gQmVmb3JlIEknbGwgZ2l2ZSB5b3Ugci1iIC0gaXNuJ3QgaTkxNV9nZW1fZXhlY2J1ZmZl
cjJfaW9jdGwoKSBiZXR0ZXIgcGxhY2UKPiA+IHRvIGRvIGZvciBsb29wIGp1c3QgYWZ0ZXIgY29w
eV9mcm9tX3VzZXIoKSBhbmQgY2hlY2sgcmVsb2NhdGlvbl9jb3VudD8KPiA+IFdlIGhhdmUgYW4g
YWNjZXNzIHRvIGV4ZWMyX2xpc3QgdGhlcmUsIHdlIGtub3cgdGhlIGdlbiBzbyB3ZSdyZSBhYmxl
IHRvIHNheQo+ID4gcmVsb2NhdGlvbnMgYXJlIG5vdCBzdXBwb3J0ZWQgaW1tZWRpYXRlLCB3aXRo
b3V0IGVudGVyaW5nIGk5MTVfZ2VtX2RvX2V4ZWNidWZmZXIoKS4KPgo+IFRoZXJlJ3MgYSBOT1JF
TE9DIGZsYWcgeW91IGNhbiBlbmZvcmNlIGFzIG1hbmRhdG9yeS4gVGhhdCdzIHRyaXZpYWwgZm9y
Cj4gdXNlcnNwYWNlIHRvIHNldCwgcmVhbGx5IG1ha2VzIHN1cmUgdGhleSBhcmUgYXdhcmUgb2Yg
dGhlIGNoYW5nZSBhZm9vdCwKPiBhbmQgaTkxNV9nZW1fY2Vja19leGVjYnVmZmVyKCkgd2lsbCBw
ZXJmb3JtIHRoZSB2YWxpZGF0aW9uIHVwZnJvbnQgd2l0aAo+IHRoZSBvdGhlciBmbGFnIGNoZWNr
cy4KCk5PUkVMT0MgZG9lc24ndCBxdWl0ZSBlbnN1cmUgdGhhdCB0aGVyZSBhcmUgbm8gcmVsb2Nh
dGlvbnM7IGl0IGp1c3QKbWFrZXMgdGhpbmdzIG9wdGlvbmFsIGlmIHRoZSBrZXJuZWwgaGFzbid0
IG1vdmVkIGFueXRoaW5nLiAgSSBndWVzcyB3ZQpjb3VsZCByZXF1aXJlIHVzZXJzcGFjZSB0byBz
ZXQgaXQgYnV0IGl0IGFsc28gZG9lc24ndCBkbyBhbnl0aGluZyBpZgp0aGVyZSBhcmUgbm8gcmVs
b2NhdGlvbnMgdG8gYmVnaW4gd2l0aC4gIEkgdGhpbmsgSSdkIHBlcnNvbmFsbHkgZXJyIG9uCnRo
ZSBzaWRlIG9mIG5vdCByZXF1aXJpbmcgcG9pbnRsZXNzIGZsYWdzLgoKLS1KYXNvbgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
