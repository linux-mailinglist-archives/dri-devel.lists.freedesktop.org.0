Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0121118282
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D526E833;
	Tue, 10 Dec 2019 08:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD726E517
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 20:05:33 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id a22so1207567ios.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 12:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kIY713aoSEHD/x3u5PlTEokoVSLdWYfrdpPXZFMSPxQ=;
 b=JylfxDZU9Jre6L6QN+kjA1Ig3xs+nah2MG1fWPLyf69hWYqujAozYEURQLLaP5elD9
 LEfUbDdK9AVoMMsn0B/HVbWlVLjXga51iRODPYk9+cXpUjT87fV4ij0TAXpd83is5lCq
 5LyHSOW9MByPohc5Z3nnuUdziogfqN0nRiLs0m8e13je/aVQh27c9/tv5Q4lnaNuzq2O
 6EfAR0hvrxRCxOLxJ1J40RJOeQ9CszPKBwC5ImOond9Yx8dtOz73cACH4SaamM0M6gxq
 1zr54sALDFW4NtZHOUBDc13ebOFZt6Q+UlmZAhcV9yA6csQ5M/YjeNnocwYCUQFaxGJ1
 OPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kIY713aoSEHD/x3u5PlTEokoVSLdWYfrdpPXZFMSPxQ=;
 b=PZUVgYsypk4/idjqF8UtnPIJiL3D5dQcSOV9ZqUFmsJc7GT46T+xUhuZE/Q/pwS34W
 0V4VhTA8xjN7PLTTdEm1562ApGxiHLj4wvf4OiJiBK+qouSa8zMjkwFxEbKzexy1GmqH
 wBD3UyQlsxnur04Ye6CaECzfNqGT6PmMk6FtnkVOV+PdllwT5Gp5tc/DgaMrQI7EcYl4
 HldlZQRlhyCz32t/g2JFb2gsTMRbb1ZNZSPfSTP+Z1cvV5gRTCrr4/XEDWzsZH5V1C9n
 eypaSzWzau6NcE3pLTyqCMAbtgbKAS/uYFAJ8QEmuO9MAIJvQcUrDmCmGLo0XrROSGRM
 Q52w==
X-Gm-Message-State: APjAAAXmHi3vXIZrdlq3I1QudEJC1aT0ibHb53g1sLeB6mQz2XE8sDDj
 +dVmYjEf0H5Nhm15PNYS7kdcmkDhpkNz8fGGQPk=
X-Google-Smtp-Source: APXvYqy8pV0t678lSy5tpzAGPPl7NNyMK/SS0pTYQJIEbUPGHR1AKNsHvrADh5xk5NJJEC9jlPzpKY+6g+PtFvDt/w0=
X-Received: by 2002:a02:950d:: with SMTP id y13mr22133594jah.139.1575921932855; 
 Mon, 09 Dec 2019 12:05:32 -0800 (PST)
MIME-Version: 1.0
References: <20191208105328.15335-1-lukas.bulwahn@gmail.com>
 <1606305704.12702713.1575886917867.JavaMail.zimbra@inria.fr>
In-Reply-To: <1606305704.12702713.1575886917867.JavaMail.zimbra@inria.fr>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 9 Dec 2019 20:05:23 +0100
Message-ID: <CAKXUXMzd1OBdoOToPpuv6fh=eW+mNUPHcFdUjARxx+qBGMw=Bg@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Replace deprecated PTR_RET
To: Julia Lawall <julia.lawall@inria.fr>
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sinclair Yeh <syeh@vmware.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgOSwgMjAxOSBhdCAxMToyMSBBTSBKdWxpYSBMYXdhbGwgPGp1bGlhLmxhd2Fs
bEBpbnJpYS5mcj4gd3JvdGU6Cj4KPiA+IERlOiAiTHVrYXMgQnVsd2FobiIgPGx1a2FzLmJ1bHdh
aG5AZ21haWwuY29tPgo+ID4gw4A6ICJUaG9tYXMgSGVsbHN0cm9tIiA8dGhlbGxzdHJvbUB2bXdh
cmUuY29tPiwgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6ICJEYXZpZCBB
aXJsaWUiIDxhaXJsaWVkQGxpbnV4LmllPiwgIkRhbmllbCBWZXR0ZXIiIDxkYW5pZWxAZmZ3bGwu
Y2g+LCAiU2luY2xhaXIgWWVoIiA8c3llaEB2bXdhcmUuY29tPiwKPiA+IGxpbnV4LWdyYXBoaWNz
LW1haW50YWluZXJAdm13YXJlLmNvbSwga2VybmVsLWphbml0b3JzQHZnZXIua2VybmVsLm9yZywg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywgIkx1a2FzIEJ1bHdhaG4iCj4gPiA8bHVrYXMu
YnVsd2FobkBnbWFpbC5jb20+Cj4gPiBFbnZvecOpOiBEaW1hbmNoZSA4IETDqWNlbWJyZSAyMDE5
IDE4OjUzOjI4Cj4gPiBPYmpldDogW1BBVENIXSBkcm0vdm13Z2Z4OiBSZXBsYWNlIGRlcHJlY2F0
ZWQgUFRSX1JFVAo+Cj4gPiBDb21taXQgNTA4MTA4ZWEyNzQ3ICgiZHJtL3Ztd2dmeDogRG9uJ3Qg
cmVmY291bnQgY29tbWFuZC1idWZmZXIgbWFuYWdlZAo+ID4gcmVzb3VyY2UgbG9va3VwcyBkdXJp
bmcgY29tbWFuZCBidWZmZXIgdmFsaWRhdGlvbiIpIHNsaXBzIGluIHVzZSBvZgo+ID4gZGVwcmVj
YXRlZCBQVFJfUkVULiBVc2UgUFRSX0VSUl9PUl9aRVJPIGluc3RlYWQuCj4gPgo+ID4gQXMgdGhl
IFBUUl9FUlJfT1JfWkVSTyBpcyBhIGJpdCBsb25nZXIgdGhhbiBQVFJfUkVULCB3ZSBpbnRyb2R1
Y2UKPiA+IGxvY2FsIHZhcmlhYmxlIHJldCBmb3IgcHJvcGVyIGluZGVudGF0aW9uIGFuZCBsaW5l
LWxlbmd0aCBsaW1pdHMuCj4KPiBJcyAwIGFjdHVhbGx5IHBvc3NpYmxlPyAgSSBoYXZlIHRoZSBp
bXByZXNzaW9uIHRoYXQgaXQgaXMgbm90LCBidXQgcGVyaGFwcyBJIG1pc3NlZCBzb21ldGhpbmcu
Cj4KCkkgZGlkIG5vdCBzYW5pdHktY2hlY2sgaWYgMCBpcyBwb3NzaWJsZSBiZWZvcmUgcGF0Y2gg
c3VibWlzc2lvbiwganVzdApjbGVhbmluZyB0aGUgc3ludGF0aWMgc3R1ZmYgaGVyZSB0byBwcmVw
YXJlIGZpbmFsIHJlbW92YWwgb2YgdGhlCmRlcHJlY2F0ZWQgUFRSX1JFVC4KQnV0IGFzIGZhciBh
cyBJIHNlZToKCnZtd19jbWRfZHhfY2xlYXJfcmVuZGVydGFyZ2V0X3ZpZXcKLT4gdm13X3ZpZXdf
aWRfdmFsX2FkZAotPiB2bXdfdmlld19sb29rdXAKLT4gdm13X2NtZGJ1Zl9yZXNfbG9va3VwCgp3
aGljaCB3b3VsZCB0aGVuIHJldHVybiBhIHByb3BlciBwb2ludGVyL2Egbm9uIFBUUl9FUlIgdmFs
dWUgYW5kCmhlbmNlLCBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0aGF0IFBUUl9FUlJfT1JfWkVSTyBy
ZXR1cm5zIDAuIEl0IGFsbApsb29rcyBwcmV0dHkgc2FuZS4KCkx1a2FzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
