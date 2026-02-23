Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AhHA7PXnGn+LgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:41:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E20417E7DD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9021910E323;
	Mon, 23 Feb 2026 22:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqxJBeZr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7CE86Zx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C2210E323
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:41:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NGFIMe3936170
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=AyHH7QcVrx7/d/Pc5HmpEFyc
 TB7iy4eLl8RPthi6BKQ=; b=UqxJBeZrdU/+HWoz57Jsz5OGQVVAWwhBjkkReBnM
 znYBmNaTaRZGpuZhz7FyFz+WMKoWazbntOR+ec/5k/EJVTBMqgTMcgo7rFv0h8Iw
 XdOhutI9faQnvYCkm6mP+1Kd6PUqlMPkM8s8XwwBmRVS4g5u5yQUOdKMmQtYMgzi
 ZFyxbQT2h5UlRY/O5RUWPPxnMKT7wj4bAzCzT5ovcR01y2uay4wfuENWyM56LLaB
 HewbVsGgnFFTIQHaCasjtePqb0Ad+WJthHI8w3QeISWAww3VujFiKji1G4ot6uw0
 1yteuL+sy6paHYOY5NXaN6D4btbz4lVrj3tv6Ix0oKOFsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgt8mh2te-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:41:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb42f56c4aso4803335285a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771886509; x=1772491309;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AyHH7QcVrx7/d/Pc5HmpEFycTB7iy4eLl8RPthi6BKQ=;
 b=E7CE86Zx4kNc4Dd5kVNzgd6nNmQXcSRv0wu3o9buHPa8KLIpLPAFNNglPFLdt8itRg
 fQNdmlDW/NJNrrXiGVmt7YTGqQcwfaIbTKiIDWeU2lXa/kGDY5/4OveCK8dx/+IDrY9G
 W4WzBfMajWvdwH67W0d3YKQdUIkWFYGk7cqisO6s1PWPvXV0CNWDbfm8Ot++3er/MqxB
 QN0V57m84s7rfkHBjej7C/oqy1R/yteeMk8KLifOq5bWaHsSowk455aoY2z/lAi/HBZs
 KOSLYEE4FfYsekcAI2dQB7EFpkZtJTL9jijL+vBD83z7KPN4zoWmDNy3xBWD5ZUWIWA+
 3yNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771886509; x=1772491309;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AyHH7QcVrx7/d/Pc5HmpEFycTB7iy4eLl8RPthi6BKQ=;
 b=hNy+hyot6UixYC/M6RiPTgROz7l8EGkP87WNxZ1ApE4QZrrwsmDbeiK1L10A55hDag
 atXAGM/H9zJKpv/75iIhO0QQfESyQ5l9z4GcxWoDMS70dKX8C7QiJ1MlDAA5Q3uTT00R
 5+RrewT2HhIqQd3W8oz31uwSYnPfFn6S6qztVVPhqVH+LEkFt1odccT3BaJ9FxLVRuyK
 EX48PxwyPuINfNEajfe20HIdDGGogwNly30y2FcCK+iZRuPUMYuSib/iAhUT4GqSx0jm
 JlLFfjQkyZQuftcCQWc2y/hWApvaUq2Ge2uL0tntcV7TEF4j5QPVOsecy2ebBHKNsh8D
 nFNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkHiLzIjNA/iGajKe20lFIsCppxuCw1lrMFoYYom4rPx9HeNbUy/XXFPjlWbP6Y1Z/Ew82FuEZM6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu/xPrxjfYzJOhE3ICw9RwlUIHflbDkdfo/u9BixrYQ4b7BG81
 KzFsw7ODXb3Y8jd4AoFba19sAihdtD/6RvUH7+dZwjtDkjBSQqqhPUazHB8KS2OmF2KTFAKGlLA
 hrxlYGmYsuH8mOwNUO6g0QCc/ftS5uhODMf7zhYaz1jFPuwPK7lNWikVrqfbfYEs53Cl0RDg=
X-Gm-Gg: AZuq6aI9u3RE+4doIOVpuw6inZaRymrnkkgBQsDd1U8F6vI89pLr0MLWQS3nqYowlTU
 CwXpJDNAj21TlQyRn9YL2KbxEB/qhzDL80ikdy/Y4vHTxMt97h9Zu/yGnSFOPlRvoEXnoQl85xb
 POe89Ym90Fw2MEORLUcwHqZSA3RQmuB5wryV4Jn+WPgfKpXRpYyaUby1gP1q2Si3Qlwu1jRJ/jo
 OpAuIT2p+9Eo629duFh/n0HhJrhg+cyQmIj0D63yJjFZ+2pS3P4g1NPhAdfLeMYC6LXSX/YLSFd
 V8TlrsM1mm8PSK7Y0xiPfN9ilrLkYkM50E5S7aEEGjLbRtLUifYAJZENZq3krfuDR+WKfuLL772
 4qa8T/0hrFtDsu0FjlPCq3JK3e4tm2xgTc3eOBA+BaseGCGpesXIIzXSig30awJ42jl5VSFeuxS
 jpGTq4lSuwnZh9+p75RheSTcatswE1v9QML6o=
X-Received: by 2002:a05:620a:440f:b0:8b2:d72d:e41c with SMTP id
 af79cd13be357-8cb8c9d2d25mr1211392785a.5.1771886508699; 
 Mon, 23 Feb 2026 14:41:48 -0800 (PST)
X-Received: by 2002:a05:620a:440f:b0:8b2:d72d:e41c with SMTP id
 af79cd13be357-8cb8c9d2d25mr1211390585a.5.1771886508209; 
 Mon, 23 Feb 2026 14:41:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4cbf5sm1818985e87.91.2026.02.23.14.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 14:41:47 -0800 (PST)
Date: Tue, 24 Feb 2026 00:41:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 03/18] accel/qda: Add RPMsg transport for Qualcomm
 DSP accelerator
Message-ID: <x3ebegi74hx3a2okxnjipgsrgkbncmtwnusxtv7mc66nfih2qu@jdxc4ry2n2gb>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
 <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
 <lyco6vkfjlerri55ldyn6fbhihbkhnuolifddcnscevybsztq7@ljhjln2ynmid>
 <r7eko65ua2ofyejqf6ipnh6jm4s76f4mqy6a4msgmlraz4xuec@uymfzc65dbng>
 <oe4ho45dxtwjjjsqj6nd4op3gh7dz2pqwsuuhgqpdbf5hym645@smg3g4evqmge>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <oe4ho45dxtwjjjsqj6nd4op3gh7dz2pqwsuuhgqpdbf5hym645@smg3g4evqmge>
X-Authority-Analysis: v=2.4 cv=J/unLQnS c=1 sm=1 tr=0 ts=699cd7ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=-Sm6rUxn0lnaPTpFYlgA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: YhSwW7Iz-idAAq0cxlt2IiycC3Ig5KW9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NyBTYWx0ZWRfXwjLPYVdMFX+V
 RSicRuWHz/FJ8Hpvy5LGID1cMhV+oosn66NSSPHb2BZi9c5wC+pfXmUTrY5b9sxaNV5GLt4vPqK
 UeflGL2PxzD3XWDoc4u4HLSFKj85DTOXgZykJ/YJLQ+K7PffXrAORKrrT7AQDNbmbXYmwo26PGw
 ZUDFaO/sIOX9Bn5mwZLLgYah4TumDltNxn7pl0h/bkDIhLq1EvWSnTqqYnU1jgO+EIBp0PRVPv5
 4SFaGffizMtdV8Xgam5zfFprjsPPf2pHbhon3gz64P22dtnNz2BxleKOgjWCoo3XWZr8WdRadBv
 Vmvfmo+UyuNx/No1nsYE//3T9e+gbAGwFcu3GC9mwJTZBxIXsI29srAwK67eVjW4gfSFp6zoNF7
 ssX39I7cVEUR2UAjC/T2YGuUbsBtb/V/Vnj8FALKfRw11WtQPOE9wqDRvqGlJDABScL41KMB2Sx
 ucjvvp4nKG+WtaV+tvQ==
X-Proofpoint-GUID: YhSwW7Iz-idAAq0cxlt2IiycC3Ig5KW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230197
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 3E20417E7DD
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 04:25:08PM -0600, Bjorn Andersson wrote:
> On Tue, Feb 24, 2026 at 12:12:32AM +0200, Dmitry Baryshkov wrote:
> > On Mon, Feb 23, 2026 at 03:50:32PM -0600, Bjorn Andersson wrote:
> > > On Mon, Feb 23, 2026 at 11:23:13PM +0200, Dmitry Baryshkov wrote:
> > > > On Tue, Feb 24, 2026 at 12:38:57AM +0530, Ekansh Gupta wrote:
> > > [..]
> > > > > diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> > > [..]
> > > > > +/* Error logging - always logs and tracks errors */
> > > > > +#define qda_err(qdev, fmt, ...) do { \
> > > > > +	struct device *__dev = qda_get_log_device(qdev); \
> > > > > +	if (__dev) \
> > > > > +		dev_err(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
> > > > > +	else \
> > > > > +		pr_err(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
> > > > 
> > > > What /why? You are under drm, so you can use drm_* helpers instead.
> > > > 
> > > 
> > > In particular, rather than rolling our own wrappers around standard
> > > functions, just use dev_err() whenever you have a struct device. And for
> > > something like fastrpc - life starts at some probe() and ends at some
> > > remove() so that should be always.
> > 
> > I'd say differently. For the DRM devices the life cycle is centered
> > around the DRM device (which can outlive platform device for multiple
> > reasons). So, please start by registering the DRM accel device and using
> > it for all the logging (and btw for private data management too).
> > 
> 
> There are no platform_devices here, but tomato tomato... What defines
> the life cycle of the DRM device then? Might it linger because clients
> are holding open handles to it?

Yes.

> 
> Note that the fastrpc service is coming and going, as the remoteproc
> starts and stops.

Even one more reason to use drm_device for life cycle management
instead of manually inventing the wheel.

> 
> Regards,
> Bjorn
> 
> > > 
> > > Regards,
> > > Bjorn
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
