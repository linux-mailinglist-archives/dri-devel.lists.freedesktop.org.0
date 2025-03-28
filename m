Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9337FA74513
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 09:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F3810E98F;
	Fri, 28 Mar 2025 08:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Fri, 28 Mar 2025 01:52:57 UTC
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9035310E0C7;
 Fri, 28 Mar 2025 01:52:57 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.9.245])
 by gateway (Coremail) with SMTP id _____8CxqmrK_+VnleCoAA--.21949S3;
 Fri, 28 Mar 2025 09:47:54 +0800 (CST)
Received: from code-server.gen (unknown [10.2.9.245])
 by front1 (Coremail) with SMTP id qMiowMDxu8TH_+VnqOZjAA--.33647S2;
 Fri, 28 Mar 2025 09:47:51 +0800 (CST)
From: Dongyan Qian <qiandongyan@loongson.cn>
To: chenhuacai@loongson.cn
Cc: airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, chenhuacai@kernel.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, simona@ffwll.ch,
 stable@vger.kernel.org
Subject: Re: [PATCH V2 3/3] drm/amd/display: Protect FPU in
 dml2_validate()/dml21_validate()
Date: Fri, 28 Mar 2025 09:47:51 +0800
Message-Id: <20250328014751.674244-1-qiandongyan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20250327095334.3327111-3-chenhuacai@loongson.cn>
References: <20250327095334.3327111-3-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMDxu8TH_+VnqOZjAA--.33647S2
X-CM-SenderInfo: htld0v5rqj5t3q6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
X-Mailman-Approved-At: Fri, 28 Mar 2025 08:10:26 +0000
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

Hi Huacai,

Tested successfully with `glmark2` on both x86 and Loongson platforms, using AMD Radeon RX 9070 XT.

---

**Intel i5-10400F Platform:**

- **Board / CPU**: Intel i5-10400F
- **Firmware Vendor**: American Megatrends International, LLC
- **Kernel**: https://lore.kernel.org/all/20250327095334.3327111-3-chenhuacai@loongson.cn/
- **GPU**: AMD Navi 48 [RX 9070/9070 XT]
- **Result**: `glmark2` score 18703

---

**Loongson 3C6000 Platform:**

- **Board / CPU**: 3C6000 AC612A0
- **Firmware**: EDK2025-3C6000-7A2000_AC612A0_Rc2502pre0313
- **Kernel**: https://lore.kernel.org/all/20250327095334.3327111-3-chenhuacai@loongson.cn/
- **GPU**: AMD Navi 48 [RX 9070/9070 XT]
- **Result**: `glmark2` score 10893 

---

Tested-by: Dongyan Qian <qiandongyan@loongson.cn>

Best Regards,  
Dongyan Qian

