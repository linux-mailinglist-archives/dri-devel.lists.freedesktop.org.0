Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BED6316F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B125898BC;
	Tue,  9 Jul 2019 07:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF2A89895;
 Mon,  8 Jul 2019 14:54:35 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id d4so14813120edr.13;
 Mon, 08 Jul 2019 07:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bNT0DI8zf1x4sOIXDdDUd5MH9U1axxqV6OsNl9utl10=;
 b=MDMAJ9wNX2L7PboYfDuDnlukSfGCHGrqot+BT1k6RfRCNPu2QrJmOnS9k/QXKIjM1z
 fCvQGdk4ATU7aUkFAhLwmq+ZAgJBfTEI7hF97HmWMfVwqG67fQbuCcwqscWJn9jT5noZ
 kakStps7BbD3GgjNR2PTw5mL5zoHM+hYy5ZBn0DfDc/kXdXVyqyLCRROfELumJeBbEWa
 hWZKmE6eXNQwjy2SAxE9/2w/LGoaKOzdcQ2pIclNOMrCwFlatTeUSVC/n6HCwiYwWFWC
 9VyjXcfUzw0y8lpPpFIr1jL8B4krhkbTOkkAtgk6RQvakihLi4CE6h72GxPSlvQPMd9v
 7uWw==
X-Gm-Message-State: APjAAAUJO951r1EB9toDOe6qPa6NgN13gQnE1wfFPG3iASYPj/XTAtsU
 BRdlwCM+4xhhrduu5HgQzhE=
X-Google-Smtp-Source: APXvYqzYKo3loYnOhaKC1u/yZVXsZuc8T6BmR0pGvHksFxi/lteDxK85p+MMjEhT1cqCjiOqlQBBKw==
X-Received: by 2002:a50:f49a:: with SMTP id s26mr20855838edm.191.1562597673550; 
 Mon, 08 Jul 2019 07:54:33 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id o21sm3779989edt.26.2019.07.08.07.54.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 07:54:32 -0700 (PDT)
Date: Mon, 8 Jul 2019 07:54:30 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/amd/powerplay: work around enum conversion warnings
Message-ID: <20190708145430.GC43693@archlinux-epyc>
References: <20190708135725.844960-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708135725.844960-1-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bNT0DI8zf1x4sOIXDdDUd5MH9U1axxqV6OsNl9utl10=;
 b=Z//APFq9fnEjnMyxU9HNc8g1OiZb21AI6ZmjgovqJ5+uZtTMnYMyutuFPLhBWaJB5c
 mOeMNm+rcTQ+5cm23LHsgoMpWsnGYhMnb/uNMM+H7gcHOP7yMgVPDlqUj1A09wx2BelV
 oewOV9s3X7PCO1KbLjOCLD2UPNYELpUsPHhYiwEu2Y2OL0UBmEPg4Ecc3DAdobItOW6Q
 7lnKrPJjcYlWijiTcN6f3uQwkosnbBVmLWXKS7H8xO+HVhPbwW/INO/XNXwgmVJvhDLv
 3uxC5jij6XOKXibhG1c27GyszD8R8VxFtGo9nCAZp1R2FeGTPziWnK456LLZZQB1tKXa
 eGsA==
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
Cc: Gui Chengming <Jack.Gui@amd.com>, David Airlie <airlied@linux.ie>,
 Kevin Wang <kevin1.wang@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQXJuZCwKCk9uIE1vbiwgSnVsIDA4LCAyMDE5IGF0IDAzOjU3OjA2UE0gKzAyMDAsIEFybmQg
QmVyZ21hbm4gd3JvdGU6Cj4gQSBjb3VwbGUgb2YgY2FsbHMgdG8gc211X2dldF9jdXJyZW50X2Ns
a19mcmVxKCkgYW5kIHNtdV9mb3JjZV9jbGtfbGV2ZWxzKCkKPiBwYXNzIGNvbnN0YW50cyBvZiB0
aGUgd3JvbmcgdHlwZSwgbGVhZGluZyB0byB3YXJuaW5ncyB3aXRoIGNsYW5nLTg6Cj4gCj4gZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYzo5OTU6Mzk6
IGVycm9yOiBpbXBsaWNpdCBjb252ZXJzaW9uIGZyb20gZW51bWVyYXRpb24gdHlwZSAnUFBDTEtf
ZScgdG8gZGlmZmVyZW50IGVudW1lcmF0aW9uIHR5cGUgJ2VudW0gc211X2Nsa190eXBlJyBbLVdl
cnJvciwtV2VudW0tY29udmVyc2lvbl0KPiAgICAgICAgICAgICAgICAgcmV0ID0gc211X2dldF9j
dXJyZW50X2Nsa19mcmVxKHNtdSwgUFBDTEtfU09DQ0xLLCAmbm93KTsKPiAgICAgICAgICAgICAg
ICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+
fgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3Nt
dS5oOjc3NTo4Mjogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAnc211X2dldF9jdXJyZW50X2Ns
a19mcmVxJwo+ICAgICAgICAgKChzbXUpLT5mdW5jcy0+Z2V0X2N1cnJlbnRfY2xrX2ZyZXE/IChz
bXUpLT5mdW5jcy0+Z2V0X2N1cnJlbnRfY2xrX2ZyZXEoKHNtdSksIChjbGtfaWQpLCAodmFsdWUp
KSA6IDApCj4gCj4gSSBjb3VsZCBub3QgZmlndXJlIG91dCB3aGF0IHRoZSBwdXJwb3NlIGlzIG9m
IG1peGluZyB0aGUgdHlwZXMKPiBsaWtlIHRoaXMgYW5kIGlmIGl0IGlzIHdyaXR0ZW4gbGlrZSB0
aGlzIGludGVudGlvbmFsbHkuCj4gQXNzdW1pbmcgdGhpcyBpcyBhbGwgY29ycmVjdCwgYWRkaW5n
IGFuIGV4cGxpY3QgY2FzZSBpcyBhbgo+IGVhc3kgd2F5IHRvIHNodXQgdXAgdGhlIHdhcm5pbmdz
Lgo+IAo+IEZpeGVzOiBiYzBmY2ZmZDM2YmEgKCJkcm0vYW1kL3Bvd2VycGxheTogVW5pZnkgc211
IGhhbmRsZSB0YXNrIGZ1bmN0aW9uICh2MikiKQo+IEZpeGVzOiAwOTY3NjEwMTQyMjcgKCJkcm0v
YW1kL3Bvd2VycGxheTogc3VwcG9ydCBzeXNmcyB0byBnZXQgc29jY2xrLCBmY2xrLCBkY2VmY2xr
IikKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKSSBzZW50
IGEgc2VyaWVzIGxhc3Qgd2VlayBmb3IgYWxsIG9mIHRoZSBjbGFuZyB3YXJuaW5ncyB0aGF0IHdl
cmUgYWRkZWQKaW4gdGhpcyBkcml2ZXIgcmVjZW50bHkuCgpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMTkwNzA0MDU1MjE3LjQ1ODYwLTEtbmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tLwoK
SSB0aGluayBpdCBpcyBzYWZlIHRvIHVzZSB0aGUgQ0xLIGVudW1zIGZyb20gdGhlIGV4cGVjdGVk
IHR5cGUgKGZyb20Kd2hhdCBJIGNvdWxkIHNlZSBmcm9tIGdvaW5nIGRvd24gdGhlIGNvZGUgZmxv
dyByYWJiaXQgaG9sZSkuCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwNzA0MDU1
MjE3LjQ1ODYwLTQtbmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tLwoKaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC8yMDE5MDcwNDA1NTIxNy40NTg2MC03LW5hdGVjaGFuY2VsbG9yQGdtYWlsLmNv
bS8KCkNoZWVycywKTmF0aGFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
