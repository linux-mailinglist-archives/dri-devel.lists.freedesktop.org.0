Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E562E39B345
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 08:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90806E9E6;
	Fri,  4 Jun 2021 06:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD2E6E06D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 06:51:44 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i9so12441246lfe.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 23:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=24CVs5oDamNPy3bV29Y3QlcumOQhGrS+ACk0Gh27YNo=;
 b=nc0xP4j3Dlq8gGggNc+jgwBixp6BjdHZ8MIMoCQlYiSpWmvBVQTlSPUwNodnD7dgVH
 2g7owIfC9bx7F3GfPVpMsPm0t1w1B4HPRvsnDdqBpE9qKmLGwdabtS49Uo21qa/9r0pw
 e5DpViCT3PSHYFF91BrIRbhq16/Xfqss00z/HycJWVmA3n94HTcnDb0BfFU8jxyKsV0X
 8eIf/kRbPqneruTrJc+kQ2EXN1CoJCSXSGdsmWfnVm5ai7KifGfQIu5Wmi5Y/WBtAYzR
 Zi5ZyhoimMpci/nE9/MpbYoSFO2o+hmltUno9IFcrShYOPFUUKYQoC1zIruo7Ty9C0H1
 7+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=24CVs5oDamNPy3bV29Y3QlcumOQhGrS+ACk0Gh27YNo=;
 b=L1PK4ioYQNxnrhORbd7u0qdaJCsjxvWh9DOMqhCm+Qo9ssYH302zmGQPgzV8nFijZU
 AjvuoipbTnWx4tCjU5e5wjFvRDkKZXK96oUQZSLsrH+YvB09Lhxj7Czpke0o1NIdmO4i
 tyfrJ/v3PYtlNrlBZt2oSX1M+1t38hwNCU0PyR8qml5BhGio4uFIRwaDZf4tqqCqF5Ts
 B0j8zzF9jlbyoz9Owj3s7vkRrs6qn6Utzlv6VDqEebWr9MfErvPR/fevJ5n51TiXmFm4
 qzCdp3mBxn+8cL56F3kegX1ONHrMemp5m81GkOpvX5RfsRRD013bUQ2iC6wRszG9IKyY
 OqfQ==
X-Gm-Message-State: AOAM530427e9CzPO/vbIYnuKBKrkt2mOjGIseHo5FdWOn3YWNUUWl+jk
 uKM4Uj2F9S/ZJZ1Ctkr3s4Om/jcxT/DLD3n810F4Jw==
X-Google-Smtp-Source: ABdhPJxSdQFIuKT8D1wpLo2d461wMyBT/bMjklVvG9XuWDPbzfDBofQzlwHPcaR/FN7AUR6XHi5Qmup7N1fGI4Bo8cc=
X-Received: by 2002:a19:f616:: with SMTP id x22mr1739496lfe.291.1622789503165; 
 Thu, 03 Jun 2021 23:51:43 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jun 2021 08:51:32 +0200
Message-ID: <CACRpkdZOmE_BmA-QLRZiCGQ_C=kdhVOPbhy_YXr6vbHEZJxxTQ@mail.gmail.com>
Subject: LIMA kernel bug - help!
To: Qiang Yu <yuq825@gmail.com>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 lima@lists.freedesktop.org
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
Cc: Stephan Gerhold <stephan@gerhold.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qiang,

I am using Lima on the ST-Ericsson U8500 SoC. It is one
of the very earliest versions of MALI 400 MP. It mostly works
on the mobile phones I have using PostmarkeOS and
the Phosh UI (Wayland with MESA), but now I have an issue with
one single specimen.

I have this bug in my dmesg and after this the graphics
start to act weird:

[   48.662336] lima a0300000.gpu: mmu page fault at 0x2020400 from bus
id 0 of type read on ppmmu0
[   48.662464] lima a0300000.gpu: fail to save task state from phoc
pid 1581: error task list is full
[   48.662481] lima a0300000.gpu: pp task error 0 int_state=0 status=1
[   48.662494] lima a0300000.gpu: mmu resume

In interrupts:

 75:          5          0     GIC-0 147 Level     gp
 76:          0          0     GIC-0 146 Level     gpmmu
 77:          3          0     GIC-0 145 Level     pp0
 78:          1          0     GIC-0 144 Level     ppmmu0

My UI definitely want to render some more stuff so it gets
stuck here.

Any hints on how to troubleshoot this?

Yours,
Linus Walleij
