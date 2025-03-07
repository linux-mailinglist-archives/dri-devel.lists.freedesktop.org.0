Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED6CA563CA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 10:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E06310EB21;
	Fri,  7 Mar 2025 09:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Snz8R4Ua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC7F10EB1F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 09:29:44 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso9797195e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 01:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741339783; x=1741944583; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Im6pSo0BzRtrOvminHRm9b1Ao6lE3VOWmMljLzr+YZQ=;
 b=Snz8R4UaxBECry1YzNMz9ixbv6sb0fI3xp1jw+9/gyvcg29flM/5CAlrS7CnRPDXlR
 AfxHHlwkr/h+vE1uaoFtx3iXaTtr7uazU8e3SjK0oS4T8h0n9JX/HB0oj5msvzah2Yt/
 VYI5LNvnhdI6C25dwyaoN3nF+eLDgr20pRQcVlJofYj+btVLC3JWD4WrQWeZYZKgJu3m
 0yDYeMKFMsv+jojpMlCVYDZQJqrfR7PWatb2l+l9tSHQhj5F0RYzFZnEX+WWq1ZKXYQR
 7NoTdRrZg2lBZQ3P+Tq0TIsCLcDckSZiNYx6/wRDEowkK4oiylvdhnhrUaqLjoGKmogM
 tQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741339783; x=1741944583;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Im6pSo0BzRtrOvminHRm9b1Ao6lE3VOWmMljLzr+YZQ=;
 b=xKCallS+DNxSl3U3p5hTmKJP1DVHc+q5rWfP/M32bOGB2QqsZfWSSF7p/DuIQDLp3g
 9XDZHRUytMgiM58LoCVj+iWRebS9zJXg9OlYK/CTUOpUAAQ9oerdEaG8IIE938ujDwpT
 4AYPomAi167XFAU2L9STKhgAklvtMqrDrel2r+azbAXiaFld5wOoEYHGp5g6nK1gAYtr
 I4TNRsT5i4YJcZmi4UsZAjfk57LbS0qudXiHjNuLOEDn40KY4zZAKe4vd7gruaC3cw3T
 dAZb97NRfle5z7e30E0UlAdV6TxUgrQKV4ArPnxKqFbx21w0NSBMW+jdew5wM+uoNUpf
 r5KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxEEDyekIBdKya2CKueG+Omk1tceczNJXZpUm7tiekLixvf+GX0x/eal24mYOjxiDfI/LPivRrfmI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtJEFfzst39LSFwXvMf7DJHZ+Zxc5MtRB4DGlw0G2QZ5da4Yh7
 gvCwgwqmA7lMHXZUbz9zIP6u9RmFWOJc4Rw/VC3b++AqASkTDh/8Ux+A0QUghuA=
X-Gm-Gg: ASbGnctkWm8P24iKnF8Xl5+TvGsGLHYtFgZgAT9ujHMYIT5x9AuEhdIlUHqpWA+rE9O
 poYJ0/YUZ7ZP0aiVnXDoYhpclioplxuaPX5R2YA/wQXPySnd8EJvvARWKWYto3edu7azeox78cI
 RzSlP5r/4//Y4C03fyL0HkN3XfpB6sZpuZClC5sR9QBWUpJBwa1UkUfmTAiGgzDLeivTt1l85SX
 EJ22yWpGNWdzDSgd8PB+f2B7bJIxhBPoI9kmJzWWa3m7RevyDKAatOUn1ZTWP+WweaAthespa3s
 W4ATEA2p0z/0iQ0mSQ5r0cj6/c1jDzucSZBP3lVjQZLc2SeNEA==
X-Google-Smtp-Source: AGHT+IG1aeOLiht/Zk+dJWxQiJtrE01AKe/jCJ9h6AR4ika6O/iJj47hJhtKgYXJCT1ozzCGM9Qjxg==
X-Received: by 2002:a05:6000:2c6:b0:391:31f2:b99e with SMTP id
 ffacd0b85a97d-39132d1fc45mr1723216f8f.2.1741339783348; 
 Fri, 07 Mar 2025 01:29:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912c0e3250sm4783347f8f.61.2025.03.07.01.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 01:29:42 -0800 (PST)
Date: Fri, 7 Mar 2025 12:29:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/msm/dpu: Fix uninitialized variable in
 dpu_crtc_kickoff_clone_mode()
Message-ID: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>
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

After the loop there is a check for whether "wb_encoder" has been set
to non-NULL, however it was never set to NULL.  Initialize it to NULL.

Fixes: ad06972d5365 ("drm/msm/dpu: Reorder encoder kickoff for CWB")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b0a062d6fa3b..ff6f5c5303d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -956,7 +956,7 @@ static int _dpu_crtc_wait_for_frame_done(struct drm_crtc *crtc)
 static int dpu_crtc_kickoff_clone_mode(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
-	struct drm_encoder *rt_encoder = NULL, *wb_encoder;
+	struct drm_encoder *rt_encoder = NULL, *wb_encoder = NULL;
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	/* Find encoder for real time display */
-- 
2.47.2

