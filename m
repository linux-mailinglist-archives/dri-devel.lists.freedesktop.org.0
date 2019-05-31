Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D7F30DB0
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 14:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB8189312;
	Fri, 31 May 2019 12:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635B78925D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 11:59:59 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id h20so15221041itk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 04:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8hQ+GCrGtuPrUnv8FXJXFq30i6N22Yddc21VC2oAxhs=;
 b=WtCI7KmCdeAEps8FjVYN4cp9qsEHZjXiautn2hoXvcmrBfyO1zp6E/3OnkZuPF/2hL
 8CL3bL0gNisO6bNhO95j5TgiqdZ4dL649fvfHU7Jievb0DhhkmYx1UkmK+YeLNubQnHj
 pF08tM7LA5xtA/pR3VU4NN+OoQQxdrcxJe1655IXykTLhaeXs77mzuHBXNq1Ub6TcVCM
 YGJqkBuW+f3m6CuEdFfAPqS2dQfehl5Qp+BiBF9RLX3KNc4DmBRHgMK7qcSfBUNgPZ2j
 cmoMZZZ3CD8BRXErCP547FIR1XHoPq59KZoLHaZgsDMHyTzPGNTTCn9ZkIXczODDL7hH
 +/3Q==
X-Gm-Message-State: APjAAAWMSgbPCKZQ/k0DkR06miSre3Qt7HcO82PxVjvdT43438WrgdS/
 Br9PrwiFee4l/RzEhsP5ZpF/RVm84x01tC2P+nI=
X-Google-Smtp-Source: APXvYqxt9w2YrsySig7OJuFDGJfyzP1yL3TiF4rpNj+o9AiR0VLFKyM39OG7PDkPrKdvZ8PRQ0gK3c64fLn8KFUlk98=
X-Received: by 2002:a24:5a45:: with SMTP id v66mr6878435ita.140.1559303998746; 
 Fri, 31 May 2019 04:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAJiuCcfSUAJ2w1qd-OC_CJPXoUVL03dCX1OeaUykNioHkR8Ciw@mail.gmail.com>
In-Reply-To: <CAJiuCcfSUAJ2w1qd-OC_CJPXoUVL03dCX1OeaUykNioHkR8Ciw@mail.gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Fri, 31 May 2019 13:59:47 +0200
Message-ID: <CAAObsKBuDDF225otw-2kBKufmpS6ng9feBshUPFKNDGv3pE8Ww@mail.gmail.com>
Subject: Re: Panfrost impossible to probe without opp table
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
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
Cc: Rob Herring <robh+dt@kernel.org>, ezequiel Garcia <ezequiel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyOSBNYXkgMjAxOSBhdCAyMzoyOSwgQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVt
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IEkgaGF2ZSByZWJhc2UgbXkga2VybmVsIG9u
IGxhdGVzdCA1LjItcmMyLCBhbmQgbXkgcGFuZnJvc3QgZHJpdmVyIGlzCj4gbm8gbW9yZSBwcm9i
aW5nLgo+Cj4gVGhlIGlzc3VlIGlzIGNvbWluZyBmcm9tIGYzNjE3YjQ0OWQwYmNmM2I1ZDgwYTk3
ZjUxNDk4ZGNmNzQ2M2NmN2UKPiAgICAgZHJtL3BhbmZyb3N0OiBTZWxlY3QgZGV2ZnJlcQo+Cj4g
ICAgIEN1cnJlbnRseSwgdGhlcmUgaXMgc29tZSBsb2dpYyBmb3IgdGhlIGRyaXZlciB0byB3b3Jr
IHdpdGhvdXQgZGV2ZnJlcS4KPiAgICAgSG93ZXZlciwgdGhlIGRyaXZlciBhY3R1YWxseSBmYWls
cyB0byBwcm9iZSBpZiAhQ09ORklHX1BNX0RFVkZSRVEuCj4KPiAgICAgRml4IHRoaXMgYnkgc2Vs
ZWN0aW5nIGRldmZyZXEsIGFuZCBkcm9wIHRoZSBhZGRpdGlvbmFsIGNoZWNrcwo+ICAgICBmb3Ig
ZGV2ZnJlcS4KPgo+IEl0IHNlZW1zIHRoYXQgd2l0aCB0aGlzIGNvbW1pdCB0aGUgT1BQIHRhYmxl
IGlzIG5vdyBtYW5kYXRvcnkuCj4gaXMgaXQgaW50ZW50aW9uYWw/CgpIaSBDbMOpbWVudCwKCmRl
dmZyZXEgc3VwcG9ydCBpcyBpbnRlbnRpb25hbGx5IHJlcXVpcmVkLiBJIGdvdCBhIEg2NCBib2Fy
ZCB3aGljaCBJJ20KdXNpbmcgdG8gYWRkIFQ3MjAgc3VwcG9ydCB0byBQYW5mcm9zdC4KCk9uY2Ug
SSdtIGFibGUgdG8gdGVzdCB0aGUgR1BVIHByb3Blcmx5IGFsb25nIHdpdGggZnJlcXVlbmN5IHNj
YWxpbmcsIEkKd2lsbCBwaW5nIHlvdSBzbyB5b3UgY2FuIHJldGVzdCBhbmQgcmVzdWJtaXQuCgpU
aGFua3MsCgpUb21ldQoKPiBBY3R1YWxseQo+IFsgICAgMy4wNDYyMzddIHBhbmZyb3N0IDE4MDAw
MDAuZ3B1OiBjbG9jayByYXRlID0gNDMyMDAwMDAwCj4gWyAgICAzLjA1MTU5M10gcGFuZnJvc3Qg
MTgwMDAwMC5ncHU6IGJ1c19jbG9jayByYXRlID0gMTAwMDAwMDAwCj4gWyAgICAzLjA5NjAxMl0g
cGFuZnJvc3QgMTgwMDAwMC5ncHU6IG1hbGktdDcyMCBpZCAweDcyMCBtYWpvciAweDEKPiBtaW5v
ciAweDEgc3RhdHVzIDB4MAo+IFsgICAgMy4xMDM2ODJdIHBhbmZyb3N0IDE4MDAwMDAuZ3B1OiBm
ZWF0dXJlczogMDAwMDAwMDAsMTAzMDllNDAsCj4gaXNzdWVzOiAwMDAwMDAwMCwyMTA1NDQwMAo+
IFsgICAgMy4xMTE3ODldIHBhbmZyb3N0IDE4MDAwMDAuZ3B1OiBGZWF0dXJlczogTDI6MHgwNzEx
MDIwNgo+IFNoYWRlcjoweDAwMDAwMDAwIFRpbGVyOjB4MDAwMDA4MDkgTWVtOjB4MSBNTVU6MHgw
MDAwMjgyMSBBUzoweGYKPiBKUzoweDcKPiBbICAgIDMuMTIzNDM1XSBwYW5mcm9zdCAxODAwMDAw
LmdwdTogc2hhZGVyX3ByZXNlbnQ9MHgzIGwyX3ByZXNlbnQ9MHgxCj4gWyAgICAzLjEzMDQwNV0g
cGFuZnJvc3QgMTgwMDAwMC5ncHU6IEZhdGFsIGVycm9yIGR1cmluZyBkZXZmcmVxIGluaXQKPgo+
IFdpdGggY29tbWl0IHJldmVydGVkCj4gWyAgICAzLjAzODIzNl0gcGFuZnJvc3QgMTgwMDAwMC5n
cHU6IGNsb2NrIHJhdGUgPSA0MzIwMDAwMDAKPiBbICAgIDMuMDQzNTkzXSBwYW5mcm9zdCAxODAw
MDAwLmdwdTogYnVzX2Nsb2NrIHJhdGUgPSAxMDAwMDAwMDAKPiBbICAgIDMuMDg3OTk0XSBwYW5m
cm9zdCAxODAwMDAwLmdwdTogbWFsaS10NzIwIGlkIDB4NzIwIG1ham9yIDB4MQo+IG1pbm9yIDB4
MSBzdGF0dXMgMHgwCj4gWyAgICAzLjA5NTY1OF0gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IGZlYXR1
cmVzOiAwMDAwMDAwMCwxMDMwOWU0MCwKPiBpc3N1ZXM6IDAwMDAwMDAwLDIxMDU0NDAwCj4gWyAg
ICAzLjEwMzc2M10gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IEZlYXR1cmVzOiBMMjoweDA3MTEwMjA2
Cj4gU2hhZGVyOjB4MDAwMDAwMDAgVGlsZXI6MHgwMDAwMDgwOSBNZW06MHgxIE1NVToweDAwMDAy
ODIxIEFTOjB4Zgo+IEpTOjB4Nwo+IFsgICAgMy4xMTU0MTBdIHBhbmZyb3N0IDE4MDAwMDAuZ3B1
OiBzaGFkZXJfcHJlc2VudD0weDMgbDJfcHJlc2VudD0weDEKPiBbICAgIDMuMTIyNzk4XSBbZHJt
XSBJbml0aWFsaXplZCBwYW5mcm9zdCAxLjAuMCAyMDE4MDkwOCBmb3IKPiAxODAwMDAwLmdwdSBv
biBtaW5vciAwCj4KPgo+IFRoYW5rcywKPiBDbMOpbWVudAo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcg
bGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
