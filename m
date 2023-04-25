Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0379E6EDCB2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 09:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E3E10E6AC;
	Tue, 25 Apr 2023 07:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB35E10E6AC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 07:34:47 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F1EC5C00D0;
 Tue, 25 Apr 2023 03:34:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 25 Apr 2023 03:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1682408085; x=1682494485; bh=EoZK+Nj8Veym+ct5siLk5lUK0IAvRR+5xh6
 EbdHJolk=; b=K9C1XHcMxOnp//g0K7gd+W1oBMo99B7Gi8Ejyt2d+1nw3GEOAbq
 syeADFPw5Ga0+dRl8UnYKXSuiA5+ri7Vj2yE/AfaaaQMpWAubBCYfTb2KZUo66yu
 Do0Iz8tJV8odk2pFWfWAYTZu3L1+VyLuGQgXr2DUvxkK45DW3L/7qg4TmqeWtMLM
 xmreLKOnbIK8sJovsqDqpw01fDuHYy7vzTrLwpkl5AzWB1wJw5f1ZdhQUu57bu7I
 o1AIbFTwvuHYxHNaL20YSGXvU6xePU4l7NTGZzbqbqdI0LSqaIZv5uq4UydUMV71
 HaAquG/rkPNXYH7CKsQZQq6p5oaL5txunFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1682408085; x=1682494485; bh=EoZK+Nj8Veym+ct5siLk5lUK0IAvRR+5xh6
 EbdHJolk=; b=Kh2zOHUKmvXrKqa5f+RHrammUAdvKkCUwoCHfh0PxzSN8CCIGn3
 zXVGjLOJFrJGI8lws3waVjhwzynFdkLS18xBsEamZY+81OUkkdUKe1IE+mpsaqop
 he/3WYfKpXzmXUvutOj+8srlwoCUqCpV5337LOcJ+Dkxnv/iAq/kvfOq0JYsxbNW
 JGBxMxSU1pqswhbedbp48R7TzM53lz9Qxp3c682KQ9Z1pmecDeCKu/EFKS240oIe
 GFgELnYnpBEPDwGx8pT69/u0iThJsnfvlLKfRBx+qK4OtP5GR+ZVFgXYwIqu79Kd
 FbA9lZfpVFmuvl+cDncT46NdaBhVxaJYPmQ==
X-ME-Sender: <xms:lIJHZLkJYB--EvnEcEv4ngWxUuaBxtdeQZEJzCKzjfHN9Te7y3UB1w>
 <xme:lIJHZO11IlH7-rpuSDHITQZn52xqTeqM3W7W9-nHbGrpK-h7Cep2UEdjZZMbKUh8u
 rI_17v53g1jysNvG9g>
X-ME-Received: <xmr:lIJHZBp8e7VrfYmfXfVuNzUWisaTIQ6p1qUluu9kgeL80ptIjWrOKgVfXuMCwRJN5R1za5h-ihEE_QEUEhSyN76f9sI3oxM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduuddguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeelieffgfdvteejjeeujeeiheeuvdetieegheethffhieefgeelkedu
 keetgeeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lIJHZDmf7m9cVzSL_F-pmKF074qZNQfhiYoSo1LJKs-qRf-dLvQCow>
 <xmx:lIJHZJ3Fdn65CUfyDWZSnv45ZAY1FN3cjy7omjZ-9Intr-QZ9atD9g>
 <xmx:lIJHZCvOv2FgRzr7SWTsuADCTJnj5ddsWXXHkpUa-gLf5xPBBL0vFg>
 <xmx:lYJHZCKfyT5nltzfEWbmmni9HUzyhI9iHXuVZXUE4LmAfSHVvawhqw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 03:34:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Ripard <maxime@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
Subject: Re: [PATCH v3 0/9] drm/vc4: hdmi: Broadcast RGB, BT601, BT2020
Message-Id: <168240808168.134250.8409328987520507623.b4-ty@cerno.tech>
Date: Tue, 25 Apr 2023 09:34:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Mar 2023 11:46:41 +0100, Maxime Ripard wrote:
> Here's a collection of patches that have been in the downstream tree for a
> while to add a bunch of new features to the HDMI controller.
> 
> Let me know what you think,
> Maxime
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

