Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9AC18415
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 05:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312A889A4A;
	Thu,  9 May 2019 03:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4299B89A4A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 03:21:24 +0000 (UTC)
Received: from callcc.thunk.org ([66.31.38.53]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x493KHVw012310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 May 2019 23:20:19 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id A3951420024; Wed,  8 May 2019 23:20:17 -0400 (EDT)
Date: Wed, 8 May 2019 23:20:17 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190509032017.GA29703@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
 Frank Rowand <frowand.list@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>,
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
 pmladek@suse.com, richard@nod.at, rientjes@google.com,
 rostedt@goodmis.org, wfg@linux.intel.com
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com>
 <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
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
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, sboyd@kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 mcgrof@kernel.org, keescook@google.com, linux-fsdevel@vger.kernel.org,
 logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDc6MTM6NTlQTSAtMDcwMCwgRnJhbmsgUm93YW5kIHdy
b3RlOgo+ID4gSWYgeW91IHdhbnQgdG8gdXNlIHZpY2UgZ3JpcHMgYXMgYSBoYW1tZXIsIHNjcmV3
ZHJpdmVyLCBtb25rZXkgd3JlbmNoLAo+ID4gZXRjLiAgdGhlcmUncyBub3RoaW5nIHN0b3BwaW5n
IHlvdSBmcm9tIGRvaW5nIHRoYXQuICBCdXQgaXQncyBub3QgZmFpcgo+ID4gdG8gb2JqZWN0IHRv
IG90aGVyIHBlb3BsZSB3aG8gbWlnaHQgd2FudCB0byB1c2UgYmV0dGVyIHRvb2xzLgo+ID4gCj4g
PiBUaGUgcmVhbGl0eSBpcyB0aGF0IHdlIGhhdmUgYSBsb3Qgb2YgdGVzdGluZyB0b29scy4gIEl0
J3Mgbm90IGp1c3QKPiA+IGtzZWxmdGVzdHMuICBUaGVyZSBpcyB4ZnN0ZXN0cyBmb3IgZmlsZSBz
eXN0ZW0gY29kZSwgYmxrdGVzdHMgZm9yCj4gPiBibG9jayBsYXllciB0ZXN0cywgZXRjLiAgIFdl
IHVzZSB0aGUgcmlnaHQgdG9vbCBmb3IgdGhlIHJpZ2h0IGpvYi4KPiAKPiBNb3JlIHNwZWNpb3Vz
IGFyZ3VtZW50cy4KCldlbGwsICpJKiBkb24ndCB0aGluayB0aGV5IGFyZSBzcGVjaW91czsgc28g
SSB0aGluayB3ZSdyZSBnb2luZyB0bwpoYXZlIHRvIGFncmVlIHRvIGRpc2FncmVlLgoKQ2hlZXJz
LAoKCQkJCQkJLSBUZWQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
