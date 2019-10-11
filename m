Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEE3D3C84
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 11:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BC36EBF3;
	Fri, 11 Oct 2019 09:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC666EBF3;
 Fri, 11 Oct 2019 09:36:25 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id w67so6563889lff.4;
 Fri, 11 Oct 2019 02:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qlK9gLf5RoF6ICNJqAb4e5paI/AKdb6mnn7W5mQFGS0=;
 b=JGGKBZAKULOjpg4YtUy/mTkoY5SBSAbalPHdMfaNWM8MEJXdrAEnNJxwg9HuxFUTQH
 vc+cMDiBv3f4xUyQSnVce5qlJlSSPw7CjL25ZV4FGfdn528KBaP+e28fY4tw4h8/atkw
 3J9WSWK3bETipf8BCsB+a8+CuKacMd2tl7L10oLvrgFlFIZt6gX68TUXMiBwp6ChkKrm
 h/JxEwbO5VRr71JIqAHi3luP1USTrvX+tIaxtJuecBT32+YvTcxvz4Rbqi4I8+0qKOQ3
 hfbOf3IYZNK1Vpj/763bscHjjajsj6bc446CXsQsdtC9wHE86zPp9u50h+Q5kxZ/nvXK
 5JBw==
X-Gm-Message-State: APjAAAXumxemQ/kFiSunG5ARRavyJdqV8WzIxIVL+gZCR+a6i7jyVzcZ
 UnojwUq7SJtttfvonBYho8Y=
X-Google-Smtp-Source: APXvYqzjdCwjHmD1OUcUAPcjISlrTMTsyvKPvNaG5NGSDzSHzWzFAkSASl1KZH637V4hkoJQOY7nGw==
X-Received: by 2002:a19:23cc:: with SMTP id j195mr8266076lfj.91.1570786584009; 
 Fri, 11 Oct 2019 02:36:24 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id c16sm1961403lfj.8.2019.10.11.02.36.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Oct 2019 02:36:23 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
 (envelope-from <johan@kernel.org>)
 id 1iIrLd-0007T3-Ez; Fri, 11 Oct 2019 11:36:34 +0200
Date: Fri, 11 Oct 2019 11:36:33 +0200
From: Johan Hovold <johan@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/4] treewide: fix interrupted release
Message-ID: <20191011093633.GD27819@localhost>
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010135043.GA16989@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010135043.GA16989@phenom.ffwll.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Al Viro <viro@zeniv.linux.org.uk>, freedreno@lists.freedesktop.org,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Johan Hovold <johan@kernel.org>,
 Fabien Dessenne <fabien.dessenne@st.com>, linux-kernel@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDM6NTA6NDNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIE9jdCAxMCwgMjAxOSBhdCAwMzoxMzoyOVBNICswMjAwLCBKb2hhbiBI
b3ZvbGQgd3JvdGU6Cj4gPiBUd28gb2xkIFVTQiBkcml2ZXJzIGhhZCBhIGJ1ZyBpbiB0aGVtIHdo
aWNoIGNvdWxkIGxlYWQgdG8gbWVtb3J5IGxlYWtzCj4gPiBpZiBhbiBpbnRlcnJ1cHRlZCBwcm9j
ZXNzIHJhY2VkIHdpdGggYSBkaXNjb25uZWN0IGV2ZW50Lgo+ID4gCj4gPiBUdXJucyBvdXQgd2Ug
aGFkIGEgZmV3IG1vcmUgZHJpdmVyIGluIG90aGVyIHN1YnN5c3RlbXMgd2l0aCB0aGUgc2FtZQo+
ID4ga2luZCBvZiBidWcgaW4gdGhlbS4KCj4gUmFuZG9tIGZ1bm55IGlkZWE6IENvdWxkIHdlIGRv
IHNvbWUgZGVidWcgYW5ub3RhdGlvbnMgKGFraW4gdG8KPiBtaWdodF9zbGVlcCkgdGhhdCBzcGxh
dHMgd2hlbiB5b3UgbWlnaHRfc2xlZXBfaW50ZXJydXB0aWJsZSBzb21ld2hlcmUKPiB3aGVyZSBp
bnRlcnJ1cHRpYmxlIHNsZWVwcyBhcmUgZ2VuZXJhbGx5IGEgYmFkIGlkZWE/IExpa2UgaW4KPiBm
b3BzLT5yZWxlYXNlPwoKVGhlcmUncyBub3RoaW5nIHdyb25nIHdpdGggaW50ZXJydXB0aWJsZSBz
bGVlcCBpbiBmb3BzLT5yZWxlYXNlIHBlciBzZSwKaXQncyBqdXN0IHRoYXQgZHJpdmVycyBjYW5u
b3QgcmV0dXJuIC1FUkVTVEFSVFNZUyBhbmQgZnJpZW5kcyBhbmQgZXhwZWN0CnRvIGJlIGNhbGxl
ZCBhZ2FpbiBsYXRlci4KClRoZSByZXR1cm4gdmFsdWUgZnJvbSByZWxlYXNlKCkgaXMgaWdub3Jl
ZCBieSB2ZnMsIGFuZCBhZGRpbmcgYSBzcGxhdCBpbgpfX2ZwdXQoKSB0byBjYXRjaCB0aGVzZSBi
dWdneSBkcml2ZXJzIG1pZ2h0IGJlIG92ZXJraWxsLgoKSm9oYW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
