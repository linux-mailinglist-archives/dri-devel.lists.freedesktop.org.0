Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F3E9D2D28
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 18:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1184810E2B9;
	Tue, 19 Nov 2024 17:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FyAIeZc8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198B910E2B9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 17:56:48 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so48552185e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 09:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732039006; x=1732643806; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=77Eoli2JKcfvmzeyZfmZcAC8ruXlT3sz4RV/g2sy6qg=;
 b=FyAIeZc8ors/pYd3DEstJr6LVGGothkXaGreDgoWle+uDJLDWgwx6kRx5MvF9tJO2F
 9F0pKXiA0JcWNq00YWuqcz9yzlSuSGgS0IlVlIfyvDyJ65UAdR5VMFKj1ku/+Bcm4DaJ
 m0p3bJSjtlNxwZ9h/5Cc70OHrDWsraj+O+/Gs0ssmUOymFaf7Ethdkak4+yXa8lSIoGu
 xrjhRHugwjQm98cJDxzbuJd6ckex7GO9P9Xax+tenUT6F/pG/DM6QWtvCLfAgJcQWK6I
 UDVO8TU5Vbxj2J2dMRG/oPxtWne2kMPMrtCIerjJODNM6sVpmWj0Tsg/MJ/ARXYYxcrT
 9MtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732039006; x=1732643806;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=77Eoli2JKcfvmzeyZfmZcAC8ruXlT3sz4RV/g2sy6qg=;
 b=PVBA8aJPKRkq+4Y53FURP2V49LJv3t9Vynk+RS3+xeftCKBTLF5JQr4yn5xbsz9/F5
 TEouU+nfHAL1v+RsqhOn/wkXC1UmZk1camzmIAKB0YZKbn24dsZQlVCRvp8eHkLds6TG
 mxzfBwE3VSnZ0Gm8VgaDYPcDVH8dcHNVakGwId8/SziOIBHIH6ji2iPovqE9PxPsuv3t
 RG/q386GOg+N588HSh+oG99rbN9tUOVlfn1Wd6MKSEZO631mbAp7jPGX5tbLF/KGWfOH
 COLTMqWbW6nuaS+T7G22rHGnRmALCtzPmMYXnmSwxhB0hPZ3uIK+Gd9/l5pJpDLJKhAf
 F03Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr0gFx4YOazRlafbrKpunay+T+HTpEpalavHE/DDq4zpkpi2PQBiWwbjubKzGIs6hMhm/jCRoq+Fc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypzMUe8JI/cVQLWbjg4R64kywtF0OC4Cg7LGvSnnPqbRdOWrYI
 Kp/fPEqoLTzxKP/b11gmuogpajC55CbUG1yF/IDdPQFTUhPUrxVWbOQjlbMz0CQ=
X-Google-Smtp-Source: AGHT+IF+Lx7qgtgHAGXdWBZ2QyFola8SI6L7q/xdAwZBh6gOo8f5SFDq9dfDsh2MOCUWBja2J9sv1A==
X-Received: by 2002:a05:600c:35c8:b0:430:57f2:bae2 with SMTP id
 5b1f17b1804b1-432df791f62mr123906335e9.23.1732039006322; 
 Tue, 19 Nov 2024 09:56:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27fe68sm208302275e9.24.2024.11.19.09.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 09:56:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 Nov 2024 18:56:36 +0100
Subject: [PATCH v2 01/11] opp: core: implement dev_pm_opp_get_bw
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-topic-sm8x50-gpu-bw-vote-v2-1-4deb87be2498@linaro.org>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2743;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=jYCp8TR7dzoclrZB3zyNwAn2VlLPZL58y51ut7TpNS0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnPNFXzHRfip66xeIvRHFGvMRVvKXc3AYGENiBWrVV
 6SXuRnuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzzRVwAKCRB33NvayMhJ0btFEA
 CxS/Y3wNk1GVdwKy07e3iKyukBHX2qmyQj6NiA9v2ta5Cz/uPNSaS8Tc32gJESqqwJojuIQlF7k4No
 DynYwa/WDju9SFUVD1z2cMFL+FCvgSRWaqWCLqR7cGJMvMgyZlMv7zR9WYa7M5wJ/MNzYn91nUDvCa
 3//OfR6I3DwpaHFLewgE8rLC9ZB3RLsi4RzMKGsK+IKXcvsbmbPJf+HjgFYMSAc8PW/I2tvWQ/InSy
 gFFZjfXuvRuLrZWHqT1Gi4rRicne6TRCYpLh4p+BFUxe5KnEGDZg8o3ceWMxwKor4TSaVQQTKsnNWt
 W/GPR6N7GgzTLxQO6epXobNAUv02VeDNUs66KIY7rUF4qy3sMI6G+aTf9vE0w/g8Fd3u1YaOE3N8o1
 nxMzXagpNBdnf9rI110qFeirQMY6ZIp57HyQbmKVK1Vk0R0VM46MLCJdfp5t7I0/NU7NG4If6uYuqK
 PLKl+kOpOLIq8yaTA/vpvfP5uV0q/3HYIBx/QJAHJIYUtp3PMoCTj+VYqhHaQ6bGrK9iaqwNAorqeO
 8VefKlo8kKdPgB6/7ip8k2Y625U0EHqOAdluF4+kCxGD+T0qLHefkoqkSSmaHYSoVHzL7H6hVZZPzq
 wMkQtSkoWZmSqTLDUZZWPPkznILvnx0n/3S8aVEASCP32GztYdODY1Npp8GQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Add and implement the dev_pm_opp_get_bw() to retrieve
the OPP's bandwidth in the same way as the dev_pm_opp_get_voltage()
helper.

Retrieving bandwidth is required in the case of the Adreno GPU
where the GPU Management Unit can handle the Bandwidth scaling.

The helper can get the peak or average bandwidth for any of
the interconnect path.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/opp/core.c     | 25 +++++++++++++++++++++++++
 include/linux/pm_opp.h |  7 +++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 494f8860220d97fc690ebab5ed3b7f5f04f22d73..864b9b99b0129acaffaf45c584c5f34b8bababed 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -106,6 +106,31 @@ static bool assert_single_clk(struct opp_table *opp_table)
 	return !WARN_ON(opp_table->clk_count > 1);
 }
 
+/**
+ * dev_pm_opp_get_bw() - Gets the bandwidth corresponding to an opp
+ * @opp:	opp for which voltage has to be returned for
+ * @peak:	select peak or average bandwidth
+ * @index:	bandwidth index
+ *
+ * Return: bandwidth in kBps, else return 0
+ */
+unsigned long dev_pm_opp_get_bw(struct dev_pm_opp *opp, bool peak, int index)
+{
+	if (IS_ERR_OR_NULL(opp)) {
+		pr_err("%s: Invalid parameters\n", __func__);
+		return 0;
+	}
+
+	if (index > opp->opp_table->path_count)
+		return 0;
+
+	if (!opp->bandwidth)
+		return 0;
+
+	return peak ? opp->bandwidth[index].peak : opp->bandwidth[index].avg;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_get_bw);
+
 /**
  * dev_pm_opp_get_voltage() - Gets the voltage corresponding to an opp
  * @opp:	opp for which voltage has to be returned for
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 6424692c30b71fca471a1b7d63e018605dd9324b..cd9a257b8e7766d6c8631351a10a845c88414a74 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -106,6 +106,8 @@ struct dev_pm_opp_data {
 struct opp_table *dev_pm_opp_get_opp_table(struct device *dev);
 void dev_pm_opp_put_opp_table(struct opp_table *opp_table);
 
+unsigned long dev_pm_opp_get_bw(struct dev_pm_opp *opp, bool peak, int index);
+
 unsigned long dev_pm_opp_get_voltage(struct dev_pm_opp *opp);
 
 int dev_pm_opp_get_supplies(struct dev_pm_opp *opp, struct dev_pm_opp_supply *supplies);
@@ -209,6 +211,11 @@ static inline struct opp_table *dev_pm_opp_get_opp_table_indexed(struct device *
 
 static inline void dev_pm_opp_put_opp_table(struct opp_table *opp_table) {}
 
+static inline unsigned long dev_pm_opp_get_bw(struct dev_pm_opp *opp, bool peak, int index)
+{
+	return 0;
+}
+
 static inline unsigned long dev_pm_opp_get_voltage(struct dev_pm_opp *opp)
 {
 	return 0;

-- 
2.34.1

