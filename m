Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C07E51988F
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 09:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A87F10EE68;
	Wed,  4 May 2022 07:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A3C10EE7A;
 Wed,  4 May 2022 07:47:43 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id n10so1295565ejk.5;
 Wed, 04 May 2022 00:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9/Q/WQ7iL1cWs5UBOkCLl8sw1bCX1YzISfnpbevp/qk=;
 b=SD2C9qQBDUYah1In6/xzGAV7f1C3O+kBCQJSrHRjrQREMl3bCL8HoNc3T+dzIVp8z0
 SFodfTIuwdEzHViFsZhljkXsHFr/LOOi0qmsYSUoAaOE3xEmzXkN1fhDuj+1YHQSffr2
 6cHfjdxZjGZ2wPf0BwORRS19hqOYsweow+bglXiE01f2ObN54p+zGOFnle84hPg6RZ4O
 7E852eOlSpo5jT/LliVWTNUehtGptT0PMrXh5gkaoUr9mqr4ZpThi+slNEcaqS+mRG1N
 YvmqgpHrwIHHohevZ8Vuzehtkk5qIs3il2LrPyG3Mri7LTGpk8R8SKsw2kePMjqmWNcl
 Pikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9/Q/WQ7iL1cWs5UBOkCLl8sw1bCX1YzISfnpbevp/qk=;
 b=GpOW+zWgyfPr207sE6Lxn3EVCFIe911ACGMNWTZ0qFSKVB7Q5mfb3xy/rmZB1iW6KF
 4xpUuG9SdyTaQR1KZAH1sCoJQ4nTaMOrxKFhiwG7P7Lq71v0dj2UjR5+kSsRGvT3cs0o
 b48/R18n+pUamG2PL0bDn4FcCPKbPj7+53LxSc8fBGL1HdvoyUrKjtcsle4cCtLA7rpM
 QdpQxYpSy54cHtdEKkEu2Cn2vXBEj75JHUEuSyD4uypCJZClWTVnZWGkp4N8O17hV/YS
 O+DesXi6fEvOaboKoS0fWQ/Uba4SFwxCyj58ZtqXJ7rd8MF2ya8Jg0XrFiaBND4SoLGo
 wBhw==
X-Gm-Message-State: AOAM533STDDE9K22jF1TrgTpM9dq7efhgvbApmvtzBai8meM18UOlr1k
 7dG+qw0Mndn/UMPgCXpmdgBOnlJsSLc=
X-Google-Smtp-Source: ABdhPJwX3WiyLuyTK70PTuZyPL/xOM6ykAdRlVppQ8cUK3j0SNQsTnW4eoz2emXGi9BEAF2hUlPFCA==
X-Received: by 2002:a17:907:1c8f:b0:6e8:f898:63bb with SMTP id
 nb15-20020a1709071c8f00b006e8f89863bbmr19713004ejc.721.1651650461789; 
 Wed, 04 May 2022 00:47:41 -0700 (PDT)
Received: from able.fritz.box (p57b0b7c9.dip0.t-ipconnect.de. [87.176.183.201])
 by smtp.gmail.com with ESMTPSA id
 jy10-20020a170907762a00b006f3ef214dc2sm5433686ejc.40.2022.05.04.00.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 00:47:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: [RFC] Common DRM execution context v2
Date: Wed,  4 May 2022 09:47:31 +0200
Message-Id: <20220504074739.2231-1-christian.koenig@amd.com>
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

Hello everyone,

compared to the earlier version this has seen quite a bit of additional
testing and can now handle both amdgpu as well as radeon without any
performance drop.

QXL is converted over as well and then the remaining ttm_execbuf_util
implementation moved into VMWGFX which is the only remaining user of
this.

Please review and comment,
Christian.


