Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0CC2DDFD6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8F389D2E;
	Fri, 18 Dec 2020 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64F16E1ED
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:43 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id h205so16301616lfd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O54hHe3GwNNHKPGqkz2B7DU6dvwXex7DZOGprtr/GmM=;
 b=OeNoXEbagvqP4DcdFhxII/42gkuzezO/PqnbWTRx0INOXQdREbZ9WUQtGqRW9XC4zu
 qwqGe/LBGPelVABYeoE0DFhmP9frBpJpDLpxjZNEzjx2+8qfHOLYxleJzaXHkyivn7MV
 5Wx+7w3s6l4rWpcim8ghNJ6etTTkdS0O3EKA3rmH4m0vpOdsClXW+OmZRnXCmX54UcIZ
 YIzRp3emr7EG0FQVREe03LqbyinxlxDppx97t00aAoZs/8z1kq05RI6LRx430jN4MrGe
 yKib5DtjYjwWT1KHHaTrKl53ri2GUuh6aSw6+bQaGldmbatKakYdHzLHJ4nT9jbN9T1g
 77OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O54hHe3GwNNHKPGqkz2B7DU6dvwXex7DZOGprtr/GmM=;
 b=BNL37y8yXJ87QsrnY8AWoo1xRLKT5cA/kyEAnnpKagAhPpL3fJpSEiLPUJ9mxSJ1pl
 cHVVMF0PkLrVmBmQZCEc6kgfnxHAt6fhYMp/axmFzDqE1aZ4FfZdUB2wZibkfCyqYbdi
 rRBn5Lqo/TWpZYwZf0fg8zGsaROcF0OWyOtqYJlBAgWj7jyzwPDN6/OXZIiYdPd06Tj8
 Dy3um1dWzewW2Uq6boDIa24KvJY6EAokv4g+xIQKT6b0lhMXkFg1m99L5sU677GXUYcT
 8ERv9+QmlKeiOJ4ijDk6HvuLTbKo/fPSUhqYQun5F4sn+yTxBuPownUGsfOz2bUaK7uH
 2NFQ==
X-Gm-Message-State: AOAM533PZztYZfKLOuMk4QPlnY2NxqDCfKaVS9D3gT0Xa6BZCX0ZI290
 xU6yTyxKBs96L/EubMPd1f4=
X-Google-Smtp-Source: ABdhPJwgr1JYd3dkFtKpuRIk58HS8VFkfsWUOGAgiyXDw3hUSYyQyK1uR0tRGdUSz8JFZo5ENDfzNg==
X-Received: by 2002:a2e:b80d:: with SMTP id u13mr209747ljo.143.1608228460744; 
 Thu, 17 Dec 2020 10:07:40 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:40 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 18/48] opp: Print OPP level in debug message of
 _opp_add_static_v2()
Date: Thu, 17 Dec 2020 21:06:08 +0300
Message-Id: <20201217180638.22748-19-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Print OPP level in debug message of _opp_add_static_v2(). This helps to
chase GENPD bugs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/of.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 1f2038a4420b..56b153ea5c56 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -822,10 +822,11 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
 	if (new_opp->clock_latency_ns > opp_table->clock_latency_ns_max)
 		opp_table->clock_latency_ns_max = new_opp->clock_latency_ns;
 
-	pr_debug("%s: turbo:%d rate:%lu uv:%lu uvmin:%lu uvmax:%lu latency:%lu\n",
+	pr_debug("%s: turbo:%d rate:%lu uv:%lu uvmin:%lu uvmax:%lu latency:%lu level:%u\n",
 		 __func__, new_opp->turbo, new_opp->rate,
 		 new_opp->supplies[0].u_volt, new_opp->supplies[0].u_volt_min,
-		 new_opp->supplies[0].u_volt_max, new_opp->clock_latency_ns);
+		 new_opp->supplies[0].u_volt_max, new_opp->clock_latency_ns,
+		 new_opp->level);
 
 	/*
 	 * Notify the changes in the availability of the operable
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
