Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 267E092250
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 13:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AE96E103;
	Mon, 19 Aug 2019 11:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4C86E103
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 11:27:54 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b1so1311209otp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 04:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uMUy9HNheFvwhhF3MADVvVYEpMXC6JEt3gWUCnpdKDA=;
 b=ICQPvAoeUAWn61kFVfNmTjmrryv90sp39qFKBH5PDLEkeG5UbftQPf03TWBsVsK4JA
 AUH+6CEJXo5tqGofE2wcC6nfia7wj2f1/ncHzKBU+4vKreK32se2ZpiAhnSKXPF0xbyU
 NLRFE+r4VcPKHVYaGsawQPBZQjn9bMrjEV7l9TnRW/QTK4fznnz5KuduAInO/qxRrPg+
 Sa9ftxscaqGEh1PFGPOp9NCCGmaRJCUBUxLgB11GxeikDFzUe6r7NeXAY3Ls712rmo8K
 KY7flpW5EGixGqu//9uwUKG8txsGU+4ZQFs6EU3fXei9AQUqIjs2T58tHDwIqdKaH/0n
 1ezg==
X-Gm-Message-State: APjAAAVbzkAi8yYfU1b7oS8nMdel13Rxxt6h/ds++oKk+/iner+Xly06
 YkmzWldBswFcALw46pHsy0Na65B+LvgZetIxJPk=
X-Google-Smtp-Source: APXvYqxrOczXTrII7JUM0WsLXJcGzNChGOnjbL1P4OV4KmdM204hxVGZqXFBc07ZeeAjByx07XUyWRQtuVerMvQqAI4=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr18460120otn.297.1566214073839; 
 Mon, 19 Aug 2019 04:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190812073020.19109-1-geert@linux-m68k.org>
 <CACRpkdZAA8N6igrNaXcT5m62Fz2irRL-tyRZnjWgsxfacB2aow@mail.gmail.com>
In-Reply-To: <CACRpkdZAA8N6igrNaXcT5m62Fz2irRL-tyRZnjWgsxfacB2aow@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2019 13:27:41 +0200
Message-ID: <CAMuHMdVv=i5nffbN2vZjvHfeV_w74PvZD7ZLuf623H9pnyK14A@mail.gmail.com>
Subject: Re: [PATCH] m68k: atari: Rename shifter to shifter_st to avoid
 conflict
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 kbuild test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Stefan Wahren <wahrenst@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTA6MjggQU0gTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCA5OjMwIEFN
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+ID4gV2hl
biB0ZXN0LWNvbXBpbGluZyB0aGUgQkNNMjgzNSBwaW4gY29udHJvbCBkcml2ZXIgb24gbTY4azoK
PiA+Cj4gPiAgICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGFyY2gvbTY4ay9pbmNsdWRlL2FzbS9p
b19tbS5oOjMyOjAsCj4gPiAgICAgICAgICAgICAgICAgICAgICBmcm9tIGFyY2gvbTY4ay9pbmNs
dWRlL2FzbS9pby5oOjgsCj4gPiAgICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGlu
dXgvaW8uaDoxMywKPiA+ICAgICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9p
cnEuaDoyMCwKPiA+ICAgICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9ncGlv
L2RyaXZlci5oOjcsCj4gPiAgICAgICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvcGluY3Ry
bC9iY20vcGluY3RybC1iY20yODM1LmM6MTc6Cj4gPiAgICAgZHJpdmVycy9waW5jdHJsL2JjbS9w
aW5jdHJsLWJjbTI4MzUuYzogSW4gZnVuY3Rpb24gJ2JjbTI3MTFfcHVsbF9jb25maWdfc2V0JzoK
PiA+ICAgICBhcmNoL202OGsvaW5jbHVkZS9hc20vYXRhcmlody5oOjE5MDoyMjogZXJyb3I6IGV4
cGVjdGVkIGlkZW50aWZpZXIgb3IgJygnIGJlZm9yZSAndm9sYXRpbGUnCj4gPiAgICAgICMgZGVm
aW5lIHNoaWZ0ZXIgKCgqKHZvbGF0aWxlIHN0cnVjdCBTSElGVEVSICopU0hGX0JBUykpCj4gPgo+
ID4gInNoaWZ0ZXIiIGlzIGEgdG9vIGdlbmVyaWMgbmFtZSBmb3IgYSBnbG9iYWwgZGVmaW5pdGlv
bi4KPiA+Cj4gPiBBcyB0aGUgY29ycmVzcG9uZGluZyBkZWZpbml0aW9uIGZvciBBdGFyaSBUVCBp
cyBhbHJlYWR5IGNhbGxlZAo+ID4gInNoaWZ0ZXJfdHQiLCBmaXggdGhpcyBieSByZW5hbWluZyB0
aGUgZGVmaW5pdGlvbiBmb3IgQXRhcmkgU1QgdG8KPiA+ICJzaGlmdGVyX3N0Ii4KPiA+Cj4gPiBS
ZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gPiBTdWdnZXN0
ZWQtYnk6IE1pY2hhZWwgU2NobWl0eiA8c2NobWl0em1pY0BnbWFpbC5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+Cj4gRmlu
YWxseSB3ZSBjYW4gdXNlIHRoZSBzaCBwZmMgcGluIGNvbnRyb2xsZXIgb24gb3VyIG02OGsgQXRh
cmkuCj4KPiBOb3cgaWYgSSBjYW4gb25seSByZXNvbGRlciB0aGUgY2FwYWNpdG9ycyBvbiBteSBB
dGFyaSBUVCBTVAo+IGJlZm9yZSB0aGUgYm9hcmQgc2VsZi1kZXN0cnVjdHMgSSB3aWxsIG9uZSBk
YXkgdGVzdCB0aGlzLgo+Cj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4KClRoYW5rcywgYXBwbGllZCBhbmQgcXVldWVkIGZvciB2NS40LgoKR3J7
b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKCi0tCkdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
