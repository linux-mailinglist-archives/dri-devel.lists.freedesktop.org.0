Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B82A14BA3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A59E10EAB6;
	Fri, 17 Jan 2025 08:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y7HRUbs7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80BD10EAB6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:57:51 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30613802a6bso19560841fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 00:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737104210; x=1737709010; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VLM1E94zeSWa7OSuX8gMRqzReFqeBbOp8I7gc5sLd6w=;
 b=Y7HRUbs7Pcip2OMoAwVMISV0ddnwp+bWbgzoRsx2ZPJH4znlg4zgpCF0cIcEaOgQB8
 S8po1ME7eoZgfex7iffdXN//NJqjRmTowUsCmFVIDorqtQi4tB6x4R5M6+AOuD5wOdPk
 ifZEuoxg+EnhnOL8HGSLN+xQeHTAzCF7xZXPzOdQMJsBY+bxQE1K6USXLG8cCqp8vcV1
 TuJnaiRCdYtno58Q6c3jr8ZN0qUg/TGbFd1kq3YcCuL6T0SjITz8yKvF45+CLGMX3eOO
 9BbtQDJTazB6rOIwwfwNXm2QsDs8/oUi/iesnbPU4rIpXrQZU1Gkaz+Hw2QDEUpmgAgK
 KMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104210; x=1737709010;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLM1E94zeSWa7OSuX8gMRqzReFqeBbOp8I7gc5sLd6w=;
 b=WzeadIQX0jeULopRyhMRSw2+CtrDQo/INRUjUW+X9qOn0fs7rZxObUYdqZBx4mvnwt
 aS0L/JHwqYxd36LzXKRA6L9Wf0RI1FkrXhNJuwA8yUaW7ngzJvdUzV8Z58+aqxE0MAGD
 30Sc+pzjuLAP09gNqbvmxa2km4ZmkYNUiH8Qu50E6Zdcnci8pCDTG8526M79Dyuwnjpc
 nO1qq/YJHpfiEZ5vh+tXgN+79euzpGHXV4apeZzBIyvSgJVp9Vc04PxMTEVXvmT1mts/
 bFK02/YG12IwE//5GW54pZV6OybjO8wYqUNjlw0yBpc/PNu8TE4IFVW5VmTm3+xCDaKG
 N4lw==
X-Gm-Message-State: AOJu0YyPgxVTUAvzhYZf0ijcy0jCEEEkojQiaCsFY5UJgejQ/wUzvS6H
 gnCPUiG9NftYpoeqFPcsYy0tWrFHslHE88WSxrAJ61URR4emUV5CFE2OA16N+mc=
X-Gm-Gg: ASbGncsLgEayaK6t/C8tLZ7sv7wfHRHNR/dS3loNQjayjJhVLoESr1JHbHxc7NLA6xl
 WaBYr/UUghrH/kEbqmEsHzi4yFIfFENlklE4W82pR9xXqkTRsBHJNNeaZq2/2SSkgc6gPf55TgD
 kdgyuz2336fwru03F7sSYNCUK09vIQ6XpjuU7EYv1nBNXvu9/vxrhU/9rl+bAOwDBHg6UD7UY/L
 awglXzbMWwF8/e8v8YjM215JhX5ZxPd+QFR1EL+uOierGYVILeOGH7NkuMajFmK
X-Google-Smtp-Source: AGHT+IFBojLKFUsRi46jxUj/82lpPoLlFcmw7BAFGVljTWhsMBbJ3khzAeUTmD1KdTt251Lb09lVSw==
X-Received: by 2002:a2e:b81c:0:b0:302:251a:bd04 with SMTP id
 38308e7fff4ca-3072ca88ffbmr4931551fa.9.1737104210175; 
 Fri, 17 Jan 2025 00:56:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a330764sm3402101fa.3.2025.01.17.00.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 00:56:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 10:56:39 +0200
Subject: [PATCH RFC 4/7] drm/display: dp-aux-dev: use new DCPD access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-drm-rework-dpcd-access-v1-4-7fc020e04dbc@linaro.org>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u0enUT6rCyZ8RqHzkNWyQVgEzKAZFsn/cehDhTu72TM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnihtFPa5XPtqF5ObSemv7vpAvzUlPQNy8VMpjv
 RyX+pGyC/iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4obRQAKCRCLPIo+Aiko
 1QRZB/0b3sThkQAPK5Beb+5Pf6cn7vHPGIu4Piqk8s/CE8IKzDU+27jDQ/KOgIcLM2BOs2vmZRO
 Zb+L/0xMQ9kLSlMyp3NFHQgEBlO+Aykl4la4dDQlxroc5GjAHq5a0kE12q/R+uEhtIuF07wQg1x
 fEAQqzuQKE3zaFrKVvExUkljI4lnB+mKBBCKKLgnuCYwGcmdP6lD6AYqD7JZY1JvBCK3NedPORt
 O1972W2CsHJgB6bG+6JHa+l8s81kV1XjdIQE+dVGwLN8SYUp8BhKDlVSml67E0+KzneY1GoD3Qz
 zZsiuc6wSv2wOm9emHzfTlD7MgX2pW/EVxdGt16cNyjCQ0y3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_aux_dev.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_dev.c b/drivers/gpu/drm/display/drm_dp_aux_dev.c
index 29555b9f03c8c42681c17c4a01e74a966cf8611f..a31ab3f41efb71fd5f936c24ba5c3b8ebea68a5e 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_dev.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_dev.c
@@ -163,17 +163,16 @@ static ssize_t auxdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 			break;
 		}
 
-		res = drm_dp_dpcd_read(aux_dev->aux, pos, buf, todo);
-
+		res = drm_dp_dpcd_read_data(aux_dev->aux, pos, buf, todo);
 		if (res <= 0)
 			break;
 
-		if (copy_to_iter(buf, res, to) != res) {
+		if (copy_to_iter(buf, todo, to) != todo) {
 			res = -EFAULT;
 			break;
 		}
 
-		pos += res;
+		pos += todo;
 	}
 
 	if (pos != iocb->ki_pos)
@@ -211,12 +210,11 @@ static ssize_t auxdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			break;
 		}
 
-		res = drm_dp_dpcd_write(aux_dev->aux, pos, buf, todo);
-
+		res = drm_dp_dpcd_write_data(aux_dev->aux, pos, buf, todo);
 		if (res <= 0)
 			break;
 
-		pos += res;
+		pos += todo;
 	}
 
 	if (pos != iocb->ki_pos)

-- 
2.39.5

