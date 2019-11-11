Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D9DF7A3E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 18:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3FB6E9A7;
	Mon, 11 Nov 2019 17:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520A86E9A6;
 Mon, 11 Nov 2019 17:52:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s5so4532305wrw.2;
 Mon, 11 Nov 2019 09:52:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BJ9e9ly91nRhZjwW0TVLzAK+FXnMh6Th9fLasAfqWj8=;
 b=a8e5D6XyZW/NnqJGwQRsyt8pV2nQvpNIphyZKeRvAOiMC84rf4aD2ONryTPVRliFc3
 IkwVf4rw3rQJw7X55eAg5l94VvCSCVALEqQghvSp6roYGbO265Ezwp+0nxNyFerdnlN8
 EezXVyLGy6uWq/AfaWIJeGG6kqqMB4kh+2Bb4Xr0wYHC376kESt08F7l4w3GFw2peKnD
 M2XpNNz0oclNWSONuNpIdhKD23XIILks4lEOXAz83n3BSFpwajxdQS/vlFdw6oTu8KdU
 sjDPKVi6ZlR8gA/1cPABEp176nFP9dhiAiHFgVYpU1wBpvFiIYfs4SsLWTQVXa5Bx/wl
 WMEQ==
X-Gm-Message-State: APjAAAX8125QyNDA4zUyXbEURsy7ID1nQP4uSat3qFRnNFna9+e24gjt
 yC/3Sph5ByPhz70OdOuEGRWWlafs1duk2dw9SuU=
X-Google-Smtp-Source: APXvYqyKXIZM3kkAjgJ//6wJoe76MUqSTPK7e4h/ozx4tc+Qc/6YfCHZA0i3hVBa/gDTUNL8QrxwkEmyNawVQUUoc2w=
X-Received: by 2002:adf:9d87:: with SMTP id p7mr21416996wre.11.1573494736886; 
 Mon, 11 Nov 2019 09:52:16 -0800 (PST)
MIME-Version: 1.0
References: <1573443956-76489-1-git-send-email-zhengbin13@huawei.com>
 <MN2PR12MB3344DA10AF60C2C0E8D9FD0EE4740@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344DA10AF60C2C0E8D9FD0EE4740@MN2PR12MB3344.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Nov 2019 12:52:03 -0500
Message-ID: <CADnq5_Nq2SBJRCrrfy-OQBk=kSokq+KY+YdaTZ3WM5BuiM3Gxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] remove some set but not used variables in hwmgr
To: "Quan, Evan" <Evan.Quan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BJ9e9ly91nRhZjwW0TVLzAK+FXnMh6Th9fLasAfqWj8=;
 b=opqV3fiAXC6ueiXyXERXjvdiQcb8D5x7gI3MdKPy72cyjzmdwOp6FSiHo5Vpn3PMUl
 SvN4nIJgdK75Ptw6A+9T3sbYwwpyJICbJeKvqaFebvwbH83erIROsTrpEj9TjWuoczET
 Hs3P+g+ZVawe9QiaeAMB3x3Qwj7PsS4lnO9LcoMkfP1V8QVpTdSsPJBOE3W27NDU59bs
 mNxbk5H+bMkLghOPa4P2P3ivZhw0wgvl59FMeJSnj63ra3HvFDWcO/iAYbZ4AGfcbVVu
 TSWGbTUBRUspx6ERBT4Dq1+/dBXZc3S7rGJ42tkLJvbGgfKcTfTJBNiMzJ59oq/hRT6s
 hK+A==
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 zhengbin <zhengbin13@huawei.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "rex.zhu@amd.com" <rex.zhu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFN1biwgTm92IDEwLCAyMDE5IGF0IDExOjA0IFBN
IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPiB3cm90ZToKPgo+IFNlcmllcyBpcyByZXZp
ZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KPgo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+
Cj4gPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDExLCAyMDE5IDExOjQ2IEFNCj4gPiBUbzogcmV4
LnpodUBhbWQuY29tOyBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IERldWNoZXIsCj4g
PiBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlh
bgo+ID4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFpob3UsIERhdmlkKENodW5NaW5nKQo+
ID4gPERhdmlkMS5aaG91QGFtZC5jb20+OyBhaXJsaWVkQGxpbnV4LmllOyBkYW5pZWxAZmZ3bGwu
Y2g7IGFtZC0KPiA+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiA+IENjOiB6aGVuZ2JpbjEzQGh1YXdlaS5jb20KPiA+IFN1YmplY3Q6
IFtQQVRDSCAwLzJdIHJlbW92ZSBzb21lIHNldCBidXQgbm90IHVzZWQgdmFyaWFibGVzIGluIGh3
bWdyCj4gPgo+ID4gemhlbmdiaW4gKDIpOgo+ID4gICBkcm0vYW1kL3Bvd2VycGxheTogcmVtb3Zl
IHNldCBidXQgbm90IHVzZWQgdmFyaWFibGUKPiA+ICAgICAndmJpb3NfdmVyc2lvbicsJ2RhdGEn
Cj4gPiAgIGRybS9hbWQvcG93ZXJwbGF5OiByZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJs
ZSAnZGF0YScKPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211
N19od21nci5jICAgfCA0IC0tLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9o
d21nci92ZWdhMTBfaHdtZ3IuYyB8IDIgLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYgZGVsZXRp
b25zKC0pCj4gPgo+ID4gLS0KPiA+IDIuNy40Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
