Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 202E32D2B00
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370856E92D;
	Tue,  8 Dec 2020 12:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DE46E92D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 12:32:00 +0000 (UTC)
Date: Tue, 08 Dec 2020 12:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607430718;
 bh=oJQ7AkcvejPyT3zDUcoaix42td4vmiI2k7VcdXORKD0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=WfbuRtWpCBn7zqbn5J1VdOTDM9SalH7daVSVOxRuekt+AqW9NxL4WDZ/9CHgNXt1e
 Ftmqsq6SPq9UToM5nnFEz/KC9mBUkViTAO2VxLFjXOkVrsuwu+TaQ+72pooHfMNesc
 GDkmJ/7PrOQvVEexJbKFjmE1mCQUGcaww350QzfRLiV7lWTprCJhe04pX3W17esC93
 zX/5sqiv0oXggylmS6P07YhzLPkOSN+PfltiuWVZbNp9Wki9eV8U9HmIV1KsFeyWat
 EMG+IfyLGFcu44QU9qtS3S9/igsdRPBlCIlLQZcFxFE6Vw7hR1fBFmWdLbGeq+9KEk
 v4GrnDSVLQ54A==
To: James Park <jpark37@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Message-ID: <8GcCcwMpk0Rz_34xReIOuuL2JZBQ2P71fYo4-G8ZMcxdqu2GE7NVnsxUHIxbo7xOylM_lIO2sA6yIgI9W3MoSvErpLWFTRFJR1Om6dtN9wE=@emersion.fr>
In-Reply-To: <1607364939-640-2-git-send-email-jpark37@lagfreegames.com>
References: <202012080129.qAoCOovN-lkp@intel.com>
 <1607364939-640-1-git-send-email-jpark37@lagfreegames.com>
 <1607364939-640-2-git-send-email-jpark37@lagfreegames.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

May I ask what exactly fails when you drop #include <linux/types.h>
from drm.h?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
