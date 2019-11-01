Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17811EC516
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 15:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34E96F81C;
	Fri,  1 Nov 2019 14:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686306F81C;
 Fri,  1 Nov 2019 14:52:15 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id B473C60EE7; Fri,  1 Nov 2019 14:52:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CDC2460A73;
 Fri,  1 Nov 2019 14:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CDC2460A73
Date: Fri, 1 Nov 2019 08:52:09 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [Freedreno] [PATCH RESEND] drm/msm/adreno: Do not print error on
 "qcom, gpu-pwrlevels" absence
Message-ID: <20191101145209.GA16446@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Fabio Estevam <festevam@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Sean Paul <sean@poorly.run>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Chris Healy <cphealy@gmail.com>
References: <20191015134012.15165-1-festevam@gmail.com>
 <CAOCk7NpoGA8VmTXSk96VxVtGU2yFs0+n8wyBeQkvwR8HZSOCRQ@mail.gmail.com>
 <CAOMZO5AnZ2dhgxsLVUSDqSGcPH8T1yOABWrqEniKotONTR29fw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5AnZ2dhgxsLVUSDqSGcPH8T1yOABWrqEniKotONTR29fw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1572619934;
 bh=15Q6V8/IMsJEoMMKqoXe+a21TlW8Tfehb0M1cgISaUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iJwyC73YLzypFoAf+Eufbl2pd6FzcMahZgg6XxiMylNZjwLZYU5dRJR/x6On1gjPD
 h5WmK3/BSFrB4iibmWeZaCQYLqQ81Lkmg0bQOX2QFeR12+jICtUVA/qWPBFaG6y8I4
 R05a51cZt75vnoU43mXLV2XIImvDlGSeJKUwlisA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1572619933;
 bh=15Q6V8/IMsJEoMMKqoXe+a21TlW8Tfehb0M1cgISaUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IlUy7codPlH9viqUYbcI8NGbMwxdR4sXxa+wkUF1awIzsKu25rrRJxIXt9i5/drFi
 AsD4f/5BJzMXyTDRMZ4lRv6GoBhFfxoZXMDNT5BGDyJ5Kn+ofA6L0M2B9+EXk5iudg
 bvDGp+E1wLeOWKt0dFx8W+hAz1f64RURXqQf4sOM=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sean Paul <sean@poorly.run>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgMDc6MDM6NTlQTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3
cm90ZToKPiBIaSBSb2IsCj4gCj4gT24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTE6MTkgQU0gSmVm
ZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1
ZSwgT2N0IDE1LCAyMDE5IGF0IDc6NDAgQU0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gQm9vdGluZyB0aGUgYWRyZW5vIGRyaXZlciBvbiBhIGlt
eDUzIGJvYXJkIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcKPiA+ID4gZXJyb3IgbWVzc2FnZToKPiA+
ID4KPiA+ID4gYWRyZW5vIDMwMDAwMDAwLmdwdTogW2RybTphZHJlbm9fZ3B1X2luaXRdICpFUlJP
UiogQ291bGQgbm90IGZpbmQgdGhlIEdQVSBwb3dlcmxldmVscwo+ID4gPgo+ID4gPiBBcyB0aGUg
InFjb20sZ3B1LXB3cmxldmVscyIgcHJvcGVydHkgaXMgb3B0aW9uYWwgYW5kIG5ldmVyIHByZXNl
bnQgb24KPiA+ID4gaS5NWDUsIHR1cm4gdGhlIG1lc3NhZ2UgaW50byBkZWJ1ZyBsZXZlbCBpbnN0
ZWFkLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBn
bWFpbC5jb20+Cj4gPgo+ID4gU2VlbXMgcmVhc29uYWJsZS4gIFJldmlld2VkLWJ5OiBKZWZmcmV5
IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KPiAKPiBBbnkgY29tbWVudHMsIHBsZWFz
ZT8KPiAKPiBKdXN0IHdhbnRlZCB0byBnZXQgcmlkIG9mIHRoaXMgbWlzbGVhZGluZyBlcnJvciBt
ZXNzYWdlIG9uIGkuTVg1LgoKSSdtIGdvb2Qgd2l0aCB0aGlzLiBUaGlzIHJlYWxseSBzaG91bGQg
b25seSBiZSBhcm91bmQgZm9yCmNvbXBhdGliaWxpdHkgd2l0aCBkb3duc3RyZWFtIGRldmljZSB0
cmVlIGZpbGVzIHdoaWNoIHNob3VsZCBtZWFuIG5vdGhpbmcgZm9yCkkuTVg1LgoKSm9yZGFuCgot
LSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENv
ZGUgQXVyb3JhIEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
