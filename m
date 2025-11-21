Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9EBC798C6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A7A10E87B;
	Fri, 21 Nov 2025 13:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1Y9AuZw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NlU69lwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C1410E87B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:42:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALBo87X2757556
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=yV0NrmtngChuQ5H8MoVZH4
 MYb7NDlL9LIbeT5HsjmCI=; b=f1Y9AuZwyLRlXQACnlZExxp96Zrg8R6hPCK+hk
 QEO2OEgNPQ9gz3AEGA+xlrWqh0BCQhtoCaVPtDyDdTMQ9WDbZX5MeGZt6dV37+ne
 5jRRY05thU0KVwdjcgpHQ4xdRA9VpWwIuhyxW42BFRdFH6nYKHW4yfQiZbO0vQPq
 4L9Myi9X9JnLxEro/dkSnrGDsD+E3fniMGtxKAgj0nTIEr5u/MK7wKM1n2Syvhhe
 6slA35EKVU6heBDc6gnqHLZXz+dCMIdjxvjUU7UFeRR8+SkQksESlr4Bv6mNIHqf
 c4GzJygfzJLxAg/tU4nM0jqQbnA0zKYPqMd7nomHWJ6+7Oyg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhy61jn1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:42:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7b873532cc8so2148712b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 05:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763732540; x=1764337340;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yV0NrmtngChuQ5H8MoVZH4MYb7NDlL9LIbeT5HsjmCI=;
 b=NlU69lwpxDnjQHreOdoIWJP1ZSCd3fkGQioqh8dwD/CYdpoUdJA0e83Ey6+O/JLrbO
 KgqPqFyy3iaQKeLj2MI2ae1ixYECXMpjQ+0IP3SSBz2Gjjs6cBqdub0DRrV1FrdSWfe3
 2LCVquX1MgcX0x3e1FDIdI7W2GiXkXH2YsIvHl08PGeKOYcFsefAZ4M+nu3nToo1QsWY
 TP9a8K8VGp8Nw9f29rev5EGkji10IcpFLJr1voH/u3jrxMxfrR0g+7oHRSf8D2XnXtSU
 DQu381EJr5+QFPPoz07PYrwO1+ThKpftEFtUauQW2gkd6eHO4zXFTEUcQ/5QhVHnw/C3
 cVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763732540; x=1764337340;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yV0NrmtngChuQ5H8MoVZH4MYb7NDlL9LIbeT5HsjmCI=;
 b=k+gRzPWTKx4lhaNOY5+HKNIkkoXyjIm9BNJcFjajc4aZ4Uqr7cpcJsZgz5VPDKmbzZ
 eUmtUFpfz+FkT+iOp/4ib4DsvDQ2SFp+GYO+cBj0CYZxLvbrdlOdOeGebHK1Y/rWiMA1
 j0EE5FiUBf9jyuJwHgGtHapoByCk3p2G6V0JOmQiGeW7ykJpZHWZwIK4rdLv1CXMxNAX
 fAmxAoxQaucwXtdVtpINhgw1XFFhypwtwRmPpJP7nq8QlB9pdO7oXcHP0AIghq5MFrdD
 EN7TDlVIvOeaW5MEnA2JrEGXd2G5R+BfXY2lYiGrgkuBBIUz2ONlPRoWa2xUXAChCbOd
 QRyQ==
X-Gm-Message-State: AOJu0YxUOShTZurTk26rPOdNpLrUc93gZ/L1rpFi+Ip4zbpJOOBeaFbU
 DOjhTXdnDijhFbQy6iprpN5j02G3YO25gNhMq22L7b7wGUc7SawubXbY3Um5b/WCt9oTFZdyUVB
 7VRfQBqKSb1VVBvQO3ujzkvgJ/ErTZAGSHChtdMMEs+BEO6EC0OQICEgF8hTJG3KDw6CLbAM=
X-Gm-Gg: ASbGncuxzvF/XPd3r4469SKmwvwSFRXRbATHFRh9LCJMnk4TQrwYHItiv6xxkjHD7tC
 +6bu2UAHzrcb/UoLdGMt7MgWPh1SVs8Xlsd/7gTWLbOPhunXaZPOfzyJCeUb8oGgE/cdQXaPUMb
 Lw2+RjCpRVuTe+iM+zLNbPfNvMTqpKHFeshFBoggz23hlMTc1pjX6HVKhOPyPEHp7PhHyf0EzEj
 Oqyy52rxmh3nVjwtIxeRkz2ekdoSYNNSI9F56qNoVVJEpdD7XAX+StZ63sFFnkvZsYFX1gxHRA7
 FJCNkaaaXe+crwfQNM8Bzj8KXcmNkr/YvHbpOftonrRDzYdt2UtMCsWBBe0+ZtsVhLF31cLg5ul
 OTF7azWX4S353SKEdn5ldxbZZYXUT0mXlkBr8BB2Bo8Ft74WDZw==
X-Received: by 2002:a05:6a00:a90:b0:7a2:7f45:5898 with SMTP id
 d2e1a72fcca58-7c56783d53dmr2906006b3a.3.1763732539712; 
 Fri, 21 Nov 2025 05:42:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFVKvwaqUw86dz75vO7tn42pMszdQOCtcFlEJ5jOheBLO6Iy9zzVnIXtL2AaHbKGf9g+zkEg==
X-Received: by 2002:a05:6a00:a90:b0:7a2:7f45:5898 with SMTP id
 d2e1a72fcca58-7c56783d53dmr2905963b3a.3.1763732539226; 
 Fri, 21 Nov 2025 05:42:19 -0800 (PST)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3f02423f6sm6161435b3a.39.2025.11.21.05.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 05:42:18 -0800 (PST)
From: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 19:12:06 +0530
Subject: [PATCH] drm/bridge: lt9611uxc: Increase EDID wait time from 500ms
 to 1000ms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-hdmibridge-v1-1-14c63890f362@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC1sIGkC/yWMSw6DMAwFr4K8LlKcpHx6lYoFjp3iBdAmtKqEu
 Hujspz3NLNDlqSS4VbtkOSjWdelAF4qCNO4PKRWLgzW2CuixXriWSkpl0cMWooi7IKDIjyTRP3
 +Y/fh5CSvd2lu5wg0ZqnDOs+63apicYfYOdMg9eJ7ZmdNG4kouMahb72n6CIMx/EDC+PjEqgAA
 AA=
X-Change-ID: 20251121-hdmibridge-e012bfeed3c3
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763732534; l=1155;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id; 
 bh=2Eu4L18XG/nACcyxpzpseFmjE73THe/k1ZohJ52AAS0=;
 b=t5QxV/3wLRPfP7xf0Tg66IKJQPY+VNNw+HnakRsw5MtrwBxPNcZbw6ks+cp+35gXa/4JE642Z
 m/nBEXvlKRVCDD1wQv3hm48SotBixHBDN3Xk0mbeP6aNQJt/4vmp6qy
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Authority-Analysis: v=2.4 cv=Lb0xKzfi c=1 sm=1 tr=0 ts=69206c3c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IFM9E_ZxX31xNXM5hSwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: UYFZpA8VyUEu7lZMaGSbBg4yiY3Dr4Tr
X-Proofpoint-GUID: UYFZpA8VyUEu7lZMaGSbBg4yiY3Dr4Tr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5OSBTYWx0ZWRfX70ZNkRI081Rm
 FJeyWju3IxIwSbdDn74Y38nd00WVYdvJY8CPbQ0WuRi0m/iEG5e/A0wa8FQsha0nrNO2Unt9Vk9
 WzMduQr49Jg7JFlW68bmfsEV4B77PqTvXiCZ/n6MK760mTAMrUvwaIAn8lPa9NM7OQ+HR5YkJkj
 tkyOdN4IIUU2rJ5qvScJZ8cm2ewAeR9xoHJq6LgQMh3Ivf5cLk+zZOc+Olluq8QF1jCSHz2R3hA
 xEesnKOdRH/MC0CXs1EG8GrG7gCsSfTiJSF9+ZUUntPVpdjWPboC6/sfhKJyrjlbB+djhLTplOt
 DFxs0NZBcsZ/pf7dHLerNLvQ3+CFHE9g254Ib4604Kz04YVtIdVceDCyPmvi+9ImiUPp30hIQ4E
 xWUmmm5QHCtTArXKwMNU14qrs68PXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210099
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

EDID interrupt was coming 600-650 ms after HPD interrupt, resulting
into EDID read timeout and default resolution of 1024x768 on display.

Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 38fb8776c0f4..6f2b72fba598 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -382,7 +382,7 @@ lt9611uxc_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connect
 static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
 {
 	return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
-			msecs_to_jiffies(500));
+			msecs_to_jiffies(1000));
 }
 
 static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)

---
base-commit: 3c3d81183061b9e49dd3207fbbbc36314744bf3f
change-id: 20251121-hdmibridge-e012bfeed3c3

Best regards,
-- 
Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>

