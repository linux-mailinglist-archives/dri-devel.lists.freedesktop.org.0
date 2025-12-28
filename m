Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3DACE49C2
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 08:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CFF10E643;
	Sun, 28 Dec 2025 07:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M06xJJGw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KH1M4ZXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F5010E643
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 07:19:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS3B8Hu992506
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 07:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yvF+ZaDkbR9O600mcCSFI3Lg
 kpXf1owzZ8QLLJIzow4=; b=M06xJJGwCEef6733zEaRhhbhtWxTKRhXuyWjdTP3
 4o2fJG6gcEcnIm7F6qHCzmHJ2qc0HJGmLpm33UtOiLU2EBKl/nPfaq4ddn1wxSK6
 MHMcJYZacWFOPgSzgbeIj0IKWAzK6VlY9honysD2tCGPOCr8fIqj5FTryIuJMc/4
 e07XiWcnkhvKsEEV68Wkk106QXlPktO+bsmhBs6KPabYNy6UIobWa7jNRcVVbzmn
 xzFvK03UF6YXaEMpfxI0qMTKAQ0CjO+k6DQ7ZACDglKcycmvBGUfJt2zYF/zlMTa
 6U7riMmJsZKvBzc0skx8y8IhKrVThQhiWm9wrySLvAV3mQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnt1vp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 07:19:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34ec2977021so1544994a91.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 23:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766906341; x=1767511141;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yvF+ZaDkbR9O600mcCSFI3LgkpXf1owzZ8QLLJIzow4=;
 b=KH1M4ZXkZOjMfHVwvvWbJWgi+Qo+aNH7Qf3eXXysyEDO7ejNT89Atkrq5eQib0vtQT
 QGS8wenq7CN6JMY+k06RPmQzLh8a3rj0I8SH60CJ8fva1F4je4y9z2BEcKOhHq37S7Hm
 /keRbcAhUM1hg5AA06F6YZEP1ZwjLCHeOLAfR86S4iNimh71Tc4ScUdO3+SopwEQM9Ba
 JmTspmENjR9IjVgg1Lom8LAPmkZwqsD9TpSU9ntV89NnCSkBb7jzuK82+C59EKn97euD
 4uOFLCgiiuNx6wCnFcC2g4H5WtIsUUSYPV3aMuS+TPfIo7WmeXoUvTAmlXCID5o2T44n
 VpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766906341; x=1767511141;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yvF+ZaDkbR9O600mcCSFI3LgkpXf1owzZ8QLLJIzow4=;
 b=kqsVeSY19NfZ4scBPJ+gaD49tKR/tEhXDdogCeun0GkZLYB3Q1q//k8NqF6lai9WRR
 bZS5dUOlzJ7BcQQA+vm/e24ZfDnvHAt2IsOkMKqHvQ8dfR81hpeHQgTM5cAeRWpYyvW1
 kno1X3s23Qte4HXgDpr1f06mHHAiaY8ywx8PaBVkPPNHyJ+ygkuX8DAOOtInPjqyW1Z7
 Y6KwWFLFEEB5NiXV8Abb1qWl6gALqC8P5CPIYmtvVq36KGSwR7NZzSD9axcFG2wtAhVA
 DokT0NYMt9+xsyyxmZsGPZDhW3f6LRBYDWmyDWx/fu+gP32T0wBDd7KtEIJrGNcwrciQ
 DoAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8t8wG5KpXZAzaLNSyxZuTQbUjIJaiG5SGRAi6TzzQkkFS6A1Yb2rHRsLO2Dky9Qgr0JoT/CwlaKA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTRwpULswkkBlaeyCL7PJyD/ngBxYgOcsLIyqDTcHQTviUWPDa
 dYMLzW1bX0GAc+iZEkziIkGmcwLpf+F/dk+pvVWPeSprWetWkNlPrgImee7bABnxUHJhUx7a6sD
 YdeOo0RZZBAqVy5FZIo/cRiCr/zyHKStU7w59ZHpx9vbo/+rNg0KTcH1mYgjjs0QchQoQyKk=
X-Gm-Gg: AY/fxX4U+pUS+CBIIOqf5L9kX6a76ZZxN4zslx2nZiACgOtpNdfLEdWeUBeBvsKJjKS
 jR0QraPfN3qaoEp6UFpqYxI57RkDOUtft1rhPrRdX9UGzbZF1oyFne5YM979qUJYkcctZvWEkuM
 vxbPb6k4JyGyN2I+BgxsxmWO4KgS3BpNUq9kCabSURppfcgUN8LMWqzkoJnE6JY0S7QnLg6Kogj
 bg2SdegjEWj0SY3Ni1a8LxGcyYf/MiMHzG0bDkLiEKlmt5xp2xSVB8xNFZ8q0yke30e/6hhEPhg
 CR6Eh17U8g0XEwJomVaPDlVJb/ATee0iGWsGNP1CIUMnf+rlalcg2VIZAD4c7fnSdiqUZoiiM2M
 XD84GHPL3MxK8HeHnzRuC8BVdgaOWYUpjHNEa/YWxKnxkQKcBQZMyG80p5pHdb9kOP0AGhDB4I+
 sORMtJPSnJgYIdC+2TGKW/4a5SDYVGiQ==
X-Received: by 2002:a17:90b:4b0d:b0:340:29db:6196 with SMTP id
 98e67ed59e1d1-34e921f3412mr17112354a91.4.1766906340793; 
 Sat, 27 Dec 2025 23:19:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMh+iK/TE3hYIbqjInhO7Ft6hUEt0HB8jepGeFEdmYBbnxEpmk+kvjgsl+E9k2sICZiR+rag==
X-Received: by 2002:a17:90b:4b0d:b0:340:29db:6196 with SMTP id
 98e67ed59e1d1-34e921f3412mr17112330a91.4.1766906340310; 
 Sat, 27 Dec 2025 23:19:00 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7c146aabsm22503139a12.25.2025.12.27.23.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 23:18:59 -0800 (PST)
Date: Sun, 28 Dec 2025 12:48:52 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony <syyang@lontium.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com,
 Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: add support for lontium lt8713sx
 bridge driver
Message-ID: <aVDZ3GBUJW6zs3y6@hu-vishsain-blr.qualcomm.com>
References: <20251118-lt8713sx-bridge-driver-v2-0-25ad49280a11@oss.qualcomm.com>
 <20251118-lt8713sx-bridge-driver-v2-2-25ad49280a11@oss.qualcomm.com>
 <c931853e-faa6-41ae-89a8-d22544a9da9c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c931853e-faa6-41ae-89a8-d22544a9da9c@kernel.org>
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=6950d9e5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VNomtPhMec7HeW0AfjwA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: jmebcryJcKme2gigMKuZZ3T19Mad67_Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDA2MSBTYWx0ZWRfXyYmW7mLjV6QC
 zl74H0BDdxb5AVXFpr1D5hcsQ+iOGtGLQylifCRvmL+p8m2NnD6Kqh4D+i/aMSokiTFlAccafzV
 ubDDugwLe69Ayx7RfPfRtf3PHtvaCsX4fvsNthMtOJyHUALkEt/4+emsgDrVBwUsP778mjBOEDC
 cAgQNSFU2xv9Vt/7FFuuzMTT2fxO0KZCFOb/A5XknsYigXMZzFUWBZ4buT/QgIjcORp2NNT2RDL
 noYRRM5vXlWqJuZzxitKgL+hM04pZ7wvGPp6XjvVZItHJTzS2ja8GCr9CZE0VdrtPGBX8YIObq9
 h3OOlUnx1xYyc2LqbQQ/TzOZ5i4GnTtvwlgTvviQJ0JfO0QeAT4XuLi/MG95t/tmRyd6xClKyTO
 z1RZ/EtPY2pmn5DqI2vLGNFBkMu8Z/jyUAdHNNA1Bgl31fq5qMcswfGsay7ynWrRYu+BjkZjhpy
 ldWkW68JyJYrgoVqNNA==
X-Proofpoint-ORIG-GUID: jmebcryJcKme2gigMKuZZ3T19Mad67_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280061
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

On Tue, Nov 18, 2025 at 08:37:22AM +0100, Krzysztof Kozlowski wrote:
> On 18/11/2025 05:37, Vishnu Saini wrote:
> > +static void lt8713sx_reset(struct lt8713sx *lt8713sx)
> > +{
> > +	pr_debug("reset bridge.\n");
> > +	gpiod_set_value_cansleep(lt8713sx->reset_gpio, 1);
> > +	msleep(20);
> > +
> > +	gpiod_set_value_cansleep(lt8713sx->reset_gpio, 0);
> > +	msleep(20);
> > +
> > +	gpiod_set_value_cansleep(lt8713sx->reset_gpio, 1);
> > +	msleep(20);
> > +	pr_debug("reset done.\n");
> 
> No, it is not done, because you kept the device in the reset. 1 is
> reset. Don't mix up line and logical signals.
done. 
> > +}
> > +
> > +static int lt8713sx_regulator_init(struct lt8713sx *lt8713sx)
> > +{
> > +	int ret;
> > +
> > +	lt8713sx->supplies[0].supply = "vdd";
> > +	lt8713sx->supplies[1].supply = "vcc";
> > +
> > +	ret = devm_regulator_bulk_get(lt8713sx->dev, 2, lt8713sx->supplies);
> > +	if (ret < 0)
> > +		return dev_err_probe(lt8713sx->dev, ret, "failed to get regulators\n");
> > +
> > +	ret = regulator_set_load(lt8713sx->supplies[0].consumer, 200000);
> > +	if (ret < 0)
> > +		return dev_err_probe(lt8713sx->dev, ret, "failed to set regulator load\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static int lt8713sx_regulator_enable(struct lt8713sx *lt8713sx)
> > +{
> > +	int ret;
> > +
> > +	ret = regulator_enable(lt8713sx->supplies[0].consumer);
> > +	if (ret < 0)
> > +		return dev_err_probe(lt8713sx->dev, ret, "failed to enable vdd regulator\n");
> > +
> > +	usleep_range(1000, 10000);
> > +
> > +	ret = regulator_enable(lt8713sx->supplies[1].consumer);
> > +	if (ret < 0) {
> > +		regulator_disable(lt8713sx->supplies[0].consumer);
> > +		return dev_err_probe(lt8713sx->dev, ret, "failed to enable vcc regulator\n");
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int lt8713sx_gpio_init(struct lt8713sx *lt8713sx)
> > +{
> > +	struct device *dev = lt8713sx->dev;
> > +
> > +	lt8713sx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(lt8713sx->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(lt8713sx->reset_gpio),
> > +				     "failed to acquire reset gpio\n");
> > +
> > +	/* power enable gpio */
> > +	lt8713sx->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(lt8713sx->enable_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(lt8713sx->enable_gpio),
> > +				     "failed to acquire enable gpio\n");
> > +	return 0;
> > +}
> > +
> > +static ssize_t lt8713sx_firmware_store(struct device *dev,
> > +				       struct device_attribute *attr,
> > +				       const char *buf, size_t len)
> > +{
> > +	struct lt8713sx *lt8713sx = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = lt8713sx_firmware_update(lt8713sx);
> > +	if (ret < 0)
> > +		return ret;
> > +	return len;
> > +}
> > +
> > +static DEVICE_ATTR_WO(lt8713sx_firmware);
> > +
> > +static struct attribute *lt8713sx_attrs[] = {
> > +	&dev_attr_lt8713sx_firmware.attr,
> > +	NULL,
> > +};
> > +
> > +static const struct attribute_group lt8713sx_attr_group = {
> > +	.attrs = lt8713sx_attrs,
> > +};
> > +
> > +static const struct attribute_group *lt8713sx_attr_groups[] = {
> > +	&lt8713sx_attr_group,
> > +	NULL,
> > +};
> > +
> > +static int lt8713sx_probe(struct i2c_client *client)
> > +{
> > +	struct lt8713sx *lt8713sx;
> > +	struct device *dev = &client->dev;
> > +	int ret;
> > +
> > +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> > +		return dev_err_probe(dev, -ENODEV, "device doesn't support I2C\n");
> > +
> > +	lt8713sx = devm_kzalloc(dev, sizeof(*lt8713sx), GFP_KERNEL);
> > +	if (!lt8713sx)
> > +		return dev_err_probe(dev, -ENOMEM, "failed to allocate lt8713sx struct\n");
> > +
> I did not ask for dev_err_probe here. Do you see such pattern anywhere?
> No, because there are never error messages on memory allocation (see
> coccinelle). Drop.
Dropped this dev_err_probe.
 
> Please run standard kernel tools for static analysis, like coccinelle,
> smatch and sparse, and fix reported warnings. Also please check for
> warnings when building with W=1 for gcc and clang. Most of these
> commands (checks or W=1 build) can build specific targets, like some
> directory, to narrow the scope to only your code. The code here looks
> like it needs a fix. Feel free to get in touch if the warning is not clear.

Run a couple of tools you mentioned and fixed the warnings in next patch.

> Best regards,
> Krzysztof
