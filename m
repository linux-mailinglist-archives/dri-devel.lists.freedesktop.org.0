Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9001358E26
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 22:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC566E0DC;
	Thu,  8 Apr 2021 20:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A296E0DC;
 Thu,  8 Apr 2021 20:15:01 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so3559398ote.6; 
 Thu, 08 Apr 2021 13:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fSyGCV+42Tn2FNMB0D082ETaBFNTCWSnO+C8UHw9KUc=;
 b=pZi8oqyfzlJuZ/hY99MGJJ9iBoEnXV3mcYntUO9BnHsPfeAZ+IP85TRfaQLBcWgcUB
 oeJ3McgJDauGT1z89mQwDtaM5n+yKzybfljQaN+bk5WNh9lrKf4evwdHF2KRgD2t95wl
 3EqFhN3bK5EA5GDTE5mIUsJ8q2bnhXKQsFhqoyji8jyrpzRquhUeHsVBDplQcKe9Nmq4
 jrmNcui6TuSeNMHOrNkiaI7JkjT82JWIWO6j5S++lGmyjzk08o4m+0/sEOgZ8ToRW+XZ
 02qe3fODacYsxZJlHUQ0Y/jYCyMrmb1yKMtDr9opNaspmccXNdsyLB9zpIXcxlZyOGmh
 vJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fSyGCV+42Tn2FNMB0D082ETaBFNTCWSnO+C8UHw9KUc=;
 b=cL7gWe6IHyBHpUTO7iKIaKIlsP61/6i9rkQSD3azXFCzYs1/5XWhS9vpg7bjVgRwo+
 mRTycpFdVa2zDq8WmVjh2smaJFUVVjqusgjTMb9xgeqtBslnKVod9kGuISXMlqU9Xp9n
 rlhICPaLkY4vahvkmQRxH+6TnjJyffZLvYJCbrowcBD2jN00iUBpl7XReGO1n4AB7sDo
 cjGY9WoXc+rYl8qIRR5ggCnf25BsbDs13ualHC44QCOKXI9FZKmUPNrctJGycDiWcWQ+
 YZ7KUr2nwZ64kugp1rQvHkXrIxfPsO2VicQRrnN+C51B365cppm9owXGrVnSY7EnDnnd
 k6rA==
X-Gm-Message-State: AOAM532mqK1o1FMeQDToDZo89mhcPSD8B5Zc0HyhNS0A5Sdj3i2BC2KG
 kwtnv019L8zDHVTpqqq4Mi1AOHAKHWYUNXBWYp8=
X-Google-Smtp-Source: ABdhPJy2c4s1DJgwEvC/6Zed3Yp/2/uruCUbyDkFtpUKs1gSAbrwn09XQTVatqKOAC8h+ZF6L5eASHw6sodJaDJsDco=
X-Received: by 2002:a9d:7288:: with SMTP id t8mr9614074otj.132.1617912900546; 
 Thu, 08 Apr 2021 13:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <1617885718-2697-1-git-send-email-zhangshaokun@hisilicon.com>
 <e04c678a-d679-1747-e933-a80df493a02c@amd.com>
In-Reply-To: <e04c678a-d679-1747-e933-a80df493a02c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Apr 2021 16:14:49 -0400
Message-ID: <CADnq5_Oc=5qCbmd5TDBZTQDgFmb9pVvjyTXtR4rhr8q5FOFCjA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Fix the Wunused-function warning
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Solomon Chiu <solomon.chiu@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Ma <hanghong.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcy4KCkFsZXgKCk9uIFRodSwgQXByIDgsIDIwMjEgYXQgMTE6MDkgQU0g
SGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+IHdyb3RlOgo+Cj4gT24gMjAy
MS0wNC0wOCA4OjQxIGEubS4sIFNoYW9rdW4gWmhhbmcgd3JvdGU6Cj4gPiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYzo5NDE6MTM6IHdh
cm5pbmc6IOKAmGRtX2RtdWJfdHJhY2VfaGlnaF9pcnHigJkgZGVmaW5lZCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWZ1bmN0aW9uXQo+ID4gICAgOTQxIHwgc3RhdGljIHZvaWQgZG1fZG11Yl90cmFj
ZV9oaWdoX2lycSh2b2lkICppbnRlcnJ1cHRfcGFyYW1zKQo+ID4gICAgICAgIHwgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4KPiA+IEZpeGVzOiA4M2IzOWUxZmMzZWEgKCJk
cm0vYW1kL2Rpc3BsYXk6IExvZyBETUNVQiB0cmFjZSBidWZmZXIgZXZlbnRzIikKPiA+IENjOiBM
ZW8gKEhhbmdob25nKSBNYSA8aGFuZ2hvbmcubWFAYW1kLmNvbT4KPiA+IENjOiBEYW5pZWwgV2hl
ZWxlciA8ZGFuaWVsLndoZWVsZXJAYW1kLmNvbT4KPiA+IENjOiBIYXJyeSBXZW50bGFuZCA8SGFy
cnkuV2VudGxhbmRAYW1kLmNvbT4KPiA+IENjOiBTb2xvbW9uIENoaXUgPHNvbG9tb24uY2hpdUBh
bWQuY29tPgo+ID4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
PiA+IFNpZ25lZC1vZmYtYnk6IFNoYW9rdW4gWmhhbmcgPHpoYW5nc2hhb2t1bkBoaXNpbGljb24u
Y29tPgo+Cj4gUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPgo+Cj4gSGFycnkKPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAyICstCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+ID4gaW5kZXggZGFhY2M1Y2M4ZDUx
Li41Mjk4ZTVkNDA3NWIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gPiBAQCAtOTM3LDYgKzkzNyw3IEBAIHN0YXRp
YyBpbnQgZG1fZG11Yl9od19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ID4gICAg
ICAgcmV0dXJuIDA7Cj4gPiAgIH0KPiA+Cj4gPiArI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURf
RENfRENOKQo+ID4gICAjZGVmaW5lIERNVUJfVFJBQ0VfTUFYX1JFQUQgNjQKPiA+ICAgc3RhdGlj
IHZvaWQgZG1fZG11Yl90cmFjZV9oaWdoX2lycSh2b2lkICppbnRlcnJ1cHRfcGFyYW1zKQo+ID4g
ICB7Cj4gPiBAQCAtOTYzLDcgKzk2NCw2IEBAIHN0YXRpYyB2b2lkIGRtX2RtdWJfdHJhY2VfaGln
aF9pcnEodm9pZCAqaW50ZXJydXB0X3BhcmFtcykKPiA+ICAgICAgIEFTU0VSVChjb3VudCA8PSBE
TVVCX1RSQUNFX01BWF9SRUFEKTsKPiA+ICAgfQo+ID4KPiA+IC0jaWYgZGVmaW5lZChDT05GSUdf
RFJNX0FNRF9EQ19EQ04pCj4gPiAgIHN0YXRpYyB2b2lkIG1taHViX3JlYWRfc3lzdGVtX2NvbnRl
eHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBkY19waHlfYWRkcl9zcGFjZV9j
b25maWcgKnBhX2NvbmZpZykKPiA+ICAgewo+ID4gICAgICAgdWludDY0X3QgcHRfYmFzZTsKPiA+
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFt
ZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
