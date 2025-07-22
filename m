Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8682B0D34F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CB510E5FD;
	Tue, 22 Jul 2025 07:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="PhtDPLo9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5116B10E5FD;
 Tue, 22 Jul 2025 07:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1753169780;
 bh=m+UXxlrjT5dODP8ALqZgjPieqq+D0qMqbX8YRGfdS4A=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=PhtDPLo9y6c3GyaY1DjEYaUY76U9ml1O7VRtDndXyrbmN86To21pHgveN2eryVQJg
 2c5sOxBKVLeW2Wpy+Lz7eMoTpl4dD2lKHQvsmUo0HFfMTdLBa06pvmm2psvj23btGW
 /Ee+AzhWHJVNqNGDDQ/cB+TWNcM52e0rOCN7vnDE=
X-QQ-mid: zesmtpip2t1753169721t82d79e29
X-QQ-Originating-IP: VhBpf0Yvw5Lj6PbKLNVVhr1ZGW55NX9MRAkCLXPkiaM=
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 22 Jul 2025 15:35:17 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15702502862464076907
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
Subject: [PATCH v3 6/8] serial: 8250_dw: Fix typo "notifer"
Date: Tue, 22 Jul 2025 15:34:29 +0800
Message-ID: <BD4804BF4FBA1648+20250722073431.21983-6-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
References: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NUD6C8ibrP4BlpyOlLDI06chYZekOUCZTlSlcpL8dzVHHwru8SSCc+Yf
 uclUpL6SNW+PshL7oaMfB38E3p9RutDk/H/p+fLXg6OLwHGseLsqad9viM6TvN1ioul8Lqn
 EHKSRtFC9/zEmyD4nq7HbiUNr6o20OLXsfPgDde8sPosaCWamUMOsfRsuOQFwiL9iWrgTz9
 WQnx4W6FMtEhEJa0f7ZHQv9AzWNWWPYBxFf/GxFv0SVCWYfe/LDhs+L1RdjrgNDTwhX4uPW
 TytUw1RsNAngUBWGQio8cl54YfP1KAb3HfrXoSqc/DOCH9l7xs4tvQ2X51QI8JkypQJ3HE5
 0zvedK5LvOFBDNm5Bvt8lIRjnCoTcbDa3BCB4paP4LuWpl500TOTEo9zuhprepk8ZVe92Kx
 bvthcCZ2E/IY8EbbXHev2hzsmG3nV78hEIILHUxmTA2fR5ZIovhaoQV/1sLCTYaF0T9tV1F
 CNmgWgb0JlTHyGeSHE1yWvRxKqYDIITNpKlY8UFR+k7ebW8ZSkAwdYhYnvy6ib5eq4lPLTK
 F/ojPixmhoHSSl5G6LzYND27bG13jmukknrO3y9KBgsq1SF4BBC6ROaP1S/FLIoW5oNyyWw
 OeHslp/jNu9uvp8hIRsCI3+CkcFIfJ4XcZHZuWHmswvLcVOHblZJbZWumhH2t+g2OUZ7IFg
 34O6dCZ718Qmek0M7D5hCUTYKT+DjbiYQ2QouycFLCAdXZUL5ve36UgaeacvuyntJyy6pDF
 54RV1rXJ/0/60j7CCwEGtERi1V00Hn+H+artdgVdZlXayfHG8omeUFjeWKjXo2N+TB7+OGO
 UECNUZ3OkYIfksg34le9OlWzACOk/zuGWg3hnMr9is/MNhlI17hvhi/s9JWGs9jzX7je50C
 sJYnXkFnWVUe6J7GkMN+GY/89bR159kRRyPj+k9wH9L7HMJyDhB/EbJYpSySUfDEIJGxvi1
 eM4oF4O0MjcDEUpFJ8xFsAaxzaOeC+RQDgcblV6eVUsjLedMxAHQ4Hw1WOWoX605LTVFauJ
 T6irZALqHy/Y84jN5k7tWxSSItgaNA2qwqVmc8QG0ff9Mg0UKAt3EQbxluYffUQuPcd4gqT
 AkT/a0rXK+afAttcWoOrdzUMv/XukhMZy0yxgr56bzdo5x99p9yVJ4=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
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

There is a spelling mistake of 'notifer' in the comment which
should be 'notifier'.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/tty/serial/8250/8250_dw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1902f29444a1..6d9af6417620 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -392,7 +392,7 @@ static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
 	rate = clk_round_rate(d->clk, newrate);
 	if (rate > 0) {
 		/*
-		 * Note that any clock-notifer worker will block in
+		 * Note that any clock-notifier worker will block in
 		 * serial8250_update_uartclk() until we are done.
 		 */
 		ret = clk_set_rate(d->clk, newrate);
-- 
2.50.0

