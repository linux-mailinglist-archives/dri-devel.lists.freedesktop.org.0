Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE3CBEA6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 17:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8747F6EBC5;
	Fri,  4 Oct 2019 15:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AB86EB12;
 Fri,  4 Oct 2019 15:09:11 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 3so6245956wmi.3;
 Fri, 04 Oct 2019 08:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mW3Y0VrUb6wZtyxebbfB9Jk1tCRtuYl5oPC9U9Ftd/E=;
 b=fkRUYYGEB+fwicJo0ntVkhoQP+lZAT8ifaGHkRqF2lqB0qd3rr46FxpwoKUshtjbo3
 0kujPyHlfa5JxFSZItEcPKKpUShCaS8RICY17rPln166QqBkNyPvHu80+gJOljHPhA6w
 etNSnc6ci060+wJm3IPHp8v/1N2EfsSHgoION36oRdRYvj8tovdET3KFpp0LOJrdC241
 uS1O7g2RqOozvEH5j6zLoGrCrrg4j//8hrRx+vYAAvXGR5FYEjY6PuXcWOQtsRVOto7j
 hpI4rQ2YOVRM1d97bSOQuvmoXRmsC7K8VCd/l1GnA1bPUcSMchRY4x/KCbOXdQ2yhrLR
 7Bgw==
X-Gm-Message-State: APjAAAX7T7bb2fKgi0aNEifI4Df42C9o8zDP00SsxTSF4pttJmIFUsXc
 NlOx6sDtcI2642BAX1B0uCIgQfn5+m/Sq0LElQs=
X-Google-Smtp-Source: APXvYqxneG+7AABZBLJ88L0DfeVJhZB3AgCn8Tok8QL2HTCnFpF8wIJhlR87UC42+UfW2wxt1qlX1BJsx1dRmRKkM6I=
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr11848180wmo.67.1570201750315; 
 Fri, 04 Oct 2019 08:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191004155929.3ac043b5@canb.auug.org.au>
 <06969836-ac7f-0d18-1866-159e48018d98@infradead.org>
In-Reply-To: <06969836-ac7f-0d18-1866-159e48018d98@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Oct 2019 11:08:57 -0400
Message-ID: <CADnq5_P8Z4jC9ZiW4F=3w26=V_Ft+_qTvC5OesaYmM0nMbT_MA@mail.gmail.com>
Subject: Re: linux-next: Tree for Oct 4 (amdgpu)
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mW3Y0VrUb6wZtyxebbfB9Jk1tCRtuYl5oPC9U9Ftd/E=;
 b=nOY2keZsqmpuH1xbeDCnZt1MEiYieW9JrPr/H+MW3gfONPqSwgKkWjBnwCnD3bsItw
 9LwJCibDag0hBLErXz3izWl1UlY10ST+Bv3Z8dNqH50N/iyy/oOD0z1oAW14MLvVy16l
 +l/L6rcf8JaqteOYGyWtE+lBLK8gGhsawZ6x92i+ovKxPnjN8+HuXqatlY9c4yK6dJQw
 WAT9cSo971e/xlqQf6HVBh1SzzYKRUSHqXRDsyK8fPyfVYfOvOXbomyOT5qTDLOyw4Tf
 KCaNnW3eHnuQDRrzNUFxzNCnrpv4nwi6qG7PV2esRAG6hsNb5Bpm2wnYZ8sgbOoIbghv
 Jllg==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCAxMTowOCBBTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiAxMC8zLzE5IDEwOjU5IFBNLCBTdGVwaGVuIFJvdGh3
ZWxsIHdyb3RlOgo+ID4gSGkgYWxsLAo+ID4KPiA+IENoYW5nZXMgc2luY2UgMjAxOTEwMDM6Cj4g
Pgo+Cj4gb24geDg2XzY0Ogo+IENPTkZJR19EUk1fQU1ER1BVPXkKPiAjIENPTkZJR19EUk1fQU1E
R1BVX1NJIGlzIG5vdCBzZXQKPiAjIENPTkZJR19EUk1fQU1ER1BVX0NJSyBpcyBub3Qgc2V0Cj4g
Q09ORklHX0RSTV9BTURHUFVfVVNFUlBUUj15Cj4gQ09ORklHX0RSTV9BTURHUFVfR0FSVF9ERUJV
R0ZTPXkKPgo+IGxkOiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLm86KC5y
b2RhdGErMHhmNjApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBnZnhfdjdfa2ZkMmtnZCcKPgoK
Rml4ZWQ6Cmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMzQ0MTIvCgpB
bGV4Cgo+IC0tCj4gflJhbmR5Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
