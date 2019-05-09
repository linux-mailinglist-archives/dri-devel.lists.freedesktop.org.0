Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2612E194CE
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 23:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221A389C61;
	Thu,  9 May 2019 21:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5212689C61
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 21:43:53 +0000 (UTC)
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com
 [104.133.0.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x49LgY32008689
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 May 2019 17:42:35 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id B6256420024; Thu,  9 May 2019 17:42:33 -0400 (EDT)
Date: Thu, 9 May 2019 17:42:33 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190509214233.GA20877@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
 Frank Rowand <frowand.list@gmail.com>, Tim.Bird@sony.com,
 knut.omang@oracle.com, gregkh@linuxfoundation.org,
 brendanhiggins@google.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org,
 sboyd@kernel.org, shuah@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-um@lists.infradead.org, Alexander.Levin@microsoft.com,
 amir73il@gmail.com, dan.carpenter@oracle.com,
 dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com,
 joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com,
 logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com,
 richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
 wfg@linux.intel.com
References: <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com>
 <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 brendanhiggins@google.com, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, sboyd@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 keescook@google.com, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMTE6MTI6MTJBTSAtMDcwMCwgRnJhbmsgUm93YW5kIHdy
b3RlOgo+IAo+ICAgICJNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIGludGVudCBvZiBLVW5p
dCBpcyB0byBhdm9pZCBib290aW5nIGEga2VybmVsIG9uCj4gICAgcmVhbCBoYXJkd2FyZSBvciBp
biBhIHZpcnR1YWwgbWFjaGluZS4gIFRoYXQgc2VlbXMgdG8gYmUgYSBtYXR0ZXIgb2Ygc2VtYW50
aWNzCj4gICAgdG8gbWUgYmVjYXVzZSBpc24ndCBpbnZva2luZyBhIFVNTCBMaW51eCBqdXN0IHJ1
bm5pbmcgdGhlIExpbnV4IGtlcm5lbCBpbgo+ICAgIGEgZGlmZmVyZW50IGZvcm0gb2YgdmlydHVh
bGl6YXRpb24/Cj4gCj4gICAgU28gSSBkbyBub3QgdW5kZXJzdGFuZCB3aHkgS1VuaXQgaXMgYW4g
aW1wcm92ZW1lbnQgb3ZlciBrc2VsZnRlc3QuCj4gCj4gICAgLi4uCj4gCj4gICAgV2hhdCBhbSBJ
IG1pc3Npbmc/IgoKT25lIG1ham9yIGRpZmZlcmVuY2U6IGtzZWxmdGVzdCByZXF1aXJlcyBhIHVz
ZXJzcGFjZSBlbnZpcm9ubWVudDsgaXQKc3RhcnRzIHN5c3RlbWQsIHJlcXVpcmVzIGEgcm9vdCBm
aWxlIHN5c3RlbSBmcm9tIHdoaWNoIHlvdSBjYW4gbG9hZAptb2R1bGVzLCBldGMuICBLdW5pdCBk
b2Vzbid0IHJlcXVpcmUgYSByb290IGZpbGUgc3lzdGVtOyBkb2Vzbid0CnJlcXVpcmUgdGhhdCB5
b3Ugc3RhcnQgc3lzdGVtZDsgZG9lc24ndCBhbGxvdyB5b3UgdG8gcnVuIGFyYml0cmFyeQpwZXJs
LCBweXRob24sIGJhc2gsIGV0Yy4gc2NyaXB0cy4gIEFzIHN1Y2gsIGl0J3MgbXVjaCBsaWdodGVy
IHdlaWdodAp0aGFuIGtzZWxmdGVzdCwgYW5kIHdpbGwgaGF2ZSBtdWNoIGxlc3Mgb3ZlcmhlYWQg
YmVmb3JlIHlvdSBjYW4gc3RhcnQKcnVubmluZyB0ZXN0cy4gIFNvIGl0J3Mgbm90IHJlYWxseSB0
aGUgc2FtZSBraW5kIG9mIHZpcnR1YWxpemF0aW9uLgoKRG9lcyB0aGlzIGhlbHA/CgoJCQkJCS0g
VGVkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
