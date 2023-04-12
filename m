Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8BD6E08F6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B46810EA6B;
	Thu, 13 Apr 2023 08:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D86C10E76A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 10:10:01 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6B4D9C2850
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 09:55:31 +0000 (UTC)
Received: (Authenticated sender: cyril@debamax.com)
 by mail.gandi.net (Postfix) with ESMTPA id BD0FD1C000D;
 Wed, 12 Apr 2023 09:55:23 +0000 (UTC)
From: Cyril Brulebois <cyril@debamax.com>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Updating hardcoded "of-display" devices
Date: Wed, 12 Apr 2023 11:55:07 +0200
Message-Id: <20230412095509.2196162-1-cyril@debamax.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Apr 2023 08:33:23 +0000
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
Cc: Michal Suchanek <msuchanek@suse.de>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

We've spotted a regression with the Debian Installer on ppc64el, and
I've confirmed that the first patch fixes fbdev/offb as expected (or at
least works around the regression, see last part of the commit message):
 - [PATCH 1/2] fbdev/offb: Update expected device name

Since I've spotted that drm/ofdrm is affected as well, I'm submitting a
similar patch for it, but I can't really test it. I suppose Thomas who
introduced this new driver during the v6.2 release cycle will be able
to take it from there if needed:
 - [PATCH 2/2] drm/ofdrm: Update expected device name


Cheers,
-- 
Cyril Brulebois -- Debian Consultant @ DEBAMAX -- https://debamax.com/

