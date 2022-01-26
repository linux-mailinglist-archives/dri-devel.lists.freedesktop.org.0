Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B7F49CD45
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6D410E5AA;
	Wed, 26 Jan 2022 15:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E0D10E7B7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 15:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643209476;
 bh=B07kNwWF0kIcIyZ6tg5D4YW7GZgIj5AXzrRfXPucNcQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=X9LzyGpuPoVp0t3hSJ0Xl3UziLKB5dzY/1HEMNxBwlHlejt6arRHY7iTcChVppqAD
 FWTsXKqg2hjWgy+0WeWrUt2Hpi9fTB0DWSWaQpgKqNaac5vAZd4tp89tyxSaPgyelH
 lWIYZA3DzF3BtHpN4MERD1/nP9RtZ+QVpbibqQf8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.153.46] ([217.61.153.46]) by web-mail.gmx.net
 (3c-app-gmx-bap59.server.lan [172.19.172.129]) (via HTTP); Wed, 26 Jan 2022
 16:04:36 +0100
MIME-Version: 1.0
Message-ID: <trinity-e0e26df4-dbdf-4a86-be55-c8cd09fdf261-1643209476020@3c-app-gmx-bap59>
From: Frank Wunderlich <frank-w@public-files.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Aw: [PATCH 01/27] drm/encoder: Add of_graph port to struct drm_encoder
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Jan 2022 16:04:36 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220126145549.617165-2-s.hauer@pengutronix.de>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-2-s.hauer@pengutronix.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:pJ03qsXxg/ND1T+WW4B6btBelzADVbwFkhV+6XlPJvuHKUwiCMdVEjHacAPO9CVvKiFuR
 XmrycinZn5gLrGbk01j4TWzVMn5BxyBqC9sfyx9WnUh7x0Fpm4WKDZcAdvbl7pksfh9kCWfsjGIb
 zwIRbiI3Teu7M3y5aodPKQKOCzo6qdeFOifGWMFAtfXZ1k4Mgvqczp4rvmqILwBvJXdoW34FW4vj
 Ut+Hq0oz+i5AJBt6/STHOUHi4stB/h3EQX1CJARkiltDFuvreCs26XTARgE870wbjj6UcrmcGa08
 IE=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gKQyj+bEKQQ=:sL27Q/7/Nt3+yHZ2wJWaV5
 HVRVHCiFpBCVj81X8LJNWCvuRlTkdtPURkjPX5CRrB5pWhbcFiwTXeGO7jqvbfwIuWYYWBkKV
 TWuPDVvz4dkc0W/N87Bg0rHFGgL0mAFQR4Tyd6UG9YFJRGGaq+6T0UpfZpCCXq7RtkPjuvpT0
 QdyPlKKzTZbc4WkyF9KIOQphh7V6kf8khkt2MxVBzyi+O4n5MsZTuh8ZCPbjKlQNm4eqhWl6J
 aNNKbU3/7+WX88wJrk2tdtqSc+CXmUSO4Ot3ZGjAvU4mQL3PUbp1V7PgGVbOYOx427jQMZoaz
 UtXbzhSuKw5Kh/Y+eEKFpe+3WqIcgLmjGcl2pjLkxIFNjK+plDLl8HaE/HFALpcuSn1xZRs6t
 gh9jkliWQcChFiDiaSe94nJKtoVgUvLzp5KKletIGQS/Pu7C8p81WraZufOfkBqcAqEIuVoHo
 Sj4ffxLEUUmNxrcb97fHC/PyKKXiUJ1izRR9e+KmUM2jjGlUvFOMRLybYr3QMqAf35slcRMHF
 Oss+/51Jo3NXL/BVEB8y69uT+AxcOQqtarCpqo6Jazg4Q1D0LNiUpsLQeAGYConHSfE5bZswE
 2lBbcrhv9NJhoWFwKV+I3etPrXkLP1FqJKVprh1VTO2Bj6/nzNrhOVzIl2tkx/o5uuttA8byt
 9vM39un04SnCWatrWdURroHSDgKeFCMGTmFISuObYrCSf+vfDR+38sylYxRBxfLsxKLgJh+6/
 X6mcaf7DTFBQyi3+GSg1QCNzW8XXobgQbOBT1d0SfBbX3cuqncDhWhBbS4Hd38zxj5ZsRmO02
 3ZLCJCybMkL8VNr+4uNVdxsyr11aQ==
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
Cc: kernel@pengutronix.de, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

> Gesendet: Mittwoch, 26. Januar 2022 um 15:55 Uhr
> Von: "Sascha Hauer" <s.hauer@pengutronix.de>
> Betreff: [PATCH 01/27] drm/encoder: Add of_graph port to struct drm_encoder

Please use "git format-patch -vX ..." when creating your patches to make sure the version is set in every patch and not only the coverletter. That makes it easier to find Patch from specific version and shows version also in Patchwork where the coverletter is hidden

regards Frank
