Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC903C17F7C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 03:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CD910E6D5;
	Wed, 29 Oct 2025 02:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6ampo+Z";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBgcHULO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E7010E6D6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 02:00:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlZUQ2575814
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 02:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5bzOXYFwaaf6ef1nwwsvGpFG
 6gZ9ZAmal1F522J4MMQ=; b=R6ampo+ZFvsBAF4jHDCSWRHW7XLMIkAVCsvkw3Vx
 p/jWr9sS9uwLn0sW7C9FfQ0CZhMTV5Dnj7NqWLW4dQF7z1p1eYFMy4mhEXcoJLzM
 HZIqEJLYa6ucI8zD4TSrN1K8Ez/JTIwUdGPxKa+97IShOaZkHRkB1KEbBZhYfnFr
 6eyZufooWZkvbWXf83vTJY7577i44wN5xPwlKnKcY85rd9NkkuYu2gX7SqMhn/WV
 rCicL0c4myCD05l3IF/1eR16s+xR8LHX3YZ7X0rYTbIFOSy6p6akQwkuJjamOevL
 nxpHbqoQGzbXAn9q42tl/JH17MI4LfxCiqcST6J99euOWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a20u21-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 02:00:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8a65ae81248so643148885a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761703247; x=1762308047;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5bzOXYFwaaf6ef1nwwsvGpFG6gZ9ZAmal1F522J4MMQ=;
 b=EBgcHULO41fjW0zeEygLq+n7FqSoGUUEYSyzMMSUDFWvMvsrXL00w5FWDOznmOpSo4
 QEGME1BEzFCYq/WelbpPgpw01T/iBa6QZDwvMLMzM9vCyyZ61FoKYLQCYEGWYEPmNtdo
 0C4AthHsurTzUeNAu4e9IsPWXP5x5mDQx4cZnka7Tu/6mpkVEBPfipTtdsuh49iwqGXf
 YkYFgZmngF1x7nkKhixUGW7/WLBUmRAVbD3miUeU8iYTY7GOQk+c31Hen+Owmh0K5B6w
 yb434HQ1OAGd5uVAhfgOY6tyekO2WaBGq2KaMzf5W6ZArzhUMoCZMjtdIc+yCnVXCz23
 y7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761703247; x=1762308047;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5bzOXYFwaaf6ef1nwwsvGpFG6gZ9ZAmal1F522J4MMQ=;
 b=IMXAKfS33KOHIAU5SNnz3rj26qoq63xWCi+ybbv+NP+xtm/pk3hfgPLPmGZG2HY5Xw
 vgVtrYaO6tH1gu04yAR5heHKTBcbtJn/Fp6+YpmJom+AlMw9mgYrXKMEjSYTJDAOrm59
 rAD5va0SZjhKgCdVdep1HQroVxdhftJ58pqaCxVQIuVlP5mFZMZRAKrZTaatj4DDHgVd
 PuZcRmZ5v28Njt3h2yjJOQJ03qRpOi4BzfErYbkNh6bvQNFFAxViTkVJ5inIEVd+q9Wk
 TjWIjsWf0RojdAbLlEtZR+0sgAFWSRUDWj5DIJFg29lHtSPK1oIToKTvrUVkoN4opJY2
 xt5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ+TbRNgC5yfsQNHV0/3Ecxj1zeKvQcLA6AcjuajuGtgbF4StEQz/4H42c6j7tglflGAYQKPCaZe4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKInb0vlM2W3x1xO7+x2HWd8bKjlp7+K7lRAzlT8jo3ML4mQSr
 zu5LfkOgTpvkjCmcbKTM98H4xklFXr3gOenSs6tRn5gFYYD1ynOfwwZapr8h3tkT8pga0uZxHaf
 W2xwJMXZyxsU8Cb9r608OfHxHBqeEgmW4HM/UeOoKsqbPQ1ajcRV+7MTl7+Ql/u5ycq4kvvg=
X-Gm-Gg: ASbGncuk5KzLWZIoZGlOu7xSLHTSakdckNqzDUliugfNpqnM4pl8jkR6N8CtjOjMUny
 Xyfvo6uk52mO1ngGld8ctZisszBiMGoT0mnFQ/qbvPv4TEttzeEIUnocsd1BY8qRSSiEc16EEzF
 orOu59brjpp8Hn2PmIBehTqqYqZcR91bvyt/Zg38NsMio/1B6Y5Bv5BbgouysbNO2YOvriEc8c8
 YsGus/Fk/q3Y7TUVFNkZuK/tR/GmAMOHS5q7Dgv6MKTQooED2KdfH1utDJWTASJtEPXp3Gk9z6b
 UAdw5E3i08LeK+gG4VlejVxeS988fuD3fS+sI53vJhShC7VY9EKWGKaQ+37qHLUSIzB0/j4lZwj
 lE30Qo8TKmBY9KkzUpilMqlJQn+7s6VZyAe45Q6koSSHoeCY5uQRUeAY+tgiBCMsp
X-Received: by 2002:a05:620a:4610:b0:89f:9693:2522 with SMTP id
 af79cd13be357-8a8ef62221amr176131685a.73.1761703247219; 
 Tue, 28 Oct 2025 19:00:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRJWEWBjcsXXkAu9QGAiqjDf7yt8PDhra8aQ88qxBQFgifGl7DRhLvxMb2Y2wrCbtbr5g8rw==
X-Received: by 2002:a05:620a:4610:b0:89f:9693:2522 with SMTP id
 af79cd13be357-8a8ef62221amr176124585a.73.1761703246623; 
 Tue, 28 Oct 2025 19:00:46 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89f24cd592bsm964396885a.18.2025.10.28.19.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 19:00:46 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:00:34 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSi PHY
Message-ID: <aQF1Qp6Lmru2oHC7@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
 <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
 <aPsYVUjyPru5FwPe@yuanjiey.ap.qualcomm.com>
 <2pyurzgalnjwsxqw7qhfguebps45ne6iua7gvioagz554ra6ru@nhe4tnmabqp2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2pyurzgalnjwsxqw7qhfguebps45ne6iua7gvioagz554ra6ru@nhe4tnmabqp2>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxMyBTYWx0ZWRfXyXe9AwL1Ji5y
 N2mPdpujX5xOeHUOTbRunntjOOxGa9Iz3ZFHZ/t2oH6jxrgVdogWi9maCG28YxMMTpH/WFAquHD
 wsByIVkHD0c5OHYVZRb/l/2AZikyiCGW/SeAr8UkEdg3Tq7amVCgK8oYGh/9+j5l7i+0lsY/bJy
 VAjUU7FyaWgFFIMtVdAoMp6HCAkmmL37Ku3sFx7hLoDqGdmeQmfUK4D7EcYTSdhfVA8NXifOrlG
 n9MSzsGOxELrsiNdm3Cac7r46R8pBZoc9Mqe7L/sIqMAmgmhuCFNPqAbikK8InoBU3ztEpQWuWk
 05MX9nMWJNFlWtiwj+4nxDgpOnezV5NVoTbK1gza8GlVzkzVuYYRm2iBCiSWqzWTvLjYhcrRvuc
 dS24yTlSgA7uhCbhJ2zuUDLJUf/0HQ==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=69017550 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7IK9lZAqeo-zbWUCvDwA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: frqeKtmXAHhYsvztAfb5LDMaVWgEC0qC
X-Proofpoint-ORIG-GUID: frqeKtmXAHhYsvztAfb5LDMaVWgEC0qC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290013
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

On Mon, Oct 27, 2025 at 03:30:43PM +0200, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 02:10:29PM +0800, yuanjiey wrote:
> > On Thu, Oct 23, 2025 at 03:16:31PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Oct 23, 2025 at 04:06:07PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > In the subject: DSI, not DSi
> > OK will note.
> > 
> >  
> > > > 
> > > > Add DSI PHY for Kaanapali.
> > > 
> > > Why?
> > 
> > DSI phy for Kaanapali have no significant diiference with previous version(SM8750).
> > But some register change make it imcompatible with previous version(SM8750).
> 
> It's either "no significant difference" or "register change make it
> incompatible". You can't say both.
Sure, will optimize commit message.

Thanks,
Yuanjie
 
> > 
> > I will give this reason in my next patch.
> > 
> > Thanks
> > Yuanjie.
> > 
> 
> -- 
> With best wishes
> Dmitry
