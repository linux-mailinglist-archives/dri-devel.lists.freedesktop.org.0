Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2648A36CD27
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 22:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4376E5CA;
	Tue, 27 Apr 2021 20:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5E98828C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 20:49:36 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id i3so45887878edt.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 13:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XOcwmE4CZ2i/OA6V2pBhMJSK0Q0BLwEVp/hRAR1lChE=;
 b=0TLlfP8WalgbwsJwzEV6MZkCzdo/RSVfx4HN1qd8l1dbV9BaC3gCkbdRrN32kYHwLj
 fVGeQ7lJj5dh5Q1lSmJ+IIfcjy9Ir6H5+9Jb5q6Y2+w1tRN/ABOkqv4xF85XG08nrqgY
 FQ+wFO8hGuaAQ0EBoAzOQlFqOWPFsLe/RG4UYu5Rf9f8wUI+TOHe72A2GZRIrtIiLVi5
 ZqhWmA0jAUe1Ngak9kE/ZL6h5WdgnCsyrv3cU4+SrDJTBsDeO09rxUSXkIhd29QrgXJg
 veZnLAjHf5++zwchGH1fymAr8/SaDEb3IERZmFi3jejyoU6KbKRfVwlIJnINsbyEQMQX
 Tt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XOcwmE4CZ2i/OA6V2pBhMJSK0Q0BLwEVp/hRAR1lChE=;
 b=Lu0syUA8Hm4KdXBk6dr89Dj9HoU1xCw/EJQHEEawNmlrQ0tN2SRFDYaaCQO/pvldQQ
 IaSH9w5HEV9pKKzW+RZeexcsj/HoLuP1Ca5oUnLME1BLVToptRrvScxe8PG3rOETUv8R
 kViD2HJYdqbsUtSP7piRlK63nNh/dCfIwrEUs3LCsQf/STCpxivk/+lXF6B66Cm3ck/+
 x2xz5EE/zR88CUOn5Xq47BdjtTIAQiCN2K9UqEqgl+SqVNk7BTB/pTDsh8P3eTQmE5kS
 R0sOMYx/QLxxRNh7VS5aRr7gTSPfN2/zn/8DHEqGDaDnGQ8SUlDDusPl/1xZeu//EIDs
 Y1rw==
X-Gm-Message-State: AOAM531ABoMw04d/4mIFm+NPFlQfwtNZ1ypQiioifAi0AEHcwZnezks9
 VAflgnaBiCXk1JUlY3zjTi34bcQAwfh49w6xulJqOA==
X-Google-Smtp-Source: ABdhPJxVCQDFHRf01px9GPaO6ewsCwJT4RJVJ1GU8V7pkNQ4gm3iBdthcQxrm3XHXGTYJVwNl/OcOmYfBuKjSSsGP9o=
X-Received: by 2002:a05:6402:1013:: with SMTP id
 c19mr6683819edu.213.1619556575595; 
 Tue, 27 Apr 2021 13:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
 <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAPM=9tzz2u_qUXU9LMvtH_NDr1_wzunPo7Mt6NkrwAuowWTp7Q@mail.gmail.com>
In-Reply-To: <CAPM=9tzz2u_qUXU9LMvtH_NDr1_wzunPo7Mt6NkrwAuowWTp7Q@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 27 Apr 2021 15:49:24 -0500
Message-ID: <CAOFGe97PXSK3NXjquG+it65qomuhVKEK9ktny56P9XZ9wzd6vg@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Dave Airlie <airlied@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjcsIDIwMjEgYXQgMTozOCBQTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAyNyBBcHIgMjAyMSBhdCAyMjowNiwgQ2hyaXN0aWFu
IEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gQ29ycmVjdCwgd2Ugd291bGRuJ3QgaGF2ZSBzeW5jaHJvbml6YXRpb24gYmV0d2VlbiBkZXZp
Y2Ugd2l0aCBhbmQgd2l0aG91dCB1c2VyIHF1ZXVlcyBhbnkgbW9yZS4KPiA+Cj4gPiBUaGF0IGNv
dWxkIG9ubHkgYmUgYSBwcm9ibGVtIGZvciBBK0kgTGFwdG9wcy4KPgo+IFNpbmNlIEkgdGhpbmsg
eW91IG1lbnRpb25lZCB5b3UnZCBvbmx5IGJlIGVuYWJsaW5nIHRoaXMgb24gbmV3ZXIKPiBjaGlw
c2V0cywgd29uJ3QgaXQgYmUgYSBwcm9ibGVtIGZvciBBK0Egd2hlcmUgb25lIEEgaXMgYSBnZW5l
cmF0aW9uCj4gYmVoaW5kIHRoZSBvdGhlcj8KPgo+IEknbSBub3QgcmVhbGx5IGxpa2luZyB3aGVy
ZSB0aGlzIGlzIGdvaW5nIGJ0dywgc2VlbXMgbGlrZSBhIGlsbAo+IHRob3VnaHQgb3V0IGNvbmNl
cHQsIGlmIEFNRCBpcyByZWFsbHkgZ29pbmcgZG93biB0aGUgcm9hZCBvZiBkZXNpZ25pbmcKPiBo
dyB0aGF0IGlzIGN1cnJlbnRseSBMaW51eCBpbmNvbXBhdGlibGUsIHlvdSBhcmUgZ29pbmcgdG8g
aGF2ZSB0bwo+IGFjY2VwdCBhIGJpZyBwYXJ0IG9mIHRoZSBidXJkZW4gaW4gYnJpbmdpbmcgdGhp
cyBzdXBwb3J0IGluIHRvIG1vcmUKPiB0aGFuIGp1c3QgYW1kIGRyaXZlcnMgZm9yIHVwY29taW5n
IGdlbmVyYXRpb25zIG9mIGdwdS4KCkluIGNhc2UgbXkgcHJldmlvdXMgZS1tYWlsIHNvdW5kZWQg
dG9vIGVudGh1c2lhc3RpYywgSSdtIGFsc28gcGVuc2l2ZQphYm91dCB0aGlzIGRpcmVjdGlvbi4g
IEknbSBub3Qgc3VyZSBJJ20gcmVhZHkgdG8gdG90YWxseSBnaXZlIHVwIG9uCmFsbCBvZiBMaW51
eCBXU0kganVzdCB5ZXQuICBXZSBkZWZpbml0ZWx5IHdhbnQgdG8gaGVhZCB0b3dhcmRzIG1lbW9y
eQpmZW5jZXMgYW5kIGRpcmVjdCBzdWJtaXNzaW9uIGJ1dCBJJ20gbm90IGNvbnZpbmNlZCB0aGF0
IHRocm93aW5nIG91dAphbGwgb2YgaW50ZXJvcCBpcyBuZWNlc3NhcnkuICBJdCdzIGNlcnRhaW5s
eSBhIHZlcnkgYmlnIGhhbW1lciBhbmQgd2UKc2hvdWxkIHRyeSB0byBmaWd1cmUgb3V0IHNvbWV0
aGluZyBsZXNzIGRlc3RydWN0aXZlLCBpZiB0aGF0J3MKcG9zc2libGUuICAoSSBkb24ndCBrbm93
IGZvciBzdXJlIHRoYXQgaXQgaXMuKQoKLS1KYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
