Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D62EB214DE
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECD489842;
	Fri, 17 May 2019 07:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BE689258;
 Fri, 17 May 2019 06:45:35 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id t187so2802814pgb.13;
 Thu, 16 May 2019 23:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OCGt5sorLDt5jdtak0xEKE4FwBcATBkxh3vb31cAln0=;
 b=ae30uRDsA98tGqE1kP/eeaEN71gkzrKSR2Mr6W58c2OREBiI0yqNghHrT0ucaiSh7r
 tjyrBoeTr0P4zW6zcEjCrrkCxCzy0Xu+sCD7t1nDxAigsKTno8nwK+iKmGUjgrsqiHYc
 2V9C83rxof2h2P/qNLzmYuIoGlfr8ruImlV87qKvKs6s87trRKiMd3Waari/VuFVTK5k
 x5Z+4eY+wJge/z7r5cKQ8O/okLD/QUagyMlqLNRlEU9RVTRICbhn7700wowDyhyTN/Dd
 X6VoIbhsietrdqU3gE314tPbwIspPXVDnivd/EY3bePtGg3xohsgR3hAnCjiy89UwGld
 28Fw==
X-Gm-Message-State: APjAAAWpkcjG2Y16O/d/ON65/jhIXDN79z9TwhiVFoHJL85oGlTX8PKj
 E6xbpryKT6D8yUKO+DX2cEY=
X-Google-Smtp-Source: APXvYqzUJe8dCu8GqEpUM7OC8HKxKZXnZ08TMVDZ6+sAZTCmiFehuzAtJ6anieNtNnZk9Pjb59JtKg==
X-Received: by 2002:a62:2706:: with SMTP id n6mr21934249pfn.150.1558075534897; 
 Thu, 16 May 2019 23:45:34 -0700 (PDT)
Received: from localhost ([175.223.38.122])
 by smtp.gmail.com with ESMTPSA id u6sm9285681pfm.10.2019.05.16.23.45.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 23:45:34 -0700 (PDT)
Date: Fri, 17 May 2019 15:45:30 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: drm/nouveau/core/memory: kmemleak 684 new suspected memory leaks
Message-ID: <20190517064530.GA6986@jagdpanzerIV>
References: <20190517061340.GA709@jagdpanzerIV>
 <20190517063134.GA812@jagdpanzerIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517063134.GA812@jagdpanzerIV>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OCGt5sorLDt5jdtak0xEKE4FwBcATBkxh3vb31cAln0=;
 b=B3BX4dvAt3wfbRi48Rd5OGamVLSZ/vdClEM7/KqeoYCrK9HT7z4ibwc3XoOhGtC8RZ
 JxEd0t9PbteNa7C0JL5n4KRibx7VIgDHEah34gUqB0x9D7tEIue6E6PAwDjigEN5L7Gw
 fN+U4cqZtnHI8nIn+Wx4amHhRARq8WPiN2CMwQHE1ld6Kt/mZGwbBt5KPrnRGoAF5oIr
 5zOMwWlxOI63bSF+lCZXIdKjQWqh50fdAuxRDQPtynaEEuc037kLVyK5nijsABrxVhy1
 C7udA2vN17dlaj3meXOhohT5cebji5PaCdP9tsLrQ1xcyeBHoqSo1sV660J+t0YFVWej
 lUQA==
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
Cc: nouveau@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gKDA1LzE3LzE5IDE1OjMxKSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3RlOgo+ID4gICAgICAg
YmFja3RyYWNlOgo+ID4gICAgICAgICBbPDAwMDAwMDAwODFmMjg5NGY+XSBudmttX21lbW9yeV90
YWdzX2dldCsweDhlLzB4MTMwCj4gPiAgICAgICAgIFs8MDAwMDAwMDA3Y2Q3YzBiYz5dIGdmMTAw
X3ZtbV92YWxpZCsweDE5Ni8weDJmMAo+ID4gICAgICAgICBbPDAwMDAwMDAwNzBjYzZkNjc+XSBu
dmttX3ZtbV9tYXArMHhhOC8weDM2MAo+ID4gICAgICAgICBbPDAwMDAwMDAwYWI2Nzg2NDQ+XSBu
dmttX3ZyYW1fbWFwKzB4NDgvMHg1MAo+ID4gICAgICAgICBbPDAwMDAwMDAwZDgxNzYzNzg+XSBu
dmttX3V2bW1fbXRoZCsweDY1OC8weDc3MAo+ID4gICAgICAgICBbPDAwMDAwMDAwNDYzZmNhNWE+
XSBudmttX2lvY3RsKzB4ZGYvMHgxNzcKPiA+ICAgICAgICAgWzwwMDAwMDAwMDBhZmM0OTk2Pl0g
bnZpZl9vYmplY3RfbXRoZCsweGQ0LzB4MTAwCj4gPiAgICAgICAgIFs8MDAwMDAwMDAyZjdhNzM4
NT5dIG52aWZfdm1tX21hcCsweGViLzB4MTAwCj4gPiAgICAgICAgIFs8MDAwMDAwMDBlZjI1Mzdl
ZD5dIG5vdXZlYXVfbWVtX21hcCsweDc5LzB4ZDAKPiA+ICAgICAgICAgWzwwMDAwMDAwMDE0ZGRj
MGNmPl0gbm91dmVhdV92bWFfbmV3KzB4MTlkLzB4MWMwCj4gPiAgICAgICAgIFs8MDAwMDAwMDBm
OTk4ODhhMT5dIG5vdXZlYXVfZ2VtX29iamVjdF9vcGVuKzB4ZDQvMHgxNDAKPiA+ICAgICAgICAg
WzwwMDAwMDAwMDljZDI1ODYxPl0gZHJtX2dlbV9oYW5kbGVfY3JlYXRlX3RhaWwrMHhlMy8weDE2
MAo+ID4gICAgICAgICBbPDAwMDAwMDAwMTkxNzg0ZDk+XSBub3V2ZWF1X2dlbV9pb2N0bF9uZXcr
MHg2ZS8weGQwCj4gPiAgICAgICAgIFs8MDAwMDAwMDAxNTk2NzhkZj5dIGRybV9pb2N0bF9rZXJu
ZWwrMHg4Yy8weGQwCj4gPiAgICAgICAgIFs8MDAwMDAwMDBmYmFhNjE1ND5dIGRybV9pb2N0bCsw
eDFjNC8weDM2MAo+ID4gICAgICAgICBbPDAwMDAwMDAwNjgzM2ZlMTU+XSBub3V2ZWF1X2RybV9p
b2N0bCsweDYzLzB4YjAKWy4uXQo+ICAgYmFja3RyYWNlOgo+ICAgICBbPDAwMDAwMDAwNjkzM2Vk
MmI+XSBub3V2ZWF1X2Nvbm5fcmVzZXQrMHgyMC8weGIwCj4gICAgIFs8MDAwMDAwMDA1NzJlMmUz
MD5dIG5vdXZlYXVfY29ubmVjdG9yX2NyZWF0ZSsweDM1Ni8weDU0Ywo+ICAgICBbPDAwMDAwMDAw
OGE2YTEzY2Q+XSBudjUwX2Rpc3BsYXlfY3JlYXRlKzB4MmZiLzB4OTE3Cj4gICAgIFs8MDAwMDAw
MDA3ZmFiMGE1OD5dIG5vdXZlYXVfZGlzcGxheV9jcmVhdGUrMHgzZTYvMHg2MDAKPiAgICAgWzww
MDAwMDAwMDhiODY0NGM4Pl0gbm91dmVhdV9kcm1fZGV2aWNlX2luaXQrMHgxNDkvMHg2YjAKPiAg
ICAgWzwwMDAwMDAwMDRmZDc4YTFmPl0gbm91dmVhdV9kcm1fcHJvYmUrMHgyNjMvMHgyYjAKPiAg
ICAgWzwwMDAwMDAwMDM1NzcxNmVmPl0gcGNpX2RldmljZV9wcm9iZSsweGEzLzB4MTEwCj4gICAg
IFs8MDAwMDAwMDAwNjFkNDBlND5dIHJlYWxseV9wcm9iZSsweGQzLzB4MjQwCj4gICAgIFs8MDAw
MDAwMDAwYWRlNDRiNj5dIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHg1MC8weGMwCj4gICAgIFs8MDAw
MDAwMDA5Y2QwMDI0Yz5dIGRldmljZV9kcml2ZXJfYXR0YWNoKzB4NTMvMHg2MAo+ICAgICBbPDAw
MDAwMDAwYjExYWIwYmI+XSBfX2RyaXZlcl9hdHRhY2grMHg0Yy8weGIwCj4gICAgIFs8MDAwMDAw
MDAxNmQ4NDU3Zj5dIGJ1c19mb3JfZWFjaF9kZXYrMHg2Ni8weDkwCj4gICAgIFs8MDAwMDAwMDBm
Mjg1NWY1ZT5dIGJ1c19hZGRfZHJpdmVyKzB4MTcxLzB4MWMwCj4gICAgIFs8MDAwMDAwMDAyMWMw
OGZjMT5dIGRyaXZlcl9yZWdpc3RlcisweDZjLzB4YWYKPiAgICAgWzwwMDAwMDAwMDg2MzU3ODQz
Pl0gZG9fb25lX2luaXRjYWxsKzB4MzYvMHgxZDQKPiAgICAgWzwwMDAwMDAwMGE2YmUwNTVhPl0g
a2VybmVsX2luaXRfZnJlZWFibGUrMHgxYmYvMHgyNGYKCkFuZCBvbmUgbW9yZToKCglpY2NzZW5z
ZS0+cmFpbCA9IGttYWxsb2NfYXJyYXkoY250LCBzaXplb2Yoc3RydWN0IHB3cl9yYWlsX3QpLCBH
RlBfS0VSTkVMKTsKCnVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmOTRlNWNjZGM3NjAwIChzaXpl
IDk2KToKICBjb21tICJzd2FwcGVyLzAiLCBwaWQgMSwgamlmZmllcyA0Mjk0NjY3Nzc0IChhZ2Ug
OTEzLjIwNXMpCiAgaGV4IGR1bXAgKGZpcnN0IDMyIGJ5dGVzKToKICAgIDAwIDAwIDAwIGNjIGU1
IDk0IGZmIGZmIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uCiAgICAw
NCAwMCBmMSBmZiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgLi4uLi4uLi4u
Li4uLi4uLgogIGJhY2t0cmFjZToKICAgIFs8MDAwMDAwMDAyNDJhYmNiMz5dIG52Ymlvc19pY2Nz
ZW5zZV9wYXJzZSsweGRjLzB4MjUwCiAgICBbPDAwMDAwMDAwYjVjNzA0OTA+XSBudmttX2ljY3Nl
bnNlX29uZWluaXQrMHg1NS8weDM3MAogICAgWzwwMDAwMDAwMDIwZTBhNzQzPl0gbnZrbV9zdWJk
ZXZfaW5pdCsweDUzLzB4ZDAKICAgIFs8MDAwMDAwMDA0ZDhjNmVmMT5dIG52a21fZGV2aWNlX2lu
aXQrMHgxMGQvMHgxOTAKICAgIFs8MDAwMDAwMDBiZDdhNGRhND5dIG52a21fdWRldmljZV9pbml0
KzB4NDEvMHg2MAogICAgWzwwMDAwMDAwMDQ3ZWZmY2ZjPl0gbnZrbV9vYmplY3RfaW5pdCsweDNl
LzB4MTAwCiAgICBbPDAwMDAwMDAwNmQ2YmFkMjE+XSBudmttX2lvY3RsX25ldysweDE0NS8weDFl
MAogICAgWzwwMDAwMDAwMGZjNGU3ZTQ4Pl0gbnZrbV9pb2N0bCsweGRmLzB4MTc3CiAgICBbPDAw
MDAwMDAwNGNkYzljZjg+XSBudmlmX29iamVjdF9pbml0KzB4ZDYvMHgxMzAKICAgIFs8MDAwMDAw
MDAxNjM3NTg0Yj5dIG52aWZfZGV2aWNlX2luaXQrMHhlLzB4NTAKICAgIFs8MDAwMDAwMDA4MzA2
ODNkND5dIG5vdXZlYXVfY2xpX2luaXQrMHgxN2QvMHg0MTAKICAgIFs8MDAwMDAwMDBmZDkzYzMw
Nj5dIG5vdXZlYXVfZHJtX2RldmljZV9pbml0KzB4NTUvMHg2YjAKICAgIFs8MDAwMDAwMDA3YmM3
NGUzZj5dIG5vdXZlYXVfZHJtX3Byb2JlKzB4MjYzLzB4MmIwCiAgICBbPDAwMDAwMDAwMGY5NGY5
MTM+XSBwY2lfZGV2aWNlX3Byb2JlKzB4YTMvMHgxMTAKICAgIFs8MDAwMDAwMDBmODJkMjFiZT5d
IHJlYWxseV9wcm9iZSsweGQzLzB4MjQwCiAgICBbPDAwMDAwMDAwYThiOGIwMmU+XSBkcml2ZXJf
cHJvYmVfZGV2aWNlKzB4NTAvMHhjMAoKCS1zcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
