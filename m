Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A28720E60
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 09:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BB010E22C;
	Sat,  3 Jun 2023 07:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1195 seconds by postgrey-1.36 at gabe;
 Fri, 02 Jun 2023 10:29:24 UTC
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8BD10E644;
 Fri,  2 Jun 2023 10:29:24 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.143])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4QXdyV3qcDz4f3k5v;
 Fri,  2 Jun 2023 18:09:22 +0800 (CST)
Received: from ubuntu20.huawei.com (unknown [10.67.174.33])
 by APP1 (Coremail) with SMTP id cCh0CgCH8iy2v3lkYWubKA--.54066S2;
 Fri, 02 Jun 2023 18:09:23 +0800 (CST)
From: "GONG, Ruiqi" <gongruiqi@huaweicloud.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: fix compilation error due to shifting
 negative value
Date: Fri,  2 Jun 2023 18:12:33 +0800
Message-Id: <20230602101233.1255276-1-gongruiqi@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgCH8iy2v3lkYWubKA--.54066S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw15JF1fXFyxZw47ZrW5KFg_yoW8Gr1rpF
 sxJry8WF1UuF4IyFyxCa9ru3W3Jas5XFWqyrZrW3sIk3W7tF15W39xKr1Dtryj9FWjywsx
 tFZ2gr47JwnrAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IY
 c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0x
 vE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UWE__UUUUU=
X-CM-SenderInfo: pjrqw2pxltxq5kxd4v5lfo033gof0z/
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 03 Jun 2023 07:02:50 +0000
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
Cc: Xiu Jianfeng <xiujianfeng@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wang Weiyang <wangweiyang2@huawei.com>,
 amd-gfx@lists.freedesktop.org, gongruiqi1@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently compiling linux-next with allmodconfig triggers the following
error:

./drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h: In function ‘dc_fixpt_truncate’:
./drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:528:22: error: left shift of negative value [-Werror=shift-negative-value]
  528 |  arg.value &= (~0LL) << (FIXED31_32_BITS_PER_FRACTIONAL_PART - frac_bits);
      |                      ^~

Use `unsigned long long` instead.

Signed-off-by: GONG, Ruiqi <gongruiqi@huaweicloud.com>
---
 drivers/gpu/drm/amd/display/include/fixed31_32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/include/fixed31_32.h b/drivers/gpu/drm/amd/display/include/fixed31_32.h
index ece97ae0e826..d4cf7ead1d87 100644
--- a/drivers/gpu/drm/amd/display/include/fixed31_32.h
+++ b/drivers/gpu/drm/amd/display/include/fixed31_32.h
@@ -525,7 +525,7 @@ static inline struct fixed31_32 dc_fixpt_truncate(struct fixed31_32 arg, unsigne
 
 	if (negative)
 		arg.value = -arg.value;
-	arg.value &= (~0LL) << (FIXED31_32_BITS_PER_FRACTIONAL_PART - frac_bits);
+	arg.value &= (~0ULL) << (FIXED31_32_BITS_PER_FRACTIONAL_PART - frac_bits);
 	if (negative)
 		arg.value = -arg.value;
 	return arg;
-- 
2.25.1

