Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D6BE1252
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 08:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05006E95D;
	Wed, 23 Oct 2019 06:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frontdoor.pr.hu (frontdoor.pr.hu
 [IPv6:2a02:808:1:101:250:56ff:fe8e:136b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED526E95C;
 Wed, 23 Oct 2019 06:41:14 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
 by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <zboszor@pr.hu>)
 id 1iNAKW-0005pf-91; Wed, 23 Oct 2019 08:41:12 +0200
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
 helo=[192.168.1.13])
 by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <zboszor@pr.hu>)
 id 1iNAKS-00015V-1N; Wed, 23 Oct 2019 08:41:10 +0200
Subject: Re: UDL device cannot get its own screen
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <536af56f-924d-f089-a2d8-180f4dee1613@pr.hu>
 <CAKb7UvhZ9VR_X5Nqv01EDvnWF2RXXt5fCdYEa5KUy8owKh4CwQ@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <35cdaafe-461e-56ec-d3d3-47fdd6468251@pr.hu>
Date: Wed, 23 Oct 2019 08:41:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAKb7UvhZ9VR_X5Nqv01EDvnWF2RXXt5fCdYEa5KUy8owKh4CwQ@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 60bbfff3f593ca0883c8c002a5251436
X-Spam-Tracer: backend.mail.pr.hu -1.8 20191023064110Z
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=pr.hu; 
 s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=83q4yCIkQFJhv1S8jy+9umLkQ7OTSq8uOYB66Iep9m8=; b=USF2zxl2vPnaww86nhUJ32l0rH
 0eTVJZ3UONnwb3K0a115LBTDE4jh9HqstFrlc/iBGQv2ud3JfUQWj1e2XgMPtADsxsfHF4hwGL6PW
 /O27sDQhBoRW0Fn1Smj3kb1R+6WUBHMBSAd+qP6fU6t/MytjGAZg860wbGMiC2A/4xHS1tNuWrpLT
 7uW0XtQM87P9mqEM7hZgD2XmaRpG1vxWJ6fBWcdn78qx03R7yO1CWe83LdiH55R1bG/cvXBznazd7
 t/2/v4e+yzXWKGD+woHa0QO3qjkIyXdCVfZ3wzOODgEv2C0qGdw3592gDV0C2b/YCzps1VWTKnpCF
 umwd+KXQ==;
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
Cc: xorg@lists.x.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjAxOS4gMTAuIDIyLiAyMjo1NyBrZWx0ZXrDqXNzZWwsIElsaWEgTWlya2luIMOtcnRhOgo+IE9u
IFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDExOjUwIEFNIELDtnN6w7ZybcOpbnlpIFpvbHTDoW4gPHpi
b3N6b3JAcHIuaHU+IHdyb3RlOgo+Pgo+PiBIaSwKPj4KPj4gSSBoYXZlIHRoZSBiZWxvdyBjb25m
aWd1cmF0aW9uIGZvciBhbiBJbnRlbCBiYXNlZCBQT1Mgc3lzdGVtIHRoYXQsCj4+IHdoaWxlIGFk
dmVydGlzZXMgMyBvdXRwdXRzIChEUDEsIFZHQTEgYW5kIEhETUkxIHdpdGggeGY4Ni12aWRlby1p
bnRlbCksCj4+IG9ubHkgdHdvIGFyZSB1c2FibGUuIERQMSBmb3IgdGhlIGJ1aWx0LWluIHRvdWNo
c2NyZWVuIGFuZCBWR0ExIGZvcgo+PiB0aGUgZXh0ZXJuYWwgVkdBIGNvbm5lY3Rvci4KPj4KPj4g
SSB3YW50ZWQgdG8gdXNlIGFuIFVTQiBEaXNwbGF5TGluayBkZXZpY2UgYXMgdGhlIDNyZCBvdXRw
dXQsIHdpdGggYWxsCj4+IHRocmVlIG91dHB1dCB1c2luZyBpdHMgb3duIFNjcmVlbiBudW1iZXIs
IGkuZS4gOjAuMCA6MC4xIGFuZCA6MC4yLgo+Pgo+PiBbLi4uXQo+Pgo+PiBIb3cgY2FuIEkgc2V0
IHVwIDMgZGlmZmVyZW50IFNjcmVlbnMgY29ycmVjdGx5IGZvciAzIHNlcGFyYXRlIGZ1bGxzY3Jl
ZW4KPj4gYXBwbGljYXRpb25zPwo+Pgo+PiBJIGFtIHVzaW5nIFhvcmcgMS4yMC40IHBhdGNoZWQg
d2l0aCB0aGUgImF1dG9iaW5kIEdQVXMgdG8gdGhlIHNjcmVlbiIKPj4gcGF0Y2ggZnJvbSBEYXZl
IEFpcmxpZSB0aGF0IGF0IGxlYXN0IHdha2VzIHVwIHRoZSBVREwgZGV2aWNlIGFuZCBtYWtlcwo+
PiBpdCB2aXNpYmxlIHdpdGhvdXQgZXh0cmEgbWFnaWMgd2l0aCBwcm92aWRlcnMvc2lua3MuCj4g
Cj4gSWYgaXQncyBiZWluZyB0cmVhdGVkIGFzIGEgR1BVLCB0aGF0J3MgeW91ciBmaXJzdCBwcm9i
bGVtIGZvciB0aGlzCj4ga2luZCBvZiBzZXR1cC4gWW91IHNob3VsZCBzZWUgbW9kZXNldCgyKSwg
aW4geW91ciBsb2dzLCBidXQgSSBzdXNwZWN0Cj4geW91J3JlIHNlZWluZyBtb2Rlc2V0KEcwKSAo
dGhlICJHIiBpbmRpY2F0ZXMgIkdQVSIpLgoKbW9kZXNldCgyKSBpcyB0aGUgdW5jb25uZWN0ZWQg
SERNSS0xIG91dHB1dCBhZHZlcnRpc2VkIGJ5IHRoZSBJbnRlbCBjaGlwLgptb2Rlc2V0KEcwKSBp
cyBVREwuCgo+IAo+Pgo+PiBbLi4uXQo+PiBTZWN0aW9uICJNb25pdG9yIgo+PiAgICAgICAgICBJ
ZGVudGlmaWVyICAgICAgIkRWSS1JLTEtMSIKPiAKPiBUaGUgb3RoZXJzIGFyZSBNb25pdG9yLSos
IHRoaXMgb25lIGlzbid0LiBZb3UgcHJvYmFibHkgd2FudCB0aGlzIHRvIGJlCj4gRFZJLUktMSwg
YXMgbm90ZWQgYmVsb3cuIEkgZ3Vlc3MgeW91IGdldCB0aGUgZXh0cmEgLTEgZnJvbSBzZWVpbmcg
aXQKPiBhcyBhIHNsYXZlZCBHUFUncyBvdXRwdXQgaW4geW91ciBjdXJyZW50IGNvbmZpZ3VyYXRp
b24uCgpJbmRlZWQuIEZpeGVkLgoKPiAKPj4gICAgICAgICAgT3B0aW9uICAgICAgICAgICJBdXRv
U2VydmVyTGF5b3V0IiAib24iCj4+ICAgICAgICAgIE9wdGlvbiAgICAgICAgICAiUm90YXRlIiAi
bm9ybWFsIgo+PiBFbmRTZWN0aW9uCj4+Cj4+IFsuLi5dCiA+Pgo+PiBTZWN0aW9uICJEZXZpY2Ui
Cj4+ICAgICAgICAgIElkZW50aWZpZXIgICAgICAiVURMIgo+PiAgICAgICAgICBEcml2ZXIgICAg
ICAgICAgIm1vZGVzZXR0aW5nIgo+PiAgICAgICAgICBPcHRpb24gICAgICAgICAgImttc2RldiIg
Ii9kZXYvZHJpL2NhcmQwIgo+PiAgICAgICAgICBTY3JlZW4gICAgICAgICAgMgo+PiAgICAgICAg
ICBPcHRpb24gICAgICAgICAgIk1vbml0b3ItRFZJLUktMS0xIiAiRFZJLUktMS0xIgo+IAo+IEkg
dGhpbmsgeW91IGhhdmUgYW4gZXh0cmEgLTEgaW4gaGVyZSAoYW5kIHRoZSBtb25pdG9yIG5hbWUg
ZG9lc24ndAo+IGV4aXN0IGFzIHBlciBhYm92ZSkuIEFuZCBJIHRoaW5rIHRoZSAiU2NyZWVuIiBp
bmRleCBpcyB3cm9uZyAtLSBpdCdzCj4gbm90IHdoYXQgb25lIHRlbmRzIHRvIHRoaW5rIGl0IGlz
LCBhcyBJIHJlY2FsbC4gSSB0aGluayB5b3UgY2FuIGp1c3QKPiBkcm9wIHRoZXNlIGxpbmVzIHRo
b3VnaC4KCldpdGhvdXQgIlNjcmVlbiBOIiBsaW5lcywgYWxsIHRoZSBvdXRwdXRzIGFyZSBhc3Np
Z25lZCB0byA6MApzbyB0aGUgc2NyZWVuIGxheW91dCBzZXR1cCBpbiB0aGUgU2VydmVyTGF5b3V0
IHNlY3Rpb24gaXMgbm90CmFwcGxpZWQgcHJvcGVybHkuCgpJIGhhdmUgcmVhZCBEYXZlIEFpcmxp
ZSdzIHBhdGNoICh0aGF0IGhhcyBiZWVuIGFjY2VwdGVkIGludG8gWG9yZwoxLjIxLjApIG1vcmUg
Y2xvc2VseSwgYW5kIGl0IGluZGVlZCBiaW5kcyBVREwgdG8gRElTUExBWT06MApJIHRoaW5rIHRo
aXMgcGF0Y2ggbmVlZHMgYSBmb2xsb3d1cCBwYXRjaCBzbyBpdCB3b3VsZCB1c2UgdGhlCnNjcmVl
biBJRCBzcGVjaWZpZWQgaW4gdGhlIERldmljZSBzZWN0aW9uLgoKPiAKPj4gRW5kU2VjdGlvbgo+
Pgo+PiBbLi4uXQo+Pgo+PiBTZWN0aW9uICJTZXJ2ZXJMYXlvdXQiCj4+ICAgICAgICAgIElkZW50
aWZpZXIgICAgICAiTEFZT1VUIgo+PiAgICAgICAgICBPcHRpb24gICAgICAgICAgIkF1dG9TZXJ2
ZXJMYXlvdXQiICJvbiIKPj4gICAgICAgICAgU2NyZWVuICAgICAgICAgIDAgIlNDUkVFTiIKPj4g
ICAgICAgICAgU2NyZWVuICAgICAgICAgIDEgIlNDUkVFTjEiIFJpZ2h0T2YgIlNDUkVFTiIKPj4g
ICAgICAgICAgU2NyZWVuICAgICAgICAgIDIgIlNDUkVFTjIiIFJpZ2h0T2YgIlNDUkVFTjEiCj4+
IEVuZFNlY3Rpb24KPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBab2x0w6FuIELDtnN6w7ZybcOpbnlp
Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
