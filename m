Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19E2B284A8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 19:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452BE10E26A;
	Fri, 15 Aug 2025 17:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BI/F33ro";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D97310E26A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 17:07:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIuUI030485
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 17:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fmms3KUtyVKVAhnN5qKwpaFerSrUWOJ8TBMlYcAi6+k=; b=BI/F33row5q3cy4E
 n+l/OhhcHbfaNNa40HLZXKMOsdu5DOgjFMaBcot0NR5otuk4VA3IpZKxNh9VUAWl
 q0sCTNQLdFPD7pSmWFMx1sN3akmHEI+1RtstT8eIDc/nCRS8gwYgUrWq0jDonxUG
 oKt7FDOD+e9PyJR87RedqVrv5DFRUG61Nwu7APC8Q5mnLC1ghCCgPR3UETCW1O6s
 L+1kj6mSAgxoTEsYOdHliSaMfx4C3kNBUURd0d9Z8AqcKyUlDcmATbHfi0zB1tUY
 3f7zpDWKraZCiaENmaC9GJhJse9QHvwiTAXLRlOX2TyYjdsfTRtXFIsE2f2ZLv1b
 XL1fkw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vxh3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 17:07:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-244581187c6so24460875ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 10:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755277643; x=1755882443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fmms3KUtyVKVAhnN5qKwpaFerSrUWOJ8TBMlYcAi6+k=;
 b=APsv91heH2yMhOfk/n4jVGNX+6GU+ZC0QcxHjzMQdbcRgg9U4x3WQ20Ej9l5JW4SDY
 pdCAqTiIKlfy9xvl1MiMvfxZAD2sObaRt2OwqmGc72VsJ5MschCnH5ZxzmpfVALGXIeu
 uT+z479tpAiIytXmFUPOmYh4yebkjXzmG2T198QdrqY580Ql13Cs0XgaRnUVfH721REP
 4SxxgaWjUsl+6Q6z5/j8dO2Sf6JzGAhpp4566dqqVFHqlqg0sN+Zh+YUVbzpozjjEJub
 9F2TN9/sqjhrhBypTEYsrjwvaXGiJotDURgC1lQNpmQWKjZ2ryMFDprdQubO9CgTrx4W
 YiPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrCDSMEtPMbuqOaqkK9WUx1Ddu4j8MTw8G0TJozfe3dI1AU06q2VzkSgwYGrXOz3iFq6cQHFZ7Fls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIN8QLJ09ITfqPmvQ6asurNWGBSlHwbIpyAKhTjkD2GcznmvHV
 G5fmRGXLB7z4Pv/niMt8KhLWoYXnV9oQDk1s7MT4517EwdkJbETPMQr3+6bAFEBn4p5iJlq1TUT
 g+CS5Y/BfYhcpeswZcSpiLlG4AKGPkWQjMUHfxCZ9xdgihO3+FEyaOR4UVmnVC2WsGd+dad8=
X-Gm-Gg: ASbGncud+sgwhmpDEoRpirEkRoEOQX43P0VGBJmKWtqlxtAA0iBZpJ0Eib/E9RCb1qG
 kuvUa9+kJEQlzB+ljdinDsQr2jGvkATlhVIXoDZbZ3CmF2OKum0GaoPHki29fugTTvAdHrgMJlj
 Ha0tQBlJQyNjLp0Yjtl3UJDLDYkSEr9rdv3zWQ5OiZMwho87WPgppNWS/cGpiObR0RJOYtHSq85
 wN36aEDpQHUKG822ti1x/AP8ZRwwNJvbGfl3zfn752yPUt+UAnFl0BKEJ+E2+bSzxv9eZLkGulO
 IRR2hUHZHXFHpZbpuaMhCK4EcYNe0df0L6ei2UwCv13INNGC5ckbc5QAeZf7Wy50VQl2klTsVOx
 iKlUqf8P5R5go7K4rAvJoqugqLtAclZRj
X-Received: by 2002:a17:903:388e:b0:240:86b2:aecf with SMTP id
 d9443c01a7336-2446d5bcdb9mr45910775ad.12.1755277643055; 
 Fri, 15 Aug 2025 10:07:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaOFtakU37Wg9SDWWtQ8YWpYfPI6CJQv7V+ryZ8jB//mJtKDTWSmgToKxU8a9rj7TklDrCXw==
X-Received: by 2002:a17:903:388e:b0:240:86b2:aecf with SMTP id
 d9443c01a7336-2446d5bcdb9mr45910215ad.12.1755277642597; 
 Fri, 15 Aug 2025 10:07:22 -0700 (PDT)
Received: from [192.168.0.105] (71-218-101-237.hlrn.qwest.net.
 [71.218.101.237]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-323311913b3sm4729308a91.31.2025.08.15.10.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 10:07:22 -0700 (PDT)
Message-ID: <b84ccec7-3971-4497-b563-21b4807f0c98@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 11:07:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 1/5] drm/netlink: Add netlink infrastructure
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Ruhl@freedesktop.org,
 Michael J <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-2-aravind.iddamsetty@linux.intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <20250730064956.1385855-2-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX9Fl0F+Th5nJQ
 xvO03zAS6Yg3D+gVYjVBpt6dlB1rxMqf49YgCyi1OVy0zU+m0QCXP1X3V8vlJzKEX9CJUb3s9C0
 uP0NAyRO4Gzd3YopkiLk1/OgmWN2aKgRokWYHfvHbIDroRx84JaBzZ+BJdaFcVVs/w3bqqjFwH6
 +ibkIOjPK1pcN4iOxBeEK+UD+IHXZnLeeWyuBSHv54VZXMWPhwRpffRDo4QDm51+rHnlHjkTO1Y
 MoEP5PtdsOh/33+tL956/ifd8nkUfzOFePwOxS8Bjy7U92k/e9TXB2xuywzSzPVDCc2BrPwTJBa
 yNSyBAUJ9iIeJecqS8csUXBkfmCRVUCVKrRpU5fBv6PMqvltJqDizX9VmdsBZtblpObR2Qkn34v
 3ZXFOWoG
X-Proofpoint-GUID: 9APIIqzHeSEphYgsA_0gwe4lBLeyZOUS
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689f694c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fSPwT3sq1xj71pYUIDnCjg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=uU-qHxDN0T-dEARUgNcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 9APIIqzHeSEphYgsA_0gwe4lBLeyZOUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
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

On 7/30/2025 12:49 AM, Aravind Iddamsetty wrote:
> +static void drm_genl_family_init(struct drm_device *dev)
> +{
> +	dev->drm_genl_family = drmm_kzalloc(dev, sizeof(struct genl_family),
> +					    GFP_KERNEL);
> +
> +	/* Use drm primary node name eg: card0 to name the genl family */
> +	snprintf(dev->drm_genl_family->name, sizeof(dev->drm_genl_family->name),
> +		 "%s", dev->primary->kdev->kobj.name);
> +	dev->drm_genl_family->version = DRM_GENL_VERSION;
> +	dev->drm_genl_family->parallel_ops = true;
> +	dev->drm_genl_family->ops = drm_genl_ops;
> +	dev->drm_genl_family->n_ops = ARRAY_SIZE(drm_genl_ops);
> +	dev->drm_genl_family->maxattr = DRM_ATTR_MAX;
> +	dev->drm_genl_family->module = dev->dev->driver->owner;
> +}

We are interested in using this infrastructure at Qualcomm to 
communicate telemetry information for the AI100 accelerators. It would 
be nice if this function could support drm_minor accel nodes 
(dev->accel) as well.

Thanks,

Zack
