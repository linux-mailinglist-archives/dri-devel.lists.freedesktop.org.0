Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB562D5567
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C01A6EA56;
	Thu, 10 Dec 2020 08:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 418F76EA10
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 11:52:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36DE231B;
 Wed,  9 Dec 2020 03:52:00 -0800 (PST)
Received: from e123648.arm.com (unknown [10.57.24.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2918A3F718;
 Wed,  9 Dec 2020 03:51:57 -0800 (PST)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Add DT bindings with dynamic-power-coefficient for Mali
 GPUs 
Date: Wed,  9 Dec 2020 11:51:41 +0000
Message-Id: <20201209115143.15321-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:40 +0000
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
Cc: airlied@linux.ie, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

The patch set aims to add a new property dynamic-power-coefficient to Mali GPU
DT bindings. This property is known from CPUs and they are both aligned. It
is used for Energy Model registration.

Regards,
Lukasz Luba

Lukasz Luba (2):
  dt-bindings: mali-midgard: Add dynamic-power-coefficient
  dt-bindings: mali-bifrost: Add dynamic-power-coefficient

 .../bindings/gpu/arm,mali-bifrost.yaml          | 17 +++++++++++++++++
 .../bindings/gpu/arm,mali-midgard.yaml          | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
