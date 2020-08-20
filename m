Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1324C8C3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 01:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9469C6EA78;
	Thu, 20 Aug 2020 23:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC426EA78
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:44:54 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2826207DF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597967094;
 bh=OrvMhzElo/BOA9sucY6YNBL0y8bC8eI2i5C7W2muAhY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jZnXbZvd6r/RDmhRl8Pd5bDqWjtnOLOVXZheUhdWXNR8JZL8+j8DXWO/rfJUaVM7s
 /aoaV762OQv+WFcuD4lrNZquWhQrGZiaGbYEq0edwA/JnZ6oCShF0kGqpoBWarODnk
 T0eURcudahnEMu2tSEyme9KyN5dYpoIqloRcKgaU=
Received: by mail-ej1-f50.google.com with SMTP id qc22so252855ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 16:44:53 -0700 (PDT)
X-Gm-Message-State: AOAM530I3YvjCPQhrTAbnnWVEKT5/wWmkJqK6zcbDuYxWmo2MGs9iaVn
 UGjxY80fv/4mrvm9QB+npjMV+zy2pClFGnp/ZQ==
X-Google-Smtp-Source: ABdhPJyfF0seo8n875amt4dn9oSi2w9SsfnbMsQlnhtKaOBwUNOQeGo3OezMKFROAQyoW2OBGtjzdsNfwx1Y6KwE1IM=
X-Received: by 2002:a17:906:3a41:: with SMTP id
 a1mr337598ejf.260.1597967092612; 
 Thu, 20 Aug 2020 16:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
 <1597903458-8055-9-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1597903458-8055-9-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:44:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Xt8=tQByDAZwuu_TT9bta1UtLak58uNKb2YM9XtG8DA@mail.gmail.com>
Message-ID: <CAAOTY_9Xt8=tQByDAZwuu_TT9bta1UtLak58uNKb2YM9XtG8DA@mail.gmail.com>
Subject: Re: [PATCH v1 08/21] drm/mediatek: check if fb is null
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHlm5sg5LiL5Y2IMjowNuWvq+mBk++8mgo+Cj4gSXQn
cyBwb3NzaWJsZSB0aGF0IHN0YXRlLT5iYXNlLmZiIGlzIG51bGwuIEFkZCBhIGNoZWNrIGJlZm9y
ZSBhY2Nlc3MgaXRzCj4gZm9ybWF0LgoKQWRkIGEgRml4ZXMgdGFnLgoKUmVnYXJkcywKQ2h1bi1L
dWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1l
ZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3Zs
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiBpbmRleCA0Mjdm
ZTdmLi4yNTA2ODAzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwu
Ywo+IEBAIC0yNjksNyArMjY5LDcgQEAgc3RhdGljIHZvaWQgbXRrX292bF9sYXllcl9jb25maWco
c3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50IGlkeCwKPiAgICAgICAgIH0K
Pgo+ICAgICAgICAgY29uID0gb3ZsX2ZtdF9jb252ZXJ0KG92bCwgZm10KTsKPiAtICAgICAgIGlm
IChzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpCj4gKyAgICAgICBpZiAoc3RhdGUt
PmJhc2UuZmIgJiYgc3RhdGUtPmJhc2UuZmItPmZvcm1hdC0+aGFzX2FscGhhKQo+ICAgICAgICAg
ICAgICAgICBjb24gfD0gT1ZMX0NPTl9BRU4gfCBPVkxfQ09OX0FMUEhBOwo+Cj4gICAgICAgICBp
ZiAocGVuZGluZy0+cm90YXRpb24gJiBEUk1fTU9ERV9SRUZMRUNUX1kpIHsKPiAtLQo+IDEuOC4x
LjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
