Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B914BC9411
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 15:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E28710EA40;
	Thu,  9 Oct 2025 13:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jS2WKOgm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4334710EA40
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 13:21:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996ELtI029472
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Oct 2025 13:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=waw7/BuUtSlk9S6varyqbKPD
 0DkWdx5X+6wL+I7Srvg=; b=jS2WKOgm5Aq/aoIoCdC6qCG0oajAKzEYIJjyewgc
 n+sxPwju2jNt56GsjBbjN40guRNMlYdjRNTHh3frfUl2Fb0Kd8Bhaf4mfvqg5kjH
 2pXMXLMFITJb+O1RyUkKSzbm16b+hGYRSYuf5O5Xx4g6abmKJt1YghCcLyRUWnJB
 WMbNr3JWnsvXaz9fsxFLi9xtpkiojNwKLANMLT/Zzh/McV2poSnxeVpwBR/sBCPm
 tDhvoDcZekonznD4kz2RZ2+zFip0//LVck2mFdSQGQkPqwmHYwO9niqlF9vXray0
 coa3E31UmDV73Mhk/ky0AFhD4eOBtJtJFUeMAQxrM2wyDQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4njwea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 13:21:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e574e01ed8so30645001cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 06:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760016068; x=1760620868;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=waw7/BuUtSlk9S6varyqbKPD0DkWdx5X+6wL+I7Srvg=;
 b=m6mcvxX9JP5tdLKfN+ASerCY6sekOMbGzdkZ2DVv70f+WHQ72MeQzHKi3SEtuyyEbI
 dKEWKwIG6n3G18eznAiCDTsawmeQTRymOgDNyO2TVbMvwl7d3ah/b0wlHU89eQCHzncj
 84+z2fAz1hMhVhvD68WcCWDNv1C07NHZEzksjxGZEZHchuESdSWP34Xa7fF+UxEzMxY/
 NqTlD11VViFsCNJRCPs0up9xT4T8LPlq0jubiRhGiqCHKbstpwBTE3O9aRyzeDRsaId5
 qe126botiZ4z0E4w4fxpDF9UiolyET5lyoAEBoFElAcsDl9VI4/0GCh+GgkBOVICZ4nf
 VFbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL/b+pLcz6vcROncftNuP//chIHOjF1GnMqMF0avzYU8FCdE8rYs8dXKTuEwqSg8LzoaKZr5RTUVM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJEnrIZdw5rmhQYEYxt6QUXf+qaFACQeIXplM/0EJc9BP+7daH
 CIHeUKpWfpFnge4K/sYO9VsN3gqKHFDA+KjAzBzkep9LInAx3LBEELqGEBocWY3oYYcgp5mongn
 CBZgQtmxmn7J8taNfVrvqZUhGMFpY9ji7IvEH7CLbbPMn/nDqqY2/VGnVKXslUeFTE9Rilrs=
X-Gm-Gg: ASbGncuNdRyICDHfBzywx04Sv1Zulje8UZTX70NsHPa802b66sjgMNlVaabRfCoBV1d
 IhqwWgekJq3E2elFfFbTAMkVU7k+CjOzT/Tr0FlXj4sxHa2QvhAqVDlmOiiy6jWn4NRTx1oq7hW
 ChrxaDU5yS1voyUg3B1DsYki4ZAKErVOxYEjcvHercBkIdKLF8Qcx57TG4Be2akiKGyUNgq6+PW
 echpKBaMEj0f1RJc9dQORnthHRiXfm90wZ7e9n6VNX7TbHNVjSIjC3/+bw7NvkFTHyePhkHEWOP
 UkeXJyfuiX/XG/FubJffTzJCxCEZ/q7VUgF7ieq3xsT/21UNfPSjdIBNW7U3/BmxvxpcVS0WBfT
 wjld4VIi/v2RAHofpyhz/qVfujU8QiZRIhEvKY7X5y9j6djnYCQpyarptMQ==
X-Received: by 2002:a05:622a:11d5:b0:4e6:d2d5:c7e8 with SMTP id
 d75a77b69052e-4e6ead767famr97688681cf.83.1760016068381; 
 Thu, 09 Oct 2025 06:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu0n6rRRsmUXdCk2v7oNX+QOVKtkYVegxJUOUjhbLvLoTCMRKVA3rX85gHWp+4lwdo4BWRLw==
X-Received: by 2002:a05:622a:11d5:b0:4e6:d2d5:c7e8 with SMTP id
 d75a77b69052e-4e6ead767famr97687491cf.83.1760016067125; 
 Thu, 09 Oct 2025 06:21:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907ac22780sm1052707e87.54.2025.10.09.06.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 06:21:06 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:21:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
Message-ID: <bmsxmwfdwx7wlmngaqpvz7c2nudcoukspkxgq6zqh2mdlolfxg@fsdbafotp5q2>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
 <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
 <74893f76-1b7d-4cfb-ba7a-9fd64427762b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74893f76-1b7d-4cfb-ba7a-9fd64427762b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6Nor9nEPeQrC
 bNrurysfMZ7SBN0R4RJbSO09wNMJfBfCLF6BBRVpgirptJN+B1LFJnFzveDqCkcduzY7V30A0DR
 6y39JiCyvtqxGVo/QsvkgXefbwBSuiiPc2d+hr3Zn3Kuxcp3Rjxm6ZXHXAa3RWyUB1M+J9fZF1S
 LjkoJCHzPoDhNt3WOahMGFxLw/iZ703QqKpbSXPcguJ7uldB+9lHOYy3Ouzlm1snXGVLlDUJxhR
 Qa9Q0PbLRm3LbMJIRF9GPiQYhkucchG4+WJqR5Z5+5ZMEBBwvseudOrx6KxzqIKHGHXgxzxc8vm
 exKPQk09UoSLgdyLO5prFRvaJvJD6HZBUC2qzV6JztK24lrZdMTktRUWc/pU71Z8+liIK/BrS7P
 xnYypFSwNoXqPxfgoquPnV88xXo4iA==
X-Proofpoint-ORIG-GUID: 1BNMj2xg0f94n8HpPYhDfc7mSQQoxwxN
X-Proofpoint-GUID: 1BNMj2xg0f94n8HpPYhDfc7mSQQoxwxN
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e7b6c5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=qNVazfFkpqTu88eF0ZoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Thu, Oct 09, 2025 at 10:51:31AM +0200, Konrad Dybcio wrote:
> On 10/8/25 8:57 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 08, 2025 at 04:05:28PM +0200, David Heidelberg via B4 Relay wrote:
> >> From: David Heidelberg <david@ixit.cz>
> >>
> >> Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> >>
> >> Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> >>
> >> Signed-off-by: David Heidelberg <david@ixit.cz>
> >> ---
> >>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 78 ++++++++++++++++++++++
> >>  MAINTAINERS                                        |  5 ++
> >>  2 files changed, 83 insertions(+)
> >>
> > 
> > Please also describe, why it's not enough to use defined compatible,
> > samsung,s6e3fc2x01. Why do we need a separate schema and can't use the
> > panel-simple-dsi.yaml
> 
> panel-simple works for 'dumb' (perhaps a harsh word for 'made with
> just the in-spec DCS commands in mind') panels, but Samsungs are
> widely known to require a ton of vendor magic

The question is about the _schema_. I think it's fine to have a driver
for a panel covered by panel-simple-dsi.yaml.

> 
> Perhaps the original change was made with an "oh it just works
> surely there's no drawbacks possible" attitude, as the panel
> was left initialized by the bootloader

-- 
With best wishes
Dmitry
