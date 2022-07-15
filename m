Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F770575ED3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 11:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E3B10F456;
	Fri, 15 Jul 2022 09:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A10B10F456
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 09:52:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B7BC2320095B;
 Fri, 15 Jul 2022 05:51:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 15 Jul 2022 05:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1657878717; x=1657965117; bh=S2rwDfHC9o
 XpuuEOYHUag4B2VepokxV6WAqDHEuCkQY=; b=RUVLo8zxTB3GaHDGvdi3G36FLy
 V9Ue0iINxZ4EBDX2+X1ZW/VZJm/cesOjV1FNqv+odH/uAtd2AVBZ722wY0Hw6tnI
 apqb4ZvqYRcbt48XJCAwR40NblTWAy3fzXUg3bHBzbpE3MN1Ris6mF5cVu31VwJg
 sC9TxUacbQO5gdbQMQSnDzIkPjE8trUxwIrESG4Ty0pg350sB/BGaM2bCWHTqGLq
 b7b1/9xksPc2oqIoLxVrbuysPtAavhFcZTShjVJMo7ZhR5LpsaPrXy/gYaowqOIR
 sL1DxYcTKnlSU86liMBgZWAzGLEYe2h+QzFkR1zgCo8n+Nz0OncK6tdDmw9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657878717; x=1657965117; bh=S2rwDfHC9oXpuuEOYHUag4B2Vepo
 kxV6WAqDHEuCkQY=; b=wj8F5lumZDkRoFPxeGM/cQZt8N97B3qD2tUSSFQ1utN/
 48q1dzkfMEHZ1v+gszu+iptNfXizGmWFW8zbSTefck9A94PMz8GeH6Nl+MKqTTAW
 Xgz3QN22lBMlpDStjB7JalfkbDviwoB3vXlGeoRuv0T2yfb3IbNc9rx/xpztkl7k
 GgydNCGEv8yOK4s7Kn42aKsoCRR7ilIR/55o0Duf/izaaIPSi0oDYWdDdBPZ1IW1
 bGUU6w+bx9fbejB2LqR1Dr4PkL2TZbHYMRJkaGZO5bTAwctikJSfKTBqPbw5DGr7
 ILiHPWC+A1e2j1FhN2TiS2fqyl2dmHSm1SD3l+0k6g==
X-ME-Sender: <xms:vDjRYis0qjadoVxsuu0wAgjMvcN55_KXMGn1PST5xd3A1qh33pdL1g>
 <xme:vDjRYnf08NqLy9CgQrRv1pi4orQM02zhOj832d4Kv9ZsjuIgjMEwhhkMH6tdE-M6Y
 EFiUqoiXR4SY18FwZo>
X-ME-Received: <xmr:vDjRYtxYTzsiWfii3QZfZrX7s6ztLzR59EjGXOHR1c2jfwSWkQrStstlPe8aSXKQGNPqd4RuYNjhH1v4lMVPmzR5idr67J95v7cid4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeftdeuveetgefgiedvffejjeelvdevudduteetkedvieeuhedvgeekvdel
 teffkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vDjRYtPpUYL-hUa6oJ0obUpUes1JN9atK0wI1WozU4HNfK-B0GdVyg>
 <xmx:vDjRYi_lu9mYDPFnqt3jBQIIfRMnq9-QvEmFx6BW8NedAHDtUG5pMA>
 <xmx:vDjRYlVrIw9I-HyB-5D4ElgXisy-1ZPtgpLMQPLSMvQy8hqsbb6cKA>
 <xmx:vTjRYpmiaMdVWciStL3BH34NueJXzbK9ESKiNcYEBfdKq0yuJS5IwQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 05:51:55 -0400 (EDT)
Date: Fri, 15 Jul 2022 11:51:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Liu Zixian <liuzixian4@huawei.com>
Subject: Re: [PATCH] drm: correct comments
Message-ID: <20220715095153.nyjb3pendkubmdrq@houat>
References: <20220715092256.982-1-liuzixian4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715092256.982-1-liuzixian4@huawei.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linfeilong@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 15, 2022 at 05:22:56PM +0800, Liu Zixian wrote:
> On failure, these functions return errno, not NULL.

They don't return an errno but an error pointer

Maxime
