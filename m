Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4901C2BA
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 08:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D428926B;
	Tue, 14 May 2019 06:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95458926B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 06:04:40 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id u17so8510686pfn.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 23:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wphR9fs1TaZsZNH4NQjQ2k5wiALr/JJ7E+MkCJWg1G8=;
 b=CW2lrMvqFNhKvJ1TxLxY6jJjyZ4VB2roy+dhBzSBEsYFfdakwALb8BrmRhAKx+ETSG
 3YouwDSCKYohT8alw2/6E2RvmvZVWa/KPrn1b3L3UJ7Zm7hAIcgkQ9Ey/ZDgT54THhoq
 /CrH3F0B80Vx++LmSbN9UVTvFHRiKfKnF1G0R7RzlNEgB0bWQCivd/CaHkMrNEpiPmDb
 HL9lhXT+j05Dgxcyb6hc2JOWJ2B6Vajn+rLGfLWjZY6eYLNsECVl143gfO6RIPsbEQd7
 OA7bo/FBZ+U06FdkrncmWwI0X5+kZffY5TRB48yzbM8abgvVcaeTCFxZToz1Bwm8B5EA
 vZsw==
X-Gm-Message-State: APjAAAUtp/PHXlykq2k9idp7l1Jwfq1UHJht6F6brVM63HXWFv6g/Vmi
 qo/Jw5KXtDJ2ZNW4ZVwX57P2bQ==
X-Google-Smtp-Source: APXvYqzgwWIVKsYY211IYVBjZXLCdV1/hwybUBgofPR0QuIs5iXekLntSbypfxIlEzH7138sP0qZvw==
X-Received: by 2002:aa7:8008:: with SMTP id j8mr38436137pfi.120.1557813879741; 
 Mon, 13 May 2019 23:04:39 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:2:d714:29b4:a56b:b23b])
 by smtp.gmail.com with ESMTPSA id k10sm16067228pgo.82.2019.05.13.23.04.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 13 May 2019 23:04:38 -0700 (PDT)
Date: Mon, 13 May 2019 23:04:33 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: Theodore Ts'o <tytso@mit.edu>, Frank Rowand <frowand.list@gmail.com>,
 Tim.Bird@sony.com, knut.omang@oracle.com,
 gregkh@linuxfoundation.org, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org,
 sboyd@kernel.org, shuah@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-um@lists.infradead.org, Alexander.Levin@microsoft.com,
 amir73il@gmail.com, dan.carpenter@oracle.com,
 dan.j.williams@intel.com, jdike@addtoit.com, joel@jms.id.au,
 julia.lawall@lip6.fr, khilman@baylibre.com, logang@deltatee.com,
 mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at,
 rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190514060433.GA181462@google.com>
References: <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <80c72e64-2665-bd51-f78c-97f50f9a53ba@gmail.com>
 <20190511173344.GA8507@mit.edu>
 <20190513144451.GQ17751@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513144451.GQ17751@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wphR9fs1TaZsZNH4NQjQ2k5wiALr/JJ7E+MkCJWg1G8=;
 b=dXeMBsJluQkuZhtQlsIs60i39Eowu4Bt+MfjENGGmqpwBGoiYmgZ+5w8Qv26k9QKXI
 1cnJzcNtxLLINZMIPeb4dfPgJ9g1ycOJEIg8i4YfGPpKugYG/E5lbz6d5J5x9AuwEioW
 4w2gtbfJr7C59YLC9izuQhoVm6zDXWPFcTTTt0JfnLD/xaylHZ0XCbk5pClrxdins17i
 5S5K0uYGrPEnttnkWkkw5N35wkZ3iKovTWWT7UaNVg+Cgtqi0115K/LElBXGDu9PpvZF
 H60HHv+fa3B8a/nV2ZgfeVrjAVx8la+EU59rYesO3d6/OVXgbE5DewFQtzpmhhvoUR6U
 YnrA==
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

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6NDQ6NTFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBTYXQsIE1heSAxMSwgMjAxOSBhdCAwMTozMzo0NFBNIC0wNDAwLCBUaGVvZG9y
ZSBUcydvIHdyb3RlOgo+ID4gT24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDI6MTI6NDBQTSAtMDcw
MCwgRnJhbmsgUm93YW5kIHdyb3RlOgo+ID4gPiBIb3dldmVyLCB0aGUgcmVwbHkgaXMgaW5jb3Jy
ZWN0LiAgS3NlbGZ0ZXN0IGluLWtlcm5lbCB0ZXN0cyAod2hpY2gKPiA+ID4gaXMgdGhlIGNvbnRl
eHQgaGVyZSkgY2FuIGJlIGNvbmZpZ3VyZWQgYXMgYnVpbHQgaW4gaW5zdGVhZCBvZiBhcwo+ID4g
PiBhIG1vZHVsZSwgYW5kIGJ1aWx0IGluIGEgVU1MIGtlcm5lbC4gIFRoZSBVTUwga2VybmVsIGNh
biBib290LAo+ID4gPiBydW5uaW5nIHRoZSBpbi1rZXJuZWwgdGVzdHMgYmVmb3JlIFVNTCBhdHRl
bXB0cyB0byBpbnZva2UgdGhlCj4gPiA+IGluaXQgcHJvY2Vzcy4KPiA+IAo+ID4gVW0sIENpdGF0
aW9uIG5lZWRlZD8KPiA+IAo+ID4gSSBkb24ndCBzZWUgYW55IGV2aWRlbmNlIGZvciB0aGlzIGlu
IHRoZSBrc2VsZnRlc3QgZG9jdW1lbnRhdGlvbiwgbm9yCj4gPiBkbyBJIHNlZSBhbnkgZXZpZGVu
Y2Ugb2YgdGhpcyBpbiB0aGUga3NlbGZ0ZXN0IE1ha2VmaWxlcy4KPiA+IAo+ID4gVGhlcmUgZXhp
c3RzIHRlc3QgbW9kdWxlcyBpbiB0aGUga2VybmVsIHRoYXQgcnVuIGJlZm9yZSB0aGUgaW5pdAo+
ID4gc2NyaXB0cyBydW4gLS0tIGJ1dCB0aGF0J3Mgbm90IHN0cmljdGx5IHNwZWFraW5nIHBhcnQg
b2Yga3NlbGZ0ZXN0cywKPiA+IGFuZCBkbyBub3QgaGF2ZSBhbnkga2luZCBvZiBpbmZyYXN0cnVj
dHVyZS4gIEFzIG5vdGVkLCB0aGUKPiA+IGtzZWxmdGVzdHNfaGFybmVzcyBoZWFkZXIgZmlsZSBm
dW5kYW1lbnRhbGx5IGFzc3VtZXMgdGhhdCB5b3UgYXJlCj4gPiBydW5uaW5nIHRlc3QgY29kZSBp
biB1c2Vyc3BhY2UuCj4gCj4gWWVhaCBJIHJlYWxseSBsaWtlIHRoZSAibm8gdXNlcnNwYWNlIHJl
cXVpcmVkIGF0IGFsbCIgZGVzaWduIG9mIGt1bml0LAo+IHdoaWxlIHN0aWxsIGNvbGxlY3Rpbmcg
cmVzdWx0cyBpbiBhIHdlbGwtZGVmaW5lZCB3YXkgKHVubGVzcyB0aGUgY3VycmVudAo+IHNlbGYt
dGVzdCB0aGF0IGp1c3QgcnVuIHdoZW4geW91IGxvYWQgdGhlIG1vZHVsZSwgd2l0aCBtYXliZSBz
b21lCj4ga3NlbGZ0ZXN0IGFkLWhvYyB3cmFwcGVyIGFyb3VuZCB0byBjb2xsZWN0IHRoZSByZXN1
bHRzKS4KPiAKPiBXaGF0IEkgd2FudCB0byBkbyBsb25nLXRlcm0gaXMgdG8gcnVuIHRoZXNlIGtl
cm5lbCB1bml0IHRlc3RzIGFzIHBhcnQgb2YKPiB0aGUgYnVpbGQtdGVzdGluZywgbW9zdCBsaWtl
bHkgaW4gZ2l0bGFiIChzb29uZXIgb3IgbGF0ZXIsIGZvciBkcm0uZ2l0CgpUb3RhbGx5ISBUaGlz
IGlzIHBhcnQgb2YgdGhlIHJlYXNvbiBJIGhhdmUgYmVlbiBpbnNpc3Rpbmcgb24gYSBtaW5pbXVt
Cm9mIFVNTCBjb21wYXRpYmlsaXR5IGZvciBhbGwgdW5pdCB0ZXN0cy4gSWYgeW91IGNhbiBzdWZm
aWVudGx5IGNvbnN0cmFpbgp0aGUgZW52aXJvbm1lbnQgdGhhdCBpcyByZXF1aXJlZCBmb3IgdGVz
dHMgdG8gcnVuIGluLCBpdCBtYWtlcyBpdCBtdWNoCmVhc2llciBub3Qgb25seSBmb3IgYSBodW1h
biB0byBydW4geW91ciB0ZXN0cywgYnV0IGl0IGFsc28gbWFrZXMgaXQgYQpsb3QgZWFzaWVyIGZv
ciBhbiBhdXRvbWF0ZWQgc2VydmljZSB0byBiZSBhYmxlIHRvIHJ1biB5b3VyIHRlc3RzLgoKSSBh
Y3R1YWxseSBoYXZlIGEgcHJvdG90eXBlIHByZXN1Ym1pdCBhbHJlYWR5IHdvcmtpbmcgb24gbXkK
InN0YWJsZS9ub24tdXBzdHJlYW0iIGJyYW5jaC4gWW91IGNhbiBjaGVja291dCB3aGF0IHByZXN1
Ym1pdCByZXN1bHRzCmxvb2sgbGlrZSBoZXJlWzFdWzJdLgoKPiBvbmx5IG9mYykuIFNvIHRoYXQg
cGVvcGxlIGdldCB0aGVpciBwdWxsIHJlcXVlc3RzIChhbmQgcGF0Y2ggc2VyaWVzLCB3ZQo+IGhh
dmUgc29tZSBpZGVhcyB0byB0aWUgdGhpcyBpbnRvIHBhdGNod29yaykgYXV0b21hdGljYWxseSB0
ZXN0ZWQgZm9yIHRoaXMKCk1pZ2h0IHRoYXQgYmUgU25vd3BhdGNoWzNdPyBJIHRhbGtlZCB0byBS
dXNzZWxsLCB0aGUgY3JlYXRvciBvZiBTbm93cGF0Y2gsCmFuZCBoZSBzZWVtZWQgcHJldHR5IG9w
ZW4gdG8gY29sbGFib3JhdGlvbi4KCkJlZm9yZSBJIGhlYXJkIGFib3V0IFNub3dwYXRjaCwgSSBo
YWQgYW4gaW50ZXJuIHdyaXRlIGEgdHJhbnNsYXRpb24KbGF5ZXIgdGhhdCBtYWRlIFByb3cgKHRo
ZSBwcmVzdWJtaXQgc2VydmljZSB0aGF0IEkgdXNlZCBpbiB0aGUgcHJvdG90eXBlCmFib3ZlKSB3
b3JrIHdpdGggTEtNTFs0XS4KCkkgYW0gbm90IG1hcnJpZWQgdG8gZWl0aGVyIGFwcHJvYWNoLCBi
dXQgSSB0aGluayBiZXR3ZWVuIHRoZSB0d28gb2YKdGhlbSwgbW9zdCBvZiB0aGUgaW5pdGlhbCBs
ZWd3b3JrIGhhcyBiZWVuIGRvbmUgdG8gbWFrZSBwcmVzdWJtaXQgb24KTEtNTCBhIHJlYWxpdHku
Cgo+IHN1cGVyIGJhc2ljIHN0dWZmLgoKSSBhbSByZWFsbHkgZXhjaXRlZCB0byBoZWFyIGJhY2sg
b24gd2hhdCB5b3UgdGhpbmshCgpDaGVlcnMhCgpbMV0gaHR0cHM6Ly9rdW5pdC1yZXZpZXcuZ29v
Z2xlc291cmNlLmNvbS9jL2xpbnV4LysvMTUwOS8xMCNtZXNzYWdlLTdiZmE0MGVmYjEzMmUxNWM4
Mzg4NzU1YzI3MzgzNzU1OTkxMTQyNWMKWzJdIGh0dHBzOi8va3VuaXQtcmV2aWV3Lmdvb2dsZXNv
dXJjZS5jb20vYy9saW51eC8rLzE1MDkvMTAjbWVzc2FnZS1hNjc4NDQ5NmVhZmZmNDQyYWM5OGZi
MDY4YmYxYTBmMzZlZTczNTA5ClszXSBodHRwczovL2RldmVsb3Blci5pYm0uY29tL29wZW4vcHJv
amVjdHMvc25vd3BhdGNoLwpbNF0gaHR0cHM6Ly9rdW5pdC5nb29nbGVzb3VyY2UuY29tL3Byb3ct
bGttbC8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
