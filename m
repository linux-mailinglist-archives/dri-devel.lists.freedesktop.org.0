Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D2382FF36
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 04:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCA310E624;
	Wed, 17 Jan 2024 03:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992E810E604;
 Wed, 17 Jan 2024 03:13:26 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-557ad92cabbso10503169a12.0; 
 Tue, 16 Jan 2024 19:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705461145; x=1706065945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWLq4aGpb7f9s5ZfnYqz3MCWQjdIg4mIg649H1i2jNs=;
 b=blv3VvJd862kXpK5E171x21PfXRcDVevF6JisjLhLrCxDTlBhw8eL0hgjgd4EeGiHS
 x3VVTwsa1T2XhuoYALi/lpHxujYvIfTZtrhO5NpFIbnhZrKbhP5v7Nw1bhydPzM+PYwF
 vpUrSAOpi0Fx6TRR7cBr1tH/zNrxHBYBZfh90L1XYutNY0/jYgXu/eONub7CBWqJsRVR
 fLd8y8o0O6lSyB+IDOZuJi72BfnsSRqJ8+TYe0/ik+XSa9nY5zchEsHdU24rQ445cja9
 3CG9c6MjTnWm5nlY8k9qrsg9ufBlfiqfyqsjgDgi0v/35idi566rZl3sw7seh/vM5I9R
 vn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705461145; x=1706065945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dWLq4aGpb7f9s5ZfnYqz3MCWQjdIg4mIg649H1i2jNs=;
 b=C0orAPerTsMsiX4oJFq5Adz4T0EpGQ/dnwO/HbICRXHWlntBC2bd5twullw/+1bsKv
 QcKtpBQpZZ1pASQ/NUTJtlq1E5OoZ7v6sjNu8YS8sQbcaXqUH2k5Hw7y5qYfuwsooKH5
 pEAk8T/NE8rLgWjIO2oDo4IoX5xJ8srXZbVgdTGJSIHRK4TZIG2PU6G3J4SX41lasrKh
 sHDKgT3wG+IivDGlkS4cxdeenv+Wj0Hc8A0iKQNygUmFxqQSVQiqUOSyI9LENVv60w0X
 kge3QeLjVshFf2sMIWYSaRPZs4sXXs7gHd3VpH7u6winx3MiZnMTTuI/918Xots6x5/P
 Z2jQ==
X-Gm-Message-State: AOJu0Yz6yNg9U1N8pJSp1Mmwfl9bMuySqJ99OTWbXfsC/z65+xGEXqSl
 c+q/6HWuNEByqzXEND6wEEk=
X-Google-Smtp-Source: AGHT+IEmjP59OWSgsLUizwfI6NeAlYbd3r1WGISp0XSIEokfoWGm9jE1WbdrHhf6/lWKig7M+VYPKA==
X-Received: by 2002:a05:6402:74e:b0:559:b3fe:5cbf with SMTP id
 p14-20020a056402074e00b00559b3fe5cbfmr433485edy.7.1705461145176; 
 Tue, 16 Jan 2024 19:12:25 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05640204cd00b0055971af7a23sm2258418edw.95.2024.01.16.19.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 19:12:24 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [PATCH v1 6/6] drm/lima: improve some pp debug messages
Date: Wed, 17 Jan 2024 04:12:12 +0100
Message-ID: <20240117031212.1104034-7-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117031212.1104034-1-nunes.erico@gmail.com>
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, christian.koenig@amd.com,
 anarsoul@gmail.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the messages more consistent by showing the pp name.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_pp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
index ac097dd75072..d9e178d6645d 100644
--- a/drivers/gpu/drm/lima/lima_pp.c
+++ b/drivers/gpu/drm/lima/lima_pp.c
@@ -197,7 +197,7 @@ static int lima_pp_hard_reset(struct lima_ip *ip)
 	pp_write(LIMA_PP_CTRL, LIMA_PP_CTRL_FORCE_RESET);
 	ret = lima_poll_timeout(ip, lima_pp_hard_reset_poll, 10, 100);
 	if (ret) {
-		dev_err(dev->dev, "pp hard reset timeout\n");
+		dev_err(dev->dev, "pp %s hard reset timeout\n", lima_ip_name(ip));
 		return ret;
 	}
 
@@ -423,8 +423,8 @@ static void lima_pp_task_error(struct lima_sched_pipe *pipe)
 	for (i = 0; i < pipe->num_processor; i++) {
 		struct lima_ip *ip = pipe->processor[i];
 
-		dev_err(ip->dev->dev, "pp task error %d int_state=%x status=%x\n",
-			i, pp_read(LIMA_PP_INT_STATUS), pp_read(LIMA_PP_STATUS));
+		dev_err(ip->dev->dev, "pp %s task error int_state=%x status=%x\n",
+			lima_ip_name(ip), pp_read(LIMA_PP_INT_STATUS), pp_read(LIMA_PP_STATUS));
 
 		lima_pp_hard_reset(ip);
 	}
-- 
2.43.0

