Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E608B1686E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 23:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A455D10E6EA;
	Wed, 30 Jul 2025 21:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 90124 seconds by postgrey-1.36 at gabe;
 Wed, 30 Jul 2025 07:10:56 UTC
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C630610E147
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 07:10:56 +0000 (UTC)
Received: from jtjnmail201603.home.langchao.com
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202507301510512893;
 Wed, 30 Jul 2025 15:10:51 +0800
Received: from localhost.localdomain.com (10.94.10.113) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2507.57; Wed, 30 Jul 2025 15:10:49 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: <lkp@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] gpu: drm: fix compilation errors in drm_vram_helper
Date: Wed, 30 Jul 2025 15:09:17 +0800
Message-ID: <20250730071002.2697-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <202507300646.kTchyjvh-lkp@intel.com>
References: <202507300646.kTchyjvh-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.10.113]
tUid: 2025730151051cdb962acdcf8dce77254f561bd1f48ac
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Wed, 30 Jul 2025 21:46:19 +0000
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

I see. This compilation error was caused by the configuration option not automatically selecting DRM_TTM_HELPER. A revised version of the PR has been submitted.

