Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7B11179B
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 12:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EA1890C9;
	Thu,  2 May 2019 10:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54870890C9
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 10:50:56 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 862482075E;
 Thu,  2 May 2019 10:50:55 +0000 (UTC)
Date: Thu, 2 May 2019 12:50:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190502105053.GA12416@kroah.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556794256;
 bh=Ayblsy3jHDm2CChtokJ923ivXLZjfyjL6uNubfrhVOA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QXN7qfD9kVZ8X14uPJyJaEtMH+8kKfNVIsH6ibUWlQkRylnV/zLp9rQ6le2tunE78
 SSJF7dmrJsP0QsUsoC9j31We0mjmXawkaN8LppVzAyCBUPD5b9pzAyl6ekchbNAzFq
 btjAwtKByeIBqfun6usLtq6HFfVq7lLUJLvG54Zg=
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
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-nvdimm@lists.01.org, frowand.list@gmail.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 dan.j.williams@intel.com, kunit-dev@googlegroups.com, richard@nod.at,
 sboyd@kernel.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 keescook@google.com, linux-fsdevel@vger.kernel.org, logang@deltatee.com,
 khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMDQ6MDE6MDlQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+ICMjIFRMRFIKPiAKPiBJIHJlYmFzZWQgdGhlIGxhc3QgcGF0Y2hzZXQgb24gNS4x
LXJjNyBpbiBob3BlcyB0aGF0IHdlIGNhbiBnZXQgdGhpcyBpbgo+IDUuMi4KClRoYXQgbWlnaHQg
YmUgcnVzaGluZyBpdCwgbm9ybWFsbHkgdHJlZXMgYXJlIGFscmVhZHkgY2xvc2VkIG5vdyBmb3IK
NS4yLXJjMSBpZiA1LjEtZmluYWwgY29tZXMgb3V0IHRoaXMgU3VuZGF5LgoKPiBTaHVhaCwgSSB0
aGluayB5b3UsIEdyZWcgS0gsIGFuZCBteXNlbGYgdGFsa2VkIG9mZiB0aHJlYWQsIGFuZCB3ZSBh
Z3JlZWQKPiB3ZSB3b3VsZCBtZXJnZSB0aHJvdWdoIHlvdXIgdHJlZSB3aGVuIHRoZSB0aW1lIGNh
bWU/IEFtIEkgcmVtZW1iZXJpbmcKPiBjb3JyZWN0bHk/CgpObyBvYmplY3Rpb24gZnJvbSBtZS4K
CkxldCBtZSBnbyByZXZpZXcgdGhlIGxhdGVzdCByb3VuZCBvZiBwYXRjaGVzIG5vdy4KCnRoYW5r
cywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
