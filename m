Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A392813866C
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B206E523;
	Sun, 12 Jan 2020 12:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB52D6E987
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 02:40:52 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 21so615789qky.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2020 18:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=gMOkNt0vJimzzzMgeT7qen11eRZ+jCW/fpAjWtkibTQ=;
 b=HkilQI0kFg6ySq2t4TeaEa45vrSHzdlMy0ybzBEjzlnEAyWPXVNcr2xmz49L4emkoL
 dH5K+qArrbHfPpoBNWGNdGkU/JYitedobyGHDsVP7tIhAZx41iiMIBhvW+FTVr71tc8M
 2NHRCwxrlPeHTaLEiyEFs4MA1sxp9if0+FR2Nd0ud1Vh5h/ZZeJekVlL26It00QmfJ9S
 F9IYt/HRK1rNkpl8acBxvLxGMR/wyQk8lx2QDcOWxq2tlfYnSn7DOGGswaOjOM/HMoge
 NzLvPu+R9tACq6Lbk3Pz4th1WL9xijPn8khbb5y48A6t/vCYW85M8qmweiHOJ0vGeTOQ
 0t7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=gMOkNt0vJimzzzMgeT7qen11eRZ+jCW/fpAjWtkibTQ=;
 b=ce++YVkhdXgNsFpgY2wprpkBf6RaTlxwD4npgHAZ6Nmsg4TgrjcQHNkNsbQ2yBa/4e
 p+K6cBUjfC6BSx/DrY0QejYPspWKMeiZGPr4z+eeR095+72Bc/Daaz6JVYqocsuIvqqS
 zFDdV8YMVqFXH2kAq2X+r98cJ747OIZtrg3OijjiGwSkDoH0JUpP7ne7UCuCaL2k5yN2
 Dt30DfINJ6RNOiH7tNL9wpIDnNhM+dIV0ZYi2zpTLIYAiVRjpGuzPwP8HdphrZzDTRZ5
 htaMhw4fyi4H5KO+vQzPG12Y+cocXXMpzPMk5N4KfCZBqdvW0fy4gxCV9haSYIrm7Zr/
 B33g==
X-Gm-Message-State: APjAAAXOxc8p/gnDdpy/7zPa6EoSolvahdmXGrLtSI7uwbpKarC6KRBy
 D6RXUveEGrW1CKOk21liig==
X-Google-Smtp-Source: APXvYqwZ6dp9PAx8htATOFuetG2+KPIPqwe2qy8vRzBTVuQJrZKJXFc5UDyAXUydBDCXIUnW7IThqA==
X-Received: by 2002:a05:620a:138d:: with SMTP id
 k13mr949604qki.239.1578624051907; 
 Thu, 09 Jan 2020 18:40:51 -0800 (PST)
Received: from [120.7.1.38] ([184.175.21.212])
 by smtp.gmail.com with ESMTPSA id l49sm315887qtk.7.2020.01.09.18.40.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jan 2020 18:40:51 -0800 (PST)
Subject: Re: Regression in 5.4 kernel on 32-bit Radeon IBM T40
From: Woody Suwalski <terraluna977@gmail.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>
References: <400f6ce9-e360-0860-ca2a-fb8bccdcdc9b@gmail.com>
 <20200109141436.GA22111@lst.de>
 <9ad75215-3ff1-ee76-9985-12fd78d6aa5f@amd.com>
 <67f60d13-a245-5561-1372-7d68f35969f3@gmail.com>
Message-ID: <66a6b0ea-4ee8-1a0d-b259-568059d54e09@gmail.com>
Date: Thu, 9 Jan 2020 21:40:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0
 SeaMonkey/2.49.5
MIME-Version: 1.0
In-Reply-To: <67f60d13-a245-5561-1372-7d68f35969f3@gmail.com>
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V29vZHkgU3V3YWxza2kgd3JvdGU6Cj4gQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gSGkgQ2hy
aXN0b3BoLAo+Pgo+PiBBbSAwOS4wMS4yMCB1bSAxNToxNCBzY2hyaWViIENocmlzdG9waCBIZWxs
d2lnOgo+Pj4gSGkgV29vZHksCj4+Pgo+Pj4gc29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LCBJJ3Zl
IGJlZW4gb2ZmIHRvIGEgdmFjYXRpb24gb3ZlciB0aGUgCj4+PiBob2xpZGF5cy4KPj4+Cj4+PiBP
biBTYXQsIERlYyAxNCwgMjAxOSBhdCAxMDoxNzoxNVBNIC0wNTAwLCBXb29keSBTdXdhbHNraSB3
cm90ZToKPj4+PiBSZWdyZXNzaW9uIGluIDUuNCBrZXJuZWwgb24gMzItYml0IFJhZGVvbiBJQk0g
VDQwCj4+Pj4gdHJpZ2dlcmVkIGJ5Cj4+Pj4gY29tbWl0IDMzYjNhZDM3ODhhYmE4NDZmYzhiOWEw
NjVmZTI2ODVhMGI2NGY3MTMKPj4+PiBBdXRob3I6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPgo+Pj4+IERhdGU6wqDCoCBUaHUgQXVnIDE1IDA5OjI3OjAwIDIwMTkgKzAyMDAKPj4+Pgo+
Pj4+IEhvd2R5LAo+Pj4+IFRoZSBhYm92ZSBwYXRjaCBoYXMgdHJpZ2dlcmVkIGEgZGlzcGxheSBw
cm9ibGVtIG9uIElCTSBUaGlua3BhZCAKPj4+PiBUNDAsIHdoZXJlCj4+Pj4gdGhlIHNjcmVlbiBp
cyBjb3ZlcmVkIHdpdGggYSBsb3RzIG9mIHJhbmRvbSBzaG9ydCBibGFjayBob3Jpem9udGFsIAo+
Pj4+IGxpbmVzLAo+Pj4+IG9yIGRpc3RvcnRlZCBsZXR0ZXJzIGluIFggdGVybXMuCj4+Pj4KPj4+
PiBUaGUgY3VscHJpdCBzZWVtcyB0byBiZSB0aGF0IHRoZSBkbWFfZ2V0X3JlcXVpcmVkX21hc2so
KSBpcyAKPj4+PiByZXR1cm5pbmcgYQo+Pj4+IHZhbHVlIDB4M2ZmZmZmZmYKPj4+PiB3aGljaCBp
cyBzbWFsbGVyIHRoYW4gZG1hX2dldF9tYXNrKCkweGZmZmZmZmZmLlRoYXQgcmVzdWx0cyBpbgo+
Pj4+IGRtYV9hZGRyZXNzaW5nX2xpbWl0ZWQoKT09MCBpbiB0dG1fYm9fZGV2aWNlKCksIGFuZCB1
c2luZyA0MC1iaXRzIGRtYQo+Pj4+IGluc3RlYWQgb2YgMzItYml0cy4KPj4+IFdoaWNoIGlzIHRo
ZSBpbnRlbmRlZCBiZWhhdmlvciBhc3N1bWluZyB5b3VyIHN5c3RlbSBoYXMgMUdCIG9mIG1lbW9y
eS4KPj4+IERvZXMgaXQ/Cj4+Cj4+IEFzc3VtaW5nIHRoZSBzeXN0ZW0gZG9lc24ndCBoYXZlIHRo
ZSAxR0Igc3BsaXQgdXAgc29tZWhvdyBjcmF6eSBvdmVyIAo+PiB0aGUgYWRkcmVzcyBzcGFjZSB0
aGF0IHNob3VsZCBpbmRlZWQgd29yayBhcyBpbnRlbmRlZC4KPj4KPj4+Cj4+Pj4gSWYgSSBoYXJk
Y29kZSAiMSIgYXMgdGhlIGxhc3QgcGFyYW1ldGVyIHRvIHR0bV9ib19kZXZpY2VfaW5pdCgpIGlu
IAo+Pj4+IHBsYWNlIG9mCj4+Pj4gYSBjYWxsIHRvIGRtYV9hZGRyZXNzaW5nX2xpbWl0ZWQoKSx0
aGUgcHJvYmxlbSBnb2VzIGF3YXkuCj4+PiBJJ2xsIG5lZWQgc29tZSBoZWxwIGZyb20gdGhlIGRy
bSAvIHJhZGVvbiAvIFRUTSBtYWludGFpbmVycyBpZiB0aGVyZSAKPj4+IGFyZQo+Pj4gYW55IG90
aGVyIHNpZGUgZWZmZWN0cyBmcm9tIG5vdCBwYXNzaW5nIHRoZSBuZWVkX2RtYTMyIHBhcmFtdGVy
cy4KPj4+IE9idmlvdXNseSBpZiB0aGUgZGV2aWNlIGRvZXNuJ3QgaGF2ZSBtb3JlIHRoYW4gMzIt
Yml0cyB3b3J0aCBvZiBkcmFtIAo+Pj4gYW5kCj4+PiBubyBETUEgb2Zmc2V0IHdlIGNhbid0IGZl
ZWQgdW5hZGRyZXNzYWJsZSBtZW1vcnkgdG8gdGhlIGRldmljZS4KPj4+IFVuZm9ydHVuYXRlbHkg
SSBoYXZlIGEgdmVyeSBoYXJkIHRpbWUgZm9sbG93aW5nIHRoZSBpbXBsZW1lbnRhdGlvbiBvZgo+
Pj4gdGhlIFRUTSBwb29sIGlmIGl0IGRvZXMgYW55dGhpbmcgZWxzZSBpbiB0aGlzIGNhc2UuCj4+
Cj4+IFRoZSBvbmx5IG90aGVyIHRoaW5nIHdoaWNoIGNvbWVzIHRvIG1pbmQgaXMgdXNpbmcgaHVn
ZSBwYWdlcy4gQ2FuIHlvdSAKPj4gdHJ5IGEga2VybmVsIHdpdGggQ09ORklHX1RSQU5TUEFSRU5U
X0hVR0VQQUdFIGRpc2FibGVkPwo+Pgo+PiBUaGFua3MsCj4+IENocmlzdGlhbi4KPgo+IEhhcHB5
IE5ldyBZZWFyIDotKQo+Cj4gWWVzLCB0aGUgYm94IGhhcyAxRyBvZiBSQU0sIGFuZCB1bmZvcnR1
bmF0ZWx5IG5vcGUsIAo+IFRSQU5TUEFSRU5UX0hVR0VQQUdFIGlzIG5vdCBvbi4gSSBhbSBhdHRh
Y2hpbmcgdGhlIC5jb25maWcsIG1heWJlIHlvdSAKPiBjYW4gZmluZCBzb21lIGluc2FuaXR5IHRo
ZXJlLi4uIEFsc28gLSBmb3IgcmVmZXJlbmNlIC0gYSBtaW5pbWFsaXN0aWMgCj4gcGF0Y2ggZml4
aW5nIHN5bXB0b21zIChidXQgbm90IGFkZHJlc3NpbmcgdGhlIHJvb3QgY2F1c2XCoCA6LSggKQo+
Cj4gSSBjYW4gdHJ5IHRvIHJlYnVpbGQgdGhlIGtlcm5lbCB3aXRoIEhJR0hNRU0gb2ZmLCBhbHRo
b3VnaCBJIGFtIG5vdCAKPiBvcHRpbWlzdGljIGl0IHdpbGwgY2hhbmdlIGFueXRoaW5nLiBCdXQg
YXQgbGVhc3QgaXQgc2hvdWxkIHNpbXBsaWZ5IAo+IHRoZSAxRyBzcGxpdC4uLgo+Cj4gU28gaWYg
eW91IGhhdmUgYW55IG90aGVyIGlkZWFzIC0gcGxzIGxldCBtZSBrbm93Li4KPgo+IFRoYW5rcywg
V29vZHkKPgpJbnRlcmVzdGluZy4gUmVidWlsZGluZyB0aGUga2VybmVsIHdpdGggSElNRU0gZGlz
YWJsZWQgYWN0dWFsbHkgc29sdmVzIAp0aGUgZGlzcGxheSBwcm9ibGVtLiBUaGUgZGVidWcgbGlu
ZXMgc2hvdyBleGFjdGx5IHNhbWUgdmFsdWVzIGZvciAKZG1hX2dldF9yZXF1aXJlZF9tYXNrKCkg
YW5kIGRtYV9nZXRfbWFzaygpLCB5ZXQgbm93IGl0IHdvcmtzIE9LLi4uIFNvIAp3aGF0IGhhcyBz
b2x2ZWQgaXQ/Pz8KCldvb2R5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
