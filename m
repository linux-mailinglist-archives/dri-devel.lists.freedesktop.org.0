Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C23A57CE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 15:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0706F8982D;
	Mon,  2 Sep 2019 13:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF708982D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 13:38:58 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id d16so14654170wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 06:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=SvhFRmoRlEP5dD+Rd/+9x0kDcEgKUm1JjWNc3Yoeqhs=;
 b=WbAngj9oumEffOBFGG+iBig7fVh+yp9EjvdYpGQuTfpo+iXtXsYwIaJFH0EmhLw2xS
 lKVXNtNd/7/dON58YBPNn1tRVDaId32VRJUpyI0Ql6ERhRBsATn3YEOeCyTSriJJuzev
 1oOjvnACVTd554gHgnFkgKCzC5uBa2s9R8e7EMgtpQbuQPE5V5Kl4WM8/klO5xJ3sqva
 eDuUM7HXX06Afh+OqmoLnRRDi57bVd2KABPe7sssha8TEBbyxtOB3SIUeMt2xQMvRqTx
 hYENGhYlPV494TTtjqOUDLyuW3g/5yAbMUGQZtXLksFAzy7kWgz/AxpPfeEe4Ng8Dh6h
 nlew==
X-Gm-Message-State: APjAAAWT4YdI7xUvftnb+f9nx5di0Xv036PbF6+VTfck3B9a5OV1eF56
 i76JzZW2aoWH9ry7IzT/Rw==
X-Google-Smtp-Source: APXvYqy/kMjM4e+Q7ism1M7S1aJzfHDzEGzfxhVDRiXjrA+3mBmRb6rx1jsTojSZL5vijGvaOhqtsQ==
X-Received: by 2002:a7b:cd97:: with SMTP id y23mr5529846wmj.74.1567431536779; 
 Mon, 02 Sep 2019 06:38:56 -0700 (PDT)
Received: from localhost ([212.187.182.166])
 by smtp.gmail.com with ESMTPSA id z189sm5491333wmc.25.2019.09.02.06.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 06:38:56 -0700 (PDT)
Message-ID: <5d6d1b70.1c69fb81.67069.6e61@mx.google.com>
Date: Mon, 02 Sep 2019 14:38:55 +0100
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5,
 05/32] dt-bindings: mediatek: add mutex description for mt8183 display
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-6-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1567090254-15566-6-git-send-email-yongqiang.niu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyOSBBdWcgMjAxOSAyMjo1MDoyNyArMDgwMCwgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPiB3cm90ZToKPiBGcm9tOiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlh
dGVrLmNvbT4KPiAKPiBUaGlzIHBhdGNoIGFkZCBtdXRleCBkZXNjcmlwdGlvbiBmb3IgbXQ4MTgz
IGRpc3BsYXkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1
QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4gCgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
