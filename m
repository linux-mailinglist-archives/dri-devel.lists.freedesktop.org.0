Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D68FCB9B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 18:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51A06EE18;
	Thu, 14 Nov 2019 17:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BA46EE13;
 Thu, 14 Nov 2019 17:15:46 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77870206F4;
 Thu, 14 Nov 2019 17:15:46 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <1573726588-18897-1-git-send-email-harigovi@codeaurora.org>
References: <1573726588-18897-1-git-send-email-harigovi@codeaurora.org>
To: Harigovindan P <harigovi@codeaurora.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 0/2] Add suppport for rm69299 Visionox panel driver and
 add DSI config to support DSI version
User-Agent: alot/0.8.1
Date: Thu, 14 Nov 2019 09:15:45 -0800
Message-Id: <20191114171546.77870206F4@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573751746;
 bh=wqXw2GU/fWqyagYIshMsfzEUSC9I5oHEjWnEEo4D/6I=;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
 b=DDu+wkPJH5/e9q5cXcoO5DV4uFX6hDP8XyQRYx6WyPXASmYL0i5uR5v6SxXjYrFRL
 5nvbU4bOmJgcFa3FDyFo7HD6pbfeeS8rw6Td8R4h6+IEILsNzfouASCg4VN8x4oUEo
 muQi2TXUUAWkAAFbGZONRt8LasK6fh7gsdchQXx4=
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
Cc: Harigovindan P <harigovi@codeaurora.org>, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org, hoegsberg@chromium.org,
 chandanu@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBIYXJpZ292aW5kYW4gUCAoMjAxOS0xMS0xNCAwMjoxNjoyNikKPiBDdXJyZW50IHBh
dGNoc2V0IGFkZHMgc3VwcG9ydCBmb3Igcm02OTI5OSB2aXNpb25veCBwYW5lbCBkcml2ZXIgdXNl
ZCBpbiBNU00gcmVmZXJlbmNlIHBsYXRmb3JtcyAKPiBhbmQgYWxzbyBhZGRzIERTSSBjb25maWcg
dGhhdCBzdXBwb3J0cyB0aGUgcmVzcGVjdGl2ZSBEU0kgdmVyc2lvbi4KPiAKPiBUaGUgdmlzaW9u
b3ggcGFuZWwgZHJpdmVyIHN1cHBvcnRzIGEgcmVzb2x1dGlvbiBvZiAxMDgweDIyNDggd2l0aCA0
IGxhbmVzIGFuZCBzdXBwb3J0cyBvbmx5IHNpbmdsZSBEU0kgbW9kZS4KPiAKPiBDdXJyZW50IHBh
dGNoc2V0IGlzIHRlc3RlZCBvbiBhY3R1YWwgcGFuZWwuCgpEbyB5b3UgaGF2ZSB0aGUgRFQgYmlu
ZGluZyBwYXRjaD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
