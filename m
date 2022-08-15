Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4025935F5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 21:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019B3B978E;
	Mon, 15 Aug 2022 19:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F89BC908
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:59:44 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id w19so15047652ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 11:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=t2ffuUofUSNRuNHCpD6CDFhu9ezcbxwIQirPydAy+jw=;
 b=iWCuJ276jnuYwCHvzlLpqdCJwb49mksz0Ph1lIAkqVbCkQZjs8ONAxeoc1F1dFQ15g
 NTUlNcetgQaxX/9uBJp+RhPnoKYkfmgg+Nh7/DQFVocBpYgBWCNOuL03aOaW6F9ZPUNc
 YBwWRsT3CKDqDtKw3wak4YZJdMV1r1HF/uP2sJUp6J67xMB1FeEtcbBZprgb8k/VHnSw
 pBwxKkF7mVSEjmZtvy3xEbObm5ODfvwOvsr8hSz/Y/bMLKsBrU6d8WQV1UWZtBfRlmsv
 oAYEad5cc+ccKYDfnj5PFWCsJySJHBaSVUBYIowUuMXSeRY6hR+8mYuiElTITrjNPrpF
 7gPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=t2ffuUofUSNRuNHCpD6CDFhu9ezcbxwIQirPydAy+jw=;
 b=JJrb+GkIK72zOUg43+xIWsy2AeE8bAfEmfSD4o00gA1h2ZvMgicZJyrMKObwoo/wTe
 GX8aJAz10BUT6MK7JGEzCG5KVraAZnYoWZbtVG0WiX/vYfmMZgElCDJ0GoRjKBP7GAIS
 FlSwXdOyRLOjcO2nZ8gTm7DHa9NcQcv1pEpyAr1MC1fHA/PHATSG8axdJ/euuF/9XiCN
 Q/sSfu5f9IzexBrw9CTnFZesxoaDDy6BhmB5mA8IV4VFzJJApUZ89JPn2Mo0YrmT+ljV
 ZUCKtgCt9VGCl/jxgyNZ6NuHme7he8GcP4DKsvsA7jj3C23IMhvTskbANH4cX6pYFQYw
 u45Q==
X-Gm-Message-State: ACgBeo0VnbVI0rtdEQEwt+heMdSbX9jQF0o3p4V1/IoYlHO4FT8yEOCG
 b5snAiaB7pyH5Wx4lONgmm+LAF+ROb4=
X-Google-Smtp-Source: AA6agR44gofNsCUZxY2jB9JVIeUnKmBpwP7LcjM93JRWQatTqgYncHv4nfMZEG2W6fFJCOmI8oVX6A==
X-Received: by 2002:a17:907:84a:b0:733:735:2b1a with SMTP id
 ww10-20020a170907084a00b0073307352b1amr11446147ejb.290.1660589983266; 
 Mon, 15 Aug 2022 11:59:43 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a170906304a00b00731745a7e62sm3553805ejd.28.2022.08.15.11.59.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 11:59:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: Latest gang submit patches
Date: Mon, 15 Aug 2022 20:59:30 +0200
Message-Id: <20220815185940.4744-1-christian.koenig@amd.com>
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

So I think we can push this now. Alex, can you take a look the the
remaining patches which don't have any rb yet.

Thanks,
Christian.


