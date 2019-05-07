Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBFA15E1C
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6687989DEA;
	Tue,  7 May 2019 07:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8959D89C93
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 03:14:16 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y13so7835934pfm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 20:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XPy6o0NjYz38vWpV6pc1h2A6N4smSYs4Cq49Ux9zwV8=;
 b=WFemnrRLmWThAd0/TPf9HnaCPmhwifK7dTqtSX6xns990B3DVYUxbCo229yOfBmCYJ
 ATHkgeUZrZvO641jjPakBql5P79vM9uRKjnvhVcy3104Hm2pkkJbtQuc7VofOyFC8q7X
 W1ehq9a/R1O4vVz1iDgMo0eFPRFq0YdDIOEbNks0nG4loUcUzh/EHnwR7umZYRAhfdbW
 NDnWym5PVoESRAzySxUu0MlwSvuiOk5jOo/LfEsezNyhmCwuA+RQMuxVwPvL3G+dzGDS
 ZZy1eVVmyQpcFjlj9bE4e91TuVnvX3Rk7xvLsHDegStrgcwieZjgU0xbXW3h6qu8Iu7g
 BrNw==
X-Gm-Message-State: APjAAAXZYwHvZo7c7cpqr1ZCTOtyEWkfCHB0P98tNpN2jHYCaCcsg5Mq
 rEyBfhHzla8an75vVxvmsCs=
X-Google-Smtp-Source: APXvYqwISNSy9xefPMYRgOslBbKIROeiQ4y33+rxQnv0dnHw2MR5wA3FiL1meR7p3JPjBqzEw/Pz1Q==
X-Received: by 2002:a65:4802:: with SMTP id h2mr34368073pgs.98.1557198856091; 
 Mon, 06 May 2019 20:14:16 -0700 (PDT)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net.
 [24.6.192.50])
 by smtp.gmail.com with ESMTPSA id m11sm17053726pgd.12.2019.05.06.20.14.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 20:14:15 -0700 (PDT)
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Brendan Higgins <brendanhiggins@google.com>, gregkh@linuxfoundation.org,
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
 robh@kernel.org, sboyd@kernel.org, shuah@kernel.org
References: <20190501230126.229218-1-brendanhiggins@google.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
Date: Mon, 6 May 2019 20:14:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XPy6o0NjYz38vWpV6pc1h2A6N4smSYs4Cq49Ux9zwV8=;
 b=uTQNGYZ1XWIvXYHBEeJQovmqhK2Jtpq+d64Qro6G5OKceot5sQNTlLbfduNr0K3PGx
 CsKeB5E/nKLx2mO5rHvB5C3cSTlrSg27HAg1bLnsc6sS6Ob71hOBqLsY7CZ9Kc78pahW
 2bjV9Jxur71IdhgsqsXU4h/nzLhauMpdelIF+i15235Qca74Y0OgvP33q3BLK9LqDfFd
 Xr/fhjikEY63MLGvaPSmYU14OjokXybBFpWj/AGZsAXkXpEZkB0f6qswg2ygyAISGWpA
 7eDh4rZZ2yShjUppASxA0qxx7J3s6zLlj/zKwFDiXJf9dX+MaLJqGhuEngD27vSXcDZx
 mNcg==
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com, wfg@linux.intel.com,
 joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8xLzE5IDQ6MDEgUE0sIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiAjIyBUTERSCj4gCj4g
SSByZWJhc2VkIHRoZSBsYXN0IHBhdGNoc2V0IG9uIDUuMS1yYzcgaW4gaG9wZXMgdGhhdCB3ZSBj
YW4gZ2V0IHRoaXMgaW4KPiA1LjIuCj4gCj4gU2h1YWgsIEkgdGhpbmsgeW91LCBHcmVnIEtILCBh
bmQgbXlzZWxmIHRhbGtlZCBvZmYgdGhyZWFkLCBhbmQgd2UgYWdyZWVkCj4gd2Ugd291bGQgbWVy
Z2UgdGhyb3VnaCB5b3VyIHRyZWUgd2hlbiB0aGUgdGltZSBjYW1lPyBBbSBJIHJlbWVtYmVyaW5n
Cj4gY29ycmVjdGx5Pwo+IAo+ICMjIEJhY2tncm91bmQKPiAKPiBUaGlzIHBhdGNoIHNldCBwcm9w
b3NlcyBLVW5pdCwgYSBsaWdodHdlaWdodCB1bml0IHRlc3RpbmcgYW5kIG1vY2tpbmcKPiBmcmFt
ZXdvcmsgZm9yIHRoZSBMaW51eCBrZXJuZWwuCj4gCj4gVW5saWtlIEF1dG90ZXN0IGFuZCBrc2Vs
ZnRlc3QsIEtVbml0IGlzIGEgdHJ1ZSB1bml0IHRlc3RpbmcgZnJhbWV3b3JrOwo+IGl0IGRvZXMg
bm90IHJlcXVpcmUgaW5zdGFsbGluZyB0aGUga2VybmVsIG9uIGEgdGVzdCBtYWNoaW5lIG9yIGlu
IGEgVk0KPiBhbmQgZG9lcyBub3QgcmVxdWlyZSB0ZXN0cyB0byBiZSB3cml0dGVuIGluIHVzZXJz
cGFjZSBydW5uaW5nIG9uIGEgaG9zdAo+IGtlcm5lbC4gQWRkaXRpb25hbGx5LCBLVW5pdCBpcyBm
YXN0OiBGcm9tIGludm9jYXRpb24gdG8gY29tcGxldGlvbiBLVW5pdAo+IGNhbiBydW4gc2V2ZXJh
bCBkb3plbiB0ZXN0cyBpbiB1bmRlciBhIHNlY29uZC4gQ3VycmVudGx5LCB0aGUgZW50aXJlCj4g
S1VuaXQgdGVzdCBzdWl0ZSBmb3IgS1VuaXQgcnVucyBpbiB1bmRlciBhIHNlY29uZCBmcm9tIHRo
ZSBpbml0aWFsCj4gaW52b2NhdGlvbiAoYnVpbGQgdGltZSBleGNsdWRlZCkuCj4gCj4gS1VuaXQg
aXMgaGVhdmlseSBpbnNwaXJlZCBieSBKVW5pdCwgUHl0aG9uJ3MgdW5pdHRlc3QubW9jaywgYW5k
Cj4gR29vZ2xldGVzdC9Hb29nbGVtb2NrIGZvciBDKysuIEtVbml0IHByb3ZpZGVzIGZhY2lsaXRp
ZXMgZm9yIGRlZmluaW5nCj4gdW5pdCB0ZXN0IGNhc2VzLCBncm91cGluZyByZWxhdGVkIHRlc3Qg
Y2FzZXMgaW50byB0ZXN0IHN1aXRlcywgcHJvdmlkaW5nCj4gY29tbW9uIGluZnJhc3RydWN0dXJl
IGZvciBydW5uaW5nIHRlc3RzLCBtb2NraW5nLCBzcHlpbmcsIGFuZCBtdWNoIG1vcmUuCgpBcyBh
IHJlc3VsdCBvZiB0aGUgZW1haWxzIHJlcGx5aW5nIHRvIHRoaXMgcGF0Y2ggdGhyZWFkLCBJIGFt
IG5vdwpzdGFydGluZyB0byBsb29rIGF0IGtzZWxmdGVzdC4gIE15IGxldmVsIG9mIHVuZGVyc3Rh
bmRpbmcgaXMgYmFzZWQKb24gc29tZSBzbGlkZSBwcmVzZW50YXRpb25zLCBhbiBMV04gYXJ0aWNs
ZSwgaHR0cHM6Ly9rc2VsZnRlc3Qud2lraS5rZXJuZWwub3JnLwphbmQgYSBfdGlueV8gYml0IG9m
IGxvb2tpbmcgYXQga3NlbGZ0ZXN0IGNvZGUuCgp0bDtkcjsgSSBkb24ndCByZWFsbHkgdW5kZXJz
dGFuZCBrc2VsZnRlc3QgeWV0LgoKCigxKSB3aHkgS1VuaXQgZXhpc3RzCgo+ICMjIFdoYXQncyBz
byBzcGVjaWFsIGFib3V0IHVuaXQgdGVzdGluZz8KPiAKPiBBIHVuaXQgdGVzdCBpcyBzdXBwb3Nl
ZCB0byB0ZXN0IGEgc2luZ2xlIHVuaXQgb2YgY29kZSBpbiBpc29sYXRpb24sCj4gaGVuY2UgdGhl
IG5hbWUuIFRoZXJlIHNob3VsZCBiZSBubyBkZXBlbmRlbmNpZXMgb3V0c2lkZSB0aGUgY29udHJv
bCBvZgo+IHRoZSB0ZXN0OyB0aGlzIG1lYW5zIG5vIGV4dGVybmFsIGRlcGVuZGVuY2llcywgd2hp
Y2ggbWFrZXMgdGVzdHMgb3JkZXJzCj4gb2YgbWFnbml0dWRlcyBmYXN0ZXIuIExpa2V3aXNlLCBz
aW5jZSB0aGVyZSBhcmUgbm8gZXh0ZXJuYWwgZGVwZW5kZW5jaWVzLAo+IHRoZXJlIGFyZSBubyBo
b29wcyB0byBqdW1wIHRocm91Z2ggdG8gcnVuIHRoZSB0ZXN0cy4gQWRkaXRpb25hbGx5LCB0aGlz
Cj4gbWFrZXMgdW5pdCB0ZXN0cyBkZXRlcm1pbmlzdGljOiBhIGZhaWxpbmcgdW5pdCB0ZXN0IGFs
d2F5cyBpbmRpY2F0ZXMgYQo+IHByb2JsZW0uIEZpbmFsbHksIGJlY2F1c2UgdW5pdCB0ZXN0cyBu
ZWNlc3NhcmlseSBoYXZlIGZpbmVyIGdyYW51bGFyaXR5LAo+IHRoZXkgYXJlIGFibGUgdG8gdGVz
dCBhbGwgY29kZSBwYXRocyBlYXNpbHkgc29sdmluZyB0aGUgY2xhc3NpYyBwcm9ibGVtCj4gb2Yg
ZGlmZmljdWx0eSBpbiBleGVyY2lzaW5nIGVycm9yIGhhbmRsaW5nIGNvZGUuCgooMikgS1VuaXQg
aXMgbm90IG1lYW50IHRvIHJlcGxhY2Uga3NlbGZ0ZXN0Cgo+ICMjIElzIEtVbml0IHRyeWluZyB0
byByZXBsYWNlIG90aGVyIHRlc3RpbmcgZnJhbWV3b3JrcyBmb3IgdGhlIGtlcm5lbD8KPiAKPiBO
by4gTW9zdCBleGlzdGluZyB0ZXN0cyBmb3IgdGhlIExpbnV4IGtlcm5lbCBhcmUgZW5kLXRvLWVu
ZCB0ZXN0cywgd2hpY2gKPiBoYXZlIHRoZWlyIHBsYWNlLiBBIHdlbGwgdGVzdGVkIHN5c3RlbSBo
YXMgbG90cyBvZiB1bml0IHRlc3RzLCBhCj4gcmVhc29uYWJsZSBudW1iZXIgb2YgaW50ZWdyYXRp
b24gdGVzdHMsIGFuZCBzb21lIGVuZC10by1lbmQgdGVzdHMuIEtVbml0Cj4gaXMganVzdCB0cnlp
bmcgdG8gYWRkcmVzcyB0aGUgdW5pdCB0ZXN0IHNwYWNlIHdoaWNoIGlzIGN1cnJlbnRseSBub3QK
PiBiZWluZyBhZGRyZXNzZWQuCgpNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIGludGVudCBv
ZiBLVW5pdCBpcyB0byBhdm9pZCBib290aW5nIGEga2VybmVsIG9uCnJlYWwgaGFyZHdhcmUgb3Ig
aW4gYSB2aXJ0dWFsIG1hY2hpbmUuICBUaGF0IHNlZW1zIHRvIGJlIGEgbWF0dGVyIG9mIHNlbWFu
dGljcwp0byBtZSBiZWNhdXNlIGlzbid0IGludm9raW5nIGEgVU1MIExpbnV4IGp1c3QgcnVubmlu
ZyB0aGUgTGludXgga2VybmVsIGluCmEgZGlmZmVyZW50IGZvcm0gb2YgdmlydHVhbGl6YXRpb24/
CgpTbyBJIGRvIG5vdCB1bmRlcnN0YW5kIHdoeSBLVW5pdCBpcyBhbiBpbXByb3ZlbWVudCBvdmVy
IGtzZWxmdGVzdC4KCkl0IHNlZW1zIHRvIG1lIHRoYXQgS1VuaXQgaXMganVzdCBhbm90aGVyIHBp
ZWNlIG9mIGluZnJhc3RydWN0dXJlIHRoYXQgSQphbSBnb2luZyB0byBoYXZlIHRvIGJlIGZhbWls
aWFyIHdpdGggYXMgYSBrZXJuZWwgZGV2ZWxvcGVyLiAgTW9yZSBvdmVyaGVhZCwKbW9yZSBpbmZv
cm1hdGlvbiB0byBzdHVmZiBpbnRvIG15IHRpbnkgbGl0dGxlIGJyYWluLgoKSSB3b3VsZCBndWVz
cyB0aGF0IHNvbWUgZGV2ZWxvcGVycyB3aWxsIGZvY3VzIG9uIGp1c3Qgb25lIG9mIHRoZSB0d28g
dGVzdAplbnZpcm9ubWVudHMgKGFuZCBzb21lIHdpbGwgZm9jdXMgb24gYm90aCksIHNwbGl0dGlu
ZyB0aGUgZGV2ZWxvcG1lbnQKcmVzb3VyY2VzIGluc3RlYWQgb2YgcG9vbGluZyB0aGVtIG9uIGEg
Y29tbW9uIGluZnJhc3RydWN0dXJlLgoKV2hhdCBhbSBJIG1pc3Npbmc/CgotRnJhbmsKCgo+IAo+
ICMjIE1vcmUgaW5mb3JtYXRpb24gb24gS1VuaXQKPiAKPiBUaGVyZSBpcyBhIGJ1bmNoIG9mIGRv
Y3VtZW50YXRpb24gbmVhciB0aGUgZW5kIG9mIHRoaXMgcGF0Y2ggc2V0IHRoYXQKPiBkZXNjcmli
ZXMgaG93IHRvIHVzZSBLVW5pdCBhbmQgYmVzdCBwcmFjdGljZXMgZm9yIHdyaXRpbmcgdW5pdCB0
ZXN0cy4KPiBGb3IgY29udmVuaWVuY2UgSSBhbSBob3N0aW5nIHRoZSBjb21waWxlZCBkb2NzIGhl
cmU6Cj4gaHR0cHM6Ly9nb29nbGUuZ2l0aHViLmlvL2t1bml0LWRvY3MvdGhpcmRfcGFydHkva2Vy
bmVsL2RvY3MvCj4gQWRkaXRpb25hbGx5IGZvciBjb252ZW5pZW5jZSwgSSBoYXZlIGFwcGxpZWQg
dGhlc2UgcGF0Y2hlcyB0byBhIGJyYW5jaDoKPiBodHRwczovL2t1bml0Lmdvb2dsZXNvdXJjZS5j
b20vbGludXgvKy9rdW5pdC9yZmMvdjUuMS1yYzcvdjEKPiBUaGUgcmVwbyBtYXkgYmUgY2xvbmVk
IHdpdGg6Cj4gZ2l0IGNsb25lIGh0dHBzOi8va3VuaXQuZ29vZ2xlc291cmNlLmNvbS9saW51eAo+
IFRoaXMgcGF0Y2hzZXQgaXMgb24gdGhlIGt1bml0L3JmYy92NS4xLXJjNy92MSBicmFuY2guCj4g
Cj4gIyMgQ2hhbmdlcyBTaW5jZSBMYXN0IFZlcnNpb24KPiAKPiBOb25lLiBJIGp1c3QgcmViYXNl
ZCB0aGUgbGFzdCBwYXRjaHNldCBvbiB2NS4xLXJjNy4KPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
