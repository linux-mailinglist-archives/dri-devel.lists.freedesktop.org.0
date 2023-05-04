Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0B96F664A
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 09:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F7C10E3BC;
	Thu,  4 May 2023 07:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A5B10E3BC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 07:50:44 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4CA205C049D;
 Thu,  4 May 2023 03:50:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 04 May 2023 03:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1683186643; x=1683273043; bh=3Mw5TdaacQ7QVHJymuilr27t1TddXpNXJ/S
 G0oJrGxc=; b=RsZGqzESydprVhI3/QA7NMKghIdjkQR7Pu3tfiTHrkFa92BCJ5Z
 oZZ/h/5kYs2d0znpZiB5WLCofgyDRannKdfjEPYDZ0eYOxoi1Tlq8BzTm5LLCn2Z
 qmGuefWpUltGHILVHt/KAHPAzzYK+Tg457/cx2Mii/T5d7CE2Fcx+ediVlilpmKk
 +mIqh5f7z+FS2HWujs+OCtqixvQ9HsR1TivrAKRHRhHst4JPtM0MjI/iswBk8dlj
 Rh+WksR1a3l/VESedVtoP0XVAjE8b3jmOU+SmTl94SAkOoUuinik+b9x3qmKkfZd
 kcVQj7tW12p3rbIWq8Z1V5UWL/stfPCohmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683186643; x=1683273043; bh=3Mw5TdaacQ7QVHJymuilr27t1TddXpNXJ/S
 G0oJrGxc=; b=DVDzYNG/qKAW6DVAG+VhxPxj2zJTHSmYoC0Vl3d4e65+ZAIdHHs
 nszl20ANPcLT7JkR7k2WFbjem5ALt+HwsW9EQoMl8b9WyDKhjywCJA1GS2zgkGrN
 7VZBW5Bf6DPG1cMwKyU3Zb2HMEEUKtvkqJP3kbnc+UxINfGl47A2m+J6zF+gCl1P
 7OaGhQxU+1KBMtxF0Y41oKFGol0OGhsrdsgIkT5z9IzUuRW2knEqW/6N1zx/YTj6
 +E07a6sOjVX8O0nKixxxn76G0dEcYVDQUq2sLT+YKGJOcowIHPpqlmsZ4tBGHIK6
 skFTL3qEx7x8E/lbItxkQ+rgKYt+Y2PQy6Q==
X-ME-Sender: <xms:0mNTZLPlVY5RtTS8aGvhCTTBGI2cAYywZAqj2rTryNb77ZlsfcxMYw>
 <xme:0mNTZF-76wk0eL7K-EAVknrnmz6LVILBsS5Exd0xk8lQJX5Py7H_N0-OwmBOuvFRF
 6n2vLJ2y5XLXf6V9yA>
X-ME-Received: <xmr:0mNTZKR5qhhr6Lzg77U3oDFnP0foo-DB7qwHaXnyWf3UECTSsPfbNz41pJhdI0SDUDJh03a1czf_aGPnHJwk72IJuaJ-BJE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvledguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeelieffgfdvteejjeeujeeiheeuvdetieegheethffhieefgeelkedu
 keetgeeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0mNTZPuO8kk4NkSEaJedRsoToewFxRHgfwb5glqfilp4dpbvaGJ0QQ>
 <xmx:0mNTZDcnZB4Lnkb2z08VjHL-ZWzZ19kzWqC0KKnJ17-d1u4aObdPqw>
 <xmx:0mNTZL24ekU4YHYqwJFN6f04v3FZqECLve5BoOKWe7IpevMQ0nbAlA>
 <xmx:02NTZL101G1BPlrLkrwXovjajh7YU9CcbXkOHb6MFoAN5HeMq9MiRQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 May 2023 03:50:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Thierry Reding <treding@nvidia.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Saravana Kannan <saravanak@google.com>
In-Reply-To: <20230310063910.2474472-1-saravanak@google.com>
References: <20230310063910.2474472-1-saravanak@google.com>
Subject: Re: [PATCH v1] drm/mipi-dsi: Set the fwnode for mipi_dsi_device
Message-Id: <168318663946.258409.13765059153391035868.b4-ty@cerno.tech>
Date: Thu, 04 May 2023 09:50:39 +0200
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
Cc: Martin Kepplinger <martink@posteo.de>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 09 Mar 2023 22:39:09 -0800, Saravana Kannan wrote:
> After commit 3fb16866b51d ("driver core: fw_devlink: Make cycle
> detection more robust"), fw_devlink prints an error when consumer
> devices don't have their fwnode set. This used to be ignored silently.
> 
> Set the fwnode mipi_dsi_device so fw_devlink can find them and properly
> track their dependencies.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

