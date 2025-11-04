Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A617BC30A39
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 12:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1D810E253;
	Tue,  4 Nov 2025 11:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YGrnmVW6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CA710E253
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 11:02:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 180E94E414F2;
 Tue,  4 Nov 2025 11:02:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CACE5606EF;
 Tue,  4 Nov 2025 11:02:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 22356102F1CE8; Tue,  4 Nov 2025 12:02:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762254157; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2TP6j6kVWFU+uNt/xtNDwC6uqXMzP7Iu2p5iTCWD3KM=;
 b=YGrnmVW6amOtuJg6/NMM2Mqm0I76RF0PzJ3IfIKpU4E35XPiGOL2oiw0jjTNjIoEEEfB7R
 Iy0kllRDfBHPkpJ3WAKcZAij5V4kTAlMT36HkI+o4oKTQ5v7ozqa6stcFG2GUlpyqNQ1+o
 pBpWJ2hSvq/fzo2GE7Km7HRsghIUICZUi4w0pyHlyVA9iBqTYYiq7t5Ms08kwCbyk1issT
 GF6Zo5+61njc+SlhHObWLJ861+kEubv/KAzIREKgHPipxqmOkSEqpqEEwYDUGNt4Bevyim
 yk6CQPc2zYBgLRYixkYOyjvjUxyxBk5WrUb63bk0u0GbESKVQDMwGR9NhPjuRw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com, 
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, corbet@lwn.net, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251024110014.4614-1-jose.exposito89@gmail.com>
References: <20251024110014.4614-1-jose.exposito89@gmail.com>
Subject: Re: [PATCH 1/2] drm/vkms: Fix run-tests.sh script name
Message-Id: <176225415494.422810.7112986302756262297.b4-ty@bootlin.com>
Date: Tue, 04 Nov 2025 12:02:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
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


On Fri, 24 Oct 2025 13:00:04 +0200, José Expósito wrote:
> The script is "run-tests.sh", no "run-test.sh".
> 
> 

Applied, thanks!

[1/2] drm/vkms: Fix run-tests.sh script name
      commit: edcdd00099f1b755095dd770c9cd5d3374e49ebc
[2/2] drm/vkms: Update testing with IGT IGT_DEVICE
      commit: b63300ac4095f892a8472a82f465fdc7c63a8c57

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

