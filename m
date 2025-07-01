Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64AAAEF602
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 13:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A82610E588;
	Tue,  1 Jul 2025 11:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GK4/qrmw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5D210E588
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 11:02:50 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619qTQj024791
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Jul 2025 11:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UxSAcNymCKuKGkRxvBNK/5Rohz+Mi0uncaZR1YR6JHI=; b=GK4/qrmw81Jujxmn
 XvU/3s5bhIllPVBNhkNAqfP4b4VzSenF/hcaoj96i62h9xiD4jZ705BIsXQNWsSF
 iFg4LSBuHKmOM10C45OSe5tb7w2ZIJJNXeXyYSL2tIH5nlY6B4Zr+9XQPLEeHYdn
 QL3Rf3s0bgauvWzdurNrGXB3xZ9Rn8Y12V3IbijcvoJC22uUAGI94T/DGIh/8fZe
 aSOvK9qU8XPFSvYVzO1cOb+IfknW17dWRTeIiijx8Mb+0Pr0wLupoETaNp8SPgoX
 ZYSpDjKQSE8XJpss2b9gSdWr3UW3eXjoheaELdDmEcqmjjWQQla6njdqUknc8/vA
 8eoFyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9gjs4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 11:02:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d38c5c3130so534487185a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 04:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751367768; x=1751972568;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UxSAcNymCKuKGkRxvBNK/5Rohz+Mi0uncaZR1YR6JHI=;
 b=g4dV4Aydpp+wD+lW+xNLcAkpNIlkVbzbePvCWJqUxAvb3tOROdpQl824m9gks/8blN
 igMh1FgVWqy7EsRoqA1udGYDQ+Kk2i8SYs+QisYvrUv2F3UOOhiFJ3Gulnvg146jjn9X
 z1ElvSAc+rtEPcu+izK++lftN/i96iD8jaaLkInhVuB8Z0X6CW/c7q9lYGu8Vn9xDH+I
 /yQhzOtM8WynrMAjNVOwCmdzETF6MWKFl0SWfnuKl5G1yQszWGo0UVkKwIqi2bME0uvc
 SIZqdGxzwujwLxnjc1v60Ory1xytGuL9EVctnouUDzUYyjVhg/65IWRIkvN+85eFAOZ9
 0XgQ==
X-Gm-Message-State: AOJu0YwOyBmwZZ9ltcR8djvB1ATDV69YBPOpUFy2WUQDFX/Binq5bON0
 1li7935v4VE7zdVbNaqM0j3mCD0/UAVysX8PREB2AVkJ9/7KkG9v8PggLarGBuFbZTlghslRJYv
 urBEZjcE1XO/+BaPX/FfbFhr4O0iqAgxgkD/NLGwkC2EcOAKWOo85cM4b8/ubkZYcKqpKQaai7A
 8edZ1xeEra
X-Gm-Gg: ASbGncsmBVrm8jRoNT18Y645Mz2OIX4qY/UAHkircaf0Zojhz8zXa8yTP6/6l4Lx35K
 VxiscPOeFtIT6xGitd+dG2Wuv4obFzJP5Yc8BmDM1sWiW8xFlx9TN6dGe08F5j/xVSv7bTwjqZQ
 Nkwfj6jS6EuxERYwXjL8cecx5zmUbYthdYf8ipo6yIe1mmA/G/p47iPdUUpPoR6xGj7WaZjAhwo
 ZcmoMiKZEKn9hdcSGhGq3CDhrcRtLZvsN6JIP6lIQoqYRJ9yP8gIbhuymvrXmCAc2cvbPD4BQ4e
 VuO4UBBExFLpL9pVGfaoZPVFly8wEyw2Hq5rpldEhxbPXB2HoQlhlJlNDl78CEfTK/pi7X/9EmU
 LyDba6pYhtdDses+irb1OGl0F3ImMscU88lY=
X-Received: by 2002:a05:620a:a902:b0:7d3:8d5a:434f with SMTP id
 af79cd13be357-7d44392340emr2163197485a.3.1751367768011; 
 Tue, 01 Jul 2025 04:02:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHomhum+x15r4Fq/4R2cO8j+Pt1b7twM9ICndVVTqODXPvopYR3CIj0kU84NsJ29bZjoETO/Q==
X-Received: by 2002:a05:620a:a902:b0:7d3:8d5a:434f with SMTP id
 af79cd13be357-7d44392340emr2163190285a.3.1751367767083; 
 Tue, 01 Jul 2025 04:02:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2f3fb0sm1778066e87.259.2025.07.01.04.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 04:02:46 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:02:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 04/19] drm: Pass the format info to .fb_create()
Message-ID: <uditzkckfqlwduw7h24gd2zgzwc5fyyfqx5c4lvbqza3bkwnoc@2gzqy45orx5s>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701090722.13645-5-ville.syrjala@linux.intel.com>
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6863c059 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=Bfk0aN2iAGfAo7fOLSMA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: haRmbXbvrtymMq6Z8w6oyBp_IZkR4pJF
X-Proofpoint-GUID: haRmbXbvrtymMq6Z8w6oyBp_IZkR4pJF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2NyBTYWx0ZWRfXxbwfAi5Jjoto
 3hxKsC2iNtuXX5B5Zf+jA2Xaz7XKAxTLAAE7AmIrAdnp4I95592L+Iim1PRb5D4NWbkXwVAdI8W
 QszPo58rsgf2TEolcfqdwxv8thyTLEVzz3sVNKm5uB/gPwS8RQBnHp7hUJdzpBhUtnDvWGtRR1H
 3DwY3nB9aPzIF1VD3lWB3EpnK67NveLs+DkZUSR4w4pz6WGryXABxQtS9sBMg87gUqdx2h2suU1
 t259i9UuqzEPJBJD1rajLY0h4bVGI0gjFQpTqloeE09fvT9BtKNImOzeNZfxThS8cMUYNE17poz
 sSx2qRD6l00QCmso64lXuYtXPIKs7greej5iprUDvVD9HRKH0AdWFC1WcHG13fMgqJ6fP9SWqJb
 jTVb6594tgERxntWn8HNeuxSzxA57P0amgR2TWxIqruy+v8n71C2k+jsrgHtbNpNtjmL0eP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=979
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010067
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

On Tue, Jul 01, 2025 at 12:07:07PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Pass along the format information from the top to .fb_create()
> so that we can avoid redundant (and somewhat expensive) lookups
> in the drivers.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
