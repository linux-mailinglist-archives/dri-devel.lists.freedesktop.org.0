Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB6E1B8E5
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 16:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE5489E8C;
	Mon, 13 May 2019 14:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029DE89E8C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:44:58 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id l25so17936390eda.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 07:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=oa11tgFM6isQYlc2/lSr8+dtL7dz0FGS2ImXszdei94=;
 b=IhfxfF9SIZUC4l9vPDUYcDkaAWgndZ//UO/VVmj6nXuIyFDD25kRwaIz/X+bznN6DH
 tKKglTOFYMy++8/u1S3TV1lbuUf21xakFCAPVQiawf6U4sTItGwDY4FVg3/aLZd7heO8
 +ILwk5D1Uvi40FKk/0DZnNUQSFhrww0UJ0vr2YTVCtug+8473YhiVHce7Xv4yKKkznex
 GMuy82JpxIsBlV0RhJHloRhsmcZ7L1hw2To8a4EMc4ODlU9ihPuK4UbouTHIkSeuZbjC
 NM6jnmxvjVcl/QxH38JvfxYGbuOgzw65Pk+8eyziPOVxkwjLdl2bUEQ7stttSVE0J5/F
 BGcQ==
X-Gm-Message-State: APjAAAW46AGvX6JniTWDPtR1hZrFX+WLvWZbMR135/uOjxL9KpaF2of9
 IywmNZA6ll8RqAjPOCGqJccmfQ==
X-Google-Smtp-Source: APXvYqzazE/ARkr3DfLFYQv2UcXLE6AXccxEO07VmSzGlXapLczjo2jaDfA5V6TtDA06sVwBcw/rGw==
X-Received: by 2002:a17:906:18b1:: with SMTP id
 c17mr22862891ejf.196.1557758696660; 
 Mon, 13 May 2019 07:44:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id ox15sm1844293ejb.52.2019.05.13.07.44.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 07:44:55 -0700 (PDT)
Date: Mon, 13 May 2019 16:44:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Theodore Ts'o <tytso@mit.edu>, Frank Rowand <frowand.list@gmail.com>,
 Tim.Bird@sony.com, knut.omang@oracle.com,
 gregkh@linuxfoundation.org, brendanhiggins@google.com,
 keescook@google.com, kieran.bingham@ideasonboard.com,
 mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org,
 shuah@kernel.org, devicetree@vger.kernel.org,
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
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190513144451.GQ17751@phenom.ffwll.local>
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
 dan.j.williams@intel.com, jdike@addtoit.com, joel@jms.id.au,
 julia.lawall@lip6.fr, khilman@baylibre.com, logang@deltatee.com,
 mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at,
 rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com
References: <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <80c72e64-2665-bd51-f78c-97f50f9a53ba@gmail.com>
 <20190511173344.GA8507@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190511173344.GA8507@mit.edu>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oa11tgFM6isQYlc2/lSr8+dtL7dz0FGS2ImXszdei94=;
 b=lkK1jfdXRSWG4EOPXpNEsgoMZb8lUzm2FfYavTsrFBTY7w3Z4FVJ9cp/fBcnbUD9bK
 Frxw45KRQigXleUJaVccMl3gMpsrT0DKhj92T3OICo7PFH1ZWYiDKuhrJn4Bo6DXp0gB
 BN+9OOpk6LCzBYskBvabimkY7bAvWM5tFDS84=
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

T24gU2F0LCBNYXkgMTEsIDIwMTkgYXQgMDE6MzM6NDRQTSAtMDQwMCwgVGhlb2RvcmUgVHMnbyB3
cm90ZToKPiBPbiBGcmksIE1heSAxMCwgMjAxOSBhdCAwMjoxMjo0MFBNIC0wNzAwLCBGcmFuayBS
b3dhbmQgd3JvdGU6Cj4gPiBIb3dldmVyLCB0aGUgcmVwbHkgaXMgaW5jb3JyZWN0LiAgS3NlbGZ0
ZXN0IGluLWtlcm5lbCB0ZXN0cyAod2hpY2gKPiA+IGlzIHRoZSBjb250ZXh0IGhlcmUpIGNhbiBi
ZSBjb25maWd1cmVkIGFzIGJ1aWx0IGluIGluc3RlYWQgb2YgYXMKPiA+IGEgbW9kdWxlLCBhbmQg
YnVpbHQgaW4gYSBVTUwga2VybmVsLiAgVGhlIFVNTCBrZXJuZWwgY2FuIGJvb3QsCj4gPiBydW5u
aW5nIHRoZSBpbi1rZXJuZWwgdGVzdHMgYmVmb3JlIFVNTCBhdHRlbXB0cyB0byBpbnZva2UgdGhl
Cj4gPiBpbml0IHByb2Nlc3MuCj4gCj4gVW0sIENpdGF0aW9uIG5lZWRlZD8KPiAKPiBJIGRvbid0
IHNlZSBhbnkgZXZpZGVuY2UgZm9yIHRoaXMgaW4gdGhlIGtzZWxmdGVzdCBkb2N1bWVudGF0aW9u
LCBub3IKPiBkbyBJIHNlZSBhbnkgZXZpZGVuY2Ugb2YgdGhpcyBpbiB0aGUga3NlbGZ0ZXN0IE1h
a2VmaWxlcy4KPiAKPiBUaGVyZSBleGlzdHMgdGVzdCBtb2R1bGVzIGluIHRoZSBrZXJuZWwgdGhh
dCBydW4gYmVmb3JlIHRoZSBpbml0Cj4gc2NyaXB0cyBydW4gLS0tIGJ1dCB0aGF0J3Mgbm90IHN0
cmljdGx5IHNwZWFraW5nIHBhcnQgb2Yga3NlbGZ0ZXN0cywKPiBhbmQgZG8gbm90IGhhdmUgYW55
IGtpbmQgb2YgaW5mcmFzdHJ1Y3R1cmUuICBBcyBub3RlZCwgdGhlCj4ga3NlbGZ0ZXN0c19oYXJu
ZXNzIGhlYWRlciBmaWxlIGZ1bmRhbWVudGFsbHkgYXNzdW1lcyB0aGF0IHlvdSBhcmUKPiBydW5u
aW5nIHRlc3QgY29kZSBpbiB1c2Vyc3BhY2UuCgpZZWFoIEkgcmVhbGx5IGxpa2UgdGhlICJubyB1
c2Vyc3BhY2UgcmVxdWlyZWQgYXQgYWxsIiBkZXNpZ24gb2Yga3VuaXQsCndoaWxlIHN0aWxsIGNv
bGxlY3RpbmcgcmVzdWx0cyBpbiBhIHdlbGwtZGVmaW5lZCB3YXkgKHVubGVzcyB0aGUgY3VycmVu
dApzZWxmLXRlc3QgdGhhdCBqdXN0IHJ1biB3aGVuIHlvdSBsb2FkIHRoZSBtb2R1bGUsIHdpdGgg
bWF5YmUgc29tZQprc2VsZnRlc3QgYWQtaG9jIHdyYXBwZXIgYXJvdW5kIHRvIGNvbGxlY3QgdGhl
IHJlc3VsdHMpLgoKV2hhdCBJIHdhbnQgdG8gZG8gbG9uZy10ZXJtIGlzIHRvIHJ1biB0aGVzZSBr
ZXJuZWwgdW5pdCB0ZXN0cyBhcyBwYXJ0IG9mCnRoZSBidWlsZC10ZXN0aW5nLCBtb3N0IGxpa2Vs
eSBpbiBnaXRsYWIgKHNvb25lciBvciBsYXRlciwgZm9yIGRybS5naXQKb25seSBvZmMpLiBTbyB0
aGF0IHBlb3BsZSBnZXQgdGhlaXIgcHVsbCByZXF1ZXN0cyAoYW5kIHBhdGNoIHNlcmllcywgd2UK
aGF2ZSBzb21lIGlkZWFzIHRvIHRpZSB0aGlzIGludG8gcGF0Y2h3b3JrKSBhdXRvbWF0aWNhbGx5
IHRlc3RlZCBmb3IgdGhpcwpzdXBlciBiYXNpYyBzdHVmZi4KLURhbmllbAotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
