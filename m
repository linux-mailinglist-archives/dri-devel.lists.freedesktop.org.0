Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9D02B44A
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C524F89C8D;
	Mon, 27 May 2019 12:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C6489B51
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 19:41:58 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id x7so1328381ybg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 12:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q19RztagPywupfj/J4DqX3LJhIyXp53CM3bbmnwAQI4=;
 b=Q9aKz5nPsVbGPGUkdqgH52OzyZzIu0WKqjDtPl7Hyvr0u0nBNRScTrgKrNKNUyB5ev
 nELvix77TaQ33glYDTwY55wrrSUDaa16eVEuAwImYL7igv0Yk9toQRuPrn+bD1pMGvCd
 pWohRxHfAyzl1p9Q4PA2k6tkxlOsvOcEtW2RQ5bsi8s9JeKXm3ZRkuueJr/BVY5NFEiN
 DY7DOSuCnB17aoSBxg6cwc8FH76lwBBvRVNoqj7VPGrYR9IC7SIekK4ztPTEDEML0diU
 4e/PoB1r672K/mEo3/ypbMp+5BCGcgUpAruXPP/Lw38sKTkwQNTeAHNAIwNkv4BdpMT5
 +YNA==
X-Gm-Message-State: APjAAAVZ5Dpnn0EaWPCpCdP+HzWTXYHAdtv8NCpU82yhvjw11zquRrPf
 022K+6i8vIG8hgB4NiXB2MAcR0OuzdPv5t3RvXk=
X-Google-Smtp-Source: APXvYqw2xVvUgbCYG8yMU6wkqfSXTHCekPF2FBrZThkJBWJI1JX36gXbv5kknq16+qzBuCEjqhC/PD0it4+M3Z6X3Ac=
X-Received: by 2002:a25:138a:: with SMTP id 132mr41990542ybt.127.1558554117758; 
 Wed, 22 May 2019 12:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190521161102.29620-1-peron.clem@gmail.com>
 <CAL_Jsq+86nNEBzjbf_GLWWrAN91jwU+JQ7zrEoFaT_dxUzVv4A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+86nNEBzjbf_GLWWrAN91jwU+JQ7zrEoFaT_dxUzVv4A@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 22 May 2019 21:41:46 +0200
Message-ID: <CAJiuCcdPXdG1ZcWypJZy_d04c2obEuqFZXna-voMmbK6Au84CA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] Allwinner H6 Mali GPU support
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q19RztagPywupfj/J4DqX3LJhIyXp53CM3bbmnwAQI4=;
 b=UNfDrv//AipAlrKipQXskKoxdJ2WtyHM6zC+iXQvoSKDQ1xWXnw4KTXkT38SsmHf0v
 KIe58FwtZxyDiXkSfZ6M1RstrZLgPH2pQ8C7cPvGvGNym49DipYStwFJgW1yxQw9Thsx
 3qMvEXhUxNkLePzGsWh0whoKXODOhNRybDWn7sfS/Zydbv3kzTXg+AhDEfqLeagQBhoY
 gnR/j3HbggY7pTe+Ycz3AFsB4Dn3WV0jqtN3sjyrbZzdtDPUUStbBZMSL8O3NHW7Q1wK
 UYT8iWI8W15dz490WDuQErQYBf+B36yLyXTxFmeNfEjJFl3XgUAyx8MukKhh+Qw3BWa6
 deFw==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Linux IOMMU <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gV2VkLCAyMiBNYXkgMjAxOSBhdCAyMToyNywgUm9iIEhlcnJpbmcgPHJvYmgr
ZHRAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAxMToxMSBB
TSBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBI
aSwKPiA+Cj4gPiBUaGUgQWxsd2lubmVyIEg2IGhhcyBhIE1hbGktVDcyMCBNUDIgd2hpY2ggc2hv
dWxkIGJlIHN1cHBvcnRlZCBieQo+ID4gdGhlIG5ldyBwYW5mcm9zdCBkcml2ZXIuIFRoaXMgc2Vy
aWVzIGZpeCB0d28gaXNzdWVzIGFuZCBpbnRyb2R1Y2UgdGhlCj4gPiBkdC1iaW5kaW5ncyBidXQg
YSBzaW1wbGUgYmVuY2htYXJrIHNob3cgdGhhdCBpdCdzIHN0aWxsIE5PVCBXT1JLSU5HLgo+ID4K
PiA+IEknbSBwdXNoaW5nIGl0IGluIGNhc2Ugc29tZW9uZSB3YW50IHRvIGNvbnRpbnVlIHRoZSB3
b3JrLgo+ID4KPiA+IFRoaXMgaGFzIGJlZW4gdGVzdGVkIHdpdGggTWVzYTNEIDE5LjEuMC1SQzIg
YW5kIGEgR1BVIGJpdG5lc3MgcGF0Y2hbMV0uCj4gPgo+ID4gT25lIHBhdGNoIGlzIGZyb20gSWNl
bm93eSBaaGVuZyB3aGVyZSBJIGNoYW5nZWQgdGhlIG9yZGVyIGFzIHJlcXVpcmVkCj4gPiBieSBS
b2IgSGVycmluZ1syXS4KPiA+Cj4gPiBUaGFua3MsCj4gPiBDbGVtZW50Cj4gPgo+ID4gWzFdIGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9rc3phcS9tZXNhL3RyZWUvcGFuZnJvc3RfNjRf
MzIKPiA+IFsyXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNjk5ODI5Lwo+
ID4KPiA+Cj4gPiBbICAzNDUuMjA0ODEzXSBwYW5mcm9zdCAxODAwMDAwLmdwdTogbW11IGlycSBz
dGF0dXM9MQo+ID4gWyAgMzQ1LjIwOTYxN10gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IFVuaGFuZGxl
ZCBQYWdlIGZhdWx0IGluIEFTMCBhdCBWQQo+ID4gMHgwMDAwMDAwMDAyNDAwNDAwCj4gPiBbICAz
NDUuMjA5NjE3XSBSZWFzb246IFRPRE8KPiA+IFsgIDM0NS4yMDk2MTddIHJhdyBmYXVsdCBzdGF0
dXM6IDB4ODAwMDAyQzEKPiA+IFsgIDM0NS4yMDk2MTddIGRlY29kZWQgZmF1bHQgc3RhdHVzOiBT
TEFWRSBGQVVMVAo+ID4gWyAgMzQ1LjIwOTYxN10gZXhjZXB0aW9uIHR5cGUgMHhDMTogVFJBTlNM
QVRJT05fRkFVTFRfTEVWRUwxCj4gPiBbICAzNDUuMjA5NjE3XSBhY2Nlc3MgdHlwZSAweDI6IFJF
QUQKPiA+IFsgIDM0NS4yMDk2MTddIHNvdXJjZSBpZCAweDgwMDAKPiA+IFsgIDM0NS43Mjk5NTdd
IHBhbmZyb3N0IDE4MDAwMDAuZ3B1OiBncHUgc2NoZWQgdGltZW91dCwganM9MCwKPiA+IHN0YXR1
cz0weDgsIGhlYWQ9MHgyNDAwNDAwLCB0YWlsPTB4MjQwMDQwMCwgc2NoZWRfam9iPTAwMDAwMDAw
OWUyMDRkZTkKPiA+IFsgIDM0Ni4wNTU4NzZdIHBhbmZyb3N0IDE4MDAwMDAuZ3B1OiBtbXUgaXJx
IHN0YXR1cz0xCj4gPiBbICAzNDYuMDYwNjgwXSBwYW5mcm9zdCAxODAwMDAwLmdwdTogVW5oYW5k
bGVkIFBhZ2UgZmF1bHQgaW4gQVMwIGF0IFZBCj4gPiAweDAwMDAwMDAwMDJDMDBBMDAKPiA+IFsg
IDM0Ni4wNjA2ODBdIFJlYXNvbjogVE9ETwo+ID4gWyAgMzQ2LjA2MDY4MF0gcmF3IGZhdWx0IHN0
YXR1czogMHg4MTAwMDJDMQo+ID4gWyAgMzQ2LjA2MDY4MF0gZGVjb2RlZCBmYXVsdCBzdGF0dXM6
IFNMQVZFIEZBVUxUCj4gPiBbICAzNDYuMDYwNjgwXSBleGNlcHRpb24gdHlwZSAweEMxOiBUUkFO
U0xBVElPTl9GQVVMVF9MRVZFTDEKPiA+IFsgIDM0Ni4wNjA2ODBdIGFjY2VzcyB0eXBlIDB4Mjog
UkVBRAo+ID4gWyAgMzQ2LjA2MDY4MF0gc291cmNlIGlkIDB4ODEwMAo+ID4gWyAgMzQ2LjU2MTk1
NV0gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IGdwdSBzY2hlZCB0aW1lb3V0LCBqcz0xLAo+ID4gc3Rh
dHVzPTB4OCwgaGVhZD0weDJjMDBhMDAsIHRhaWw9MHgyYzAwYTAwLCBzY2hlZF9qb2I9MDAwMDAw
MDBiNTVhOWE4NQo+ID4gWyAgMzQ2LjU3MzkxM10gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IG1tdSBp
cnEgc3RhdHVzPTEKPiA+IFsgIDM0Ni41Nzg3MDddIHBhbmZyb3N0IDE4MDAwMDAuZ3B1OiBVbmhh
bmRsZWQgUGFnZSBmYXVsdCBpbiBBUzAgYXQgVkEKPiA+IDB4MDAwMDAwMDAwMkMwMEI4MAo+ID4K
PiA+IENoYW5nZSBpbiB2NToKPiA+ICAtIFJlbW92ZSBmaXggaW5kZW50Cj4gPgo+ID4gQ2hhbmdl
cyBpbiB2NDoKPiA+ICAtIEFkZCBidXNfY2xvY2sgcHJvYmUKPiA+ICAtIEZpeCBzYW5pdHkgY2hl
Y2sgaW4gaW8tcGd0YWJsZQo+ID4gIC0gQWRkIHZyYW1wLWRlbGF5Cj4gPiAgLSBNZXJnZSBhbGwg
Ym9hcmRzIGludG8gb25lIHBhdGNoCj4gPiAgLSBSZW1vdmUgdXBzdHJlYW1lZCBOZWlsIEEuIHBh
dGNoCj4gPgo+ID4gQ2hhbmdlIGluIHYzIChUaGFua3MgdG8gTWF4aW1lIFJpcGFyZCk6Cj4gPiAg
LSBSZWF1dGhvciBJY2Vub3d5IGZvciBoZXIgcGF0aAo+ID4KPiA+IENoYW5nZXMgaW4gdjIgKFRo
YW5rcyB0byBNYXhpbWUgUmlwYXJkKToKPiA+ICAtIERyb3AgR1BVIE9QUCBUYWJsZQo+ID4gIC0g
QWRkIGNsb2NrcyBhbmQgY2xvY2stbmFtZXMgaW4gcmVxdWlyZWQKPiA+Cj4gPiBDbMOpbWVudCBQ
w6lyb24gKDUpOgo+ID4gICBkcm06IHBhbmZyb3N0OiBhZGQgb3B0aW9uYWwgYnVzX2Nsb2NrCj4g
PiAgIGlvbW11OiBpby1wZ3RhYmxlOiBmaXggc2FuaXR5IGNoZWNrIGZvciBub24gNDgtYml0IG1h
bGkgaW9tbXUKPiA+ICAgZHQtYmluZGluZ3M6IGdwdTogbWFsaS1taWRnYXJkOiBBZGQgSDYgbWFs
aSBncHUgY29tcGF0aWJsZQo+ID4gICBhcm02NDogZHRzOiBhbGx3aW5uZXI6IEFkZCBBUk0gTWFs
aSBHUFUgbm9kZSBmb3IgSDYKPiA+ICAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBBZGQgbWFsaSBH
UFUgc3VwcGx5IGZvciBINiBib2FyZHMKPiA+Cj4gPiBJY2Vub3d5IFpoZW5nICgxKToKPiA+ICAg
ZHQtYmluZGluZ3M6IGdwdTogYWRkIGJ1cyBjbG9jayBmb3IgTWFsaSBNaWRnYXJkIEdQVXMKPgo+
IEkndmUgYXBwbGllZCBwYXRjaGVzIDEgYW5kIDMgdG8gZHJtLW1pc2MuIEkgd2FzIGdvaW5nIHRv
IGRvIHBhdGNoIDQKPiB0b28sIGJ1dCBpdCBkb2Vzbid0IGFwcGx5LgoKVGhhbmtzLAoKSSBoYXZl
IHRyaWVkIHRvIGFwcGxpZWQgb24gZHJtLW1pc2MvZm9yLWxpbnV4LW5leHQgYnV0IGl0IGRvZXNu
J3QgYXBwbHkgdG9vLgpJdCBsb29rcyBsaWtlIGNvbW1pdCBkNWZmMWFkYjM4MDllMmY3NGEzYjU3
Y2VhMmU1N2M4ZTM3ZDY5M2M0IGlzCm1pc3Npbmcgb24gZHJtLW1pc2MgPwpodHRwczovL2dpdGh1
Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0L2Q1ZmYxYWRiMzgwOWUyZjc0YTNiNTdjZWEyZTU3
YzhlMzdkNjkzYzQjZGlmZi1jMzE3MmY1ZDQyMWQ0OTJmZjkxZDdiYjQ0ZGQ0NDkxNwoKQ2zDqW1l
bnQKCj4KPiBQYXRjaCAyIGNhbiBnbyBpbiB2aWEgdGhlIGlvbW11IHRyZWUgYW5kIHRoZSByZXN0
IHZpYSB0aGUgYWxsd2lubmVyIHRyZWUuCj4KPiBSb2IKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
