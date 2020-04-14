Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABEA1A75C0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 10:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6934189D99;
	Tue, 14 Apr 2020 08:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00CF89D99
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 08:21:54 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D102D5800F6;
 Tue, 14 Apr 2020 04:21:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 14 Apr 2020 04:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=K
 9NNGyZC3pe81UCb1QBdT9lxusbIOSuDYCMZGd3QvZY=; b=rKYrGrZiQ+j6FJO52
 iSkryG9dNJ5xdrkn96G/3EeAN0q/9nIeBIKScyX/bjUSuP5RharNdU2JBgX3V13h
 dGm5DPjvouo3d/VtMmg/Rs9OnOfXNmzvby9b+vwD+fxFcpe0P8TEwfUY/ThhO9u7
 thz3jiX0LJyCjcmH48jR2z5Xv+6lCR7FfjeGHmyum2MhREQotT+EmcAzXR2T04Af
 EgRWsOtRQ7UW1n/F4UtJTOvomJXkvIRpYqeHoKkFjR/TJvv1QNnWLRybCh6As6bk
 gqE3ZFnqqDcpX46s2OUZM5nQj0slUVojKaBDlXWgzhnatdiqnxrW8T7LIs/jHanB
 vAbjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=K9NNGyZC3pe81UCb1QBdT9lxusbIOSuDYCMZGd3Qv
 ZY=; b=X5upAqVGP/jJNnDVewMt9pXltZ5l5C4o0uzAROA3hdKyE/2GPyX52DbLV
 ydvcDHWHvlYIY/TvderSu4Ne0OXuUOWgTUitW+PbgBquuOEpihu8LD4eyKEKyte3
 jswqjCQerHgV2wprahLFBYMBRPgo9S8cmpOMVBnXeUkB9HiOVFF0QiNWktAM3RMw
 9qZOQJe8E8hzbmJbUhPmXugmvxHT6uzetsmIKPSOcAIiRwIfmTXK/YWESLTVMLG4
 lHUBvN2z736+/VYel2cSnypzlhlmwXC7WLclG99se3rnsCDMcwuC/KFaTXv4DUtS
 x2zT4fzyvwBPC8pewzyEuTu0Y2n7Q==
X-ME-Sender: <xms:oHKVXusMLZbM2B0tIBqUesHKVf4dc-FOZqXPNcGnO4bWi0Cr92dTfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfedugddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinhepfhhrvggvuggvsh
 hkthhophdrohhrghenucfkphepkeefrdekiedrkeelrddutdejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtoh
 hm
X-ME-Proxy: <xmx:oHKVXvAt5ALrBjpPUj6IRVOnCzS0lw4tpvWLLN5CQ2wnYGXqcAAULQ>
 <xmx:oHKVXhk48uBc81zn02KWktBSC8r4-MsUDClwkdLMkRHog2vIcVartQ>
 <xmx:oHKVXggTM2EuAuvvsJhYJFn13DuF0Ma3tVjwio0EMfT-YqB2tUuisQ>
 <xmx:oXKVXvmtBT2B6gQqJaARzl1tNz6065WPfpkTfcxvX1ODSkL1esYTiA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id A0A2D3060060;
 Tue, 14 Apr 2020 04:21:51 -0400 (EDT)
Date: Tue, 14 Apr 2020 10:21:50 +0200
From: Greg KH <greg@kroah.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [regression 5.7-rc1] System does not power off, just halts
Message-ID: <20200414082150.GD4149624@kroah.com>
References: <f4eaf0ca-6cd6-c224-9205-bf64ca533ff5@molgen.mpg.de>
 <dcc4851e-0ab5-683a-2cf2-687d64a3c9da@molgen.mpg.de>
 <CADnq5_OXdpEebFY3+kyQb-WEw0Rb6cqoOFKGqgxaigU5hean1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_OXdpEebFY3+kyQb-WEw0Rb6cqoOFKGqgxaigU5hean1g@mail.gmail.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 X86 ML <x86@kernel.org>, Huang Rui <ray.huang@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Prike Liang <Prike.Liang@amd.com>, regressions@leemhuis.info,
 "for 3.8" <stable@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Mengbing Wang <Mengbing.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgMTMsIDIwMjAgYXQgMDE6NDg6NThQTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IE9uIE1vbiwgQXByIDEzLCAyMDIwIGF0IDE6NDcgUE0gUGF1bCBNZW56ZWwgPHBtZW56
ZWxAbW9sZ2VuLm1wZy5kZT4gd3JvdGU6Cj4gPgo+ID4gRGVhciBQcmlrZSwgZGVhciBBbGV4LCBk
ZWFyIExpbnV4IGZvbGtzLAo+ID4KPiA+Cj4gPiBBbSAxMy4wNC4yMCB1bSAxMDo0NCBzY2hyaWVi
IFBhdWwgTWVuemVsOgo+ID4KPiA+ID4gQSByZWdyZXNzaW9uIGJldHdlZW4gY2F1c2VzIGEgc3lz
dGVtIHdpdGggdGhlIEFNRCBib2FyZCBNU0kgQjM1ME0gTU9SVEFSCj4gPiA+IChNUy03QTM3KSB3
aXRoIGFuIEFNRCBSeXplbiAzIDIyMDBHIG5vdCB0byBwb3dlciBvZmYgYW55IG1vcmUgYnV0IGp1
c3QKPiA+ID4gdG8gaGFsdC4KPiA+ID4KPiA+ID4gVGhlIHJlZ3Jlc3Npb24gaXMgaW50cm9kdWNl
ZCBpbiA5ZWJlNTQyMmFkNmMuLmIwMzIyMjdjNjI5My4gSSBhbSBpbiB0aGUKPiA+ID4gcHJvY2Vz
cyB0byBiaXNlY3QgdGhpcywgYnV0IG1heWJlIHNvbWVib2R5IGFscmVhZHkgaGFzIGFuIGlkZWEu
Cj4gPgo+ID4gSSBmb3VuZCB0aGUgRWFzdGVyIGVnZzoKPiA+Cj4gPiA+IGNvbW1pdCA0ODdlY2Ex
MWEzMjFlZjMzYmNmNGNhNWFkYjNjMGM0OTU0ZGIxYjU4Cj4gPiA+IEF1dGhvcjogUHJpa2UgTGlh
bmcgPFByaWtlLkxpYW5nQGFtZC5jb20+Cj4gPiA+IERhdGU6ICAgVHVlIEFwciA3IDIwOjIxOjI2
IDIwMjAgKzA4MDAKPiA+ID4KPiA+ID4gICAgIGRybS9hbWRncHU6IGZpeCBnZnggaGFuZyBkdXJp
bmcgc3VzcGVuZCB3aXRoIHZpZGVvIHBsYXliYWNrICh2MikKPiA+ID4KPiA+ID4gICAgIFRoZSBz
eXN0ZW0gd2lsbCBiZSBoYW5nIHVwIGR1cmluZyBTMyBzdXNwZW5kIGJlY2F1c2Ugb2YgU01VIGlz
IHBlbmRpbmcKPiA+ID4gICAgIGZvciBHQyBub3QgcmVzcG9zZSB0aGUgcmVnaXN0ZXIgQ1BfSFFE
X0FDVElWRSBhY2Nlc3MgcmVxdWVzdC5UaGlzIGlzc3VlCj4gPiA+ICAgICByb290IGNhdXNlIG9m
IGFjY2Vzc2luZyB0aGUgR0MgcmVnaXN0ZXIgdW5kZXIgZW50ZXIgR0ZYIENHR1BHIGFuZCBjYW4K
PiA+ID4gICAgIGJlIGZpeGVkIGJ5IGRpc2FibGUgR0ZYIENHUEcgYmVmb3JlIHBlcmZvcm0gc3Vz
cGVuZC4KPiA+ID4KPiA+ID4gICAgIHYyOiBVc2UgZGlzYWJsZSB0aGUgR0ZYIENHUEcgaW5zdGVh
ZCBvZiBSTEMgc2FmZSBtb2RlIGd1YXJkLgo+ID4gPgo+ID4gPiAgICAgU2lnbmVkLW9mZi1ieTog
UHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+Cj4gPiA+ICAgICBUZXN0ZWQtYnk6IE1l
bmdiaW5nIFdhbmcgPE1lbmdiaW5nLldhbmdAYW1kLmNvbT4KPiA+ID4gICAgIFJldmlld2VkLWJ5
OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgo+ID4gPiAgICAgU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+ID4gPiAgICAgQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+Cj4gPiBJdCByZXZlcnRzIGNsZWFubHkgb24gdG9wIG9m
IDUuNy1yYzEsIGFuZCB0aGlzIGZpeGVzIHRoZSBpc3N1ZS4KPiA+Cj4gPiBHcmVnLCBwbGVhc2Ug
ZG8gbm90IGFwcGx5IHRoaXMgdG8gdGhlIHN0YWJsZSBzZXJpZXMuIFRoZSBjb21taXQgbWVzc2Fn
ZQo+ID4gZG9lc27igJl0IGV2ZW4gcmVmZXJlbmNlIGEgaXNzdWUvYnVnIHJlcG9ydCwgYW5kIGRv
ZXNu4oCZdCBnaXZlIGEgZGV0YWlsZWQKPiA+IHByb2JsZW0gZGVzY3JpcHRpb24uIFdoYXQgc3lz
dGVtIGlzIGl0Pwo+ID4KPiA+IERhdmUsIEFsZXgsIGhvdyB0byBwcm9jZWVkPyBSZXZlcnQ/IEkg
Y3JlYXRlZCBpc3N1ZSAxMDk0IFsxXS4KPiAKPiBBbHJlYWR5IGZpeGVkOgo+IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zNjExOTUvCgpBbnkgcmVhc29uIHRoYXQgZG9l
c24ndCBoYXZlIGEgY2M6IHN0YWJsZSB0YWcgb24gaXQ/CgpBbmQgaXMgaXQgY29tbWl0dGVkIHRv
IGFueSB0cmVlIGF0IHRoZSBtb21lbnQ/Cgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
