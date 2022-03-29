Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C6A4EABCF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6F110EFE7;
	Tue, 29 Mar 2022 11:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330F410EFE7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 11:02:49 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b15so20253479edn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 04:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I8CsSb7f86+uUUhYbPa588Y//kvyyDzzxWeFWsWOUO4=;
 b=PrMq4CUsCA4McnZWEYsooZaDc4Khrw9ZL22E8t0gkJHd14ZGvzSFhCThXQLW5aTaLG
 x/b0ahqyMaom4Db7hYQloEkFJAzH8d67cSmuNGKJjLt6al/EETid/qu2baflAR1fP1be
 Aa2pi2B6DE97HmffWyfvv9hW2cYxEqzfRlKSJe7NKm38iM0eXxQJhRorLhqmaeBCbOao
 ZsrvyCROpudKe7GidLWH7CfwVvkJnHrcNhFBNSuzgATlL2dlt6xeOgxDPBq3c0ZAA8zY
 dbbNYH1gSfvlgZwRvAlM/dGanJVXrwo2cBGkovt0HBUeEIceVywpmS4E85xOno8ivcf8
 ZW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I8CsSb7f86+uUUhYbPa588Y//kvyyDzzxWeFWsWOUO4=;
 b=PjgyVTP2ULEXSKG0GFwwtn85UVPL4FlTHKR5dW91QycdL414ycvgFscoC8cBN4nM50
 mFCD/BCUgtcfQz/S4w0nKwtgpzaUKDgIcoQUqd675gDbqKTjh3OdzREtbLLuNQF2N3Vi
 4/NfgjOs9Y3scSZB9zu3O5vY4IrqrjXz3T34SBmfqwUkURs/YUE5iaJ1YmGKCn59AXzP
 zu89iqieY8nCYdjqsQnPd0M2cM/M2/KGSHjrK+ZMTornRd6JrI0SIU2BJ4v0CmZOU0kO
 nyHr658aFUyFoR0V8coweW9AkRsFCCTHEnxLqCpVmkD1yOi6qQpZCLGgZp3Pjupnq8iC
 Yq/g==
X-Gm-Message-State: AOAM5306NA0eTOBRCwfUZ5qt32db5mBfLr+tw8BUyivXGFdaOFH8sU9S
 1AJNE+Ebs4O7PNyzDB1TJ9W9/c3lla4=
X-Google-Smtp-Source: ABdhPJzW2DoYucVT/6/96HWL0k2GWoftLJH84hqH5SsBQzjZJ+rTFyj+90fw7lG+/GDCAFfoa5vDVA==
X-Received: by 2002:a05:6402:278a:b0:419:82d5:f1c7 with SMTP id
 b10-20020a056402278a00b0041982d5f1c7mr3830147ede.163.1648551767560; 
 Tue, 29 Mar 2022 04:02:47 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm6958402ejj.38.2022.03.29.04.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:02:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com,
	dri-devel@lists.freedesktop.org
Subject: Allow ttm_buffer_object without resource
Date: Tue, 29 Mar 2022 13:02:32 +0200
Message-Id: <20220329110243.6335-1-christian.koenig@amd.com>
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

Hi guys,

this patch set cleans up the handling of TTM buffer objects quite a bit
by allowing to create them without allocating a ttm_resource as well.

That's not only cleaner in general, but also a necessary prerequisite for
quite a number of related work.

Please review and comment,
Christian.


