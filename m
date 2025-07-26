Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82348B12A84
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 14:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB43E10E47D;
	Sat, 26 Jul 2025 12:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFy9HuK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E84610E47E
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:41:06 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q8Opl1011355
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=i6whXItl51qQxYCKews8I6N2
 kwKaahew86LQlq11tEE=; b=PFy9HuK1HhCu7y6xvrIoQ9RdPCkpUehPbgXX8SIj
 ZWNbd/33SHTvjy/a2OVOMZef+gIoJEhk1wCixL0ltamK8ryf3hhdm6pTjSrABEc4
 3jd4vfMQlAAw3DmdnYzny4RedbzhzsVPYLG8s+erhEog9HHA9/MN4w+LMPbewfqV
 rn/j796D324vgRnzuXbV/2TfZSRhN7QAUfgJ6dAUU2/zwgNKGECnNDELLz4OYz45
 1uH+HPAXnvwLYAmdpWxFac/gpu2lJaXx1zAvqE57BQ0GfPasT5wgaiqnelmAgMPk
 jCrpzFf0phDxGiLHL008PPaB/ZZYxQJ0vTIgIZ4nkQIdcQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytrpx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:41:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7073834cda0so3287856d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 05:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753533664; x=1754138464;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6whXItl51qQxYCKews8I6N2kwKaahew86LQlq11tEE=;
 b=sHMZbqdRYtO1+cl9AtMnzzZwk+mbjVovVrmy7jpLO5TAiYK1+cWXEEijOCzjS6aR6V
 Ve+8r2dIrEWetIIWIav0emiZxEAAjCGuiwe+fWLv1+INYZ/Zy8pwVuEE0El9/moce0J1
 EzayUrBI4w/OJ6Ro5hVP3HLmdWxMhNjKApBxvG0ExNi2WzhjvEYtKotpXkoP1rTR0ny+
 nJeNJEAwqTwu84wiYH625CJbS4FSpspqkmuxFtVAehp6qhbTyP87S0lhRAOZajeuRy/g
 4UJ6tESubcMVeqdmFuNzURyQKbXCFLGlXE0fimB6peU2VgxBgyiiO8pkmQIJRbFFljDi
 vGBA==
X-Gm-Message-State: AOJu0Yws/4Y8ZLj6TzCKmMM9/+JjAwKpadX4NywwdCNGZHzC6axe94jf
 /7HHiFYBuBAT2f3UWvEcZ648LNTa0BH/ubcvzUemak+BeE5fjA12Yq4SofIH+nI92EUxHDhJd+o
 B3ZayxmGHjyp6F+buwkqT5ocvSlal9Yu5yUSPwoHXIbju/mU3EzdHT7lCwB+remDuzeEoixo=
X-Gm-Gg: ASbGncttcPEuOrHa2syEthOh9SzDb1JAEdyLi6LhehBUgTSDNN7eBlhQMGqZExbavXN
 aCVRvf9zK/NEtjG0/BeKJTwdOrNQ3Y+vJcFGE7CXWhX7q2EPs2T5X7GRKXQMdED7mIn8yv2L8kn
 Va48aUQ28XcMTWR/JEC6B4ara+ijIsWTHvhmIQ6EiG0HSKyGeyyqWT+WE696vmFFonAcwyeI15f
 4/uh2IeYMIgtnQ1fWC/bdHV5KbQn73YfjIKc3kBGNwwm0zye6tvTU7e+wgE2VHTSDxtO+ZXZVlp
 8g49j6IEVoRWus75nj/C7yGUourFdkAZ6uT5VmElorEMqvr6OmpDovWZr1ZAsHb+oFc/p7A8MEz
 48avd2/IOVcJTs+cxAb2AQT2Yk2fsBVGJCKFQE7Py5+xj9IBf7Ddm
X-Received: by 2002:a05:6214:529b:b0:702:da74:d022 with SMTP id
 6a1803df08f44-707205d33b1mr80399186d6.35.1753533664091; 
 Sat, 26 Jul 2025 05:41:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPQDX73wCshkrBut65BKJsC8lKGRUiTfd5OXC0vTlX80yzrSUGlo1K4bxyQk5IG+160yXWeQ==
X-Received: by 2002:a05:6214:529b:b0:702:da74:d022 with SMTP id
 6a1803df08f44-707205d33b1mr80398866d6.35.1753533663708; 
 Sat, 26 Jul 2025 05:41:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6336387csm426079e87.107.2025.07.26.05.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 05:41:01 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:40:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com
Subject: Re: [PATCH 17/28] drm/i915/writeback: Define function to destroy
 writeback connector
Message-ID: <3paeal7ew2pjo6h23rr4t7fqz33avbyxuync5cxnxlh7w4xxr6@ja77buhqtlva>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-18-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050409.2687242-18-suraj.kandpal@intel.com>
X-Proofpoint-GUID: 15KSg7v4FMeysGwzPze2OoWzGaBMSP-s
X-Proofpoint-ORIG-GUID: 15KSg7v4FMeysGwzPze2OoWzGaBMSP-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNyBTYWx0ZWRfX+ufkZb6mhkGS
 v3yIakjYs3odOgBKUkCGJEPtkg3HfqC7MosWrsJ3yL5M4OUTr1ijxvT3FDurfobTT1m3UH0GfvC
 MtOLUyT5TZz4N0HNxzPTHDi4lYFAnWc9q1iAHYaIQ7bSg91JtMDaCYGzx8LsILEadAusJYI/pbF
 ojYz1WPBW7HXeNM98Uc9ACTXWcGI+5J/qPTEpcvSb4jwBMRaEZP43stybMPAaHN2d9C4d4P4bj0
 5cuphDyCG9k54qm1yIZmFECjOHjH6aumn1svDmpBYw8BTA2useizOYY3ar2+C5qbJICYa/Hx6rR
 EDtTHxsTXz7F00Wy79LZXXcwK+rzleMYNSTlUjtoX1JuzA6QU1/iLExGZFR24dFqkiXkagBURN3
 vB7dZlSjG4aMRgqX/3JqzYn8SHLehcbME3NXpsvYlAZwT3ZmE9hFSYxj26xUqds3C6trjguC
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6884cce1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=DSuhFVeksThMRZl9yJUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260107
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

On Fri, Jul 25, 2025 at 10:33:58AM +0530, Suraj Kandpal wrote:
> Define function to destroy the drm_writbeack_connector and
> drm_connector associated with it.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_writeback.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
> index def33191a89e..9b2432d86d35 100644
> --- a/drivers/gpu/drm/i915/display/intel_writeback.c
> +++ b/drivers/gpu/drm/i915/display/intel_writeback.c
> @@ -180,6 +180,12 @@ intel_writeback_detect(struct drm_connector *connector,
>  	return connector_status_connected;
>  }
>  
> +static void intel_writeback_connector_destroy(struct drm_connector *connector)
> +{
> +	drm_connector_cleanup(connector);
> +	kfree(connector);
> +}

Nice example of what I've written in my response to the cover letter:
without this commit we have a memory leak here, don't we?

> +
>  static struct drm_writeback_connector *
>  intel_get_writeback_connector(struct drm_connector *connector)
>  {
> @@ -208,6 +214,7 @@ const struct drm_connector_funcs conn_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
>  	.atomic_duplicate_state = intel_digital_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.destroy = intel_writeback_connector_destroy,
>  };
>  
>  static const struct drm_connector_helper_funcs conn_helper_funcs = {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
