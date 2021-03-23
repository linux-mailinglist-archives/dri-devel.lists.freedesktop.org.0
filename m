Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA43B34621A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 15:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E65C6E057;
	Tue, 23 Mar 2021 14:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0FD89CDB;
 Tue, 23 Mar 2021 14:58:14 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 c12-20020a4ae24c0000b02901bad05f40e4so4999581oot.4; 
 Tue, 23 Mar 2021 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OStDH/D377UMcgi9v6LDjP8DqC/uToi16zyd57lRDnc=;
 b=Nyx1fjXcz9tDHbOF5AKsnvYU1EMZAY+o/6UBsTK99ynu4SqsQakCtDZ1wxaJFV+p85
 M5HyWjTxRdXGA2qaRiLitOsKfuZ3YUdXeaEEzQeV8JhNjEaQXty93cWsnEEhQgHiLyiq
 f8tuCOJktuxFag+vZjhLCReBjXmTJk8/OX58gXPK0JSZHp4MSXG22DMtyAw/he2rUyIs
 dC8HhALyfJO/JSzPdsTpJDGsbvllk4D7JBTVgs/qMO/tQA6BuRGtW2RmwoieCeYiD5lm
 7Rf0RtR0D7Q07MAR6IsDaEXhdMcploJ+xh8sz3ta4cX9xF+qiochtH+KoKxrB1M+tyP7
 7v6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OStDH/D377UMcgi9v6LDjP8DqC/uToi16zyd57lRDnc=;
 b=dJaiFiovTWpD5P2iNmnxv+fETEG2tM3NvnETwPJo/S+tgRRQVRFkyV9Sai50OME66h
 xKTABbPtScJFnsAvG18nABiSz9J8tkEMkdGSm7LEuxXHCb01hH4ISwrEMmLedfP+ZjMd
 PqNlNjrZFBIdpR7kMS0X2HJ0uuWBDWm8iQ8+HJJ0yARW6XxcsUY9uW9BEo4oPQ49q4OW
 ztBN6Rfv7UxjtytckHreBGLnaRFlAtE8gu+/YVQLEkdSkfJ6DzCFEav10jj1xIreucir
 fas5NpLJht/9OY3d0SNjT2sn0lwcfDQXqBx6PkNQh3JwyQaEizz1r6ABjOjJzsxa3n1R
 T+JQ==
X-Gm-Message-State: AOAM530cmxNFC7nMh2cxrPVVRPWV+Uy7kLH/OuFBnr/IXrsodaN17nnG
 pmTZ8GRhWTo20DYcxqX31sFsBtP5eJg5AANN6pE=
X-Google-Smtp-Source: ABdhPJxjbnFrI6rECBfC1TqAKH6QGuLkdSIAT4vPaebNaRg199psAdzkQWQ+6TeVzG4PLlydH4USY68uvP0zSMEAd0E=
X-Received: by 2002:a4a:4005:: with SMTP id n5mr4143613ooa.61.1616511493663;
 Tue, 23 Mar 2021 07:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210322120227.60953-1-wanjiabing@vivo.com>
 <de34c5b1-1827-cc91-f719-a36a33717cb9@amd.com>
In-Reply-To: <de34c5b1-1827-cc91-f719-a36a33717cb9@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Mar 2021 10:58:02 -0400
Message-ID: <CADnq5_MVVvvuz+WfTVZFn31nb0YgK=BmE+ZuwvFvN+La9QO32A@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: Remove duplicate include of amdgpu_hdp.h
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Jonathan Kim <jonathan.kim@amd.com>, Wan Jiabing <wanjiabing@vivo.com>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, kael_w@yeah.net,
 Evan Quan <evan.quan@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgTWFyIDIyLCAyMDIxIGF0IDg6MTAgQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+Cj4K
PiBBbSAyMi4wMy4yMSB1bSAxMzowMiBzY2hyaWViIFdhbiBKaWFiaW5nOgo+ID4gYW1kZ3B1X2hk
cC5oIGhhcyBiZWVuIGluY2x1ZGVkIGF0IGxpbmUgOTEsIHNvIHJlbW92ZQo+ID4gdGhlIGR1cGxp
Y2F0ZSBpbmNsdWRlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdhbiBKaWFiaW5nIDx3YW5qaWFi
aW5nQHZpdm8uY29tPgo+Cj4gQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdS5oIHwgMSAtCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKPiA+IGluZGV4IDQ5MjY3ZWI2NDMwMi4u
Njg4MzZjMjJlZjI1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmgKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4g
PiBAQCAtMTA3LDcgKzEwNyw2IEBACj4gPiAgICNpbmNsdWRlICJhbWRncHVfZ2Z4aHViLmgiCj4g
PiAgICNpbmNsdWRlICJhbWRncHVfZGYuaCIKPiA+ICAgI2luY2x1ZGUgImFtZGdwdV9zbXVpby5o
Igo+ID4gLSNpbmNsdWRlICJhbWRncHVfaGRwLmgiCj4gPgo+ID4gICAjZGVmaW5lIE1BWF9HUFVf
SU5TVEFOQ0UgICAgICAgICAgICAxNgo+ID4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
