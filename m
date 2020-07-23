Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDDC22B24B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 17:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE536E1AA;
	Thu, 23 Jul 2020 15:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2681C6E1AA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 15:17:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id l4so6744807ejd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 08:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WLrTQ/IPjfHEZietqRj/pOdrEnnFPF8zhuPRDHptE+s=;
 b=ekCCj/kDwll6UW/Y2YBDaumrq51jX53YaTpDbg3V4nInWogNAHeELvRWxv4RSuTwYW
 yniFsCCjyi4kJ9wZrlWXZdZx1MwOQyIbuhVVg5kxN8iHKtwkzuVhuTKh0pV/cnI2TH+9
 QcoUTstH4biMTG0YnsPS6/HsRaUg+MOgVIfr0iRKHyAzaLnCyzlow31WkMoAM4dTP1dx
 XNQVfRayX+W/BX8crqNV6vIsszenFi8qSKQ6djlaJN3jivOtQLFqlePqHujf3wd6cY/0
 LNWUbUJyEi7H3+1NuE5DewoJK3Yu0/jSAB1K5K/wUPJ2is055GTzrN2WQKbCd571N4Xe
 UjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WLrTQ/IPjfHEZietqRj/pOdrEnnFPF8zhuPRDHptE+s=;
 b=VJSJF/CKOKkbd2o7HE2VBl+fZu4YjNBUveS1iEvMcblfBU4OYfWQuxhzhBzofh8d6o
 /oDc2nrXKhwffqhhisujYusOlJmmDCL291vFkyIj2KkAgmCe1/mRaRvtBoKv8+SSKkp9
 VPolxjZYFTce7g78Ji636xEp0fXLcFXHwDfxoAnH3U68i4wlEwLiIsiokNvOeEMpXn1j
 Q+11hmy3jLroZVkstv7sK5y7jdxCMzv/KpvBzFmDZDBHHW3c7jKYKsnKSa8TThJZORNr
 j4EUpsvJYJfchjEpMtbFwLsMfkL8KYjfHXcxx0JgQloXhZjWzkSbxPGbeOPUL5C+Z/CK
 8PMg==
X-Gm-Message-State: AOAM530uU8z+2hT8/HM2NmEIc46YXjMlGwZUhU9wF01toS3Dpo+14mzG
 DLcyWx7lhyynqgEthck6JGRokH2T
X-Google-Smtp-Source: ABdhPJwqQTaMoBD6sNrBwHgOiiw+df5BAoohx8yJUn7Rtyp5lV7AfdONi9jDJD96q3odk7Pi16QJuw==
X-Received: by 2002:a17:906:248b:: with SMTP id
 e11mr4034248ejb.280.1595517432560; 
 Thu, 23 Jul 2020 08:17:12 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4ca2:7494:c4d6:51a4])
 by smtp.gmail.com with ESMTPSA id q6sm2239197ejn.30.2020.07.23.08.17.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 08:17:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: More TTM cleanups
Date: Thu, 23 Jul 2020 17:17:01 +0200
Message-Id: <20200723151710.3591-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just another round of random TTM cleanups.

Please review and/or comment.

Thanks,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
