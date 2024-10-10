Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB099959B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 01:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870B510E9FB;
	Thu, 10 Oct 2024 23:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d79FmF4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF5310E9FB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 23:11:16 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43115887867so9708605e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 16:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728601875; x=1729206675; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QMBH9FWJx0l+KVOa+9SWfJtBbSYbCQsEEV5rTO8JJDE=;
 b=d79FmF4BDbBoNfF13f/c4ClDJ+ugHR+Ga/+7zUsaEmgx4/0tYM28jNZGKaCXEjnyj3
 EtYK6R+VeQUyiKoM9+kod3P1LsDgBJ6gSVQFkH5uW5/B51tcHyDJw0JHgdZi1IRRlbt/
 cAFXlLp9gqL/f9v1vT7XSOyVakjHOCXjWpwODhA5hRORIbdRrZZK1Uy67O8VGA/iUmv1
 VCyCr7cKQ/OaqjMxYywLK8bKp+18jaLIXvqsCNckdcDOwK4C6P/CG00IQDNHCkOavamQ
 xXvwLaKKTMc4kojjvPdQlvu0J/MCwL3uw6+oR3BIAI1yjNcgtzX0JddyMgLbKthcCLvy
 jlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728601875; x=1729206675;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QMBH9FWJx0l+KVOa+9SWfJtBbSYbCQsEEV5rTO8JJDE=;
 b=VVYjvAyzmTipm0MESKXpfZrzEyHaxiZxzrsYmjlWWD5TD4j+fu7Exg/3eaLcjeX64w
 NLMXBQO1FhNmR/oE9eG4LoYfELy8jFy2edjCGF0IbwOr0DgAXl5SXP0l9hE0GIbOl0ci
 a3JmqoD+SacneUYPVsSfTm5voBcHfc88rFl/4f3alvQdqvq7AZJ5Q+a+zdrsHuHKANgO
 svgDdp6OOBE4kc+PnRpd0On/TpKgtqJzKjSQZUCUDT7+itKpJgpQYnTr/hQwr7zKhWAL
 VClGku8BABqjfrAj6cV5aKX+n2/3qLTw5wPmckrqiZ+StqJxYC3Z3zHidzvXk6J8GQA5
 5Psw==
X-Gm-Message-State: AOJu0YxvuHVY7fhkvPSDpTwtXk9jicfV6X3tG9qb9dY31gig6Qg6j+/y
 5yQ0JiIn37BA4tBNk3y+Vq+VoAbDTpYm9S2xAafFrxmCn+qvTYGr
X-Google-Smtp-Source: AGHT+IEYwIA6/NSQJaiEsBC2TPm1jMFPNq2BHxvPMOWmgWKUbfcxi0VUCUbp4n1lGpz6V5FTEpaF+Q==
X-Received: by 2002:a05:600c:b9a:b0:42f:84ec:3f9 with SMTP id
 5b1f17b1804b1-4311d884328mr5474175e9.3.1728601875208; 
 Thu, 10 Oct 2024 16:11:15 -0700 (PDT)
Received: from [127.0.1.1]
 (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at.
 [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d7934sm27465325e9.3.2024.10.10.16.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 16:11:13 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 11 Oct 2024 01:11:08 +0200
Subject: [PATCH 1/3] drm: logicvc: fix missing of_node_put() in
 for_each_child_of_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-logicvc_layer_of_node_put-v1-1-1ec36bdca74f@gmail.com>
References: <20241011-logicvc_layer_of_node_put-v1-0-1ec36bdca74f@gmail.com>
In-Reply-To: <20241011-logicvc_layer_of_node_put-v1-0-1ec36bdca74f@gmail.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728601870; l=922;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=IZsWutkwsQdz6JsfcZXxwWl/8k7REIn4zPH/HX5ytTs=;
 b=vDiJc06bbjTXqlJJzhKcNDKePYrX8gMJetxAA7AyKGfKL3+gRD8zjKO29PA/TVHrBnXaNElJE
 MALOBokxz/lBZTTCZiWJS0jsedVPf5SCf2JvwCx9ds9xzpFZVTm0NNu
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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

Early exits from the for_each_child_of_node() loop require explicit
calls to of_node_put() for the child node.

Add the missing 'of_node_put(layer_node)' in the only error path.

Cc: stable@vger.kernel.org
Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/logicvc/logicvc_layer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index 464000aea765..52dabacd42ee 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -613,6 +613,7 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
 
 		ret = logicvc_layer_init(logicvc, layer_node, index);
 		if (ret) {
+			of_node_put(layer_node);
 			of_node_put(layers_node);
 			goto error;
 		}

-- 
2.43.0

