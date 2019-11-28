Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3082E10C5A9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 10:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38B76E78A;
	Thu, 28 Nov 2019 09:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B408C6E78A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 09:08:38 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e10so18460933ljj.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 01:08:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=78TUNxc9SDX9bG49GuEtf0MJi3qZ9js9cOuwvB8JDFM=;
 b=Pgptnj86xNsEz65nqBnLLD/kLiaTNQiFuRAh2jcsQ0UAb3s1vO0S/O3gaWijRTr4TG
 8UFlerAAVInHf49eTt7b27Vxg3mfaQAXi3LK/9PE1DaolySgJBbUF3iaT8mzPgHzt3Y5
 aM/RIqdyy95gC+BT3R8vHkeQcnyo4jNZqj1urklSEZEP64MKlTm/LD/eTUn7U3RIXfhL
 gL8od7ZhpAXLiLP/zBApuE9MW6ZGe/zA8QvzdHC5vC/BZmoR7ybdh6D5P9cCrWWz5WoN
 GVVt/NBFXk05X/FDIOUe+584QF4/rrOx3pwuZhHzU2AyxVUivfN6mtC2Q510SeQOVeOU
 RbLA==
X-Gm-Message-State: APjAAAXw6YhNHw6ZE1PN2s1hyalnoGdtORDkQqBljxzyJy/qQ2qSs30e
 /tvX7lFxeQu71TDJ8S6q8X1o3zCNjQyUAet6duKRmg==
X-Google-Smtp-Source: APXvYqxgwoUSOqDcdaqGDS7R5yA+8++vOzVHDWK3tPmj3lxVoGi4FFBLUdIzhwyII2/H891p5hwnicQruvpBBJvptCo=
X-Received: by 2002:a05:651c:102a:: with SMTP id
 w10mr4635658ljm.77.1574932117200; 
 Thu, 28 Nov 2019 01:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
 <20191126131541.47393-25-mihail.atanassov@arm.com>
In-Reply-To: <20191126131541.47393-25-mihail.atanassov@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Nov 2019 10:08:25 +0100
Message-ID: <CACRpkdZViRq-cxfR5MsbBtduNm6mkYJtO9c6Beiep15gyvqYNw@mail.gmail.com>
Subject: Re: [PATCH 24/30] drm/mcde: dsi: Use drm_bridge_init()
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=78TUNxc9SDX9bG49GuEtf0MJi3qZ9js9cOuwvB8JDFM=;
 b=nbQb12OW3QrlhRiNVts6U011R3m6RJ2IEahdggL7ug6hl7xtA+9L7UvULnrkncuKRU
 gCNhiPKLz3OH0WAbv0A6fK18YGwpkmdibsvvq6qMPjp38/nElKb5NKEE3RrRsnbsRMYz
 qEqpXH0p2ePUaP28QIYssojmsJK/Ua4i13WW4e7vIRQxY55UJ2+HRrDF5LE4lyClylpp
 +m4Ae+pPeG18JfAcMMK8RNmm//6eMh/cROJgUUoLVqx4oa+tHcnX94Ad3FyBbDrimcPi
 YLzifSmM/WtgXS/Oq7LbbS843h4fSTu9Logu1D04uiSyEp7zw/vHOOGXuFQgD6uEId/p
 K96g==
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
Cc: David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMjoxNiBQTSBNaWhhaWwgQXRhbmFzc292CjxNaWhhaWwu
QXRhbmFzc292QGFybS5jb20+IHdyb3RlOgoKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPgo+IFNp
Z25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4K
CkFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3Vy
cywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
