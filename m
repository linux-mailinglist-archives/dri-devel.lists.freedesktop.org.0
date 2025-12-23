Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AFCCD90B2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 12:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F80410E29E;
	Tue, 23 Dec 2025 11:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TVI8HP6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC5710E29E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 11:12:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B9CC94E41D52;
 Tue, 23 Dec 2025 11:12:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8C36D60716;
 Tue, 23 Dec 2025 11:12:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4BE0D10AB0A00; Tue, 23 Dec 2025 12:12:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766488373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=eEBKzrFw/sS0Q4c5MZiHmEW38AzU5aIB10a59LFKef4=;
 b=TVI8HP6PtSQpxVNoFXI3WY9Gn9xEr9jPNqFtoH2uSLFZSR3AfpuXJvESJAwZYx0rTR0PHM
 RUFDJLrHt8PZZLbqTXFbmB19LeWk6FkeWyw9QM4Lk0OINyuN1johp+KqJqxvnzqLw78eVU
 rzj1uOwGlQgiDb24Ts+zaJrhRfB0r0cbmwzzx/c4FIzanxEf8eEvo5peqLRThc2xvZfn3k
 aVZVpAQrWdxk0qp8ZUyLEy5XTeSktQSt9cVhKZPUl8NxiqsgprNuwPBBJl63jA9LcAJio+
 0n+IP9iW7iAiZZnQhP9McJPHMjxnjrCvb5Y4kX9tkzMn+KnIP3ztwPIYcLwgUw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 12:12:48 +0100
Message-Id: <DF5JV5BU695Q.DO0WHX92G84H@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 01/33] Documentation: ABI: vkms: Add current VKMS ABI
 documentation
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
X-Mailer: aerc 0.20.1
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-1-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-1-ba42dc3fb9ff@bootlin.com>
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

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> VKMS recently introduced a ConfigFS API to configure new devices.
> Add proper ABI documentation.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -0,0 +1,118 @@
> +What:		/sys/kernel/config/vkms/
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        This group contains sub-groups corresponding to created
> +		VKMS devices.

Some lines use spaces for indentation, some use tabs. The two above lines
are an example, but this happens elsewhere in this patch.

With that fixed to be consistent:
 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
