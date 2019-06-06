Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23FE378FD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 17:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E661C89204;
	Thu,  6 Jun 2019 15:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A3B89204
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 15:56:18 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id f20so1054869ual.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 08:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EkLzot8FxNB8JVUSimoVpMpAwa4mbDz/aR4wh04bK/0=;
 b=WR7CXdoCyCFDjQFuUs3oNQb3a4Ng6vWNJ+YRkANUTQ06B+tv3JvBb+Njd9WkJnSG2P
 qAzhnf1xjj65r6kInYqpaUbpjaqczJjhecn1Rtok52nJMjjXtflRkohA45JP+ziLqBq4
 FSuQW44gxaSf8tzaX5LHo1ctlg3p7ST+tmPkMyn3ERwW81FvLQvXH271+1xUa9AOQdOj
 1fCYc8rr2kprV3I1BwsG028oOaFigyW6RIx02/+FDCtRP2YUz5eIG1vG1oDiJ5RdL6Gw
 7VRFLixMN1I+EFsveavAQot/TaQxyhpKyM2bvgDC+6G83nv6rpobp9AdxBsRs/gN8+YX
 rCig==
X-Gm-Message-State: APjAAAWesH11eiFv7mF/Uci4vw3pKZ0Y8OaFqPEWtoy2gRllX6L7VRU/
 W6kwV//vDkxqugytgFj7NZrPqW3Nh6ATSwJsEDE=
X-Google-Smtp-Source: APXvYqzZbNklStYBxLo6R7gm+wRTW8JkhSd41i05nILCSxM0nk+2WuH7hF5gHI955RJVdcJ9B5ej0M8XdSft4bwYgCc=
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr6428806uaq.106.1559836577627; 
 Thu, 06 Jun 2019 08:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190603004017.7114-1-imirkin@alum.mit.edu>
In-Reply-To: <20190603004017.7114-1-imirkin@alum.mit.edu>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 6 Jun 2019 16:54:26 +0100
Message-ID: <CACvgo52JReikY-Nw_DOsAu6QYf-AaG8d4OKhoD=W68fQR3QSGg@mail.gmail.com>
Subject: Re: [PATCH libdrm 00/10] Add C8, 30bpp and FP16 support to modetest
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EkLzot8FxNB8JVUSimoVpMpAwa4mbDz/aR4wh04bK/0=;
 b=pcGuiKsDAiB2SZnRPLtzMjEjNVBxTCkxY4D7QdGMxNTN4WTjpybbZKNB0JxI/WScTH
 CQU59XdNV/kLciUuteQexKGwlb/oZ7o+1E7Njh0PXSe+SUYejnJdQLK0Eial4c4eSjQf
 o9xQ+3eBpxPahRkJ+mvfntxoQvBYitCt02oKafPbUhN+EmcuXhuGt+M5sd8wcgkdBIVP
 OGv2fZaZaXgq2lboDW/Ptgdlm/pEV9a77pvq1vQ2cOShXmCmovUFR3u7x5MLKWu+F4qb
 Zm87dbgcvGhO2GGPxSHBelkhT3CQZ8BmN69vTgg0hBF4cfGuerrIc3rg3/nR+cCWthzf
 yU+g==
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAzIEp1biAyMDE5IGF0IDAxOjQwLCBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1p
dC5lZHU+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgaW1wcm92ZXMgdGhlIHBhdHRlcm4gZ2VuZXJh
dGlvbiBsb2dpYyB0byBzdXBwb3J0IGFkZGl0aW9uYWwKPiBmb3JtYXRzLCBhcyB3ZWxsIGFzIGEg
bmV3ICJncmFkaWVudCIgcGF0dGVybiAoc2VlIHBhdGNoIGNvbW1lbnRzIG9uIHdoeQo+IEkgZm91
bmQgaXQgdXNlZnVsKS4KPgo+IEZ1cnRoZXJtb3JlLCB0aGVzZSBmb3JtYXRzIGFyZSBwaXBlZCB0
aHJvdWdoIHRvIG1vZGV0ZXN0LCBpbmNsdWRpbmcgdGhlCj4gYWJpbGl0eSB0byBzZXQgYSBnYW1t
YSB0YWJsZSwgd2hpY2ggaXMgbmVjZXNzYXJ5IGZvciB0aGUgQzggaW5kZXhlZAo+IGZvcm1hdC4K
Pgo+IFRoaXMgd2FzIHRlc3RlZCBvbiBub3V2ZWF1LCBhbmQgdXNlZCBmb3IgYnJpbmctdXAgb2Yg
dGhlIEM4LCBYQjMwLCBhbmQKPiBGUDE2IGZvcm1hdHMgb24gdGhlIE5WSURJQSBoYXJkd2FyZSB0
aGF0IHN1cHBvcnRzIHRoZXNlLgo+Cj4gSWxpYSBNaXJraW4gKDEwKToKPiAgIHV0aWw6IGFkZCBD
OCBmb3JtYXQsIHN1cHBvcnQgaXQgd2l0aCBTTVBURSBwYXR0ZXJuCkkgZGlkIG5vdCB2ZXJpZnkg
dGhlIG51bWJlcnMgaW4gdGhpcyBwYXRjaCwgYnV0IGl0IGxvb2tzIHJlYXNvbmFibGU6CkFja2Vk
LWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKPiAgIHV0aWw6
IGZpeCBNQUtFX1JHQkEgbWFjcm8gZm9yIDEwYnBwIG1vZGVzCj4gICB1dGlsOiBhZGQgZ3JhZGll
bnQgcGF0dGVybgo+ICAgdXRpbDogYWRkIGZwMTYgZm9ybWF0IHN1cHBvcnQKPiAgIHV0aWw6IGFk
ZCBjYWlybyBkcmF3aW5nIGZvciAzMGJwcCBmb3JtYXRzIHdoZW4gYXZhaWxhYmxlCj4gICBtb2Rl
dGVzdDogZG9uJ3QgcHJldGVuZCB0aGF0IGF0b21pYyBtb2RlIGluY2x1ZGVzIGEgZm9ybWF0ClRo
ZXJlIGEgc21hbGwsIHdvdWxkIGJlIGdyZWF0IGJ1dCBub3QgcmVxdWlyZWQsIGNvbW1lbnQgaGVy
ZSAocGFydCBvZgp3aGljaCB5b3UgYWRkcmVzc2VkIHdpdGggaW4gMDgvMTApCgo+ICAgbW9kZXRl
c3Q6IGFkZCBhbiBhZGRfcHJvcGVydHlfb3B0aW9uYWwgdmFyaWFudCB0aGF0IGRvZXMgbm90IHBy
aW50Cj4gICAgIGVycm9ycwo+ICAgbW9kZXRlc3Q6IGFkZCBDOCBzdXBwb3J0IHRvIGdlbmVyYXRl
IFNNUFRFIHBhdHRlcm4KPiAgIG1vZGV0ZXN0OiBhZGQgdGhlIGFiaWxpdHkgdG8gc3BlY2lmeSBm
aWxsIHBhdHRlcm5zIG9uIHRoZSBjb21tYW5kbGluZQo+ICAgbW9kZXRlc3Q6IGFkZCBGUDE2IGZv
cm1hdCBzdXBwb3J0Cj4KUGF0Y2hlcyAyLTEwIGFyZQpSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292
IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCi1FbWlsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
