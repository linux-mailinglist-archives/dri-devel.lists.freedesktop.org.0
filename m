Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A9C199A1
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 10:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4283F89A75;
	Fri, 10 May 2019 08:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160FC89C68
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 05:11:05 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id w22so2394858pgi.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2019 22:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OmO2i50lqlsSgaoTI7x+LU0Rb4IXRz+Mg/lkHAf6xo4=;
 b=Lpatx0rY9ZZHvzkMX5QQK1+2hM2uwTGmjzS8mV/vQ2vpeX5mxgJ9bo5Qa6ZVLR/CK4
 WTptNCIEmzqXrZOXYp5MGzE8lZLrnf43Ps/1DpvVj8qwY646dWNaL3hsDDydp4WdtzXg
 E2Y1XJ60osE47wgD0V+UDUFtee5i7A2f3Xfkw2LZHAyLqW8qVYQFcygXS+APKziY9Bl/
 A9c6n5hmdu6d9texQSnSg7SMu91uVT3E37gB8LSi7pv8yEX35E/DlUqPR9KdP2LEdSUg
 gUNDsLlDzae6+RA0r9Yddj24nGKMQw3NyYvAmxOTG14et8JS/H0CQsqnzKm0tge4Gnfe
 9Wpg==
X-Gm-Message-State: APjAAAXIDi7B8GhAZnqcCNmYDwcuOpae297Wj6/2L4mjcTjssuFrmnxz
 uH0kTttts5VbTovidhlGyV0=
X-Google-Smtp-Source: APXvYqxPmwGpQEcDwqNzCE5QbzmkFOAz6RNpDPlo/AiSRWJuVcPZ5PLYe5dgPDT9VD5VjyQCjG9Hrw==
X-Received: by 2002:aa7:93ba:: with SMTP id x26mr11246068pff.238.1557465065498; 
 Thu, 09 May 2019 22:11:05 -0700 (PDT)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net.
 [24.6.192.50])
 by smtp.gmail.com with ESMTPSA id k9sm5952733pfa.180.2019.05.09.22.11.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 22:11:04 -0700 (PDT)
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
From: Frank Rowand <frowand.list@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>, Greg KH <gregkh@linuxfoundation.org>,
 Brendan Higgins <brendanhiggins@google.com>, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org,
 sboyd@kernel.org, shuah@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-um@lists.infradead.org, Alexander.Levin@microsoft.com,
 Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com,
 dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com,
 joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com,
 knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au,
 pmladek@suse.com, richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
 wfg@linux.intel.com
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com>
 <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
Message-ID: <78e4d46e-6212-9871-51d6-dd2126f39d45@gmail.com>
Date: Thu, 9 May 2019 22:11:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 10 May 2019 08:23:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=OmO2i50lqlsSgaoTI7x+LU0Rb4IXRz+Mg/lkHAf6xo4=;
 b=h6HgSBhdR2q8pjCv5pazDNeWPWcAw6Ib0Ler3cJAxdQ1lH1ZXpe051KYcwiApiirUY
 NsyyscPa9Pb1qYp2NkCmr/yZEKpRoeDVZEqfvtvnktwfJQ8ltTb4MS9CTsMkX86Qfl6R
 wNMMYv103G1RYhl2X50sYZLrTrycqhSAGPUKSzzQl1mTsvFbaolXHksWaGgaRYrhfI5M
 L4lQp7rhFYpWaiSOHm1RnPbJGA0qf76yGUjq/SbXMKhbxFo+Wh9SPCsR3N1CveT2dAsB
 rZgYm5MWhhSu3m/dcDFfb9yq3sF+ceUTxztM4doeijTYv0drvN5XpBIqj67HbbygyZXH
 tPcg==
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

SGkgVGVkLAoKSSdsbCB0cnkgYW5zd2VyaW5nIHRoaXMgYWdhaW4uCgpUaGUgZmlyc3QgdGltZSBJ
IHdhcyBhIGxpdHRsZSBmbGlwcGFudCBpbiBwYXJ0IG9mIG15IGFuc3dlciBiZWNhdXNlIEkKdGhv
dWdodCB5b3VyIGNvbW1lbnRzIHNvbWV3aGF0IGZsaXBwYW50LiAgVGhpcyB0aW1lIEknbGwgcHJv
dmlkZSBhCm1vcmUgY29tcGxldGUgYW5zd2VyLgoKCk9uIDUvOC8xOSA3OjEzIFBNLCBGcmFuayBS
b3dhbmQgd3JvdGU6Cj4gT24gNS84LzE5IDY6NTggUE0sIFRoZW9kb3JlIFRzJ28gd3JvdGU6Cj4+
IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0IDA1OjQzOjM1UE0gLTA3MDAsIEZyYW5rIFJvd2FuZCB3
cm90ZToKCioqKioqICBiZWdpbiBjb250ZXh0IGZyb20gR3JlZyBLSCB0aGF0IHlvdSBzbmlwcGVk
ICAqKioqKgoKT24gNS83LzE5IDE6MDEgQU0sIEdyZWcgS0ggd3JvdGU6Cgo8PCBub3RlIHRoYXQg
SSBoYXZlIHNuaXBwZWQgbXkgb3JpZ2luYWwgcXVlc3Rpb24gYWJvdmUgdGhpcyBwb2ludCA+PgoK
Pgo+IGtzZWxmdGVzdCBwcm92aWRlcyBubyBpbi1rZXJuZWwgZnJhbWV3b3JrIGZvciB0ZXN0aW5n
IGtlcm5lbCBjb2RlCj4gc3BlY2lmaWNhbGx5LiAgVGhhdCBzaG91bGQgYmUgd2hhdCBrdW5pdCBw
cm92aWRlcywgYW4gImVhc3kiIHdheSB0bwo+IHdyaXRlIGluLWtlcm5lbCB0ZXN0cyBmb3IgdGhp
bmdzLgoKKioqKiogIGVuZCAgIGNvbnRleHQgZnJvbSBHcmVnIEtIIHRoYXQgeW91IHNuaXBwZWQg
ICoqKioqCgo+Pj4ga3NlbGZ0ZXN0IHByb3ZpZGVzIGEgbWVjaGFuaXNtIGZvciBpbi1rZXJuZWwg
dGVzdHMgdmlhIG1vZHVsZXMuICBGb3IKPj4+IGV4YW1wbGUsIHNlZToKPj4+Cj4+PiAgIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL3J1bl92bXRlc3RzIGludm9rZXM6Cj4+PiAgICAgdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvdm0vdGVzdF92bWFsbG9jLnNoCj4+PiAgICAgICBsb2FkcyBtb2R1
bGU6Cj4+PiAgICAgICAgIHRlc3Rfdm1hbGxvYwo+Pj4gICAgICAgICAod2hpY2ggaXMgYnVpbHQg
ZnJvbSBsaWIvdGVzdF92bWFsbG9jLmMgaWYgQ09ORklHX1RFU1RfVk1BTExPQykKPj4KPj4gVGhl
IG1ham9yaXR5IG9mIHRoZSBrc2VsZnRlc3RzIGFyZSBpbXBsZW1lbnRlZCBhcyB1c2Vyc3BhY2Ug
cHJvZ3JhbXMuCgpNeSBmbGlwcGFudCBhbnN3ZXI6Cgo+IE5vbi1hcmd1bWVudC4KClRoaXMgdGlt
ZToKCk15IHJlcGx5IHRvIEdyZWcgd2FzIHBvaW50aW5nIG91dCB0aGF0IGluLWtlcm5lbCB0ZXN0
cyBkbyBleGlzdCBpbgprc2VsZnRlc3QuCgpZb3VyIGNvbW1lbnQgdGhhdCB0aGUgbWFqb3JpdHkg
b2Yga3NlbGZ0ZXN0cyBhcmUgaW1wbGVtZW50ZWQgYXMgdXNlcnNwYWNlCnByb2dyYW1zIGhhcyBu
byBiZWFyaW5nIG9uIHdoZXRoZXIga3NlbGZ0ZXN0IHN1cHBvcnQgaW4ta2VybmVsIHRlc3RzLgpJ
dCBkb2VzIG5vdCBjb3VudGVyIHRoZSBmYWN0IHRoZSBrc2VsZnRlc3Qgc3VwcG9ydHMgaW4ta2Vy
bmVsIHRlc3RzLgoKCj4+IFlvdSAqY2FuKiBydW4gaW4ta2VybmVsIHRlc3QgdXNpbmcgbW9kdWxl
czsgYnV0IHRoZXJlIGlzIG5vIGZyYW1ld29yawo+PiBmb3IgdGhlIGluLWtlcm5lbCBjb2RlIGZv
dW5kIGluIHRoZSB0ZXN0IG1vZHVsZXMsIHdoaWNoIG1lYW5zIGVhY2ggb2YKPj4gdGhlIGluLWtl
cm5lbCBjb2RlIGhhcyB0byBjcmVhdGUgdGhlaXIgb3duIGluLWtlcm5lbCB0ZXN0Cj4+IGluZnJh
c3RydWN0dXJlLgoKVGhlIGtzZWxmdGVzdCBpbi1rZXJuZWwgdGVzdHMgZm9sbG93IGEgY29tbW9u
IHBhdHRlcm4uICBBcyBzdWNoLCB0aGVyZQppcyBhIGZyYW1ld29yay4KClRoaXMgbmV4dCB0d28g
cGFyYWdyYXBocyB5b3UgaWdub3JlZCBlbnRpcmVseSBpbiB5b3VyIHJlcGx5OgoKPiBXaHkgY3Jl
YXRlIGFuIGVudGlyZSBuZXcgc3Vic3lzdGVtIChLVW5pdCkgd2hlbiB5b3UgY2FuIGFkZCBhIGhl
YWRlcgo+IGZpbGUgKGFuZCAuYyBjb2RlIGFzIGFwcHJvcHJpYXRlKSB0aGF0IG91dHB1dHMgdGhl
IHByb3BlciBUQVAgZm9ybWF0dGVkCj4gcmVzdWx0cyBmcm9tIGtzZWxmdGVzdCBrZXJuZWwgdGVz
dCBtb2R1bGVzPwo+IAo+IFRoZXJlIGFyZSBhbHJlYWR5IGEgbXVsdGl0dWRlIG9mIGluIGtlcm5l
bCB0ZXN0IG1vZHVsZXMgdXNlZCBieQo+IGtzZWxmdGVzdC4gIEl0IHdvdWxkIGJlIGdvb2QgaWYg
dGhleSBhbGwgdXNlZCBhIGNvbW1vbiBUQVAgY29tcGxpYW50Cj4gbWVjaGFuaXNtIHRvIHJlcG9y
dCByZXN1bHRzLgoKCiAKPj4gVGhhdCdzIG11Y2ggbGlrZSBzYXlpbmcgeW91IGNhbiB1c2Ugdmlj
ZSBncmlwcyB0byB0dXJuIGEgbnV0IG9yCj4+IGJvbHQtaGVhZC4gIFlvdSAqY2FuKiwgYnV0IGl0
IG1pZ2h0IGJlIHRoYXQgdXNpbmcgYSBtb25rZXkgd3JlbmNoCj4+IHdvdWxkIGJlIGEgbXVjaCBi
ZXR0ZXIgdG9vbCB0aGF0IGlzIG11Y2ggZWFzaWVyLgo+Pgo+PiBXaGF0IHdvdWxkIHlvdSBzYXkg
dG8gYSB3b29kIHdvcmtlciBvYmplY3RpbmcgdGhhdCBhIHRvb2xib3ggc2hvdWxkCj4+IGNvbnRh
aW4gYSBtb25rZXkgd3JlbmNoIGJlY2F1c2UgaGUgYWxyZWFkeSBrbm93cyBob3cgdG8gdXNlIHZp
c2UKPj4gZ3JpcHMsIGFuZCBoaXMgdGlueSBicmFpbiBzaG91bGRuJ3QgYmUgZm9yY2VkIHRvIGxl
YXJuIGhvdyB0byB1c2UgYQo+PiB3cmVuY2ggd2hlbiBoZSBrbm93cyBob3cgdG8gdXNlIGEgdmlz
ZSBncmlwLCB3aGljaCBpcyBhIHBlcmZlY3RseSBnb29kCj4+IHRvb2w/Cj4+Cj4+IElmIHlvdSB3
YW50IHRvIHVzZSB2aWNlIGdyaXBzIGFzIGEgaGFtbWVyLCBzY3Jld2RyaXZlciwgbW9ua2V5IHdy
ZW5jaCwKPj4gZXRjLiAgdGhlcmUncyBub3RoaW5nIHN0b3BwaW5nIHlvdSBmcm9tIGRvaW5nIHRo
YXQuICBCdXQgaXQncyBub3QgZmFpcgo+PiB0byBvYmplY3QgdG8gb3RoZXIgcGVvcGxlIHdobyBt
aWdodCB3YW50IHRvIHVzZSBiZXR0ZXIgdG9vbHMuCj4+Cj4+IFRoZSByZWFsaXR5IGlzIHRoYXQg
d2UgaGF2ZSBhIGxvdCBvZiB0ZXN0aW5nIHRvb2xzLiAgSXQncyBub3QganVzdAo+PiBrc2VsZnRl
c3RzLiAgVGhlcmUgaXMgeGZzdGVzdHMgZm9yIGZpbGUgc3lzdGVtIGNvZGUsIGJsa3Rlc3RzIGZv
cgo+PiBibG9jayBsYXllciB0ZXN0cywgZXRjLiAgIFdlIHVzZSB0aGUgcmlnaHQgdG9vbCBmb3Ig
dGhlIHJpZ2h0IGpvYi4KCk15IGZsaXBwYW50IGFuc3dlcjoKCj4gTW9yZSBzcGVjaW91cyBhcmd1
bWVudHMuCgpUaGlzIHRpbWU6CgpJIHRvb2sgeW91ciBhbnN3ZXIgYXMgYSBzdHJhdyBtYW4sIGFu
ZCBoYWQgbm8gZGVzaXJlIHRvIHNwZW5kIHRpbWUKY291bnRlcmluZyBhIHN0cmF3IG1hbi4KCkkg
YW0gbm90IHByb3Bvc2luZyB1c2luZyBhIHZpY2UgZ3JpcHMgKHRvIHVzZSB5b3VyIGFuYWxvZ3kp
LiAgSQphbSBzYXlpbmcgdGhhdCBtYXliZSB0aGUgbW9ua2V5IHdyZW5jaCBhbHJlYWR5IGV4aXN0
cy4KCk15IHBvaW50IG9mIHRoaXMgd2hvbGUgdGhyZWFkIGhhcyBiZWVuIHRvIHRyeSB0byBnZXQg
dGhlIHN1Ym1pdHRlcgp0byBwcm92aWRlIGEgYmV0dGVyLCBtb3JlIGNvbXBsZXRlIGV4cGxhbmF0
aW9uIG9mIGhvdyBhbmQgd2h5IEtVbml0IAppcyBhIGJldHRlciB0b29sLgoKSSBoYXZlIG5vdCB5
ZXQgb2JqZWN0ZWQgdG8gdGhlIG51bWJlciAoYW5kIGRpZmZlcmVuY2VzIGFtb25nKSB0aGUKbWFu
eSBzdWItc3lzdGVtIHRlc3RzLiAgSSBhbSBxdWVzdGlvbmluZyB3aGV0aGVyIHRoZXJlIGlzIGEg
bmVlZApmb3IgYW5vdGhlciBfdGVzdCBmcmFtZXdvcmtfIGZvciBpbi1rZXJuZWwgdGVzdGluZy4g
IElmIHRoZXJlIGlzCnNvbWV0aGluZyBpbXBvcnRhbnQgdGhhdCBLVW5pdCBwcm92aWRlcyB0aGF0
IGRvZXMgbm90IGV4aXN0IGluCmV4aXN0aW5nIGZyYW1ld29ya3MgdGhlbiB0aGUgbmV4dCBxdWVz
dGlvbiB3b3VsZCBiZSB0byBhc2sgaG93CnRvIGltcGxlbWVudCB0aGF0IGltcG9ydGFudCB0aGlu
ZyAoaW1wcm92ZSB0aGUgZXhpc3RpbmcKZnJhbWV3b3JrLCByZXBsYWNlIHRoZSBleGlzdGluZyBm
cmFtZXdvcmssIG9yIGhhdmUgdHdvCmZyYW1ld29ya3MpLiAgSSBzdGlsbCB0aGluayBpdCBpcyBw
cmVtYXR1cmUgdG8gYXNrIHRoaXMKcXVlc3Rpb24gdW50aWwgd2UgZmlyc3Qga25vdyB0aGUgYW5z
d2VyIHRvIHdoYXQgdW5pcXVlIGZlYXR1cmVzCktVbml0IGFkZHMgKGFuZCBhcHBhcmVudGx5IHVu
dGlsIHdlIGtub3cgd2hhdCB0aGUgZXhpc3RpbmcKZnJhbWV3b3JrIHByb3ZpZGVzKS4KCi1GcmFu
awoKPiAKPiAtRnJhbmsKPiAKPj4KPj4gCQkJCQkJLSBUZWQKPj4KPiAKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
