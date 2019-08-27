Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708179E6B1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 13:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071F689AB6;
	Tue, 27 Aug 2019 11:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A4B89AB6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:25:17 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id m24so18276623otp.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 04:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8+QWSwWcojaDdjJrlxzolY9DpOXYYC/c2KNNIAQNvxc=;
 b=WsSZIATyKx2/Hl/ohzCpyvCiJmVf0IseA36P2SmhMvpAjCGYuXUanlbFU08fyqQowP
 9Nbehk2sHLG3gSXNAhOkjeHHLImbXfnAqrtQvm7kY4A7AyKJhDwPaj4xZtT3ZIe3w5eR
 kfTVH7wgmbIOEeEBQuVF2xHQCjChWZdorj42btNmPb4iHRL42NAbD99E6N/S1uWqtKwZ
 X+0nyuQElaOBzDZonU4/e5zPXauhqHZjQqs6hs711QqQpOUXzJ00puaIKCYCbxRFc/kv
 +V6YHfNI/gRj2AcXdKtCZkfauSYuYXZL8+nghCXjY6PyteH6bib1hawvYbLw/FX/AbjX
 p9sw==
X-Gm-Message-State: APjAAAUvJCnCtBQdGUeVOseP4zSeM9xznzlDIT5MPPURIpZKmyqCvSAO
 io3ZZAjbrAb3NxW4LX+tecTZ/Cp2GjuZjDDMQrA=
X-Google-Smtp-Source: APXvYqw+f7CKWP0dcOY1+7xVWxHjSrtt9IPmRKrLF7GZ2GTvQuuOyd5CeqlxVccIcLk5TLxv4hUggtxpgVwJfYzd5ew=
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr16391328otg.107.1566905116634; 
 Tue, 27 Aug 2019 04:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190827110854.12574-1-peda@axentia.se>
 <20190827110854.12574-2-peda@axentia.se>
In-Reply-To: <20190827110854.12574-2-peda@axentia.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2019 13:25:05 +0200
Message-ID: <CAMuHMdWzMSGeBrLK6TnUwJrtNqif_vgW1RTYzZXxQ9Qh5x6qTQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] fbdev: fix numbering of fbcon options
To: Peter Rosin <peda@axentia.se>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTowOSBQTSBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlh
LnNlPiB3cm90ZToKPiBUaHJlZSBzaGFsbCBiZSB0aGUgbnVtYmVyIHRob3Ugc2hhbHQgY291bnQs
IGFuZCB0aGUgbnVtYmVyIG9mIHRoZQo+IGNvdW50aW5nIHNoYWxsIGJlIHRocmVlLiBGb3VyIHNo
YWx0IHRob3Ugbm90IGNvdW50Li4uCj4KPiBPbmUhIFR3byEgRml2ZSEKPgo+IEZpeGVzOiBlZmI5
ODVmNmIyNjUgKCJbUEFUQ0hdIGZiY29uOiBDb25zb2xlIFJvdGF0aW9uIC0gQWRkIGZyYW1lYnVm
ZmVyIGNvbnNvbGUgZG9jdW1lbnRhdGlvbiIpCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgUm9zaW4g
PHBlZGFAYXhlbnRpYS5zZT4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGlu
dXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVy
IiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
