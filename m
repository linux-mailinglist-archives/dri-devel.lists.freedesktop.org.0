Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B47F62D80
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 03:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F11C89CF7;
	Tue,  9 Jul 2019 01:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E1689CF7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 01:37:53 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s7so39631842iob.11
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 18:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uOd/oGlrJQmGOyR3paSsUWyl32qF4mG/LZsN2EHNdm4=;
 b=KExz5I7VQO/WaKCqG8MSN6qOOakPxwsAHmTXvjtHTmrU9cpfnDFtzOUapGwj4XySUj
 mZyhh34AdZAi9E9U/BXpi1teE+N/BaEfwnbslxIbqgi4thpzdtenuQl3BdAqXv8iSC5O
 FO+F5bBW4rKj0xGVsU7nL4ZB/FZ1o3W2R4EU51AwOokWpNSAb0G3izaB6CGjJP4Dsj9H
 WeJe97p4Eh/dyne6u2hFHGWbjAVQFbnk95eiiyY0Xmtsqxf+mxI2q4DzObhK6f2TPWLc
 mp3dLtV7w2m++Q9Oa//N3tGR91mlYu7ghPz5uQh2EgbsePja8GZI4flBg421K8EeGEsi
 7VDQ==
X-Gm-Message-State: APjAAAVJJXY/g+Qw9LRkgLvJ92WkrncTl1T0KGuhXdwuxxql4YtJPMGG
 e+u8cQ6PyeSQNthzIAZrfg==
X-Google-Smtp-Source: APXvYqzGxBBE6CSBTeCLog4O9D6PQzOKAbZsak16GswGuWcEt/iesuaNho6fRp19X4r9iH6YUjkHcw==
X-Received: by 2002:a5e:9917:: with SMTP id t23mr7398839ioj.23.1562636272545; 
 Mon, 08 Jul 2019 18:37:52 -0700 (PDT)
Received: from localhost ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id s3sm13196924iob.49.2019.07.08.18.37.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 18:37:52 -0700 (PDT)
Date: Mon, 8 Jul 2019 19:37:50 -0600
From: Rob Herring <robh@kernel.org>
To: yongqiang.niu@mediatek.com
Subject: Re: [PATCH v3, 04/27] dt-bindings: mediatek: add dither description
 for mt8183 display
Message-ID: <20190709013750.GA30027@bogus>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
 <1559734986-7379-5-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559734986-7379-5-git-send-email-yongqiang.niu@mediatek.com>
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

T24gV2VkLCA1IEp1biAyMDE5IDE5OjQyOjQzICswODAwLCA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRl
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
