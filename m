Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834FF116D11
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 13:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDFF6E433;
	Mon,  9 Dec 2019 12:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951A76E439
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 12:24:21 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-9vbQ7jKzNFq1dk4si83Nzg-1; Mon, 09 Dec 2019 07:24:17 -0500
Received: by mail-qk1-f200.google.com with SMTP id m13so9838959qka.9
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 04:24:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R2wkCojmmyM/eMvArR6da0gzEriG+0Vl5wpoIupE6a0=;
 b=IIyJ8cEvd/jORvTW5vU/DBCxhDw17Q7rMu946hSaX/FR6ED+DR9GIyszVb5nw2AjRX
 J/isYBmSm2sGltuhJQctoWwe8JWfO/hQQkXBFU4iQKbEXyHdH7TMi773c6ne3hS+lqB6
 PopEFJ7tttwV0a96/4T+W5JlSwwI/0+/tZTq4qKepc+3tOd0wpGUtupStgsA1yYgREAI
 ALRB2hx2vbWCtdzXc4lUFhqPFRZMjwmzK7NZxJ9CLwIeN/DWH9E+HGtG4yWuzSi5UR7h
 Akq0vaaHrS1TlLjG88sEyMKmPLRQxJtN4l9w8F/FTeqj4t17+lSDwYdscrpH3h+1+X5y
 hP+w==
X-Gm-Message-State: APjAAAXEVuiCiyqpHeVXaGKdqfMoDpqNolqR5mtAvM/FlKb7y9YyLATP
 Gxn/T8z/P6bHFXQP/QQGVCpoLa49BhtgMHnNhA4mE7ls0NP7yyLniiQHPCp36QH7ZE5SYDXhQTr
 fwjSSZ+TKClgzJcrfcSzNllbxiiF9WwD5vX4MkaE8BHd6
X-Received: by 2002:a37:c57:: with SMTP id 84mr6830061qkm.157.1575894256893;
 Mon, 09 Dec 2019 04:24:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqzuZX+dUghHi7wPyOkamBRcZ36z3Od2tRPaKnHnAmGQD/DMSGgIgQOLFSwroihlGD9ll8sjWxVfTu+lqQTAIVU=
X-Received: by 2002:a37:c57:: with SMTP id 84mr6830033qkm.157.1575894256520;
 Mon, 09 Dec 2019 04:24:16 -0800 (PST)
MIME-Version: 1.0
References: <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
 <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
 <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
 <CAJZ5v0jbh7jz+YQcw-gC5ztmMOc4E9+KFBCy4VGRsRFxBw-gnw@mail.gmail.com>
 <e0eeddf4214f54dfac08e428dfb30cbd39f20680.camel@redhat.com>
 <20191127114856.GZ11621@lahna.fi.intel.com>
 <CACO55tt5SAf24vk0XrKguhh2J=WuKirDsdY7T+u7PsGFCpnFxg@mail.gmail.com>
 <e7aec10d789b322ca98f4b250923b0f14f2b8226.camel@redhat.com>
 <CACO55tu+hT1WGbBn_nxLR=A-X6YWmeuz-UztJKw0QAFQDDV_xg@mail.gmail.com>
 <CAJZ5v0hcONxiWD+jpBe62H1SZ-84iNxT+QCn8mcesB1C7SVWjw@mail.gmail.com>
In-Reply-To: <CAJZ5v0hcONxiWD+jpBe62H1SZ-84iNxT+QCn8mcesB1C7SVWjw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 9 Dec 2019 13:24:04 +0100
Message-ID: <CACO55tu19-14nVnnCpWz3r3nf15j6tGWzHNBRmbbs2R6O4gMCA@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-MC-Unique: 9vbQ7jKzNFq1dk4si83Nzg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575894260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Om3e8U2zV0QaZB81qgLCidrh7Jm1jTyKjoRsq4wAO1A=;
 b=QvGsIaRIkfKOAl1rsoc/fPi7hNNmrw01m+WHaDGNNe0kS3S9CjoHl5nVCZ7CzjMRLiI4IK
 FrJdLJs+5JCytpjy4tuZXPBUccCQJF25c9TqQ+u6pY68O0+zTFZIUX1ubtzbiReLmyFRUq
 le7NYW7ougJeCl62USLyc61EvJ12Dq4=
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgOSwgMjAxOSBhdCAxMjozOSBQTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVs
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBEZWMgOSwgMjAxOSBhdCAxMjoxNyBQTSBL
YXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gYW55Ym9keSBh
bnkgb3RoZXIgaWRlYXM/Cj4KPiBOb3QgeWV0LCBidXQgSSdtIHRyeWluZyB0byBjb2xsZWN0IHNv
bWUgbW9yZSBpbmZvcm1hdGlvbi4KPgo+ID4gSXQgc2VlbXMgdGhhdCBib3RoIHBhdGNoZXMgZG9u
J3QgcmVhbGx5IGZpeAo+ID4gdGhlIGlzc3VlIGFuZCBJIGhhdmUgbm8gaWRlYSBsZWZ0IG9uIG15
IHNpZGUgdG8gdHJ5IG91dC4gVGhlIG9ubHkKPiA+IHRoaW5nIGxlZnQgSSBjb3VsZCBkbyB0byBm
dXJ0aGVyIGludmVzdGlnYXRlIHdvdWxkIGJlIHRvIHJldmVyc2UKPiA+IGVuZ2luZWVyIHRoZSBO
dmlkaWEgZHJpdmVyIGFzIHRoZXkgc3VwcG9ydCBydW5wbSBvbiBUdXJpbmcrIEdQVXMgbm93LAo+
ID4gYnV0IEkndmUgaGVhcmQgdXNlcnMgaGF2aW5nIHNpbWlsYXIgaXNzdWVzIHRvIHRoZSBvbmUg
THl1ZGUgdG9sZCB1cwo+ID4gYWJvdXQuLi4gYW5kIEkgY291bGRuJ3QgdmVyaWZ5IHRoYXQgdGhl
IHBhdGNoZXMgaGVscCB0aGVyZSBlaXRoZXIgaW4gYQo+ID4gcmVsaWFibGUgd2F5Lgo+Cj4gSXQg
bG9va3MgbGlrZSB0aGUgbmV3ZXIgKDgrKSB2ZXJzaW9ucyBvZiBXaW5kb3dzIGV4cGVjdCB0aGUg
R1BVIGRyaXZlcgo+IHRvIHByZXBhcmUgdGhlIEdQVSBmb3IgcG93ZXIgcmVtb3ZhbCBpbiBzb21l
IHNwZWNpZmljIHdheSBhbmQgdGhlCj4gbGF0dGVyIGZhaWxzIGlmIHRoZSBHUFUgaGFzIG5vdCBi
ZWVuIHByZXBhcmVkIGFzIGV4cGVjdGVkLgo+Cj4gQmVjYXVzZSB0ZXN0aW5nIGluZGljYXRlcyB0
aGF0IHRoZSBXaW5kb3dzIDcgcGF0aCBpbiB0aGUgcGxhdGZvcm0KPiBmaXJtd2FyZSB3b3Jrcywg
aXQgbWF5IGJlIHdvcnRoIHRyeWluZyB0byBkbyB3aGF0IGl0IGRvZXMgdG8gdGhlIFBDSWUKPiBs
aW5rIGJlZm9yZSBpbnZva2luZyB0aGUgX09GRiBtZXRob2QgZm9yIHRoZSBwb3dlciByZXNvdXJj
ZQo+IGNvbnRyb2xsaW5nIHRoZSBHUFUgcG93ZXIuCj4KCm9oaCwgdGhhdCBhY3R1YWxseSBtYWtl
cyBzZW5zZS4gRGlkbid0IHRoaW5rIG9mIHRoYXQgeWV0LgoKPiBJZiB0aGUgTWlrYSdzIHRoZW9y
eSB0aGF0IHRoZSBXaW43IHBhdGggc2ltcGx5IHR1cm5zIHRoZSBQQ0llIGxpbmsgb2ZmCj4gaXMg
Y29ycmVjdCwgdGhlbiB3aGF0ZXZlciB0aGUgX09GRiBtZXRob2QgdHJpZXMgdG8gZG8gdG8gdGhl
IGxpbmsKPiBhZnRlciB0aGF0IHNob3VsZCBub3QgbWF0dGVyLgo+CgpCeSB0aGUgd2F5LCBhbmQg
SSB3YXMgb25seSB0aGlua2luZyBhYm91dCBpdCBhZnRlciBzZW5kaW5nIG15IGxhc3QKZW1haWwg
b3V0LCBkbyB5b3UgdGhpbmsgd2Ugc2hvdWxkIGZhaWwgdGhlIHJ1bnRpbWUgcmVzdW1lIHBhdGgg
aWYgdGhlCmRldmljZSBnZXRzIHN0dWNrIGluIGEgcG93ZXIgc3RhdGU/CgpDdXJyZW50bHkgcGNp
IGNvcmUgYWx3YXlzIGNhbGxzIGludG8gdGhlIGRyaXZlciByZWdhcmRsZXNzLCBidXQgbWF5YmUK
Zm9yIEQzY29sZCBpdCByZWFsbHkgbWFrZXMgc2Vuc2UgdG8ganVzdCBiYWlsIGFuZCByZWZ1c2Ug
dG8gcmVzdW1lPyBJCnRoaW5rIEkgdHJpZWQgdGhhdCBhcyBhbiBlYXJseSAiZml4IiBhbmQgbWln
aHQgZXZlbiBoYXZlIGEgcGF0Y2gKYXJvdW5kLiBUaGlzIHNob3VsZCBhdCBsZWFzdCBwcmV2ZW50
IGNyYXNoZXMgaW5zaWRlIGRyaXZlcnMgdHJ5aW5nIHRvCmFjY2VzcyBpbnZhbGlkIG1lbW9yeSBv
ciBnZXR0aW5nIHN0dWNrIGluIGxvb3BzLgoKPiA+IE9uIFdlZCwgTm92IDI3LCAyMDE5IGF0IDg6
NTUgUE0gTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9u
IFdlZCwgMjAxOS0xMS0yNyBhdCAxMjo1MSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4g
PiA+IE9uIFdlZCwgTm92IDI3LCAyMDE5IGF0IDEyOjQ5IFBNIE1pa2EgV2VzdGVyYmVyZwo+ID4g
PiA+IDxtaWthLndlc3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwg
Tm92IDI2LCAyMDE5IGF0IDA2OjEwOjM2UE0gLTA1MDAsIEx5dWRlIFBhdWwgd3JvdGU6Cj4gPiA+
ID4gPiA+IEhleS10aGlzIGlzIGFsbW9zdCBjZXJ0YWlubHkgbm90IHRoZSByaWdodCBwbGFjZSBp
biB0aGlzIHRocmVhZCB0bwo+ID4gPiA+ID4gPiByZXNwb25kLAo+ID4gPiA+ID4gPiBidXQgdGhp
cyB0aHJlYWQgaGFzIGdvdHRlbiBzbyBkZWVwIGV2b2x1dGlvbiBjYW4ndCBwdXNoIHRoZSBzdWJq
ZWN0Cj4gPiA+ID4gPiA+IGZ1cnRoZXIgdG8KPiA+ID4gPiA+ID4gdGhlIHJpZ2h0LCBoZWguIFNv
IEknbGwganVzdCByZXNwb25kIGhlcmUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gOikKPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IEkndmUgYmVlbiBmb2xsb3dpbmcgdGhpcyBhbmQgaGVscGluZyBvdXQgS2Fy
b2wgd2l0aCB0ZXN0aW5nIGhlcmUgYW5kCj4gPiA+ID4gPiA+IHRoZXJlLgo+ID4gPiA+ID4gPiBU
aGV5IGhhZCBtZSB0ZXN0IEJqb3JuJ3MgUENJIGJyYW5jaCBvbiB0aGUgWDEgRXh0cmVtZSAybmQg
Z2VuZXJhdGlvbiwKPiA+ID4gPiA+ID4gd2hpY2gKPiA+ID4gPiA+ID4gaGFzIGEgdHVyaW5nIEdQ
VSBhbmQgODA4NjoxOTAxIFBDSSBicmlkZ2UuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEkgd2Fz
IGFib3V0IHRvIHNheSAidGhlIHBhdGNoIGZpeGVkIHRoaW5ncywgaG9vcmF5ISIgYnV0IGl0IHNl
ZW1zIHRoYXQKPiA+ID4gPiA+ID4gYWZ0ZXIKPiA+ID4gPiA+ID4gdHJ5aW5nIHJ1bnRpbWUgc3Vz
cGVuZC9yZXN1bWUgYSBjb3VwbGUgdGltZXMgdGhpbmdzIGZhbGwgYXBhcnQgYWdhaW46Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gWW91IG1lYW4gJHN1YmplY3QgcGF0Y2gsIG5vPwo+ID4gPiA+ID4KPiA+
ID4gPgo+ID4gPiA+IG5vLCBJIHRvbGQgTHl1ZGUgdG8gdGVzdCB0aGUgcGNpL3BtIGJyYW5jaCBh
cyB0aGUgcnVucG0gZXJyb3JzIHdlIHNhdwo+ID4gPiA+IG9uIHRoYXQgbWFjaGluZSBsb29rZWQg
ZGlmZmVyZW50LiBTb21lIEJBUiBlcnJvciB0aGUgR1BVIHJlcG9ydGVkCj4gPiA+ID4gYWZ0ZXIg
aXQgZ290IHJlc3VtZWQsIHNvIEkgd2FzIHdvbmRlcmluZyBpZiB0aGUgZGVsYXlzIHdlcmUgaGVs
cGluZwo+ID4gPiA+IHdpdGggdGhhdC4gQnV0IGFmdGVyIHNvbWUgY3ljbGVzIGl0IHN0aWxsIGNh
dXNlZCB0aGUgc2FtZSBpc3N1ZSwgdGhhdAo+ID4gPiA+IHRoZSBHUFUgZGlzYXBwZWFyZWQuIExh
dGVyIHRlc3RpbmcgYWxzbyBzaG93ZWQgdGhhdCBteSBwYXRjaCBhbHNvCj4gPiA+ID4gZGlkbid0
IHNlZW0gdG8gaGVscCB3aXRoIHRoaXMgZXJyb3Igc2FkbHkgOi8KPiA+ID4gPgo+ID4gPiA+ID4g
PiBbICA2ODYuODgzMjQ3XSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBzdXNwZW5kaW5nIG9i
amVjdCB0cmVlLi4uCj4gPiA+ID4gPiA+IFsgIDc1Mi44NjY0ODRdIEFDUEkgRXJyb3I6IEFib3J0
aW5nIG1ldGhvZCBcX1NCLlBDSTAuUEVHMC5QRUdQLk5WUE8gZHVlCj4gPiA+ID4gPiA+IHRvIHBy
ZXZpb3VzIGVycm9yIChBRV9BTUxfTE9PUF9USU1FT1VUKSAoMjAxOTA4MTYvcHNwYXJzZS01Mjkp
Cj4gPiA+ID4gPiA+IFsgIDc1Mi44NjY1MDhdIEFDUEkgRXJyb3I6IEFib3J0aW5nIG1ldGhvZCBc
X1NCLlBDSTAuUEdPTiBkdWUgdG8KPiA+ID4gPiA+ID4gcHJldmlvdXMgZXJyb3IgKEFFX0FNTF9M
T09QX1RJTUVPVVQpICgyMDE5MDgxNi9wc3BhcnNlLTUyOSkKPiA+ID4gPiA+ID4gWyAgNzUyLjg2
NjUyMV0gQUNQSSBFcnJvcjogQWJvcnRpbmcgbWV0aG9kIFxfU0IuUENJMC5QRUcwLlBHMDAuX09O
IGR1ZQo+ID4gPiA+ID4gPiB0byBwcmV2aW91cyBlcnJvciAoQUVfQU1MX0xPT1BfVElNRU9VVCkg
KDIwMTkwODE2L3BzcGFyc2UtNTI5KQo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgaXMgcHJvYmFi
bHkgdGhlIGN1bHByaXQuIFRoZSBzYW1lIEFNTCBjb2RlIGZhaWxzIHRvIHByb3Blcmx5IHR1cm4K
PiA+ID4gPiA+IG9uIHRoZSBkZXZpY2UuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSXMgYWNwaWR1bXAg
ZnJvbSB0aGlzIHN5c3RlbSBhdmFpbGFibGUgc29tZXdoZXJlPwo+ID4gPgo+ID4gPiBBdHRhY2hl
ZCBpdCB0byB0aGlzIGVtYWlsCj4gPiA+Cj4gPiA+ID4gPgo+ID4gPiAtLQo+ID4gPiBDaGVlcnMs
Cj4gPiA+ICAgICAgICAgTHl1ZGUgUGF1bAo+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
