Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1A5403A98
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECA76E0CC;
	Wed,  8 Sep 2021 13:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627A86E0CC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 13:29:38 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id m2so1775728wmm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LmkaLobX9YgDAtpzSmJ8/FTOI8IWHGMsSYpa+boy+x8=;
 b=hXHtnufRde+rlZInqAWf6hShWMC9Kih/VO2O82Cb1/1f/SWC1RrP1T0YgTktigM3U5
 pPA9by7GbxCfD/o9wMfIeVn0oIzB6PgRDupE5A/41rcK5JNeQ4Erh7OyrbD1wkw0gYg9
 a1cK553reDu3dRKtMWlNBqbreBGe3ES2jnciOcPk7sqd2P95Vqm8KZqVoE1c2y/N3NMh
 PFGyRu/yWE2+pdj/2cS2xdSD3r6hUPfDsacS0dFRMUCUyHbH2KnWO1AvIWNhjkWujv6d
 Vx2OrtgYArpMobO8Gmwlw8TnS/And7+ArfPkyKN50GMpgzZzO+t3Yu2GQS6hn+72u3uJ
 3LHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LmkaLobX9YgDAtpzSmJ8/FTOI8IWHGMsSYpa+boy+x8=;
 b=MkphupRsQC9hqlxcnykIY03XPVyH392RTAhSRBl0vGv1smfbXaP8HCAnzD9jvOZEOf
 N1eystTmRnb8FGy1j8M2Ut2FpyExPSwj/blxons9KFkImbsIZpnWy42Ew0VnN1clYF5r
 nG13Jkuriulhjt0VYsb6SQzGTl9iDf9S1qJENXLoPkTAsSfVy2m5sBsKazpBT+v+Cv83
 4VqzUf09uR+macSxTYRdei6lgD6vaolVE5eiTMKFTaqQDJevWh4p8ZiiSb8ukxGvtX14
 rt7r/TfH058zI8MSq4pwCfRMj4A+ut0tDJV3CBtbPrPoB2iwHAgfrQD0O7KxAHZiyt8M
 FnDA==
X-Gm-Message-State: AOAM530bzGk7crpl62ZEWSquMeV9/Bv5pFRnZQVxDzN/GuMC0nxwwPX2
 6yXH1kE2HN/7sZfDPzTa+eV+bDKzUFlAFW/F
X-Google-Smtp-Source: ABdhPJzDymg2p4xMMCG9U3oco4FyAbEfk/KN6ImpT/6JoAiSeljXPJCPojlyHLEGRiXvDOO1J04qSg==
X-Received: by 2002:a05:600c:2311:: with SMTP id
 17mr3012687wmo.93.1631107777021; 
 Wed, 08 Sep 2021 06:29:37 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 k18sm2138959wmi.25.2021.09.08.06.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 06:29:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com,
	daniel@ffwll.ch,
	alexdeucher@gmail.com
Subject: Enabling TTM kerneldoc
Date: Wed,  8 Sep 2021 15:29:25 +0200
Message-Id: <20210908132933.3269-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

Last round for this set I think, already got RBs for most patches.

Only patch #2 is currently missing anything.

Please point out anything which can be quickly improved and keep in mind
that it's better to have this enabled with some typos than not enabled
at all.

Cheers,
Christian.


