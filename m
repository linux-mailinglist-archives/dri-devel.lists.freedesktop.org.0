Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB1068949C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 11:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476BD10E73D;
	Fri,  3 Feb 2023 10:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B2610E73C;
 Fri,  3 Feb 2023 10:02:47 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id u9so464775plf.3;
 Fri, 03 Feb 2023 02:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8uI1M7MlCo9XnTZpJcBOEs5KyjjwQHQ4dPVV8UJc85M=;
 b=QnIGxN6Lwu4aUFzN5zi5SuwFMdtnPJzPMWMZ9vIadX4m92djFC+2E4YcRW3eNF4v1Z
 Mg+ZxOCTI2vhUDl00H4wghHXab/rBKeEOrfVkQ3smacWDfBbshqwz/xoC/CEz3dbvOnz
 zdxlcD/D7y5jj2cdyoBY36E7SmR0SET3MT06VrTFvpDcpve8cOcLCxvfld0k0i7AINqk
 oTs/z7xROlKl6OoqvnGQPnnbtWhdgqj1cAQi+oTVJxLhe6mlSrD4TYjIoNkrLrshcLKf
 VUE7BfCWF58nSlTSjkY7sKBLRYQ4Hi1Ds1fYtEjD/yM1JcHeeMaCUJEuTh7CJ+lQuzc8
 vRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8uI1M7MlCo9XnTZpJcBOEs5KyjjwQHQ4dPVV8UJc85M=;
 b=YUId4HTLzfuIEhss/KY8frDpb2eJrqiRPLwjyl7Ll4mkNG2D+wc7tzfc9r1xOf6k8D
 lfvhH7wQRleKAre4vUUX2Yk9F/3PQDE21uvhkK9PTZsu931drpLX/5rEU/R8FsWOGitu
 iWPSdjROApb+Xheb62Vt6rkmPWOAsVXK5PVW9SFTF8onXI4K1/qNr/LVTZ6xQh/5ehOu
 h4yQ91pbIa9GqNvo7BjBdqnq2EgVrBH/fXkvoMUX5PuZwcg8uqk7ysKLgdjMyLehExQs
 iPDWcHZZgGGJxtpXlYr6yAkSUsBowkRK9IeYyKvS841CkltcD7QvEJQ/PObFR5L9IlId
 9H0Q==
X-Gm-Message-State: AO0yUKXRJaqVyqI5mMru9d7TOUlZ2D/+3iuIGl9/FbGyogEZHg1WxHOL
 dby+7dLI6SJ6eagH1dOs8RI=
X-Google-Smtp-Source: AK7set++bw9bsEbt2KDe2FpE3hso9t1lCk8CgQqRkD77rwyegzc0cHcYY7ckjMXVEQKuFQCurWx5pg==
X-Received: by 2002:a17:902:c60b:b0:196:6c71:ae6 with SMTP id
 r11-20020a170902c60b00b001966c710ae6mr7016429plr.47.1675418566581; 
 Fri, 03 Feb 2023 02:02:46 -0800 (PST)
Received: from debian.me (subs09b-223-255-225-232.three.co.id.
 [223.255.225.232]) by smtp.gmail.com with ESMTPSA id
 17-20020a170902c15100b00198e54b814bsm446379plj.119.2023.02.03.02.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 02:02:45 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 4FCE8103AAB; Fri,  3 Feb 2023 17:02:41 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Intel Graphics Development List <intel-gfx@lists.freedesktop.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH 3/3] media: v4l2-core: Describe privacy_led field of
 v4l2_subdev
Date: Fri,  3 Feb 2023 17:02:15 +0700
Message-Id: <20230203100215.31852-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203100215.31852-1-bagasdotme@gmail.com>
References: <20230203100215.31852-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302; i=bagasdotme@gmail.com;
 h=from:subject; bh=+06fGKU6Nu7LzM7YPNBQVCSnWE/UvPRGzGU+ENUc+Os=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDMl3bi97x7Uk37XrbU3jvdw/VyfZPP6VUZN3yDyc0Zxbhjeu
 U6G5o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABO5as7IMEN/6zU/CY4XCc47HsSFPN
 zLb/ji8fMw0acOyv+ZLu+ME2RkuOTSE70p0XbLRQVDkxSF2/eeee4ofKnqsO/d5c2c7T9fMQIA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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
Cc: Srinivasan Shanmugam <srinivasan.s@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stephen Rothwell reported htmldocs warning:

include/media/v4l2-subdev.h:1088: warning: Function parameter or member 'privacy_led' not described in 'v4l2_subdev'

Describe privacy_led field to fix the warning.

Link: https://lore.kernel.org/linux-next/20230203135303.32da1fc6@canb.auug.org.au/
Fixes: 10d96e289fbd77 ("media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 include/media/v4l2-subdev.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1ef5bbbf9d38c8..3e7a97c0657e1c 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1033,6 +1033,7 @@ struct v4l2_subdev_platform_data {
  * @active_state: Active state for the subdev (NULL for subdevs tracking the
  *		  state internally). Initialized by calling
  *		  v4l2_subdev_init_finalize().
+ * @privacy_led: Privacy LED associated with the sub-device.
  * @enabled_streams: Bitmask of enabled streams used by
  *		     v4l2_subdev_enable_streams() and
  *		     v4l2_subdev_disable_streams() helper functions for fallback
-- 
An old man doll... just what I always wanted! - Clara

