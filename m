Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD9VAVFQn2n+ZwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:41:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5503C19CCC5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB3710E307;
	Wed, 25 Feb 2026 19:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bb6+ZXg4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A70DOm3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2140110E307
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:41:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PHoUWZ1087952
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YldBZQ/Jim+tynF85y7k+vY7BGkAqZn1hJiK/ioWbpQ=; b=bb6+ZXg4Bc21i6nI
 8YZgTqmAMOzl06INuTbAreMHrTwt9uIaIbxUXWgqIj90/VMFd0maXT2OFDW6JYg7
 K3KWk+18VoLozcITPhcI2VBzd8Jt6u+Ef5fWU2aek2C+GgEj0WeSlDu2U+sPmyz+
 ZarHADoXvpftmC/fQPY6EXQ1mpg8lOnG+ylhPR4YMQOiaktPAP4DjVzUByvyKSGn
 BYSLMygKkC/C6+JJ+rq+7G49iysdZhsU/lUbJ66yKZeB755ABxZKg+A+HuhWea99
 2ITdBRgW+YB+i5N6/3IJLENnIM5CDJqAsLjX+m/S9G0CYsbM0RFhTzgFxX2tdQ5n
 0JYRPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chh4749a5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:41:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb37db8b79so4285953485a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772048459; x=1772653259;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YldBZQ/Jim+tynF85y7k+vY7BGkAqZn1hJiK/ioWbpQ=;
 b=A70DOm3pHxYlAkbIQ1PCfoX8kbo799FC8hyER/jQOUVWbhcXqVOKiiPdQvpl2WmjXv
 Yf7ihEl7v08Vjd+I3rIJOwU8yCAvMf5tCdsIA6QKg41uLqgIPfhF/IeI3L0/cP0dDoH0
 xv9TgnB211ubnUNnFIWjHbC7DwDr5ycIBPy/3YqECRVflBhR1HuOqukDbtihlGImCYji
 vMdCsXFKWPMEfCX/fJ+P25vPhWjQqWXinBOMd87n3zvkhz67VeuQDftZDQhV9mtBwXI7
 GQaYgT/XArVcmjB+BD++EwqbqnZrRTknMXtFqeWCLoNiRrrYEyM7cU4yHoFSuiyaOK2d
 IBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772048459; x=1772653259;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YldBZQ/Jim+tynF85y7k+vY7BGkAqZn1hJiK/ioWbpQ=;
 b=a4KMQgcjkaFqhnxXlOswdKm07ln+FxtWMalrtgCYaY+FCGggw3pFG0CjQMgR40fUx/
 aN3hzwbiHV7l0YMrn5JNM87vWVxVc0zJNb5NHiPOXsvVkGmKMb3LEZ3hs76LJ/4LGI4b
 kBbuVQcFgeWAb4TWjINB21unZN/sZxKlPst5GCXyQDNZtWP08k5alFxEHDD+SBxUaI2H
 xxPlL7EqE2fVB7KtrFrbJzX24t2r1cJpWAHsGAvfiuczD7U22TKooe8/GswFSeTgF/C4
 B+zDa1UUIUgIl/s2wfn+yXAvWpL3wxbzUp+nR4M3178dWOLAuR5bcv35o/ZtQBnI593X
 5jww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmTXCH1GdYBiRM6uc839OwZ9eYcEJ3vueCoGKZv2MVYOqEl+2+CpczrHArtSJu0Rc9/aCeTkybMkE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUy3YOVF3mHasXnbA4ilBv23q6qpf9grjQxH+MMX3Gr8krQJ8m
 PkWKUGyySwNXOsfNDx5JSdheOmXch151vKq/hO/7g5FSp52wohRRTwoWCgliAv4VbilJnOmEWv9
 RsuvHtonPuH5izRBGfaBBkJNbwpMvbiKmulXWi3SnxsCkO1OvDLPwCoiNIclKsD9IZdx/WzU=
X-Gm-Gg: ATEYQzzot8OtEfgmrF+dsHuyzrWzzc4QTt+R/PwpKTTqoeCHdDEnKkgU1ib6yDCzJOk
 LEIeETksV6E2G71kIuXVsAj1h93FIr4FGpni4hYpxFhbjpki53menMBCB3eAke1lL/Ed4on4XKn
 Hr01cRsG3HCUNumJP7R3ox72itFDyI6ccT/fONNqz0+4E5gHo0HT8/pOjkbCWvZqwGM8rjwMlFH
 z+y0wXH2OS/zGQGSWcb0s+sTOCiXcDorcUrCHspE3VhplXAt5WlpwcUc1jP9pz7KMzpn+e//wbf
 4fQM+y1BjtIRrR6EsDTbu47Vl6hy6MapUDKZBKkakypCBa7Ma7lwVyzWCbrtTNiYL8cCI1TBJYw
 e/YG1M/uqgHwNGTvS8RAELMhhyZZVCfzMHoMM4AlwqG0fWWCrCtTtfAnpw4vancjJJjVb4/mhEg
 m39hA8oqd6Ojretj622rCIDxFgo0kfuCkpszs=
X-Received: by 2002:a05:620a:294b:b0:8ca:fdc1:cc9c with SMTP id
 af79cd13be357-8cbbd07f3e0mr229589585a.76.1772048459324; 
 Wed, 25 Feb 2026 11:40:59 -0800 (PST)
X-Received: by 2002:a05:620a:294b:b0:8ca:fdc1:cc9c with SMTP id
 af79cd13be357-8cbbd07f3e0mr229583885a.76.1772048458831; 
 Wed, 25 Feb 2026 11:40:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f21a4293sm46201fa.39.2026.02.25.11.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 11:40:58 -0800 (PST)
Date: Wed, 25 Feb 2026 21:40:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
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
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
Message-ID: <jmv4jkwku5x5acxno3vyar4cozl3makdz6vzdyjsitf2vtyhp6@cxtl7zmaayvq>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
 <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
 <5a278b02-f2ad-408b-b0ad-f2297817bd7e@oss.qualcomm.com>
 <opjniedtfhkv7vlb57g3xyikcfkxelthx3lmspmypws4vxz4oc@4uypmmf4t6fb>
 <4e4b50fe-1091-451e-b854-f7b061ebd88d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e4b50fe-1091-451e-b854-f7b061ebd88d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: VHs-aMQKY-JhwbuUxB2-02qvJRdZz-yI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4OCBTYWx0ZWRfX4/W0gEkzo7ST
 Sp9yDt+CCAd2id2PzV46S2LlRA6tBrdyAxZ2xZ3CPQ3Uuw+qoFcXIESwKeyQPHWFKpjiiEWudhW
 xa0BS9QegvhLGakuba+PMz6eyP6/WUBZ1MIuwVzIpeK4PMmy2v7HTme7R825pRWrBJ8dalXaZv9
 ri2RTu2+cTrW7rcQOqZuQef/k6/RPhNnfk/Wi6r2OKL2x2ifwIzpCuWETHOXrkQDJqfrAotRA3M
 mN777O0Phsr81HRi5r1me2PbufaVwa5KFpso9/F45TX1R/AE3SxdOzT1XR93P6b187/BjacaTWM
 z21SLKQR/3NJPRQeojM0mBCnePPiAF9WmOyhWxUNDE4YZareRaoor2eU6FRV9s/t+B9WLmvP4xd
 EH4psCx7vBjWk90OL6n39yCg1/F2PZfmcCxhhPflL1iXQi08KlgnI0mcwlZUxG2P7enCZdK3Z6R
 byu6CfKlIwH/DHprSyw==
X-Authority-Analysis: v=2.4 cv=fvDRpV4f c=1 sm=1 tr=0 ts=699f504c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=eG7pLEoM89m89vxRJVQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: VHs-aMQKY-JhwbuUxB2-02qvJRdZz-yI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250188
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:trilokkumar.soni@oss.qualcomm.com,m:andersson@kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
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
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5503C19CCC5
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 11:16:26AM -0800, Trilok Soni wrote:
> On 2/25/2026 7:12 AM, Bjorn Andersson wrote:
> > On Wed, Feb 25, 2026 at 07:47:08PM +0530, Ekansh Gupta wrote:
> >>
> >>
> >> On 2/24/2026 9:03 AM, Trilok Soni wrote:
> >>> On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
> >>>> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
> >>>> integrated in the DRM accel subsystem.
> >>>>
> >>>> The new docs introduce QDA as a DRM/accel-based implementation of
> >>>> Hexagon DSP offload that is intended as a modern alternative to the
> >>>> legacy FastRPC driver in drivers/misc. The text describes the driver
> >>>> motivation, high-level architecture and interaction with IOMMU context
> >>>> banks, GEM-based buffer management and the RPMsg transport.
> >>>>
> >>>> The user-space facing section documents the main QDA IOCTLs used to
> >>>> establish DSP sessions, manage GEM buffer objects and invoke remote
> >>>> procedures using the FastRPC protocol, along with a typical lifecycle
> >>>> example for applications.
> >>>>
> >>>> Finally, the driver is wired into the Compute Accelerators
> >>>> documentation index under Documentation/accel, and a brief debugging
> >>>> section shows how to enable dynamic debug for the QDA implementation.
> >>> So existing applications written over character device UAPI needs to be
> >>> rewritten over new UAPI and it will be broken once this driver gets
> >>> merged? Are we going to keep both the drivers in the Linux kernel
> >>> and not deprecate the /char device one? 
> >>>
> >>> Is Qualcomm going to provide the wrapper library in the userspace
> >>> so that existing applications by our customers and developers
> >>> keep working w/ the newer kernel if the char interface based
> >>> driver gets deprecated? It is not clear from your text above. 
> >> Thanks for raising this, Trilok.
> >>
> >> This is one of the open items that I have. I'm not exactly sure what would be the
> >> acceptable way for this. 
> >>
> >> As you mentioned, applications that rely on /dev/fastrpc* might not work on QDA
> >> without modification.
> >>
> >> I was thinking in the same lines as you have mentioned and  having some shim/compat
> >> driver to translate FastRPC UAPI to QDA. The compat driver would expose the existing
> >> character devices and route the calls to QDA. The compat driver could be built via Kconfig.
> >>
> > 
> > This is a fundamental requirement, you need to address this in order for
> > this to move forward.
> > 
> > Which makes me wonder if it would be possible to reach an accel driver
> > through incremental transition of the current driver, instead of just
> > dropping in a few thousand lines of new code/design.
> > 
> >> However, I haven’t encountered an example of such a UAPI‑translation driver in the kernel
> >> before, so I would want guidance from maintainers on whether this is an acceptable
> >> model or not.
> >>
> >> Regarding your question about library, all the APIs exposed by github/fastrpc library are kept
> >> unchanged in terms of definitions and expectation. The same project can be build for both
> >> FastRPC and QDA based on configure options. So, the applications using github/fastrpc should
> >> not face any problem if the libs is built with proper configure options.
> >>
> > 
> > You're assuming that the kernel and userspace are a unified piece of
> > software, they are not. It must be possible for me to install a new
> > kernel package without having to replace the userspace libraries.
> 
> Thank you Bjorn for providing the inputs. 
> 
> I also foresee that we will be stop adding (or already happened) new features
> into the existing fastrpc driver, so calling the new driver as an alternative
> is in oversold category.
> 
> You are pretty much began the deprecating the existing fastrpc driver, so let's
> just mention it if that is the case and provide migration/shim path so that
> existing binaries doesn't break.

I agree that we need a migration path, but I'd really focus on it after
getting at least basic parts of the QDA reviewed and agreed upon.
Otherwise the shim layer will be reworked again and again with no
immediate added benefit.

-- 
With best wishes
Dmitry
