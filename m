Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFFEEBEF1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5556F74B;
	Fri,  1 Nov 2019 08:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8346E08E;
 Thu, 31 Oct 2019 13:51:07 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c12so1462420wml.4;
 Thu, 31 Oct 2019 06:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gAclQFwXxT+EpCdR+7raEwTaxKHzgavsPREsM1zGn+U=;
 b=sVijT/ME2ZrsUV0U0bQiau02qzSMrjW0nQquo2UBSZXiBIlSfZZ9NbPmLabgnyuAFh
 9FFihyX/HMm/b4pgv/ham4uNMiI01ifvWj27TbWuK99rdksceejy2INJx4eBc0VZsV5X
 UsH2bgOymcjsE/3qJOQQypc3yZW2/ZzxgaCaH6SYkiHhMnqv9wi8smNxZ0SxsJ7jGXtV
 eDbnSAbID8Bt0/2kBBoSsNpFAb0sKJMcHfdOoCV21LUWAD/0N0+x6yrJTr5XiD2BF5hd
 3k/8l2bymKXuhhGW0yLrWbF2Qjt/iZFfg6pAcBzfRHw5GfZDL7GFmabw54b/Bcux1x5M
 xm4A==
X-Gm-Message-State: APjAAAVXLsehLKU4268jfiI8FohzGCS9Js0SqeVPHze1mqTqCZPOoCHK
 fNIRuVXvo2STzhQSDInHqHQ=
X-Google-Smtp-Source: APXvYqznGvYQ+XQnAoy7o1i04CIKW2qqDDwcXhCWnjOonccojJ1bEGmlN+Ww8nI8BXSRkwxeB+pFOg==
X-Received: by 2002:a1c:41c1:: with SMTP id o184mr5185694wma.57.1572529866293; 
 Thu, 31 Oct 2019 06:51:06 -0700 (PDT)
Received: from mail.google.com ([104.238.174.53])
 by smtp.gmail.com with ESMTPSA id b62sm3541546wmc.13.2019.10.31.06.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 06:51:05 -0700 (PDT)
Date: Thu, 31 Oct 2019 21:50:54 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2] kernel-doc: rename the kernel-doc directive
 'functions' to 'identifiers'
Message-ID: <20191031135052.tl63uzhdgcpcqwj5@mail.google.com>
References: <20191020131717.28990-1-changbin.du@gmail.com>
 <20191024121940.1d6a64df@lwn.net> <87woctb9cj.fsf@intel.com>
 <20191025144802.uixg2crhw6h7gghq@mail.google.com>
 <87v9s99q9l.fsf@intel.com>
 <20191029003120.llve32crfw63ovpw@mail.google.com>
 <20191029020027.516a6bce@lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029020027.516a6bce@lwn.net>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gAclQFwXxT+EpCdR+7raEwTaxKHzgavsPREsM1zGn+U=;
 b=idnQhtYQ3TBs6KRPEkfaDxAhsWnSbcQiblhWd/rUqCaholJb+Y6Q4/pGjTG3wgXy1P
 40455Viwd3gxYt+PaByLrYdbujjRrwE6wSqw6ib1JZnsIJGSovtnxPn+I4tiL+vxp6ru
 aCdFGQpzKNpKMx6C4EPSylCqtT2fhgJ4FH2TNd4AP6XuSpXi3YKYPH946q3VOhrO5XhI
 KxSALsOS8wHCNu42BPwgvyYl1+Ju72i7yPUNb1V7wUce/jqdOtN0BFgyKHwRik2dFsGz
 n9e3eC840rv8hyhOlyIBR1W4IPf4ghXMi/9D/PSA4o51ERYxrDKAwDCk5ZfPR5Es1dku
 GbKQ==
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
Cc: Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-crypto@vger.kernel.org,
 linux-kselftest@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDI6MDA6MjdBTSAtMDYwMCwgSm9uYXRoYW4gQ29yYmV0
IHdyb3RlOgo+IE9uIFR1ZSwgMjkgT2N0IDIwMTkgMDg6MzE6MjIgKzA4MDAKPiBDaGFuZ2JpbiBE
dSA8Y2hhbmdiaW4uZHVAZ21haWwuY29tPiB3cm90ZToKPiAKPiA+IEhlcmUgcHl0aG9uIGlzIGRp
ZmZlcmVudCBmcm9tIEMuIEJvdGggZW1wdHkgc3RyaW5nIGFuZCBOb25lIGFyZSBGYWxzZSBpbiBw
eXRob24uCj4gPiBOb3RlIHN1Y2ggY29uZGl0aW9uIGlzIGNvbW1vbiBpbiBweXRob24uCj4gCj4g
VHJlYXRpbmcgYm90aCBhcyBhIEZhbHNlIHZhbHVlIGlzIHJlYXNvbmFibHkgY29tbW9uLiAgVHJl
YXRpbmcgdGhlbQo+IGVsc2V3aGVyZSBpbiB0aGUgc2FtZSBjb2RlIGJsb2NrIGFzIHNlcGFyYXRl
IHZhbHVlcyBpcyBsZXNzCj4gc287IHRoYXQncyB0aGUgcGFydCBJIHdvdWxkIHByZWZlciB0byBh
dm9pZC4KPgpvaywgcGxlYXNlIGNoZWNrIHVwZGF0ZSBpbiB2My4KCj4gVGhhbmtzLAo+IAo+IGpv
bgoKLS0gCkNoZWVycywKQ2hhbmdiaW4gRHUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
