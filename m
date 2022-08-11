Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAF258F6FF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 06:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC1511AE7C;
	Thu, 11 Aug 2022 04:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224B710F6FA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 04:36:15 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id gk3so31415211ejb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 21:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=fE16zv7UE/2pEbS4CBlyKnzHpSUUF7n8QvEbJDieupA=;
 b=aNt850i/VeEmP/HosrnbUXkXX4RhytGSqwP2MSlqHmPdbmhdMbFGc2rgvuNA8FJX5W
 PjgN/Jk0tm6fQyKS9eiUC0QMPhf+6GSXJ/RIku0CNHvjxbyFDqQ0nQpf5I19a4YwIkO0
 vaAJgvWBE/wJyX8920xzMuVMIhaaxu+NaExwPJAdDK8TN43ZpMtQopb10o/WyQ1yiU1n
 Yl4tgwDNyS50xFOkj5gCDGAhtU7RUVblmb9w0+78SRzymkW2GsHeeuCcnyUFR3uLBLIL
 O0EqwE9eo31kxrZDNKegXSUZGcTlV24tZOhru+v1zM/MryEZMDH3YLk+3LBM1DXKZeya
 KE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=fE16zv7UE/2pEbS4CBlyKnzHpSUUF7n8QvEbJDieupA=;
 b=0j67hTQYDdSldGBva4ne0Qxbw9AcXZQEyxRAkUCWyEw8Zqi/ECaFJL9qDpCn0P2o+z
 KDtAJ7YVh77hjbDa1f342zB/lEskXadfkWbevYWL9A3Zer+wc03FZzSnbgH4MnC+cqQL
 PlHveiK28+gm8IAB8dLEuGdhyVH4EIRKck4u56P2glvdq2Voviu4Y1Fof3AHrFyl6i9L
 /Vr/XM1x/4CXjg5qNSi+wMo91y2HX1uMfY8wqC4T9Z1r+W5G12cpGDrOuVNUeFbJj5dQ
 etXoHdNwH3T1fh49ibRwbLOIn7VFEhyYykHEuBwAqtgQzDy5M0V1si43juvrTgnicfTm
 PgSw==
X-Gm-Message-State: ACgBeo3Tj3k9hXLqN8gQQbPhZC8qEZq71kdW/2c2O4RLsK5PQQ6uk7cZ
 gUnO7mc8CCZpiH/FVOTcTwCG7JG+1fGSHwLGb6yiHGcfbnQ=
X-Google-Smtp-Source: AA6agR4bj58A3lrH93BF9Z7grdgYUgIH6/7avYCFXEQGipTxTPvh3R4CtKiIr1Eyi6/vb9gRrikKRp4KB/iINMyI1Go=
X-Received: by 2002:a17:907:6d8c:b0:731:6c60:eced with SMTP id
 sb12-20020a1709076d8c00b007316c60ecedmr11093789ejc.266.1660192573436; Wed, 10
 Aug 2022 21:36:13 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 11 Aug 2022 14:36:02 +1000
Message-ID: <CAPM=9tytj7mb8sKmydcsy53uXVLS3FRRU7WkMBUosFeeo2bzfA@mail.gmail.com>
Subject: Daniel's locking rules articles
To: dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

In case anyone here hasn't read them yet, and is doing anything with
locking or ignoring locking,

please read:

https://blog.ffwll.ch/2022/07/locking-engineering.html
https://blog.ffwll.ch/2022/08/locking-hierarchy.html

For anyone doing review or submitting new features from inside
companies, please ensure you familiarise yourself with these articles,
and distribute them around internal teams.

Going forward the drm should be adhering to these rules.

Thanks,
Dave.
