Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5FF7941B5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 18:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E28310E174;
	Wed,  6 Sep 2023 16:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B16910E174
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 16:51:53 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-573f8afe1d9so83024a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 09:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694019113; x=1694623913; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v2zLoFpI4oq78gnS3M70eaqwcugwfdYALt72FuhYX+Y=;
 b=YXSjDJRcfPfQrg11vWyFgEtHZyAtOgacw2JE7Zv73b3PWOOHaAxDFqPgqlrteWk2As
 PASIGNkD7NlklnACLOI/fabH4CNZh6c7IUKMDjASzcAWuCqTMCHs2Uo0vc0CeO6NgTwu
 K4Ig9uzgZ2qlmYU7ggdvJRvj5jzwS51BalERDRUBR3u7grlpxwirrzqsIP665uEYr1bV
 G8U7vQQ2Y9oht+XTL2EP/Ovh7VqeDTBx2xGkjiXKdjWY6Vvg762x8EL9uURb+28i49Sj
 AVBldGMqKYneK3ww4p7cRWrbfQGdu+tuLdsXClwqtB42Q0F1o+9J7eUsYTGD8c4IVXRO
 SKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694019113; x=1694623913;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v2zLoFpI4oq78gnS3M70eaqwcugwfdYALt72FuhYX+Y=;
 b=kDmmndYg0iRsglIOzmXJ+NQ3gxnxv2sZ3TUS4ZdacGkJ7OICkWOsZIUDz+7I6JfI9n
 UUdQMpyRQ+xCuhFMeYo9eAMBDVWORj1mGNvK9y1UzBe+/gTNMRR+rv7/Dix10ozHACDI
 PTERce2Gt/EnD6zklxj3XF6QyGKWGx+iDHxN0GtntqmXNthsuoCZtj4fzYK4gfyGIrR/
 PtIErFgwvcEt4gvqoikA41E7FNgx1EaJ0W0dv0wmL/Rs9Ks6ND66GWmEtgi1xrvPeXOf
 Cng+itPKd78rTpalCX2q55YdmlTyx6eEh+p6sECjco9/KHsjip719thJ2MbwCzGBb4U3
 na4g==
X-Gm-Message-State: AOJu0Yx8vtgJ9DhFBC7tW2pWuS/9tuQzYOaQ5terhkstewJjx9ejKSop
 5h2OBJrZ40K7KtAfWn6lXks=
X-Google-Smtp-Source: AGHT+IG3yGBJOscZW8IygjSlhgGj+Agxa9KMGg1dtQxUiFZmK7w/mnFERg2G/FKxqRFMEVRMnWqcUg==
X-Received: by 2002:a17:90b:188b:b0:269:33cb:e061 with SMTP id
 mn11-20020a17090b188b00b0026933cbe061mr14731094pjb.24.1694019112671; 
 Wed, 06 Sep 2023 09:51:52 -0700 (PDT)
Received: from vinayak-ubuntu ([117.255.46.255])
 by smtp.gmail.com with ESMTPSA id
 bt22-20020a17090af01600b002612150d958sm15277pjb.16.2023.09.06.09.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 09:51:52 -0700 (PDT)
Date: Wed, 6 Sep 2023 22:21:43 +0530
From: Vinayak Hegde <vinayakph123@gmail.com>
To: sumit.semwal@linaro.org, gustavo@padovan.org
Subject: [PATCH v2] Remove the parameter not described warning
Message-ID: <ZPiuH+ghqamtwJGA@vinayak-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I encountered a warning during kernel documentation compilation
due to a missing colon in the documentation for the
'num_fences' variable in the sync_file.h header file.
This change adds the missing colon to align with the documentation format.

Signed-off-by: Vinayak Hegde <vinayakph123@gmail.com>
---
 include/uapi/linux/sync_file.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
index 7e42a5b7558b..b389a5495181 100644
--- a/include/uapi/linux/sync_file.h
+++ b/include/uapi/linux/sync_file.h
@@ -56,7 +56,7 @@ struct sync_fence_info {
  * @name:	name of fence
  * @status:	status of fence. 1: signaled 0:active <0:error
  * @flags:	sync_file_info flags
- * @num_fences	number of fences in the sync_file
+ * @num_fences: number of fences in the sync_file
  * @pad:	padding for 64-bit alignment, should always be zero
  * @sync_fence_info: pointer to array of struct &sync_fence_info with all
  *		 fences in the sync_file
-- 
2.34.1

