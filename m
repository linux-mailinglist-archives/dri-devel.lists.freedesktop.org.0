Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF1D1CE162
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 19:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DD889DD5;
	Mon, 11 May 2020 17:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE10489DD5;
 Mon, 11 May 2020 17:17:26 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e16so11973579wra.7;
 Mon, 11 May 2020 10:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xleAvHyIdERIHs0V7p6NTnOWDbFvP5htSmxpmd/zQGg=;
 b=qXESWEdC2zYZPOh28XpoLtksYhLg9YBUwbg9awlun35eZOVgpb+WtBj6L5V4hZwyxI
 ja912MFH3aAqx47dkgCxGHTGOO2d4nSDXfS0UAgwMZHU0kiL9elawYxBXkVlVciPYol7
 PfjyzlRYuVpdAjHKI6ea/pktf2XxD6NtNp/OWFzYjJhmNmUT5QGBZNpiLj8653NdeyQ/
 LOyj6nfW8yrXd0cwUWnzqzTIkw/yezmL8WxD953DaVFx7Ebyvu2C/LRnmNcKceODvhXF
 QrhtQea2EzTw95Du7bliRtAXMe3V/9og9I06kmsODLREyrZvsyIgqgW2icqvj4TtXfEa
 7nOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xleAvHyIdERIHs0V7p6NTnOWDbFvP5htSmxpmd/zQGg=;
 b=pzICBxYuQgXpeJXs7NWMEGhL6T7LoLYPksY54KlVxSFouCzC21DSPB4KWGeLd5OHge
 M65VmKnqtCBJ/Jrdf8CPKsOfEXrawzX50zVW/9qqRzHv2BjxojUfrZMGxVymdGkyrSOT
 yZIj4ctrAEr3tkT7gOnNaVg6gZZkMyDxenV7RFVeYu0tbblMAS9LumCIrf8vrDSQY/mF
 KwCGxzGOzZMFcn9Xxr6A3ThG24AhvjNHL5b2F2HU5bWuQq3CdyZW3OTI1FHx0tU98Xc1
 hcdx5fuWuQlxiSENzm1IYr+ze5QqdRJi4p3HO5HIDY0t/XuUlwYZJa8HNjpay3UHfhfn
 U7vQ==
X-Gm-Message-State: AGi0PuYoQYTuda0YHpPlBkJK2svbgyVPLZF+N4y9qXTqZNSiYgJcBZbX
 2trfidQpC3h0fNfDQ1XWKGsaQARe
X-Google-Smtp-Source: APiQypLftZHLilYucv+0PvNsw7u2BMtzEIyLEYtmK2zmY4jcOHNMz96XAdSqeNrDU+eOouNp+IMhbQ==
X-Received: by 2002:adf:a4c5:: with SMTP id h5mr19767720wrb.408.1589217445306; 
 Mon, 11 May 2020 10:17:25 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d8ef:6c45:1f3c:c5dd])
 by smtp.gmail.com with ESMTPSA id x1sm9843232wrt.86.2020.05.11.10.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 10:17:24 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [RFC] Remove AGP support from Radeon/Nouveau/TTM
Date: Mon, 11 May 2020 19:17:19 +0200
Message-Id: <20200511171722.96576-1-christian.koenig@amd.com>
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

Well let's face it AGP is a total headache to maintain and dead for at least 10+ years.

We have a lot of x86 specific stuff in the architecture independent graphics memory management to get the caching right, abusing the DMA API on multiple occasions, need to distinct between AGP and driver specific page tables etc etc...

So the idea here is to just go ahead and remove the support from Radeon and Nouveau and then drop the necessary code from TTM.

For Radeon this means that we just switch over to the driver specific page tables and everything should more or less continue to work.

For Nouveau I'm not 100% sure, but from the code it of hand looks like we can do it similar to Radeon.

Please comment what you think about this.

Regards,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
