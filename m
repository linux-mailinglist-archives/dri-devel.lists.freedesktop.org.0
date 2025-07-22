Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA253B0D340
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC8F10E5F5;
	Tue, 22 Jul 2025 07:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="PIk9V3e/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197BB10E5F5;
 Tue, 22 Jul 2025 07:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1753169751;
 bh=dOWhiNCJZis4pN9M5V0BjfzioRHW2TPCHsRRvp01fVg=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=PIk9V3e/6y2ETdy7wlvTtHI/xNuO75T9WPsBWxW37ipx08yntI76orC8zMpQV4xD6
 KeNakI3kyHbH8ZKwNRCH6zDcynKCYtNDDhbOYo+13JIg+Mn8Iw7wh8cr/R8/jLrLA1
 Pgy9q/DqiHQp38cfJC8ArMjjwb77Zux6nobrM7Ts=
X-QQ-mid: zesmtpip2t1753169688te102d84b
X-QQ-Originating-IP: 2AH89LdOk3yAx2MwkPBNl41lOKSpE4iMrtdRIyTFm7k=
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 22 Jul 2025 15:34:44 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12113963411255090427
EX-QQ-RecipientCnt: 64
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
 thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com,
 wangyuli@deepin.org, x86@kernel.org, xen-devel@lists.xenproject.org,
 yujiaoliang@vivo.com, zhanjun@uniontech.com
Subject: [PATCH v3 2/8] cxl: mce: Fix typo "notifer"
Date: Tue, 22 Jul 2025 15:34:25 +0800
Message-ID: <E1EB1BA9FDF07D53+20250722073431.21983-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
References: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OamaEojN7lH+aon26mnXsPHIG3m8onfE+MVo+q6dJ2XwVAu4cnMBRC3Q
 U642pTHgkPrGIQuNQ5k71tL7ahLhTj6z+qD7wE8wrjY6MHIkusIhtI1B6E8KyMmt4CzQrz4
 2Lfe7vWv7Yn/IMiBL0DaPEdJNll7mwN47Iw3ED66T3twB/XHz4JapwOMhSB261L9OhhMRTy
 gTSYEVd5xsd9KK00QkPyF4I9D8fmge3tn8sYhG30m5NxeDiWBYLJU7wqWoUovg3bH03yxH+
 05OnbbJPXokGzIj9dpuG54lgeUHrsJAjNF42mhqiRqdqwz5kRL8qy/uqAAWcAY17LyisZ+n
 ZlSRNC4YqdoIx1xKFThn/F/zgANUvPHHpkjfyq9zoXtn6RNSp3cfEf0Th8uBP82Jxvdhn82
 /3GUx/NIH/NS9IqUtog1yYCZqEhAKyJaUbZYLVmnPf12A1TsacVEwvnAaNab/ZKmITGy+Bb
 bWILSqBqv3hGfhUXdUMSVi6SJdCJ01QqRZKN7+Knrr1pYJFI2YZNoDdzpK+hiG5eUEqXQsa
 wfT5m+YWqjJ9HqMHOeQ0JUEUcNSlYqxazMOyqzK5azr3VfNQN1HLeYNP6dgIR2ONdRnCtX1
 BuvbC7qfZ9vdSV6eCVfZ6PA01gdwTStXqMDgAPqm56esXVqzEPgp2GbREmVG8FvgWhu9RmJ
 IgDq0PYrWPxRfPSkDzVrqHQmIDoPJEs/w+P9GPHp9lec7fx9W/zPmRK8Dxqh0BBzGsE41oy
 86YoVLOKFuy5YV42veZnniZe4N4ymejshL7ay+S/KrljqErofDZ8pm9qSIh3l6u/kVrJl3F
 CvNgg3REFVYfqhgbH6FhduIN1K7EVnzDYBkrCHBZAp8E9Z3noRokxUT4kjJ45DsiAfsrSoM
 s0iRueVLyw1RXoJQP+gAHA8k53gg83i1CimwHvEA2KNGa6PsLsJO8UBzr3REZR6jzRXb3eu
 LNdBDLmOmSJfezJGk1L9yaEnqBZGo/EfACXVMw78GAvuwbJAUtPH6DmIUcTInRWqv7BeM3Q
 ez5DhYN4vA+fMC08SPo/HEAtBSW6ckw2x6AJSej4IiCIACt9TMBF+7YJCHq7YFecJogVUUk
 z7/k7iNBeUZ2l2CmgpQXC0rT/j1twbCJ/YqF7QYh8j7
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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

According to the context, "mce_notifer" should be "mce_notifier".

Fixes: 516e5bd0b6bf ("cxl: Add mce notifier to emit aliased address for extended linear cache")
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/cxl/core/mce.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cxl/core/mce.h b/drivers/cxl/core/mce.h
index ace73424eeb6..ca272e8db6c7 100644
--- a/drivers/cxl/core/mce.h
+++ b/drivers/cxl/core/mce.h
@@ -7,7 +7,7 @@
 
 #ifdef CONFIG_CXL_MCE
 int devm_cxl_register_mce_notifier(struct device *dev,
-				   struct notifier_block *mce_notifer);
+				   struct notifier_block *mce_notifier);
 #else
 static inline int
 devm_cxl_register_mce_notifier(struct device *dev,
-- 
2.50.0

