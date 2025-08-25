Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C755B34A7D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 20:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FCC10E53A;
	Mon, 25 Aug 2025 18:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="OBvBflmf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazolkn19011029.outbound.protection.outlook.com [52.103.66.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9938B10E537;
 Mon, 25 Aug 2025 18:40:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBahw/9kt/Dvd6VL9/N0/+9sIFI/Pd0pNPyuGfsnMpUYCA/JhT2HcL3/17q9My6GEFCYlCckNfeS9GXeXfTmolfLuytXbVuvx5byPS3xVYdeAwHQz3TRNoSJAQFwYZpa7lcgQ6x4Zni898jpQWr+uBxtWL2zb6qN7wyvC2Jpnga31OfHwzqJ0zYG6KvXpHFIgYe/W3XU0JrdTwe5nSRQH5XjB8PbcQPnkYvIn03Kd2SPfMjJxE8SJhieXTd9V15wYpFUC4A2ufpegNRAKVwRxtqa7KCaCAiB/yqQjgHyTCqQghr5nZwTUMh80Qj+aj1br6Y/7A0Kbcd3zmFcGUuLOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbfjENM4ILQfuisZ+FU54v7uK5nWrvxwCWztzb7uHwQ=;
 b=Cmys2+1H7E3gA1kfLr+1eULCLifspv6QhUWS/WJZJD1SO6m3JeTcRJBCJHSWc4fCM4E/ivRuwgHdlO0KFg4MiKNP9+GFtDv+Pp+9BS8x/dn4jUfV1/h7yZJZKuKucMjax4N5GdhhL7M71+pbLyR2LRMmaQLE5pe6aj8dWjuvhVkF1LYWZ3YGlbTJisMUZrIIbcOfXRaMIVJ8Rp97TAZ5GB2V6trsfhaISW3+nXDE6mIhD1PAvUqAIyr85f+xcni3dgbrSPvfCy0tj64NkB9SRVcT2zD7VE/tWVoTfgsHxOCyAfAGnIWJ/2ao/iBaNtyj8zofTp91LmniUP38xvRvLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbfjENM4ILQfuisZ+FU54v7uK5nWrvxwCWztzb7uHwQ=;
 b=OBvBflmfn00tdxwulX7dtdEmj9XEfDTZdacGq32yPaaSHl6TC5si4MgCD6obo8iu0cqsRYWH2JOFqxGQm6Vlois9YpGFyzG/KdvF4b9FEZjzWdf28CTOFsniNuAxrUUvLbIjREEvYS0vWcd8bmLjKKovaEfoSc+OP7uWi1QA1WxgZ8wYK0EPTYiGaZuKPLw43H4wfuOnX4+ABZWPYz+IE6DIaTHNL37xBF4M8FZZ1DN9wWd6oxGSMPGZXhjR4mTP09fz6p46zsKQBp1ZuwucMOkP7//iSoehZ5KZpkvyLHexnz8YKsThAQ+iH41m4o2TBdqfSCeHZ+FKVSb4Vx154w==
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10) by TY4PR01MB15954.jpnprd01.prod.outlook.com
 (2603:1096:405:2c8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 18:40:12 +0000
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f]) by TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f%7]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 18:40:12 +0000
From: Shengyu Qu <wiagn233@outlook.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, contact@rafaelrc.com, lijo.lazar@amd.com,
 jesse.zhang@amd.com, tim.huang@amd.com, dark_sylinc@yahoo.com.ar,
 mario.limonciello@amd.com, alex.hung@amd.com, aurabindo.pillai@amd.com,
 sunil.khatri@amd.com, chiahsuan.chung@amd.com, mwen@igalia.com,
 Roman.Li@amd.com, Wayne.Lin@amd.com, dominik.kaszewski@amd.com,
 alvin.lee2@amd.com, Aric.Cyr@amd.com, Austin.Zheng@amd.com,
 Sung.Lee@amd.com, PeiChen.Huang@amd.com, dillon.varone@amd.com,
 Richard.Chiang@amd.com, ryanseto@amd.com, linux@treblig.org,
 haoping.liu@amd.com, Relja.Vojvodic@amd.com, Yihan.Zhu@amd.com,
 Samson.Tam@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 wayland-devel@lists.freedesktop.org
Cc: Shengyu Qu <wiagn233@outlook.com>
Subject: [PATCH v2 1/2] drm/connector: Add "pixel_encoding" to switch between
 RGB & YUV color output modes
Date: Tue, 26 Aug 2025 02:40:00 +0800
Message-ID: <TY4PR01MB144322177A6B8D2D538DAC6E4983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825184001.6524-1-wiagn233@outlook.com>
References: <20250825184001.6524-1-wiagn233@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18)
 To TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10)
X-Microsoft-Original-Message-ID: <20250825184001.6524-2-wiagn233@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB14432:EE_|TY4PR01MB15954:EE_
X-MS-Office365-Filtering-Correlation-Id: 985fe0af-082e-409e-eb44-08dde406d2f8
X-MS-Exchange-SLBlob-MailProps: Cq7lScuPrnoyTIwSrGph0lItVprk4CpiH7KJDRsAndDzP1tOPusniPV+ybnc4Cwawdz2ElNnneRnZ6/bXkPf+/ENRe3W138gYSyRr3HrffO8s1B6a0+XpU7/1942BmzPBl3qyHBwtqcc54+qK8od5uqmELXchSYeLwm7OJK2BPfVKo7iufbPBM7x6N5s+4Bbxgc+aiD68q+uiwhHKGlmlI+k31k3kS8Cl0Z/bPxgOWDI/lIFxIM62JIO0YoZfw4ffUU57DLhMUv5brIcFfncVIV7a5BSX94HnV+Tz75QgPT8EJu5DagCmzyxxyeghmjNgeuWW2+ioja7jBYTLNZb/LCYYIq4tsAeOso9zuWlCVjsstMy2viMpW1Uv7YkCWj7zrLUwBEgf/AfmPb9be7pBaIjtB1YopLuQzic3QoLHckOgRIqmH3XodXKhRIrOGAp/mSPAXqrKhR2UP963pNUZ4KIir1hI136UBu3m4mlFHvGGJjE6KrkPNAsZVfKq76qsldo9StuqIJETLX5I7JGdn82yXtMh5AF0QbhCFdjk2VfvE0rqEVHJr/oe7kejvW9rNmx69c0dIm0wlrtVBKq+yGyzlhuEFV0Zso2UxcLmfZLON6e179N4GW1qz5nw845kayaHPDCjrLPMNwKs2H4RxPjgfswPM00qnUGrWkxvY4vsYriSDw/M/P1aVbojDMDcWZQYvwNXtz86GnBPG2KVnFBfp8wQqd0Hv48J96v0Lzi1rshziJP4KX7evu5+4LZJC4FzmFK3CA=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799015|19110799012|5072599009|41001999006|15080799012|461199028|23021999003|3412199025|40105399003|440099028|26104999006|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XIHb2dMBTHRl8ff9sfnvt65GsHAqF+gs3UYS1zY8D5H/d9atqX5bGX87orLR?=
 =?us-ascii?Q?D1PTJq4zjbmhMWNw5hAK/J3QAPtq3kVSHAR8LMhrbWeLk3Q/cYE6VntMSsY9?=
 =?us-ascii?Q?X3FMjchTz7A1bWoIpBlXQsVr4s8wT5En8Ty0XGhwMxrnzZNWW6SY7qcghwxr?=
 =?us-ascii?Q?jyP27QDX+1p66u/awH10ZXHh428VqF0vz7Lsjordwy/j16IbcTdadmGl2v4x?=
 =?us-ascii?Q?OwA/9OIx9FLMFk77l//+mmTgDWPs18a4E7QM+DApeAJSDMsNbi3SS3wiL3op?=
 =?us-ascii?Q?lG0BdH06Cngq1xWJMqxOXVydU950Rf74LulX8Ab8VuyK5LkhiwILYZ+fhRQU?=
 =?us-ascii?Q?A7RNBkwuxo50VcsJhmd5vHLKA9dQ475U0VHc8gUirGVKfCKtYokyiWn+fYWD?=
 =?us-ascii?Q?AU794tcKrMEdoEMJfVy2MdOsjz/Q79rFdIG4rcx10WYKLVg/z5JnJsauVJ0p?=
 =?us-ascii?Q?I6M15QfvM0hbM+fek4EEZklgjWRxONmAGAfW2ov6TjWkJ2LjetKLhmilw87h?=
 =?us-ascii?Q?+Uc4QRXwbGdPzhe3R7hVAabVyLCRs8IwhKmOsbepsXplQed6TPt7stW5hyX8?=
 =?us-ascii?Q?qDg/CRjCkshY56uXPVXbMD7cEaX2GR6EC4j5YpWrPD1vlSlbLmpy9y31boos?=
 =?us-ascii?Q?PNrlg/27zy1ATwsRxhze19xiVbfa26CyEvA7eiz92p94Bieb+YY+3L7fA+Ok?=
 =?us-ascii?Q?QQwPGFSS9U/hzCOBjTcXH8A1Fkc+C8LPY/0IZPLCAtNYJ0sVasTux0T7XrwW?=
 =?us-ascii?Q?UH9YoyCOZu7s4l5BEHG1XvX11HxyAeA1wnyWSjLz2JKktcYytwCydbumiu68?=
 =?us-ascii?Q?RfzRrjr1cRV61896lMh4ttgb4KGMP2UVzMCfg6bMf6xn4jPDHIDndX99eneS?=
 =?us-ascii?Q?gZ5FmoFqBsMktKYHoKl9c/8HjrmDU8Tnke8evAbEsYTY5fdf4CaOX8u7Benx?=
 =?us-ascii?Q?NDYXQAOXbNkD43v1Cnhz7haMDGEwdmHhe0LQ5B3BI7iSIvGde5W+/pZzzUgO?=
 =?us-ascii?Q?ndwU+FkVpysz0TSVIJdSm1rwUx2VcIBhGfDobx/Wq2wGK/DJ5bq1FAvvB+k4?=
 =?us-ascii?Q?O9e3B+cSf3ltarlNwi7LuxsHBEwBGxqLsg2G4T65XpXG8/SfWEyhW8+IiHa2?=
 =?us-ascii?Q?pH4Q6eJ1MCC/dcjD7dgc49MRY+p1izFVeJJX2YETDggDyg6jxrB7M778SpzW?=
 =?us-ascii?Q?gjD1AtKEuxiS005jugmHhcm8eYXwr5KLaDhb7gBlbDy13Aa+G380FmYEKvU?=
 =?us-ascii?Q?=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?orli9Sfo18garhkDePKi/I74Ku6nIDihIx26ojbRI0zwJfbVZSp+ddFURF6I?=
 =?us-ascii?Q?g8YOtuOx8NdYYuvRSu+dVV772RbSeftqvystu/+os8o3VEz7ikL4C/nIBK6H?=
 =?us-ascii?Q?bsuGi3AeusTzUzh5EXaq1fzvDfErOipP9B21XY6ubk/iIVxnhdjdFEpMDRwN?=
 =?us-ascii?Q?py7Wei/9tdg72aJLDDaEqTerTmTEdNUW/ZLDRJ2EaH/aTkHC6/b342ZBRc6G?=
 =?us-ascii?Q?NXHbCyJpQOwmXXK+6qv7Ijb4ZyZH7lhqvP56aO/fU2e4kOEjgsGtF1BXxTO3?=
 =?us-ascii?Q?pAf4Q9i8WLnQYifIrDlhLN8VLByzrLor7wYLWTuNEvikO7SNo2Ga11IeUtdI?=
 =?us-ascii?Q?Bf9O/KoQ7gsHU45MCwJVrAmpfK5JU57QeDUcQW1fbWYbf09r+r839kD6M7tV?=
 =?us-ascii?Q?C6uFTuMlj0cQlfdXNxoVga62mHoN2xPUKxWSYTQjBUCS1v3HEHPsVPoPSPQ1?=
 =?us-ascii?Q?AfYL+wiivv0i7VfJyFdnV0grhTjvS2kE4HofrkDnU1Vz4ZG7QF5fsmqeo09e?=
 =?us-ascii?Q?2OzdkUJWhv4LH5w83D88rPm5uiiqq+sHTgsCj3aiYHqIsHctNas3tgky/Y0i?=
 =?us-ascii?Q?Jk+GBfO/+9gHiTITnezP5u300fJ5nVwbufzEtk5jz5c380uNPJxqfbYIZ+1O?=
 =?us-ascii?Q?BTAxopmBCcXhwVrrLUezUbydNgFWV7GZDrIWXyzNMIAFEJeZbzVzoTr6nUmm?=
 =?us-ascii?Q?moDv9EXvpIEk1Nr/KfjKGtiCfYyyfno/tH6en3+xdClUC/kpzzywTudoFIrp?=
 =?us-ascii?Q?YpCzpZukJO6m/6svpdVQ8F5Fmn8nRjVtwqjJYX7JrtEyTTLMpKSxmUZkHdhi?=
 =?us-ascii?Q?MRlEm4/DFB2dLEnplC0jjUHnkoGFTe/wQ/R+9phus/xF7sn9Aw8BIxGT9o8i?=
 =?us-ascii?Q?3welbp9P/+b17D9PSHgiXNxac3OhACqqSNWCdHc9Mp/mNqt7KCIjCHWK8XlX?=
 =?us-ascii?Q?HHREJqe6G6Gi/7vYp0Ji8OdCNnRuZBs6ky0piJzn4LhZNcP15NuKDIRmjspv?=
 =?us-ascii?Q?ObuzFu2A/uZRcJpluTi+H07HIt6hIN/2k+IbdKC146Kx3mkEu/sg4Aj2fGpE?=
 =?us-ascii?Q?1YLO5HZb3sY7h9mp48ntOurjjMpIdkoRAkXXaws25BZkRxo/1IrPIFcqeIW5?=
 =?us-ascii?Q?I3no3E2RiaEXr9ARoLGrT2QxulNnVGaiihhzSfmQ7IhmkHvEhSezM5mAeBKZ?=
 =?us-ascii?Q?1eoMI2LXB0hxWlFBJlHIwyfAH/jSOWVf+YQSgvkPfR8qoAr56Uc9xrVKD9KS?=
 =?us-ascii?Q?lOVzKN2O5Am/Nbg8EArq6bNxClKq7HEEP28tI+xXRoqXUpdmGdzUotHWPTB/?=
 =?us-ascii?Q?BrQ=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985fe0af-082e-409e-eb44-08dde406d2f8
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14432.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 18:40:12.0048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15954
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

This patch adds "pixel_encoding" connector property, which allows user to
switch to different pixel encodings. This is useful and could solve some
problems that auto switch would do something wrong(Basically because of
wrong EDID info).

Supported encodings are: "auto" (0) (Default and original behavior), "rgb"
(1), "ycbcr444" (2), "ycbcr422" (4), and "ycbcr420" (8).

Signed-off-by: Matias N. Goldberg <dark_sylinc@yahoo.com.ar>
Signed-off-by: Rafael Carvalho <contact@rafaelrc.com>
Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
---
 drivers/gpu/drm/drm_modes.c | 32 ++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h |  7 +++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index e72f855fc495..ac2265e71b00 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2162,6 +2162,35 @@ static int drm_mode_parse_tv_mode(const char *delim,
 	return 0;
 }
 
+static int drm_mode_parse_pixel_encoding(const char *delim,
+					 struct drm_cmdline_mode *mode)
+{
+	const char *value;
+
+	if (*delim != '=')
+		return -EINVAL;
+
+	value = delim + 1;
+	delim = strchr(value, ',');
+	if (!delim)
+		delim = value + strlen(value);
+
+	if (!strncmp(value, "auto", delim - value))
+		mode->pixel_encoding = 0;
+	else if (!strncmp(value, "rgb", delim - value))
+		mode->pixel_encoding = DRM_COLOR_FORMAT_RGB444;
+	else if (!strncmp(value, "ycbcr444", delim - value))
+		mode->pixel_encoding = DRM_COLOR_FORMAT_YCBCR444;
+	else if (!strncmp(value, "ycbcr422", delim - value))
+		mode->pixel_encoding = DRM_COLOR_FORMAT_YCBCR422;
+	else if (!strncmp(value, "ycbcr420", delim - value))
+		mode->pixel_encoding = DRM_COLOR_FORMAT_YCBCR420;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
 static int drm_mode_parse_cmdline_options(const char *str,
 					  bool freestanding,
 					  const struct drm_connector *connector,
@@ -2234,6 +2263,9 @@ static int drm_mode_parse_cmdline_options(const char *str,
 		} else if (!strncmp(option, "tv_mode", delim - option)) {
 			if (drm_mode_parse_tv_mode(delim, mode))
 				return -EINVAL;
+		} else if (!strncmp(option, "pixel_encoding", delim - option)) {
+			if (drm_mode_parse_pixel_encoding(delim, mode))
+				return -EINVAL;
 		} else {
 			return -EINVAL;
 		}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f13d597370a3..fdaa86d25d6d 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1723,6 +1723,13 @@ struct drm_cmdline_mode {
 	 * Did the mode have a preferred TV mode?
 	 */
 	bool tv_mode_specified;
+
+	/**
+	 * @pixel_encoding:
+	 *
+	 * Output pixel format encoding.
+	 */
+	unsigned int pixel_encoding;
 };
 
 /**
-- 
2.43.0

