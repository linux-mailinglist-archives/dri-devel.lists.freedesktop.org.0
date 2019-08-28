Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857309FCFA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735CD899E6;
	Wed, 28 Aug 2019 08:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A568589A56
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 07:27:55 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id q12so3381496iog.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 00:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+lZGkxmw+ObIFEN4gnuhkssUQbM4tQhr+1ljGR1tTPo=;
 b=oTNTajzhGhSiAtpFRloMqPXcCmhKvfvptyFKcOfj4T3DDTe8mG60df+NZv5B/hdLla
 vWO2Dznf5coIgbroWVjzyT9oNB+z8g/qf4rpekXvbkrW3hqO9vIknjCmJZhjANX1+uCQ
 WqUd1SJ2GjFXBXgGNLP4W7RJeTxPQ72/lYFrNLcPLoHunZqoBFeAj8UHZRom/TJ5KSxS
 GEmQuMlvvG3+BCTNbJljERkPEYzmvTyu8zR7AG+Dh2kGNStw8ikwA0HA3suI3Kkmi3lP
 qTrkBhzCUABbBmY19NzhewSIgm+ww1c+Pvp4RF7EyV18XkfKugzhGuK727EMWNdJKNUA
 WhpA==
X-Gm-Message-State: APjAAAUSPyvrBUn7651ISBnDwkcXFq3pl4sGRTsTIll1ZKuB2l4xQdxV
 6ooZSkdfuqZSTL0q1790ReXJECpp6/hWcvy8zD4CXGiWoDc=
X-Google-Smtp-Source: APXvYqxcmekG2vVq5jo+Fa5v1UxzNZlKvXw2SO4uaO3dNLRuP629GUn/m+JB6dT2zHLd7pfD9fda27FzVOZRmTrUH1M=
X-Received: by 2002:a5e:960a:: with SMTP id a10mr2904501ioq.82.1566977274833; 
 Wed, 28 Aug 2019 00:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190823122059.5270-1-hverkuil-cisco@xs4all.nl>
 <20190823122059.5270-3-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190823122059.5270-3-hverkuil-cisco@xs4all.nl>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Wed, 28 Aug 2019 09:27:43 +0200
Message-ID: <CALFZZQHL0WQVJiHDs6TZbgfD8-PEuAKGfyv1JGA5cLTY4LSm+g@mail.gmail.com>
Subject: Re: [PATCHv10 2/2] cec: document CEC_ADAP_G_CONNECTOR_INFO and
 capability
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+lZGkxmw+ObIFEN4gnuhkssUQbM4tQhr+1ljGR1tTPo=;
 b=U6NFZlWIxmd3rOooL0aDEOPSOB1yzkVMdSWy791Pj2RjemH+aB2u+wjmfX8BrUUwnb
 IbunahbEjkdosxHcfL4mY7NY/0tWLC6uBSdo/JH4SG9hStvEhhSjcbzferdVyEIiNjIu
 cQdl7dn/t5FMqUithQLPd8ui3tCyrBEFIyQNEfjbM57ZvWMRvnSPq1XFG148rQWPY4qC
 MzpHyB5J37fq6JRkczoK3AbGJ3SlP+CJlzkjueVIZjqqZPEJARbJwphrhD+kjyvPtXdT
 6kbSCWj9ebsx5QFjOOaKAT6SIIlfTUECrdFGbUx112Sj/HzjgV6DU9zVMEujYB4C0EgD
 FLQw==
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
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkuCgpTaG91bGQgdGhpcyBwYXRjaCBhbHNvIGhhdmUgYW4gZXhwbGljaXQgRnJvbSB0YWc/CgpP
biBGcmksIEF1ZyAyMywgMjAxOSBhdCAyOjIxIFBNIEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lz
Y29AeHM0YWxsLm5sPiB3cm90ZToKPgo+IERvY3VtZW50IHRoZSBuZXcgQ0VDX0FEQVBfR19DT05O
RUNUT1JfSU5GTyBpb2N0bCBhbmQgdGhlIG5ldwo+IENFQ19DQVBfQ09OTkVDVE9SX0lORk8gY2Fw
YWJpbGl0eS4KPgo+IFNpZ25lZC1vZmYtYnk6IERhcml1c3ogTWFyY2lua2lld2ljeiA8ZGFyZWtt
QGdvb2dsZS5jb20+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNp
c2NvQHhzNGFsbC5ubD4KPiBbaHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sOiBhZGRlZCBDRUNfQ0FQ
X0NPTk5FQ1RPUl9JTkZPXQo+IFtodmVya3VpbC1jaXNjb0B4czRhbGwubmw6IGFkZGVkIERRRVZF
TlQgaGF2ZV9jb25uX2luZm9dCj4gU2lnbmVkLW9mZi1ieTogSGFucyBWZXJrdWlsIDxodmVya3Vp
bC1jaXNjb0B4czRhbGwubmw+Cj4gLS0tCi4uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
