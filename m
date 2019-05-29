Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ACC2FB12
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 13:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FD16E339;
	Thu, 30 May 2019 11:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2776E0D0;
 Wed, 29 May 2019 19:58:19 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 0BE1760A24; Wed, 29 May 2019 19:58:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jhugo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CFF086019D;
 Wed, 29 May 2019 19:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CFF086019D
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display
 support
To: Brian Masney <masneyb@onstation.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
 <CAOCk7NrRo2=0fPN_Sy1Bhhy+UV7U6uO5aV9uXZc8kc3VpSt71g@mail.gmail.com>
 <20190529013713.GA13245@basecamp>
 <CAOCk7NqfdNkRJkbJY70XWN-XvdtFJ0UVn3_9rbgAsNCdR7q5PQ@mail.gmail.com>
 <20190529024648.GA13436@basecamp>
 <CAOCk7NpC93ACr4jFm7SBOKSvFJSDhq2byX6BAYPX29BuYEkWnQ@mail.gmail.com>
 <20190529102822.GA15027@basecamp>
 <CAOCk7NoVknZOkFcki9c8hq2vkqLhBSfum05T9Srq8mtJjAaLyQ@mail.gmail.com>
 <20190529193046.GA19876@basecamp>
From: Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <26c535af-9853-c8c9-3138-04f5d9ee11b0@codeaurora.org>
Date: Wed, 29 May 2019 13:58:16 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529193046.GA19876@basecamp>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 30 May 2019 11:39:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559159899;
 bh=FVSPpTHDF0GOBaKIDyNZqRwnEvQHQL/Ok8SvfTA+sVE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WzEDCNiuCjmE4/YO6xyFI93CQdAZUWwA6p1MCkV5/5KeX5E36lE1PdR+ZsSCsUOxZ
 qVt0fXuPXLPBHTcfJfUdvt3ey0pJ06NyJqgG5YUkMn70Ag2MLl+rUGpMdUqLGWA6w8
 kigwSz92d76dKLYgsKFTd3HDW0Jhxkd9v3jNqOqI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559159897;
 bh=FVSPpTHDF0GOBaKIDyNZqRwnEvQHQL/Ok8SvfTA+sVE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CU9Y1DOyQ9WEHsuZRNe0JvS0ftkyIvmdiwaW8BqrCMwhQibK1lXH3Eo+FNxZQXD5O
 glN9aggcfrZC0P3QDYUdm2eKXXNxO5yIn1GcjV2ZXYbefFULrWDMIhpbKBQ/trilC5
 FBx53OO1MI7YvLXS3xGlZclKXXWV44XtND8fRXxA=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jhugo@codeaurora.org
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
Cc: Jonathan Marek <jonathan@marek.ca>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yOS8yMDE5IDE6MzAgUE0sIEJyaWFuIE1hc25leSB3cm90ZToKPiBPbiBXZWQsIE1heSAy
OSwgMjAxOSBhdCAwODo0MTozMUFNIC0wNjAwLCBKZWZmcmV5IEh1Z28gd3JvdGU6Cj4+IE9uIFdl
ZCwgTWF5IDI5LCAyMDE5IGF0IDQ6MjggQU0gQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlv
bi5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDA4OjUzOjQ5UE0g
LTA2MDAsIEplZmZyZXkgSHVnbyB3cm90ZToKPj4+PiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCA4
OjQ2IFBNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPiB3cm90ZToKPj4+Pj4K
Pj4+Pj4gT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDc6NDI6MTlQTSAtMDYwMCwgSmVmZnJleSBI
dWdvIHdyb3RlOgo+Pj4+Pj4+PiBEbyB5b3Uga25vdyBpZiB0aGUgbmV4dXMgNSBoYXMgYSB2aWRl
byBvciBjb21tYW5kIG1vZGUgcGFuZWw/ICBUaGVyZQo+Pj4+Pj4+PiBpcyBzb21lIGdsaXRjaHlu
ZXNzIHdpdGggdmJsYW5rcyBhbmQgY29tbWFuZCBtb2RlIHBhbmVscy4KPj4+Pj4+Pgo+Pj4+Pj4+
IEl0cyBpbiBjb21tYW5kIG1vZGUuIEkga25vdyB0aGlzIGJlY2F1c2UgSSBzZWUgdHdvICdwcCBk
b25lIHRpbWUgb3V0Jwo+Pj4+Pj4+IG1lc3NhZ2VzLCBldmVuIG9uIDQuMTcuIEJhc2VkIG9uIG15
IHVuZGVyc3RhbmRpbmcsIHRoZSBwaW5nIHBvbmcgY29kZSBpcwo+Pj4+Pj4+IG9ubHkgYXBwbGlj
YWJsZSBmb3IgY29tbWFuZCBtb2RlIHBhbmVscy4KPj4+Pj4+Cj4+Pj4+PiBBY3R1YWxseSwgdGhl
IHBpbmcgcG9uZyBlbGVtZW50IGV4aXN0cyBpbiBib3RoIG1vZGVzLCBidXQgJ3BwIGRvbmUKPj4+
Pj4+IHRpbWUgb3V0JyBpcyBhIGdvb2QgaW5kaWNhdG9yIHRoYXQgaXQgaXMgY29tbWFuZCBtb2Rl
Lgo+Pj4+Pj4KPj4+Pj4+IEFyZSB5b3UgYWxzbyBzZWVpbmcgdmJsYW5rIHRpbWVvdXRzPwo+Pj4+
Pgo+Pj4+PiBZZXMsIGhlcmUncyBhIHNuaXBwZXQgb2YgdGhlIGZpcnN0IG9uZS4KPj4+Pj4KPj4+
Pj4gWyAgICAyLjU1NjAxNF0gV0FSTklORzogQ1BVOiAwIFBJRDogNSBhdCBkcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY19oZWxwZXIuYzoxNDI5IGRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX3Zi
bGFua3MucGFydC4xKzB4Mjg4LzB4MjkwCj4+Pj4+IFsgICAgMi41NTYwMjBdIFtDUlRDOjQ5OmNy
dGMtMF0gdmJsYW5rIHdhaXQgdGltZWQgb3V0Cj4+Pj4+IFsgICAgMi41NTYwMjNdIE1vZHVsZXMg
bGlua2VkIGluOgo+Pj4+PiBbICAgIDIuNTU2MDM0XSBDUFU6IDAgUElEOiA1IENvbW06IGt3b3Jr
ZXIvMDowIE5vdCB0YWludGVkIDUuMi4wLXJjMS0wMDE3OC1nNzJjM2MxZmQ1Zjg2LWRpcnR5ICM0
MjYKPj4+Pj4gWyAgICAyLjU1NjAzOF0gSGFyZHdhcmUgbmFtZTogR2VuZXJpYyBEVCBiYXNlZCBz
eXN0ZW0KPj4+Pj4gWyAgICAyLjU1NjA1Nl0gV29ya3F1ZXVlOiBldmVudHMgZGVmZXJyZWRfcHJv
YmVfd29ya19mdW5jCj4+Pj4+IC4uLgo+Pj4+Pgo+Pj4+Pj4gRG8geW91IGhhdmUgYnVzeWJveD8K
Pj4+Pj4+Cj4+Pj4+PiBDYW4geW91IHJ1biAtCj4+Pj4+PiBzdWRvIGJ1c3lib3ggZGV2bWVtIDB4
RkQ5MDA2MTQKPj4+Pj4+IHN1ZG8gYnVzeWJveCBkZXZtZW0gMHhGRDkwMDcxNAo+Pj4+Pj4gc3Vk
byBidXN5Ym94IGRldm1lbSAweEZEOTAwODE0Cj4+Pj4+PiBzdWRvIGJ1c3lib3ggZGV2bWVtIDB4
RkQ5MDA5MTQKPj4+Pj4+IHN1ZG8gYnVzeWJveCBkZXZtZW0gMHhGRDkwMEExNAo+Pj4+Pgo+Pj4+
PiAjIGJ1c3lib3ggZGV2bWVtIDB4RkQ5MDA2MTQKPj4+Pj4gMHgwMDAyMDAyMAo+Pj4+Cj4+Pj4g
T2ssIHNvIENUTF8wIHBhdGgsIGNvbW1hbmQgbW9kZSwgcGluZyBwb25nIDAsIHdpdGggdGhlIG91
dHB1dCBnb2luZyB0byBEU0kgMS4KPj4+Pgo+Pj4+IE5leHQgb25lIHBsZWFzZToKPj4+Pgo+Pj4+
IGJ1c3lib3ggZGV2bWVtIDB4RkQ5MTJEMzAKPj4+Cj4+PiBJdCdzIDB4MDAwMDAwMDAgb24gbWFp
bmxpbmUgYW5kIDQuMTcuIEkgdXNlZCB0aGUgZm9sbG93aW5nIHNjcmlwdCB0bwo+Pj4gZHVtcCB0
aGUgZW50aXJlIG1kcDUgbWVtb3J5IHJlZ2lvbiBhbmQgYXR0YWNoZWQgdGhlIGR1bXAgZnJvbSA0
LjE3IGFuZAo+Pj4gNS4ycmMxLgo+Pj4KPj4KPj4gb2ssIDAgbWVhbnMgYXV0b3JlZnJlc2ggaXMg
bm90IG9uLiAgV2hpY2ggaXMgZmluZS4gIE15IG5leHQgZ3Vlc3MKPj4gd291bGQgYmUgdGhlIHZi
bGFuayBjb2RlIGNoZWNraW5nIHRoZSBoYXJkd2FyZSB2YmxhbmsgY291bnRlciwgd2hpY2gKPj4g
ZG9lc24ndCBleGlzdC4KPj4gSW4gdmlkZW8gbW9kZSwgdGhlcmUgaXMgYSBmcmFtZSBjb3VudGVy
IHdoaWNoIGluY3JlbWVudHMsIHdoaWNoIGNhbiBiZQo+PiB1c2VkIGFzIHRoZSB2YmxhbmsgY291
bnRlci4gIFVuZm9ydHVuYXRlbHksIHRoYXQgaGFyZHdhcmUgaXNuJ3QgYWN0aXZlCj4+IGluIGNv
bW1hbmQgbW9kZSwgYW5kIHRoZXJlIGlzbid0IGFuIGVxdWl2YWxlbnQuCj4+Cj4+IFNvLCB0aGUg
dmJsYW5rIGNvZGUgaXMgZ29pbmcgdG8gcmVhZCB0aGUgcmVnaXN0ZXIsIGFuZCBsb29rIGZvciBh
bgo+PiB1cGRhdGUsIHdoaWNoIHdpbGwgbmV2ZXIgaGFwcGVuLCB0aHVzIGl0IHdpbGwgdGltZW91
dC4gIFRoZXJlIGlzIGEKPj4gYmFja3VwIHBhdGggd2hpY2ggdXNlcyB0aW1lc3RhbXBzIChubyBo
YXJkd2FyZSksIHdoaWNoIHlvdSBjYW4KPj4gYWN0aXZhdGUgd2l0aCBhIHF1aWNrIGhhY2sgLSBt
YWtlIG1heF92YmxhbmtfY291bnQgPSAwIGF0IHRoZQo+PiBmb2xsb3dpbmcgbGluZQo+PiBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMjTDc1Mwo+IAo+IFRoYXQgZml4ZWQgdGhlIGlzc3Vl
IQoKQXdlc29tZS4gIEknbSBnbGFkIGl0IHdhcyBzb21ldGhpbmcgc2ltcGxlLgoKPiAKPiBJIHBy
ZXZpb3VzbHkgb2JzZXJ2ZWQgdGhhdCBtZHA1X2dldF92YmxhbmtfY291bnRlciwgc3BlY2lmaWNh
bGx5Cj4gbWRwNV9lbmNvZGVyX2dldF9mcmFtZWNvdW50LCB3b3VsZCBhbHdheXMgcmV0dXJuIDAu
Cj4gCj4gV2hhdCdzIHRoZSBiZXN0IHdheSB0byBmaXggdGhpcyBpbiBtYWlubGluZT8gU2V0IHRo
YXQgdG8gemVybyBpZiBhbnkKPiBvZiB0aGUgaW50ZXJmYWNlIG1vZGVzIGlzIE1EUDVfSU5URl9E
U0lfTU9ERV9DT01NQU5EPwo+IAoKU2hvcnQgdmVyc2lvbiwgeWVzLiAgTG9uZyB2ZXJzaW9uOgoK
SSBzdGlsbCBoYXZlIHRoYXQgaGFjayBpbiBteSB0cmVlIGFuZCBoYXZlbid0IGNvbWUgYmFjayB0
byBmb3JtdWxhdGluZwphIHByb3BlciBmaXggeWV0LiAgRmVlbCBmcmVlIHRvIHJ1biB3aXRoIGl0
LgoKVGhpbmtpbmcgYWJvdXQgaXQgYnJpZWZseSwgd2UgY291bGQgZG8gdHdvIHRoaW5ncy4gIFdl
IGNvdWxkIGZha2UgYQpoYXJkd2FyZSBjb3VudGVyIGJ5IGp1c3QgaW5jcmVtZW50IGFuIGludCBl
dmVyeSB0aW1lIHRoZSB2YmxhbmsgaXJxIGlzCnByb2Nlc3NlZCwgYnV0IHRoYXQgc2VlbXMgY2x1
bmt5LiAgT3RoZXJ3aXNlLCB3ZSBjb3VsZCBmb3JjZSBhCmZhbGxiYWNrIG9udG8gdGhlIHRpbWVz
dGFtcCBzb2x1dGlvbiwgd2hpY2ggc2VlbXMgbGVzcyBpbnZhc2l2ZS4KCkluIHRoZW9yeSwgd2Ug
Y291bGQgc2VydmljZSBtdWx0aXBsZSBkaXNwbGF5cywgd2l0aCBkaWZmZXJlbnQKcHJvcGVydGll
cyAoaWUgYSBjb21iaW5hdGlvbiBvZiBjb21tYW5kIGFuZCB2aWRlbyBtb2RlKS4gIFRoZSBoYWNr
CnRoZW4sIGlzIG5vdCBnb29kLCBiZWNhdXNlIGl0IHdvdWxkIGJyZWFrIHZpZGVvIG1vZGUgKGF0
LWxlYXN0IHdlCndvdWxkbid0IGJlIHVzaW5nIHRoZSByZWdpc3RlciB3aGVuIHdlIGNvdWxkKS4g
IEl0IHdvdWxkIGJlIGdyZWF0IGlmCnRoZSB1c2Ugb2YgdGhlIGhhcmR3YXJlIHJlZ2lzdGVyIGNv
dWxkIGJlIGRvbmUgcGVyIGRpc3BsYXkuCgpMdWNraWx5LCBpdCBsb29rcyBsaWtlIHNvbWVvbmUg
anVzdCBtYWRlIHRoYXQgcG9zc2libGUgLQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0L2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fdmJsYW5rLmM/aD12NS4yLXJjMiZpZD1lZDIwMTUxYTc2OTliYjJjNzdlYmEzNjEwMTk5
Nzg5YTEyNjk0MGM0CgotLSAKSmVmZnJleSBIdWdvClF1YWxjb21tIERhdGFjZW50ZXIgVGVjaG5v
bG9naWVzIGFzIGFuIGFmZmlsaWF0ZSBvZiBRdWFsY29tbSAKVGVjaG5vbG9naWVzLCBJbmMuClF1
YWxjb21tIFRlY2hub2xvZ2llcywgSW5jLiBpcyBhIG1lbWJlciBvZiB0aGUKQ29kZSBBdXJvcmEg
Rm9ydW0sIGEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
