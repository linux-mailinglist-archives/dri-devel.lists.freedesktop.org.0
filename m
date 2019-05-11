Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6861B0B4
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 09:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CCA8955D;
	Mon, 13 May 2019 07:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rosenzweig.io (rosenzweig.io [107.170.207.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FD989BD4
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 22:32:21 +0000 (UTC)
Received: by rosenzweig.io (Postfix, from userid 1000)
 id 5587360C45; Sat, 11 May 2019 15:32:20 -0700 (PDT)
Date: Sat, 11 May 2019 15:32:20 -0700
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 0/3] drm/panfrost: Expose HW counters to userspace
Message-ID: <20190511223220.GA15155@rosenzweig.io>
References: <20190404152051.17996-1-boris.brezillon@collabora.com>
 <ba54e655-6316-8d36-dfd1-c5df418cee3a@arm.com>
 <20190430144238.49963521@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430144238.49963521@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 13 May 2019 07:04:34 +0000
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Janes <mark.a.janes@intel.com>, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKQXMgU3RldmVuIFByaWNlIGV4cGxhaW5lZCwgdGhlICJHUFUgdG9wIiBrYmFzZSBh
cHByb2FjaCBpcyBvZnRlbiBtb3JlCnVzZWZ1bCBhbmQgYWNjdXJhdGUgdGhhbiBwZXItZHJhdyB0
aW1pbmcuIAoKRm9yIGEgM0QgZ2FtZSBpbnNpZGUgYSBHUFUtYWNjZWxlcmF0ZWQgZGVza3RvcCwg
dGhlIGdhbWVzJyBjb3VudGVycwoqc2hvdWxkKiBpbmNsdWRlIGRlc2t0b3Agb3ZlcmhlYWQuIFRo
aXMgZXh0ZXJuYWwgb3ZlcmhlYWQgZG9lcyBhZmZlY3QKdGhlIGdhbWUncyBwZXJmb3JtYW5jZSwg
ZXNwZWNpYWxseSBpZiB0aGUgY29udGV4dHMgYXJlIGNvbXBldGluZyBmb3IKcmVzb3VyY2VzIGxp
a2UgbWVtb3J5IGJhbmR3aWR0aC4gQW4gaXNvbGF0ZWQgc2FtcGxlIGlzIGVhc3kgdG8gYWNoaWV2
ZQpydW5uaW5nIG9ubHkgdGhlIGFwcCBvZiBpbnRlcmVzdDsgaW4gaWRlYWwgY29uZGl0aW9ucyAo
emVyby1jb3B5CmZ1bGxzY3JlZW4pLCBkZXNrdG9wIGludGVyZmVyZW5jZSBpcyBuZWdsaWdpYmxl
LiAKCkZvciBkcml2ZXIgZGV2ZWxvcGVycywgdGhlIHN5c3RlbS13aWRlIG1lYXN1cmVtZW50cyBh
cmUgcHJlZmVyYWJsZSwKcGFpbnRpbmcgYSBjb21wbGV0ZSBzeXN0ZW0gcGljdHVyZSBhbmQgYXZv
aWRpbmcgZGlzcnVwdGlvbnMuIFRoZXJlIGlzIG5vCnJpc2sgb2YgY29uZnVzaW9uLCBhcyB0aGUg
ZHJpdmVyIGRldmVsb3BlcnMgdW5kZXJzdGFuZCBob3cgdGhlIGNvdW50ZXJzCmFyZSBleHBvc2Vk
LiBGdXJ0aGVyLCBiZW5jaG1hcmtzIHJlbmRlcmluZyBkaXJlY3QgdG8gYSBHQk0gc3VyZmFjZSBh
cmUKYXZhaWxhYmxlIChnbG1hcmsyLWVzMi1kcm0pLCBlbGltaW5hdGluZyBpbnRlcmZlcmVuY2Ug
ZXZlbiB3aXRoIHBvb3IKZGVza3RvcCBwZXJmb3JtYW5jZS4KCkZvciBhcHAgZGV2ZWxvcGVycywg
dGhlIGNvbmZ1c2lvbiBvZiBtdWx0aS1jb250ZXh0IGludGVyZmVyZW5jZSBpcwp1bmZvcnR1bmF0
ZS4gTmV2ZXJ0aGVsZXNzLCBpZiBlbmFibGluZyBjb3VudGVycyB3ZXJlIHRvIHNsb3cgZG93biBh
bgphcHAsIHRoZSBjb25mdXNpb24gY291bGQgYmUgd29yc2UuIENvbnNpZGVyIHNlY29uZC1vcmRl
ciBjaGFuZ2VzIGluIHRoZQphcHAncyBwZXJmb3JtYW5jZSBjaGFyYWN0ZXJpc3RpY3MgZHVlIHRv
IHNsb3dkb3duOiBpZiB0ZWNobmlxdWVzIGxpa2UKZHluYW1pYyByZXNvbHV0aW9uIHNjYWxpbmcg
YXJlIGVtcGxveWVkLCB0aGUgY291bnRlcnMnIHJlc3VsdHMgY2FuIGJlCmludmFsaWQuICBMaWtl
d2lzZSwgZXZlbiBpZiB0aGUgbG93ZXItcGVyZm9ybWFuY2UgY291bnRlcnMgYXJlCmFwcHJvcHJp
YXRlIGZvciBwdXJlbHkgZ3JhcGhpY2FsIHdvcmtsb2FkcywgY29tcGxleCBhcHBzIHdpdGggdmFy
aWFibGUKQ1BVIG92ZXJoZWFkIChlLmcuIGZyb20gYW4gRlBTLWRlcGVuZGVudCBwaHlzaWNzIGVu
Z2luZSkgY2FuIGZ1cnRoZXIKY29uZm91bmQgY291bnRlcnMuIExvdy1vdmVyaGVhZCBzeXN0ZW0t
d2lkZSBtZWFzdXJlbWVudHMgbWl0aWdhdGUgdGhlc2UKY29uY2VybnMuCgpBcyBSb2IgQ2xhcmsg
c3VnZ2VzdGVkLCBzeXN0ZW0td2lkZSBjb3VudGVycyBjb3VsZCBiZSBleHBvc2VkIHZpYSBhCnNl
bWktc3RhbmRhcmRpemVkIGludGVyZmFjZSwgcGVyaGFwcyB3aXRoaW4gZGVidWdmcy9zeXNmcy4g
VGhlIGludGVyZmFjZQpjb3VsZCBub3QgYmUgY29tcGxldGVseSBzdGFuZGFyZCwgYXMgdGhlIGxp
c3Qgb2YgY291bnRlcnMgZXhwb3NlZCB2YXJpZXMKc3Vic3RhbnRpYWxseSBieSB2ZW5kb3IgYW5k
IG1vZGVsLiBOZXZlcnRoZWxlc3MsIHRoZSBtZWNoYW5pY3Mgb2YKZGlzY292ZXJpbmcsIGVuYWJs
aW5nLCByZWFkaW5nLCBhbmQgZGlzYWJsaW5nIGNvdW50ZXJzIGNhbiBiZQpzdGFuZGFyZGl6ZWQs
IGFzIGNhbiBhIHNtYWxsIHNldCBvZiB1bml2ZXJzYWxseSBtZWFuaW5nZnVsIGNvdW50ZXJzIGxp
a2UKdG90YWwgR1BVIHV0aWxpemF0aW9uLiBUaGlzIHdvdWxkIHBlcm1pdCBhIHZlbmRvci1pbmRl
cGVuZGVudCBHUFUgdG9wCmFwcCBhcyBzdWdnZXN0ZWQsIGFzIGlzIEkgYmVsaWV2ZSBjdXJyZW50
bHkgcG9zc2libGUgd2l0aAp2ZW5kb3Itc3BlY2lmaWMgZG93bnN0cmVhbSBrZXJuZWxzIChlLmcu
IHZpYSBHYXRvci9TdHJlYW1saW5lIGZvciBNYWxpKQoKSXQgbG9va3MgbGlrZSB0aGlzIGRpc2N1
c3Npb24gaXMgZG9ybWFudC4gQ291bGQgd2UgdHJ5IHRvIGdldCB0aGlzCnNvcnRlZD8gRm9yIFBh
bmZyb3N0LCBJJ20gaGl0dGluZyBHUFUtc2lkZSBib3R0bGVuZWNrcyB0aGF0IEknbSB1bmFibGUK
dG8gZGlhZ25vc2Ugd2l0aG91dCBhY2Nlc3MgdG8gdGhlIGNvdW50ZXJzLCBzbyBJJ20gZWFnZXIg
Zm9yIGEgbWFpbmxpbmUKc29sdXRpb24gdG8gYmUgaW1wbGVtZW50ZWQuCgpUaGFuayB5b3UsCgpB
bHlzc2EKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
