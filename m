Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D919F182
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 19:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE66689B3B;
	Tue, 27 Aug 2019 17:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573C489B3B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 17:25:06 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id p127so6979225oic.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 10:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EjM7jzuwyaCH9suwOcoqt23F6ratx04VI7mr/XZ4IN4=;
 b=RBPtaPAcrK/JXEbegpeUgCrihz8iok3g95nF7ZQnR1ERS2eyfrPfvH+km9M+qGa0zP
 ddt06W97WmiFDnzaUzYkPw5Qlxw+T/c7TMgtO3dS+PIP3F3IcJOe4sy2VOz5m/7NVqng
 VCunFfOGvoLTFqfo8h3gxSFZ6eOJBW3adjEFm2K3XCWTb3R4oUJZVNx/G1NnOK+YRd6Q
 ThiNWRWAgYJ5bXKTnAaEvQcSrRc7tviI7/krkn8RoABk/F7lMIEkZQcb7VoiWazLIfr/
 bVwjFdIRo9zn7mKoXIhDSNsnOtt2FjRK9MUSqrHAZzMdR3c6u9r6MseDJXmXhdJujJ10
 N/MA==
X-Gm-Message-State: APjAAAU/6HAmM6ttMIQYj3r16hqT0JvBDqeCfiZ4ZWuWO7tD+3DmH5sD
 3GS8Dcokk93pS+lnvwamGg==
X-Google-Smtp-Source: APXvYqwNobMD75awqFzunTVadMpb1x0jg67Rt2MOGSA5oaDz3ZLFqDi5igEHZfZ6DhAfesboGrIJdQ==
X-Received: by 2002:aca:3388:: with SMTP id z130mr17051307oiz.81.1566926705408; 
 Tue, 27 Aug 2019 10:25:05 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u5sm6241844ote.27.2019.08.27.10.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 10:25:04 -0700 (PDT)
Date: Tue, 27 Aug 2019 12:25:04 -0500
From: Rob Herring <robh@kernel.org>
To: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v3 10/15] dt-bindings: display: Add max-memory-bandwidth
 property for mxsfb
Message-ID: <20190827172504.GA15786@bogus>
References: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
 <1566382555-12102-11-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566382555-12102-11-git-send-email-robert.chiras@nxp.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMSBBdWcgMjAxOSAxMzoxNTo1MCArMDMwMCwgUm9iZXJ0IENoaXJhcyB3cm90ZToK
PiBBZGQgbmV3IG9wdGlvbmFsIHByb3BlcnR5ICdtYXgtbWVtb3J5LWJhbmR3aWR0aCcsIHRvIGxp
bWl0IHRoZSBtYXhpbXVtCj4gYmFuZHdpZHRoIHVzZWQgYnkgdGhlIE1YU0ZCX0RSTSBkcml2ZXIu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAuY29t
Pgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9teHNm
Yi50eHQgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKClJl
dmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
