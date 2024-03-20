Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973E1881426
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 16:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6D110FC06;
	Wed, 20 Mar 2024 15:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V7lSfTKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F5310FC06
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 15:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710947258;
 bh=JFP1Ik0zxIxrP0Ug6cI/dpPJCg/LuSkU77gWX/lG28I=;
 h=Date:From:To:Cc:Subject:From;
 b=V7lSfTKxlQGObOLFlSowvLfVGgNcoLfVjxp+rSE1irgPtV+1CM563onPocI35eCEt
 wY7LEUy6Zao2M8bJXaVRpGdz997mf5MKXlXn+NRg8HfHASVez4/xz3wjjfXAep8Vm9
 tlL38IHmmXQGTAvtEj4mVta2HqDUXNNlHNZeiaUMitMoYOD12JjcGUQ718DNsuvoqA
 VUct8XHTaZYs13k9XoQ0wPsbSa93geQDlVJXaPcsqpZblHdiHQy0KUffvmFCTRjsKI
 ZdIT7FsUVSvSd+39PYg7pxcDINmJZN3fwLeLAyUGzJD/TE3ObkTl87U8SpJknjQCd2
 awBvWWoCMLqXQ==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E44A43781426;
 Wed, 20 Mar 2024 15:07:36 +0000 (UTC)
Date: Wed, 20 Mar 2024 11:07:34 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Missing commits from drm-misc-next on linux-next
Message-ID: <39ad88fa-449a-4aa9-ac6a-902d8d531984@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hi,

I noticed that there are some commits from drm-misc-next [1] that haven't been
added to the for-linux-next [2] branch, and consequently haven't made their way
into linux-next.

Namely, commit bf0390e2c95b ("drm/panel: add samsung s6e3fa7 panel driver") and
commit 2689b33b8864 ("dt-bindings: display: panel-simple-dsi: add s6e3fa7
ams559nk06 compat") which have been applied almost a month ago [3].

I noticed because running 'make dtbs_check' on today's next is showing new
warnings, but with these commits applied there shouldn't be any warning.

Could you please take a look? I'm guessing a merge was forgotten somewhere along
the line on the for-linux-next branch.

Thanks,
Nícolas

[1] https://cgit.freedesktop.org/drm/drm-misc/log/?h=drm-misc-next
[2] https://cgit.freedesktop.org/drm/drm-misc/log/?h=for-linux-next
[3] https://lore.kernel.org/all/170919678300.2018319.4183838499915522690.b4-ty@linaro.org/
