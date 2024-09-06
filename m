Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FF596E75A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 03:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35AB10E72A;
	Fri,  6 Sep 2024 01:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CE+Jivuc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55F510E72A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 01:46:16 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7178df70f28so1279517b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 18:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725587176; x=1726191976; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UwnV3rN27k13ClzZkPYxKb2bde4aYZdPIxzu2F5jqrY=;
 b=CE+JivucpI1HR2MizFZD//KpyAIQ9kfcN0WVSpetpCckNllSRp766BJ1WAbxaoQByp
 +Kw8xcp1S8RO5VWMjoQkFl0NFmiPTwXrZW0FlId8BflMplxtVpdmgaXVHpGq6NJ5LB84
 1x0jpofiDDluNew1SDsVOsmZPJVTimZkaYJ+KVlgHXEQMl2k5pCFiDxZ+0e95P+dG16y
 L/Q3YN6nzHqChOAMgOrT08CERSJs6yOcxKGVg/k2WXR5A1vrDYvZhFptjZG2YKvZixT9
 sjzkWoGloQo0Oxi7UA0bPl2Af6knV+hgFvrt/mbhqHS/G4V79L2oaSRQnJjGLr9ctgI6
 iguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725587176; x=1726191976;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UwnV3rN27k13ClzZkPYxKb2bde4aYZdPIxzu2F5jqrY=;
 b=Z/RhYgwxibefm7Azt3Oc+VMD+DtoYp/OtiGFrBenSxpIVSB45uzE9evvSEwzpORhD7
 Ig5nZVswd24qCzVOYIFXHumjD7Baxi+ds80Uh0oA2cMuAhfaMqLrz3P6eVm1XyMNXF0i
 IB6y3h40yyOtRavlHqapIjCjebU66MdFlpEDSznFYNpUHS8QOxWmaQYRH2a/rBw2cazz
 GScqZtbkrt/0MFBPFa1RNRLqUGs2MRWpsde6yaLVKyWFjCp6wbhRz1ofH/BTm/RQejQ3
 knyr7nnAUIPx5a/2/dGCpwXiwu2bCZqn8ppGjDDBrcKcQcH0aplu+NDWyQauYBJzx41a
 yWkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7ujUjekWIgdvpHpNMpZvJqG/4XRWYx0ISXAYDedeKZhvhifunWaiSzEUW+kBUmQjD64LA+bBSy3U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbFptDN3XvoqjLX48Cufw0EbYUINdGFc7e33zAARaD5XJVxnLO
 DUPvW1kvZsXoiU2EH/EgTab8bQUWuBz9zLYXnNNfCWUstV5UFfjZyN2JEEG2ncn0wYdv+jmfSgx
 pliqamu34aLA/qDlG57pBEQrD/Ow=
X-Google-Smtp-Source: AGHT+IEhczTHvvDjVeg6Pvbvn7UtOLZBLuPzW6GomhWkIzl2gBVFJydJN91+AvoJ8LIJzWan+AkZyr71ZFB4mf7Tiyo=
X-Received: by 2002:a05:6a20:e617:b0:1bd:288f:e8b4 with SMTP id
 adf61e73a8af0-1cce0fea606mr26332456637.7.1725587176167; Thu, 05 Sep 2024
 18:46:16 -0700 (PDT)
MIME-Version: 1.0
From: Adam Ford <aford173@gmail.com>
Date: Thu, 5 Sep 2024 20:46:05 -0500
Message-ID: <CAHCN7xLL4hrTK1OqsqUa78cdp9ZcG0sC+cO5QKC3x_Y9-QVzSA@mail.gmail.com>
Subject: i.MX8MP IMX-LCDIF Underrun Question(s)
To: imx@lists.linux.dev, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 arm-soc <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Schrempf Frieder <frieder.schrempf@kontron.de>, 
 Dominique MARTINET <dominique.martinet@atmark-techno.com>
Content-Type: text/plain; charset="UTF-8"
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

I have been testing various settings on the HDMI out of the i.MX8MP.

I noticed that sometimes my monitor would not sync, but sometimes it
would on the same resolution/refresh rate.  Frieder noted the LCDIF
was sometimes underflowing, so read up on it a little bit.

In the comments of the LCDIF driver, it's noted:
    Set FIFO Panic watermarks, low 1/3, high 2/3 .

However, in the downstream kernels, NXP changes the threshold to 1/2
and 3/4 on the LCDIF that drives the HDMI, while leaving the other
LCDIF interfaces at the default.

When I increased the threshold to 1/2 and 3/4, it appeared that
several resolutions that my monitor was struggling to sync started
working, and it appeared to sync faster.  I don't have an HDMI
analyzer, so I cannot verify much beyond knowing if my monitor can or
cannot sync.

Could the threshold and underrun cause this monitor intermittent
issue, or would this be something else?

Does it make sense to have a flag or device tree option to override
the default thresholds to change the panic level?

adam
