Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98495C5FF95
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 04:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6453310E295;
	Sat, 15 Nov 2025 03:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9xyueey";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/UCpTQf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE17410E295
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 03:55:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AF3YdIo1127264
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 03:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kpUJE4SYKU9ynxkJ/T5JJhpa
 CqT/i8ZykNmysQrjF+s=; b=V9xyueey6blpzm/jfavsSbhlfoxZqh6ziY9GLiVo
 pRLERZ2MEX31+yuGsAhlfVnpx49LUnkivh7VOeVkX+iEZCpUszfAr6RWAvx/GoxG
 ZijhYK8E3mzyIqhG1hK2L5/w9DdedzrozrD9Lv3PvXEGCefrjA2nK2F6EPnJkN5Q
 59YLYTARTJ+Imk6JfdjaS45qa6wSMYck595UYohLzKOGwUnrjp4w0vmLrwRUpeB6
 SYq4g3sGHee1nq0e3QSLce0NkDu8LM1+cCMEAkTcfdWp6FkDpecyTGsY74vra0rZ
 jqFpR49ENgMSjHk8p1Xtfaa+aw5Hd9R3LM0WfZoyiVfmLQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aehr2r0tr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 03:55:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-880444afa2cso39186316d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 19:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763178923; x=1763783723;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kpUJE4SYKU9ynxkJ/T5JJhpaCqT/i8ZykNmysQrjF+s=;
 b=g/UCpTQfO73g6ax4TdPunUDNmGHZ40sf6V0J9r6L3gcsryDjKvLe84nLkphFT31XKd
 tEGYUZ5NSDZT3VRa9lxHfX8orDdzUFkXxtx7Sos3WTHyHnceAB/5SoS2xm8koSIOSfz6
 7ScBTp8stiLUrHZJm4TppAY8XwO87ufPKWYLPW5M+2JE/O6nUVcWn8/oBWWWrBg9Wj4P
 +Ag7TZbNW6gyHnlTzvBrI5YIn1hw6glbMTqZSMFxOIWn/7QsXUg2LahD2X2wXUqGVDD8
 0Bpa5WRdyr+by6zv5YBv0gu9DGkDdoD0yfChzQKmvm2VFfxOchxZqFbcVuC8GLuOsNWg
 PaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763178923; x=1763783723;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kpUJE4SYKU9ynxkJ/T5JJhpaCqT/i8ZykNmysQrjF+s=;
 b=mc8mNmUC0kRk+AGTmaGhxM6FMcmtxppQf6ORKWqEZsJHWL4eSShrr0dC3ts0LJek4H
 99iuwVZpVJIlXxZjm+Z1EZErzLfndH/fdg7sZExdrZ7UgsrTe0VLuPipaVA8W8hrse6A
 pNO2nQzVLZ4xV3Z21Pafukju6PO2DKLYRZX+RInifqNAizrUUTShssrfKq4mBQAIApdt
 +YpLgN9aeAFwYWdXMT8tbKJsFn/FQ/N+0yKDkd3Cxuio1UjnQa6lGDZD+rrlUL9lKvJr
 h3GblkakHOixZWf3I5viy8ZYExZS5gSNqjDkZxFJuFpXIZpf8mUrJqeA8G2eqgcjPjhg
 9T+Q==
X-Gm-Message-State: AOJu0YydQ17h6X3/h2sAPWb9xJvvpYALOfIyr8WCRqaulzJvQn8vzK57
 6us+Lf16B//0DG0OdU0xnaqjaPPrX8sI9GdrhlaGeR5RiWCYdinnDSf5/uZQXymFKUa1kbh0D0k
 kCg9c6Ef/QFoKz9r8JBPJ2j/oDeAhSMcQhCn4fjvwjxByV3O2S2fEJnu9wzqpq/VbfS9PW84=
X-Gm-Gg: ASbGncs5CZbO+Iylxd+CXK6V11PLpXicOD79zzdrrnZDBNIIgNVTYtULLxLM0kTeiej
 niJBlbe4jd2Ho++aixIH7fpcI1HE2UpR2uyLAsikv8htfY3zDFLg2ay+z2iLSZnD42UMXmoX3U0
 CLyliBWRvngLVkLuNb0tNl64gDrmnJCkWaYUtFeUGpMox2CUgAMB+pEnO2ybNbXO5nJDVLHpuEG
 qFu89jcJnwQIB6teZdrEBSMOgzlKZtO/cXoOfm2ItV4KlZJDFOZTkCqTHOuuBUUt4DYjBb3pzeb
 ReMnL+PpNaBIPeh6LDwt2p7gmBkoXES7pGgRujX7xFdpoB6nZF8AuD8FfFsujVyD8qLR9E/LLET
 I3bAZ/pstJC4b0PR5M/37d9OEalTUjQ4wzP0u9l+ei3T9qgwW5Yu4N8JbieRyxXVjdMOXZxRcq9
 tLK8rW5fcr5K7M
X-Received: by 2002:a05:6214:c65:b0:882:4dec:42b9 with SMTP id
 6a1803df08f44-882925f280amr79893306d6.26.1763178923086; 
 Fri, 14 Nov 2025 19:55:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH21xNZD/1SaQbAJXQ9lzSs2ET/wK99qDySnRnPvmoMPz0h942r+lDos6cmgLn70aSgdH9ifQ==
X-Received: by 2002:a05:6214:c65:b0:882:4dec:42b9 with SMTP id
 6a1803df08f44-882925f280amr79893116d6.26.1763178922595; 
 Fri, 14 Nov 2025 19:55:22 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040c7ccsm1449901e87.100.2025.11.14.19.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 19:55:20 -0800 (PST)
Date: Sat, 15 Nov 2025 05:55:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] drm/ci: uprev mesa
Message-ID: <42v64xdsaqug5yy76yel4tukh6wkt2tp237vlnpteabyl5qjo5@iigtgujvecwc>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-2-vignesh.raman@collabora.com>
 <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAyOSBTYWx0ZWRfX4QrL9HSepf3K
 c78wqM12Uwb7liihspfC6PI6rkVkUkicANOO84A0LuMyMYQgwwYYe68o5zPOHW9/3l1v8SE2WAI
 YNlzGhhNkP2UDMQUj+rrvsvYJAWrCSQL/RzDX8XtmDENkNSDJHxso2WOi9JQAyR1t9pFj4uWFh5
 hahjrOp5VxwkTn4UqhRZsOiDDgI64nbyksd4HBfHGpCGzS2QiLVF7ijcuH9tE2AAlpQRxwy06G6
 jaJOVZ7ZH3WgfmZWd5hssGPSHR5Pc/qvQ1MUp/AxOUmtOaZwjr/0FoyLesH6JH3PJcpeQxZp7cW
 MBNCA4wUIGTBavq9PgJisifjPiUF7EggKhVBlGSH6cnPCBTQX+6g9bU5+aUdmrD75SOiV3j7Xmp
 KVstddfVSgJ6k8t+bUg6HmW/rJRdVw==
X-Proofpoint-GUID: WHq03JnRU6mUhS1aFi9QgvXwvfJVZp9s
X-Authority-Analysis: v=2.4 cv=TtvrRTXh c=1 sm=1 tr=0 ts=6917f9ac cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=E-Vn-V3zxCEcjh91BPMA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: WHq03JnRU6mUhS1aFi9QgvXwvfJVZp9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-15_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150029
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

On Sat, Nov 15, 2025 at 02:44:56AM +0200, Dmitry Baryshkov wrote:
> On Fri, Nov 14, 2025 at 08:30:50AM +0530, Vignesh Raman wrote:
> > Uprev mesa to adapt to the latest changes in Mesa CI, including support
> > for firmware via LAVA overlays, removal of the python-artifacts job,
> > split container and build rules, use lava-job-submitter container,
> > and various misc fixes.
> > 
> > Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > ---
> >  drivers/gpu/drm/ci/build.yml         |  22 +++---
> >  drivers/gpu/drm/ci/container.yml     |  28 ++++++--
> >  drivers/gpu/drm/ci/gitlab-ci.yml     |  95 ++++++++++++++++++++-----
> >  drivers/gpu/drm/ci/igt_runner.sh     |   4 +-
> >  drivers/gpu/drm/ci/image-tags.yml    |  22 +++---
> >  drivers/gpu/drm/ci/lava-submit.sh    | 101 +++++++++++++--------------
> >  drivers/gpu/drm/ci/static-checks.yml |   1 +
> >  drivers/gpu/drm/ci/test.yml          |  18 +++--
> >  8 files changed, 186 insertions(+), 105 deletions(-)
> > 
> 
> Thanks a lot for taking care of it!
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Hmm, this causes a lot of failures, see [1] (note, the run is not
finished yet):
- On some platforms (msm, rk3399, mt8173) the
  core_setmaster@master-drop-set-root test fails. On other it seems to
  work correctly
- sm8350 seems to have some issues with this uprev, it cant' finish the
  jobs at all
- mt8173 and rockchip:rk3399 seem to have other test failures too

Could you please update fails / flakes tor all the affected platforms?
Also I'm really interested in the master-drop-set tests. Why do they
fail on some of the platforms, but not on all? This seems to be some
infrastructure-related issue, since exactly the same kernel with the
same IGT passes those tests (at least on msm hardware).

[1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1547684

-- 
With best wishes
Dmitry
