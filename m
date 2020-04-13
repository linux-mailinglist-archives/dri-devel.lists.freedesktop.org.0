Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C798B1A7437
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A3B6E46B;
	Tue, 14 Apr 2020 07:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A66E89D49
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 11:36:34 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03DBYvqL025875; Mon, 13 Apr 2020 07:36:15 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com with ESMTP id 30b7r5y2kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Apr 2020 07:36:15 -0400
Received: from SCSQMBX10.ad.analog.com (scsqmbx10.ad.analog.com [10.77.17.5])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 03DBaD4G041729
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
 verify=FAIL); Mon, 13 Apr 2020 07:36:13 -0400
Received: from SCSQCASHYB7.ad.analog.com (10.77.17.133) by
 SCSQMBX10.ad.analog.com (10.77.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 13 Apr 2020 04:36:12 -0700
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQCASHYB7.ad.analog.com (10.77.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 13 Apr 2020 04:36:12 -0700
Received: from zeus.spd.analog.com (10.64.82.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Mon, 13 Apr 2020 04:36:11 -0700
Received: from localhost.localdomain ([10.48.65.12])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 03DBa4qQ004884;
 Mon, 13 Apr 2020 07:36:05 -0400
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [v2 1/2] drm: bridge: adv7511: Enable SPDIF DAI
Date: Mon, 13 Apr 2020 14:35:07 +0300
Message-ID: <20200413113513.86091-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-13_05:2020-04-13,
 2020-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=1 phishscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=857 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004130085
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Richard Fontana <rfontana@redhat.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ADV7511 support I2S or SPDIF as audio input interfaces. This commit
enable support for SPDIF.

Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index a428185be2c1..1e9b128d229b 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -119,6 +119,9 @@ int adv7511_hdmi_hw_params(struct device *dev, void *data,
 		audio_source = ADV7511_AUDIO_SOURCE_I2S;
 		i2s_format = ADV7511_I2S_FORMAT_LEFT_J;
 		break;
+	case HDMI_SPDIF:
+		audio_source = ADV7511_AUDIO_SOURCE_SPDIF;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -175,11 +178,21 @@ static int audio_startup(struct device *dev, void *data)
 	/* use Audio infoframe updated info */
 	regmap_update_bits(adv7511->regmap, ADV7511_REG_GC(1),
 				BIT(5), 0);
+	/* enable SPDIF receiver */
+	if (adv7511->audio_source == ADV7511_AUDIO_SOURCE_SPDIF)
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,
+				   BIT(7), BIT(7));
+
 	return 0;
 }
 
 static void audio_shutdown(struct device *dev, void *data)
 {
+	struct adv7511 *adv7511 = dev_get_drvdata(dev);
+
+	if (adv7511->audio_source == ADV7511_AUDIO_SOURCE_SPDIF)
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,
+				   BIT(7), 0);
 }
 
 static int adv7511_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
@@ -213,6 +226,7 @@ static const struct hdmi_codec_pdata codec_data = {
 	.ops = &adv7511_codec_ops,
 	.max_i2s_channels = 2,
 	.i2s = 1,
+	.spdif = 1,
 };
 
 int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
