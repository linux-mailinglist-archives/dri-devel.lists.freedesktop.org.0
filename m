Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA27B0E3D7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 21:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8811510E31B;
	Tue, 22 Jul 2025 19:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUxoL7Yr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317AB10E31B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:05:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MI1B70012944
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=P2+6l4qAfd3G8OT0Vp0C7LdE
 m1O9SDlPysbdkSzFPqg=; b=MUxoL7Yr83E+66mLMhAAylNYCqeVBssfMOlrmT4S
 aAbjRbfxz0+QE7G2I3hT8WVzhyN9cIyCDNOlDGs8qUjrVHsHNB5+SznDuCxI/NmL
 D8YY8gq4AZtUpYzHJTaGtePF+jv6xZ5d1syLl53KWwgNcji7lUHHw0idozwBbuOX
 I2SoEvbhgHHIBUnySrmJzzSWEpJPfGR4pgOFRK+PXzvnsfBHHEt01U9VozkdoRe3
 uF6uGBnVid5pHvfGaUDSgZ3NBB8N801sBD5eyPE67oHK3FL230RT//0e1GJt0tAs
 GYh4r5vWb5o+UmzGzOC6eRLhVpeXtmYOph5AAFLw4kvXuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6mvtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:05:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e36e20d700so29098585a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753211142; x=1753815942;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2+6l4qAfd3G8OT0Vp0C7LdEm1O9SDlPysbdkSzFPqg=;
 b=JcuFCN3T96UHb0OcrplZxYv10wi7Em0CdVQZOXxyjNcQJ0rg4QUUXA2Cz9cfNO5Sqj
 5c7xjBVIvJrkDKzRHRNZYH8bQkzrGgVzOIrhmxln+3PVFYIJZC2sHMC29nG3kbEamWN8
 3DmhmSl/2wVyAiUAKX2Z8c2CTi1L47Qg4maf78kgFKxMeQteaaErWS9FcftTOLRGDX8Q
 Xgo7+3R1rUyakVMJcY0QUTWvZJ/nx5KhwBro0ccTzGdWDnXiOI6YApZmjOKu7Mo0phyM
 +l6MJ9meMGXfuDoatyd17boqJfkqu4GMz9aOScNwCR75N3/ge9fCUBwmjwfmUGsAkzhb
 MFFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLcOj8eWwSiE2RSDhVqPp9mQQzJvF9jdJ1auU5z8J7etP18p2Espa/p5ei31bmTX5e9AueqFqwQHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlujblcjzTp38sHvyUZ5eSqn53owyQkVBAbrYgBDSwRMxMgTkU
 aY48p5Z6sTWh9cHKZJKrj/XI8FGK7Q5bFrQot21L4E/UZUwysfO5gYmN3lZ3Z9AC3AMxQd5UHbL
 4rymRD5YEuqrMk2luvfvvMbhQu62lqvpjO3oUHwDh3cwWk13vZ6VMwGUuw+IzECD8LoobCK4=
X-Gm-Gg: ASbGncth5NyB9aUl9BX03uo451SYAL9Nc6iIy8KCDWWw8L51puKJYN0z6/3iDr7O5jP
 +DxLzwEZUmLHeoVHjK17dFSwRHAC8fBNBIbW3UAKkUHg+ZCIKy0OwYgU08NHsByH5GUEBep22oj
 sjBI6T+XValN8BB1HIcPZsk9aArH/te0mfyifYRQvXErU2QSlVaXLCHP+nAMH7aYFrQSvKBoWaf
 6uzeAClVGClTyhSyT1CxyF/ylg6GeUF+Ew6uDvIhQ+5dk+QBC2I3iIQchCQcNQxKmFAxsakWIEz
 FKDBU4CwRFUmDnszKv+HqopnUgmwAftqbmKZFY2NBa5edQiGoXNNDvRI3El6LNjivVkcMlD+l1l
 SZWVeW59KVY25voXTq+aUhmQeIEcHLrC7czvbDQvt3LCKD+QgiHXi
X-Received: by 2002:a05:620a:7004:b0:7e1:aeab:41b6 with SMTP id
 af79cd13be357-7e62123d2admr639045985a.18.1753211141898; 
 Tue, 22 Jul 2025 12:05:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnWw82SLv09ir9ZtrixO/tE940fX1DelTTNbNTu76eCwjlOF98H3Zx1i+G/fDCf6mx0HVYLg==
X-Received: by 2002:a05:620a:7004:b0:7e1:aeab:41b6 with SMTP id
 af79cd13be357-7e62123d2admr639040285a.18.1753211141325; 
 Tue, 22 Jul 2025 12:05:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31aba0f7sm2051200e87.83.2025.07.22.12.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 12:05:40 -0700 (PDT)
Date: Tue, 22 Jul 2025 22:05:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v6 3/4] drm: Remove unused MIPI write seq and chatty
 functions
Message-ID: <46h32rtuyamdvg36wegmi5fonfg6o6gau2ek377mhumscd4k57@3mw47znxnj7p>
References: <20250722015313.561966-1-me@brighamcampbell.com>
 <20250722015313.561966-4-me@brighamcampbell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722015313.561966-4-me@brighamcampbell.com>
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687fe106 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=cm27Pg_UAAAA:8 a=wukD7SXyAAAA:8 a=EUspDBNiAAAA:8
 a=BQFrTPDZmi-2fyfDvBEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=n7THaJik3DRP1sDdJiGm:22
X-Proofpoint-ORIG-GUID: -HLTBxl60sEStbSvJk1msBf4fRkTzLh4
X-Proofpoint-GUID: -HLTBxl60sEStbSvJk1msBf4fRkTzLh4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE2MyBTYWx0ZWRfX10WFjfqslMjQ
 3p/MrrtAliPHQT4oALhns2YP0gtw1V9MyOEG7tuN7J9sS/0RnjtbWrD0OgayQMnA/nP7mTymW3B
 zEFD/n2VgaF7pLBxPx2XT84tWyzC418fvI0KTJaOO6DmWQGEyeH9LfJ17wOhfUptzQqya/DgI/2
 xumt2d5naxYh2kVnyLRdA99qbBaYjFCK+VWunsJhPljV4nkmKqlZLenVXu4IVvC4jJSLp9WJnEg
 Zp7cxEl/BEDmbAl6AuhHqLnBZHZpgysvg7IG514d8pxTW77bgWNZAfd1fZyjhzeGY9pCxLyEMpC
 prpEB+Bumaz9m/Ea29pnkzyaikoESE0LQh9ORgW9s4pxt4qfZlo9d0unD9raU4lnK0S6Recz8EW
 tVBI9lp/vvIUNPVb1ZGsQjy8hfm6ZTSTKtPm1CK3hB8oSUs9VvnZ1L5VOgsmjr25On8GTtdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=669 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220163
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

On Mon, Jul 21, 2025 at 07:53:10PM -0600, Brigham Campbell wrote:
> Remove the deprecated mipi_dsi_generic_write_seq() and
> mipi_dsi_generic_write_chatty() functions now that they are no longer
> used.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 34 +++-------------------------------
>  include/drm/drm_mipi_dsi.h     | 23 -----------------------
>  2 files changed, 3 insertions(+), 54 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
