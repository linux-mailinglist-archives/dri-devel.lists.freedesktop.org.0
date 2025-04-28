Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D62A9F60A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA8310E620;
	Mon, 28 Apr 2025 16:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6se8KO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536D410E60D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 16:42:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SDapYc025737
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 16:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SA1b2FqscZ3dd+sTCEB1l6E1
 olktAuoHppHFOkrPQBM=; b=D6se8KO0T7tYhZqkyqQMQ0WTxByBg8BB5lAiVUkE
 yc6sU8w9nAe2iat0N15feU0yX0/YkzHMJAyL7S34IoRHCNCmHHKH7ySoqS4jdFsO
 6/hR0g6VQtJ6X7sSXoEM90/7gXd8DvJsLhFdVjjEyJ5RRWZhO7rwBeviJLXl369+
 HpBeJLdB1VAl8C1SLCjHdRkYEQyS8ymAbb7ZY422ShpK2QbqAFG/ZW/mg2HtGtbG
 jpKjvbZqHphZfziSjtQu9Fx5azvJj5urmU86IpH9rW4jN4qkt3q9fq/W8hhgHqRf
 h1iNH1FyruMmBpwukSu+VnK1ScfmM6SoDNuN0pgekGorhw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb8ran-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 16:42:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c0b0cf53f3so785714085a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 09:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745858538; x=1746463338;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SA1b2FqscZ3dd+sTCEB1l6E1olktAuoHppHFOkrPQBM=;
 b=DldZzv09cQ5B/4GME+aKNQGf6UYlk8tB8LsfGjwuJ9/CF51AmRyk8Y1B+H9aONChVE
 WY82BJ96L5zPxqW5UmMwGB5lCWMq0JMtU3XwxdUP5fBavjjR6eBh9FrJM/3azxPqA5SK
 aet9b9poUHSjTR3rgpJbDscsGT0/sTTVwima3Ow81WlF5k1NOGRlyOq3ZimScfv6Uk86
 NTBlE7g9HJFCnrOuiNwygp1gu3ELgNYzgEGq3OZRMGxJyz7vNoaIhS0YRNY4l/rChK63
 BlWfTUUwCaYIGQPHLccZgSFck6clipqVPv8+9NTM5yh0Fy7j2JzFX5ktE5KPAtNVBffl
 J4EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2XCCfbxR80oif9MC/j8uUcbtivsAnsHVWFWJeeWi6pzr98gz6+TCYl1V6vpYvkfCDZgq5uqB1+OU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/YKYqCSjXiwA1kcb+1ENscWOwJD/M+HUtQfNL6OAFo3lZs5l2
 0qdtNP3wwAiyliI7MRd88NbdC233arle+xERAiQE/fptZGeNX7ytD+PHy1NyM0Wa/O4pvo0kUeB
 Me2Ehxkis79vHr3Bl/N/kwsB4dpegpYVdsTbff+bh2A1UozXuGPAYvmyXA41OYzeiz74=
X-Gm-Gg: ASbGncscXuX00N+V0HF1rCdl8HcpBZ3MQQyiAX+Pgxorgn3Z/Tvu5gWMLNul1MB0/4Q
 8smAVWEhaK5IJh/zdXltO8//QZyqVY4WVKwGaGvrQTXqQXK5rvbLlpIcM8fcerjRB/h035yp9BO
 r3MrfaHJQQBtL4jCfkB+2MKlevcqhHYvJNFMUWE0uZ3AeRGOSwY+c8k+XIJeF6xnyKbX4AmlWEf
 8OT011tbr1crVktH3X8rHaYFrWBftHnkYozCFLLsEtCUYj5t/qKq0JvZ29lE8B5yzLg4F3Zfht/
 DehpRIUnHUWP+XGYGb0IZtMDssmY2YHbnc0xhGWZgjL1xVd8j/28xUUmLbs6tWxotTWemDdtk6M
 =
X-Received: by 2002:a05:620a:1a0e:b0:7c7:b5cd:51a1 with SMTP id
 af79cd13be357-7c966863fbbmr1867395485a.6.1745858537999; 
 Mon, 28 Apr 2025 09:42:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETBW/Vx29UTQcwpbCDmnpl0iK+JMJuOp/J7yoryQoJh3VlwyHraZogA3RxkMTk+g2S1NCTfg==
X-Received: by 2002:a05:620a:1a0e:b0:7c7:b5cd:51a1 with SMTP id
 af79cd13be357-7c966863fbbmr1867389185a.6.1745858537507; 
 Mon, 28 Apr 2025 09:42:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d16a837bsm20918801fa.65.2025.04.28.09.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 09:42:16 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:42:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 03/11] drm/connector: add CEC-related fields
Message-ID: <7bcw2dunz4oulx5t7kf4di6bd6cnujlxph5jo53dpynyi3l5mo@tmtutjcmbjlv>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-3-04809b10d206@oss.qualcomm.com>
 <20250414-augmented-origami-fulmar-acb97b@houat>
 <ac890d36-f61a-456b-9833-4615f691eed6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac890d36-f61a-456b-9833-4615f691eed6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzNiBTYWx0ZWRfX1ELCozQwev4x
 22agAyEkOOa4RSiK/mLYH7KiZSUinPI6/adWVPGg6UTaqjy/1vOCaK7GgydBfbHgDVSBbAWPAkJ
 x5pZzZDJG4YqKN6DWd35nbsxvba1a2yQgY+7TmEkalsd7T433oMA79ajyBjHnGBJBghOLE6moXD
 33E+YzZNvySzDjAVtY9wJELstFPppjmCAbegl3+JhE+fDrMd9VgOP/sV3A4YBcIcAyuOmAeXq19
 nTis9ptfdaFKmyWzDpBf+891AqjbR9ZMO22ubo8vPkhLFwXRUbJPMx7Xm7n+hBXzb8Rj+k3/283
 CXg9gqXz3/tX0UBLaBegwFhPEAlcX7hJBA6O+a9bPWjgSQOFJQ7H2tpC3P7b43eJbAdg33fCxLB
 2vu9L7gAUYjg+dWEAAAT5bcmdCz6o70Gxpn8+GO1cPO7+CNl4pAVw64aNAfH6JEzOgevp8Sf
X-Proofpoint-GUID: CGJi5zPsiUgR4fN_4MPrPcwQKXKRPrUH
X-Proofpoint-ORIG-GUID: CGJi5zPsiUgR4fN_4MPrPcwQKXKRPrUH
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680fafeb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=5IJ03Ze1T5poNUfmoa0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280136
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

On Tue, Apr 15, 2025 at 12:10:06PM +0300, Dmitry Baryshkov wrote:
> On 14/04/2025 17:52, Maxime Ripard wrote:
> > Hi,
> > 
> > On Mon, Apr 07, 2025 at 06:11:00PM +0300, Dmitry Baryshkov wrote:
> > > +/**
> > > + * struct drm_connector_cec - DRM Connector CEC-related structure
> > > + */
> > > +struct drm_connector_cec {
> > > +	/**
> > > +	 * @mutex: protects all fields in this structure.
> > > +	 */
> > > +	struct mutex mutex;
> > > +
> > > +	/**
> > > +	 * @funcs: CEC Control Functions
> > > +	 */
> > > +	const struct drm_connector_cec_funcs *funcs;
> > > +
> > > +	/**
> > > +	 * @data: CEC implementation-specific data
> > > +	 */
> > > +	void *data;
> > 
> > Is there a reason we don't just skip that data? The only user I'm seeing
> > so far are the helpers, and they only put the cec_adapter pointer in
> > there.
> > 
> > Can't we pass the connector to CEC and make the adapter part of drm_connector_cec?
> 
> It will be either cec_notifier or cec_adapter +
> drm_connector_hdmi_cec_funcs. Initially I sketched a union here, but then I
> thought that a void pointer makes more sense. It allows us to make CEC data
> helper-specific. For example, cec-pin might store platform callbacks here.
> DP CEC might need to store AUX pointer, etc.

Maxime, gracious ping. I'd like to resolve these pending items.

As I wrote, I think a void pointer makes more sense. Another option
might be to have a union of corresponding per-backend data. WDYT?

-- 
With best wishes
Dmitry
