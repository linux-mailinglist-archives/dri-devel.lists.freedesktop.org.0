Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B922675DB8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21F910E39B;
	Fri, 20 Jan 2023 19:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D6F10E39B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 19:13:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4A0703200955;
 Fri, 20 Jan 2023 14:13:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 20 Jan 2023 14:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674242025; x=
 1674328425; bh=KDAu4lflKAilT2GeujzJmvpfE31X4Cxo27fbXFr0VBc=; b=a
 xGlY6uH4dKzA5Ak0SqAdKXq/ZgWFop97HDOAFyzic+zQoUptBIDdnRlDw9uXICJ/
 4NRFkSR5m0w7O+zgjJVihHOAnf06Wn/k++VvUHrrDCjpQeJ7kryo6ChXiNAFsqHz
 nd0bM3k5gGTy74fzYp9lu/33iSwq9TPKGEHeFiFJoxo33H/KttiPnxsmbE+xhJpw
 5PCFl89nSbfBCv+4MDCKHPF9vb6odcWJRppDPrINR5614W9/FY24CBZAAOdGUPmY
 2XbfML5RPjBrJjVratqgTIHAxCo7meh4+Nq9a6aMWeKkkXAkPZB7hTy8+MO2/20U
 bllpwyfpVU2O+u1x9ernQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674242025; x=
 1674328425; bh=KDAu4lflKAilT2GeujzJmvpfE31X4Cxo27fbXFr0VBc=; b=X
 P0NbZCRrYM001QH5WcRFP8VKlwYWlrH2gpyHoEfpvyOHkJqYDwJI4s61BjBKo06F
 2GppP+Q2cUWuvJqqTvhG9uDBIqnbc8gghkZWQl2Kyp4zvk9brlXjucmyM3pgbh3G
 ItZJitmzNw57V9sWMcC5+XG0Tk740ZxfTHzkA13Jykk9965Y1NVrdc4kxdc82xMP
 f+n4CR4uNM1+53L4gEy5mz47ZUQno1gZU0Tpc44RZS4xn7pzJ92K3iAjAN0e97WQ
 rSi5Tmy0YfjD6naN+lv1HxHwP2nNslL1FBJYik+TSxh2/NuwzjIAnVUMoBgGQasS
 nDxDgIOAd6tsHQG/jBUtw==
X-ME-Sender: <xms:6efKY04FYgYDEnhZVDPd_YAAbTmplPgdvvs0S8wqOkE6st0yDWdHIA>
 <xme:6efKY15yXpiNS-l2fn1YNh1ti4SDp9CetlrTF4iEGUDhijMz3l5Pxvu1CFbyB6RSE
 8SDsCL3w6895V6NCVk>
X-ME-Received: <xmr:6efKYzd-_6STEbxydb7L5Q7l41aic4l6raUpRHsacdQA-2Ac1BU8wl4Q1OCVtwAlhaYqs9vIkBt4W4xEdvVgzs5L4TSy-j1N07rS7CCk1fHaRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeu
 teefteefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6efKY5KTxR3drEDWgRCVIFAc_WMiOgax68SczL9p6PbUIuKkfhldoQ>
 <xmx:6efKY4LFkBK8qeTAqzqifiXfZVnjx6uG8ZDbqJ0AW5LWzrxtEnAjiw>
 <xmx:6efKY6yA1UnlfUwofXSob7G9EPFf_fd9JcJp4i60B1c2Y0mYOswrPw>
 <xmx:6efKY9FHfqdDTf8EEE8lOtRhTt1XMt07toEPWWAecUVlujG4nxCyiQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Jan 2023 14:13:45 -0500 (EST)
Date: Fri, 20 Jan 2023 20:13:44 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] drm/vc4: hdmi: make CEC adapter name unique
Message-ID: <20230120191344.xldhudsmb4xar4u3@houat>
References: <dcf1db75-d9cc-62cc-fa12-baf1b2b3bf31@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dcf1db75-d9cc-62cc-fa12-baf1b2b3bf31@xs4all.nl>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Thu, Jan 19, 2023 at 10:02:19AM +0100, Hans Verkuil wrote:
> The bcm2711 has two HDMI outputs, each with their own CEC adapter.
> The CEC adapter name has to be unique, but it is currently
> hardcoded to "vc4" for both outputs. Change this to use the card_name
> from the variant information in order to make the adapter name unique.
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

The patch looks good but should we Cc stable and add a Fixes tag here?

Thanks!
