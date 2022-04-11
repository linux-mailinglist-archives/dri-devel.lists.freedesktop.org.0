Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B834FCF34
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 08:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8ED10FBAD;
	Tue, 12 Apr 2022 06:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0917410E628;
 Mon, 11 Apr 2022 13:12:03 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D2ADA32020B0;
 Mon, 11 Apr 2022 09:11:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Apr 2022 09:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dottedmag.net;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649682719; x=1649769119; bh=ws
 sGnjw81sLOyMEwq+LIzGQwpgFbW7MjI5oGUY6SvtY=; b=ehHM0cFoTmjIs4IQQ3
 1xwkX18I02cqIHMHU6dXUCusoqz0u/GojdO7DII0oe97f+Qq0v13JH06oUMrlzAR
 Bx/EgTlODwY1BROH3XjOgXIB4gMHrxPUqsNsa2PsDERLoTuwKIm4wWlpFFd6wYPi
 WNBHzSgOgyCQeDR5auNPjZys03pSo/9dEfBarEBuPF2eSGUf9ahDHdYtmDCZtgJQ
 svn8Q4Qu5xCqqasfxAQFclEv6emrfSDqAWNfzQ1HWf//9Mzx84PdpANGiJ62s12m
 WRYqMeC1Fq4TU3JD28wKq22yUwfVy1DQtv6mDiYJoUDxjQ5fCROZIneDtdLo2A+L
 jXDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1649682719; x=
 1649769119; bh=wssGnjw81sLOyMEwq+LIzGQwpgFbW7MjI5oGUY6SvtY=; b=D
 ZhkTx7fNT7K5inUuwnck+ZpR9KV8k3OIrZ48Zp7DrAqOWjpmkLMn96TqL9Ix1SL9
 uUvYZOnXh66REdVFGxGFW3QG5q9w7ZxGqpYPBFUNxp8jZ0SaScQG4G0uWGzXad0Z
 GgrdftDfmZFJgcgikbuKtAc38N+CmIwXUXUVMWOvQkHKgCDKN+yecefM5g3afzLq
 e+dqll/DEwd3UkGfppgoj2dbQJEtZYX9YmBuXJIYEPIcr9HrWMs9cNLlGRw45GKH
 2cL8DITtrZLbCnoRZSTwSkI1eAiwOmVY/SSd9EgEUjDCHIXLiykpEgPu5euBM6X5
 GAPGM8euhkQBd2nOVv5wQ==
X-ME-Sender: <xms:FSlUYrLe7ZpkGlIfIRe-_dMaRKbzTbENXOckuBfnttMU_nVtmH_0pQ>
 <xme:FSlUYvLZaZ1v6EL9Rr0OTzv033Kh_eUom542Rujm8Utg7kbp_oBxxFMvyd1LW0Xo5
 ILXSX_7XyqOO2e1xw>
X-ME-Received: <xmr:FSlUYjuQWd6cNqBpmpfF0Q8oI_VXdXSfxe_3OJ6UXA9W4WR9yjKWFD6TpbtQ_d1uww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekiedgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffoffkjghfgggtsehttdhmtdertddtnecuhfhrohhmpedfofhikhhh
 rghilhcuifhushgrrhhovhdfuceoughothhtvggumhgrghesughothhtvggumhgrghdrnh
 gvtheqnecuggftrfgrthhtvghrnhepteeggffhvdejkeehgefgveduieeiveffheeuteev
 fffhieffjeetfedtveejhedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepughothhtvggumhgrghesughothhtvggumhgrghdrnhgvth
X-ME-Proxy: <xmx:FSlUYkbX_ojK4nXAdvMuUmhiaiM6L3_gkzO5zxM3_ZCGDBM90nIq9Q>
 <xmx:FSlUYiZRtq4QfJbdc4TOMk3IKdWKE3FxqYiwd0ToUmWuwbEWDuTNzA>
 <xmx:FSlUYoBNd3RAgD8_rQKimHvmfFsf00YmXPaKKBbS7VF-oSfrsFwp7A>
 <xmx:HylUYpX6PqFCIhq8mJ29T48FgHXpAiSvhLT3sxJOR7izDMCOcGhNyw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 09:11:47 -0400 (EDT)
From: "Mikhail Gusarov" <dottedmag@dottedmag.net>
To: "Hans de Goede" <hdegoede@redhat.com>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
Date: Mon, 11 Apr 2022 15:11:44 +0200
X-Mailer: MailMate (1.13.2r5673)
Message-ID: <38A9D253-6634-4ACD-A262-B4D794A3CDB1@dottedmag.net>
In-Reply-To: <327c6efa-192f-5553-9a6f-8278a8a0b87d@redhat.com>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
 <CADnq5_NT=pSZwvMN_0_S4duk-StRxh0JcsraJo+erPDkq+GyJg@mail.gmail.com>
 <4a3cf9b6-1e08-c08c-bebd-ec2ca648059c@redhat.com>
 <CADnq5_M2zLedFmAS+udyg1zRavv-aCm1hRY+t=qW7wD33JEALg@mail.gmail.com>
 <a42f03bf-bf85-b08e-fa4f-e36a226922bc@redhat.com>
 <20220411143416.04a65b5d@eldfell>
 <327c6efa-192f-5553-9a6f-8278a8a0b87d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; markup=markdown
X-Mailman-Approved-At: Tue, 12 Apr 2022 06:00:17 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11 Apr 2022, at 13:50, Hans de Goede wrote:

> The problem is we already lack the manpower for a quirk database,
> and even if we ever get the manpower then it would still be good
> to avoid the work necessary to add models to the database where
> the kernel already knows how things work, see below.

I wonder how Windows developers solve this problem, and do they at all?

Best,
Mikhail.
