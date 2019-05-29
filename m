Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7D2DBA0
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4989C6E2D3;
	Wed, 29 May 2019 11:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B996E063;
 Wed, 29 May 2019 01:42:31 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id e3so391488ioc.12;
 Tue, 28 May 2019 18:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EoH2CWs7MbhK17fbwkAfBOhK3xMnc8wfuzTcqK+dRok=;
 b=NQ0eR3IANGKRyLBNR4vUhgMtfE55Q3k6vKRiHIXySZW98c25JBTTXY/qp+ee/kkPay
 AeFyirkD+ShbDYOIe0AZnPW3Og04MmNBxLtsDmwAC8mYZZVXDxFC0AJrzAqDgOn9ZIeM
 WqNP+ZLv3kzLJkc7UDKx+NLaZgBr0VIO6uGy5+o0N+cGqoZ3rcMHdLekpUF7cPrn0LIn
 C9nv546m9nqWUx7TGEzi8ZguUJjuLuYerL+wo6TT888yI4bmLY9aBy4nP09/veg2hbre
 qh7w5eixDXTuiAoWWUeMM0khR+CZQ7Ivyj1LrhJG2L+TaA68O/vETJov+wFPMDU3p+Ai
 g4Ew==
X-Gm-Message-State: APjAAAXrFiCw6hUB5vmibXUEK/R9ROMItOF0NOO7l0ii6epQZs4fw+Hm
 Qf/O8G2ENjnNFH8kHPkcLp7uQ/qfbj/PCTYg2vo=
X-Google-Smtp-Source: APXvYqxwxeY+R7quqY3oZRbtrIXfoVBb/W64nxddsmJtcEguN5jt64SgwZTJCAwkvdH/eBAnKMXkPnr9tECqxSYmXJI=
X-Received: by 2002:a05:6602:2001:: with SMTP id
 y1mr7942229iod.166.1559094150520; 
 Tue, 28 May 2019 18:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
 <CAOCk7NrRo2=0fPN_Sy1Bhhy+UV7U6uO5aV9uXZc8kc3VpSt71g@mail.gmail.com>
 <20190529013713.GA13245@basecamp>
In-Reply-To: <20190529013713.GA13245@basecamp>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 28 May 2019 19:42:19 -0600
Message-ID: <CAOCk7NqfdNkRJkbJY70XWN-XvdtFJ0UVn3_9rbgAsNCdR7q5PQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display
 support
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EoH2CWs7MbhK17fbwkAfBOhK3xMnc8wfuzTcqK+dRok=;
 b=t/LCSr8xmnGFbrNlwWwdHzTqfSnxCY2L4yCEWv+eDYxqZr3lB3ryKGh4LzLhjSQNrA
 /RzeI3aRYUCJYc2fpYuKQ6a7s3kTDGOn+u1K6KS95Fy29F/65tEHFbRROzeTZsoFON/J
 6jSXvJvo52WVnjvtiWDpecOIosufjGsRBjuBzdqtMT1rHp7TfW21zouiqAL1lFg9YZq9
 GxkFbgBcbG059EuX4wD2RjgfFV2K7lKeBFUMppxU+n0yhqxCfw3Mk2BGGqk4S/p920Vl
 nC++iL0Zl55Hkb52NgL7I+R7Ap9cWXPWP3S3YW2aTGy1ehGKMAPdZdYzt7AXhHEcmWhf
 ZBxA==
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
Cc: Jonathan Marek <jonathan@marek.ca>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgNzozNyBQTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNzozMjoxNFBN
IC0wNjAwLCBKZWZmcmV5IEh1Z28gd3JvdGU6Cj4gPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCA3
OjE3IFBNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPiB3cm90ZToKPiA+ID4K
PiA+ID4gT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDM6NDY6MTRQTSArMDIwMCwgTGludXMgV2Fs
bGVpaiB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE1heSA5LCAyMDE5IGF0IDQ6MDQgQU0gQnJpYW4g
TWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiBI
ZXJlIGlzIGEgcGF0Y2ggc2VyaWVzIHRoYXQgYWRkcyBpbml0aWFsIGRpc3BsYXkgc3VwcG9ydCBm
b3IgdGhlIExHCj4gPiA+ID4gPiBOZXh1cyA1IChoYW1tZXJoZWFkKSBwaG9uZS4gSXQncyBub3Qg
ZnVsbHkgd29ya2luZyBzbyB0aGF0J3Mgd2h5IHNvbWUKPiA+ID4gPiA+IG9mIHRoZXNlIHBhdGNo
ZXMgYXJlIFJGQyB1bnRpbCB3ZSBjYW4gZ2V0IGl0IGZ1bGx5IHdvcmtpbmcuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gVGhlIHBob25lcyBib290cyBpbnRvIHRlcm1pbmFsIG1vZGUsIGhvd2V2ZXIgdGhl
cmUgaXMgYSBzZXZlcmFsIHNlY29uZAo+ID4gPiA+ID4gKG9yIG1vcmUpIGRlbGF5IHdoZW4gd3Jp
dGluZyB0byB0dHkxIGNvbXBhcmVkIHRvIHdoZW4gdGhlIGNoYW5nZXMgYXJlCj4gPiA+ID4gPiBh
Y3R1YWxseSBzaG93biBvbiB0aGUgc2NyZWVuLiBUaGUgZm9sbG93aW5nIGVycm9ycyBhcmUgaW4g
ZG1lc2c6Cj4gPiA+ID4KPiA+ID4gPiBJIHRlc3RlZCB0byBhcHBseSBwYXRjaGVzIDItNiBhbmQg
Z290IHRoZSBjb25zb2xlIHVwIG9uIHRoZSBwaG9uZSBhcyB3ZWxsLgo+ID4gPiA+IEkgc2VlIHRo
ZSBzYW1lIHRpbW91dHMsIGFuZCBJIGFsc28gbm90aWNlIHRoZSB1cGRhdGUgaXMgc2xvdyBpbiB0
aGUKPiA+ID4gPiBkaXNwbGF5LCBhcyBpZiB0aGUgRFNJIHBhbmVsIHdhcyBydW5uaW5nIGluIGxv
dyBwb3dlciAoTFApIG1vZGUuCj4gPiA+ID4KPiA+ID4gPiBXYXMgYm9vdGluZyB0aGlzIHRvIGRv
IHNvbWUgb3RoZXIgd29yaywgYnV0IGhhcHB5IHRvIHNlZSB0aGUgcHJvZ3Jlc3MhCj4gPiA+Cj4g
PiA+IFRoYW5rcyEKPiA+ID4KPiA+ID4gSSd2ZSBoYWQgdGhyZWUgcGVvcGxlIGVtYWlsIG1lIG9m
ZiBsaXN0IHJlZ2FyZGluZyB0aGUgZGlzcGxheSB3b3JraW5nIG9uCj4gPiA+IDQuMTcgYmVmb3Jl
IHRoZSBtc20ga21zL2RybSBkcml2ZXIgd2FzIGNvbnZlcnRlZCB0byB0aGUgRFJNIGF0b21pYyBB
UEkgc28KPiA+ID4gdGhpcyBlbWFpbCBpcyB0byBnZXQgc29tZSBtb3JlIGluZm9ybWF0aW9uIG91
dCBwdWJsaWNseS4KPiA+ID4KPiA+ID4gSSBwdXNoZWQgdXAgYSBicmFuY2ggdG8gbXkgZ2l0aHVi
IHdpdGggMTUgcGF0Y2hlcyBhcHBsaWVkIGFnYWluc3QgNC4xNwo+ID4gPiB0aGF0IGhhcyBhIHdv
cmtpbmcgZGlzcGxheToKPiA+ID4KPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL21hc25leWIvbGlu
dXgvY29tbWl0cy9kaXNwbGF5LXdvcmtzLTQuMTcKPiA+ID4KPiA+ID4gSXQncyBpbiBsb3cgc3Bl
ZWQgbW9kZSBidXQgaXRzIHVzYWJsZS4gVGhlIGZpcnN0IDEwIHBhdGNoZXMgYXJlIGluCj4gPiA+
IG1haW5saW5lIG5vdyBhbmQgdGhlIGxhc3QgNSBhcmUgaW4gZXNzZW5jZSB0aGlzIHBhdGNoIHNl
cmllcyB3aXRoIHRoZQo+ID4gPiBleGNlcHRpb24gb2YgJ2RybS9hdG9taWMrbXNtOiBhZGQgaGVs
cGVyIHRvIGltcGxlbWVudCBsZWdhY3kgZGlydHlmYicuCj4gPiA+IFRoZXJlJ3MgYSBzbGlnaHRs
eSBkaWZmZXJlbnQgdmVyc2lvbiBvZiB0aGF0IHBhdGNoIGluIG1haW5saW5lIG5vdy4KPiA+ID4K
PiA+ID4gSSdtIHBsYW5uaW5nIHRvIHdvcmsgb24gdGhlIG1zbTg5NzQgaW50ZXJjb25uZWN0IHN1
cHBvcnQgb25jZSBzb21lIG9mCj4gPiA+IHRoZSBvdXRzdGFuZGluZyBpbnRlcmNvbm5lY3QgcGF0
Y2hlcyBmb3IgdGhlIG1zbSBrbXMvZHJtIGRyaXZlciBhcnJpdmUKPiA+ID4gaW4gbWFpbmxpbmUu
IEknZCByZWFsbHkgbGlrZSB0byB1bmRlcnN0YW5kIHdoeSB0aGUgZGlzcGxheSB3b3JrcyBvbgo+
ID4gPiA0LjE3IHdpdGggdGhvc2UgcGF0Y2hlcyB0aG91Z2guIEkgYXNzdW1lIHRoYXQgaXQncyBy
ZWxhdGVkIHRvIHRoZQo+ID4gPiB2YmxhbmsgZXZlbnRzIG5vdCB3b3JraW5nIHByb3Blcmx5PyBM
ZXQgbWUgcHJlZmFjZSB0aGlzIHdpdGggSSdtIGEKPiA+ID4gdG90YWwgRFJNIG5ld2JpZSwgYnV0
IGl0IGxvb2tlZCBsaWtlIHRoZSBwcmUtRFJNLWF0b21pYyBkcml2ZXIgd2Fzbid0Cj4gPiA+IGxv
b2tpbmcgZm9yIHRoZXNlIGV2ZW50cyBpbiB0aGUgYXRvbWljIGNvbW1pdHMgYmVmb3JlIHRoZSBt
aWdyYXRpb24/Cj4gPiA+IFNlZSBjb21taXQgNzBkYjE4ZGNhNGUwICgiZHJtL21zbTogUmVtb3Zl
IG1zbV9jb21taXQvd29ya2VyLCB1c2UgYXRvbWljCj4gPiA+IGhlbHBlciBjb21taXQiKSwgc3Bl
Y2lmaWNhbGx5IHRoZSBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl92YmxhbmtzKCkKPiA+ID4g
Y2FsbCB0aGF0IHdhcyBhZGRlZC4KPiA+Cj4gPiBEbyB5b3Uga25vdyBpZiB0aGUgbmV4dXMgNSBo
YXMgYSB2aWRlbyBvciBjb21tYW5kIG1vZGUgcGFuZWw/ICBUaGVyZQo+ID4gaXMgc29tZSBnbGl0
Y2h5bmVzcyB3aXRoIHZibGFua3MgYW5kIGNvbW1hbmQgbW9kZSBwYW5lbHMuCj4KPiBJdHMgaW4g
Y29tbWFuZCBtb2RlLiBJIGtub3cgdGhpcyBiZWNhdXNlIEkgc2VlIHR3byAncHAgZG9uZSB0aW1l
IG91dCcKPiBtZXNzYWdlcywgZXZlbiBvbiA0LjE3LiBCYXNlZCBvbiBteSB1bmRlcnN0YW5kaW5n
LCB0aGUgcGluZyBwb25nIGNvZGUgaXMKPiBvbmx5IGFwcGxpY2FibGUgZm9yIGNvbW1hbmQgbW9k
ZSBwYW5lbHMuCgpBY3R1YWxseSwgdGhlIHBpbmcgcG9uZyBlbGVtZW50IGV4aXN0cyBpbiBib3Ro
IG1vZGVzLCBidXQgJ3BwIGRvbmUKdGltZSBvdXQnIGlzIGEgZ29vZCBpbmRpY2F0b3IgdGhhdCBp
dCBpcyBjb21tYW5kIG1vZGUuCgpBcmUgeW91IGFsc28gc2VlaW5nIHZibGFuayB0aW1lb3V0cz8K
CkRvIHlvdSBoYXZlIGJ1c3lib3g/CgpDYW4geW91IHJ1biAtCnN1ZG8gYnVzeWJveCBkZXZtZW0g
MHhGRDkwMDYxNApzdWRvIGJ1c3lib3ggZGV2bWVtIDB4RkQ5MDA3MTQKc3VkbyBidXN5Ym94IGRl
dm1lbSAweEZEOTAwODE0CnN1ZG8gYnVzeWJveCBkZXZtZW0gMHhGRDkwMDkxNApzdWRvIGJ1c3li
b3ggZGV2bWVtIDB4RkQ5MDBBMTQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
