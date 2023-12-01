Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3229F8005D5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961E910E814;
	Fri,  1 Dec 2023 08:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6CB10E817
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:37:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F006BB83BC2;
 Fri,  1 Dec 2023 08:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CE3C433C9;
 Fri,  1 Dec 2023 08:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701419871;
 bh=GtOb7UvLlhlShiykwkEEt3ZUh/apOEUuovQcZ9swJoU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WjUmokJhjx0vCMz+ZoiwLJ2b/MVhE9yvFT0hzWcwSKE3W2N8lIc6aZnjk/FyQvuQ3
 +yYX8QXxUWewlVhx25vqR1ma5pN6HxcnE1t5dZIROIpn1OSs8wjo0Pmne8YD9Kvwtw
 HF8v4kroDo09sbEawEl/0kqVmP8Oqupl2cF7ISzvInp5m+bvBitKHF6Kip6nWbSm11
 H8/wzzwGVRhCpeiowRqaIcROHsiZinCoaaejMb6pD1RBpvL+nTpjc11XYCSYvzT6mH
 MAA2gXHBlI0nZWI3un5JcqEOcvkavoMtk2PDe1P5avsNFeX2G/P8oB60IJsTqteADf
 rVP9i4v5Z20HA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Donald Robson <donald.robson@imgtec.com>
In-Reply-To: <20231130160017.259902-3-donald.robson@imgtec.com>
References: <20231130160017.259902-1-donald.robson@imgtec.com>
 <20231130160017.259902-3-donald.robson@imgtec.com>
Subject: Re: (subset) [PATCH v2 3/5] drm/imagination:
 pvr_device_process_active_queues now static
Message-Id: <170141986885.3198881.10423861649737982177.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 09:37:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Arnd Bergmann <arnd@arndb.de>, matt.coster@imgtec.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Nov 2023 16:00:15 +0000, Donald Robson wrote:
> The function below is used only within this source file, but is not static.
> 
> >> drivers/gpu/drm/imagination/pvr_device.c:129:6: warning: no previous prototype for function 'pvr_device_process_active_queues' [-Wmissing-prototypes]
>      129 | void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
>          |      ^
>    drivers/gpu/drm/imagination/pvr_device.c:129:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>      129 | void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
>          | ^
>          | static
>    1 warning generated.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

