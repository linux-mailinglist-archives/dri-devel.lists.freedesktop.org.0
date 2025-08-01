Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4684B1825C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 15:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F0010E84A;
	Fri,  1 Aug 2025 13:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lo7XIR1j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C790010E84A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 13:19:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571CLNKj001650
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 13:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4d0tufGm/Z6Jl/eZwE1rEdUE
 GHGFJncqqGMe/QFWJ0A=; b=Lo7XIR1j5ssJZ5aJFEJ3jvWOyhj23UPUeQqxJ6hZ
 lEofbwCYySOusaS/0VzJhsYN2hE5iNrAwNK/Uu8la1alt5Di/PWAPaWQ0OHhhG3b
 w+fDbupDSJGTg3PM4NhQdBnkA4ISzIUDQ6/dDE1ktx4dP8j+3MiC8pm3lyfOd+wk
 819RH9uWWspgz+fHIUuI7q1eAI5XyQMqt0umF7wLcnTy2QpbXGi5S4b4rmLjFN3d
 hMsbupabECoalIltiG+JAE0tMCiZ60yIMZ+S2EdFabFm9vaDnkYLlPqgv5/99Ags
 z4llyXiCXUfc6u348Vy/lR/Gw9/7SeLCtNJbaJWduSml4w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488wgrr4xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 13:19:18 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-4fc05624269so298538137.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 06:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754054357; x=1754659157;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4d0tufGm/Z6Jl/eZwE1rEdUEGHGFJncqqGMe/QFWJ0A=;
 b=nBitw15l97hUIh/GN8LdQXotCOIjffYMWhRzsmzhU5KjN4pj5hjkRcIYuqL4Qy5wkg
 k6j5/u3jzen7vla6c3tQ7GqZN5l6d113Krm8OXmDpVzrOt/+s4OpMe7qZcb8OH3M0w2X
 A7S1aDBc5hyKunts2/cze7H7eoIm2YEsgwE5g9xl1mzZh861Q68Iwp/Jc//44YaYiPot
 qhJ0CGd7L6jmd8NFV2IqvO+ILdbx12QGYywWym/kVw7+bNiaBl9UcUxnGkJnjQS4b9n6
 Lt9VaAJjyc7FdTSKHRDJ0Ebskn6hravGcCXANdLIxUKD+9QneqKz0BOVYicghLuvfB2K
 97tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlgyuBZnbYiUvEx0Ttz5gG2/HL5V9SaMP8jQYatvKuW9HFexCdLled9gCYJCOqsgzzFBH3WnaVi5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxepcgRcInegLedHyfC3ozX3UuDR6y+Y8WunS8DSv5ETl5FJuxm
 f0hx05dNYs0wlQO1UnPf3ENVC123eTxQJ85WPViPAUX6KaIN5Q8HaXF6bYyx4RYuU/y8l67Fpj+
 PNyU1JKmGuASIn831o2/IANzqz+xX6x6oXImmZafG8NBio07mw+3CcuYewuhgyq2m/Yc1Bb4=
X-Gm-Gg: ASbGncs3U7w6QJ96mSum9zWhIVUzuw/bZzz9+hVlxSw2V/cYFoiN7/nUuwDR1SHJ2Qj
 GatwpHnmCkP20p/biV95Xp5PMl1u04zYOFgCZI/OHlu9qn2ixgYhe6aRehZ+z/79fYqDD2WUk/I
 f4FJ747RAee73GHVBqWwO3ooC+LYbtDMWoPEpDI62iv6TBN7uozVu2F0Aw7Sjax8IeMn4868LP6
 jwrGo4+jbA5QlzGLkPSLpC9PxFsdJ91NocWJ/p1b1Wp8kipjcwfKslMVBDMQRnLzLMxfVb1/eq1
 CkTyk4KHnX+z46FbPQ8UOuU1Wz+HeOLVPZc9VQg5eoQnVsiJ0VDUY02+N2/MpQ0bqnKBNe5FM37
 /ZSMCQm4Innu0w0owBhzF5bzpeWgz43VJKn1EyVVYa+EPUwWDR/DE
X-Received: by 2002:a05:6102:15a9:b0:4e5:9d76:e8c8 with SMTP id
 ada2fe7eead31-4fbe87a2aa6mr6627669137.18.1754054356686; 
 Fri, 01 Aug 2025 06:19:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHkaoT6O42+y0vCuPSSWkbuCgRp/zCqGSlqc9t9D1DVO2cvmFzSHXrdljQ2w8yw+NrsztPZw==
X-Received: by 2002:a05:6102:15a9:b0:4e5:9d76:e8c8 with SMTP id
 ada2fe7eead31-4fbe87a2aa6mr6627609137.18.1754054356170; 
 Fri, 01 Aug 2025 06:19:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898c164sm577451e87.23.2025.08.01.06.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 06:19:15 -0700 (PDT)
Date: Fri, 1 Aug 2025 16:19:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH 03/28] drm/writeback: Define function to get
 drm_connector from writeback
Message-ID: <mn5lxsobcdc27m7xjh6srii4gbrpus36bvxyu3krqrxzoj5hrv@k3rc4v2xz2nd>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-4-suraj.kandpal@intel.com>
 <ng2ps7k5h74w6zo62oqazzetunjc2psooobmh3zcrrmxesi2ua@va6z7eqjst2u>
 <DM3PPF208195D8D2676D013483985D2C3FFE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <t5fmzuwiy2otubqftwdghakwmbeltavhbsvrfhgi4tc52uigys@sg2jgz6yjjk7>
 <DM3PPF208195D8D9147AC80569982DE55EBE326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <pax7q7t6gqf4v2ots4ycdfpyecyb62eycht5vlzxodxfl5tlzv@axijwakktt2u>
 <81dccfde92580d525cab5ce95d529e08c27b972c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81dccfde92580d525cab5ce95d529e08c27b972c@intel.com>
X-Authority-Analysis: v=2.4 cv=fs7cZE4f c=1 sm=1 tr=0 ts=688cbed6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=xDGqbUokCh5CAw3SPFYA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: mCYGg0bGuK-e10cr07QzWVNfLTu0ll6V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA5OSBTYWx0ZWRfXzXQv2azsxmX0
 N7Hnc+57uVu5ZntXuckisHVTqJCYJ8wZ+VIyTaPTwO4mu3+uaWoq2GSrr2Kt2anX5K8TUHHQBBJ
 ib6n8do2CIolVbR1+EhijYZt+JepDzRkPMgRU2ZqK7vobic3L19CQ0CIT3vcXN1lux0CWP5Xk1k
 vZqqqxkVAK2vSBHPw0KfyN6I0rdax7pJzZ8Y6Zrk1J7Qimn0p3+aaNusSI2AzYUcI4ggSlsbCBm
 kOwEMRYAxAXwxMglSFXyAconLN9zpj0eKf8UBuMvBVoHkT7I1SKrnMhLDg5eCAFaiOxWrR3FTaS
 ZVdJ7/8LqUAlC8/ehvV574ngpAXoP9xZMjh5Vg8FpWgYP5BWPxA9JxDVu0tA5kzXT7D15hskviq
 tN4Ly6ObIILGK3FZFPj0I6KLXOgrmqFJOCQGcHC2JnpacQ/Zwiw6oc1PrSBPNgBRLbt+BfO0
X-Proofpoint-ORIG-GUID: mCYGg0bGuK-e10cr07QzWVNfLTu0ll6V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 mlxlogscore=832 impostorscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010099
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

On Fri, Aug 01, 2025 at 02:57:48PM +0300, Jani Nikula wrote:
> On Fri, 01 Aug 2025, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > Thinking in OOP terms, the encoder is just a field in the struct.
> > drm_connector is a base class for drm_writeback_connector. By making it
> > optional, you are definitely semi-breaking the abstraction.
> 
> The trouble is, in OOP terms, drm_connector is the "base class" for both
> drm_writeback_connector and intel_connector. We're already stretching
> what we can do with C.
> 
> Currently, it's always guaranteed all drm_connectors i915 ever sees are
> embedded within intel_connector. Changing from one pointer to another is
> trivial, guaranteed to work, and is never NULL if the source pointer is
> non-NULL. This is a design that's been around for the longest time.
> 
> The current writeback implementation forces a different design by always
> embedding drm_connector itself. We can't use a drm_connector that's
> embedded within an intel_connector with it. If we want to have our own
> stuff, we'd need an intel_writeback_connector wrapping
> drm_writeback_connector, and it gets even more complicated with all the
> interfaces that use intel_connector. It really shouldn't have to be this
> way.
> 
> Using the current drm_writeback_connector in i915 requires careful
> auditing of all drm_connector <-> intel_connector conversions, NULL
> checks, and graceful error handling, also in places that have no
> convenient way to return errors at all.
> 
> The OOP abstractions just break hard with C, we can't have multiple
> inheritance, and IMO the pragmatic approach is to let *drivers* do what
> they want, instead of having a midlayer helper design force something on
> them.

Yes. Basically, that's why I suggest refacoring drm_writeback_connector
to mvoe drm_connector_writeback into drm_connector itself (like it's done
for drm_connector_hdmi).

-- 
With best wishes
Dmitry
