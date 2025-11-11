Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 193C1C4D2DB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 11:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6081010E54E;
	Tue, 11 Nov 2025 10:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="ASZ4TVFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF09910E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 10:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1762858268;
 bh=iH4TyyzlCs63+PYsRRwCgixuDYK1uZRjwAYMJ2JsaAI=;
 h=From:To:Subject:Date:Message-Id;
 b=ASZ4TVFgFYhUgifkSgajyi99ZZcOwMW1pSqGDSbBrBhjateBFeDh9BnRl8dTC8EoC
 bymsWVmgW3Db+3Rrfew+sN4kmd5yt+evY94zbyVrYVJ4ehWzWe6OXNBwSUpC9omiu/
 3svFWgdcFuOm40qMTsJEqoRC0lP7azKS26+D2+qg=
X-QQ-mid: zesmtpsz9t1762858256t97625740
X-QQ-Originating-IP: uB8mCGoHOoLZ1YWe3fAK9YaOMzLs1IbVHP3rribHjTI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 11 Nov 2025 18:50:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18215502699769285738
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v9 02/10] usb: typec: Export all typec device types
Date: Tue, 11 Nov 2025 18:50:32 +0800
Message-Id: <20251111105040.94-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251111105040.94-1-kernel@airkyi.com>
References: <20251111105040.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NfykWmRlrd2oJyFO4fwe5TS0axn6/Kttof4anGjVHoKeDx4fvOeEtf6n
 LS07Smxr230qlEtzDYbRHXQyTwPOVx92I3h3WBr0YkBJsRmNtPudQ8eodfa7WLyWVdSyxqy
 AT/DE5V1JWEdO8lFbyXS8yBnGhgVVvuTbPHZXaV8VR2YJykMKg8hbDRgeNvHqLpoFWEt0zz
 3v117iCy2nsGP3R7pmvkDyZZWrHVoPgAICYnzYlYT8gh6pFEe1dgmWkeztQ3g5V0+HD9ctS
 xzH6XIEPXTBXR+AzxcGzr6ObVatwDHOzAul9c30hpe4GhKxeapa0kjphinoI0JWCEpsqoPy
 SOTz8wZ7o0jHjMm9BDZzVxuFdrKxl+At+mdcVxfyMxUESc8ZdVMq1dTay/zuMfIyxV1Bfpm
 S4mG7x9Cn6IUObgCwJw7sYrhzT66MZS/EymVeTrEVJJcQNghtJRt6VhklKWwYr0WX02VI4A
 OLzyb+VhpWnZxQXMxF6gin8AfiHcMuY022GpHjvC+3S17Y3+uxB/kCDiOWl7fq3MpPUTb2W
 Wv7sZ9Y6mdFGFK7EVreRIXvb+fnHUFdrl2RoH+u8Qd/6JmmAwZDhzVmnRZpD4B3NM5afaQB
 XBnJEl1HE530rlnIMLuWQfN0mcmge0f9V0Nx2dvvXbB2zG1xRR446O6ZlIZuhibbbynKvuJ
 0mN5ik2kfvjT1ykOIm6MhqBX03z0l4knZI+9ncb2jJeji7XESgb0iiS8uhDKu/VLsZ19KIF
 7gfWJCYV+7/WIhAQ9fm4XflCimEq0DLIv2DsH3vQ+nyfY0UU8KRJQn+8t0j6cuv3WWLH491
 JRYXMwfJjjjk+8waoMP99YliDxO8Wf8bLAm+usa8SlYOOhD5apDnLEIcQjA943dZEHY2bVv
 DMpkUVgLCoBZVU3/zr1aJovIXVb19rMYRG6EVy4mk6XAsz/341MBCDL3WTbk7xy6S6S3y0N
 S/Hyq2S5MkW3OXna1J98NaJqMrlG9/TMd2z7jasgN5CFoGYAXlLZICyRDeid7FDnVcGQ=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Export all typec device types for identification.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

(no changes since v9)

 drivers/usb/typec/class.c |  4 ++++
 drivers/usb/typec/class.h | 10 ----------
 include/linux/usb/typec.h | 10 ++++++++++
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9d2aa3dd3f56..449f921acd9c 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -792,6 +792,7 @@ const struct device_type typec_partner_dev_type = {
 	.groups = typec_partner_groups,
 	.release = typec_partner_release,
 };
+EXPORT_SYMBOL_GPL(typec_partner_dev_type);
 
 static void typec_partner_link_device(struct typec_partner *partner, struct device *dev)
 {
@@ -1146,6 +1147,7 @@ const struct device_type typec_plug_dev_type = {
 	.groups = typec_plug_groups,
 	.release = typec_plug_release,
 };
+EXPORT_SYMBOL_GPL(typec_plug_dev_type);
 
 /**
  * typec_plug_set_num_altmodes - Set the number of available plug altmodes
@@ -1294,6 +1296,7 @@ const struct device_type typec_cable_dev_type = {
 	.groups = typec_cable_groups,
 	.release = typec_cable_release,
 };
+EXPORT_SYMBOL_GPL(typec_cable_dev_type);
 
 /**
  * typec_cable_get - Get a reference to the USB Type-C cable
@@ -2033,6 +2036,7 @@ const struct device_type typec_port_dev_type = {
 	.uevent = typec_uevent,
 	.release = typec_release,
 };
+EXPORT_SYMBOL_GPL(typec_port_dev_type);
 
 /* --------------------------------------- */
 /* Driver callbacks to report role updates */
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff..f04f6987bed8 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -87,16 +87,6 @@ struct typec_port {
 #define to_typec_cable(_dev_) container_of(_dev_, struct typec_cable, dev)
 #define to_typec_partner(_dev_) container_of(_dev_, struct typec_partner, dev)
 
-extern const struct device_type typec_partner_dev_type;
-extern const struct device_type typec_cable_dev_type;
-extern const struct device_type typec_plug_dev_type;
-extern const struct device_type typec_port_dev_type;
-
-#define is_typec_partner(dev) ((dev)->type == &typec_partner_dev_type)
-#define is_typec_cable(dev) ((dev)->type == &typec_cable_dev_type)
-#define is_typec_plug(dev) ((dev)->type == &typec_plug_dev_type)
-#define is_typec_port(dev) ((dev)->type == &typec_port_dev_type)
-
 extern const struct class typec_mux_class;
 extern const struct class retimer_class;
 extern const struct class typec_class;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 309251572e2e..02fed8293415 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -56,6 +56,16 @@ enum typec_role {
 	TYPEC_SOURCE,
 };
 
+extern const struct device_type typec_partner_dev_type;
+extern const struct device_type typec_cable_dev_type;
+extern const struct device_type typec_plug_dev_type;
+extern const struct device_type typec_port_dev_type;
+
+#define is_typec_partner(dev) ((dev)->type == &typec_partner_dev_type)
+#define is_typec_cable(dev) ((dev)->type == &typec_cable_dev_type)
+#define is_typec_plug(dev) ((dev)->type == &typec_plug_dev_type)
+#define is_typec_port(dev) ((dev)->type == &typec_port_dev_type)
+
 static inline int is_sink(enum typec_role role)
 {
 	return role == TYPEC_SINK;
-- 
2.51.1

