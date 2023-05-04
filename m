Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B886F6A67
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EC610E0DD;
	Thu,  4 May 2023 11:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96ECC10E0DD;
 Thu,  4 May 2023 11:52:05 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94f32588c13so59753866b.2; 
 Thu, 04 May 2023 04:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683201123; x=1685793123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=3DKnxDtn5sn1bGgupNWXjty3ix90SR3dHTMYtao8Ass=;
 b=R4gq8YtKdgqYy37nJ8jmP8JkRnMs5/NFQGsS5+MQ3TmWWPXKUBZ9BilEvaxAG3olCB
 SCgRBRpKRdNCAQW3XPOzPLwo+FLBEJ6m2iHzDmJySQyHEqJTU2QmQvz2GKRIAfP4Q4Oq
 jLofejo2jTL9T3BJEel/yQcYpLc2JFNK/FciamOXRBcebggFWPUFKSrd0hZSq+foia9b
 xTMHhblj9XxaWGJbtWv5JZxXWR/LqqwFDgzseQQrduX5KU2lR5hmH38WkllF6lzm/sDO
 Lr98ukCdbR7yHSyN6wHsxPtQT4i/T/2filLAp1Ti3s1Hg6oDzhL2WBRnv5UDOI87vXhB
 AWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683201123; x=1685793123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3DKnxDtn5sn1bGgupNWXjty3ix90SR3dHTMYtao8Ass=;
 b=efhvrlO0WCAUr5Jkp7xd1CA5BWw4XpH2BaqZLokrBViX4dPGChhb+FaDAlT7ILxQHu
 y3Seqs7sq84CZKqub6nxADIhwkCH9V8DyLmo2WfNpy+m/SlczKKQ+RcsJvI9wWaq6iFE
 2/XUiuHtdoSO73PfvYcIv7LIDINh+zRVWbUZ/r48lj7xoPcz3WaUculox7wRJpmWl6HA
 t9UDD4/o7UHTO0hJCfTNbYnIK4d3hTksBiihkvcgO2LVV+bqMgBKPPvhjNJY7Un4JzIL
 oYCeWAd3E9TmTFRW01U9tSeUMeXAhVlOAcdqo18loCjWZkcSJBHmsnlCeiI7xVPfGbbK
 FivA==
X-Gm-Message-State: AC+VfDx5exGFG1P40JeAt765gE02DdA80Lr96PBZvSmLH6/2qNZcLVH1
 PFaE8She5YTcTUeRdF2I/Ms=
X-Google-Smtp-Source: ACHHUZ7G4BLffq+0vs1j8mPJ67lbxD76NHfQqFUc8p+RIEunj4sLGdgprDoC8ZhRcshzzOK4fgV0dQ==
X-Received: by 2002:a17:907:9717:b0:94a:44ef:853d with SMTP id
 jg23-20020a170907971700b0094a44ef853dmr6795795ejc.68.1683201123315; 
 Thu, 04 May 2023 04:52:03 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 hx27-20020a170906847b00b009659ecdf29fsm1061741ejc.1.2023.05.04.04.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:52:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Common DRM execution context v4
Date: Thu,  4 May 2023 13:51:46 +0200
Message-Id: <20230504115159.2245-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi guys,

so well known patch set by now. I've tried to address all review
comments and extended the set to also replace
drm_gem_lock_reservations() as suggested by Thomas.

I won't have much time to work on this in the next few weeks, so feel
free to pick up this work and commit it when you need it.

Regards,
Christian.


