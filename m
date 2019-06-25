Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2782B5643F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0958B6E30E;
	Wed, 26 Jun 2019 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752BA6E137
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:58:19 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id h6so2165964ioh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 07:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hlZIgR7yHjC3KUzbvkJe7XThmpOgxwcG18TIgT/ItI4=;
 b=aMPDh69ZNnYhQYknuRmnjoAZ6qB+N+tbJGt1YZFaVfOTSlQ2pPglrJbaKShwUROMXd
 CagiRu2n7U0GbWS1LdR6SByEjU1mfIiPYM0dk0XNti0gHhtKMn4BNg0TZBw9UZLUZW2z
 kDasR8lfMs+MYDh3B4JGILEET1VW6P0WFcWm4uTgH4Me8CmwYmpW3opCrJZBHKt+GcUu
 0vNhepdzhoEKND79Rp5/2eGhTcxfAH8+kRYy6bD5A4XMImiGwtTRqURuJYOUzsA/1Zkm
 syD/l/psJOrUMEeVtX0HH9/g7cfKMmI6TQiyeyG4ZT5hlfN/rh3S6+bob4yVM6n6zkqi
 q8Yw==
X-Gm-Message-State: APjAAAXVIl3/pQ2KT2Kc6XLAdbPrhJa5+wCdKcXLuoKE85HDT9tTDAiq
 mOq86KxvTE3mFvTek/FmKMAXQsqKy9WmzGhxhyY7/A==
X-Google-Smtp-Source: APXvYqzcYXFapA9i91+3XG4ii4DKax4nyujj139jZ22IYyQ/I1KtdjJ85nx+BY32dlTJvrLuJ9J4PCDAP68MSg+ek7o=
X-Received: by 2002:a5e:d507:: with SMTP id e7mr8149566iom.284.1561474698620; 
 Tue, 25 Jun 2019 07:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
 <20190625144510.122214-5-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190625144510.122214-5-hverkuil-cisco@xs4all.nl>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Tue, 25 Jun 2019 16:58:07 +0200
Message-ID: <CALFZZQFH4Hr4NW6U9D9RhPSAnDGDkd_C83yXyn2A1CgPOTJqkw@mail.gmail.com>
Subject: Re: [PATCHv9 04/13] cec: expose the new connector info API
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hlZIgR7yHjC3KUzbvkJe7XThmpOgxwcG18TIgT/ItI4=;
 b=G6+Et6YrU9kpO8k/pCFxaas2aaEYAbHqyQ+AdNtRxd03rpKqEf7cOLJRq2wcxTmv/d
 1n1Ee8zRdFFCBWd408Y2UOcQqfjooYgm+AJCxcyNSPLXcjGSD28oIyV7WrnTj0JGF+Fv
 efIcgjeI/go2JKLoLp7B+T6hMCl/By1p9fNcKN335usJxk4DYYreAZLtJsGWBGXIdSg8
 weQZIVVmfVCDyTg3Tlzqjm1F+LiBShdGLgmXgWEdtclL3uiaFvo9sFW2ggCVFuuO1Fim
 6gQNQZTjjJgdZPgcebDxT1R6JhwAyAyZwReLSO0i44be6oUQTOdQU4SeyVei1NA4txF9
 gJOw==
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
Cc: Cheng-yi Chiang <cychiang@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWdhaW4uCk9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDQ6NDUgUE0gSGFucyBWZXJrdWlsIDxo
dmVya3VpbC1jaXNjb0B4czRhbGwubmw+IHdyb3RlOgo+Cj4gKyAgICAgICBtdXRleF9sb2NrKCZh
ZGFwLT5sb2NrKTsKPiArICAgICAgIGlmIChjb3B5X3RvX3VzZXIocGFyZywgJmFkYXAtPmNvbm5f
aW5mbywgc2l6ZW9mKGFkYXAtPmNvbm5faW5mbykpKQo+ICsgICAgICAgICAgICAgICByZXQgPSAt
RUZBVUxUOwo+ICsgICAgICAgbXV0ZXhfdW5sb2NrKCZhZGFwLT5sb2NrKTsKPiArICAgICAgIHJl
dHVybiByZXQ7Cj4gK30KU2hvdWxkbid0IHRoZSBsb2NrIGJlIHJlbGVhc2VkIGJlZm9yZSBjYWxs
aW5nIGNvcHlfdG9fdXNlcj8gSSBndWVzcwp5b3UgbmVlZCB0byBtYWtlIGFuIGV4dHJhIGNvcHkg
b2YgdGhlIGNvbm5faW5mbywgbGlrZSBpdCBpcyBkb25lIGZvcgpvdGhlciBpb2N0bHMuCgpSZWdh
cmRzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
