Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4142D6F6
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 09:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC51B6E091;
	Wed, 29 May 2019 07:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218376E091
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 07:50:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s17so959026wru.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 00:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=vHGJs1QWqaaLnoKHv3AaxDr6eJ34CZBfppfc4FHTEyQ=;
 b=OXRbcpDH2OeQfVMuO61QTyaj2ttR758Sc6MoyVmw1TW5leh34JjOMXCU7zSYPOVRtP
 mr3waSOVvL70+xqV5s7ScD+szR56uphnvjHrVdMXy9coZZjlmDiHooNhXfwgr4Ycztf8
 aeJbwwOq8T4mBNawSFlnc8/+fvO8JzHuV8YOItu8ALfyR/JESADEpdLUHpuPbYkQQIf7
 YRCDEL7qKk3S8xcbbe20O7c52wcu1P24bJVKAD1887XS5rS4wWAH00S9bWupLF3MJZ3c
 shF5myf1BzseSasMLzHwrJYW866FoVMeE8AntbslaZhWgLTgQ4zHw9mwVgtQLHrxmxHN
 +a5Q==
X-Gm-Message-State: APjAAAU2groRhCl6N33ZWWm9mGLW5kifEHEdwmfWXdOjn2DbFywGXa6V
 zTXmdic/96XMi8EqVMCxVVrYvmBI
X-Google-Smtp-Source: APXvYqzkS3F1tLvGl7cFvO+YPlJYCA2YURj4QT55A8ojSip978JaRGczUNQ+U51BMxImQvOXvKzn+g==
X-Received: by 2002:a5d:62c9:: with SMTP id o9mr2162600wrv.186.1559116232661; 
 Wed, 29 May 2019 00:50:32 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o14sm7453824wrp.77.2019.05.29.00.50.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 00:50:31 -0700 (PDT)
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
To: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thomas@shipmail.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>
References: <20190524081114.53661-1-thomas@shipmail.org>
 <f2c4ccdd-49c9-2188-3378-2f333a8f605f@amd.com>
 <d397836b-13a4-b6cd-e059-035203f2edc6@shipmail.org>
 <d59cb481-1360-25eb-a2da-1ae64c648daf@shipmail.org>
 <84fa57da-7bb7-8322-125a-89596fbb2145@amd.com>
 <33816cbd-ddfb-b47a-a305-2760f8568eff@shipmail.org>
 <79c8d26a-d2dd-3e2c-f0bc-cbfc47a67fee@amd.com>
 <deef176a-5467-5beb-7f1b-fcd7bd1deab7@shipmail.org>
 <CADnq5_O+L-aJ_WU4ZcBmLYOV3RqNouw_P-2wYfCoJwXxj6ny3g@mail.gmail.com>
 <52df61a9-028e-8ff6-0850-20ddddb11de3@shipmail.org>
 <5b1b3f22-beea-16c4-a98f-9e632b408020@amd.com>
 <6b9b8536-bfea-5817-06e4-23881b86ab31@shipmail.org>
 <cc1d736d-9a8f-03d0-26ab-60a686ad71bd@amd.com>
 <a1bdbae7-009a-85ad-beb1-f938995274db@amd.com>
 <6dac8c560f75cae65e81a0f6466cbfdb270575e8.camel@vmware.com>
 <4b22c4ed-1d66-0aff-51a2-7a1ddb411878@amd.com>
 <1325ba3d-55f6-8b3c-c4b0-b0cc7b1a9d29@amd.com>
 <9da98001-1636-768d-e477-b96611406944@shipmail.org>
 <7124da0b-399a-81a3-dfca-b2ce64d73072@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <dd5ae5d1-7d94-895b-d2ab-ad5e174b8eb8@gmail.com>
Date: Wed, 29 May 2019 09:50:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7124da0b-399a-81a3-dfca-b2ce64d73072@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vHGJs1QWqaaLnoKHv3AaxDr6eJ34CZBfppfc4FHTEyQ=;
 b=qFHqujyDbCVvTwxTbLaMENihdoubX12yjFtb02uvhbpDJ2oxpe/tuMj6nWbNb9Okps
 yIsXgKKR4ZAZAXsA0T813JvN4aJxIq/rcc8cqXgGjDYjPB8Us+W1Fn5tXgj5RymNVskR
 0S+uAqcUBa0iK9bakwSZjEWwlFEBSoPWjkWSYZhUaL3ythES9rFukMQDtvZg8WvCi1wL
 dVGgBMqfOKwc+Iu3/E3CVoEAJJ4+KwhZIFsBpJQJH/NYo7iiCiPf6bervEpw1qk4wfn6
 zWrl4G4Kz/N43mPni7NLzEig1lC7sTHuhJ61GfbWkywqc9KJxU+WoJdjzRUYNqtoEmCB
 DSIA==
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
Reply-To: christian.koenig@amd.com
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDUuMTkgdW0gMTk6MjMgc2NocmllYiBMZW5kYWNreSwgVGhvbWFzOgo+IE9uIDUvMjgv
MTkgMTI6MDUgUE0sIFRob21hcyBIZWxsc3Ryb20gd3JvdGU6Cj4+IE9uIDUvMjgvMTkgNzowMCBQ
TSwgTGVuZGFja3ksIFRob21hcyB3cm90ZToKPj4+IE9uIDUvMjgvMTkgMTE6MzIgQU0sIEtvZW5p
ZywgQ2hyaXN0aWFuIHdyb3RlOgo+Pj4+IEFtIDI4LjA1LjE5IHVtIDE4OjI3IHNjaHJpZWIgVGhv
bWFzIEhlbGxzdHJvbToKPj4+Pj4gT24gVHVlLCAyMDE5LTA1LTI4IGF0IDE1OjUwICswMDAwLCBM
ZW5kYWNreSwgVGhvbWFzIHdyb3RlOgo+Pj4+Pj4gT24gNS8yOC8xOSAxMDoxNyBBTSwgS29lbmln
LCBDaHJpc3RpYW4gd3JvdGU6Cj4+Pj4+Pj4gSGkgVGhvbWFzLAo+Pj4+Pj4+Cj4+Pj4+Pj4gQW0g
MjguMDUuMTkgdW0gMTc6MTEgc2NocmllYiBUaG9tYXMgSGVsbHN0cm9tOgo+Pj4+Pj4+PiBIaSwg
VG9tLAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGFua3MgZm9yIHRoZSByZXBseS4gVGhlIHF1ZXN0aW9u
IGlzIG5vdCBncmFwaGljcyBzcGVjaWZpYywgYnV0Cj4+Pj4+Pj4+IGxpZXMKPj4+Pj4+Pj4gaW4g
eW91ciBhbnN3ZXIgZnVydGhlciBiZWxvdzoKPj4+Pj4+Pj4KPj4+Pj4+Pj4gT24gNS8yOC8xOSA0
OjQ4IFBNLCBMZW5kYWNreSwgVGhvbWFzIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gNS8yOC8xOSAyOjMx
IEFNLCBUaG9tYXMgSGVsbHN0cm9tIHdyb3RlOgo+Pj4+Pj4+Pj4gW1NOSVBdCj4+Pj4+Pj4+PiBB
cyBmb3Iga2VybmVsIHZtYXBzIGFuZCB1c2VyLW1hcHMsIHRob3NlIHBhZ2VzIHdpbGwgYmUgbWFy
a2VkCj4+Pj4+Pj4+PiBlbmNyeXB0ZWQKPj4+Pj4+Pj4+ICh1bmxlc3MgZXhwbGljaXRseSBtYWRl
IHVuLWVuY3J5cHRlZCBieSBjYWxsaW5nCj4+Pj4+Pj4+PiBzZXRfbWVtb3J5X2RlY3J5cHRlZCgp
KS4KPj4+Pj4+Pj4+IEJ1dCwgaWYgeW91IGFyZSBjb3B5aW5nIHRvL2Zyb20gdGhvc2UgYXJlYXMg
aW50byB0aGUgdW4tCj4+Pj4+Pj4+PiBlbmNyeXB0ZWQgRE1BCj4+Pj4+Pj4+PiBhcmVhIHRoZW4g
ZXZlcnl0aGluZyB3aWxsIGJlIG9rLgo+Pj4+Pj4+PiBUaGUgcXVlc3Rpb24gaXMgcmVnYXJkaW5n
IHRoZSBhYm92ZSBwYXJhZ3JhcGguCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEFGQUlDVCzCoCBzZXRfbWVt
b3J5X2RlY3J5cHRlZCgpIG9ubHkgY2hhbmdlcyB0aGUgZml4ZWQga2VybmVsIG1hcAo+Pj4+Pj4+
PiBQVEVzLgo+Pj4+Pj4+PiBCdXQgd2hlbiBzZXR0aW5nIHVwIG90aGVyIGFsaWFzZWQgUFRFcyB0
byB0aGUgZXhhY3Qgc2FtZQo+Pj4+Pj4+PiBkZWNyeXB0ZWQKPj4+Pj4+Pj4gcGFnZXMsIGZvciBl
eGFtcGxlIHVzaW5nIGRtYV9tbWFwX2NvaGVyZW50KCksCj4+Pj4+Pj4+IGttYXBfYXRvbWljX3By
b3QoKSwKPj4+Pj4+Pj4gdm1hcCgpIGV0Yy4gV2hhdCBjb2RlIGlzIHJlc3BvbnNpYmxlIGZvciBj
bGVhcmluZyB0aGUgZW5jcnlwdGVkCj4+Pj4+Pj4+IGZsYWcKPj4+Pj4+Pj4gb24gdGhvc2UgUFRF
cz8gSXMgdGhlcmUgc29tZXRoaW5nIGluIHRoZSB4ODYgcGxhdGZvcm0gY29kZSBkb2luZwo+Pj4+
Pj4+PiB0aGF0Pwo+Pj4+Pj4+IFRvbSBhY3R1YWxseSBleHBsYWluZWQgdGhpczoKPj4+Pj4+Pj4g
VGhlIGVuY3J5cHRpb24gYml0IGlzIGJpdC00NyBvZiBhIHBoeXNpY2FsIGFkZHJlc3MuCj4+Pj4+
Pj4gSW4gb3RoZXIgd29yZHMgc2V0X21lbW9yeV9kZWNyeXB0ZWQoKSBjaGFuZ2VzIHRoZSBwaHlz
aWNhbCBhZGRyZXNzCj4+Pj4+Pj4gaW4KPj4+Pj4+PiB0aGUgUFRFcyBvZiB0aGUga2VybmVsIG1h
cHBpbmcgYW5kIGFsbCBvdGhlciB1c2UgY2FzZXMganVzdCBjb3B5Cj4+Pj4+Pj4gdGhhdAo+Pj4+
Pj4+IGZyb20gdGhlcmUuCj4+Pj4+PiBFeGNlcHQgSSBkb24ndCB0aGluayB0aGUgUFRFIGF0dHJp
YnV0ZXMgYXJlIGNvcGllZCBmcm9tIHRoZSBrZXJuZWwKPj4+Pj4+IG1hcHBpbmcKPj4+Pj4gKzEh
Cj4+Pj4+Cj4+Pj4+PiBpbiBzb21lIGNhc2VzLiBGb3IgZXhhbXBsZSwgZG1hX21tYXBfY29oZXJl
bnQoKSB3aWxsIGNyZWF0ZSB0aGUgc2FtZQo+Pj4+Pj4gdm1fcGFnZV9wcm90IHZhbHVlIHJlZ2Fy
ZGxlc3Mgb2Ygd2hldGhlciBvciBub3QgdGhlIHVuZGVybHlpbmcgbWVtb3J5Cj4+Pj4+PiBpcwo+
Pj4+Pj4gZW5jcnlwdGVkIG9yIG5vdC4gQnV0IGttYXBfYXRvbWljX3Byb3QoKSB3aWxsIHJldHVy
biB0aGUga2VybmVsCj4+Pj4+PiB2aXJ0dWFsCj4+Pj4+PiBhZGRyZXNzIG9mIHRoZSBwYWdlLCBz
byB0aGF0IHdvdWxkIGJlIGZpbmUuCj4+Pj4+IFllcywgb24gNjQtYml0IHN5c3RlbXMuIE9uIDMy
LWJpdCBzeXN0ZW1zIChkbyB0aGV5IGV4aXN0IHdpdGggU0VWPyksCj4+Pj4+IHRoZXkgZG9uJ3Qu
Cj4+Pj4gSSBkb24ndCB0aGluayBzbywgYnV0IGZlZWwgZnJlZSB0byBwcm92ZSBtZSB3cm9uZyBU
b20uCj4+PiBTRVYgaXMgNjQtYml0IG9ubHkuCj4+IEFuZCBJIGp1c3Qgbm90aWNlZCB0aGF0IGtt
YXBfYXRvbWljX3Byb3QoKSBpbmRlZWQgcmV0dXJucyB0aGUga2VybmVsIG1hcAo+PiBhbHNvIGZv
ciAzMi1iaXQgbG93bWVtLgo+Pgo+Pj4+PiBBbmQgc2ltaWxhcmx5IFRUTSB1c2VyLXNwYWNlIG1h
cHBpbmdzIGFuZCB2bWFwKCkgZG9lc24ndCBjb3B5IGZyb20gdGhlCj4+Pj4+IGtlcm5lbCBtYXAg
ZWl0aGVyLMKgIHNvIEkgdGhpbmsgd2UgYWN0dWFsbHkgZG8gbmVlZCB0byBtb2RpZnkgdGhlIHBh
Z2UtCj4+Pj4+IHByb3QgbGlrZSBkb25lIGluIHRoZSBwYXRjaC4KPj4+PiBXZWxsIHRoZSBwcm9i
bGVtIGlzIHRoYXQgdGhpcyB3b24ndCBoYXZlIGFueSBlZmZlY3QuCj4+Pj4KPj4+PiBBcyBUb20g
ZXhwbGFpbmVkIGVuY3J5cHRpb24gaXMgbm90IGltcGxlbWVudGVkIGFzIGEgcGFnZSBwcm90ZWN0
aW9uIGJpdCwKPj4+PiBidXQgcmF0aGVyIGFzIHBhcnQgb2YgdGhlIHBoeXNpY2FsIGFkZHJlc3Mg
b2YgdGhlIHBhcnQuCj4+PiBUaGlzIGlzIHdoZXJlIHRoaW5ncyBnZXQgaW50ZXJlc3RpbmcuwqAg
RXZlbiB0aG91Z2ggdGhlIGVuY3J5cHRpb24gYml0IGlzCj4+PiBwYXJ0IG9mIHRoZSBwaHlzaWNh
bCBhZGRyZXNzIChlLmcuIHVuZGVyIFNNRSB0aGUgZGV2aWNlIGNvdWxkL3dvdWxkIHVzZSBhbgo+
Pj4gYWRkcmVzcyB3aXRoIHRoZSBlbmNyeXB0aW9uIGJpdCBzZXQpLCBpdCBpcyBpbXBsZW1lbnRl
ZCBhcyBwYXJ0IG9mIHRoZSBQVEUKPj4+IGF0dHJpYnV0ZXMuIFNvLCBmb3IgZXhhbXBsZSwgdXNp
bmcgX1BBR0VfRU5DIHdoZW4gYnVpbGRpbmcgYSBwZ3Byb3QgdmFsdWUKPj4+IHdvdWxkIHByb2R1
Y2UgYW4gZW50cnkgd2l0aCB0aGUgZW5jcnlwdGlvbiBiaXQgc2V0Lgo+Pj4KPj4+IEFuZCB0aGUg
dGhpbmcgdG8gd2F0Y2ggb3V0IGZvciBpcyB1c2luZyB0d28gdmlydHVhbCBhZGRyZXNzZXMgdGhh
dCBwb2ludAo+Pj4gdG8gdGhlIHNhbWUgcGh5c2ljYWwgYWRkcmVzcyAocGFnZSkgaW4gRFJBTSBi
dXQgb25lIGhhcyB0aGUgZW5jcnlwdGlvbiBiaXQKPj4+IHNldCBhbmQgb25lIGRvZXNuJ3QuIFRo
ZSBoYXJkd2FyZSBkb2VzIG5vdCBlbmZvcmNlIGNvaGVyZW5jeSBiZXR3ZWVuIGFuCj4+PiBlbmNy
eXB0ZWQgYW5kIHVuLWVuY3J5cHRlZCBtYXBwaW5nIG9mIHRoZSBzYW1lIHBoeXNpY2FsIGFkZHJl
c3MgKHBhZ2UpLgo+Pj4gU2VlIHNlY3Rpb24gNy4xMC42IG9mIHRoZSBBTUQ2NCBBcmNoaXRlY3R1
cmUgUHJvZ3JhbW1lcidzIE1hbnVhbCBWb2x1bWUgMi4KPj4gSW5kZWVkLiBBbmQgSSdtIHByZXR0
eSBzdXJlIHRoZSBrZXJuZWwgbWFwIFBURSBhbmQgYSBUVE0gLyB2bWFwIFBURQo+PiBwb2ludGlu
ZyB0byB0aGUgc2FtZSBkZWNyeXB0ZWQgcGFnZSBkaWZmZXIgaW4gdGhlIGVuY3J5cHRpb24gYml0
ICg0NykKPj4gc2V0dGluZy4KClRoYXQgY2FuJ3QgYmUgdGhlIGNhc2UsIGNhdXNlIG90aGVyd2lz
ZSBhbWRncHUgd291bGRuJ3QgYWxyZWFkeSB3b3JrIAp3aXRoIFNNRSBlbmFibGVkLgoKSSB0aGlu
ayB5b3VyIHBhdGNoIG1pZ2h0IGdvIGludG8gdGhlIHJpZ2h0IGRpcmVjdGlvbiwgYnV0IGJlZm9y
ZSB3ZSAKY29tbWl0IGFueXRoaW5nIGxpa2UgdGhhdCB3ZSBuZWVkIHRvIHVuZGVyc3RhbmQgZmly
c3QgaG93IGl0IGFjdHVhbGx5IAp3b3JrcyBjdXJyZW50bHkuCgpNYXliZSBJIHJlYWxseSBuZWVk
IHRvIHNldHVwIGEgdGVzdCBzeXN0ZW0gaGVyZS4KCkNocmlzdGlhbi4KCj4+Cj4+IEJ1dCBvbiB0
aGUgaHlwZXJ2aXNvciB0aGF0IHdvdWxkIHNvcnQgb2Ygd29yaywgYmVjYXVzZSBmcm9tIHdoYXQg
SQo+PiB1bmRlcnN0YW5kIHdpdGggU0VWIHdlIHNlbGVjdCBiZXR3ZWVuIHRoZSBndWVzdCBrZXkg
YW5kIHRoZSBoeXBlcnZpc29yCj4+IGtleSB3aXRoIHRoYXQgYml0LiBPbiB0aGUgaHlwZXJ2aXNv
ciBib3RoIGtleXMgYXJlIHRoZSBzYW1lPyBPbiBhIGd1ZXN0Cj4+IGl0IHdvdWxkIHByb2JhYmx5
IGJyZWFrLgo+IEZvciBTRVYsIGlmIHRoZSBlbmNyeXB0aW9uIGJpdCBpcyBzZXQgdGhlbiB0aGUg
Z3Vlc3Qga2V5IGlzIHVzZWQuIElmIHRoZQo+IGVuY3J5cHRpb24gYml0IGlzIG5vdCBzZXQsIHRo
ZW4gdGhlIGh5cGVydmlzb3Iga2V5IGlzIHVzZWQgSUZGIHRoZQo+IGVuY3J5cHRpb24gYml0IGlz
IHNldCBpbiB0aGUgaHlwZXJ2aXNvciBwYWdlIHRhYmxlcy4gIFlvdSBjYW4gaGF2ZSBTRVYKPiBn
dWVzdHMgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIFNNRSBpcyBhY3RpdmUgKG5vdGUsIHRoZXJlIGlz
IGEgZGlmZmVyZW5jZQo+IGJldHdlZW4gU01FIGJlaW5nIGVuYWJsZWQgdnMuIFNNRSBiZWluZyBh
Y3RpdmUpLgo+Cj4gRm9yIFNNRSwgdGhlcmUgaXMgb25seSBvbmUga2V5LiBUaGUgZW5jcnlwdGlv
biBiaXQgZGV0ZXJtaW5lcyB3aGV0aGVyIHRoZQo+IGRhdGEgaXMgcnVuIHRocm91Z2ggdGhlIGVu
Y3J5cHRpb24gcHJvY2VzcyBvciBub3QuCj4KPiBUaGFua3MsCj4gVG9tCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
