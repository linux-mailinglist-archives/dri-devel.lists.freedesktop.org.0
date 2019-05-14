Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D51C1D044
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 22:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9C8884B0;
	Tue, 14 May 2019 20:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE790884B0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 20:03:04 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k9so51753oig.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 13:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=fr00WeJI7LuY/N4++pQHRnJwZ0q8ePUBZpSaqAUAGZM=;
 b=ugQJTp1NG04Ia+CyHqV+8eYLEp0zVYKBdjemhZdMK66pnWyW6rEXx5nrcCSSn2OsGL
 aRsR/04YjkP9HpN1D3LjNbDWCnlenaHBkjTRzfmtIFAJvHxMQnAhBLfq/v5aiDrxdD5h
 9A5EBQG2Vu6bqWtY0rZS8QRi4mrP/QfuX3c+SoAKZNhewVrAvJ3d8p+FajkUalbvj0PI
 ck23Eu3XcPJHf9wK03B1nGqxopTWn9HwST/iJ2e9xzIoXvpxoE61Cygvsb1uGU4ref0t
 eh2Oks/t58oL2dZRdrTCPgwQzpgITKlEToAUiP1+/JinRcDitfoP/6MaRO9Q+p5bl64G
 gX/A==
X-Gm-Message-State: APjAAAXQ1uklDbAqFtZS+NJL09k8l+S8wkBbaCpv2xsRlqIKFOi7R+dg
 cDu0NGSFAuCCHJrYXAAIJA==
X-Google-Smtp-Source: APXvYqyyGrngDLkf4JtW5jGewq3pbgcF+xgmfak6/x/AXfJYI3EEMCP71iIcdP81e9ElCqbZBI7PHw==
X-Received: by 2002:aca:56c3:: with SMTP id k186mr4070933oib.95.1557864184052; 
 Tue, 14 May 2019 13:03:04 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e133sm6577619oif.44.2019.05.14.13.03.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 13:03:03 -0700 (PDT)
Date: Tue, 14 May 2019 15:03:02 -0500
From: Rob Herring <robh@kernel.org>
To: Yannick =?iso-8859-1?Q?Fertr=E9?= <yannick.fertre@st.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: stm32: add supply property
 to DSI controller
Message-ID: <20190514200302.GA10115@bogus>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
 <1557498023-10766-2-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557498023-10766-2-git-send-email-yannick.fertre@st.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Philippe Cornu <philippe.cornu@st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMCBNYXkgMjAxOSAxNjoyMDoxOSArMDIwMCwgPT9VVEYtOD9xP1lhbm5pY2s9MjBG
ZXJ0cj1DMz1BOT89IHdyb3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBkb2N1bWVudGF0aW9uIG9mIGEg
bmV3IHByb3BlcnR5IHBoeS1kc2ktc3VwcGx5IHRvIHRoZQo+IFNUTTMyIERTSSBjb250cm9sbGVy
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3Qu
Y29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9z
dCxzdG0zMi1sdGRjLnR4dCB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKPiAKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
