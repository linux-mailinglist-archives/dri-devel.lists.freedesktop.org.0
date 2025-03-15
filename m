Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8E8A632B8
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 23:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB5310E06C;
	Sat, 15 Mar 2025 22:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWKsZyXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C9710E06C
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 22:42:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FMcIuQ010812
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 22:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=a4VP+ST8zJUe4Vt7FHkhIgto
 mXUT8+RrYva/Is+uJ7k=; b=ZWKsZyXUQzeMhygtovDXQMdapuNqo/+MprZKbLEO
 h2SSGsQ6mlYc0clW2WSBQnsHN1qzd1tmqFoMgfO3yB4Y0w5NBtbxTiK/+LiJrfqz
 vsIaB/Eozm8Y/q1Rd417QKRzxM75aI5sSEagaNPVzZ8fffHm/Nkp9kVGyPs8g0n/
 HtZJzhaD0JrMvtSFqkqOFRluTlRtZXtStB/rIm81I5QFdaLXI5ZYOxs+IEdPoQBm
 2oh9i0vwnjquqP3jBw1wLb4wMkLIGO5/DIw5JoTGlYlOHWk4U2F5CXVzgdkWwPgL
 fqp9sdPsQAvw6LV1wKpcXI1guc/6/U2xDcxujrKA0IjlxA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1rdhb54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 22:42:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8ec18a29aso41180446d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 15:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742078549; x=1742683349;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4VP+ST8zJUe4Vt7FHkhIgtomXUT8+RrYva/Is+uJ7k=;
 b=o2FvD7uQ/a3IFOES56YTF2xMTJZPLfmBOz8784PqrVOdI25AsipbeFt2nzq1MvdDpy
 44MPEIduWlMqL91jDmmLjzOgj42m+yrMHaRik09Hz9FNb4l6xC3MJo67tRkbpss8/nUx
 z2/j/nyISAKlzttnYIndoATEKaFoA48+Brg3p/fMB/6crL8l5SNJvoXWjNERre4tT9vg
 i3Q3zAcai8jCqzA8lqKfTBOmPlWkvaBEmha4lnQRZkUzzDpWj9dGnqBimMd/kLK1FE27
 fdGykq7taDT5uWjsv4vXotpv8GmhbXs+s2/9rvtiL7/ahuMUyVlp937/A5OPwVcRa3Ok
 9hEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpI7xwkSi4/S9Ui3NeAUpgZgSzojf9OgJq0k5TmrKY+HVTiM0qEt1CDYxCKxP6qP/slfLJNFoPe8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdCG0riLFHe5oqxyRCIE+E5mo+p7voKYC0tq2aj83UPkg5Ewg9
 SGO2EC1S/wuM7qPYciKDVpCpcvoXUgXzKbVHpZGfboxOLWXYDLRIaE17NjWyyfuNjp4nMB8JiJs
 yf277LhKKYhrNy6e+4uGhf6QK57hsN/biXmgjtoJAAVjPU4niiQxZy3Xq3n2W5N9FNlU=
X-Gm-Gg: ASbGncsb1mXu5+pyH9Yxddzrvx+CEIKDEdZOZ/Qw+/6Fsik1lDyjKQxAelV+LyM4+h4
 4UMCwXU4vDVD/Brd01GNvnRgE4K7TdOpZVUAHCC/GnHXpzjpzg18Sz4KgYniKAGUZmzK+slY4P2
 AhMXWkRD4N713a6Makk6O4TPYgYo7dH8wN85VSmpgT4h1G3h93l2mKLgYs76bypJ1f0kA1GHtOA
 pW0PzSlhWtgxdDy4Q1l/n+1jIoXGcIgul0AVzkKKTaBs1kiYh8JnR1BCq7+DFrNqHyXtUmmfSn9
 rY0eK773O177LxEfpVyvm1waK41vA08RUDvkfxqfl1klEKhSHv+cJJt9gQGC8MoKueel4ZsXBXh
 fhRM=
X-Received: by 2002:ad4:4eae:0:b0:6e4:4288:61a3 with SMTP id
 6a1803df08f44-6eaeaa4adfemr126359886d6.18.1742078549084; 
 Sat, 15 Mar 2025 15:42:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG98Oj8QM/IR/65YbmgcZO+Xpaf4lvqnTld3JQQKuBpCLyMozz4NlGGXLOmCUY0gEPhfks78w==
X-Received: by 2002:ad4:4eae:0:b0:6e4:4288:61a3 with SMTP id
 6a1803df08f44-6eaeaa4adfemr126359486d6.18.1742078548569; 
 Sat, 15 Mar 2025 15:42:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f1dc0dfsm10665811fa.105.2025.03.15.15.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 15:42:26 -0700 (PDT)
Date: Sun, 16 Mar 2025 00:42:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFT v2] drm/bridge: ite-it6505: make use of debugfs_init
 callback
Message-ID: <xd3purmdhn34guhconvpuvw5n7nfhkt2vg4c3pdyn6f4ksgu25@ssxzqbysngww>
References: <20250315201946.7428-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315201946.7428-2-wsa+renesas@sang-engineering.com>
X-Authority-Analysis: v=2.4 cv=Fe83xI+6 c=1 sm=1 tr=0 ts=67d60256 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=LDBv8-xUAAAA:8 a=pLwtzlPVTVScF5mX-VMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-ORIG-GUID: CzMKvtvfc-IDt4XkUeP2Vm3vYYeg79t9
X-Proofpoint-GUID: CzMKvtvfc-IDt4XkUeP2Vm3vYYeg79t9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_09,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150167
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

On Sat, Mar 15, 2025 at 09:17:16PM +0100, Wolfram Sang wrote:
> Do not create a custom directory in debugfs-root, but use the
> debugfs_init callback to create a custom directory at the given place
> for the bridge.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Only build tested, but following the same pattern as the tested
> ti-sn65dsi86.
> 
> Changes since v1:
> * switch from 'client->debugfs' to DRM 'debugfs_init' callback
> 
>  drivers/gpu/drm/bridge/ite-it6505.c | 59 ++++++++++-------------------
>  1 file changed, 19 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 88ef76a37fe6..803bfe9954e6 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -302,7 +302,6 @@
>  #define WORD_LENGTH_18BIT 1
>  #define WORD_LENGTH_20BIT 2
>  #define WORD_LENGTH_24BIT 3
> -#define DEBUGFS_DIR_NAME "it6505-debugfs"
>  #define READ_BUFFER_SIZE 400
>  
>  /* Vendor option */
> @@ -478,7 +477,6 @@ struct it6505 {
>  	struct device *codec_dev;
>  	struct delayed_work delayed_audio;
>  	struct it6505_audio_data audio;
> -	struct dentry *debugfs;
>  
>  	/* it6505 driver hold option */
>  	bool enable_drv_hold;
> @@ -3302,21 +3300,6 @@ static const struct drm_edid *it6505_bridge_edid_read(struct drm_bridge *bridge,
>  	return drm_edid_dup(it6505->cached_edid);
>  }
>  
> -static const struct drm_bridge_funcs it6505_bridge_funcs = {
> -	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> -	.atomic_reset = drm_atomic_helper_bridge_reset,
> -	.attach = it6505_bridge_attach,
> -	.detach = it6505_bridge_detach,
> -	.mode_valid = it6505_bridge_mode_valid,
> -	.atomic_enable = it6505_bridge_atomic_enable,
> -	.atomic_disable = it6505_bridge_atomic_disable,
> -	.atomic_pre_enable = it6505_bridge_atomic_pre_enable,
> -	.atomic_post_disable = it6505_bridge_atomic_post_disable,
> -	.detect = it6505_bridge_detect,
> -	.edid_read = it6505_bridge_edid_read,
> -};
> -
>  static __maybe_unused int it6505_bridge_resume(struct device *dev)
>  {
>  	struct it6505 *it6505 = dev_get_drvdata(dev);
> @@ -3574,36 +3557,34 @@ static const struct debugfs_entries debugfs_entry[] = {
>  	{ NULL, NULL },
>  };
>  
> -static void debugfs_create_files(struct it6505 *it6505)
> +static void it6505_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
>  {
> +	struct it6505 *it6505 = bridge_to_it6505(bridge);
> +	struct dentry *debugfs = debugfs_create_dir(dev_name(it6505->dev), root);
>  	int i = 0;
>  
>  	while (debugfs_entry[i].name && debugfs_entry[i].fops) {
>  		debugfs_create_file(debugfs_entry[i].name, 0644,
> -				    it6505->debugfs, it6505,
> -				    debugfs_entry[i].fops);
> +				    debugfs, it6505, debugfs_entry[i].fops);
>  		i++;
>  	}
>  }

Ni: I'd say, it's better to move this function rather than moving
it6505_bridge_funcs. LGTM otherwise.

>  
> -static void debugfs_init(struct it6505 *it6505)
> -{
> -	struct device *dev = it6505->dev;
> -
> -	it6505->debugfs = debugfs_create_dir(DEBUGFS_DIR_NAME, NULL);
> -
> -	if (IS_ERR(it6505->debugfs)) {
> -		dev_err(dev, "failed to create debugfs root");
> -		return;
> -	}
> -
> -	debugfs_create_files(it6505);
> -}
> -
> -static void it6505_debugfs_remove(struct it6505 *it6505)
> -{
> -	debugfs_remove_recursive(it6505->debugfs);
> -}
> +static const struct drm_bridge_funcs it6505_bridge_funcs = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.attach = it6505_bridge_attach,
> +	.detach = it6505_bridge_detach,
> +	.mode_valid = it6505_bridge_mode_valid,
> +	.atomic_enable = it6505_bridge_atomic_enable,
> +	.atomic_disable = it6505_bridge_atomic_disable,
> +	.atomic_pre_enable = it6505_bridge_atomic_pre_enable,
> +	.atomic_post_disable = it6505_bridge_atomic_post_disable,
> +	.detect = it6505_bridge_detect,
> +	.edid_read = it6505_bridge_edid_read,
> +	.debugfs_init = it6505_debugfs_init,
> +};
>  
>  static void it6505_shutdown(struct i2c_client *client)
>  {
> @@ -3689,7 +3670,6 @@ static int it6505_i2c_probe(struct i2c_client *client)
>  		it6505_poweron(it6505);
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "it6505 device name: %s", dev_name(dev));
> -	debugfs_init(it6505);
>  	pm_runtime_enable(dev);
>  
>  	it6505->aux.name = "DP-AUX";
> @@ -3712,7 +3692,6 @@ static void it6505_i2c_remove(struct i2c_client *client)
>  
>  	drm_bridge_remove(&it6505->bridge);
>  	drm_dp_aux_unregister(&it6505->aux);
> -	it6505_debugfs_remove(it6505);
>  	it6505_poweroff(it6505);
>  	it6505_remove_edid(it6505);
>  }
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
