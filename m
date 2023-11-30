Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44AB7FE9B4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 08:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11F110E6BA;
	Thu, 30 Nov 2023 07:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62A910E6BA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 07:27:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40b397793aaso3171235e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 23:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701329250; x=1701934050; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4JjlaU9UsIMt94Gfn/d7w0fux3sOHDkH9eA0gjm2JEk=;
 b=pAFeIGQc4iMx07Py32TKImhgU1F/HlC58pA1A9sEK1KFZD1zsbUOLWedMmlkevoXIv
 zv/zlqSxLx73u+8THrjCnUT8ftvUEYjbhj1wjjaJAwZpKwpknQ4CeWuAnNU9UToOU3HH
 9uY62pMDvBLT0Gs7fP6fqtfAVBULkHO07D2RWITw+au4lmlTHKj+YqBscLTkynKakH6e
 zctXBw4ubB/0BV++3JD90/nEvZ3CFvDjDSLW5AnQcivdrY8H+jesSpsxpS3todby0dBJ
 u+WKM6Ke/lmmj4ZqGwzG5791+9mAqwLSy6saMjMBX+VxOS2iLcJBKTRTrVqEOcobGQbv
 Xp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701329250; x=1701934050;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4JjlaU9UsIMt94Gfn/d7w0fux3sOHDkH9eA0gjm2JEk=;
 b=f0sP168elANa4OqvPcy3VEAlazNKnpuJlLVQM8i1b0DJgLSpVwMruBQL61lK691InB
 cAOkJwKRYxNsNNMkSlgI0V5ku0UGpGgSdbv0sMAEOrNnwOr5NyyYt27zpuLyL4fkqzBG
 7wQrUrnNL2SZCtp1Yv+H5DlxPICbBmAlsLptFLKdevmo8XSRUohuBxZbyJnICH/vdJ/z
 nRf4wYT9gv8+itROq9kFIBz/StNU8ZWujHzINURB19xBHokfn6Gg9k5YD2s2HlItM1Bf
 0DC3+BMTUCyjLZhIDFT4nFFpDAFc7jQ99cZ5orDGWTk0KjECWGo9W3awVIGlilPiNvfV
 FZww==
X-Gm-Message-State: AOJu0Yyg4LNKhD6ScPPQfmkEEdEGxUfYtEARjBVTz7mVC/lNROmds0nZ
 yb+gLQQd0LBdWrVvIPYvk0Osbw==
X-Google-Smtp-Source: AGHT+IHx2VxQp4Z7whwkjNRnV6pYrG3hoCofW21EGX1Fy7TjpI2h0SyUqJc5y2ubgoUN8vM8TByN/A==
X-Received: by 2002:a05:600c:348f:b0:401:b92f:eec5 with SMTP id
 a15-20020a05600c348f00b00401b92feec5mr19217584wmq.9.1701329250041; 
 Wed, 29 Nov 2023 23:27:30 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 fa10-20020a05600c518a00b00405442edc69sm4595360wmb.14.2023.11.29.23.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 23:27:29 -0800 (PST)
Date: Thu, 30 Nov 2023 10:27:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sarah.walker@imgtec.com
Subject: [bug report] drm/imagination: Implement firmware infrastructure and
 META FW support
Message-ID: <6c82d627-478b-4c90-aa42-8bc6b163a976@moroto.mountain>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sarah Walker,

The patch cc1aeedb98ad: "drm/imagination: Implement firmware
infrastructure and META FW support" from Nov 22, 2023 (linux-next),
leads to the following Smatch static checker warning:

	drivers/gpu/drm/imagination/pvr_ccb.c:277 pvr_kccb_send_cmd_reserved_powered()
	warn: odd binop '0x0 & 0xf'

drivers/gpu/drm/imagination/pvr_ccb.c
    268                 WRITE_ONCE(pvr_dev->kccb.rtn[old_write_offset],
    269                            ROGUE_FWIF_KCCB_RTN_SLOT_NO_RESPONSE);
    270         }
    271         mb(); /* memory barrier */
    272         WRITE_ONCE(ctrl->write_offset, new_write_offset);
    273         pvr_dev->kccb.reserved_count--;
    274 
    275         /* Kick MTS */
    276         pvr_fw_mts_schedule(pvr_dev,
--> 277                             PVR_FWIF_DM_GP & ~ROGUE_CR_MTS_SCHEDULE_DM_CLRMSK);
                                    ^^^^^^^^^^^^^^
PVR_FWIF_DM_GP is zero.

    278 
    279 out_unlock:
    280         mutex_unlock(&pvr_ccb->lock);
    281 }

regards,
dan carpenter
