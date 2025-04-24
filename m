Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732C2A9ACDF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 14:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2C310E30C;
	Thu, 24 Apr 2025 12:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=etehtsea.me header.i=@etehtsea.me header.b="tsVQ2KRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1802 seconds by postgrey-1.36 at gabe;
 Thu, 24 Apr 2025 12:08:58 UTC
Received: from outbound.qs.icloud.com
 (p-east3-cluster1-host3-snip4-10.eps.apple.com [57.103.87.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC6210E7D9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 12:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1;
 bh=6Ttio08oTSADz4D/Sdqy63zgVY4f9+DlzTAqpC3Lvk4=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=tsVQ2KRiyGCIZQLb4G65HDJs1vpeeouwjaelagCLfL3NXGP+UVlNwIb5WoMjjuSai
 Up7tFBXQPlHkmoShSz9jPaZfofxQNKyaZD7dZi8xpfOtSQQsxB2d+9ffn0kayCd5sc
 JdltQBCD2bf+Mu2jRtjk/4nZmo6CcNxlbxE/D+NymdjMI/S45Y4FQ5kLUmE1Q1sHm5
 +f+9FJc4wgb/L+X+SsBLrDMxQ5+bZ6zXPSB1FXd47il192LmMsfu4vGdzx95QatMLP
 dlJbQnzwtoyuUr0FK0K9IiWD0W3MtcVijawtyQy05Gq4ZLbPXvpVmutBVUOMJMPPIE
 Jrr6jl6T1c0rg==
Received: from localhost (qs-asmtp-me-k8s.p00.prod.me.com [17.57.155.37])
 by outbound.qs.icloud.com (Postfix) with ESMTPSA id 8D1E11801326;
 Thu, 24 Apr 2025 11:31:37 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: andyshrk@163.com
Cc: airlied@gmail.com, andy.yan@rock-chips.com, daniel@fooishbar.org,
 djc@djc.id.au, dri-devel@lists.freedesktop.org, heiko@sntech.de,
 hjc@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mail@etehtsea.me, mripard@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Subject: Re:Re:Re: [PATCH v4] drm/rockchip: Disable AFBC for res >2560 on
 rk3399
Date: Thu, 24 Apr 2025 11:31:27 +0000
Message-ID: <20250424113130.7431-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <a893834.9206.196484ef2ab.Coremail.andyshrk@163.com>
References: <a893834.9206.196484ef2ab.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0lH5-8KJ1rBV-2m4q0bqzLQKWM_UHpbh
X-Proofpoint-ORIG-GUID: 0lH5-8KJ1rBV-2m4q0bqzLQKWM_UHpbh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=1 suspectscore=0
 mlxscore=1 clxscore=1030
 adultscore=0 malwarescore=0 mlxlogscore=190 bulkscore=0 phishscore=0
 spamscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504240077
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

Hi, Andy and Daniel!

What is the status of this one? I've noticed it went to archived.
Is it good to go or not? Any further recommendations?

Thank you,
Konstantin
