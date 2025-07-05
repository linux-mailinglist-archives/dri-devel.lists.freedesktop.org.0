Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63040AFA13A
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 20:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1C010E056;
	Sat,  5 Jul 2025 18:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="glwbARjF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A97610E056
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 18:59:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565Epq6b012082
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 18:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ocaOCMHYE8NDO9OEW664JHC6
 8656egVpSIsX1z3ynhE=; b=glwbARjFKxn/6SSrUX5lqrKzoUw6oEmwe9HpIBw5
 SEhwnJ7qe3Qpu759z9zgz2muJOQMQT4I+w0SSfD0IEAaXyz/UX6PbA+YU0EItnOd
 FI6WQVbgbXtGVRF8Njpb626BChJVy4r+6yAVPliEJl4ybckSLf0weSuhCuWoKquy
 oh55BwDcPXHhDrEi+OqAqnPzJGUjJUvKUdd6DIljgGAJfnGEVWpGw+OwjCLuGFdS
 Ufk6e3KMZq+8HgJBzCDN13+LSO9ia6cAWJrUvcELFdkyz8a5787k0Zd/kTEVwGnQ
 sx+/rwY5KkE2R9SfV2ra9789jTyQxBV+keInD2noWtcelg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pwbd1ngp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 18:58:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7caee990721so383580585a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 11:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751741938; x=1752346738;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ocaOCMHYE8NDO9OEW664JHC68656egVpSIsX1z3ynhE=;
 b=n2A30jmi7pkjsaZ0Nl0+T26PBilLb4qNihi+UrvHZNkxEqIVVkRsxH2qhbQQCoNMYm
 V3LCIke4ImzEaU9ImXkZEoaPdNWJnIMdiMRm2T1vwHbebmWRcWig56q6i9GJkmmy1Ox0
 rMEwke4DA/2bqwTiBo4oyZZ9sWrXRUwFDcWxfl78v157PE1XQfnDJ/K4ePFulXdTSrrS
 6yLWkWLfX2/Sex32NVOp7IiBbBZBMFcT/rp4yqfLtjfkTpBFA+0f4D5JBr7Ypbm58/7U
 K5b9vGYqqXqYI+qkA5Ub3Vx+n7Yqb0T+Z7oaf6+2Wp69ruELGmjqjYhONu20ekgfybqQ
 vzdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4BQyQaSGSDqdM+oaNsGakHtllSFxJlJvVK3cUXQxxb6sfgNJcwZY+Kox6dqe49lf+IROjoPzglnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+HqLl5/75AI1b/Qect9V4AqS9iuXzc26SHS5avDpjZ7NLT6dz
 hX6f1aQ5jTIsyPPWDFxs4Y1AGCS1jZAZkqN4RWYbclF2zB4tVXDCEyXiKRs6NK6rOcbVH6ViJFZ
 V6rWGZTf1jU6zdQZaPzNPljYV62RJJ43EBlBP4a0ez5FNK28tmvg3RJYwBKmX/XDTFy9biU0=
X-Gm-Gg: ASbGnctj69MlS7SpZFdxF8Vc7Jl+o1wv0IC5Q9RRaNJQLwX6y512x/VcOCCqz/f5Ynf
 XLAvQkq+VaUyaU+tFXHGtVCXK1VTKmRkZb9k66H8gOdIdQ6sc504QOG++ToPWZmaPMIy6bczFV2
 2kXLG8584+NyTegI5f3iWfDZX4EWDe1wYb5/4aZkfTV2LGDEx3iWK30C/W50N0VG0kdHlRznxit
 kyH9PcTWq2G8GvqrW3t3nN47cKe1UidfMy5rL9M6D96v9ZTjtLAFEAP1qE2X6bGIjUkzO+E0jaK
 qaK9/5WhZcIlWmTn9/T1JXqetoRMIJLGQ7thmM+1Z3qpFv1HX0r1Jh/k2WoqBqrbI3v/kb7ujTb
 v07Dc8T2pK0If0aN3NhDV2TvbpeyldOK89gc=
X-Received: by 2002:a05:620a:2495:b0:7d5:d49d:3e29 with SMTP id
 af79cd13be357-7d5dcd0a63cmr968456185a.45.1751741938358; 
 Sat, 05 Jul 2025 11:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwZuhJDnQ3LWiy5yGswE6sTDPHJMzCTMeoKblzaS2tUrAReL7ylcXFz0S593CShvSIaBFtHQ==
X-Received: by 2002:a05:620a:2495:b0:7d5:d49d:3e29 with SMTP id
 af79cd13be357-7d5dcd0a63cmr968452285a.45.1751741937902; 
 Sat, 05 Jul 2025 11:58:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383d8dccsm665117e87.66.2025.07.05.11.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 11:58:57 -0700 (PDT)
Date: Sat, 5 Jul 2025 21:58:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
Message-ID: <cueav4uxbhswv2z3grf4qhwualhg3zxknahrhv6uaedit6dgdv@23enbjmj64d3>
References: <20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org>
 <20250625-panel-samsung-s6e8aa5x01-v3-1-9a1494fe6c50@disroot.org>
 <80055981-3624-4165-af0c-3b60c345e8f8@linaro.org>
 <4b9e44b14395ff4c64eba1bd71e63150@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b9e44b14395ff4c64eba1bd71e63150@disroot.org>
X-Proofpoint-GUID: I0xCAgvU8uCJs8hh3JwxJ6JxMqYNxcM4
X-Proofpoint-ORIG-GUID: I0xCAgvU8uCJs8hh3JwxJ6JxMqYNxcM4
X-Authority-Analysis: v=2.4 cv=e/kGSbp/ c=1 sm=1 tr=0 ts=686975f3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=5PY1fqJ0FUbosCpcTIAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEyNSBTYWx0ZWRfX2ZqdbPxS81y4
 MKSTwCM+IlpLecZ+frtkNMVs5lDfOFkT+ZW8hzAWIDVAE1dL9/m4OvIT5/mIVXHJl/qxKdN3oJp
 FvHOt79tUoYJIe3BBsDcRYWhsB19s8vwQb/F/Nbm2llKp/4s67gsagH1ElXBr8DG9QUZokOkERr
 EHlG1qiBlhf+sxWr+BekuH6RfHy9Xt6g9RE0jcoY5W0IvG1coxGWW+jRgVuv9C/R6g817+X6vKg
 /P67lyHHSl6VMzt0SY+lOY3hFbwcA3AA61zCWnb/98jUwvgWxPthZQwyFWiPIjNUk+69zAgbATW
 SiTVeZNQgq56Kl9CAQEbweKxmZmdkm4dCr42MN8cm7CSWM4qEF8680lmw/U4yWy1mVxRkG8lyjd
 erQ6MKnyxTEV+uIK/c63O/SP/NgCJr3eOnSYrSKUi6Qq4o7VzmtoT0snF6K6QHRtfuvcrMAS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050125
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

On Mon, Jun 30, 2025 at 05:18:22PM +0000, Kaustabh Chakraborty wrote:
> On 2025-06-30 15:29, Neil Armstrong wrote:
> > On 25/06/2025 14:41, Kaustabh Chakraborty wrote:
> > > Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document
> > > the
> > > compatible and devicetree properties of this panel driver. Timings are
> > > provided through the devicetree node as panels are available in
> > > different sizes.
> > 
> > Wait, why ? Why not multiple compatibles ?
> 
> The panel dimensions is the only thing which differs. The model name,
> controller, registers, and functionality are supposedly all similar, so
> I believe this is fine...

I'd say, it is typical to have a controller to be used by different
panels. However usually those panels have different names or IDs. Please
follow the typical way of handling such a situation and use panel IDs
for compatibles.

-- 
With best wishes
Dmitry
