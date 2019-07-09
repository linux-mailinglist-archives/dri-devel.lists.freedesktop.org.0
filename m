Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FA062D7C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 03:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E019D89CE0;
	Tue,  9 Jul 2019 01:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CAA89CE0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 01:37:20 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z3so24705503iog.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 18:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QaPsRNpH7tGuW4jgrRhCMvtpmTscMl8GmgnpqNUqYao=;
 b=pLVMH65Fvfl9niZx6cyMaAYv84fW1j/Rrk3LKxfS+5CWuCBj1cxthJFvN8PCpv+Bxf
 9G1Ksdn2nCKgjkaJOWy/XZ8uD+Bvb+uCcIvpdY+aBKY/a5Nb+3KLMAKvsvYlZcCg24cn
 72rArI4ijTQWp8D72kpgWF0hcRIDWeK0v5s581Mv/N2R1TH6mjaVmjugQyczeZDaPJ5e
 kTNjE2Cq6y76NfLXhRRNCFgBJExKfcGwCMeWmGqQ6PzDDSsLHCon9JQ20s6E9eepYREN
 yNUNo9/RUq9mpPq8Gr2jt2NK0MwSG8j28bwOobWFFDo6g2NhY16JCsem8cLq1GK4SGDc
 hVGg==
X-Gm-Message-State: APjAAAV1D461OqthGVEL9KkBX03QIF0IycxrokB3bL72QtxeMm77z9sd
 mL9uCRjkjbNtUd0A/cqLbw==
X-Google-Smtp-Source: APXvYqzNHGNztU1FaqC2TGRNivEiq4uHjQkybCvtKOnC9NCpuzOJCA45bg9ivndp+fnSpf1E1n7baA==
X-Received: by 2002:a5e:990a:: with SMTP id t10mr15188215ioj.182.1562636239429; 
 Mon, 08 Jul 2019 18:37:19 -0700 (PDT)
Received: from localhost ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id s4sm19002185iop.25.2019.07.08.18.37.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 18:37:18 -0700 (PDT)
Date: Mon, 8 Jul 2019 19:37:17 -0600
From: Rob Herring <robh@kernel.org>
To: yongqiang.niu@mediatek.com
Subject: Re: [PATCH v3, 02/27] dt-bindings: mediatek: add ovl_2l description
 for mt8183 display
Message-ID: <20190709013717.GA26173@bogus>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
 <1559734986-7379-3-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559734986-7379-3-git-send-email-yongqiang.niu@mediatek.com>
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
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDc6NDI6NDFQTSArMDgwMCwgeW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20+Cj4gCj4gVXBkYXRlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRpb24g
Zm9yIHRoZSBkaXNwbGF5IHN1YnN5c3RlbSBmb3IKPiBNZWRpYXRlayBNVDgxODMgU09Dcwo+IAo+
IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
Pgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxkaXNwLnR4dCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IGluZGV4
IDcwNzcwZmUuLjI0MThjNTYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxk
aXNwLnR4dAo+IEBAIC0yOCw2ICsyOCw3IEBAIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS50eHQuCj4gIFJlcXVpcmVkIHByb3Bl
cnRpZXMgKGFsbCBmdW5jdGlvbiBibG9ja3MpOgo+ICAtIGNvbXBhdGlibGU6ICJtZWRpYXRlayw8
Y2hpcD4tZGlzcC08ZnVuY3Rpb24+Iiwgb25lIG9mCj4gIAkibWVkaWF0ZWssPGNoaXA+LWRpc3At
b3ZsIiAgIAkJLSBvdmVybGF5ICg0IGxheWVycywgYmxlbmRpbmcsIGNzYykKPiArCSJtZWRpYXRl
ayw8Y2hpcD4tZGlzcC1vdmwtMmwiICAgICAgICAgICAtIG92ZXJsYXkgKDIgbGF5ZXJzLCBibGVu
ZGluZywgY3NjKQoKRG9lcyBhIHNpbmdsZSBjaGlwIGhhdmUgYSBtaXh0dXJlIG9mIHRoaXMgYmxv
Y2sgZG9pbmcgMiBhbmQgNCBsYXllcnM/IElmIApub3QsIHRoZSA8Y2hpcD4gcGFydCBpbXBsaWVz
IDIgdnMuIDQgbGF5ZXJzLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
