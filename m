Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C0AB1F2BA
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 09:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9A010E21E;
	Sat,  9 Aug 2025 07:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCOAK239";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AA510E21E
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 07:08:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793ZCGY013377
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 07:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1bsHJYnJmFvom+9HtBvTOjPh
 UjVkGPYSuK9wLv+UdRE=; b=LCOAK2390Ji3B2txb8jPNckHXkCWed6zqhefftUK
 bD5YaGapCahCvYaTMU8VxaunTCl009NbjBlOCtyXn4m9DU1FI9+/l4cFBprpipsX
 jUfL6PQGHBFZEzTJ1bWEer4rNFFbjOfiZcOXXwvXCiZkSnaQKQw33z+Ds30Q/35h
 0OJyALAL1S/GGZe8UNVE09Tpf9nMLxD9EfD0pfIMMJpEoMSEbzV+Cwd4WnaSxaf/
 s8aZ4XMC/lhBtpD4OKzo/yRh8COM4FjLwL1+vXOP877YIYx4HGMoyZIOajr6wBix
 ya9T67lt1Fkr3mC2XF0uH20Urx6qbnTJ4cH148zZxvPt4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj407rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 07:08:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b08a2b3e83so79938331cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754723329; x=1755328129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1bsHJYnJmFvom+9HtBvTOjPhUjVkGPYSuK9wLv+UdRE=;
 b=OcPuPPi+InJvkcuB7bDJC0j7jrxj33fntreQeHbcbgJllj+rpW+GZ5QB0Kdv5ZfZy+
 Vai0bQqOpRYUDzbUTvkx/+PzC4bQ0SMoebMJS92K2iOAVD0nmTuQwAQ63KUHBNhGwIMW
 CWDNTlHPqlO5cm6taqFWJbKZkNbJv0lLqAIa55TynsWClDKjr/POzyF9n3Lt6oVSk+ga
 x7fAGSaUzc7A7mjFN/QXAKYNKGwpGbQWqVR+RlCpMclec0cTzZ+G+uxBWgWNPJsqca6i
 L9gnbGwtURgKqEUQ1GXRwh4H0O4hmyWF84vL6DxzFb/EONYfZL+NxIGFQmzhKP0WkrAp
 T9Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMAuXJq/6o29jaPS/XwwyGXRDSK58pThhR2o1SuxwYRGIRrUWKLkOolLe/WNFhJ81BabfuinBD1Ow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQEZsvcnDh48owR3UYw63GnN6WwDz8dfph0LGEh8fzG8Nc1a+G
 p8pg92yulO1bNs6q90Wo4RaA2XpY63AuFFZa8vs0fsUzgDZZ9y8DO1ExWKdQMKhiScxTrNzVb2D
 3DQLBJ2ayWL6DrGqr3txloDP1ekQiLeASxfFHO6/wdd1u1+zmNROiFH70tHJ6/tQTabG2IYF3ly
 9HhR4=
X-Gm-Gg: ASbGnctvQN9cQ+pK408D+3cFK9xpHX3gXk1KP8RnxFqLN9dTheuVxbWQnwQuZhv7cI7
 Xl7ETFDNbLBCN6xof4C7IDVPCccYkWucHKAxN9gi16KfdYaPpuU1zup5N0uA3zxi3m3KRlEGxLs
 KXaNGXpT3e/yT210AXTIvNkZVrAStdthPWqaOwfpuoscO6I3Zr9a/tY/agZ58gEh5X1D2CeTtv0
 j7+6hPopY+O8rPum9+DqZvrn9lmWoDqp6hSAeKGSZ3oQ2804Se3PRV4A6SAhKE18DgkE/4PSWGD
 VesXHdG7UTERmuPWme8WjM2n7ylzL2Dv1PehzAnXDtov/1XnONpIDfw3Chlj+UcSszJpWxmcQWi
 91kt77q/DNN0FOm0mF589wsM44g5bYccUCeYV65u4dDM4SxW3yXFw
X-Received: by 2002:a05:622a:130e:b0:4af:22a7:7f28 with SMTP id
 d75a77b69052e-4b0aee5a5f9mr89036401cf.55.1754723329076; 
 Sat, 09 Aug 2025 00:08:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFd77jpE87+TbXeQWe379IfpTrsjh4cN7UjqdULffX0AnSqtEs8zUbIXZlkMRkW/x5/6Zjgw==
X-Received: by 2002:a05:622a:130e:b0:4af:22a7:7f28 with SMTP id
 d75a77b69052e-4b0aee5a5f9mr89035981cf.55.1754723328489; 
 Sat, 09 Aug 2025 00:08:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c98ab8sm3277301e87.79.2025.08.09.00.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 00:08:46 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:08:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 08/12] drm/msm/dp: Drop event waitqueue
Message-ID: <yqgfdii3fk3kcwdcvbl2bv4bt4yitu2fl2gvjpp6xncv3tdgl4@266uq3yejcll>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-8-7f4e1e741aa3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-hpd-refactor-v2-8-7f4e1e741aa3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX+XOL2gaAgkRP
 Mz9fRiwj1cteCuXGugF7wXaWpmAtR0wWDxbLh4nC2ReF80hlV6WMJhsp1Abd1LPPHYaWGkBu/7j
 Zm+0bR5c7SQXpcJmSI71FGSdDseSY17ePyDS5Qo8v8AqX4hzR6620DAew7HzBcrbcII3hIjtWUD
 AdGdRxZa4Q5rwjoSiBN0gbvt0i2wTY7ZV6cYZfxmwPTC3h/d/HW8nP8ciCeHPu9C8OBqgz869eW
 KhETwfqAxhubvPtzAc+uCjsy2UGZIpO1m0U5+jJlfS7SBqazYWSG2JJBTcTUfy7BWcM39MynFlj
 uYYDxQMcEXyR5O3q5os5UAVxjzst1M+fAqHurFYsNVpYbu86aodiZFh4moz7ejMdOg1qWJOLe9F
 tLLJvF4X
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=6896f402 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=3asoBNdhdsPQsZxcHcwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: exZ6Xllqy-TfP_NeZA3IfIEXBuRReuqE
X-Proofpoint-GUID: exZ6Xllqy-TfP_NeZA3IfIEXBuRReuqE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
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

On Fri, Aug 08, 2025 at 05:35:20PM -0700, Jessica Zhang wrote:
> Since the HPD IRQ handler directly notifies DRM core for hotplug events,
> there is no need to maintain a separate event waitqueue.
> 
> Drop the event waitqueue and all related structs and helpers.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 255 +-----------------------------------
>  1 file changed, 7 insertions(+), 248 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index b9e2e368c4a8..eabd6e6981fb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -52,27 +52,6 @@ enum {
>  	ST_DISPLAY_OFF,
>  };
>  
> -enum {
> -	EV_NO_EVENT,
> -	/* hpd events */
> -	EV_HPD_PLUG_INT,
> -	EV_IRQ_HPD_INT,
> -	EV_HPD_UNPLUG_INT,
> -};
> -
> -#define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
> -#define DP_EVENT_Q_MAX	8
> -
> -#define DP_TIMEOUT_NONE		0
> -
> -#define WAIT_FOR_RESUME_TIMEOUT_JIFFIES (HZ / 2)
> -
> -struct msm_dp_event {
> -	u32 event_id;
> -	u32 data;
> -	u32 delay;
> -};
> -
>  struct msm_dp_display_private {
>  	int irq;
>  
> @@ -100,16 +79,7 @@ struct msm_dp_display_private {
>  	spinlock_t irq_thread_lock;
>  	u32 hpd_isr_status;
>  
> -	/* event related only access by event thread */
> -	struct mutex event_mutex;
> -	wait_queue_head_t event_q;
>  	u32 hpd_state;
> -	u32 event_pndx;
> -	u32 event_gndx;
> -	struct task_struct *ev_tsk;
> -	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
> -	spinlock_t event_lock;
> -
>  	bool wide_bus_supported;
>  
>  	struct msm_dp_audio *audio;
> @@ -212,60 +182,6 @@ static struct msm_dp_display_private *dev_get_dp_display_private(struct device *
>  	return container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  }
>  
> -static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 event,
> -						u32 data, u32 delay)
> -{
> -	unsigned long flag;
> -	struct msm_dp_event *todo;
> -	int pndx;
> -
> -	spin_lock_irqsave(&msm_dp_priv->event_lock, flag);
> -	pndx = msm_dp_priv->event_pndx + 1;
> -	pndx %= DP_EVENT_Q_MAX;
> -	if (pndx == msm_dp_priv->event_gndx) {
> -		pr_err("event_q is full: pndx=%d gndx=%d\n",
> -			msm_dp_priv->event_pndx, msm_dp_priv->event_gndx);
> -		spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
> -		return -EPERM;
> -	}
> -	todo = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
> -	msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
> -	todo->event_id = event;
> -	todo->data = data;
> -	todo->delay = delay;
> -	wake_up(&msm_dp_priv->event_q);
> -	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
> -
> -	return 0;
> -}
> -
> -static int msm_dp_del_event(struct msm_dp_display_private *msm_dp_priv, u32 event)
> -{
> -	unsigned long flag;
> -	struct msm_dp_event *todo;
> -	u32	gndx;
> -
> -	spin_lock_irqsave(&msm_dp_priv->event_lock, flag);
> -	if (msm_dp_priv->event_pndx == msm_dp_priv->event_gndx) {
> -		spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
> -		return -ENOENT;
> -	}
> -
> -	gndx = msm_dp_priv->event_gndx;
> -	while (msm_dp_priv->event_pndx != gndx) {
> -		todo = &msm_dp_priv->event_list[gndx];
> -		if (todo->event_id == event) {
> -			todo->event_id = EV_NO_EVENT;	/* deleted */
> -			todo->delay = 0;
> -		}
> -		gndx++;
> -		gndx %= DP_EVENT_Q_MAX;
> -	}
> -	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
> -
> -	return 0;
> -}
> -
>  void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display)
>  {
>  	struct msm_dp_display_private *dp;
> @@ -284,8 +200,6 @@ void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display)
>  	complete_all(&dp->audio_comp);
>  }
>  
> -static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_priv);
> -
>  static int msm_dp_display_bind(struct device *dev, struct device *master,
>  			   void *data)
>  {
> @@ -305,12 +219,6 @@ static int msm_dp_display_bind(struct device *dev, struct device *master,
>  		goto end;
>  	}
>  
> -	rc = msm_dp_hpd_event_thread_start(dp);
> -	if (rc) {
> -		DRM_ERROR("Event thread create failed\n");
> -		goto end;
> -	}
> -
>  	return 0;
>  end:
>  	return rc;
> @@ -322,8 +230,6 @@ static void msm_dp_display_unbind(struct device *dev, struct device *master,
>  	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
>  	struct msm_drm_private *priv = dev_get_drvdata(master);
>  
> -	kthread_stop(dp->ev_tsk);
> -
>  	of_dp_aux_depopulate_bus(dp->aux);
>  
>  	msm_dp_aux_unregister(dp->aux);
> @@ -585,33 +491,22 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
>  
>  	msm_dp_aux_enable_xfers(dp->aux, true);
>  
> -	mutex_lock(&dp->event_mutex);

I think the event_mutex should be kept as is. Otherwise we don't have
protection against delivering the next event while we still process the
previous one.

> -
>  	state =  dp->hpd_state;
>  	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>  			dp->msm_dp_display.connector_type, state);
>  

-- 
With best wishes
Dmitry
