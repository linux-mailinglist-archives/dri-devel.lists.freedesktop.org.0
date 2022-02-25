Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1E14C5015
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 21:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5072E10E98B;
	Fri, 25 Feb 2022 20:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8E210E981
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 20:51:42 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4DD8F1F44C;
 Fri, 25 Feb 2022 20:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645822299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2XvDcM8YOYz/VUNaYX8jiMEFs9ojmeNsJn6nrjEuyM=;
 b=06XkM1h2jd35HkRX/acDRdvzPNnk02benHoaKaKMRtyyPxUva9DM2tRBSRJwyIL+QMBEGL
 VL1BPZubuIoqOJ2cEKlSA7jqnKrgdvkd9NChFmSG340CxvZmPqg/bWyydDsEzMU5aOmf88
 CpYO7qjSszPsjJmoDh89Fr81OTruIKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645822299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2XvDcM8YOYz/VUNaYX8jiMEFs9ojmeNsJn6nrjEuyM=;
 b=sYsD+vMoBk5i5p1DpUIelO6X7NTIYmwqFdAS1E4m3rp70EjsweaH1hRoAQq70I6nS5QNmI
 u6cEoiSVMAxhctCg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id 18529A3B8F;
 Fri, 25 Feb 2022 20:51:39 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v4 3/3] efifb: Remove redundant efifb_setup_from_dmi stub
Date: Fri, 25 Feb 2022 21:51:35 +0100
Message-Id: <7416c439d68e9e96068ea5c77e05c99c7df41750.1645822213.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1f13e6f2-a87c-83ac-7119-8632c8c8ac8e@redhat.com>
References: <1f13e6f2-a87c-83ac-7119-8632c8c8ac8e@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-efi@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Herrmann <dh.herrmann@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Michal Suchanek <msuchanek@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-video@atrey.karlin.mff.cuni.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

efifb is the only user of efifb_setup_from_dmi which is provided by
sysfb which is selected by efifb. That makes the stub redundant.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v4: new patch
---
 include/linux/efi.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/efi.h b/include/linux/efi.h
index ccd4d3f91c98..0cbbc4103632 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1329,10 +1329,6 @@ static inline struct efi_mokvar_table_entry *efi_mokvar_entry_find(
 }
 #endif
 
-#ifdef CONFIG_SYSFB
 extern void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
-#else
-static inline void efifb_setup_from_dmi(struct screen_info *si, const char *opt) { }
-#endif
 
 #endif /* _LINUX_EFI_H */
-- 
2.34.1

