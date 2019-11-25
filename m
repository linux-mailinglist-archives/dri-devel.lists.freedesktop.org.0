Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A21109084
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 15:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869118919F;
	Mon, 25 Nov 2019 14:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9378916A;
 Mon, 25 Nov 2019 14:57:35 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b18so18426020wrj.8;
 Mon, 25 Nov 2019 06:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jMq2KmDJf7iQgH3rZI9pg6UxlMOPDJy2jieZWQCQ8nI=;
 b=bfHQn5vj72VEznZggKzWVgV1A13V+EH4RAshQYop+GFDfdjBm07MqgOdjUgC6j1xh1
 SY2y3UO8v5qkeQ9nFJYvio5Lyio8NsH3V37POfxJ/bGjUt1KCcYEQDBQ/9gYJys6knBJ
 mxuGbxhNVaYlUuJjZvK5VS6eCAuCwNyhXwP/ZpUXg9Y4WcGeiHxoXnRuRNK8s60VwIeQ
 2iJ8VAraMU9WZw+ifgGyfrj8PL3zUxMqiRA/CwR9DJ9ydvi66f8zPvs1vf5r0GPs9AAF
 s+wkDRmYmwInVLNo+yOGDa1nGO+ITy4iVAMIEc1VwNZ44x11YPw6wGJz9eGd32/34zMF
 bpNA==
X-Gm-Message-State: APjAAAW/pBVrPXkIOfj4SNLVkyY5pTAz+Bhz2dUHh4QtTrwVNW4a9zli
 nr5Hu/Uy1UXhv6bRsu1ndCNHWNonpV7wK18lwOk=
X-Google-Smtp-Source: APXvYqyBEBz4DLhGwEqnQXuuwgtnvhxvND5xJo5P1g3sikTl//dUv2f4kUmgIXuJ3Pa/Vhr3kgUox46acpI1LPdnN2M=
X-Received: by 2002:adf:9d87:: with SMTP id p7mr12269294wre.11.1574693853836; 
 Mon, 25 Nov 2019 06:57:33 -0800 (PST)
MIME-Version: 1.0
References: <20191122231504.109948-1-colin.king@canonical.com>
In-Reply-To: <20191122231504.109948-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Nov 2019 09:57:20 -0500
Message-ID: <CADnq5_OhXB-FC8ZGVUpv3LSk2WJ1RMymHfnv5ge0yiqErFxNUA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: remove redundant assignment to variable ret
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jMq2KmDJf7iQgH3rZI9pg6UxlMOPDJy2jieZWQCQ8nI=;
 b=rzMXb7o0TAY6RWesHVl44pC4iQEZk1ctSEX4GZHqmoWPZbrWKl8jb4vRyaFN4ggRw6
 5PM+TypGT8XJRM7wGBV4OabX5ZxYTUbGu3rJRJYmuQjdCEEq7QL3zDokS8q9Ua9ZqNzD
 5E32LPcycp+Ex493L681zivfN6C9fCq2suxi+Zir3hfzxKF/ZiaIj4GAGBPrQb5hevBf
 NbE640+GHW6QnGlDHF1u7UdIm1oRRhrl3f18iRx2KaSd6Uk5j8BKAgOIQ6VZMF8RM8Yq
 dj4hgxZLihzHNERrxlVZZhYy1fiMwd7Y4bSb6smaApqcL/UwG/6iWoC9mM+VUCM+Pqn7
 F5sg==
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgNjoxNSBQTSBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdA
Y2Fub25pY2FsLmNvbT4KPgo+IFRoZSB2YXJpYWJsZSByZXQgaXMgYmVpbmcgaW5pdGlhbGl6ZWQg
d2l0aCBhIHZhbHVlIHRoYXQgaXMgbmV2ZXIKPiByZWFkIGFuZCBpdCBpcyBiZWluZyB1cGRhdGVk
IGxhdGVyIHdpdGggYSBuZXcgdmFsdWUuIFRoZQo+IGluaXRpYWxpemF0aW9uIGlzIHJlZHVuZGFu
dCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4KPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW51c2VkIHZh
bHVlIikKPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmlj
YWwuY29tPgoKQXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vc2lfZHBtLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
c2lfZHBtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jCj4gaW5kZXggODE0OGE3
ODgzZGU0Li4zNDYzMTViM2VlYmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9zaV9kcG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmMKPiBAQCAt
NTg5OSw3ICs1ODk5LDcgQEAgc3RhdGljIGludCBzaV9wYXRjaF9zaW5nbGVfZGVwZW5kZW5jeV90
YWJsZV9iYXNlZF9vbl9sZWFrYWdlKHN0cnVjdCByYWRlb25fZGV2aWMKPgo+ICBzdGF0aWMgaW50
IHNpX3BhdGNoX2RlcGVuZGVuY3lfdGFibGVzX2Jhc2VkX29uX2xlYWthZ2Uoc3RydWN0IHJhZGVv
bl9kZXZpY2UgKnJkZXYpCj4gIHsKPiAtICAgICAgIGludCByZXQgPSAwOwo+ICsgICAgICAgaW50
IHJldDsKPgo+ICAgICAgICAgcmV0ID0gc2lfcGF0Y2hfc2luZ2xlX2RlcGVuZGVuY3lfdGFibGVf
YmFzZWRfb25fbGVha2FnZShyZGV2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcmRldi0+cG0uZHBtLmR5bl9zdGF0ZS52
ZGRjX2RlcGVuZGVuY3lfb25fc2Nsayk7Cj4gLS0KPiAyLjI0LjAKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
