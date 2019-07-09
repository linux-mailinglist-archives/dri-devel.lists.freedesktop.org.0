Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB35262D7E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 03:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08AB89CE1;
	Tue,  9 Jul 2019 01:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC1989CE1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 01:37:43 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k20so39611427ios.10
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 18:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rt46CmBrJxWpxaSmwKwGFBfR/eZrxQhs6asslQRNZ5w=;
 b=Zf6y/OCgfXNH0NjmklWjuZ0QATuXCO9xOgIFIJMwTbEXuFw7jUl96O9J+MW5VrPLKl
 qgb10Gum0yP+ll/Lgmh+eopLoN8NNktmqifmwC7trBF507ni83+xecO8UytxjqO8n7XM
 Ka3hX5D2HQKPJvXqNiVeTF5XNIhOu8+XtXBQasSTq6cVSkbqAXu7VkK7tGpQ4IadK3k5
 ViwFReIBsk8u3YshGqh6BCFveorAqFMUur3tjP/yjFGVd0/CG3GgWmropIuXAheLiTL5
 oC8Orjxr3qtNFNDuIFbXPlu2KCXAMPHYuTLATxl3eeTbBNXvpw/cfxrdc/nUYQ8dkxMz
 zuWw==
X-Gm-Message-State: APjAAAX++hYvv76yiFlWL7ioSbF3+QHWB14xmK09bQ2DBaN1fhF5umA+
 YNUlzYmfA0GHhqZQXJIHhg==
X-Google-Smtp-Source: APXvYqzPY/xWzmhADFj1fMhI/5R2iKDWY+q2CZ9P/YspzMA+qJZakBS+tSlpy3FD1YaXxAK/9OjWUQ==
X-Received: by 2002:a05:6638:627:: with SMTP id
 h7mr25308804jar.33.1562636262340; 
 Mon, 08 Jul 2019 18:37:42 -0700 (PDT)
Received: from localhost ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id i4sm25223321iog.31.2019.07.08.18.37.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 18:37:41 -0700 (PDT)
Date: Mon, 8 Jul 2019 19:37:41 -0600
From: Rob Herring <robh@kernel.org>
To: yongqiang.niu@mediatek.com
Subject: Re: [PATCH v3, 03/27] dt-bindings: mediatek: add ccorr description
 for mt8183 display
Message-ID: <20190709013741.GA29622@bogus>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
 <1559734986-7379-4-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559734986-7379-4-git-send-email-yongqiang.niu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA1IEp1biAyMDE5IDE5OjQyOjQyICswODAwLCA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRl
ay5jb20+IHdyb3RlOgo+IEZyb206IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPgo+IAo+IFVwZGF0ZSBkZXZpY2UgdHJlZSBiaW5kaW5nIGRvY3VtZW50aW9uIGZvciB0
aGUgZGlzcGxheSBzdWJzeXN0ZW0gZm9yCj4gTWVkaWF0ZWsgTVQ4MTgzIFNPQ3MKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAt
LS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZGlzcC50eHQgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4gCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
