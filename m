Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8679FB45FCD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 19:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E75A10EC0F;
	Fri,  5 Sep 2025 17:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qU7oBBQX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 333 seconds by postgrey-1.36 at gabe;
 Fri, 05 Sep 2025 17:15:36 UTC
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A0610EC0F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 17:15:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 39FABC6B3A0;
 Fri,  5 Sep 2025 17:09:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 74CA16060B;
 Fri,  5 Sep 2025 17:09:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0EEC2102F1C2A; 
 Fri,  5 Sep 2025 19:09:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757092197; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=aOT3KtNIKMIVd1m+1jlPmG8mf0Vynysjr8mE//QpKn0=;
 b=qU7oBBQXwXTAkW7qRt+m44PVa5coMfHtx5ZoFi/HfPEhVH6cbEpB5xdye7T9bZ+OH2NZ85
 yJbXSxClF91OPLMVTX3t0KMsAm/q9IZ1JrU1Z9z9fW/ARYebCOh6/+3Kc7zmfvrKq6s14O
 CNJtjRkDeM0SR8uZyn+A516kbMUs2/WfyI8+qK3eCMBH51C2IxA2WmybE4GPuWvyU9+G8F
 1i5ray3iAHRC0bpY0kKkEOQUAjOKIOtPeSZ15jRE5TvUFaK+RaTjniwEwM0IqicdmDHRvc
 9DoG6wS/trirDadWa5ozTJkvz10R0WKa3MSnIi8TVaC8RJZvvxfRyX05qDPLwQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20250811101529.150716-1-jose.exposito89@gmail.com>
References: <20250811101529.150716-1-jose.exposito89@gmail.com>
Subject: Re: [PATCH] drm/vkms: Assert if vkms_config_create_*() fails
Message-Id: <175709218483.1237020.8619075932640588884.b4-ty@bootlin.com>
Date: Fri, 05 Sep 2025 19:09:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 11 Aug 2025 12:15:17 +0200, José Expósito wrote:
> Check that the value returned by the vkms_config_create_*() functions is
> valid. Otherwise, assert and finish the KUnit test.
> 
> 

Applied, thanks!

[1/1] drm/vkms: Assert if vkms_config_create_*() fails
      commit: 0d2902dfa31535c08d4976995d5b6890a8f43399

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

