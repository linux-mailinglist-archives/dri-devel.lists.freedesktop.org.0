Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AA051A627
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 18:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5510810F94E;
	Wed,  4 May 2022 16:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8855310F94E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 16:50:17 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j15so2849929wrb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 09:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VhrTl7KvPkMUKbgct8N2NGRJSqPiwxS7P4J2Ux1A5RE=;
 b=sNYmAhxmCYPyBXdu2pKd9QycsXE2/D/PW/RnLhmMp2sMVNIgSyiltDNOE2m8zhv8+s
 eNLfuB5Rwq1txoV6W5h5PWLfXZ2akD5NO1xmD8kcYJlqcTkJVsNlbnlIvcQJoQygxKF2
 h9/wINhRAHo/VXS33lgFJtjtuw1OdLAMaeK+5WuF7PuqllQNwYLnMwlqNQ28b5/HXVuZ
 zHrkDj+ar/dSM8yPdUS4ItfFiniukw2RwsARaeNhzvLYPOn6330lKmAvzaWZKrRyhZkb
 lGhGwnJ78NcJ9V1lBo0tiYf5mhNZGVUoBnL4pA4CbSOK1oMLN4kcS4IE0s4/e1vzBBZb
 o9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VhrTl7KvPkMUKbgct8N2NGRJSqPiwxS7P4J2Ux1A5RE=;
 b=mD/uyPgTR7nzWfb7DV6r7u3ToyAHhYqrke9n8UOz/DlrCcnFQhEOhNFogu8GkpE8IX
 JE0SD0pn/+bgra5phIQTmBoMfjtp5WfXCmpReS5nvF/CvbBNkSxu50tndqX6O8jnVFZs
 spqXDKF99wYiPkuVwJ8qjKWwonSgKAwd4LYzCpd2UShSMAsk0NlvD9CV20RT5ptI5dt2
 cSXvT11lZN6SnBRB+xKvWDG/Ihs5soy9P+WmCOUYTM85TBYo4N2UyioiGYK7Oz8MJ698
 w9IqJhJzfmEDWs58aEjJsqbM6iWsGnivM20paiuW56MBFHc4bHZy9lcggB1kFkZv1laI
 0N1A==
X-Gm-Message-State: AOAM531MAtBOnV2kxRyFuRtjE/XEXMRWHuMNrHmtru3yfEK7ZfNYJRMJ
 0douhTtAQfe7W0pWXn2bcumMAooKCHx9zw==
X-Google-Smtp-Source: ABdhPJxsAZ0M2jDsvQmoJsCdXtyQYUcCRdxcVg1fIW71DdFynQ6Lge6SsrkzIrsfv6uNESDxcuhT7A==
X-Received: by 2002:adf:ce84:0:b0:20a:e076:30ff with SMTP id
 r4-20020adfce84000000b0020ae07630ffmr17079152wrn.361.1651683015583; 
 Wed, 04 May 2022 09:50:15 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:f40e:900::24e])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfba41000000b0020c6fa5a797sm5930593wrg.91.2022.05.04.09.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 09:50:14 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] amdgpu: A few fixes for clang warnings
Date: Wed,  4 May 2022 17:50:06 +0100
Message-Id: <20220504165009.82557-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.35.1
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

Just a few simple fixes to get rid of warnings seen with clang 14

Mike Lothian (3):
  drm/amdgpu/gfx10: Initalise index
  drm/amdgpu/gfx11: Initalise index
  drm/amdgpu/gfx11: Add missing break

 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.35.1

