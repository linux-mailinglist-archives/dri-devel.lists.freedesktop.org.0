Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6CB29CF88
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 11:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E796E4E6;
	Wed, 28 Oct 2020 10:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.codeweavers.com (mail.codeweavers.com [50.203.203.244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799256E4E6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Srb/P3TggdjoWimaiei1N5W864q7xL8T0CSkk+91TeY=; b=eGJO9dHQ0ny4TrLKjO2qmEX5jX
 JbLzPgnG8ncYGgrs4gFgZqbih5rkQuNdfT+DL4IXysC7Mu18jV9gjGhXdvcK4LLqnH36d+8SdS1h3
 PK2k8M435hWXW4VEqNgXh1OkhSWzEFA8I13+Herzuq0qzWxS7Ro3vhtwODjgw9kPbswg=;
Received: from [10.69.141.123]
 by mail.codeweavers.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <pgofman@codeweavers.com>)
 id 1kXioa-0007H1-CB; Wed, 28 Oct 2020 05:36:26 -0500
Subject: Re: [PATCH libdrm] xf86drm.c: Use integer logarithm.
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20201026131120.1068959-1-pgofman@codeweavers.com>
 <20201028101842.041e8a02@eldfell>
 <e41dc6bd-b32b-7876-fefd-168088353b5c@codeweavers.com>
 <310cc402-bba0-6bcd-84f5-db58d687cd88@daenzer.net>
From: Paul Gofman <pgofman@codeweavers.com>
Message-ID: <f2ac50a6-68d5-4803-ed88-302eeb1c353a@codeweavers.com>
Date: Wed, 28 Oct 2020 13:36:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <310cc402-bba0-6bcd-84f5-db58d687cd88@daenzer.net>
Content-Language: en-GB
X-Spam-Score: -41.5
X-Spam-Report: Spam detection software, running on the system "mail.codeweavers.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 10/28/20 13:30, Michel Dänzer wrote: > On 2020-10-28 11:09
    a.m., Paul Gofman wrote: >> On 10/28/20 11:18, Pekka Paalanen wrote: >>>
   >>>>   +static unsigned log2_int(unsigned x) >>>> +{ >>>> +   [...] 
 
 Content analysis details:   (-41.5 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 USER_IN_WELCOMELIST    user is listed in 'welcomelist_from'
  -20 USER_IN_WHITELIST      DEPRECATED: See USER_IN_WELCOMELIST
  -20 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -0.5 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                             [score: 0.0000]
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
  1.2 AWL                    AWL: Adjusted score from AWL reputation of From: address
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMjgvMjAgMTM6MzAsIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+IE9uIDIwMjAtMTAtMjgg
MTE6MDkgYS5tLiwgUGF1bCBHb2ZtYW4gd3JvdGU6Cj4+IE9uIDEwLzI4LzIwIDExOjE4LCBQZWtr
YSBQYWFsYW5lbiB3cm90ZToKPj4+Cj4+Pj4gwqAgK3N0YXRpYyB1bnNpZ25lZCBsb2cyX2ludCh1
bnNpZ25lZCB4KQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBsOwo+Pj4+ICsKPj4+PiAr
wqDCoMKgIGlmICh4IDwgMikgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+PiAr
wqDCoMKgIH0KPj4+PiArwqDCoMKgIGZvciAobCA9IDI7IDsgbCsrKSB7Cj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGlmICgodW5zaWduZWQpKDEgPDwgbCkgPiB4KSB7Cj4+PiBIaSwKPj4+Cj4+PiB3b3Vs
ZG4ndCB0aGlzIGxvb3AgZmFpbCB0byBlbmQgd2hlbiB4ID49IDB4ODAwMDAwMDA/Cj4+Pgo+Pj4g
U3VyZSwgc3VjaCB2YWx1ZSBwcm9iYWJseSBjYW5ub3Qgb2NjdXIgd2hlcmUgdGhpcyBpcyBjdXJy
ZW50bHkgdXNlZCwKPj4+IGJ1dCBpdCBzZWVtcyBsaWtlIGEgbGFuZG1pbmUgZm9yIHRoZSBuZXh0
IGRldmVsb3BlciB0byBzdGVwIG9uLgo+Pj4KPj4gSW5kZWVkLCB0aGFua3MuIEkndmUgc2VudCB0
aGUgcGF0Y2hlcyBmb3IgY29uc2lkZXJhdGlvbiB3aGljaCBhdm9pZAo+PiBmdW5jdGlvbiBkdXBs
aWNhdGlvbiBhbmQgcG90ZW50aWFsbHkgaW5maW5pdGUgbG9vcC4KPgo+IGxpYmRybSB1c2VzIEdp
dExhYiBtZXJnZSByZXF1ZXN0cyBub3c6Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L21lc2EvZHJtLy0vbWVyZ2VfcmVxdWVzdHMKPgo+Ckkgc2VlLCB0aGFua3MuIEkgd2FzIGZvbGxv
d2luZyB0aGUgaW5zdHJ1Y3Rpb25zIGluIENPTlRSSUJVVElORy5yc3QuCgpEbyB5b3UgdGhpbmsg
SSBzaG91bGQgcHJvY2VlZCB3aXRoIG1lcmdlIHJlcXVlc3QgZm9yIHRoZXNlIHBhdGNoZXMgb3IK
dGhvc2UgYWxyZWFkeSBzZW50IGNvdWxkIGJlIGNvbnNpZGVyZWQgdGhpcyB3YXk/CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
