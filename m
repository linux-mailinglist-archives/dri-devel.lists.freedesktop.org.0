Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4E49E6DC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 13:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E653898C0;
	Tue, 27 Aug 2019 11:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C203898C0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:35:31 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id c7so18354663otp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 04:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GgUvI1wVdSFC0r3GWCGOcOGlAvlCeJNAArDfqz2GV1k=;
 b=W+vfoTpXI+eo3GtDi1VAaW1z7Pp04bd5bLBdCfbskVNU2TGK/KFZn22u22lY+/dw5P
 ftCNVgYYlhezuYOZ83x4ckcZ5ynigK4rpsvPL5eXSYjYMBQY77PB29GU3ST3Tf8o7AxJ
 Y4/tOtyg9Twl0kmlMyHAcktyeW7CHCx1G58SHF8Wyw9LxYBm5rdiloU45WYg8Z2a/+rj
 LZhoBG7H5QJlSNxQUh+9Vy9zLFLVSpdoSUFRRv1+fINo1lR+cXv1kn85gmUO3lb7eeiH
 1FAx5fM/VopLx5W8x9D1uj8Y+KkYudfySmRow4c3osNHPeUxtNj/J+xb/5ulun0YFyMg
 VzFg==
X-Gm-Message-State: APjAAAWw0NhQ6MgeTUoMWHl1E84T3bOm/BGVgX+mYgPLkvfD5Sd6jZ2d
 ObZAlVmte8sR48yqv9wsc7PrNlC/gm7TDbBCa5Y=
X-Google-Smtp-Source: APXvYqzuGRUVrGBTfkJoYYJQgr8dVEdnTZQskFtZVIjmdFjAZjxzC+aNUz5mk5WeR+CUiF+4cLB91dqn+MuGu6EAMv4=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr19650606otn.297.1566905730406; 
 Tue, 27 Aug 2019 04:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190827110854.12574-1-peda@axentia.se>
 <20190827110854.12574-4-peda@axentia.se>
In-Reply-To: <20190827110854.12574-4-peda@axentia.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2019 13:35:19 +0200
Message-ID: <CAMuHMdVkqX7x_D5nf01s-kE=o+y5OLM-5fd3q=2RDKGTcpCfHg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] fbdev: fbmem: avoid exporting fb_center_logo
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

SGkgUGV0ZXIsCgpPbiBUdWUsIEF1ZyAyNywgMjAxOSBhdCAxOjA5IFBNIFBldGVyIFJvc2luIDxw
ZWRhQGF4ZW50aWEuc2U+IHdyb3RlOgo+IFRoZSB2YXJpYWJsZSBpcyBvbmx5IGV2ZXIgdXNlZCBm
cm9tIGZiY29uLmMgd2hpY2ggaXMgbGlua2VkIGludG8gdGhlCj4gc2FtZSBtb2R1bGUuIFRoZXJl
Zm9yZSwgdGhlIGV4cG9ydCBpcyBub3QgbmVlZGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIg
Um9zaW4gPHBlZGFAYXhlbnRpYS5zZT4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0QGxpbnV4LW02OGsub3JnPgoKQnV0IG5vdGUgdGhhdCB0aGUgc2FtZSBpcyB0cnVlIGZv
ciBmYl9jbGFzcywgc28gcGVyaGFwcyBpdCBjYW4gYmUgYWRkZWQKKG9yIGJldHRlciwgcmVtb3Zl
ZCA7LSk/CgpPbmNlIGRyaXZlcnMvc3RhZ2luZy9vbHBjX2Rjb24vb2xwY19kY29uLmMgc3RvcHMg
YWJ1c2luZyByZWdpc3RlcmVkX2ZiW10KYW5kIG51bV9yZWdpc3RlcmVkX2ZiLCB0aG9zZSBjYW4g
Z28sIHRvby4KCkRvZXMgYW55b25lIHJlbWVtYmUgd2h5IGF1MTIwMGZiIGNhbGxzIGZiX3ByZXBh
cmVfbG9nbygpIGFuZCBmYl9zaG93X2xvZ28oKQppdHNlbGY/CgpHcntvZXRqZSxlZXRpbmd9cywK
CiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9y
ZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkg
anVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
