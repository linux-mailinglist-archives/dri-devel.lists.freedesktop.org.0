Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B15674E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F0E6E38A;
	Wed, 26 Jun 2019 10:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92866E38A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:59:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x25so1734018ljh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fv9xgHLhDYmnhdRlJ12b6ZaV6F7rsmVKSKGlSFypmB0=;
 b=GFwWjK5GeH90QOR6WIE1fGJS6CEWo1NSkv6gDZDZHe0FELXkp+LSa0bYCoy7Anfg/+
 ri88D/FAP68TX5VVIFS3XdBZsN97QuXAymDVohgQ1d0YYIpax5JmmlVJaafMBRQCM4de
 0rq6TLcmIT30U2QClpAHWCB6aTRx+ucEfpHqX1qQbb9F0KDC7mmA7zXubptXmIQAP7rw
 T1k2sTW/5tfub5cu6XqRI/NHwojakpgCLq9xKbkybrOlmwSQb+74krD1zXTPgWoz1rbF
 /+YF75f50pvvqeslFEtwDIpfHNjibgnNj6En5kbga1u3kqSi9bkTH14kIyNLtVTBK7Vh
 BwAg==
X-Gm-Message-State: APjAAAV3To6Eoddi1mYX15X+MWy037vTotX4ZdchS27VmVXcTR18pBDA
 a20RPRnuE6W1N53NtbeTdDsodeH/DfF161GHyf0=
X-Google-Smtp-Source: APXvYqyaajySBdajl3vqXKwz2VD2Lk2DSCmiP3YMTp9EcxBO9jpD7CRAiLKwQLplLJ3nVmvjUP4aURNpERdDUfw/E+8=
X-Received: by 2002:a2e:7d03:: with SMTP id y3mr2525177ljc.240.1561546784065; 
 Wed, 26 Jun 2019 03:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <1561544420-15572-1-git-send-email-robert.chiras@nxp.com>
 <1561544420-15572-3-git-send-email-robert.chiras@nxp.com>
In-Reply-To: <1561544420-15572-3-git-send-email-robert.chiras@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Jun 2019 07:59:34 -0300
Message-ID: <CAOMZO5CFSXHe7bFQ1xudmnm2=9sUL-FRqtzOtf_c=f7=e=bdqg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm/panel: Add support for Raydium RM67191 panel
 driver
To: Robert Chiras <robert.chiras@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Fv9xgHLhDYmnhdRlJ12b6ZaV6F7rsmVKSKGlSFypmB0=;
 b=AW93f0+wWO8xHqfQfeq02+uVvagQqg6g2aSwBswZ1jGXrtgSYEwDc4vrVjHnuHlusy
 9ITI9WY6oemJDG13jGFQ8JytMx1Wa6+NtkgUnCFPVstLuqJRoQ0O5fdaD95S064TV+OU
 xsm1LPYvsy/e1ujhFxUSIEw4YlJCcYUSYVeKqUYv0gNJB9Gl5AKBknpE1JbXhUssFjW6
 NRRBN/FDvEPV6ZTQ+caKanSaEFRg4K5nDzMdsWRdhr2kRNxzkH8HjaMxPX8WcNvtMlHe
 qIkm6FpIuodkpacPFmqbfYd/KNpwm/U8iwvnw05/9R5sDtmghJT31ZCCBLXkKrdiz8So
 FBFw==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LAoKT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgNzoyMSBBTSBSb2JlcnQgQ2hpcmFz
IDxyb2JlcnQuY2hpcmFzQG54cC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBhZGRzIFJheWRp
dW0gUk02NzE5MSBURlQgTENEIHBhbmVsIGRyaXZlciAoTUlQSS1EU0kKPiBwcm90b2NvbCkuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4g
UmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KCkxvb2tzIGdvb2Qg
dG8gbWU6CgpSZXZpZXdlZC1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgoK
VGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
