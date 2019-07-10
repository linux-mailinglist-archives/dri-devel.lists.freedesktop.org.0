Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC6A649CC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C54C89F6F;
	Wed, 10 Jul 2019 15:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D53989F6F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:37:59 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id s49so2632015edb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 08:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=caH7wz0eHYOUOr4cbn7l3qo6FUofvKc8IBg3aJLuAz4=;
 b=a3M7QRKincKDMgiqf2LDK6JAtaZuA0qGBLdsOVrgk4KlHeH9qIbPE0Xg9umB9tMgEK
 6GuDvuPl6W4YnaaLO7eFfc4x/JpUU5L3+vw1lL0YO1TqyMtjXeKBPxyNN+iHKmUIcwL1
 6qo3FOuzVM/DaaKMn2BFsZ3cXcpXj7UqYeA5mLAH2D/yT4dw9NKfvWJfiFrjiPWwxyUP
 0lAJ4sHW/eQX3ySOe3cZ9Ulj+a27j4jJG/0P4UVrWnJzujFPFFrg54UA7ZZMFmeaz6ja
 QYTJ900mzZGYKAeF/lgRl04JynsDvX7ATwGPDUlHQIiSEWf9IjYmq7cyTPoDqvHWcO6i
 Y1dQ==
X-Gm-Message-State: APjAAAVSAxH9zE2HlKgwYHpo/YF1KFreyWBJBjUsA9KyzcGk6x8A5Kg+
 SZv3IXqu/nD33lSiNMJwpcOjbzxBPQ4=
X-Google-Smtp-Source: APXvYqx4ILQX2I/R9TLGkKt9CJVInsrzvHh6G6iyJlG7O/Js4OOuuS1lICgBkmoBUktld5U0pBSesQ==
X-Received: by 2002:a50:a4ef:: with SMTP id x44mr32707181edb.304.1562773077837; 
 Wed, 10 Jul 2019 08:37:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 17sm793598edu.21.2019.07.10.08.37.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:37:56 -0700 (PDT)
Date: Wed, 10 Jul 2019 17:37:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Remove unused function drm_agp_bind_pages
Message-ID: <20190710153754.GV15868@phenom.ffwll.local>
References: <20190707174009.GA13667@SDF.ORG>
 <20190708081816.GA27604@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708081816.GA27604@ravnborg.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=caH7wz0eHYOUOr4cbn7l3qo6FUofvKc8IBg3aJLuAz4=;
 b=bJM/PAgw/e0Mej5/Cv929kr/asN7SwLpKvvNim45Im6MGX19wPB+CodSv+rBYX3QeJ
 YCJp1f1WFVv1ycON/IklscaB9MIfmmtnjgG/W4+hPUEH1kXxXhqk6q64BoGR1L1xrm1W
 1wOMrIZ5cjDDMtpwvZ0aQkBZqlT8964YrUab8=
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
Cc: Maya Rashish <coypu@sdf.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMTA6MTg6MTZBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIE1heWEuCj4gCj4gTmljZSBjYXRjaCAtIGdvb2QgdG8gcmVtb3ZlIHVudXNlZCBj
cnVmdC4KPiAKPiBQbGVhc2UgcHJlZml4IHRoZSBzdWJqZWN0IHdpdGggc29tZXRoaW5nIGxpa2Ug
ImRybS9hZ3A6ICIuCj4gQ2hlY2sgImdpdCBsb2ciIG9uIHRoZSBzYW1lIGZpbGUgdG8gcGljayB1
cCB0aGUgdXN1YWwgd2F5IHRvIGlkZW50aWZ5Cj4gYWdwIHNwZWNpZmljIGNoYW5nZXMuCj4gCj4g
V2l0aCB0aGlzIGZpeGVkOgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+Cj4gCj4gWW91IGNvdWxkIGFsc28gY29uc2lkZXIgdG8gYWRkIGEgZmV3IHdvcmRzIGlu
IHRoZSBib2R5IG9mIHRoZSBjaGFuZ2Vsb2cKPiBob3cgdGhlIHVudXNlZCBmdW5jdGlvbiB3YXMg
aWRlbnRpZmllZC4KCkFsc28gbmVlZHMgc29iIHBlciBodHRwczovL2RyaS5mcmVlZGVza3RvcC5v
cmcvZG9jcy9kcm0vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbCNzaWduLXlvdXItd29y
ay10aGUtZGV2ZWxvcGVyLXMtY2VydGlmaWNhdGUtb2Ytb3JpZ2luCi1EYW5pZWwKCj4gCj4gCVNh
bQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
