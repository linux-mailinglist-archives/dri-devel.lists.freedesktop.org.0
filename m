Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B9697DB9F
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 06:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E49310E0C3;
	Sat, 21 Sep 2024 04:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="fSf0X8X2";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="ChNRDK1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 348 seconds by postgrey-1.36 at gabe;
 Sat, 21 Sep 2024 04:21:15 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E9310E0C3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 04:21:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1726892114; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=L5OkX2N6euiQIozBIqQNKIk0IkfyZs8Vf68GmPjLOJjZDSHU6EiY3PQM0gf5Gdmw3j
 JTHei9t0WBJPDZ4Dki3Z4T6/1jVNfLOyC83Q2ueHhu3BiKjmVHhCU/m5N1VPxGIUlRn8
 GiIr/E/FKLxOtffRTX0aFUdb1WhVXdi2ZfhLW2gEKXY/C7/6UWsx6ONuzs0enB+UhYJ9
 BNAInigmRXbe3DjQmeyFcb3w3bjYM/xzuFJxnt/AfzlT+gS+NABi38xUYLGDeHaIG07l
 NgqZC0AOS68kj7utQB8EbnWf+oJQ1BpxFK/THjFYVgMcudj4CgcBr8gVtxYNXUs7lg91
 iz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1726892114;
 s=strato-dkim-0002; d=strato.com;
 h=Cc:Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
 bh=eMXwgprNTOb4nFvnrDgP2sx7DKpk904fYKvlq/1z4ao=;
 b=skMfjJx23pcsPSFOm8oaBy6gN+HBRaeZjMOUg8TTHmSQbgryyuKYZOVmZbggpSg599
 UiHg01fGnarRaD1WhJbPg0SiZ5Zp482rMlN3xaEK82/jcjP0fNjqnMtEyTjTVPTjyjcD
 KSaHuleZSfUXS0fxvDXTBBeHnv/zf/tlTXrB3JSMFq31FNtYXtnlLN9s2/5yXXElQoVy
 2dZXFsxo4DOzwAMgk9/jpWGU6AfhZLjF1prHngkWY0HyxpjHaNOSyrNIj/TbaZCNIHD1
 4EhHSj2CNonMnL6kDOh+kxJuDlXWQIyPjvCG6+o05Os2mdZyYGHFVYsnNdawxPm6dapo
 d7Jw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1726892114;
 s=strato-dkim-0002; d=xenosoft.de;
 h=Cc:Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
 bh=eMXwgprNTOb4nFvnrDgP2sx7DKpk904fYKvlq/1z4ao=;
 b=fSf0X8X2RdBmDV0/By9gtQ/vSIuKfiUmt0O0Ztp9XFsOZb7XARXsW0Qn+vCJJSVk91
 iePh7wfIyYAm3EPqWzTBYb1ufJ26ncLtvzZIun1xeWc6K01HXLIitXa7juI3evuWFwdP
 T3Pt3nsdH0eWqElJP2udvbJOqalFCVVWG5k+AIa20fcWHBV3fJ/jpMLbQHRoVhFtwZlv
 OxGabR4jYy5TuRDsxm+Q+ZD2UdCdAuSRiTXg/B3zadgPb4n/pwunf0lgHVN0pjWVl3Vr
 J9x0u0YqbFjeOtH0kFhoWjWJIWfVIdjKf1HDPiWq9uP2mrY5z0tLCQ7+SlqPDvZsoXHR
 8DlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1726892114;
 s=strato-dkim-0003; d=xenosoft.de;
 h=Cc:Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
 bh=eMXwgprNTOb4nFvnrDgP2sx7DKpk904fYKvlq/1z4ao=;
 b=ChNRDK1F1m+wxxr6UNMSfI0JdFxNgNVrRNnd1joOpEbWD6pWoiGIL7gGyzAID/JDZ6
 ei/BF+tQ7bseyx4OQnDw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr44+gKidpmhkOpz46lpM="
Received: from [192.168.178.134] by smtp.strato.de (RZmta 51.2.8 DYNA|AUTH)
 with ESMTPSA id e0da1a08L4FD1Qu
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 21 Sep 2024 06:15:13 +0200 (CEST)
Message-ID: <f163bcec-e5b1-4aef-91dd-431736fd6d11@xenosoft.de>
Date: Sat, 21 Sep 2024 06:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
Cc: mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi All,

The lastest Git kernel doesn't boot anymore after the latest DRM updates 
(drm-next-2024-09-19). [1]

I tested it with an AMD Radeon HD 6970 (Cayman XT) and with an AMD 
Radeon HD 5870 (Cypress XT).

I reverted the DRM updates and after that the kernel boots without any 
problems.

Please note: Due to a lack of time, I can't do a bisect.

Please check the latest DRM updates.

Thanks,
Christian


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=de848da12f752170c2ebe114804a985314fd5a6a



