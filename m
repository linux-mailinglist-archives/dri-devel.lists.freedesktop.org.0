Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CC46E297
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 10:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF886E5C4;
	Fri, 19 Jul 2019 08:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5196E5C4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 08:34:17 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id g18so22671161qkl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 01:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t40DO/X7sJQ9uYQ+vcbmJFxeNmL+Zvgj4hLPmtUltGU=;
 b=sRHEY0bz4jEDN428vFq/1dFQwwSZ3E8AulHj1nSGRRrY8v9aFb/Y79sLc/Vks5kEQJ
 mSQn9gnooYf3Nz3pC5Sp3zTlXbDivmy7juqG/gpmDQjX5M5QuIyt+v0LDA3atnSUaGc6
 f02DbUtJBA5YvoywSgSgnf+1Tcm/W5LgTOj3HKbY14m1Jtj12GYBu+sbiByJkBsXWRME
 eYKXxNGmQlax7+TlkEua5B0XC6KEuQaUz+nzEZlmOIm54K7Qf1zWNavscYGkqREyK4y3
 1pAVLCwFz5de5xjJFeH79GGxDWHusT7dNCsw5vTtNPmxiZT9kxsU7Xhl+AfHZohhT4aG
 Ic5Q==
X-Gm-Message-State: APjAAAWXrDVy0aBVOPC1ge091XRJZXG+brzvuuiL7wfSwGSkreQxjRNw
 p8OiLd7pnL6FkfjC+uG2DsOmAAglQu/ZOJ4RFXg=
X-Google-Smtp-Source: APXvYqzLBYBJfvV/xjeS7wyaBBemab3RFfVOUtSyHzF7pehxyxR0cNpK6EPy9RAOht/iLf/RIFx1Owo2gClrrMbcQ4A=
X-Received: by 2002:a37:4ac3:: with SMTP id
 x186mr32994894qka.138.1563525256510; 
 Fri, 19 Jul 2019 01:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022@epcas3p3.samsung.com>
 <20190718134240.2265724-1-arnd@arndb.de>
 <763005f0-fc66-51bc-fcfe-3ae4942a9c07@samsung.com>
In-Reply-To: <763005f0-fc66-51bc-fcfe-3ae4942a9c07@samsung.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 19 Jul 2019 10:33:59 +0200
Message-ID: <CAK8P3a2rJ1WqWZ8VtOZZ5YwFrg5bpVve_kS4utL0MjeBUzrLew@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: fix RC_CORE dependency
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgOTowMSBBTSBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPiB3cm90ZToKPgo+IE9uIDE4LjA3LjIwMTkgMTU6NDIsIEFybmQgQmVyZ21hbm4g
d3JvdGU6Cj4gPiBVc2luZyAnaW1wbHknIGNhdXNlcyBhIG5ldyBwcm9ibGVtLCBhcyBpdCBhbGxv
d3MgdGhlIGNhc2Ugb2YKPiA+IENPTkZJR19JTlBVVD1tIHdpdGggUkNfQ09SRT15LCB3aGljaCBm
YWlscyB0byBsaW5rOgo+Cj4KPiBJIGhhdmUgcmV2aWV3ZWQgZGVwZW5kZW5jaWVzIGFuZCBJIHdv
bmRlciBob3cgc3VjaCBjb25maWd1cmF0aW9uIGlzCj4gcG9zc2libGUgYXQgYWxsLgo+Cj4gUkNf
Q09SRSBkZXBlbmRzIG9uIElOUFVUIChhdCBsZWFzdCBvbiB0b2RheSdzIG5leHQgYnJhbmNoKSBz
byBpZiBJTlBVVD1tCj4gdGhlbiBSQ19DT1JFIHNob3VsZCBiZSBlaXRoZXIgbiBlaXRoZXIgbSwg
YW0gSSByaWdodD8KClJpZ2h0LgoKPiBBcm5kLCBhcmUgdGhlcmUgdW5rbm93biB0byBtZSBjaGFu
Z2VzIGluIFJDL0lOUFVUIGRlcGVuZGVuY2llcz8KCkkgdGhpbmsgdGhpcyBpcyAnaW1wbHknIGJl
aGF2aW5nIG9kZGx5IHdoZW4gd2UgaGF2ZSBjb25mbGljdGluZyByZXF1aXJlbWVudHM6CgotIElO
UFVUPW0gZm9yY2VzIFJDX0NPUkUgdG8gYmUgPW0gb3IgPW4KLSBEUk1fU0lMX1NJSTg2MjA9eSBh
c2tzIFJDX0NPUkUgdG8gYmUgPXkgdW5sZXNzIGl0IGNhbm5vdCBiZSBlbmFibGVkCgpLY29uZmln
IGRlY2lkZWQgdG8gbWFrZSB0aGlzIFJDX0NPUkU9eSwgd2hpY2ggY2F1c2VkIHRoZSBsaW5rCmZh
aWx1cmUuIE1ha2luZyBpdCBSQ19DT1JFPW0gaG93ZXZlciB3b3VsZCBub3Qgd29yayBlaXRoZXIg
YmVjYXVzZQp0aGVuIHdlJ2QgZ2V0IGEgbGluayBmYWlsdXJlIGZyb20gdGhlIHNpaTg2MjAgZHJp
dmVyIHRvIHJjX2NvcmUuCgpzbyBhIHB1cmUgJ2ltcGx5JyBjYW5ub3Qgd29yayBoZXJlLCBhbmQg
d2UgbmVlZCBhIGRlcGVuZGVuY3ksIG9uZSBvZjoKCmEpCiAgIGRlcGVuZHMgb24gSU5QVVQgfHwg
IUlOUFVUCiAgIHNlbGVjdCBSQ19DT1JFIGlmIElOUFVUCgpiKSBkZXBlbmRzIG9uIFJDX0NPUkUg
fHwgIVJDX0NPUkUKCmIpIGlzIHdoYXQgb3RoZSBkcml2ZXJzIHVzZSwgZS5nLiBTTVNfU0RJT19E
UlYKCiAgICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
