Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9C8297E3
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 14:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3016E0DB;
	Fri, 24 May 2019 12:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489F46E0DB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:15:33 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w13so1424616wru.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 05:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bwgmf3lJOZtZmcYZZcNfojnZ76ujSWCcDjCYzdMdQVc=;
 b=GTucOWKccrLLGRx8ptXnnqtgNArojAvM1JgIVp0JzgIuOPA15jdWKpig8dxH/cfIcD
 SufTOznlj8NliI8x0/guJgCm35W3igs8Y8p2EcJVnXwbbq4gM7meutMhTZBMLb4K2jWf
 8b3HwJXzOX/oy2wXgK9C1XD5MUHAKkyhn6mOPUjpwzDe1ogUElpL6hRIVrjSd1w64UYu
 qVpPHQlr5GoCkdKHak8WSHWQCajs1/b0o2MrNal1SkivI+UV6No3ACBn0v9Fzrq97c+S
 HIN3CvO8a3QPUlg34g+S7EZGDSuPpw4z1pvkrI1OIUO2usEbDcOt3O9QXDr7l2vzSfER
 ZvOg==
X-Gm-Message-State: APjAAAVqswqFC8SIoV9+bBX40B33w5BUMrZXc0yodltySuiYR21w+aB8
 sDo/+DZ47B1yvjQbrPbhiFs=
X-Google-Smtp-Source: APXvYqziJE1Z38A7VxhqMdrjqzqscDp9/3Gb4UkyYUuvipqAIgIKhym97R3p9VOiBPSntVqFybeDYw==
X-Received: by 2002:a5d:6108:: with SMTP id v8mr7446790wrt.150.1558700131984; 
 Fri, 24 May 2019 05:15:31 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id v184sm3641733wma.6.2019.05.24.05.15.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 24 May 2019 05:15:31 -0700 (PDT)
Date: Fri, 24 May 2019 13:14:10 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [PATCH 4/5] drm/vmwgfx: remove custom ioctl io encoding check
Message-ID: <20190524121410.GB6233@arch-x1c3>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
 <20190522164119.24139-4-emil.l.velikov@gmail.com>
 <a2ec4b6f529ffdc6146903decec6b5ba4cab0a1d.camel@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2ec4b6f529ffdc6146903decec6b5ba4cab0a1d.camel@vmware.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bwgmf3lJOZtZmcYZZcNfojnZ76ujSWCcDjCYzdMdQVc=;
 b=ZG+VaQoMyWsNdwrK5HMdVI9KaU8+A0x6yhAEd/IPIZ0fkTBVxd+nm0XGcw1WinlN8x
 XNcEHiD83pkrsqbRMz8Gwtu1nBvEQ5yX/KlybT5HkQcGzcLeE/BPk7lMi+ULdSapt4PO
 2ayXCty2RIsKSQynpyEYPgtSiHC/3p2tu1J4Eqn+xx1/2TzwG3PnjdwYC53hVCMdfC0Q
 BfEZmTUUSsyU8+RysTQaJAL4SDvFtradqkAGuoCarDCYHyVMJuDftTP7ejqUiGwpomhn
 Txcxut48z7IsUxyfizA85XIsDbzp7MW+F2krL8/klDjCxSBChMyWE5xmUL1O/+GImQaT
 Rsvg==
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
Cc: "kernel@collabora.com" <kernel@collabora.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yMywgVGhvbWFzIEhlbGxzdHJvbSB3cm90ZToKPiBIaSwgRW1pbCwKPiAKPiBP
biBXZWQsIDIwMTktMDUtMjIgYXQgMTc6NDEgKzAxMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToKPiA+
IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPiAKPiA+
IERyb3AgdGhlIGN1c3RvbSBpb2N0bCBpbyBlbmNvZGluZyBjaGVjayAtIGNvcmUgZHJtIGRvZXMg
aXQgZm9yIHVzLgo+IAo+IEkgZmFpbCB0byBzZWUgd2hlcmUgdGhlIGNvcmUgZG9lcyB0aGlzLCBv
ciBkbyBJIG1pc3Mgc29tZXRoaW5nPwoKZHJtX2lvY3RsKCkgYWxsb3dzIGZvciB0aGUgZW5jb2Rp
bmcgdG8gYmUgY2hhbmdlZCBhbmQgYXR0cmlidXRlcyB0aGF0IG9ubHkgdGhlCmFwcHJvcHJpYXRl
IHNpemUgaXMgY29waWVkIGluL291dCBvZiB0aGUga2VybmVsLgoKVGVjaG5pY2FsbHkgdGhlIGZ1
bmN0aW9uIGlzIG1vcmUgcmVsYXhlZCByZWxhdGl2ZSB0byB0aGUgdm13Z2Z4IGNoZWNrLCB5ZXQK
c2VlbXMgcGVyZmVjdGx5IHJlYXNvbmFibGUuCgpJcyB0aGVyZSBhbnkgY29ybmVyLWNhc2UgdGhh
dCBpc24ndCBidXQgc2hvdWxkIGJlIGhhbmRsZWQgaW4gZHJtX2lvY3RsKCk/CgotRW1pbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
