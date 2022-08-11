Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A5E58F75D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 07:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBFEA1F42;
	Thu, 11 Aug 2022 05:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406ADA1ED5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 05:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660196874; x=1691732874;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BCa/831KTwzVLYxqVh1kNYE56d6AfUbv9GUiF6NREhk=;
 b=LHDkmP+K+Bp0TfYlHu7VkTqtBwu+g4V1tIhdF+4uffRS3ChmIyUMhUiL
 1QvdH1tPoGGDH/kLljoI3ncVCtu0LEBvRDv3iGM7JoYzKaO/+yyG9lM1j
 iL4KP8oKgIlCuhkocX/zIJf/YR2JTKkFcKOmzeWqXgB5H3ZXFB9FDDAur
 DYN4mFb3ZaF2X7g2nkfjG0a/lYecBWmAiU7iYT5l48U/ZxlLfD1kQlE8s
 6Q6Edym5KWlz3SM4pftAaRxqcMfqdaKIwqeVr36hz+w8jIAQdUU4KN5Ul
 5IjoLzrIhzxZ3aLCvkXDlHVDjGFAUGsZ3TnEjwJ/U+8TYwflG8OIO+R6g g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="377555974"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="377555974"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 22:47:53 -0700
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="747690432"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 22:47:51 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] Fix HFVSDB parsing
Date: Thu, 11 Aug 2022 11:17:14 +0530
Message-Id: <20220811054718.2115917-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: uma.shankar@intel.com, swati2.sharma@intel.com, maarten.lankhorst@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix issues in HFVSDB parsing for DSC support.
Also minor refactoring in Logging.

Split from original patch into a new series.
https://patchwork.freedesktop.org/patch/495193/

Ankit Nautiyal (4):
  drm/edid: Fix minimum bpc supported with DSC1.2 for HDMI sink
  drm/edid: Split DSC parsing into separate function
  drm/edid: Refactor HFVSDB parsing for DSC1.2
  drm/edid: Avoid multiple log lines for HFVSDB parsing

 drivers/gpu/drm/drm_edid.c | 153 +++++++++++++++++++++----------------
 1 file changed, 87 insertions(+), 66 deletions(-)

-- 
2.25.1

