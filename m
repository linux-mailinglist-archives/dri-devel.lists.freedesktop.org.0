Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8963185BE0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD446E798;
	Thu,  8 Aug 2019 07:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376FB6E02E;
 Thu,  8 Aug 2019 01:23:22 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hvX98-0000RZ-U7; Thu, 08 Aug 2019 01:23:15 +0000
Date: Thu, 8 Aug 2019 02:23:14 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCHv2 2/3] i915: convert to new mount API
Message-ID: <20190808012314.GK1131@ZenIV.linux.org.uk>
References: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
 <20190805160307.5418-3-sergey.senozhatsky@gmail.com>
 <20190805181255.GH1131@ZenIV.linux.org.uk>
 <20190805182834.GI1131@ZenIV.linux.org.uk>
 <alpine.LSU.2.11.1908060007190.1941@eggly.anvils>
 <20190807063002.GG6627@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807063002.GG6627@lst.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDg6MzA6MDJBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMTI6NTA6MTBBTSAtMDcwMCwgSHVn
aCBEaWNraW5zIHdyb3RlOgo+ID4gVGhvdWdoIHBlcnNvbmFsbHkgSSdtIGF2ZXJzZSB0byBtYW5h
Z2luZyAiZiJvYmplY3RzIHRocm91Z2gKPiA+ICJtImludGVyZmFjZXMsIHdoaWNoIGNhbiBnZXQg
cmlkaWN1bG91cyAobm90YWJseSwgTUFEVl9IVUdFUEFHRSB3b3Jrcwo+ID4gb24gdGhlIHZpcnR1
YWwgYWRkcmVzcyBvZiBhIG1hcHBpbmcsIGJ1dCB0aGUgaHVnZS1vci1ub3QgYWxpZ25tZW50IG9m
Cj4gPiB0aGF0IG1hcHBpbmcgbXVzdCBoYXZlIGJlZW4gZGVjaWRlZCBwcmV2aW91c2x5KS4gIElu
IEdvb2dsZSB3ZSBkbyB1c2UKPiA+IGZjbnRscyBGX0hVR0VQQUdFIGFuZCBGX05PSFVHRVBBR0Ug
dG8gb3ZlcnJpZGUgb24gYSBwZXItZmlsZSBiYXNpcyAtCj4gPiBvbmUgZGF5IEknbGwgZ2V0IHRv
IHVwc3RyZWFtaW5nIHRob3NlLgo+IAo+IFN1Y2ggYW4gaW50ZXJmYWNlIHNlZW1zIHZlcnkgdXNl
ZnVsLCBhbHRob3VnaCB0aGUgdHdvIGZjbnRscyBzZWVtIGEgYml0Cj4gb2RkLgo+IAo+IEJ1dCBJ
IHRoaW5rIHRoZSBwb2ludCBoZXJlIGlzIHRoYXQgdGhlIGk5MTUgaGFzIGl0cyBvd24gc29tZXdo
YXQgb2RkCj4gaW5zdGFuY2Ugb2YgdG1wZnMuICBJZiB3ZSBjb3VsZCBwYXNzIHRoZSBlcXVpdmFs
ZW50IG9mIHRoZSBodWdlPSoKPiBvcHRpb25zIHRvIHNobWVtX2ZpbGVfc2V0dXAgYWxsIHRoYXQg
Z2FyYmFnZSAoaW5jbHVkaW5nIHRoZQo+IHNobWVtX2ZpbGVfc2V0dXBfd2l0aF9tbnQgZnVuY3Rp
b24pIGNvdWxkIGdvIGF3YXkuCgouLi4gb3IgZm9sbG93IHNobWVtX2ZpbGVfc3VwZXIoKSB3aXRo
IHdoYXRldmVyIHRoYXQgZmNudGwgbWFwcyB0bwppbnRlcm5hbGx5LiAgSSB3b3VsZCByZWFsbHkg
bG92ZSB0byBnZXQgcmlkIG9mIHRoYXQgaTkxNSBrbHVkZ2UuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
