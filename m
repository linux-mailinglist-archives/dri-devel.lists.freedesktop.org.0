Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1531D1488AB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 15:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95C672ACE;
	Fri, 24 Jan 2020 14:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D3572AC6;
 Fri, 24 Jan 2020 14:30:46 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id p17so1905160wmb.0;
 Fri, 24 Jan 2020 06:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Dtj9kzGJlaT+1WAyyBsA8hC9XdxQDCHYLaST32IrAM=;
 b=aq3cGEu+PENOiJE4IWJVWI7DYGVS2Umo73Cixw+jN9sbRZ3ZmlliLKkL4k/asPt1sX
 WOYrKi0L9JqVuyra9UpA72Hh47FL1ZMsYj/nGywr2Tvtm7lH2DPaKmB786TS4F/UIDNW
 HiBLMykTBi4eAt7x3AbDacB9//xMw5wrjrJmp02aT8PjX15I9Eu1U6DxvXS+hDUiI9H3
 2QS8VeCshcg4HH8Hv7E2GZJ6nkHtqELsCn0mo5DVIDsikdF7PMqpzHBemoMR7OLnaPGe
 f/HOUMS8QfEi35CU1b2N8M5qjvCByFaoC9Cmc2PwEVzFkLlWVPdncWjVwRHmhJxfoD8s
 SMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Dtj9kzGJlaT+1WAyyBsA8hC9XdxQDCHYLaST32IrAM=;
 b=WYOLnzOR2pJxi5vd3j/GxSMDORSDWLk3nfjC7a9+bySnpALK4kiDZqrKB3P+bUAAoJ
 Xoe408xsAg3HLnutcjmhUs139TntZj9fOM1OhEOlmgjdC2e9g64vRDquQ46hcp4FXbEE
 GTs7a2t9Xz9dKtDf7YtlRFUHWvn2Gvv6rPWTrUg07VkD8jnmZtV9O17tYAHsTtcbRZ04
 VFjcvf9WO7Ijt+uC7/r8b/lnWShbSuCSuQrEbIfabVh07j+lhh3YEkHN3K97Fp1HRQVm
 gNPc9cobBnKr3+Wgutgd3lTMAjMmNQ1axGslHVRpdA0a/nD8ULKcMRpz3VtBUqJ+eyoP
 TmMw==
X-Gm-Message-State: APjAAAXuCojNwQ8FycuFrgqw56zVqBDXM2iZGtk8Ki0CH3SnZ50LY7+t
 pLIREvqUrwthScefZUL6mzHmPR36
X-Google-Smtp-Source: APXvYqzOjiIbHaCBSY7pNsqVtWuE+VRvvEdQJ4gRArC4qnBObADWNUMjDGJhIhSQEhFEJov0noRfZQ==
X-Received: by 2002:a1c:2282:: with SMTP id i124mr3453571wmi.109.1579876245060; 
 Fri, 24 Jan 2020 06:30:45 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:9c03:ec12:e225:5a75])
 by smtp.gmail.com with ESMTPSA id f207sm8381679wme.9.2020.01.24.06.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 06:30:44 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bskeggs@redhat.com, airlied@linux.ie, imirkin@alum.mit.edu,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: TTM/Nouveau cleanups
Date: Fri, 24 Jan 2020 15:30:40 +0100
Message-Id: <20200124143042.93733-1-christian.koenig@amd.com>
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

I've already send this out in September last year, but only got a response from Daniel.

Could you guys please test this and tell me what you think about it?

Basically I'm trying to remove all driver specific features from TTM which don't need to be inside the framework.

Thanks,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
