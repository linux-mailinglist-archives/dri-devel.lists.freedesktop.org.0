Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5412673D31
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 22:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2406E64F;
	Wed, 24 Jul 2019 20:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821656E64F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 20:15:21 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id m24so92371418ioo.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 13:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=I8CjyViUUMDogLJ5VWVPS6e/PwcUeKuF+6IP3/vGsBs=;
 b=RkaziiCx0ZLsk9Bi2bzA/adOy8pLTYQ0vFXTqbc8z68k44njXUCBfuRcqBhnL/RhsS
 HqAOzOTx+5isJJkHvSr9qD+evQNnxQlkh4qhpNmN3bJ6E6CUIY9EsOgv0JqaQ7Z+uq2K
 E9cL3DQa3BPUqqcj5bg4eXdXe7a3hSmal8lI/rh+DOItij90fzjwMvMueBhzTXb3l0LN
 CgbQqaqhFpPorV6Uwp+IhL5qdbNVNWmrX6A0LUr27khk99Z8kfMnXLXiGtYNsBIc9/J2
 rv7uNcIYU160NS9oTON9dGNcOdd/YJGO4HfxnmIBW4eePXXRlIucd13swzLXl/zURoX5
 3Kdw==
X-Gm-Message-State: APjAAAW49cg5EKQyfmczLp0e2MxLRDhAy8mhXCCdrZFZjnblCGgITh00
 KfvGwdDip1BMYdaXFePo1Q==
X-Google-Smtp-Source: APXvYqybRcRkXoHjkdesxQbBTM2QuHB/KR5mvS2bWaUpVJ+8PZzHrz+31LV30zjboYU8LvifX/teOw==
X-Received: by 2002:a6b:8e82:: with SMTP id q124mr68424936iod.68.1563999320721; 
 Wed, 24 Jul 2019 13:15:20 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id v10sm41420293iob.43.2019.07.24.13.15.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 13:15:20 -0700 (PDT)
Date: Wed, 24 Jul 2019 14:15:19 -0600
From: Rob Herring <robh@kernel.org>
To: yongqiang.niu@mediatek.com
Subject: Re: [PATCH v4, 02/33] dt-bindings: mediatek: add ovl_2l description
 for mt8183 display
Message-ID: <20190724201519.GA18133@bogus>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-3-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562625253-29254-3-git-send-email-yongqiang.niu@mediatek.com>
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

T24gVHVlLCA5IEp1bCAyMDE5IDA2OjMzOjQyICswODAwLCA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRl
ay5jb20+IHdyb3RlOgo+IEZyb206IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPgo+IAo+IFVwZGF0ZSBkZXZpY2UgdHJlZSBiaW5kaW5nIGRvY3VtZW50aW9uIGZvciB0
aGUgZGlzcGxheSBzdWJzeXN0ZW0gZm9yCj4gTWVkaWF0ZWsgTVQ4MTgzIFNPQ3MKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAt
LS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAg
fCAyNyArKysrKysrKysrKy0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
