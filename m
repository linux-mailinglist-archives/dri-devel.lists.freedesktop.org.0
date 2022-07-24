Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663AA57FA28
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 09:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3EB11A270;
	Mon, 25 Jul 2022 07:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (biz-43-154-221-58.mail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE5DBF156;
 Sun, 24 Jul 2022 07:42:16 +0000 (UTC)
X-QQ-mid: bizesmtp83t1658648530tlaln5py
Received: from localhost.localdomain ( [125.70.163.183])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 24 Jul 2022 15:42:09 +0800 (CST)
X-QQ-SSF: 01000000002000007000B00A0000000
X-QQ-FEAT: 83ShfzFP0oAUTgA4x7fia1N3iOs8FDZQk3RUK2OOVsdNMVcrH24z/8qAduNcj
 qMQSnETQt93LZ1f1Q367pIJuE1LZEJziQbwtI395RtiN/2iT74wmU0gMtK/LlUWCGoSVSpK
 qS2U47OWS9FCRTHyG/BH1LHE1HmO0M7i68y7oFxVbKFSPPS9hPI8mJw43emYIPRY6xmIgiM
 SyHmomb8PVVw1OZ5BitUgvfJDUkrZeLnXokZ6XK45B+dn+oNAGlpebBYECbEw5F3tcx/kLm
 SVLOcpX1fW4O+lEZWGI6WqgfKMHr28vb5ATH8vf+iL7eG2hsNi0L7IkI0lHYLTpMAKijy+s
 xMpMGxysYSA4xcU65NQ2ePvqmqQ73xwb0MXzMS5lB29NYC++0Q=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] dc/dce: fix repeated words in comments
Date: Sun, 24 Jul 2022 15:41:50 +0800
Message-Id: <20220724074150.17869-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Mon, 25 Jul 2022 07:23:20 +0000
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
Cc: wangjianli <wangjianli@cdjrlc.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Delete the redundant word 'in'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c b/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
index 70eaac017624..f0b585caa28f 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
@@ -322,7 +322,7 @@ static void set_video_latency(
 		value);
 }
 
-/* set audio latency in in ms/2+1 */
+/* set audio latency in ms/2+1 */
 static void set_audio_latency(
 	struct audio *audio,
 	int latency_in_ms)
-- 
2.36.1

