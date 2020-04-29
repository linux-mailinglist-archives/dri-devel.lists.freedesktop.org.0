Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 301381BE540
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 19:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4BF6E091;
	Wed, 29 Apr 2020 17:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03C8B6E091
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 17:31:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66F531045;
 Wed, 29 Apr 2020 10:31:03 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 477663F73D;
 Wed, 29 Apr 2020 10:31:03 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 10982682B71; Wed, 29 Apr 2020 18:31:02 +0100 (BST)
Date: Wed, 29 Apr 2020 18:31:01 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH] drm: enable render nodes wherever buffer sharing is
 supported
Message-ID: <20200429173101.GI1985@e110455-lin.cambridge.arm.com>
References: <CAMn1gO4NsAoBUN4VFntB+pZK=cVCmwxBGUyipLPYYWFvpH1Z+A@mail.gmail.com>
 <20200427200513.36328-1-pcc@google.com>
 <20200429161650.65m37srq3sucbsit@DESKTOP-E1NTVVP.localdomain>
 <CAMn1gO4ozMZQk3jN7iNGH5Cq-3jQd=d4vgVj-Zr35u3YRsMG0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMn1gO4ozMZQk3jN7iNGH5Cq-3jQd=d4vgVj-Zr35u3YRsMG0Q@mail.gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: nd@arm.com, Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjksIDIwMjAgYXQgMDk6NTE6MTlBTSAtMDcwMCwgUGV0ZXIgQ29sbGluZ2Jv
dXJuZSB3cm90ZToKPiBPbiBXZWQsIEFwciAyOSwgMjAyMCBhdCA5OjE3IEFNIEJyaWFuIFN0YXJr
ZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgUGV0ZXIsCj4gPgo+
ID4gT24gTW9uLCBBcHIgMjcsIDIwMjAgYXQgMDE6MDU6MTNQTSAtMDcwMCwgUGV0ZXIgQ29sbGlu
Z2JvdXJuZSB3cm90ZToKPiA+ID4gUmVuZGVyIG5vZGVzIGFyZSBub3QganVzdCB1c2VmdWwgZm9y
IGRldmljZXMgc3VwcG9ydGluZyBHUFUgaGFyZHdhcmUKPiA+ID4gYWNjZWxlcmF0aW9uLiBFdmVu
IG9uIGRldmljZXMgdGhhdCBvbmx5IHN1cHBvcnQgZHVtYiBmcmFtZSBidWZmZXJzLAo+ID4gPiB0
aGV5IGFyZSB1c2VmdWwgaW4gc2l0dWF0aW9ucyB3aGVyZSBjb21wb3NpdGlvbiAodXNpbmcgc29m
dHdhcmUKPiA+ID4gcmFzdGVyaXphdGlvbikgYW5kIEtNUyBhcmUgZG9uZSBpbiBkaWZmZXJlbnQg
cHJvY2Vzc2VzIHdpdGggYnVmZmVyCj4gPiA+IHNoYXJpbmcgYmVpbmcgdXNlZCB0byBzZW5kIGZy
YW1lIGJ1ZmZlcnMgYmV0d2VlbiB0aGVtLiBUaGlzIGlzIHRoZQo+ID4gPiBzaXR1YXRpb24gb24g
QW5kcm9pZCwgd2hlcmUgc3VyZmFjZWZsaW5nZXIgaXMgdGhlIGNvbXBvc2l0b3IgYW5kIHRoZQo+
ID4gPiBjb21wb3NlciBIQUwgdXNlcyBLTVMgdG8gZGlzcGxheSB0aGUgYnVmZmVycy4gVGh1cyBp
dCBpcyBiZW5lZmljaWFsCj4gPiA+IHRvIGV4cG9zZSByZW5kZXIgbm9kZXMgb24gYWxsIGRldmlj
ZXMgdGhhdCBzdXBwb3J0IGJ1ZmZlciBzaGFyaW5nLgo+ID4KPiA+IElmIEkgdW5kZXJzdGFuZCB5
b3VyIHByb2JsZW0gcmlnaHQsIHRoZSBpc3N1ZSBpcyB0aGF0IHlvdSdyZSBnZXR0aW5nCj4gPiB5
b3VyIGJ1ZmZlcnMgaW4gbWluaWdibSB2aWEgcGwxMTEsIHdoaWNoIG1lYW5zIHlvdSB3YW50IGEg
cmVuZGVyIG5vZGUKPiA+IGp1c3QgZm9yIGJ1ZmZlciBhbGxvY2F0aW9uPyBUaGVuIEhXQ29tcG9z
ZXIgd2lsbCBpbXBvcnQgdGhvc2Ugb24gdGhlCj4gPiBwcmltYXJ5IG5vZGUgZm9yIGRpc3BsYXlp
bmcuCj4gCj4gQ29ycmVjdC4KPiAKPiA+IEknbSBub3QgYXQgYWxsIGZhbWlsaWFyIHdpdGggaG93
IG1pbmlnYm0gc2l0cyBpbiBBbmRyb2lkLCBidXQgb24gb3VyCj4gPiBwbGF0Zm9ybXMgd2hlcmUg
dGhlIERpc3BsYXkgYW5kIEdQVSBkZXZpY2VzIGFyZSBkaWZmZXJlbnQsIHdlIGFsbG9jYXRlCj4g
PiB2aWEgaW9uIGluIEdyYWxsb2MsIGFuZCBpbXBvcnQgdGhvc2UgaW50byBib3RoIHRoZSBHUFUg
YW5kIERpc3BsYXkuCj4gPiBJIHRoaW5rIHRoYXQgc2hvdWxkIHdvcmsgb24gcGwxMTEgdG9vIC0g
aWYgeW91IGNhbiBhbGxvY2F0ZSBjb250aWd1b3VzCj4gPiBtZW1vcnkgZnJvbSBpb24gKG9yIGRt
YS1idWYgaGVhcHMpIGluIG1pbmlnYm0sIHRoZW4geW91IGRvbid0IG5lZWQgdGhlCj4gPiByZW5k
ZXIgbm9kZS4KPiAKPiBUaG9zZSBjb250aWd1b3VzIG1lbW9yeSByZWdpb25zIHdvdWxkIG5vdCBu
ZWNlc3NhcmlseSBiZSBjb21wYXRpYmxlCj4gd2l0aCB0aGUgcGwxMTEgZGV2aWNlIGFzIGZhciBh
cyBJIGtub3cgLS0gYWNjb3JkaW5nIHRvIFsxXSwgb24gc29tZQo+IGRldmljZXMsIGEgZGVzaWdu
YXRlZCBtZW1vcnkgcmVnaW9uIG11c3QgYmUgdXNlZCBmb3IgdGhlIGZyYW1lYnVmZmVyCj4gYW5k
IHRoZXJlZm9yZSB0aGUgbWVtb3J5IHJlZ2lvbiBhbGxvY2F0ZWQgaW4gQ01BIHdvdWxkIG5vdCBi
ZQo+IGNvbXBhdGlibGUuIFRoYXQgYmVpbmcgc2FpZCwgRlZQIGRvZXNuJ3QgYXBwZWFyIHRvIGJl
IG9uZSBvZiB0aG9zZQo+IGRldmljZXMsIHNvIGluIHByaW5jaXBsZSB0aGF0IG1pZ2h0IHdvcmsg
Zm9yIEZWUCAocHJvdmlkZWQgdGhhdCB0aGUKPiB1c2VyIHByb3ZpZGVzIGEgc3VmZmljaWVudGx5
IGxhcmdlIGNtYT1YIGtlcm5lbCBjb21tYW5kIGxpbmUKPiBhcmd1bWVudCksIGJ1dCBub3QgZm9y
IHRob3NlIG90aGVyIGRldmljZXMuCgpXZSBoYXZlIGJlZW4gZG9pbmcgdGhhdCB3aXRoIG1hbGkt
ZHAgZHJpdmVycyBmb3IgeWVhcnMuIEJlY2F1c2UgbW9zdCBvZgpvdXIgZGV2IGVudmlyb25tZW50
cyBhcmUgb24gRlBHQXMsIHdlIG5lZWRlZCB0byB1c2UgdGhlIGxvY2FsIFJBTSBvbgp0aG9zZSBi
b2FyZHMgc28gd2UndmUgaGFkIHRvIGFzc2lnbiBhIG1lbW9yeSByZWdpb24gdG8gdGhlIGRyaXZl
ciB0aGF0CmluIHR1cm4gd2FzIHVzaW5nIENNQS4gV2UndmUgbWFkZSBoZWF2eSB1c2Ugb2YgJ3Jl
c2VydmVkLW1lbW9yeScgYW5kCidtZW1vcnktcmVnaW9uJyBub2RlcyBpbiB0aGUgRFQgdG8gbGlu
ayB0aGUgdHdvIHRvZ2V0aGVyLCBidXQgdGhpbmdzCndvcmtlZCBvdXQgcXVpdGUgd2VsbC4gQmVj
YXVzZSB0aGUgJ3Jlc2VydmVkLW1lbW9yeScgc3ViLW5vZGUgd2FzIG1hcmtlZAphcyAnY29tcGF0
aWJsZT0ic2hhcmVkLWRtYS1wb29sIicsIGdyYWxsb2MgYW5kIElPTiBjb3VsZCBiZSB1c2VkIHRv
CmFsbG9jYXRlIG1lbW9yeSBmcm9tIGl0LgoKQmVzdCByZWdhcmRzLApMaXZpdQoKPiAKPiBQZXRl
cgo+IAo+IFsxXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm0lMkNwbDExeC50eHQKCi0tIAo9PT09PT09PT09PT09
PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhl
eSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0t
LS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
