Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA864A37C40
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 08:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E61F10E388;
	Mon, 17 Feb 2025 07:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AH5/Y+Vt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B1510E388
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 07:32:16 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-abb90f68f8cso174397566b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 23:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739777535; x=1740382335; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hO2J1j2m5X6qQF5wOtrAqeimkscPDnsoO2uRIRbK0t0=;
 b=AH5/Y+VtVYkf+GTKX12FVRAHV+lzKnIMtQIQFmtq070JmMqifqbzwWR/EEXqmmlNS9
 PqH9izJ+knayRgCUnYi9Is8keHiMmggmbtBfCTgOoL7L4EBuHxgtdayUpbtRvL6AaZ3u
 ga5F9SAujkOF2LuipZAUCvGULbZJekB5rqMTefDSpYpJyfwh1hNyzwTyjnM5CQZKwdwi
 IOjscH27v741e7TKuqYpW5oTBCEA5j/9eZXTFn3kfGzNHHToNyvTIxRf3MlUuwANTpR0
 13e+51f/LqZy6XEHUwP909AvymeM9bi8KgNYy9bwwlwimeT9nQ1VSejiEwJGxaKdQ8Pd
 bY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739777535; x=1740382335;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hO2J1j2m5X6qQF5wOtrAqeimkscPDnsoO2uRIRbK0t0=;
 b=HSlsn9ClUrHxWhRBTXCZbgCtZUv0V8taSASY5zSEmrXqBKiousgJ+QJ3LemmwY3698
 RvHNkDU3IKdZPHZAUKQyQQV6Y8qbcoGP+y1lIs8w/6dXjUukNHW8EEOSmO8FxLYB13Zv
 S2VayRDF7X7umYCp9keIa18FrwtstD9KeEr1epmmbO/tfRWjV40t7WRBVxwByW99wfcJ
 MDDoHPyfU77lrYSruIeNuAchXlvggL/t6QJmxZxkjp7E386M5GCMItcOBop296LQo/zW
 p5B8b0AbqiRDtctJ2qH+9APQdbgHcQeAWM0KzNY8kjcnMXnQAbfm1qfHXs2sogkNUKA+
 GXYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVly+o+m9GiiOl+Cx1/Ve8mkZk/P1qcpoKH0lbWvUSjttRFc3mQNAgQN/L83WkdLDEsAJ0eJm1bqjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf1VZr6jWqMHttAzXPofW7waOik0PfXtLtiFig/fLn5Q9E1XAF
 6H/iQWHeoA09uNswlifyxSk9biLIbrbhGSaCrq5yNHaOiKe9hHMKpJn/qEkXvns=
X-Gm-Gg: ASbGncsD5GjA9RJKhmLl8SpZZPkE4aUyuLCvFZyNuXbVJHFo2G7p8Rpubl3VKzNXWVK
 aRO2q39QyZr2kDAetL7hOHabdIsBJO8uZfvc3lDPdhPaDrh93vY+vCK54EeOlTNXx4ca+cXOn3Q
 t9yXZY30KVvj/pW3kk3SHzghW9nUiyF+wN5mbUKGEXdLSnVI1XssoJQiCDnMfivhAmuokv7DY1P
 yHholkkq0m6+dou2JMbYp3UiaSoZmU3EfSWBWgldTNNE/howJ7nbDxCisVbQ25PJMZHO8dKly9/
 tYBD5wyLHX86L/WjMNCq
X-Google-Smtp-Source: AGHT+IEXChx9P0XiKZoNkZiSog2lL7kqWeWWaA+fbxmQW7+pyPDaxfCj2UqyTeAJOchNetAsSy3KVQ==
X-Received: by 2002:a17:907:c1f:b0:ab6:8bc1:9b5a with SMTP id
 a640c23a62f3a-abb70da2ad5mr751573366b.41.1739777534951; 
 Sun, 16 Feb 2025 23:32:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-aba910e8b11sm556516266b.21.2025.02.16.23.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 23:32:14 -0800 (PST)
Date: Mon, 17 Feb 2025 10:32:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/gem: Fix error code msm_parse_deps()
Message-ID: <75a78610-281b-458e-b703-57c7e7de573c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The SUBMIT_ERROR() macro turns the error code negative.  This extra '-'
operation turns it back to positive EINVAL again.  The error code is
passed to ERR_PTR() and since positive values are not an IS_ERR() it
eventually will lead to an oops.  Delete the '-'.

Fixes: 866e43b945bf ("drm/msm: UAPI error reporting")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index dee470403036..3e9aa2cc38ef 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -509,7 +509,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 		}
 
 		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
-			ret = -SUBMIT_ERROR(EINVAL, submit, "invalid syncobj flags: %x", syncobj_desc.flags);
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid syncobj flags: %x", syncobj_desc.flags);
 			break;
 		}
 
-- 
2.47.2

