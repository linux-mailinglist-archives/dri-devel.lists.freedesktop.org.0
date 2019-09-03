Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615AAA7148
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 19:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1BB89568;
	Tue,  3 Sep 2019 17:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5D989568;
 Tue,  3 Sep 2019 17:03:49 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D5D420870;
 Tue,  3 Sep 2019 17:03:48 +0000 (UTC)
Date: Tue, 3 Sep 2019 19:03:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH AUTOSEL 4.19 044/167] drm/amdgpu: validate user pitch
 alignment
Message-ID: <20190903170347.GA24357@kroah.com>
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-44-sashal@kernel.org>
 <7957107d-634f-4771-327e-99fdd5e6474e@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7957107d-634f-4771-327e-99fdd5e6474e@daenzer.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567530229;
 bh=bUxrgGlb8IHuXCYAMMq77/WS81cga4wFl4/4NHV4vUY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OHKxoV8KAhi5j/+jXWiyEvFrA4baZFbh5q/p80iksz40TIwAQH7c/RXWhKo52vBlJ
 896IW37U3vdTzP4AddqJjMiST0edVTl3lJX1xhlGZi0AtwvLaNZE3PbT2TwVVgP6sH
 U74lxkE6ropWeeWaoWiaRHE3jgt9Sub63wsQyZAg=
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
Cc: Sasha Levin <sashal@kernel.org>, Yu Zhao <yuzhao@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDY6NDA6NDNQTSArMDIwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6Cj4gT24gMjAxOS0wOS0wMyA2OjIzIHAubS4sIFNhc2hhIExldmluIHdyb3RlOgo+ID4g
RnJvbTogWXUgWmhhbyA8eXV6aGFvQGdvb2dsZS5jb20+Cj4gPiAKPiA+IFsgVXBzdHJlYW0gY29t
bWl0IDg5ZjIzYjZlZmVmNTU0NzY2MTc3YmY1MWFhNzU0YmNlMTRjM2U3ZGEgXQo+IAo+IEhvbGQg
eW91ciBob3JzZXMhCj4gCj4gVGhpcyBjb21taXQgYW5kIGM0YTMyYjI2NmRhN2JiNzAyZTYwMzgx
Y2EwYzM1ZWFkZGJjODlhNmMgaGFkIHRvIGJlCj4gcmV2ZXJ0ZWQsIGFzIHRoZXkgY2F1c2VkIHJl
Z3Jlc3Npb25zLiBTZWUgY29tbWl0cwo+IDI1ZWM0MjllODZiYjc5MGU0MDM4N2E1NTBmMDUwMWQw
YWM1NWE0N2MgJgo+IDkyYjA3MzBlYWYyZDU0OWZkZmIxMGVjYzhiNzFmMzRiOWY0NzJjMTIgLgo+
IAo+IAo+IFRoaXMgaXNuJ3QgYm9sc3RlcmluZyBjb25maWRlbmNlIGluIGhvdyB0aGVzZSBwYXRj
aGVzIGFyZSBzZWxlY3RlZC4uLgoKVGhlIHBhdGNoIF9pdHNlbGZfIHNhaWQgdG8gYmUgYmFja3Bv
cnRlZCB0byB0aGUgc3RhYmxlIHRyZWVzIGZyb20gNC4yCmFuZCBuZXdlci4gIFdoeSB3b3VsZG4n
dCB3ZSBiZSBjb25maWRlbnQgaW4gZG9pbmcgdGhpcz8KCklmIHRoZSBwYXRjaCBkb2Vzbid0IHdh
bnQgdG8gYmUgYmFja3BvcnRlZCwgdGhlbiBkbyBub3QgYWRkIHRoZSBjYzoKc3RhYmxlIGxpbmUg
dG8gaXQuLi4KCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
