Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9EFB06E90
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4B610E67E;
	Wed, 16 Jul 2025 07:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="XjQFBnOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-250.mail.qq.com (out203-205-221-250.mail.qq.com
 [203.205.221.250])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EEB10E00D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 03:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1752635834; bh=YUlCVgMJNmDjwrdJ6bJdu2yxm+8ftSfwyAUkzwsQpUY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XjQFBnORzoJD8vyzBX/vRQncjkKOBinIKDn+F1hAXCDzd5IM1yUwFD1J3VDjx2Ce2
 y4bvwFBtm0Z2YdOFEFEeaq6metaz4BrCkNhR/J2c6DrUX7hXhLrumev1FVkUBQiFK3
 1ZECPOirZ0kssTdX3jPRKEfCjCZt0E5vHBMYmvMs=
Received: from VM-222-126-tencentos.localdomain ([14.116.239.33])
 by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
 id 2C00BE3E; Wed, 16 Jul 2025 11:11:00 +0800
X-QQ-mid: xmsmtpt1752635460t8c7enoyi
Message-ID: <tencent_725B64FFA3A4BBF7C3E67C14D2B43A5C9107@qq.com>
X-QQ-XMAILINFO: OCPaXsGDlF8+lftE9NFAJ7mWAyp1NovPO6/docXm32AEKrxvRHuVA8D+uTio6w
 Ro0wipK2wFoolbqrwMUvc6BRSxd3kEMJlhHmBczdiEBpn+q943midwtLpSW/yhp5CMFeiTElEb+Y
 Mh5QItELk3hCBgHpfNSCNb7qpKa8fHm03PMTN2QIY+L2oKelLZQcnh1lYqhvUhpnZGqlOcj+9eom
 o6iNjmxRObYGc1a2lZ4bcYTPTYwrb1mxeuQz5cBDYRacAlhw2RszvucKcWr0KVOdTTtGCJBvruA0
 T2ALRQHnhNPXVLJWeL954pjLD1e+8DIYPpITje0VTZI4fRfpT/4nRLTXBfRKSoFdEPT4XnZTnHDM
 b1omVRq0suasKAfkyBJq9GU4Qv9wlj/A/04P/rSbVQvgGhrB9SjZNKhIaIAzq0PhsmzaHx7E62eN
 QTmYUPGDf0aVCILKpQg8guPSo/yabGiht9hk/385m8LbUkvszvfexfHnQSCHsjRSMR7tocBLwic1
 ruqxGC58qIFvJzzh4iTOaPMvtfdPtpcC0MwUyUYyWMe/ifg4iw6i03pIyFkqorohOovcryMBb4vm
 Kv2IPguFOD3RHsXe80Yl4Mk9+8AYCHwpeOf13JSM14gefScDKroGrejMsaIjxpjaRi04IUbw2Apd
 hssmqTANc9dSkS/r7loo3CLMTfNBJbWMIZKNyuKmXfHkzZNEKBXawU+Ovn4QNpa47bWT/B6DncD8
 X64mz6HWbP1xW4nVFHSnXUGV1jjbGEUeORVgOgFBWZrURlQZV6lDsXsYGJdXf5rOAinB1R0hPQ9G
 VMuQ7Of1PqR+rOGr4az3wMgVJQPPBjrPvDlrOEwidIJiF1X7W18tG3UzU7YBOxRUMdTlU/BGhP1n
 SiAgsA4ruBlC5QCDZEuWVp2kPGRLUv2dvl4yMTBANMycXIXR/EkTkqknnTTPRUNSvNKW3efZwlpT
 dyxiUgG+UFOMOEqaQPoaCbZsvA+6c/DjW9cOgJQYQ98xdVB5LKwxX+ntGGUGWtM2Jyq+pnLyUlah
 hPlWwfrQNKiEgl5HJsqPiKbYN6AZAoUzi9PadaTQCDTT6JDcGa
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: jackysliu <1972843537@qq.com>
To: krzk@kernel.org
Cc: 1972843537@qq.com, Austin.Zheng@amd.com, Dillon.Varone@amd.com,
 Security@tencent.com, Sung.Lee@amd.com, Wayne.Lin@amd.com,
 airlied@gmail.com, alexander.deucher@amd.com, alvin.lee2@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, joshua.aberback@amd.com,
 linux-kernel@vger.kernel.org, linux@treblig.org, mario.limonciello@amd.com,
 ryanseto@amd.com, simona@ffwll.ch, siqueira@igalia.com, sunpeng.li@amd.com
Subject: Re: [PATCH] scsi:bfa: Double-free vulnerability fix 
Date: Wed, 16 Jul 2025 11:10:54 +0800
X-OQ-MSGID: <20250716031054.3964061-1-1972843537@qq.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <12c6632b-65b7-43da-a954-7107ac8cb1b1@kernel.org>
References: <12c6632b-65b7-43da-a954-7107ac8cb1b1@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Jul 2025 07:13:52 +0000
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

On Tue, Jul 15 2025 12:45:00 +0200 Krzysztof Kozlowski wrote:
>You should disclose that you used some AI tool for that... and that
>other report(s) was really fake finding.  People should know you
>generated it with AI, so they could make informed decision whether to
>even allocate time here.

Although this problem was detected with the help of ai and static methods,
I checked the trigger path by myself and verified this problem. 
I'll describe the ways of detection if I find other issues in the future.
Anyway, thanks for your review.

Siyang Liu

