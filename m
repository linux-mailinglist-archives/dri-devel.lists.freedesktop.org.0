Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBHDLrHTc2kCywAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 21:01:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3087A70E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 21:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989D310E2F4;
	Fri, 23 Jan 2026 20:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/aXxdvL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A5XM2MEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8B110E2E8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 20:01:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60NFUZHT1848105
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 20:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QO9fOs8BxvQ8WpaH5XwHVqxgxLsb6bKPzQB3chuzJo8=; b=Q/aXxdvLjMTLlE9d
 kRx0SHYqzDN/ae+5dN1EyvqWKDmhRwLqFBzhQ1mpFPaL3ZmIZxk35Q+pSFJBQ/50
 Bh+Bw4XLihxybVZhIY9/CEEMjZgnWtBVRrLR3hnh7GJ/+ezTI3dbb/ds0Eeqc2/c
 gQW5k1rJ+aUX7bjRAvAZioZTVlaEZUfPLqsHJcms0WiPnFveMWo7XNCr22Mq/5Gu
 knlqRXD3ayxkgtRneu+OR9vuKOGj2ZU33Qe6EFSGoCcKf5CldpfLj3+gCSymcZUj
 Rej92BH17KxXZxiIJhLtofIzDzPeB5xN6E6mf4MzY8iMr9ZSNgniLMrkfB+pSqV2
 V/41Jw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvbpn0syv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 20:01:48 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-9480078b2e2so2888608241.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 12:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769198507; x=1769803307;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QO9fOs8BxvQ8WpaH5XwHVqxgxLsb6bKPzQB3chuzJo8=;
 b=A5XM2MEN4IXk3xiOiX67Wyf9lP+C+UsqZUAoyFcb3NBTEEdUD6hkIeKI9vEUY+7p/S
 xy4zqBcysTkac/SPgzyyhhqly7bsOxfMz/1JgV88QkNaJOnL59RvmBEv0d/8QaEGB0lJ
 tJiGdXLBibouMg+jul4O/DxI/L2yGUfoFQPaM5jCHNdgbR4ZLY9S8hu5kd2KzWO/Xwg6
 NjKE3E9VxowYz7Q9C1/w8ASIDOKj/bkS1go7TrKWZZMU5B9KAcZ3IxKWYxoa7GAN0gZU
 pcxyo4yMqC802Mewbq6h0J70n3vkOHuFxIMzHOza+azNS8yJwRMhDzyg6AttZcjYmJyc
 oa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769198507; x=1769803307;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QO9fOs8BxvQ8WpaH5XwHVqxgxLsb6bKPzQB3chuzJo8=;
 b=VXgB2vu9h0+wOl7tMdu4GuTuX3Y/IkoImfH9k8WpffAKO+pREnosBROrtv2zzLg/mB
 11KDqyvwdvTHQu5YRPMQArqZl/v2A0p9F16DLm0a0sYx3P5oJizcyUPkvyA7O85t0nCF
 YMKWhdoFR6AZXVxA9Jizm8IczWxXR9z0iTc1BuVrkjCrB699jVWv8jYCcb1Dq7U3ptX3
 CW3OeOZSX14Opp49nwmTdoZD+3uXN412G6QvhHnAyrQyKsy+dX8r8OOuqnvPV6xx+Nr4
 0UoGKmLN7pQQxZx772Vye+603j9kfZTT3F8yA5+Aby+EXpnFTCILSiNedJVY/3qEDSjm
 gDfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCRCDMXh1u9AdV9f/XL8WY6jF/u6RcPAuXm71FZ5cL08j5toXHqOgdi45EpaStmImyVtqWdJNTJlg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYlgirJguPDed/afpxaAQfFXF5lckVD0LjRGkmot92RpCNCTiP
 vgxRIgC+ByCKPRr5YfOjVrtoxlamHY94Os69/3A/GnjrHoeWRw6SGGmUSVHNCph0B50cUTIXCQJ
 A4v5Eo6Iskiy5SNQc0NLLvVUU1U5QSLErRm0ERQW5Bz7DEew7qG0pl6vrs/xFeBYGeAtYVuo=
X-Gm-Gg: AZuq6aLy6FFQUCQU9JzrOx7x1lINYf2y5OO8S0EtiS0Fq+t2jAcLXgJXNt3q0S1ir2y
 l9bmqc5P04VQRy0jsnbLi7oQTnQC2+tVWuXiiwxwFXeueMKnsGGeg2u1zw7t8hd37/Qb9SXXrMW
 /wU1a1Slz3G6L8kR1b/k2z2HwMOp5Puy8vQqKEg91FdmqU8yf2LxTt07Itd+3IysQukcI/5ifgJ
 J+OKzH3EqipWYblJ3dSG/Hio6ISpuddpx3xXv70Z3Ic9re8XdbxveRxOIlPCUN58PVGolr2BlBC
 XHFVErxiCysBCKgl8epCWvgJJjg0etBsUKE0Hc4+4/G2eOk01a1nx1UcqMF27BNqhL2A6acL2kc
 n5DYHGlADQgiXsKr6+yRqhoBD/lDYW9MUkLicgtGsaTlFi8IyLnw8DjsalmF/qjd5Y0V+YUvZ6v
 QtVeY4YWSD1BMcv4HmPYB6tJ0=
X-Received: by 2002:a05:6122:62b1:b0:55b:305b:4e2d with SMTP id
 71dfb90a1353d-5663ebbd2b8mr1282008e0c.20.1769198507017; 
 Fri, 23 Jan 2026 12:01:47 -0800 (PST)
X-Received: by 2002:a05:6122:62b1:b0:55b:305b:4e2d with SMTP id
 71dfb90a1353d-5663ebbd2b8mr1281497e0c.20.1769198503280; 
 Fri, 23 Jan 2026 12:01:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385d9faed52sm7868411fa.2.2026.01.23.12.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 12:01:42 -0800 (PST)
Date: Fri, 23 Jan 2026 22:01:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
Message-ID: <gofqva7heojs5d7hi2naihqlpkfttjocdazdg4yjqrkeqew5tw@bp57c7rvycpa>
References: <20251221164552.19990-1-johan@kernel.org>
 <aWdaLF_A5fghNZhN@hovoldconsulting.com>
 <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
 <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
 <aXHwrnMS2aj_PYRj@hovoldconsulting.com>
 <CACSVV00vk95aYZPrVThoAnHzBUsCHXxnSoEHJNaoLdyJJBOZzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00vk95aYZPrVThoAnHzBUsCHXxnSoEHJNaoLdyJJBOZzw@mail.gmail.com>
X-Proofpoint-ORIG-GUID: PTvd6WR7AQkZvdYNGYyBePopNQ0IHjsy
X-Proofpoint-GUID: PTvd6WR7AQkZvdYNGYyBePopNQ0IHjsy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDE1MyBTYWx0ZWRfX2mseTuGRFU9O
 1dZnWzUzX9LYIvYVMvBJqr5/q4z1jEZzaqb5JSqKPPp8cnzcBiC0+mRAUvjynrkqu6k/CEAkYxd
 2DInBgRj4+sCfwhIfFfCaRQNoDsAw4VSxOdrydxmJC3u2J5xj/r/5kOPqBD9v5UnTq4YbZPGeIg
 5vIZVnISXi7NzMQWPOQWMxDkmCM6Zd/pHyonUpVr0TLL9yRw+aMSaj/nOPXIElaunxJ5iDUZ6WZ
 lTyCC/OMgnlhIZ0cPZnNQs1bpFjz+EWmYDoIGflKdOmz3gy/+fFifMCrxDz6e8hRWG9ZWcX2LYq
 jRwn70qwe7RpqGBXdOxNNNVaOFkcXXHxFXO6BDBwMZ6SIFA+I6+C4XCgSiFLyXOHtruVcs3AFPR
 XUx7Fr0WSNCrJu22Smipz9BfcjqR9zz6W4ZBlF+ypxrtIvj6MwjC2Qg3Iiwv+H1TKeuSjGrxXGD
 myiWyqbPwSg0/VfCb2g==
X-Authority-Analysis: v=2.4 cv=P9M3RyAu c=1 sm=1 tr=0 ts=6973d3ac cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Ifu46aO8IFbR1bL56rwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230153
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,poorly.run,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rob.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:johan@kernel.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.132];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6F3087A70E
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 06:48:58AM -0800, Rob Clark wrote:
> On Thu, Jan 22, 2026 at 1:41 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > [ +CC: Dave and Simona ]
> >
> > On Wed, Jan 21, 2026 at 08:59:51AM -0800, Rob Clark wrote:
> > > On Wed, Jan 21, 2026 at 7:17 AM Johan Hovold <johan@kernel.org> wrote:
> > > >
> > > > On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> > > > > On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > > > > > The hw clock gating register sequence consists of register value pairs
> > > > > > that are written to the GPU during initialisation.
> > > > > >
> > > > > > The a690 hwcg sequence has two GMU registers in it that used to amount
> > > > > > to random writes in the GPU mapping, but since commit 188db3d7fe66
> > > > > > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> > > > > > the updated offsets now lie outside the mapping. This in turn breaks
> > > > > > boot of machines like the Lenovo ThinkPad X13s.
> > > > > >
> > > > > > Note that the updates of these GMU registers is already taken care of
> > > > > > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> > > > > > properties on a6xx too"), but for some reason these two entries were
> > > > > > left in the table.
> > > > > >
> > > > > > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> > > > > > Cc: stable@vger.kernel.org  # 6.5
> > > > > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > > > > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > > > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > > > ---
> > > > >
> > > > > This one does not seem to have been applied yet despite fixing a
> > > > > critical regression in 6.19-rc1. I guess I could have highlighted that
> > > > > further by also including:
> > > > >
> > > > > Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets")
> > > > >
> > > > > I realise some delays are expected around Christmas, but can you please
> > > > > try to get this fix to Linus now that everyone should be back again?
> > > >
> > > > I haven't received any reply so was going to send another reminder, but
> > > > I noticed now that this patch was merged to the msm-next branch last
> > > > week.
> > > >
> > > > Since it fixes a regression in 6.19-rc1 it needs to go to Linus this
> > > > cycle and I would have assumed it should have be merged to msm-fixes.
> > > >
> > > > (MSM) DRM works in mysterious ways, so can someone please confirm that
> > > > this regression fix is heading into mainline for 6.19-final?
> > >
> > > Sorry, mesa 26.0 branchpoint this week so I've not had much time for
> > > kernel for last few weeks and didn't have time for a 2nd msm-fixes PR.
> > > But with fixes/cc tags it should be picked into 6.19.y
> >
> > I'm afraid that's not good enough as this is a *regression* breaking the
> > display completely on machines like the X13s.
> >
> > Regression fixes should go to mainline this cycle since we don't
> > knowingly break users' setups (and force them to debug/bisect when they
> > update to 6.19 while the fix has been available since before Christmas).
> >
> > Can't you just send a PR with this single fix? Otherwise, perhaps Dave
> > or Simona can pick up the fix directly?
> 
> Maybe someone can cherry-pick to drm-misc-fixes?

I know that there is some process for cherry-picking into
drm-misc-fixes, but I think the end result was frowned upon. Neil?

-- 
With best wishes
Dmitry
