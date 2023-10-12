Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5F47C69EA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A258D10E478;
	Thu, 12 Oct 2023 09:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFA210E478
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:44:15 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3232be274a0so1221236f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697103854; x=1697708654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JdWGcsYghkGoyrKlyLKuyf2tnx7yyv3c8tq4YtC1/Wg=;
 b=R2JwLYPck1q36/AJA2Od8oIWLOaZliWGm1vN+VDUPEJiSUeA4xRZ+UxRxiiKOZ9ue0
 KxVIT0HaAtPJwQ9239/Qu1/7qSeoulY5eVF9IP1xlSNoDeytCCL8fqKIyXoBGh3sA0Nm
 lbWn+WY2H5BVkoZSaZ9hvpmsAIY49V7WJRotNktODTTZIiS5Z+OIZf+nsFCVnC8iAa7c
 DMdTcGkgVUGTNIUkiyagVPcc4X3XZ9vQeXuSiR+irvIP8zmBsAyHtiYXGzYDU6vmT9sg
 8ufLx3SvdAUtPw4Qra++Pda9JLxy44V0Y0qsgvzE3sl0JCOWWXG7zf6l2ISXtfs6C2xp
 iASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697103854; x=1697708654;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JdWGcsYghkGoyrKlyLKuyf2tnx7yyv3c8tq4YtC1/Wg=;
 b=MfSvcXWmu/efztg6xEjcPQDhxnCOTD2eEy1eiihCNuxMzsHmX8Rgv+TgcJ/LlqwDj/
 MSFX/lyT/E77/+uaUWnqd4BePqJZqOVyOZQxE+ggHc+2F5bF+g0exXnpYAn1DlYFPKjU
 JR2KRipCYs3zYpy2Ra32P0lvEV4/9U2LB7IGl94OCINj4fEPr32OyMDuGHtVXfgvJX2u
 8B80Jra3aZDthO8d/V68EcSn+yV4gYXf0YL2nIV+GHajJT/CICvrKnyOeeqMXWmfzEj5
 CCQ4MMcYzV/hjyhEgR9RFGVJXOKIaQS9kEea4PKdtNNKdbNRWYWBFjdTOynmjaMq1fFn
 o0gQ==
X-Gm-Message-State: AOJu0Yy4upKOfLzIB9sm4G6jcIdTC1KK+6kQ0ZJ29OM2EDeAu51ZcwkZ
 0yR0Pohgc38WJlpTxqmg4kqDHxUqarhEc8C9/II=
X-Google-Smtp-Source: AGHT+IHhiqfs4VEWSrpA4CHsv4ZIQLqijpJ2fG9MOsB1zFEeDS0+ZjwqkZgBU3Dz4TrQHmAlwTSD6w==
X-Received: by 2002:a05:6000:71e:b0:329:2649:ced5 with SMTP id
 bs30-20020a056000071e00b003292649ced5mr22332089wrb.32.1697103853999; 
 Thu, 12 Oct 2023 02:44:13 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 ba18-20020a0560001c1200b0032d8a4b637bsm2899980wrb.22.2023.10.12.02.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 02:44:13 -0700 (PDT)
Date: Thu, 12 Oct 2023 12:44:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: adrian.larumbe@collabora.com
Subject: [bug report] drm/panfrost: Add support for devcoredump
Message-ID: <376713ff-9a4f-4ea3-b097-fb5efb685d95@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Adrián Larumbe,

The patch 730c2bf4ad39: "drm/panfrost: Add support for devcoredump"
from Jul 29, 2022 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/panfrost/panfrost_dump.c:226 panfrost_core_dump()
	warn: 'page' isn't an ERR_PTR

drivers/gpu/drm/panfrost/panfrost_dump.c
    223                 for_each_sgtable_page(bo->base.sgt, &page_iter, 0) {
    224                         struct page *page = sg_page_iter_page(&page_iter);
    225 
--> 226                         if (!IS_ERR(page)) {
                                    ^^^^^^^^^^^^^
I think this check is unnecessary.  Most callers don't check.  Only one
other caller does check which is rvt_reg_user_mr() and it assumes that
sg_page_iter_page() returns NULL on error.

    227                                 *bomap++ = page_to_phys(page);
    228                         } else {
    229                                 dev_err(pfdev->dev, "Panfrost Dump: wrong page\n");
    230                                 *bomap++ = 0;
    231                         }
    232                 }
    233 
    234                 iter.hdr->bomap.iova = mapping->mmnode.start << PAGE_SHIFT;
    235 
    236                 vaddr = map.vaddr;
    237                 memcpy(iter.data, vaddr, bo->base.base.size);
    238 
    239                 drm_gem_vunmap_unlocked(&bo->base.base, &map);
    240 
    241                 iter.hdr->bomap.valid = 1;
    242 
    243 dump_header:        panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BO, iter.data +

regards,
dan carpenter
