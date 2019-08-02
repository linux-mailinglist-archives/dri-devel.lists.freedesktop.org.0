Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094277EEFC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C396ED35;
	Fri,  2 Aug 2019 08:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AFB6E8AC;
 Fri,  2 Aug 2019 05:37:25 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id y8so33206272plr.12;
 Thu, 01 Aug 2019 22:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ihRIEHRjtJIPus/danpDF2O/WfsfhF+xvDGQLaVGba0=;
 b=LkRxIx5jp9WP4NpI2Iz6GuoFVBtpnjoHFIS/aGImB30rjfPcb4DoK9fEXeZpMTCCn8
 hDKUJTp/5kf1IjiLi+XYX0QLZ2IEoHLHb5l140HYV7q96oqyLIy7umpWcciANwGH0z8p
 Dqh7mb2i/iZYXBXHxhZJM1o8rzZbqqiGlH9WMKnf851ybt07gx14IVV7qHt+xKiVre+Y
 MeE7Ry4pxJvYo9i5xiKK6wZoVfm934teOPI+ce8Qsg3zSV6fvjX2cCOzMmvGiceNPT8H
 fwrl3h8YzU3SvcK5vHNlBDiIZrhU7wdvStdRQisTPBvvwcL45bwxY3yuQ1M3WMaGVI7o
 he/g==
X-Gm-Message-State: APjAAAVqBsXWg3gm85mepi/domSDfVdZPzcwsouoYPHeUBVMFNjH9V+F
 66GR+gCzDhbv6qZ8gWAwJeo=
X-Google-Smtp-Source: APXvYqyxSYMw4QN2SRQ515CrxjGKV3nanM01epjwWH4RWeHALCxAI0t+x/3BqYGx0VGsG1ZUoXSy1Q==
X-Received: by 2002:a17:902:1004:: with SMTP id
 b4mr131792482pla.325.1564724245276; 
 Thu, 01 Aug 2019 22:37:25 -0700 (PDT)
Received: from localhost ([175.223.19.29])
 by smtp.gmail.com with ESMTPSA id q19sm77991081pfc.62.2019.08.01.22.37.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 22:37:24 -0700 (PDT)
Date: Fri, 2 Aug 2019 14:37:20 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [linux-next] mm/i915: i915_gemfs_init() NULL
 dereference
Message-ID: <20190802053720.GA3838@jagdpanzerIV>
References: <20190721142930.GA480@tigerII.localdomain>
 <20190731164829.GA399@tigerII.localdomain>
 <156468064507.12570.1311173864105235053@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156468064507.12570.1311173864105235053@skylake-alporthouse-com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ihRIEHRjtJIPus/danpDF2O/WfsfhF+xvDGQLaVGba0=;
 b=ftzFVjyfXoKLkBYNUMy31X98rL/NnJ8hllXWpl0KRZE/jG55BdBSqB5J1eDuE9kY7a
 aOrDSt03+MjcLtacH3layAaidKQ6bFw2OUKmk1j6Ol9G426SpZEcIf/M1fZRfSsuAJYj
 C6+SzwOAVWFe0xcQC/KGNlvgWQMGGBooqyrnAWQom/dNI0UjuYp7RayvRxOegnWThP25
 Tey1oildsxoH7wSomoGATwjH1OmclS1/j9TMY7I6PZ9Fe70UuJMWMHkIR5Z1qfdJ+JvX
 asuve8Y7Sd9y66IvBmlGl2LuEZN88zQPY/rDQC+SP4UvLmMQWmpALsqq4rtj5qPrJU3d
 2Wfw==
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
Cc: linux-mm@kvack.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Hugh Dickins <hughd@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Howells <dhowells@redhat.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gKDA4LzAxLzE5IDE4OjMwKSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgU2VyZ2V5
IFNlbm96aGF0c2t5ICgyMDE5LTA3LTMxIDE3OjQ4OjI5KQo+ID4gQEAgLTM2LDE5ICszOCwzNSBA
QCBpbnQgaTkxNV9nZW1mc19pbml0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQpbLi5d
Cj4gPiArICAgICAgICAgICAgICAgaWYgKCFmYy0+b3BzLT5wYXJzZV9tb25vbGl0aGljKQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnI7Cj4gPiArCj4gPiArICAgICAgICAgICAg
ICAgZXJyID0gZmMtPm9wcy0+cGFyc2VfbW9ub2xpdGhpYyhmYywgb3B0aW9ucyk7Cj4gPiArICAg
ICAgICAgICAgICAgaWYgKGVycikKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJy
Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGlmICghZmMtPm9wcy0+cmVjb25maWd1cmUpCj4g
Cj4gSXQgd291bGQgYmUgb2RkIGZvciBmc19jb250ZXh0X2Zvcl9yZWNvbmZpZ3VyZSgpIHRvIGFs
bG93IGNyZWF0aW9uIG9mIGEKPiBjb250ZXh0IGlmIHRoYXQgY29udGV4dCBjb3VsZG4ndCBwZXJm
b3JtIGEgcmVjb25maWdyZSwgbmV2ZXJ0aGVsZXNzIHRoYXQKPiBzZWVtcyB0byBiZSB0aGUgY2Fz
ZS4KCldlbGwsIEkga2VwdCB0aG9zZSBjaGVja3MganVzdCBiZWNhdXNlIGZzLyBjb2RlIGRvZXMg
dGhlIHNhbWUuCgpFLmcuIGZzL3N1cGVyLmMKCglyZWNvbmZpZ3VyZV9zdXBlcigpCgl7CgkJaWYg
KGZjLT5vcHMtPnJlY29uZmlndXJlKQoJCQlmYy0+b3BzLT5yZWNvbmZpZ3VyZShmYykKCX0KCglk
b19lbWVyZ2VuY3lfcmVtb3VudF9jYWxsYmFjaygpCgl7CgkJZmMgPSBmc19jb250ZXh0X2Zvcl9y
ZWNvbmZpZ3VyZSgpOwoJCXJlY29uZmlndXJlX3N1cGVyKGZjKTsKCX0KCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIGVycjsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICBlcnIgPSBm
Yy0+b3BzLT5yZWNvbmZpZ3VyZShmYyk7Cj4gPiArICAgICAgICAgICAgICAgaWYgKGVycikKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+IAo+IE9ubHkgdGhpbmcgdGhhdCBz
dGFuZHMgb3V0IGlzIHRoYXQgd2Ugc2hvdWxkIHB1dF9mc19jb250ZXh0KCkgaGVyZSBhcwo+IHdl
bGwuCgpPaC4uLiBJbmRlZWQsIHNvbWVob3cgSSBmb3Jnb3QgdG8gcHV0X2ZzX2NvbnRleHQoKS4K
Cj4gSSBndWVzcyBpdCdzIGJldHRlciB0aGFuIHBva2luZyBhdCB0aGUgU0JfSU5GTyBkaXJlY3Rs
eSBvdXJzZWx2ZXMuCj4gSSB0aGluayB0aG91Z2ggd2Ugc2hvdWxkbid0IGJhaWwgaWYgd2UgY2Fu
J3QgY2hhbmdlIHRoZSB0aHAgc2V0dGluZywgYW5kCj4ganVzdCBhY2NlcHQgd2hhdGV2ZXIgd2l0
aCBhIHdhcm5pbmcuCgpPSy4KCj4gTG9va3MgbGlrZSB0aGUgQVBJIGlzIGFscmVhZHkgYXZhaWxh
YmxlIGluIGRpbnEsIHNvIHdlIGNhbiBhcHBseSB0aGlzCj4gYWhlYWQgb2YgdGhlIG5leHQgbWVy
Z2Ugd2luZG93LgoKT0ssIHdpbGwgY29vayBhIGZvcm1hbCBwYXRjaCB0aGVuLiBUaGFua3MhCgoJ
LXNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
