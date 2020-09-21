Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 786602728EB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 16:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B764D6E135;
	Mon, 21 Sep 2020 14:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FD86E135
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 14:48:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id c18so13080703wrm.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 07:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Zv6ka/HbfbAseTKohmUdj+PzByIjSDn23SwFBxovZE=;
 b=Vi/pyuhehbVtaM5es/MNIorg8kYuLHqR4Pk/tlDQEoGcPqD8Rj4cQrUu/MZzhm/L+e
 0422Nw89EEsZtKGewGry7Qu8u7J6Jkg1tDNW+IDZog7xqDcGNT62tahg0oGX2Xdh8juw
 PVi+soe882cpOcRssyDoSetx3ZkH69iGnwb9sPPy6maGzogZVhvsG/UFhT8bnxhM8yEN
 sL41hsA3VT3r/sedft2RrZ9wZfZeTxaIi3hTaBwPWcOKIk4KjoZGkguEQ5R0eYQCwZxh
 b6sk6IFzeynfsCkcuueaUWPvLh/gpqZnJw/rvfItDemQ4sHbdmbuSjmmy8nRDA5BuCEP
 pFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Zv6ka/HbfbAseTKohmUdj+PzByIjSDn23SwFBxovZE=;
 b=uHxdtfbmr1IGVMIxbiyemKShrYtXIl0kscEziJ/zTmidw4JJoEFP6ZMwcLbrfhTv/M
 2r+LmxZPieNOdASzRjkv8iJjtWZxh+IG9vvbSQde3eUVG+srCr/HSzq9P800tep/lNP+
 hJSLgzIws8XSP+sYozEmL3PUscLiIetr3psy6syEzCYjJ4bc6bzCQEWTQgC15sdmQ2S/
 r5fd6ltxvOAdvFTMk8Z/lGdw3Z/zcDla0W/f0ILCMAkSb2CGnoyd846i4d4Gqtmrgarl
 ZQHNQtzeERczcElPiAZP6NgOILAT+ootD/h5iEj2TZ7BD/gJgWhWUnDOL9ApXJwC2K1A
 QDUw==
X-Gm-Message-State: AOAM53066MoU1UHS8njBR2jpQaieFcGjb08CqUeGKWDgW/SYnQ+omMP3
 njoyoPccFEtICp7HpVW+0gAXKgdG8TE=
X-Google-Smtp-Source: ABdhPJx/KK+qVodBx5bkpjchQyQT+19RDJDWiitfkOYl+3aZpss+xduff+fpMjCrcWYrOrkAzbVYBQ==
X-Received: by 2002:adf:ee8d:: with SMTP id b13mr111959wro.249.1600699738405; 
 Mon, 21 Sep 2020 07:48:58 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3482:3104:ab8c:3ac2])
 by smtp.gmail.com with ESMTPSA id i6sm23480992wra.1.2020.09.21.07.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 07:48:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, airlied@gmail.com, tzimmermann@suse.de,
 bskeggs@redhat.com, kraxel@redhat.com, airlied@redhat.com,
 sroland@vmware.com
Subject: Nuke TTM_PL_FLAG_NO_EVICT
Date: Mon, 21 Sep 2020 16:48:45 +0200
Message-Id: <20200921144856.2797-1-christian.koenig@amd.com>
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

Hi guys,

The TTM_PL_FLAG_NO_EVICT flag was never a placement flag to begin with. Instead it affects LRU and eviction handling.

So clean this up and provide the common logic of pinning/unpinning a buffer object instead.

Since this affects basically all the driver using TTM please comment and/or test the patches.

Regards,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
