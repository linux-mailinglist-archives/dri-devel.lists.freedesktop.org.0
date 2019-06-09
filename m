Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1C93A441
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 09:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0E789271;
	Sun,  9 Jun 2019 07:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7F489271
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2019 07:54:43 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id b11so4508981lfa.5
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2019 00:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Qx4/qdUcALjIorcXjs7AxmiMGoinkmfGOdHptpmwpU=;
 b=e+6S3WJY1yXagxXgMopwZt6snMPxl4x/Iu7026xg1vSnhjlikWemhcxsWMpJgn4EAG
 PV7eVltepnhieFORQxR59mxyPNZx/YK73cLPh5fHt/aBl00+wDZ31dZNmPI4kldtYoJF
 u2iWP5UQ7OXMvdnxqd/LQDSpdqbzQjpFRo9z4FFSpAAFfz6/GkchTkVe805LWBJmRdhQ
 2gdaw/W6RfklnCs4RIhY9TWuetZcftPinhpuWXSPrwtkp/7/TTttKcl8gayqdc3TT0bk
 EdJ8RMmTxSEoN+BmFFTy27oQeV6e3x+j9ZYqGoaQe42r2QAlDu/pK2uoPje2AzYxP9An
 Xv3A==
X-Gm-Message-State: APjAAAXTftVD4uX4KC3P3z+406X7W1d6Hfh59eQnvKVIXhocYHQxqZw/
 qV+6NT16hZkBWG1sNpB6kaZHwypXsssDb9qS5sI=
X-Google-Smtp-Source: APXvYqwAkUTnyc4orITPqql8Dcq/2FZxVHDXSWXEX68+M70BfTiu1lPz3E0qFz5+GRtrzFsL1+dJET1c4NH3BB9tQiI=
X-Received: by 2002:ac2:5467:: with SMTP id e7mr7954978lfn.23.1560066881888;
 Sun, 09 Jun 2019 00:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560045490.git.mchehab+samsung@kernel.org>
 <f7f9c692a870f836e5657b8a763d751b6ac0e86e.1560045490.git.mchehab+samsung@kernel.org>
In-Reply-To: <f7f9c692a870f836e5657b8a763d751b6ac0e86e.1560045490.git.mchehab+samsung@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 9 Jun 2019 09:54:29 +0200
Message-ID: <CAMuHMdUyvZ89=P4GOY-BkyS45cj66STgZe9gN3q0L+sj-Wc+wg@mail.gmail.com>
Subject: Re: [PATCH v3 10/33] docs: fb: convert docs to ReST and rename to
 *.rst
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Bernie Thompson <bernie@plugable.com>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maik Broemme <mbroemme@libmpq.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Michal Januszewski <spock@gentoo.org>, Jiri Slaby <jslaby@suse.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF1cm8sCgpPbiBTdW4sIEp1biA5LCAyMDE5IGF0IDQ6MjkgQU0gTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiCjxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4gVGhlIGNvbnZlcnNp
b24gaXMgYWN0dWFsbHk6Cj4gICAtIGFkZCBibGFuayBsaW5lcyBhbmQgaWRlbnRhdGlvbiBpbiBv
cmRlciB0byBpZGVudGlmeSBwYXJhZ3JhcGhzOwo+ICAgLSBmaXggdGFibGVzIG1hcmt1cHM7Cj4g
ICAtIGFkZCBzb21lIGxpc3RzIG1hcmt1cHM7Cj4gICAtIG1hcmsgbGl0ZXJhbCBibG9ja3M7Cj4g
ICAtIGFkanVzdCB0aXRsZSBtYXJrdXBzLgo+Cj4gQXQgaXRzIG5ldyBpbmRleC5yc3QsIGxldCdz
IGFkZCBhIDpvcnBoYW46IHdoaWxlIHRoaXMgaXMgbm90IGxpbmtlZCB0bwo+IHRoZSBtYWluIGlu
ZGV4LnJzdCBmaWxlLCBpbiBvcmRlciB0byBhdm9pZCBidWlsZCB3YXJuaW5ncy4KPgo+IFNpZ25l
ZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitzYW1zdW5nQGtlcm5lbC5v
cmc+CgpUaGFua3MhCgo+IC0tLSBhL0RvY3VtZW50YXRpb24vZmIvZnJhbWVidWZmZXIudHh0Cj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9mYi9mcmFtZWJ1ZmZlci5yc3QKPiBAQCAtMSw1ICsxLDYgQEAK
PiAtICAgICAgICAgICAgICAgICAgICAgICBUaGUgRnJhbWUgQnVmZmVyIERldmljZQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKz09PT09PT09PT09
PT09PT09PT09PT09Cj4gK1RoZSBGcmFtZSBCdWZmZXIgRGV2aWNlCj4gKz09PT09PT09PT09PT09
PT09PT09PT09Cj4KPiAgTWFpbnRhaW5lZCBieSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPgoKSSdtIGhhcHB5IHRvIHNlZSB0aGlzIGxpbmUgZHJvcHBlZCA7LSkKCj4g
IExhc3QgcmV2aXNlZDogTWF5IDEwLCAyMDAxCgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
