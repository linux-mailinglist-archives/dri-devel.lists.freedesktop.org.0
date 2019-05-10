Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1A7199A2
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 10:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA7C89BC0;
	Fri, 10 May 2019 08:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0C4898BF
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 05:18:29 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 13so2559386pfw.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2019 22:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xr7T45ENj0X8h0TTVYIw3YN3QMd5VAPV0aYioKPyHGs=;
 b=k5vH9BkGE80SQz9QHQAI41jYF1ZNLb0LITpb/sd8br2uWODidwR3Ca66XFkloHdB3F
 eU8j1q/djj0uhq/jiRC2XQfwiil/DzPnJruPjQvSrk0qhfJG1gSfzM1WdpjLJ3fiUFBB
 UFE39XlJojVIDAjt5+S6gM4u3p4ocgcrzmYeWfht6QThzec9Jpp7I+J2CSCXnFWJDZpK
 ZIoM6oIQbZHpRvK/sAiRD6KuWdWnz6SXoGyYF/wNk3A/Qs0bhIryr4WB29xo8C1udZVX
 5hwVuCRUfLnTylzq/5iuypmiwJAnyrwBQUnYIr+tXJUSX8MbWL4d/hIGQQu+AERDGane
 4Dsg==
X-Gm-Message-State: APjAAAXHDbjkjBexGLAXUa9StSb9zulJvd8PIFHNusIczgTi5k2Nuncr
 MDrsY3Ry83XvztL8jJtikxE=
X-Google-Smtp-Source: APXvYqwtH7Skgh8l1ykgmrPjhuMGx9pfdkEsTTFsM6aBvQOxMoXlEpvU8usovtkKH/1Zc0SXCzAcIQ==
X-Received: by 2002:a63:4820:: with SMTP id v32mr11058846pga.89.1557465509602; 
 Thu, 09 May 2019 22:18:29 -0700 (PDT)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net.
 [24.6.192.50])
 by smtp.gmail.com with ESMTPSA id l19sm4974597pff.1.2019.05.09.22.18.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 22:18:29 -0700 (PDT)
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Logan Gunthorpe <logang@deltatee.com>, Theodore Ts'o <tytso@mit.edu>,
 Tim.Bird@sony.com, knut.omang@oracle.com, gregkh@linuxfoundation.org,
 brendanhiggins@google.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org,
 sboyd@kernel.org, shuah@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-um@lists.infradead.org, Alexander.Levin@microsoft.com,
 amir73il@gmail.com, dan.carpenter@oracle.com, dan.j.williams@intel.com,
 daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
 khilman@baylibre.com, mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at,
 rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com
References: <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <b09ba170-229b-fde4-3e9a-e50d6ab4c1b5@deltatee.com>
 <20190509233043.GC20877@mit.edu>
 <8914afef-1e66-e6e3-f891-5855768d3018@deltatee.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <6d6e91ec-33d3-830b-4895-4d7a20ba7d45@gmail.com>
Date: Thu, 9 May 2019 22:18:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8914afef-1e66-e6e3-f891-5855768d3018@deltatee.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 10 May 2019 08:23:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=xr7T45ENj0X8h0TTVYIw3YN3QMd5VAPV0aYioKPyHGs=;
 b=E1W7JeDYer401ts5Pou7l1Dg8TvNv88Ns4Lxp8N/AgQI/qtmKYf4sNUlvOULHL6msw
 bA+I7RbCsYKAaaMHAvXT6Fy1BGVr1yesoASaRLH6j/RcI8tUmGMA5UmJ/rWF+KvKU+u2
 kHaJkGp0GSxbcaoUl+lU2S18kDfjfldcm6/dgG8YRjndn5rv5Vcgo2gT7GV7bNpO12MH
 WACO3dSP6EWF4OBYJVOjOuhUw87UecegOh600ZVYpyP23r15SmCI6/2JOlQtfBmzCiBv
 GKCcSYfhY18upXwnqcnmZwEFLwwyITRtKemOfO3+vrLyFwKarkL6tbKzZ3EF3xyKXxzT
 KHfw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS85LzE5IDQ6NDAgUE0sIExvZ2FuIEd1bnRob3JwZSB3cm90ZToKPiAKPiAKPiBPbiAyMDE5
LTA1LTA5IDU6MzAgcC5tLiwgVGhlb2RvcmUgVHMnbyB3cm90ZToKPj4gT24gVGh1LCBNYXkgMDks
IDIwMTkgYXQgMDQ6MjA6MDVQTSAtMDYwMCwgTG9nYW4gR3VudGhvcnBlIHdyb3RlOgo+Pj4KPj4+
IFRoZSBzZWNvbmQgaXRlbSwgYXJndWFibHksIGRvZXMgaGF2ZSBzaWduaWZpY2FudCBvdmVybGFw
IHdpdGgga3NlbGZ0ZXN0Lgo+Pj4gV2hldGhlciB5b3UgYXJlIHJ1bm5pbmcgc2hvcnQgdGVzdHMg
aW4gYSBsaWdodCB3ZWlnaHQgVU1MIGVudmlyb25tZW50IG9yCj4+PiBoaWdoZXIgbGV2ZWwgdGVz
dHMgaW4gYW4gaGVhdmllciBWTSB0aGUgdHdvIGNvdWxkIGJlIHVzaW5nIHRoZSBzYW1lCj4+PiBm
cmFtZXdvcmsgZm9yIHdyaXRpbmcgb3IgZGVmaW5pbmcgaW4ta2VybmVsIHRlc3RzLiBJdCAqbWF5
KiBhbHNvIGJlIHZhbHVhYmxlCj4+PiBmb3Igc29tZSBwZW9wbGUgdG8gYmUgYWJsZSB0byBydW4g
YWxsIHRoZSBVTUwgdGVzdHMgaW4gdGhlIGhlYXZ5IFZNCj4+PiBlbnZpcm9ubWVudCBhbG9uZyBz
aWRlIG90aGVyIGhpZ2hlciBsZXZlbCB0ZXN0cy4KPj4+Cj4+PiBMb29raW5nIGF0IHRoZSBzZWxm
dGVzdHMgdHJlZSBpbiB0aGUgcmVwbywgd2UgYWxyZWFkeSBoYXZlIHNpbWlsYXIgaXRlbXMgdG8K
Pj4+IHdoYXQgS3VuaXQgaXMgYWRkaW5nIGFzIEkgZGVzY3JpYmVkIGluIHBvaW50ICgyKSBhYm92
ZS4ga3NlbGZ0ZXN0X2hhcm5lc3MuaAo+Pj4gY29udGFpbnMgbWFjcm9zIGxpa2UgRVhQRUNUXyog
YW5kIEFTU0VSVF8qIHdpdGggdmVyeSBzaW1pbGFyIGludGVudGlvbnMgdG8KPj4+IHRoZSBuZXcg
S1VOSVRfRVhFQ1BUXyogYW5kIEtVTklUX0FTU0VSVF8qIG1hY3Jvcy4KPj4+Cj4+PiBIb3dldmVy
LCB0aGUgbnVtYmVyIG9mIHVzZXJzIG9mIHRoaXMgaGFybmVzcyBhcHBlYXJzIHRvIGJlIHF1aXRl
IHNtYWxsLiBNb3N0Cj4+PiBvZiB0aGUgY29kZSBpbiB0aGUgc2VsZnRlc3RzIHRyZWUgc2VlbXMg
dG8gYmUgYSByYW5kb20gbWlzbWFzaCBvZiBzY3JpcHRzCj4+PiBhbmQgdXNlcnNwYWNlIGNvZGUg
c28gaXQncyBub3QgaGFyZCB0byBzZWUgaXQgYXMgc29tZXRoaW5nIGNvbXBsZXRlbHkKPj4+IGRp
ZmZlcmVudCBmcm9tIHRoZSBuZXcgS3VuaXQ6Cj4+Pgo+Pj4gJCBnaXQgZ3JlcCAtLWZpbGVzLXdp
dGgtbWF0Y2hlcyBrc2VsZnRlc3RfaGFybmVzcy5oICoKPj4KPj4gVG8gdGhlIGV4dGVudCB0aGF0
IHdlIGNhbiB1bmlmeSBob3cgdGVzdHMgYXJlIHdyaXR0ZW4sIEkgYWdyZWUgdGhhdAo+PiB0aGlz
IHdvdWxkIGJlIGEgZ29vZCB0aGluZy7CoCBIb3dldmVyLCB5b3Ugc2hvdWxkIG5vdGUgdGhhdAo+
PiBrc2VsZnRlc3RfaGFybmVzcy5oIGlzIGN1cnJlbnRseSBhc3N1bXMgdGhhdCBpdCB3aWxsIGJl
IGluY2x1ZGVkIGluCj4+IHVzZXJzcGFjZSBwcm9ncmFtcy7CoCBUaGlzIGlzIG1vc3Qgb2J2aW91
c2x5IHNlZW4gaWYgeW91IGxvb2sgY2xvc2VseQo+PiBhdCB0aGUgZnVuY3Rpb25zIGRlZmluZWQg
aW4gdGhlIGhlYWRlciBmaWxlcyB3aGljaCBtYWtlcyBjYWxscyB0bwo+PiBmb3JrKCksIGFib3J0
KCkgYW5kIGZwcmludGYoKS4KPiAKPiBBaCwgeWVzLiBJIG9idmlvdXNseSBkaWQgbm90IGRpZyBk
ZWVwIGVub3VnaC4gVXNpbmcga3VuaXQgZm9yCj4gaW4ta2VybmVsIHRlc3RzIGFuZCBrc2VsZnRl
c3RfaGFybmVzcyBmb3IgdXNlcnNwYWNlIHRlc3RzIHNlZW1zIGxpa2UKPiBhIHNlbnNpYmxlIGxp
bmUgdG8gZHJhdyB0byBtZS4gVHJ5aW5nIHRvIHVuaWZ5IGtlcm5lbCBhbmQgdXNlcnNwYWNlCj4g
aGVyZSBzb3VuZHMgbGlrZSBpdCBjb3VsZCBiZSBkaWZmaWN1bHQgc28gaXQncyBwcm9iYWJseSBu
b3Qgd29ydGgKPiBmb3JjaW5nIHRoZSBpc3N1ZSB1bmxlc3Mgc29tZW9uZSB3YW50cyB0byBkbyBz
b21lIHJlYWxseSBmYW5jeSB3b3JrCj4gdG8gZ2V0IGl0IGRvbmUuCj4gCj4gQmFzZWQgb24gc29t
ZSBvZiB0aGUgb3RoZXIgY29tbWVudGVycywgSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24KPiB0
aGF0IGtzZWxmdGVzdHMgaGFkIGluLWtlcm5lbCB0ZXN0cyBidXQgSSdtIG5vdCBzdXJlIHdoZXJl
IG9yIGlmIHRoZXkKPiBleGlzdC4KCllFUywga3NlbGZ0ZXN0IGhhcyBpbi1rZXJuZWwgdGVzdHMu
ICAoRXhjdXNlIHRoZSBzaG91dGluZy4uLikKCkhlcmUgaXMgYSBsaWtlbHkgbGlzdCBvZiB0aGVt
IGluIHRoZSBrZXJuZWwgc291cmNlIHRyZWU6CgokIGdyZXAgbW9kdWxlX2luaXQgbGliL3Rlc3Rf
Ki5jCmxpYi90ZXN0X2JpdGZpZWxkLmM6bW9kdWxlX2luaXQodGVzdF9iaXRmaWVsZHMpCmxpYi90
ZXN0X2JpdG1hcC5jOm1vZHVsZV9pbml0KHRlc3RfYml0bWFwX2luaXQpOwpsaWIvdGVzdF9icGYu
Yzptb2R1bGVfaW5pdCh0ZXN0X2JwZl9pbml0KTsKbGliL3Rlc3RfZGVidWdfdmlydHVhbC5jOm1v
ZHVsZV9pbml0KHRlc3RfZGVidWdfdmlydHVhbF9pbml0KTsKbGliL3Rlc3RfZmlybXdhcmUuYzpt
b2R1bGVfaW5pdCh0ZXN0X2Zpcm13YXJlX2luaXQpOwpsaWIvdGVzdF9oYXNoLmM6bW9kdWxlX2lu
aXQodGVzdF9oYXNoX2luaXQpOwkvKiBEb2VzIGV2ZXJ5dGhpbmcgKi8KbGliL3Rlc3RfaGV4ZHVt
cC5jOm1vZHVsZV9pbml0KHRlc3RfaGV4ZHVtcF9pbml0KTsKbGliL3Rlc3RfaWRhLmM6bW9kdWxl
X2luaXQoaWRhX2NoZWNrcyk7CmxpYi90ZXN0X2thc2FuLmM6bW9kdWxlX2luaXQoa21hbGxvY190
ZXN0c19pbml0KTsKbGliL3Rlc3RfbGlzdF9zb3J0LmM6bW9kdWxlX2luaXQobGlzdF9zb3J0X3Rl
c3QpOwpsaWIvdGVzdF9tZW1jYXRfcC5jOm1vZHVsZV9pbml0KHRlc3RfbWVtY2F0X3BfaW5pdCk7
CmxpYi90ZXN0X21vZHVsZS5jOnN0YXRpYyBpbnQgX19pbml0IHRlc3RfbW9kdWxlX2luaXQodm9p
ZCkKbGliL3Rlc3RfbW9kdWxlLmM6bW9kdWxlX2luaXQodGVzdF9tb2R1bGVfaW5pdCk7CmxpYi90
ZXN0X29iamFnZy5jOm1vZHVsZV9pbml0KHRlc3Rfb2JqYWdnX2luaXQpOwpsaWIvdGVzdF9vdmVy
Zmxvdy5jOnN0YXRpYyBpbnQgX19pbml0IHRlc3RfbW9kdWxlX2luaXQodm9pZCkKbGliL3Rlc3Rf
b3ZlcmZsb3cuYzptb2R1bGVfaW5pdCh0ZXN0X21vZHVsZV9pbml0KTsKbGliL3Rlc3RfcGFybWFu
LmM6bW9kdWxlX2luaXQodGVzdF9wYXJtYW5faW5pdCk7CmxpYi90ZXN0X3ByaW50Zi5jOm1vZHVs
ZV9pbml0KHRlc3RfcHJpbnRmX2luaXQpOwpsaWIvdGVzdF9yaGFzaHRhYmxlLmM6bW9kdWxlX2lu
aXQodGVzdF9yaHRfaW5pdCk7CmxpYi90ZXN0X3NpcGhhc2guYzptb2R1bGVfaW5pdChzaXBoYXNo
X3Rlc3RfaW5pdCk7CmxpYi90ZXN0X3NvcnQuYzptb2R1bGVfaW5pdCh0ZXN0X3NvcnRfaW5pdCk7
CmxpYi90ZXN0X3N0YWNraW5pdC5jOm1vZHVsZV9pbml0KHRlc3Rfc3RhY2tpbml0X2luaXQpOwps
aWIvdGVzdF9zdGF0aWNfa2V5X2Jhc2UuYzptb2R1bGVfaW5pdCh0ZXN0X3N0YXRpY19rZXlfYmFz
ZV9pbml0KTsKbGliL3Rlc3Rfc3RhdGljX2tleXMuYzptb2R1bGVfaW5pdCh0ZXN0X3N0YXRpY19r
ZXlfaW5pdCk7CmxpYi90ZXN0X3N0cmluZy5jOm1vZHVsZV9pbml0KHN0cmluZ19zZWxmdGVzdF9p
bml0KTsKbGliL3Rlc3RfdWJzYW4uYzptb2R1bGVfaW5pdCh0ZXN0X3Vic2FuX2luaXQpOwpsaWIv
dGVzdF91c2VyX2NvcHkuYzptb2R1bGVfaW5pdCh0ZXN0X3VzZXJfY29weV9pbml0KTsKbGliL3Rl
c3RfdXVpZC5jOm1vZHVsZV9pbml0KHRlc3RfdXVpZF9pbml0KTsKbGliL3Rlc3Rfdm1hbGxvYy5j
Om1vZHVsZV9pbml0KHZtYWxsb2NfdGVzdF9pbml0KQpsaWIvdGVzdF94YXJyYXkuYzptb2R1bGVf
aW5pdCh4YXJyYXlfY2hlY2tzKTsKCgo+IElmIHRoZXkgZG8gZXhpc3RzLCBpdCBzZWVtcyBsaWtl
IGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8KPiBjb252ZXJ0IHRob3NlIHRvIGt1bml0IGFuZCBoYXZl
IEt1bml0IHRlc3RzIHJ1bi1hYmxlIGluIGEgVk0gb3IKPiBiYXJlbWV0YWwgaW5zdGFuY2UuCgpU
aGV5IGFscmVhZHkgcnVuIGluIGEgVk0uCgpUaGV5IGFscmVhZHkgcnVuIG9uIGJhcmUgbWV0YWwu
CgpUaGV5IGFscmVhZHkgcnVuIGluIFVNTC4KClRoaXMgaXMgbm90IHRvIHNheSB0aGF0IEtVbml0
IGRvZXMgbm90IG1ha2Ugc2Vuc2UuICBCdXQgSSdtIHN0aWxsIHRyeWluZwp0byBnZXQgYSBiZXR0
ZXIgZGVzY3JpcHRpb24gb2YgdGhlIEtVbml0IGZlYXR1cmVzIChhbmQgdGhlcmUgYXJlCnNvbWUp
LgoKLUZyYW5rCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
