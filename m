Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D0810C1E4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 02:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACB26E5D9;
	Thu, 28 Nov 2019 01:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F936E5D9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 01:51:14 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t5so26646282ljk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 17:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XSpsmOKMn/O48LBUUrQ1uLf4PCDrcrylBzPfl36vaW4=;
 b=H4CBur+IEevwpXNo3WagsRhMsCHerFv8Oyc1k33MbbYNRSVJWHLHrMbTZ4bSKt1Y06
 XMIZZhUn1GIUGiSO/p6Gbu+S4CbietzqAOIK21wgqme2z8JsHg9nODT/vfVrukNtjcPv
 eAvAl3WxOZP4DbHmcpOzNq4YmZtJSGA+/JVbteq6Qaf8Cpejgl+yLm3xjDl3dvN7+1Wl
 h6WsTikijOJdCxIGGc0pWLWuJsiyZEm36l55K6xD9eqqvqZEppAzt4+KlAuhx3dUFa/g
 XRmcunP+SO6UzUXxNzKoJ/vXShayt6EJdBlwpNOIQRaU9vH2xK1Eft7kx5SsdiDUWB1O
 WcbA==
X-Gm-Message-State: APjAAAVww9Qf3h0esy+YhDXdBJU1kL4zWaaTlVKuqzBIztyvaLHHtfJH
 Jjr60Zfa7jvgOoivNq+vKxy6/S0X304=
X-Google-Smtp-Source: APXvYqxlUbDxNNfMYZmOO1mIvYChONGcqgwTHIOUREO0Qwe3+yXIwbKGkN8hmkNQy/E+09GdyE9kmg==
X-Received: by 2002:a2e:8758:: with SMTP id q24mr2620272ljj.157.1574905871941; 
 Wed, 27 Nov 2019 17:51:11 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id w11sm7673156lfe.56.2019.11.27.17.51.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 17:51:10 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id n21so26581685ljg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 17:51:10 -0800 (PST)
X-Received: by 2002:a2e:84d0:: with SMTP id q16mr21585112ljh.48.1574905870426; 
 Wed, 27 Nov 2019 17:51:10 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9ty6MLNc4qYKOAO3-eFDpQtm9hGPg9hPQOm4iRg_8MkmNw@mail.gmail.com>
In-Reply-To: <CAPM=9ty6MLNc4qYKOAO3-eFDpQtm9hGPg9hPQOm4iRg_8MkmNw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Nov 2019 17:50:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=whdhd69G1AiYTQKSB-RApOVbmzmAzO=+oW+yHO-NXLhkQ@mail.gmail.com>
Message-ID: <CAHk-=whdhd69G1AiYTQKSB-RApOVbmzmAzO=+oW+yHO-NXLhkQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.5-rc1
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=XSpsmOKMn/O48LBUUrQ1uLf4PCDrcrylBzPfl36vaW4=;
 b=HKZjDm8rWodB8EJ++Bfhj8pyIRhnt6rHbi9iLTBmubir7V/H3ot6+UwhKaMf/AE9TE
 otYJAAzZU44px9b6r8FV0elKk5tJD9IFvkCYS6GL1WkiaXlnLrJ+urAUAopY4Jf2o13k
 27w6oL9CloZIsZW87L8ylCgNrRDHNFZ+7Okhc=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgNDo1OSBQTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gbXkgc2FtcGxlIG1lcmdlIGlzIGhlcmU6Cj4gaHR0cHM6Ly9jZ2l0
LmZyZWVkZXNrdG9wLm9yZy9+YWlybGllZC9saW51eC9sb2cvP2g9ZHJtLW5leHQtNS41LW1lcmdl
ZAoKSG1tLiBJIHRoaW5rIHlvdSBtaXNzZWQgYSBjb3VwbGU6IHlvdSBsZWZ0IGEgZHVwbGljYXRl
CmludGVsX3VwZGF0ZV9yYXdjbGsoKSBhcm91bmQgKGl0IGdvdCBtb3ZlZCBpbnRvCmludGVsX3Bv
d2VyX2RvbWFpbnNfaW5pdF9odygpIGJ5IGNvbW1pdCAyZjIxNmE4NTA3MTUgKCJkcm0vaTkxNToK
dXBkYXRlIHJhd2NsayBhbHNvIG9uIHJlc3VtZSIpLCBhbmQgeW91IGxlZnQgdGhlICJzZWxlY3QK
UkVGQ09VTlRfRlVMTCIgdGhhdCBubyBsb25nZXIgZXhpc3RzLgoKQW5kIGFwcGFyZW50bHkgbm9i
b2R5IGJvdGhlcmVkIHRvIHRlbGwgbWUgYWJvdXQgdGhlIHNlbWFudGljIGNvbmZsaWN0CndpdGgg
dGhlIG1lZGlhIHRyZWUgZHVlIHRvIHRoZSBjaGFuZ2VkIGNhbGxpbmcgY29udmVudGlvbiBvZgpj
ZWNfbm90aWZpZXJfY2VjX2FkYXBfdW5yZWdpc3RlcigpLiBEaWRuJ3QgdGhhdCBzaG93IHVwIGlu
IGxpbnV4LW5leHQ/CgpBbnl3YXksIG1lcmdlZCBhbmQgcHVzaGVkIG91dCwKCiAgICAgICAgICAg
IExpbnVzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
