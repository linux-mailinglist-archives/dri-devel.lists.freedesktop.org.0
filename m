Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B0AACD1E3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 03:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D1010E98B;
	Wed,  4 Jun 2025 01:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfDOv9n/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DBC10E98B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 01:00:57 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5540FTM1014030
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Jun 2025 01:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0TETAATiddWzakLFXxA2ygfNXSpGYQL0mslL+m00Hv0=; b=KfDOv9n/FEv4i8he
 fflq8LJHKIWs5r2ZtT6clTopgklO/bcRy4s4yFLfpCyUpINpnS0ainmKSLfxeGFL
 TBdEdOBqcwa5g+JMYJivqjOnLvTSYXZIDlNIl1z/AGf94qjSYtDwy5hUxof5gDkr
 VAsWqhRVRag180o6R8GgNAVUaWu1DcB2Hj2iW1+If6npOPZq56UjhXj9ddf7oDMJ
 IgS2QlhxEiwlR4/LRr9lnRggeXRcLJvDk8moGsKOD5i+GjLUcKobPxkPUfFVhZ3p
 UvMAzr3EBUVqpHf2bXzl83AFQCfQk+BzLFtWYNETNiU1BwVrhc9wD57yQ0e8KlWk
 7DgXgw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be802h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 01:00:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-310a0668968so5973301a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 18:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748998856; x=1749603656;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0TETAATiddWzakLFXxA2ygfNXSpGYQL0mslL+m00Hv0=;
 b=UuRWMeqT9kMyrDmddugu9xtq02+3yzGLEAaWUlOgTgj9P7KGszpPy/dF0EAH5a+e+g
 xUzhWbbcxbu1t8h8boHUNRQUYtnQfa7QUsVYjkPkfakl1nRmzC+daaIyxogEW/KHKTGK
 VnJl4UHJoI0i4BNhLDw2Fo4ky9omU/ufQ9wCe9Lg9p4t58cIvXgioE79ivk9/Si76C5l
 evDilTiPyfLPpfyrch9sayWwwM9iilzC20iQ11+6no+VB5mf8ffvKB5BB1ai44qd7MJi
 OZ/b+di1j8FqfMDKiaxBXz53m5ZBGZTOZYkRbecr4TDrCXfkDWb+Mja8S+9w60AuJ4yn
 Y4sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxuRKLcD99dxVrOJNSArmJdpyGd8Ad6JL5Njaaix2bwmhrMcUM9nc2iXZWxDptcKwMyKzYss/lCz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzBT4r6Bnj8yMrOPYrSmwMMZGi9J+/6Q0AlsXOonpm7STKoKm3
 FAOmx/8e9H3hT5xrAqrx014VZrz5EzXt3cxPiDUQ8Ax+N5w59FNr/RAeWZbTlLP/FBVW98qjYJq
 bKe04dk9zCawNNPHuNabz1pjDi5CiWDy8J0+SXvHVncWGwWlFnlVmDBNTBrRBhfyvlwL3bck=
X-Gm-Gg: ASbGncsjYJtNvK4A6mvRTly8oGjAMwBmnynhZHyUyuSRisN2eVEw1+Rdsh6jSrl4Y9T
 jS4AAQEi6Bs1Q8NDAUHNlj2Ir0TrtKMQ6i26LxkSvNgH7ppTzBFNdivU2AbrHO58g61ASv57LDu
 pS+utpxbkia+g6gmpwfEA7qCBG/9ns1AGS6xub+zAp1N8gsJZKngRSxjn+3h2ED4EoEU4lelBx9
 ISS56Zq/0MayXJDlic+G+Q2BGR9fCaHTNsYgBzB/pFcwPggBhLQ8uBE7SEK/c2hS4E1RUElmYA5
 3zSCzhHkp5Ycpuz84sgtCkHMfiTh9oDUG75/AmTBSM2Z3H7szG7PaQPinmB/atlm7ajlEg==
X-Received: by 2002:a17:90b:2782:b0:312:f88d:25f8 with SMTP id
 98e67ed59e1d1-3130ce68aa8mr1203967a91.22.1748998855853; 
 Tue, 03 Jun 2025 18:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmRSfbGMmhaR3Ku/yZIh4G0/5XqUOhfKtwOObaYX7P945BS23NiZee6UUPyQNOtYh7bFlVUQ==
X-Received: by 2002:a17:90b:2782:b0:312:f88d:25f8 with SMTP id
 98e67ed59e1d1-3130ce68aa8mr1203911a91.22.1748998855246; 
 Tue, 03 Jun 2025 18:00:55 -0700 (PDT)
Received: from [10.71.109.39] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e30c697sm7881399a91.36.2025.06.03.18.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 18:00:54 -0700 (PDT)
Message-ID: <cd47f14c-908c-4fa9-97eb-d2db4c90be1b@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 18:00:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/panel: himax-hx8394: Add Support for Huiling
 hl055fhav028c
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 sebastian.reichel@collabora.com, heiko@sntech.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, quic_jesszhan@quicinc.com,
 neil.armstrong@linaro.org, javierm@redhat.com, megi@xff.cz,
 Chris Morgan <macromorgan@hotmail.com>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
 <20250603193930.323607-4-macroalpha82@gmail.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250603193930.323607-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=683f9ac9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=69EAbJreAAAA:8 a=COk6AnOGAAAA:8
 a=cXo1RV5oYOhoEnHjMz0A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pIDeCorvlUZvtf6OR7CxxGRH9caGvGds
X-Proofpoint-ORIG-GUID: pIDeCorvlUZvtf6OR7CxxGRH9caGvGds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDAwNSBTYWx0ZWRfX0h2KDlAkZRTG
 V6LYXfPCv2uZBCiwmGqaEGP6L9Tv5SNfoMKVQlPtY/LjQSOl3CfuA7nRfSKzjewjor/4Cb98C45
 OD8ZLfKnrbJHZUax/UxTJLXx4IWtw/AMxx+O9hN0FcPSaACAuqGyzsnr8yZUNR2t57GKFbtSrSr
 nOKPVmnxF2I92K9FhAsN53whfA5y76mWAZ+oDN04gwBMblu8r8hZSHRZJFYkxcFZBctoErf5zHn
 qXdnIj+aJlBJEraH8SbMRA0Zkx1A1MyO05nHGlTsEOlqyFj17PVq+ZfTRKlP4pKKXoMLAX5szng
 kiOX2LuTZCiZH5RkJxgqtEyOdj8Snwpw0J6bW2BpL6LRqfQUZPlAvyfgcvCq3epOn7YhghfOoLt
 3AghknLG/opSBLAC4z/Wh0/pJ7JbZsMwWuhuRXkzZr5NRPVkMPL4kj9xBbjjTtoj/qhIN044
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040005
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



On 6/3/2025 12:39 PM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Huiling hl055fhav028c panel as used on the
> Gameforce Ace handheld gaming console. This panel uses a Himax HX8399C
> display controller and requires a sparsely documented vendor provided
> init sequence. The display resolution is 1080x1920 and is 70mm by 127mm
> as stated in the manufacturer's documentation.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-himax-hx8394.c | 142 +++++++++++++++++++++
>   1 file changed, 142 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> index ff994bf0e3cc..16e450b156b7 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> @@ -477,6 +477,147 @@ static const struct hx8394_panel_desc mchp_ac40t08a_desc = {
>   	.init_sequence = mchp_ac40t08a_init_sequence,
>   };
>   
> +/*
> + * HL055FHAV028C is based on Himax HX8399, so datasheet pages are
> + * slightly different than HX8394 based panels.
> + */
> +static void hl055fhav028c_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	/* 6.3.6 SETEXTC: Set extension command (B9h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETEXTC,
> +				     0xff, 0x83, 0x99);
> +
> +	/* 6.3.17 SETOFFSET: Set offset voltage (D2h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETOFFSET,
> +				     0x77);
> +
> +	/* 6.3.1 SETPOWER: Set power (B1h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPOWER,
> +				     0x02, 0x04, 0x74, 0x94, 0x01, 0x32,
> +				     0x33, 0x11, 0x11, 0xab, 0x4d, 0x56,
> +				     0x73, 0x02, 0x02);
> +
> +	/* 6.3.2 SETDISP: Set display related register (B2h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETDISP,
> +				     0x00, 0x80, 0x80, 0xae, 0x05, 0x07,
> +				     0x5a, 0x11, 0x00, 0x00, 0x10, 0x1e,
> +				     0x70, 0x03, 0xd4);
> +
> +	/* 6.3.3 SETCYC: Set display waveform cycles (B4h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETCYC,
> +				     0x00, 0xff, 0x02, 0xc0, 0x02, 0xc0,
> +				     0x00, 0x00, 0x08, 0x00, 0x04, 0x06,
> +				     0x00, 0x32, 0x04, 0x0a, 0x08, 0x21,
> +				     0x03, 0x01, 0x00, 0x0f, 0xb8, 0x8b,
> +				     0x02, 0xc0, 0x02, 0xc0, 0x00, 0x00,
> +				     0x08, 0x00, 0x04, 0x06, 0x00, 0x32,
> +				     0x04, 0x0a, 0x08, 0x01, 0x00, 0x0f,
> +				     0xb8, 0x01);
> +
> +	/* 6.3.18 SETGIP0: Set GIP Option0 (D3h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP0,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x06, 0x00, 0x00, 0x10, 0x04, 0x00,
> +				     0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x01,
> +				     0x00, 0x05, 0x05, 0x07, 0x00, 0x00,
> +				     0x00, 0x05, 0x40);
> +
> +	/* 6.3.19 Set GIP Option1 (D5h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP1,
> +				     0x18, 0x18, 0x19, 0x19, 0x18, 0x18,
> +				     0x21, 0x20, 0x01, 0x00, 0x07, 0x06,
> +				     0x05, 0x04, 0x03, 0x02, 0x18, 0x18,
> +				     0x18, 0x18, 0x18, 0x18, 0x2f, 0x2f,
> +				     0x30, 0x30, 0x31, 0x31, 0x18, 0x18,
> +				     0x18, 0x18);
> +
> +	/* 6.3.20 Set GIP Option2 (D6h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGIP2,
> +				     0x18, 0x18, 0x19, 0x19, 0x40, 0x40,
> +				     0x20, 0x21, 0x02, 0x03, 0x04, 0x05,
> +				     0x06, 0x07, 0x00, 0x01, 0x40, 0x40,
> +				     0x40, 0x40, 0x40, 0x40, 0x2f, 0x2f,
> +				     0x30, 0x30, 0x31, 0x31, 0x40, 0x40,
> +				     0x40, 0x40);
> +
> +	/* 6.3.21 Set GIP Option3 (D8h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN4,
> +				     0xa2, 0xaa, 0x02, 0xa0, 0xa2, 0xa8,
> +				     0x02, 0xa0, 0xb0, 0x00, 0x00, 0x00,
> +				     0xb0, 0x00, 0x00, 0x00);
> +
> +	/* 6.3.9 Set register bank (BDh) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
> +				     0x01);
> +
> +	/* 6.3.21 Set GIP Option3 (D8h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN4,
> +				     0xb0, 0x00, 0x00, 0x00, 0xb0, 0x00,
> +				     0x00, 0x00, 0xe2, 0xaa, 0x03, 0xf0,
> +				     0xe2, 0xaa, 0x03, 0xf0);
> +
> +	/* 6.3.9 Set register bank (BDh) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
> +				     0x02);
> +
> +	/* 6.3.21 Set GIP Option3 (D8h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN4,
> +				     0xe2, 0xaa, 0x03, 0xf0, 0xe2, 0xaa,
> +				     0x03, 0xf0);
> +
> +	/* 6.3.9 Set register bank (BDh) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETREGBANK,
> +				     0x00);
> +
> +	/* 6.3.4 SETVCOM: Set VCOM voltage (B6h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETVCOM,
> +				     0x7a, 0x7a);
> +
> +	/* 6.3.26 SETGAMMA: Set gamma curve related setting (E0h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETGAMMA,
> +				     0x00, 0x18, 0x27, 0x24, 0x5a, 0x68,
> +				     0x79, 0x78, 0x81, 0x8a, 0x92, 0x99,
> +				     0x9e, 0xa7, 0xaf, 0xb4, 0xb9, 0xc3,
> +				     0xc7, 0xd1, 0xc6, 0xd4, 0xd5, 0x6c,
> +				     0x67, 0x71, 0x77, 0x00, 0x00, 0x18,
> +				     0x27, 0x24, 0x5a, 0x68, 0x79, 0x78,
> +				     0x81, 0x8a, 0x92, 0x99, 0x9e, 0xa7,
> +				     0xaf, 0xb4, 0xb9, 0xc3, 0xc7, 0xd1,
> +				     0xc6, 0xd4, 0xd5, 0x6c, 0x67, 0x77);
> +
> +	/* Unknown command, not listed in the HX8399-C datasheet (C6h) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_UNKNOWN2,
> +				     0xff, 0xf9);
> +
> +	/* 6.3.16 SETPANEL (CCh) */
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, HX8394_CMD_SETPANEL,
> +				     0x08);
> +}
> +
> +static const struct drm_display_mode hl055fhav028c_mode = {
> +	.hdisplay	= 1080,
> +	.hsync_start	= 1080 + 32,
> +	.hsync_end	= 1080 + 32 + 8,
> +	.htotal		= 1080 + 32 + 8 + 32,
> +	.vdisplay	= 1920,
> +	.vsync_start	= 1920 + 16,
> +	.vsync_end	= 1920 + 16 + 2,
> +	.vtotal		= 1920 + 16 + 2 + 14,
> +	.clock		= 134920,
> +	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	.width_mm	= 70,
> +	.height_mm	= 127,
> +};
> +
> +static const struct hx8394_panel_desc hl055fhav028c_desc = {
> +	.mode = &hl055fhav028c_mode,
> +	.lanes = 4,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.init_sequence = hl055fhav028c_init_sequence,
> +};
> +
>   static int hx8394_enable(struct drm_panel *panel)
>   {
>   	struct hx8394 *ctx = panel_to_hx8394(panel);
> @@ -683,6 +824,7 @@ static void hx8394_remove(struct mipi_dsi_device *dsi)
>   
>   static const struct of_device_id hx8394_of_match[] = {
>   	{ .compatible = "hannstar,hsd060bhw4", .data = &hsd060bhw4_desc },
> +	{ .compatible = "huiling,hl055fhav028c", .data = &hl055fhav028c_desc },
>   	{ .compatible = "powkiddy,x55-panel", .data = &powkiddy_x55_desc },
>   	{ .compatible = "microchip,ac40t08a-mipi-panel", .data = &mchp_ac40t08a_desc },
>   	{ /* sentinel */ }

