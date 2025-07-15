Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A74BB05DB6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFA610E5D4;
	Tue, 15 Jul 2025 13:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="L7T2ccFh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 23150 seconds by postgrey-1.36 at gabe;
 Tue, 15 Jul 2025 13:46:17 UTC
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762BC10E5D4;
 Tue, 15 Jul 2025 13:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1752587152;
 bh=NWDrOIeUTkfMgeyG9DirCptVDnqPmotqOLDK+VZpCcc=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=L7T2ccFhTmKG3T6mh99/NWel04UXnbnWQG6H0UsAuRVoyzg0rSWMDQ6CfsGkWl33k
 +qzhfTCd+IfyTEwSQEhSnfW2Nu6TBzcLfzdaXYa89VWv40tRLzf/axMm3ldWw220cL
 97y04t2d1nAvgy4g4V5utln46rvikis/m/9sdMs0=
X-QQ-mid: zesmtpip2t1752587129tb54538eb
X-QQ-Originating-IP: PsIrTfnu37O5BQpc09CPKOeWtbwmOWY2B4qF0spybKw=
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 21:45:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9443703254596192763
EX-QQ-RecipientCnt: 63
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: airlied@gmail.com, akpm@linux-foundation.org, alison.schofield@intel.com,
 andrew+netdev@lunn.ch, andriy.shevchenko@linux.intel.com,
 arend.vanspriel@broadcom.com, bp@alien8.de,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 colin.i.king@gmail.com, cvam0000@gmail.com, dan.j.williams@intel.com,
 dave.hansen@linux.intel.com, dave.jiang@intel.com, dave@stgolabs.net,
 davem@davemloft.net, dri-devel@lists.freedesktop.org, edumazet@google.com,
 gregkh@linuxfoundation.org, guanwentao@uniontech.com, hpa@zytor.com,
 ilpo.jarvinen@linux.intel.com, intel-xe@lists.freedesktop.org,
 ira.weiny@intel.com, j@jannau.net, jeff.johnson@oss.qualcomm.com,
 jgross@suse.com, jirislaby@kernel.org, johannes.berg@intel.com,
 jonathan.cameron@huawei.com, kuba@kernel.org, kvalo@kernel.org,
 kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@treblig.org,
 lucas.demarchi@intel.com, marcin.s.wojtas@gmail.com, ming.li@zohomail.com,
 mingo@kernel.org, mingo@redhat.com, netdev@vger.kernel.org,
 niecheng1@uniontech.com, oleksandr_tyshchenko@epam.com, pabeni@redhat.com,
 pbonzini@redhat.com, quic_ramess@quicinc.com, ragazenta@gmail.com,
 rodrigo.vivi@intel.com, seanjc@google.com, shenlichuan@vivo.com,
 simona@ffwll.ch, sstabellini@kernel.org, tglx@linutronix.de,
 thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com, x86@kernel.org,
 xen-devel@lists.xenproject.org, yujiaoliang@vivo.com, zhanjun@uniontech.com
Subject: [PATCH v2 8/8] scripts/spelling.txt: Add notifer||notifier to
 spelling.txt
Date: Tue, 15 Jul 2025 21:44:07 +0800
Message-ID: <A205796B545C4241+20250715134407.540483-8-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NfZ1G3mfsVwmGGfmgJkLyMvl+VoDzXXq2IYtJWnKuWo9l1qkey4A26Hv
 SvTEwKhn6on76DtphpKDmnp2WJC9f2R3CDWC5laPHEPT/iOJA+2/pv/COPzFg6M0QTwvf+D
 6ttVN9VDRkD8+zvL3VCyoPUHl7z73gjejIf/ZS5VVanhM9+31ucc7w43aOiU6lFiOjLulW7
 Rr567Y28DdcRkaB6sa9mPRFZZBRu3p+FN/bDbYSIf3gpu3WpwmfkwXpBmhJVdQItsAzAWbb
 fhbcuJjtFMUUwV0uevVM+8jQTvCqoklXnwQDkGQ3xCW9Rvf3JdqzfjOj8C49Of6ebzL+PGN
 335BovIcz/ABfWYTwC107g4rwWYNu4r6nOoLFYbYpmYWygKfcoOQBiBibJTbIRw284jwJIg
 rNJytL+dtSOMFAv3uCsMgDyN6GOuEj9vP8GsAbkTYzl1zM026u6566/OnrXTWhuAQZqQzq4
 jTbbWRgbgqHZABH0r99LHELaQQQUXu0rYb+WFPCYcj/FpokvDuwS2zkvT/4HhsQWG9eIPLj
 /d2WHb65dpLtMvqvBime6RBUNRZvpBRrT6GUjfhJO4HceuerfXJ8QUw/bLNECBsBskU0Yp8
 1Ug3J5ggzGnRCvxFQJWKxdkHDWxb3Jw492fNdsvrdAJWNhv6nO4tuGWgbcWiMiiPdwXkNmn
 o2cHF5Jj+289BRT3rDSw9hiBrQ7/0RGpqA5G1fMy8iGvQdpvK0aeqwsOSwRb5TKaTgZMZRr
 G0p81zwr/E1K7Mn/2p2wfPpniCL4LrOrSSLo4Gb3p08WIM69mdvanMKFsHXmd0/fXZfpmUm
 rgPVOA2r/NwFBE9h8n1ey7xQ0RJk8akgFJXQIMxf8yGwtepIngU3xFtEPC9EQ6jZyu7iwfe
 xQUP3jG+j7xTUXHl3wogbx23sk7NyZGueojSPbb2CGbqUpnQSvaZG56gBZ7jVWEhppQaZjR
 PWmBCLtR52wESklVmJo8+EPR7fTjC4ZZwrqfHy6nKCJmW5uKAX4AfUJr969cB1pvvMXf5X3
 IOXqWGfFbBBbYGXmkAQFEo3C2IgrFRWzNp3h9jUoNNtKIDzj+9KCfRcqMCfWRCzpRMpdMrV
 PhpUXh8Je5z
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
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

This typo was not listed in scripts/spelling.txt, thus it was more
difficult to detect. Add it for convenience.

Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 scripts/spelling.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index c9a6df5be281..d824c4b17390 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -1099,6 +1099,7 @@ notication||notification
 notications||notifications
 notifcations||notifications
 notifed||notified
+notifer||notifier
 notity||notify
 notfify||notify
 nubmer||number
-- 
2.50.0

