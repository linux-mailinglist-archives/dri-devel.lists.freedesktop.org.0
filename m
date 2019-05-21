Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F90251A2
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 16:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F32589349;
	Tue, 21 May 2019 14:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E5189349
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 14:12:54 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id d128so11210101vsc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 07:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=meuwVDcWiHzKd3QLlto0JwOFJrZ32Pszf+ArvDouslQ=;
 b=A5ch0QRtLBXKe0x9u1FCyIwm174icONTu6p0GMXZ9aNmT9Ax29qmEBleqtdAgwpQd4
 RUAwpQirPV5ZUsU+uP6aeeN8bWKJEG3nJn4SHlzO+Yg7DmHVOGQf3X+4uVGBvT9jfV93
 29OjMOs7f7+XDoch/ujIj/3fNaYaRG0+1Qd5zSl4Ai2O4+Gu6REiY1lfbH2Xu+RxGaMW
 4rhuppzQgWHAf/LgedsPLcSQBAzJ+5R+Gp8mlhzY8ZQDS6yKhw84UH11J6wOezVPYmAX
 ZsoXB/UzzQICEFtO8QwLR4Z11OE9lbM+mVT/XayGRgWxTrFFwfRS0+xoSjTdvWui0eAD
 h/UA==
X-Gm-Message-State: APjAAAVPJrGU/JuDszwBpK1EMlB6d/ecGQOjHJI5MQXQG92a9QJoLsNw
 WWkSpjY8CdP2ONb9fjFc9dM1v2eCfKYR7Slv8vM=
X-Google-Smtp-Source: APXvYqwgTAAhKI1NXLdbqAMXLmcBRGxa1dy1X2cOKTmSVbVHteKudBaqituHCBTIggl5J5pblm4A0uFUEyZw0ler8Ys=
X-Received: by 2002:a67:770f:: with SMTP id s15mr31142617vsc.11.1558447973350; 
 Tue, 21 May 2019 07:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190521140244eucas1p244e5e1306a52021a4a0c3910098c4f7c@eucas1p2.samsung.com>
 <50411fd1-9da0-aab6-709e-749d5e0ce509@samsung.com>
In-Reply-To: <50411fd1-9da0-aab6-709e-749d5e0ce509@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 May 2019 16:12:41 +0200
Message-ID: <CAMuHMdVbFaY583xJMd9kkW=-dQDY_yPAeToQT854kWFvokECLw@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: atafb: remove superfluous function
 prototypes
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgNDowMiBQTSBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6
CjxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+IHdyb3RlOgo+IE5vIG5lZWQgZm9yIHRoZW0uCj4K
PiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiBTaWduZWQt
b2ZmLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5j
b20+CgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0t
IApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMy
IC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
