Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B458298C50D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 20:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D6810E15A;
	Tue,  1 Oct 2024 18:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="gTEQyhS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4EA10E15A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 18:07:05 +0000 (UTC)
Received: from wse.fritz.box (pd9e59da1.dip0.t-ipconnect.de [217.229.157.161])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPA id 0036A2FC0050;
 Tue,  1 Oct 2024 20:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1727806024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/uHOZMUTfO6ix86RVrqLE9ZnTVIM8qqG+TGKSbd1pCo=;
 b=gTEQyhS/W2Xr6M9DZKIZQvVyVpa6hAU1rUWjFlRDI9E9wVUW8r4g41EZQORwO4n3s4W5Rv
 5V3lw7mf+YjefModJOCOQRPpXb1iT5jDvvOTCf07pFobM2fvzsGD5qeFKBVkezzUhLMiZk
 E5Af36dx1JSevtk/VQ32NwY+q3FTG7w=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: 
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org, hdegoede@redhat.com,
 jelle@vdwaa.nl, jikos@kernel.org, lee@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de
Subject: [RFC PATCH v4 0/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04
Date: Tue,  1 Oct 2024 20:06:56 +0200
Message-Id: <20241001180658.76396-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Just wanted to send my current state as previous version had a null pointer dereference.

On this toppic, why does hdev have a hdev->driver_data and a hdev->dev.driver_data which are not the same? I assume hdev->driver_data is for the ll_driver and hdev->dev.driver_data for the driver?


