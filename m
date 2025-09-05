Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8268B452EF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 11:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DFC10EB46;
	Fri,  5 Sep 2025 09:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="uK2nouk1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DE810EB43
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 09:20:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 27517C6B3A5;
 Fri,  5 Sep 2025 09:20:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 68BA66060B;
 Fri,  5 Sep 2025 09:20:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DB4D6102F1BDA; 
 Fri,  5 Sep 2025 11:20:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757064016; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=blA4KKLIMFneRzQmv+wuMb4+aez0qHijfIup5QmD45U=;
 b=uK2nouk1zQ0Q17Jmxhv26TyzbTE2vThaUjcPauB1HwOqTFDEkllsi/b/Qc/2CpfLipR9ah
 8ExBKxF/bML0PywXo+/ntO0zETfu9UxOouwCXhHofmtNTTztSmYo7cArDj/eqamv2rqvYn
 TBIrFbpT57vnDlfu6vbyxyMZ0mcG7X7+XyhMA7VacPLg7DFNM6WsYbgkZq1H1jtdHyRAFK
 HKYKqvPE/23elvcDmBPT5s2sw9uNQYpuamhM65N0DtlXwENq3QjVHZmJpekzjvADJaxX08
 4WKqHtfx2H0SUFlxI/XxmLquAyaMlptkBiPtQrmviN1/FLh9zDvVm5O3SmlUyA==
Date: Fri, 5 Sep 2025 11:20:13 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 03/37] drm/atomic: Document __drm_connectors_state
 state pointer
Message-ID: <20250905112013.13d54355@booty>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-3-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-3-de98fc5f6d66@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 02 Sep 2025 11:35:02 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> While the old and new state pointers are somewhat self-explanatory, the
> state pointer and its relation to the other two really isn't.
> 
> Now that we've cleaned up everything and it isn't used in any
> modesetting path, we can document what it's still useful for: to free
> the right state when we free the global state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks for documenting these non-obvious (to DRM newcomers) concepts.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
