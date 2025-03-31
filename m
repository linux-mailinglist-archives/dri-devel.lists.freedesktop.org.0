Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11615A76F37
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 22:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42A610E495;
	Mon, 31 Mar 2025 20:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6CIYMZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432FC10E495
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 20:28:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VG8Fam031690
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 20:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3K1rbl6qLD0AtNbSIccTfCXz55A/TcpEH0lxj5Tjkgk=; b=o6CIYMZjS0eTH2pW
 DwtcHer2I2PH2+rmXWG0qUSITBqjCOxqK/ouXEns8OcSAZgvrCtlMdbv4mIO61qF
 j8QLgiV66fCb8Yk+o8LZs4LQ8wmfl8yP8lIq9m4KqKxqo99JWeZUUD8kQl53drp1
 Hj+VvglfDlSRAMsFJTHnblsbDO/pqt74bp3wapT6pWkvD8Gf1oqYylBvfu5PGUak
 bcRFZqy9zCkTm4zj2mqGqR237ICIq3+RGOlv+5PIHORyCMUU7yjdrOZPLY4UnAAh
 29RnM0PjYD6YawuJBmqLqmdM7oeJE4UhL4nb9ZEBrp1nu3WmyzUgIRLj0mtCcAVm
 1323Sw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45qxa7rhqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 20:28:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5c77aff78so382904185a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 13:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743452899; x=1744057699;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3K1rbl6qLD0AtNbSIccTfCXz55A/TcpEH0lxj5Tjkgk=;
 b=FuKU0eiW0AQg9xAqyRqio0S/YXUiQqx3bon02/IsLKl77I2O0KZUHwNKObqz1eGXOX
 FkH0SRnjSAfmB04CvbjoyMQMaU/38SnLazx09pq8ttYihAhwEHSH/DQmi4yKo+cq9ciQ
 eihEExTgMl1rpGHYPeV4eETvXeAuir1ngOQ1TRjWJPyufRXKCO8qmUgkPUVyKvig0LRz
 EGKoaRfMC9VQcUu/BHqMOm502sNizBtbAqXxBPkV3/CtLWQ3rOMQjJbYsbrGulx4jXrJ
 27MXlczJV19RG6/ek+okU+sFXltG3BETLOTSm2x7sdDKxOspI0md+GiwUUkRPrBsg+3K
 HUbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRmTfM/plhMJ5/T/HELet96Th6ud00yxhwD+E4B4KtTk+FcWhPO3tDq+Nmm16/5EQXoJIzz1tMsHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6FHcEgV3Cf2eX+Rh2HTLoZOHdTx5jR2wuVhAdM+T8dQfx+x2P
 PuYeaPkTxd74cj3QfZnXazn8QUsT7DxkawxSq6sTxbaN8wFE8w0KNkw4eMVBWouWQ7DhaDVZVFO
 YeiYYpJrwkXddfy+UGb5ZvxRk3+EfP2PMQElRZ8I6LUuKT65hYqn68DTI+FEe3M5lQwc=
X-Gm-Gg: ASbGncv4F3RRRDUNQ7fcYvJYwVSlWnaaV50NO5/vFRQPY4PzzsLHIU1GkLlCQ6DT+Kx
 QieX7Z1sHHUONT6RMOtACT54ELn+blY4lXkBBd5yRpeWmN9GO5HmX/HvZ1Pm3Gl80CpWyuPIPG0
 7g0mpZzvKF69ycZc5H7ocCAmwrI9yXfEXrV0RPKdikvHm1B39IOI5xn4huXpsVuNnRm8RtQ07nX
 A6F2POSwsFkHZnOXl7vikPHvW6zL14jIKMUABXrPIFNtLLNoOKc0nyumuh234362+qg7m7Ijttf
 iN9vS+532vywaMLhVhXrBxat3ZpmdNYIv7F8UZC655jsHtZirmAzOZhnuWo8NzAwYuKY+2FB2uE
 orJw=
X-Received: by 2002:a05:620a:468d:b0:7c5:5e05:df33 with SMTP id
 af79cd13be357-7c690897454mr1407868585a.51.1743452899558; 
 Mon, 31 Mar 2025 13:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZsy3ubrttJKu3HDyw18jx9OGKPzoNm6q9xzA+s2DW7AytAK8ZIKxMqQnEzQcoeHb/Y6PrMg==
X-Received: by 2002:a05:620a:468d:b0:7c5:5e05:df33 with SMTP id
 af79cd13be357-7c690897454mr1407865485a.51.1743452899194; 
 Mon, 31 Mar 2025 13:28:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2acf72dsm14925951fa.48.2025.03.31.13.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 13:28:18 -0700 (PDT)
Date: Mon, 31 Mar 2025 23:28:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, asrivats@redhat.com
Subject: Re: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
Message-ID: <jlqxx47vzlp6rmwpi3tskig4qu4bgyqd7vletxbzzn7xdpep72@42tzrjkg65lh>
References: <20250331061838.167781-1-tejasvipin76@gmail.com>
 <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
X-Proofpoint-ORIG-GUID: tZGnbhUaEJVZegoWJIvogy_ZqSdwD1_j
X-Proofpoint-GUID: tZGnbhUaEJVZegoWJIvogy_ZqSdwD1_j
X-Authority-Analysis: v=2.4 cv=J9Oq7BnS c=1 sm=1 tr=0 ts=67eafae4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=z-ExhNoxjeCmSYn54VYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310142
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

On Mon, Mar 31, 2025 at 08:06:36AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Sun, Mar 30, 2025 at 11:18 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
> >
> > @@ -157,7 +137,6 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
> >
> >         ret = boe_bf060y8m_aj0_on(boe);
> >         if (ret < 0) {
> > -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
> >                 gpiod_set_value_cansleep(boe->reset_gpio, 1);
> >                 return ret;
> 
> It's not new, but the error handling here looks wrong to me. Instead
> of just returning after setting the GPIO, this should be turning off
> the regulators, shouldn't it? That would mean adding a new error label
> for turning off "BF060Y8M_VREG_VCI" and then jumping to that.

We should not be turning off the regulator in _prepare(), there will be
an unmatched regulator disable call happening in _unprepare(). Of course
it can be handled by adding a boolean, etc, but I think keeping them on
is a saner thing.

> 
> Given that we're already squeezing an error handling fix into this
> patch, maybe it would make sense to add this one too (and, of course,
> mention it in the commit message).
> 
> -Doug

-- 
With best wishes
Dmitry
