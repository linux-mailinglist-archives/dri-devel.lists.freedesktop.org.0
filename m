Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4BBA08DB6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 11:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D1410F05A;
	Fri, 10 Jan 2025 10:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="wvpugXPI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D256210F05A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 10:18:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A7RkRP025601;
 Fri, 10 Jan 2025 10:26:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=fVpk+5d+aUq4dE7U3H7XuMNH
 86mBRUVN3YH6VPCeM5k=; b=wvpugXPIbFoLhm7ZtPsJK1sDkNJFg4JwlAlN7qdH
 8FGcocPbj7lziw6EVb4sKcE4QdZgfwVCclQTEqXM1kOx1urwyvwLB/Ud2MKtX45F
 O2xMdw7QxxnJgFU18ozKVRz85ErtcR6TcRAfQcR2hpAAdJBV+zpXxQRbdibOSjI7
 1IUXp6jNUz49z2HCoZ8SFg5x8qGHrA+XjpFq+6yANRjnPSTrBonE96DAO7mZVocU
 lYwuY3yE0oZPeqUogTsXxr/ytz70Vd8cZiKfQelyUEk9WNsQncwueqoWzB44Q7g1
 TbRkdpf2zkD34muFbbMPh2W3VUuoFnw+DGgUKZcDg5FyiQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 442mw0j9py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2025 10:26:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BDFB840054;
 Fri, 10 Jan 2025 10:24:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E30528A885;
 Fri, 10 Jan 2025 10:22:22 +0100 (CET)
Received: from [10.252.28.181] (10.252.28.181) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 10 Jan
 2025 10:22:21 +0100
Content-Type: multipart/alternative;
 boundary="------------oTpMEcdj0Z5wCOh9C3Uag3sF"
Message-ID: <5fec34de-015a-4d89-ad15-d065574193ab@foss.st.com>
Date: Fri, 10 Jan 2025 10:22:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
To: Sean Nyekjaer <sean@geanix.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Raphael
 Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
X-Originating-IP: [10.252.28.181]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
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

--------------oTpMEcdj0Z5wCOh9C3Uag3sF
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sean,

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>

Thanks for this patch,

Yannick

Le 25/11/2024 à 14:49, Sean Nyekjaer a écrit :
> Check if the required pixel clock is in within .5% range of the
> desired pixel clock.
> This will match the requirement for HDMI where a .5% tolerance is allowed.
>
> Signed-off-by: Sean Nyekjaer<sean@geanix.com>
> ---
>   drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
>   include/drm/drm_modes.h     |  2 ++
>   2 files changed, 36 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efde6e4d977b297f5d5359 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
>   }
>   EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
>   
> +/**
> + * drm_mode_validate_mode
> + * @mode: mode to check
> + * @rounded_rate: output pixel clock
> + *
> + * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
> + * CVT spec reuses that tolerance in its examples, so it looks to be a
> + * good default tolerance for the EDID-based modes. Define it to 5 per
> + * mille to avoid floating point operations.
> + *
> + * Returns:
> + * The mode status
> + */
> +enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
> +					    unsigned long long rounded_rate)
> +{
> +	enum drm_mode_status status;
> +	unsigned long long rate = mode->clock * 1000;
> +	unsigned long long lowest, highest;
> +
> +	lowest = rate * (1000 - 5);
> +	do_div(lowest, 1000);
> +	if (rounded_rate < lowest)
> +		return MODE_CLOCK_LOW;
> +
> +	highest = rate * (1000 + 5);
> +	do_div(highest, 1000);
> +	if (rounded_rate > highest)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +EXPORT_SYMBOL(drm_mode_validate_mode);
> +
>   static enum drm_mode_status
>   drm_mode_validate_basic(const struct drm_display_mode *mode)
>   {
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index b9bb92e4b0295a5cbe0eb0da13e77449ff04f51d..4b638992f3e50d2aba5088644744457d72dbe10a 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -549,6 +549,8 @@ bool drm_mode_equal_no_clocks(const struct drm_display_mode *mode1,
>   			      const struct drm_display_mode *mode2);
>   bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
>   					const struct drm_display_mode *mode2);
> +enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
> +					    unsigned long long rounded_rate);
>   
>   /* for use by the crtc helper probe functions */
>   enum drm_mode_status drm_mode_validate_driver(struct drm_device *dev,
>
--------------oTpMEcdj0Z5wCOh9C3Uag3sF
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="moz-quote-pre" wrap="">Hi Sean,

<span style="white-space: normal">Tested-by: Yannick Fertre <a class="moz-txt-link-rfc2396E" href="mailto:yannick.fertre@foss.st.com">&lt;yannick.fertre@foss.st.com&gt;</a> </span></pre>
    <pre class="moz-quote-pre" wrap="">Thanks for this patch,

Yannick

</pre>
    <div class="moz-cite-prefix">Le 25/11/2024 à 14:49, Sean Nyekjaer a
      écrit :<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241125-dsi-relax-v2-1-9113419f4a40@geanix.com">
      <pre class="moz-quote-pre" wrap="">Check if the required pixel clock is in within .5% range of the
desired pixel clock.
This will match the requirement for HDMI where a .5% tolerance is allowed.

Signed-off-by: Sean Nyekjaer <a class="moz-txt-link-rfc2396E" href="mailto:sean@geanix.com">&lt;sean@geanix.com&gt;</a>
---
 drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_modes.h     |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efde6e4d977b297f5d5359 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
 }
 EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
 
+/**
+ * drm_mode_validate_mode
+ * @mode: mode to check
+ * @rounded_rate: output pixel clock
+ *
+ * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
+ * CVT spec reuses that tolerance in its examples, so it looks to be a
+ * good default tolerance for the EDID-based modes. Define it to 5 per
+ * mille to avoid floating point operations.
+ *
+ * Returns:
+ * The mode status
+ */
+enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
+					    unsigned long long rounded_rate)
+{
+	enum drm_mode_status status;
+	unsigned long long rate = mode-&gt;clock * 1000;
+	unsigned long long lowest, highest;
+
+	lowest = rate * (1000 - 5);
+	do_div(lowest, 1000);
+	if (rounded_rate &lt; lowest)
+		return MODE_CLOCK_LOW;
+
+	highest = rate * (1000 + 5);
+	do_div(highest, 1000);
+	if (rounded_rate &gt; highest)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+EXPORT_SYMBOL(drm_mode_validate_mode);
+
 static enum drm_mode_status
 drm_mode_validate_basic(const struct drm_display_mode *mode)
 {
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index b9bb92e4b0295a5cbe0eb0da13e77449ff04f51d..4b638992f3e50d2aba5088644744457d72dbe10a 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -549,6 +549,8 @@ bool drm_mode_equal_no_clocks(const struct drm_display_mode *mode1,
 			      const struct drm_display_mode *mode2);
 bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
 					const struct drm_display_mode *mode2);
+enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
+					    unsigned long long rounded_rate);
 
 /* for use by the crtc helper probe functions */
 enum drm_mode_status drm_mode_validate_driver(struct drm_device *dev,

</pre>
    </blockquote>
  </body>
</html>

--------------oTpMEcdj0Z5wCOh9C3Uag3sF--
