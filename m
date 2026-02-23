Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKINFV/inGnrLwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 00:27:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C717F62D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 00:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD06810E463;
	Mon, 23 Feb 2026 23:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXJ/POPd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7UUZlGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCA510E463
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:27:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NH4cAh910666
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XQMEE4zQDEJWXbhbQn8aEjbq
 vTWxQ1D/g14nBRE8bsk=; b=VXJ/POPd6hE4A4AYfEC9N1zWw6mldcdQkJ3YSIQe
 jd2t+tW/G8JUPk9M2UZoUmSJKUhPOvsy/w1u69fz5f/9zkQbyTeliHkMHkBoQQN0
 o6FktEKjEcWNPiP5QhvnLzqkpqSb1S57LQPV3HLjNQiYJD1YasCGfKzxYCh0ULiK
 TJQRXhzwsZMwLGUdBHKIagRv1kADW0nNFdrzsSle93jGxwP+LScVn7Ikpvjbhyqw
 KNqSIBx2RhGiPvkrUyesnsLNUwdoLF0Dv0gkEKhw5Ez4fARUxY7efJGiepUC1bdC
 irJEeBoLGeTM1mNnSSbAZWv8UM9noAf0gOsJe8tQI90a7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyj90t3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:27:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb706313beso694211085a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 15:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771889241; x=1772494041;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XQMEE4zQDEJWXbhbQn8aEjbqvTWxQ1D/g14nBRE8bsk=;
 b=a7UUZlGRAYirGksaVhAm0M+egvfyOm761uj7DNdysIQ2rMDVpDPNUJu/TVqkHUhoWE
 QJhsMcquYK3R7OeTXnze4hVNhBxXsW9+mcaERjoZidJ0AVxO5/jWgBgTy4hdl8Y5UOSe
 ZpKI0peMFdYPmtIUrwbjCBjKs13tjgT0L+E8LfLd3tVSc+oJZAVBPEYADL7rh8oHViL2
 CsZbOxBxyO0WeRAx6Css55+Ns7/oWSeaJsox8ZKLY6cA5IkZ0aX0FqvY2rYZMm4rqtbp
 LZUTJrQRN6Am56WjEjga4yfhZ5XojOW0o9IUc/nNUZT0AZCQzih+oQaIrjtc2GaIG6k3
 KvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771889241; x=1772494041;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQMEE4zQDEJWXbhbQn8aEjbqvTWxQ1D/g14nBRE8bsk=;
 b=fNpqJ9oQaH6koAQLBiXB3JvyIbDhx3rIpp7s1SuENWeO+H8p81lK5pmFR+C3bLf59x
 /RBhZZUBqwODJhEsqnxOzR/5uR4+zEosQg/t8fqVSlmIsZhCh0n3PXw7u/hYdwxdohjH
 oW0jyqEBmzq/jFq9+c/viZ8I3Oq+yWCDqo7GhjnusA+HzGjpfkq7CIVm5uXV1fBBDgsD
 M69MQTYM717f4inBpgmKS4vw5C2G2oZ5PtRVVfDFPx1uz/JJHHxs6nT4TO2QNAF6enQx
 R6AHbiY5Cr9egE6vlyj+bPky+M4w5B0RaYTLJbuE8ikJuHBfIocS62l7judzhZsjAvp3
 M9SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc/ACAmtz/RMQ61HxXnRMf3C1pVc5gHr32FHDqnHlxC9Fsz9Bl0VADAvVsISQ8+9wLuR1KKtpM49Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMio4EDLBmHjyETSdpygPvBo6zrL1CtVmrWObFgrU7SUMwSUpd
 TRAe5kV+g/DA9vmaZ3btAjo7K0a4XWB97CgGaTrRtXEQHSdbwldB/7ZmUgSi1QgYK/dpFign2Pc
 SMkSpUFlSSB42hLnY7tELowr3gJ3EKGok0n11XrE1cof4sueBeBe90mpW7UzAEfxk9T0SPFA=
X-Gm-Gg: AZuq6aJk2UF7jokb+wd+200KwNTg42ABTaboqT2nCEnXTgoVbXXQo/F2ZK7V7UmJwYI
 haMhjLBatbElsmu+lyj60BAM/zmPryJJbJu9mJ3FyGaqNE0m1kVuKhrHq750PpWScdSc7bln1u2
 5MrU6vFsUTmOsxonzsoRcI4Qk3HWo6pXfNtzz4uT+cLqpbckzNmx8RH82ycfqz012J24dFaS0u6
 z7VnVbIMULbDqkQLX6Tb3GbcUl8N89rsPpAv/g5i3MjefSFnIKxCuF+kBe9aMebw1+/lJ7W36On
 3syl/affNLH55opk2ZaypkG0k7xL543oEIy8Z1atMaGiaY8QCLZjXnf93weliZF3NN9g2sB25aH
 CiEco62DeR80eT5eaqLZSAsTEz0iHpcFm4ke4kqea5CGAlYbg/dvdncA79PQLQyp6iIGT7gVpW4
 LNWzsOC9/npIxRIAD5o0OaIy1oca4S2p13Je0=
X-Received: by 2002:a05:620a:4445:b0:8c9:e989:9d97 with SMTP id
 af79cd13be357-8cb8ca834c7mr1325879885a.68.1771889241213; 
 Mon, 23 Feb 2026 15:27:21 -0800 (PST)
X-Received: by 2002:a05:620a:4445:b0:8c9:e989:9d97 with SMTP id
 af79cd13be357-8cb8ca834c7mr1325876885a.68.1771889240668; 
 Mon, 23 Feb 2026 15:27:20 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a7a71271sm19006771fa.31.2026.02.23.15.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 15:27:19 -0800 (PST)
Date: Tue, 24 Feb 2026 01:27:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sunliming@linux.dev
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <bn6v3tfwj4s3ymfzbulo65qhnq5psfgjwfqaqmhxxuli6yj4mt@ugalqwbx5hhx>
References: <20260130053615.24886-1-sunliming@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130053615.24886-1-sunliming@linux.dev>
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699ce25a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=y2YDxqopTWoFPjg0B8cA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: QssxkO0_dFS-bcUfNRunkEYH7nuJM0EK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDIwNCBTYWx0ZWRfX6j4YOfnCvfTN
 EoR11LWehHOz0U+g6cznOoM8QNZ9FGnm7mMrczbJ9MWHmzgsEZoNsqjdc9SjphWR/xOlqtSV6pg
 OzvnYTgg80b7ZAa6DWCXXAP2vhOlvSi08krpuh3yTDSzKJhhNBvvZ4RAX3U4zJv+dk03+eqG4FJ
 vNUhGyQUSE4aaXVlwZw7hkXBiu/eLXRgGk8XI7KVosGQ9ITxFwWekZ9MNAA9XvPkVsb+7xiiG4X
 xpCEEQ88Aa1pt4dEr2qGl+6mdfhjfS6tOtBJCd9QSlR4l1VPb8lZpqi27/Fojowefb+UJFlp4Xb
 aB0r0MiPXd7eGRFdPCMRIXcpI4mFMM0/ZholuCGDwNxlzdLd9I/k8mtQZv3RTGaqP4bSoIUzp68
 hjHANdYly9XoC1F/aNRX9uuWt48t84GORg24mxdIPHP5VIUDiE29kFZoDn2it75S08uZByuWXSQ
 TKyVRyWy317QmJw/M6w==
X-Proofpoint-GUID: QssxkO0_dFS-bcUfNRunkEYH7nuJM0EK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230204
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sunliming@linux.dev,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:sunliming@kylinos.cn,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,linux.dev:email,kylinos.cn:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 082C717F62D
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:36:15PM +0800, sunliming@linux.dev wrote:
> From: sunliming <sunliming@kylinos.cn>
> 
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
> v2: Fix error code
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
