Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6CE3623A3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 17:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832696EC32;
	Fri, 16 Apr 2021 15:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B466EC29
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:16:59 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id d10so19400062pgf.12
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iZIk0aLinkPRuf273+Q/1LAJDwezCeFzqfYN5QCoxuo=;
 b=uE5mc2vrDQxDYdX8YPJC4f16Om8RfUA9YyCQ2gR1FHuqwyaonwA32aZibSZynz0EPA
 HEJqaYg8H0bdyzrVmv3BHA0jZ0WXrR08iRAbF5/GAtkRMAFI+RQ7yaN8ilj9hpU7jx+z
 rd5BARLy7iAOvzT8i1hRwIQLigTm0tNOeOCK6SQ+/yZRHkQtHs+xtFeirbiM/HpLhema
 ufFz0smIt66s0lZVaZ+LeuaUyJLD6fC2BlMXFJ7czyUWcy3ZTmc9Zb6H6TYYmZQGEMuG
 SmsT3Meq9AfDThaBAoOYnj2j7GJrm4DnpMOUVxfo0QXm+uGfBRAxXXeqmlJXiYQ6KRPq
 8aBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iZIk0aLinkPRuf273+Q/1LAJDwezCeFzqfYN5QCoxuo=;
 b=RokJ7ddSecznY9jmULIPf3vNCeCyeBq9d7n8QF/b06UrOWBZ+oALIUFZRuUbY9mwHj
 Ne5E6FhuGrM8F89ld2HMQz1a3vCtFWPCWjh0IoI11iQhFWgkA545Ib5nypr8l1v8ihZV
 SnTp3fKTlAanBTVYhMiDUtSwTWP2VclPrfs+WLV+Yr3R8NSoAB8HdMNLxVJol4q/a691
 aQArqUqWcPHDRAF5zWvSlB8C8wHDJcJdxjdQz6ss7rv5wD2YA2zRf6SY/LsZZjDGCWjc
 kQjIN/QBUN+++E4tq5i3J+hSwHOsxJlUlfU3PJBmz2KtAm/11AW/QVfu1aHkatskEpOr
 8N+g==
X-Gm-Message-State: AOAM5327ktFPB39/6NU2MaIAHzOxCBVEPu+EMgTMas/bOvWyVMIIY8FS
 rMeDb+/iEZut8tojhJRkr5ubi0q/6HY5CL7MmIEhww==
X-Google-Smtp-Source: ABdhPJxnwMMPOkBUQ10KcypaYyaM0TqEmX1JqvHIod7LhIcpUBrbxPhc5vRnBhNq0yr1AkHBGc5QRRUj1NdTgbhXHSI=
X-Received: by 2002:a63:530d:: with SMTP id h13mr8497692pgb.120.1618586218797; 
 Fri, 16 Apr 2021 08:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210331133313.411307-1-adrien.grassein@gmail.com>
 <20210331133313.411307-2-adrien.grassein@gmail.com>
 <20210331144230.GP2088@kadam>
 <CABkfQAH+3Ox9=JiYPkUiXT2soPv-FnCkqNtwvOj7EXvrMT4Z=w@mail.gmail.com>
In-Reply-To: <CABkfQAH+3Ox9=JiYPkUiXT2soPv-FnCkqNtwvOj7EXvrMT4Z=w@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 16 Apr 2021 17:16:47 +0200
Message-ID: <CAG3jFyvcvzmejQztzFM1n_vePL67qmfSrqDdHrckxf1Z9UK+NA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/bridge: lt8912b: fix incorrect handling of
 of_* return values
To: Adrien Grassein <adrien.grassein@gmail.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IEFkcmllbiwKCk9uIEZyaSwgMTYgQXByIDIwMjEgYXQgMTQ6MDIsIEFkcmllbiBHcmFzc2Vp
biA8YWRyaWVuLmdyYXNzZWluQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBSb2JlcnQsCj4KPiBD
b3VsZCB5b3UgcGxlYXNlIGhhdmUgYSBsb29rIGF0IHRoaXMgcGF0Y2g/Cj4gSXQgaGFzIGJlZW4g
cmV2aWV3ZWQgYnkgdGhlIGJ1ZyByZXBvcnRlciBhbmQgYW5vdGhlciBwZXJzb24uCj4KPiBJIGRv
bid0IHJlY2VpdmUgYW55ICJtZXJnZWQiIG1lc3NhZ2UuCj4KPiBUaGFua3MgYSBsb3QsCj4gQWRy
aWVuCj4KPiBMZSBtZXIuIDMxIG1hcnMgMjAyMSDDoCAxNjo0MiwgRGFuIENhcnBlbnRlciA8ZGFu
LmNhcnBlbnRlckBvcmFjbGUuY29tPiBhIMOpY3JpdCA6Cj4gPgo+ID4gT24gV2VkLCBNYXIgMzEs
IDIwMjEgYXQgMDM6MzM6MTNQTSArMDIwMCwgQWRyaWVuIEdyYXNzZWluIHdyb3RlOgo+ID4gPiBB
IHN0YXRpYyBhbmFseXNpcyBzaG93cyBzZXZlcmFsIGlzc3VlcyBpbiB0aGUgZHJpdmVyIGNvZGUg
YXQKPiA+ID4gcHJvYmluZyB0aW1lLgo+ID4gPgo+ID4gPiBEVCBwYXJzaW5nIGVycm9ycyB3ZXJl
IGJhZCBoYW5kbGVkIGFuZCBjb3VsZCBsZWFkIHRvIGJ1Z3M6Cj4gPiA+ICAgLSBCYWQgZXJyb3Ig
ZGV0ZWN0aW9uOwo+ID4gPiAgIC0gQmFkIHJlbGVhc2Ugb2YgcmVzc291cmNlcwo+ID4gPgo+ID4g
PiBSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+
ID4gPiBTdWdnZXN0ZWQtYnk6IERhbiBDYXJwZW50ZXIgIDxkYW4uY2FycGVudGVyQG9yYWNsZS5j
b20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFkcmllbiBHcmFzc2VpbiA8YWRyaWVuLmdyYXNzZWlu
QGdtYWlsLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ft
c3VuZy5jb20+Cj4gPgo+ID4gR3JlYXQhICBUaGFua3MhCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IERh
biBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KCkZpeGVkIGEgY2hlY2twYXRj
aCAtLXN0cmljdCBuaXQsIGFkZGVkIGBMaW5rYCB0YWcgYW5kIGFkZGVkICdGaXhlc2AgdGFnLgoK
TWVyZ2VkIGZvciB2NS4xMyBpbiBkcm0tbWlzYy1uZXh0LWZpeGVzLgoKClJvYi4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
