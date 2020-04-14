Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21BD1A7BCA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 15:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672BA6E4C7;
	Tue, 14 Apr 2020 13:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC036E4C7;
 Tue, 14 Apr 2020 13:08:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a201so13493045wme.1;
 Tue, 14 Apr 2020 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NTg88EBEg4qOXVBL74JDWDn01n0VKUHWmo8g8ottwjk=;
 b=doeIn3Si97S/MngUsuOx9N4xLfiWQ81AHOxJsgpJhSAaWdJ2Vx25UzrTmv1oMFjUT5
 2QrtYy8fiNH4Kn3zuur6CtddJ+sA9PjIDuvapuo+7hezmgeX1gCLq8q/cvM0dqtWRJ+s
 RRbl7AO5mYAqbZIYfFOfsLhszvuoM1XdzCh6gHiYb2MIgUpFnlvCr3wmp+TG3kxnoWi2
 KTfOQAqt+s4VSLVL7pdljX4nIVsSCXJW1iUCV2XueyHuhYle+s3TZXZVNctwVQ/UWr18
 WrkPmWYC/UlioNHys+m0chulDlp4tIJTjsliPfReuZdcpT6juGkIrPquN6zRthwd3wzu
 0ZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NTg88EBEg4qOXVBL74JDWDn01n0VKUHWmo8g8ottwjk=;
 b=a4OXyMo6MvgVHmeZoB0IZNGk8AdVJI9PvYbItiMN7PC1e9J9tqAs2dbaoCvXgI9Sd/
 3mHzTB3mpZK3GIgJlaHjfoGON1i6bUVT5WU0X65XOxEnGwloYebqiSXVdXUlEv8g1t6j
 g7HKSixR6RRJpa+05EVRK3aK0r2khnFRME3k0gmXJFwDUrtsQ6IziwNa/XcSEMY6Zh0Q
 xZ9EEM5BvfbYnzTVPgq39OmGH39MYxxJR/C0Fys4P+kuLyDkNbUKZnWpF80cBIpTxn6L
 3QbNatLcIy9BOLAXmZOK45ADSOCCtzBE2q8CEfm7SIRBtsQKQj2SPBcouAQSfgAi5zaa
 u8Tg==
X-Gm-Message-State: AGi0PubljUJcKK+UKeol5NlvKSAgDuxNmPUlfY6n42aUwmJs0HE/8Aps
 uxmkZ0cy55CcklZpTglBPyxm/E5o84EJONiDXdM=
X-Google-Smtp-Source: APiQypLRdOptdfBucYqQMnGBtfQiQYTTSA5SWpTYFLPJ+tWQQHwbFT4r0uERcCDlgiqUc8evR7fd9G2UXxUjtwOwvAI=
X-Received: by 2002:a7b:cc8e:: with SMTP id p14mr23079662wma.70.1586869680226; 
 Tue, 14 Apr 2020 06:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <f4eaf0ca-6cd6-c224-9205-bf64ca533ff5@molgen.mpg.de>
 <dcc4851e-0ab5-683a-2cf2-687d64a3c9da@molgen.mpg.de>
 <CADnq5_OXdpEebFY3+kyQb-WEw0Rb6cqoOFKGqgxaigU5hean1g@mail.gmail.com>
 <20200414082150.GD4149624@kroah.com>
In-Reply-To: <20200414082150.GD4149624@kroah.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Apr 2020 09:07:49 -0400
Message-ID: <CADnq5_NCnHFO9kZY-8L34B3uVX5aghXO8+gXNC_cPMOnP7UGAg@mail.gmail.com>
Subject: Re: [regression 5.7-rc1] System does not power off, just halts
To: Greg KH <greg@kroah.com>
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

T24gVHVlLCBBcHIgMTQsIDIwMjAgYXQgNDoyMSBBTSBHcmVnIEtIIDxncmVnQGtyb2FoLmNvbT4g
d3JvdGU6Cj4KPiBPbiBNb24sIEFwciAxMywgMjAyMCBhdCAwMTo0ODo1OFBNIC0wNDAwLCBBbGV4
IERldWNoZXIgd3JvdGU6Cj4gPiBPbiBNb24sIEFwciAxMywgMjAyMCBhdCAxOjQ3IFBNIFBhdWwg
TWVuemVsIDxwbWVuemVsQG1vbGdlbi5tcGcuZGU+IHdyb3RlOgo+ID4gPgo+ID4gPiBEZWFyIFBy
aWtlLCBkZWFyIEFsZXgsIGRlYXIgTGludXggZm9sa3MsCj4gPiA+Cj4gPiA+Cj4gPiA+IEFtIDEz
LjA0LjIwIHVtIDEwOjQ0IHNjaHJpZWIgUGF1bCBNZW56ZWw6Cj4gPiA+Cj4gPiA+ID4gQSByZWdy
ZXNzaW9uIGJldHdlZW4gY2F1c2VzIGEgc3lzdGVtIHdpdGggdGhlIEFNRCBib2FyZCBNU0kgQjM1
ME0gTU9SVEFSCj4gPiA+ID4gKE1TLTdBMzcpIHdpdGggYW4gQU1EIFJ5emVuIDMgMjIwMEcgbm90
IHRvIHBvd2VyIG9mZiBhbnkgbW9yZSBidXQganVzdAo+ID4gPiA+IHRvIGhhbHQuCj4gPiA+ID4K
PiA+ID4gPiBUaGUgcmVncmVzc2lvbiBpcyBpbnRyb2R1Y2VkIGluIDllYmU1NDIyYWQ2Yy4uYjAz
MjIyN2M2MjkzLiBJIGFtIGluIHRoZQo+ID4gPiA+IHByb2Nlc3MgdG8gYmlzZWN0IHRoaXMsIGJ1
dCBtYXliZSBzb21lYm9keSBhbHJlYWR5IGhhcyBhbiBpZGVhLgo+ID4gPgo+ID4gPiBJIGZvdW5k
IHRoZSBFYXN0ZXIgZWdnOgo+ID4gPgo+ID4gPiA+IGNvbW1pdCA0ODdlY2ExMWEzMjFlZjMzYmNm
NGNhNWFkYjNjMGM0OTU0ZGIxYjU4Cj4gPiA+ID4gQXV0aG9yOiBQcmlrZSBMaWFuZyA8UHJpa2Uu
TGlhbmdAYW1kLmNvbT4KPiA+ID4gPiBEYXRlOiAgIFR1ZSBBcHIgNyAyMDoyMToyNiAyMDIwICsw
ODAwCj4gPiA+ID4KPiA+ID4gPiAgICAgZHJtL2FtZGdwdTogZml4IGdmeCBoYW5nIGR1cmluZyBz
dXNwZW5kIHdpdGggdmlkZW8gcGxheWJhY2sgKHYyKQo+ID4gPiA+Cj4gPiA+ID4gICAgIFRoZSBz
eXN0ZW0gd2lsbCBiZSBoYW5nIHVwIGR1cmluZyBTMyBzdXNwZW5kIGJlY2F1c2Ugb2YgU01VIGlz
IHBlbmRpbmcKPiA+ID4gPiAgICAgZm9yIEdDIG5vdCByZXNwb3NlIHRoZSByZWdpc3RlciBDUF9I
UURfQUNUSVZFIGFjY2VzcyByZXF1ZXN0LlRoaXMgaXNzdWUKPiA+ID4gPiAgICAgcm9vdCBjYXVz
ZSBvZiBhY2Nlc3NpbmcgdGhlIEdDIHJlZ2lzdGVyIHVuZGVyIGVudGVyIEdGWCBDR0dQRyBhbmQg
Y2FuCj4gPiA+ID4gICAgIGJlIGZpeGVkIGJ5IGRpc2FibGUgR0ZYIENHUEcgYmVmb3JlIHBlcmZv
cm0gc3VzcGVuZC4KPiA+ID4gPgo+ID4gPiA+ICAgICB2MjogVXNlIGRpc2FibGUgdGhlIEdGWCBD
R1BHIGluc3RlYWQgb2YgUkxDIHNhZmUgbW9kZSBndWFyZC4KPiA+ID4gPgo+ID4gPiA+ICAgICBT
aWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4KPiA+ID4gPiAg
ICAgVGVzdGVkLWJ5OiBNZW5nYmluZyBXYW5nIDxNZW5nYmluZy5XYW5nQGFtZC5jb20+Cj4gPiA+
ID4gICAgIFJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgo+ID4gPiA+
ICAgICBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Cj4gPiA+ID4gICAgIENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiA+Cj4gPiA+IEl0
IHJldmVydHMgY2xlYW5seSBvbiB0b3Agb2YgNS43LXJjMSwgYW5kIHRoaXMgZml4ZXMgdGhlIGlz
c3VlLgo+ID4gPgo+ID4gPiBHcmVnLCBwbGVhc2UgZG8gbm90IGFwcGx5IHRoaXMgdG8gdGhlIHN0
YWJsZSBzZXJpZXMuIFRoZSBjb21taXQgbWVzc2FnZQo+ID4gPiBkb2VzbuKAmXQgZXZlbiByZWZl
cmVuY2UgYSBpc3N1ZS9idWcgcmVwb3J0LCBhbmQgZG9lc27igJl0IGdpdmUgYSBkZXRhaWxlZAo+
ID4gPiBwcm9ibGVtIGRlc2NyaXB0aW9uLiBXaGF0IHN5c3RlbSBpcyBpdD8KPiA+ID4KPiA+ID4g
RGF2ZSwgQWxleCwgaG93IHRvIHByb2NlZWQ/IFJldmVydD8gSSBjcmVhdGVkIGlzc3VlIDEwOTQg
WzFdLgo+ID4KPiA+IEFscmVhZHkgZml4ZWQ6Cj4gPiBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvMzYxMTk1Lwo+Cj4gQW55IHJlYXNvbiB0aGF0IGRvZXNuJ3QgaGF2ZSBh
IGNjOiBzdGFibGUgdGFnIG9uIGl0Pwo+Cj4gQW5kIGlzIGl0IGNvbW1pdHRlZCB0byBhbnkgdHJl
ZSBhdCB0aGUgbW9tZW50PwoKSXQncyBnb2luZyBvdXQgaW4gbXkgLWZpeGVzIHB1bGwgdGhpcyB3
ZWVrIHdpdGggYSBzdGFibGUgdGFnLgoKQWxleAoKPgo+IHRoYW5rcywKPgo+IGdyZWcgay1oCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
