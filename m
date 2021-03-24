Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1506347A4A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 15:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5656EB9A;
	Wed, 24 Mar 2021 14:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137F76E364
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 14:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616595063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XTMC5qN8DJOTO3PHrVdMzJ8JtyPTnuysM9uOY1D8nCk=;
 b=faQwExbovGwNVnzVOxo6eDxFizs08zKE3k4XiM/kc8GohoA4o8x0g/y4Ekd7O6E1EW40A2
 PRpgG05OI7spCkprzKYnix0Hlc+10qfjlHLuiaIXPmIGEZjZYlAZmvbUHhziQMRVoVH7jh
 hlGO8I4Sk5GJaI0OIhhaD4FL9hvRQ1A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-ie8xprb_MfGUXg06o3QAVw-1; Wed, 24 Mar 2021 10:11:02 -0400
X-MC-Unique: ie8xprb_MfGUXg06o3QAVw-1
Received: by mail-ej1-f69.google.com with SMTP id jo6so982955ejb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 07:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XTMC5qN8DJOTO3PHrVdMzJ8JtyPTnuysM9uOY1D8nCk=;
 b=fVwwG0FP9ihgiNaLv6IKTlxjv2hQC8dQADDMf1hprvCF4S8izvhKELvNke0FyiZkYf
 q5iYCcNEfnB6tEk2C+Ho8QunLri3rLfdCBRQ/nU2d8rxLAbT/ODaPfDmBBA4SxtuFTv4
 d5jNM74lrOAeMPr7wnjjZsbzKAyam417XkpJItKiHqi4msU28rj0UUcC8FjPnL1Bfleg
 0AjV8uPyq5/255iU88qF9CahjeeiwDs66JTEb1qhNSGhz7cZy564QCEmJsOWpw+aP4tC
 ZAhdOfdJy1xlMlzpFnNdTNESmn65F9ecNw2bUbW2lVh5KBHoQt/X/eg1NFFqAHkAZLQE
 0CMw==
X-Gm-Message-State: AOAM533aT6W+9Dt5uifeSwwvQVk78S/S+YzDuGdOw2/KCDrnfDZVRPxu
 VENr4W5IZrxgyqdZu8sFsvGVds12YB1dW5f+cVPSCRa4te/MMdW4kUrzqOmq2/0nXQEDODEIZEb
 aRwi8W+P0Kyr4TnNLwgKsl75kxlqwwwvmRP7rjH72wn3vlvyagTOCyMTcfANOxOHKf2D3+6Pfoz
 okjWus
X-Received: by 2002:a17:907:6005:: with SMTP id
 fs5mr3946934ejc.184.1616595060667; 
 Wed, 24 Mar 2021 07:11:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+8+Z+nLSHRtQpBhIIxIJKuenmuxIsJnN0RTUShe01v1mSGjj9VwEpUi6zVTaNGEaCJSSGwQ==
X-Received: by 2002:a17:907:6005:: with SMTP id
 fs5mr3946921ejc.184.1616595060471; 
 Wed, 24 Mar 2021 07:11:00 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id bt14sm1191350edb.92.2021.03.24.07.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 07:11:00 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH resend 2/2] drm/i915/display: Make
 vlv_find_free_pps() skip pipes which are in use for non DP purposes
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210302120040.94435-1-hdegoede@redhat.com>
 <20210302120040.94435-3-hdegoede@redhat.com> <YD5Q8mA6y4/qcelo@intel.com>
 <d620fd9d-1685-3b2a-7c3b-a5d5fa6daddc@redhat.com>
 <YFtGjHEdkMfR3bLr@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <7d9bb155-5e07-161d-c699-581d89b9fb39@redhat.com>
Date: Wed, 24 Mar 2021 15:10:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YFtGjHEdkMfR3bLr@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAzLzI0LzIxIDM6MDIgUE0sIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiBPbiBUdWUs
IE1hciAyMywgMjAyMSBhdCAxMTozOTowOUFNICswMTAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+
PiBIaSwKPj4KPj4gT24gMy8yLzIxIDM6NTEgUE0sIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPj4+
IE9uIFR1ZSwgTWFyIDAyLCAyMDIxIGF0IDAxOjAwOjQwUE0gKzAxMDAsIEhhbnMgZGUgR29lZGUg
d3JvdGU6Cj4+Pj4gQXMgZXhwbGFpbmVkIGJ5IGEgbG9uZyBjb21tZW50IGJsb2NrLCBvbiBWTFYg
aW50ZWxfc2V0dXBfb3V0cHV0cygpCj4+Pj4gc29tZXRpbWVzIHRoaW5rcyB0aGVyZSBtaWdodCBi
ZSBhbiBlRFAgcGFuZWwgY29ubmVjdGVkIHdoaWxlIHRoZXJlIGlzIG5vbmUuCj4+Pj4gSW4gdGhp
cyBjYXNlIGludGVsX3NldHVwX291dHB1dHMoKSB3aWxsIGNhbGwgaW50ZWxfZHBfaW5pdCgpIHRv
IGNoZWNrLgo+Pj4+Cj4+Pj4gSW4gdGhpcyBzY2VuYXJpbyB2bHZfZmluZF9mcmVlX3BwcygpIGVu
ZHMgdXAgc2VsZWN0aW5nIHBpcGUgQSBmb3IgdGhlIHBwcywKPj4+PiBldmVuIHRob3VnaCB0aGlz
IG1pZ2h0IGJlIGluIHVzZSBmb3Igbm9uIERQIHB1cnBvc2VzLiBXaGVuIHRoaXMgaXMgdGhlIGNh
c2UKPj4+PiB0aGVuIHRoZSBhc3NlcnRfcGlwZSgpIGluIHZsdl9mb3JjZV9wbGxfb24oKSB3aWxs
IGZhaWwgd2hlbiBjYWxsZWQgZnJvbQo+Pj4+IHZsdl9wb3dlcl9zZXF1ZW5jZXJfa2ljaygpLgo+
Pj4KPj4+IFRoZSBpZGVhIGlzIHRoYXQgeW91ICpjYW4qIHNlbGVjdCBhIFBQUyBmcm9tIGEgcGlw
ZSB1c2VkIGZvciBhIG5vbi1EUAo+Pj4gcG9ydCBzaW5jZSB0aG9zZSBkb24ndCBjYXJlIGFib3V0
IHRoZSBQUFMgc3R1ZmYuIFNvIHRoaXMgZG9lc24ndCBzZWVtCj4+PiBjb3JyZWN0Lgo+Pgo+PiBU
aGV5IG1heSBub3QgY2FyZSBhYm91dCB0aGUgUFBTIHN0dWZmLCBidXQgYXMgdGhlIFdBUk4gLyBi
YWNrdHJhY2UKPj4gc2hvd3MgaWYgdGhlIERQTExfVkNPX0VOQUJMRSBiaXQgaXMgbm90IGFscmVh
ZHkgc2V0IGZvciB0aGUgcGlwZSwgd2hpbGUKPj4gdGhlIHBpcGUgaXMgIm90aGVyd2lzZSIgaW4g
dXNlIHRoZW4gdmx2X2ZvcmNlX3BsbF9vbigpIGJlY29tZXMgdW5oYXBweQo+PiB0cmlnZ2VyaW5n
IHRoZSBXQVJOLkRQTExfVkNPX0VOQUJMRSBiaXQgaXMgbm90Cj4+Cj4+PiBhKSBJIHdvdWxkIGxp
a2UgdG8gc2VlIHRoZSBWQlQgZm9yIHRoaXMgbWFjaGluZQo+Pgo+PiBodHRwczovL2ZlZG9yYXBl
b3BsZS5vcmcvfmp3cmRlZ29lZGUvdm95by13aW5wYWQtYTE1LXZidAo+Pgo+Pj4gYikgSSB3b25k
ZXIgaWYgdGhlIERTSSBQTEwgaXMgc3VmZmljaWVudCBmb3IgZ2V0dGluZyB0aGUgUFBTIGdvaW5n
Pwo+Pgo+PiBJIGhhdmUgbm8gaWRlYSwgSSBqdXN0IG5vdGljZWQgdGhlIFdBUk4gLyBiYWNrdHJh
Y2UgYW5kIHRoaXMgc2VlbWVkCj4+IGxpa2UgYSByZWFzb25hYmx5IHdheSB0byBkZWFsIHdpdGgg
aXQuIFdpdGggdGhhdCBzYWlkIEknbSBmaW5lIHdpdGggZml4aW5nCj4+IHRoaXMgYSBkaWZmZXJl
bnQgd2F5Lgo+Pgo+Pj4gYykgSWYgd2UgZG8gbmVlZCB0aGUgbm9ybWFsIERQTEwgaXMgdGhlcmUg
YW55IGhhcm0gdG8gRFNJIGluIGVuYWJsaW5nIGl0Pwo+Pgo+PiBJIHdvdWxkIGFzc3VtZSB0aGlz
IGluY3JlYXNlcyBwb3dlci1jb25zdW1wdGlvbiBhbmQgRFNJIHBhbmVscyBhcmUgYWxtb3N0Cj4+
IGFsd2F5cyB1c2VkIGluIGJhdHRlcnkgcG93ZXJlZCBkZXZpY2VzLgo+IAo+IFRoaXMgaXMganVz
dCB1c2VkIHdoaWxlIHByb2JpbmcgdGhlIHBhbmVsLCBzbyBwb3dlciBjb25zdW1wdGlvbiBpcwo+
IG5vdCBhIGNvbmNlcm4uCgpTb3JyeSBJIG1pc2ludGVycHJldGVkIHdoYXQgeW91IHdyb3RlLCBJ
IGludGVycHJldGVkIGl0IGFzIGhhdmUgdGhlIERTSQpjb2RlIGVuYWJsZSBpdCB0byBhdm9pZCB0
aGlzIHByb2JsZW0uIEkgc2VlIG5vdyB0aGF0IHRoYXQgaXMgbm93IHdoYXQKeW91IG1lYW50LgoK
Pj4gQWxzbyB0aGlzIHdvdWxkIGltcGFjdCBhbGwgQllUL0NIVCBkZXZpY2VzLCBwb3NzaWJsZSB0
cmlnZ2VyaW5nIHVud2FudGVkCj4+IHNpZGUtZWZmZWN0cy4gV2hlcmUgYXMgdGhlIHByb3Bvc2Vk
IGZpeCBiZWxvdyBpcyBtdWNoIG1vcmUgbmFycm93bHkgdGFyZ2V0ZWQKPj4gYXQgdGhlIHByb2Js
ZW0uIEl0IG1pZ2h0IG5vdCBiZSB0aGUgbW9zdCBwcmV0dHkgZml4IGJ1dCBBRkFJQ1QgaXQgaGFz
IGEgbG93Cj4+IHJpc2sgb2YgY2F1c2luZyByZWdyZXNzaW9ucy4KPiAKPiBJdCByYXRoZXIgc2ln
bmlmaWNhbnRseSBjaGFuZ2VzIHRoZSBsb2dpYyBvZiB0aGUgd29ya2Fyb3VuZCwgcG90ZW50aWFs
bHkKPiBjYXVzaW5nIHVzIHRvIG5vdCBmaW5kIGEgZnJlZSBQUFMgYXQgYWxsLiBFZy4gaWYgeW91
IHdlcmUgdG8gYm9vdCB3aXRoCj4gYSBWTFYgd2l0aCBwaXBlIEEgLT4gZURQIEIgKyBlRFAgQyBp
bmFjdGl2ZSArIHBpcGUgQiAtPiBWR0EgdGhlbiB5b3VyCj4gY2hhbmdlIHdvdWxkIGNhdXNlIHVz
IHRvIG5vdCBmaW5kIHRoZSBmcmVlIHBpcGUgQiBQUFMgZm9yIHByb2JpbmcgZURQIEMsCj4gYW5k
IGluIHRoZSBlbmQgd2UnZCBnZXQgYSBXQVJOIGFuZCBmYWxsIGJhY2sgdG8gcGlwZSBBIFBQUyB3
aGljaCB3b3VsZAo+IGNsb2JiZXIgdGhlIGFjdHVhbGx5IGluIHVzZSBwaXBlIEEgUFBTLgoKSSB3
b3VsZCB3ZWxjb21lLCBhbmQgd2lsbCBoYXBwaWx5IHRlc3QsIGFub3RoZXIgZml4IGZvciB0aGlz
LiBBVE0gd2UKaGF2ZSBhIFdBUk4gdHJpZ2dlcmluZyBvbiBhY3R1YWwgaGFyZHdhcmUgKGFuZCBu
b3QganVzdCBpbiBhIGh5cG90aGV0aWNhbApleGFtcGxlKSBhbmQgSSB3b3VsZCBsaWtlIHRvIHNl
ZSB0aGF0IFdBUk4gZml4ZWQuIElmIHlvdSBjYW4gY29tZSB1cCB3aXRoCmEgYmV0dGVyIGZpeCBJ
IHdvdWxkIGJlIGhhcHB5IHRvIHRlc3QuCgpSZWdhcmRzLAoKSGFucwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
