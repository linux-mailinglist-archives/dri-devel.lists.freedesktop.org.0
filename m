Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDECA2C515
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF9F10EB15;
	Fri,  7 Feb 2025 14:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="foezDaFA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DBF10EB15
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 14:21:04 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso14209245e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 06:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738938062; x=1739542862;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qDisuTD3ZLBeOSNMxc2GUk38TNgB9LS+VU1agrbB+iM=;
 b=foezDaFAbHRpfug/OAw5BPNqxZfzub14GKTMd6GozkVjSCEQSh7aGTxbLbYGh9MBV9
 Vp/kDs3ted9JkBwzgLCgDcCEtDKlDLG8eQMrvzKisUjPOuO1gt78iySPItQA2eiP0P4K
 gtt9LsFnbMPwuNc/Okh30G1cbGthKlkUGdYCHqsXskspI1E9mHiFv42bh6/J9DC9DlXi
 H7SXbYlJEh3hQt6AXqc1FOkmZcHMWQKWAIe6U+6etkH/Ct/ttJiVwlmbES4lx/4eNaLi
 34HKyBOC6jrpZ4kqhrcyzq/xkZfPZZWVOQGoAf2OT2MDug3LF/oDJLQR1twNx9Pv01aB
 Q27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738938062; x=1739542862;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qDisuTD3ZLBeOSNMxc2GUk38TNgB9LS+VU1agrbB+iM=;
 b=XtykiCXqR+6bYIz+ZiJ9qyPXzQlrxZpsVfLPfSuBLG9J18cCYOWe5sNyUUIV2zPdqE
 H7hr1bn6m5VUbNR9XxEmJklBndnjYY4b3Zi+VD2q7/yHw3lUjYNG+5O/JpJuuvMike9T
 3i0NB0vJBSH/w3uRXP+MhGSlRmCzt6k2BjsV4iaWCbQ+Cf6IfbocwhxWzQ+d6teGWf21
 QJj+gTsAnA5Kk5zaYZC+6Tdy7y2NximPqoU9Wz02OhCv8XsirWLBwlR2HZJSvw/gyq0/
 sLzBpVrifa/9lsNl7+qKihzjoLIw7NhYSzJxmv+3eo0Eks6PFLRJ+8AbgjB9kmO6CWRO
 RJGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw7S4SOUbX7QQIfQ8Ms1QtMogMS3j+zYE2ASSb7O5xQwLASb/KiuLiKNom5zm7Haa3MaLTK7VoR0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHZnxmu0YDRw71pNOQBiDxVKXcDyqFdZftpT8sYEPxwcgHZCWf
 lPSFm0VfZTxSv3CLhy8UyjaicB6MHNV2gwj/m6+4eQplHbcOeRNrqcNqawHSShw=
X-Gm-Gg: ASbGncvvnZy/jrZDOfClepZ+fey6amLOqvn5WKXa+ZHqniGO5DYiiU+HoCmUM5d5/v+
 WW4tC0Egxp0JMpniUqD2NPtZQOGr5cjMCLo083/mAef0/Vq+ApM+ojVdR1nEi/2R94dSJ7pD9nb
 QXe9XZ4gkIGzidCdQ0Oa6b2p/0EKLHd4Wd9dF6WwxoiRTIL5K5BcudGqlHjnylkVsHh0QoWP7LO
 Mk3srvTACx2BALrkS+Y1ypTpJcjaYJoJVZjpjBNkszu4IbInaZl3rPHgMZ8LtmqE7F3MfF5AJCF
 6+T3+0uwBVCDTc6wbL/KyiifkIAWzQjKFybzJTz61lZr5+BU51MFrq8nhOzeRdU=
X-Google-Smtp-Source: AGHT+IFxDkESsH4G5gG1BU4H7B4x8RnSu0oAxMNZ2KGruE88D1fDp7b1Y1apydP5lwwz3pFDUdKEAA==
X-Received: by 2002:a05:600c:c19:b0:434:a386:6ae with SMTP id
 5b1f17b1804b1-439249842bamr30302495e9.7.1738938062277; 
 Fri, 07 Feb 2025 06:21:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8?
 ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da9656fsm58840305e9.3.2025.02.07.06.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 06:21:01 -0800 (PST)
Message-ID: <8af4e0cb-4ac4-4ca4-ae81-6b5f7a06bf3d@baylibre.com>
Date: Fri, 7 Feb 2025 15:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/34] drm/mediatek: mtk_hdmi_ddc: Switch to register
 as module_platform_driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-11-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250113145232.227674-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 13/01/2025 15:52, AngeloGioacchino Del Regno wrote:
> In preparation for splitting out the common bits from the HDMI
> driver, change the mtk_cec driver from being registered from the
> HDMI driver itself to be a module_platform_driver of its own.
> 
> With this change, there are no more users of the mtk_hdmi.h header
> so, while at it, also remove it.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
