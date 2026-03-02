Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKFHI2GepWltCAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:27:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DCA1DAC1B
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D960510E515;
	Mon,  2 Mar 2026 14:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpdhu6Jj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjGuT2dc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F0210E515
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 14:27:40 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6229EwfR3630902
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 14:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rCoit7n/E97O69RwfnYeJCNG
 G+VE0LvE/0kxXvBG0b8=; b=cpdhu6JjgYiJRgbzqFI46OD1KIQgm6Wn+T4osLoG
 nRfy9rze7BVGINse+spHgxDV7Xy/yNyzauSsFItObbyhoncdpoNWvblwPHRz7Uyu
 t6RLcl7QXAMvUV4w78x4G/NEnMPVfCBCee3WvUPgXwdoErI7DuPHHBKDqcIIyX0F
 9aFdQEmyqb79hQBAMCPcXwRW02qHDYYWtueicwPrjDVE6DipbICzqpcA7M/oxOzF
 qdeMkS7DoyKi+dHDHN3/UW+tBCF4p98QVBaXl99USW5STxOUdBfWS4/9QawtVVgb
 XRuHz4pPIhIpwIN3coTA9UauALTo3wcycLv5eJ8LrPTMRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhryv9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 14:27:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c70e610242so8714685a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 06:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772461659; x=1773066459;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rCoit7n/E97O69RwfnYeJCNGG+VE0LvE/0kxXvBG0b8=;
 b=WjGuT2dcMeVhGSb4+JXg5SgqU8UBCEXPkJDhKxhdwyCAzUCQndxXPFuOJM7k/YLRVV
 N7TTr7U/GYMwgX/QvnlA1ov6X6wshDE8++OfyKCsM/KQb9SPYubTEK6q+2OtautfPfUH
 1WiNznTS/USvCnQAE/wU45tpCEkxzYtZ1I/JHVIoEJTY0KLEh+ko+97xBJto/k8mGfZ9
 7VkJoh0nFdWsKAQz5d3CsMTb20eFP5XAJHyfts78iQVk06nAtB5UidLRsipLjuQktFCu
 uKZP3/Hu+vAZYNm2hePXZOGkE4ienx8Gm0GYmY9s64eUEvNQxijEYZ0KSxp6leIfYWl7
 Ka0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772461659; x=1773066459;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rCoit7n/E97O69RwfnYeJCNGG+VE0LvE/0kxXvBG0b8=;
 b=EsKdK4QIOF05HqUp/R5Casg8QP3YRqOsJiAGAz6s+vjm2a2W8evW0r3QPPUm5mNcMW
 XyU3Ipg7M9x0o3S9gr+GPxUOeWxbvLJA0Vnq0ed5pg3vUa2egZeisBtwb0abSxJxEtec
 DwRavKmXOJFNc4JDvjq4jiQ+GUwtf2tCli6mszDqJNgW224aLBEpgYoSO8YXiOk6c30Z
 TzU8MmaWbgcci0jZ0kEBJBt8YjZbTKnMT5ZeSb4ukvjtLq0CsI/+uVozkjrihvlql47J
 KUNREkarawUXddT7Wf5/8Jbeey7ENUBuUaUPpMUNE4LtZhhbvLh0LumhOG84VQgmiKY1
 dLMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGOGcet+QHximIosXkRp4br5P5nmtnBcckiuwRPjZdGcOTQHY4Y5G4Xks66gAa+bWyBVyZE8JlXRA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh30Q6Qu1u7IUZNy8K+/WaJlz4Z8VvpW7vIbTcfnNANRBp2mTK
 qJNAUdJiivMxGToG5FIi2JZD7Xtf3Kw4faHvJtPnBNml6FWSuqrmzp5M0W0JteOnrpOETqvRDvk
 Q0kiIdaSKqr6ojFOJ64Y/hirc49nq8Pip6v57RJdwLq5r2v5evT/Ol6YRgn6hptCltUGYamU=
X-Gm-Gg: ATEYQzwlFpQAfBcqYA54xd1zXiGuGxmMnUhtd6Caq1shxdNfxfnDkk6aCxKK5sKfX6u
 j8IATnN+Tm1OJKYMdFrqIrescahrPhyUg4hyGySTkfONqo3npB+C7QQvv/zFCzg7zhVIaTBBXG7
 6cV3M7Bg8agn8VGwBprglUTiixND32OWfXaWQ6MWt7ZzVHKU28hCX4pxZGK2nloGpZAEuj1oIIY
 sFdvmDdSBKc29TxlMUM+W+GUhXJ2fPx6VdRyJdUWQnAG2jQPnzxWCPNyhI702tah3OS8DHQxtkP
 Nwr9r+b2YUQsEjEW4TN4kBNg/MOAWDt48ZWb0XXzfbA8HhhjslPbT0JDYWmHZ8cTdIt0ItiGIPV
 fq1IxnH/r/u+/DEx9+RdCbCHL493PCVLv4ozvcLZpdx2FZ38nByIt4WOo0bBdwxUq+2S94jGLZP
 XimcGyJnRWjG0JI3m0+4uHhs7ASU53D/6XU9Q=
X-Received: by 2002:a05:620a:4892:b0:8b2:f9ac:a88b with SMTP id
 af79cd13be357-8cbc8da87eamr1602992185a.21.1772461658842; 
 Mon, 02 Mar 2026 06:27:38 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8b2:f9ac:a88b with SMTP id
 af79cd13be357-8cbc8da87eamr1602986185a.21.1772461658038; 
 Mon, 02 Mar 2026 06:27:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a11771e36dsm1546141e87.78.2026.03.02.06.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 06:27:37 -0800 (PST)
Date: Mon, 2 Mar 2026 16:27:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <5wbvy257s553jyqzgqacfxhbeqgkrqui2yspqwjh2iyiz6ljoy@olo4l2kbrcjm>
References: <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
 <d5c4eed5-bd87-4156-b178-2d78140ec8a9@oss.qualcomm.com>
 <w4ldxcxvcp3fz7u2zxyyjiii7lsrnoa2l6amzwpsn5a63yzotm@iawh6btqtf45>
 <b230815b-e169-4a3c-8c36-154deaf66afa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b230815b-e169-4a3c-8c36-154deaf66afa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TSeLjSO-cJ3LG7oNHFeQruv8ULei7ty6
X-Proofpoint-GUID: TSeLjSO-cJ3LG7oNHFeQruv8ULei7ty6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMSBTYWx0ZWRfX2WfSnrI50KZn
 jjyRCeTz15RPHsiUmoR0B5LMXiXVX5GA6VCR0gTp0IlAdkltfmsebk0dD8A+yoXaNL36VG5Ngf1
 akInVeAqgvV6foqgvL5a+UDHr2pF9vfZLYh3NWFStw2ganV0Ga5bRxKU7jm7M9wArK+pW8Wr6Ty
 w0zfLqx4OjPQeD1Z0nJtFnevLiMcNvScIT5VsuMUsCLj0+C4UjdkZc/V+Z5wCrhURuvJcLOoPP7
 FxBX4vlfkoz++6ELLRW47GIuv0HdPPwQBwB3VOewy1iu3TM1Q6z/E8yTScsi7RchBvk6YnAhEvD
 cdAm1cm19+k3NkbJYie2X+pg8cKt5xibtJJqjX1UYS9eYfBG46oKkhMW/zyB4kn600dEDelE63m
 62yrYWTeH3AjXFwAsPusI8PKdXGf/2ssQ+PbnDFE7kDE/ABDJPY572GG+KhJ5L3SVQucCEU40OX
 /C/IF3Q6ry+5MWO2fXQ==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a59e5b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=SfF2JtedPo7efatZud4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020121
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
X-Rspamd-Queue-Id: E4DCA1DAC1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:yuanjie.yang@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzysztof.kozlowski@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:yongxing.mou@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 02:46:33PM +0100, Konrad Dybcio wrote:
> On 3/2/26 2:28 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 02, 2026 at 11:41:59AM +0100, Konrad Dybcio wrote:
> >> On 2/27/26 8:05 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
> >>>> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
> >>>>>> On 1/12/26 9:25 AM, yuanjiey wrote:
> >>>>>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
> >>>>>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >>>>>>>>>
> >>>>>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> >>>>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> [...]
> 
> > 
> >>
> >>> 1.1  - MSM8x26
> >>>        Probably Luca can better comment on it. Should be doable, but I
> >>>        don't see upstream devices using display on it.
> >>
> >> Because there's no iommu support for these
> > 
> > I promised to put it on my todo list, but the list is very long.
> > 
> >>
> >>> 1.2  - MSM8974
> >>>        I think it also had issues, no IOMMU support in upstream, etc.
> >>> 1.3  - APQ8084
> >>>        Had hw issues, no testing base, no MDSS in upstream DT
> >>> 1.6  - MSM8916 / MSM8939
> >>>        Can be done, low-hanging fruit for testing
> >>> 1.7  - MSM8996
> >>>        Supported in DPU
> >>> 1.8  - MSM8936
> >>>        No upsteram testing base
> >>
> >> 8936 is 39 with some CPUs fused off (unless you have info suggesting
> >> otherwise)
> > 
> > Hmm, you added 8x36 to mdp5_cfg.c, stating it is 1.8. See commit
> > 81c4389e4835 ("drm/msm/mdp5: Add MDP5 configuration for MSM8x36.")
> > Author: Konrad Dybcio <konradybcio@gmail.com>
> > 
> > Please remove it from the mdp5_cfg to avoid confusion.
> 
> v1.6 is strictly for 8916. 8936/39 both use v1.8.

I tend to agree with you. It's interesting that core list doesn't (and
likely is wrong).

> 
> >>> 1.9  - MSM8994
> >>>        No upstream testing base, no MDSS in upstream DT, normal CURSOR planes
> >>> 1.10 - MSM8992
> >>>        Even less testing base, no MDSS in upstream DT, normal CURSOR planes
> >>> 1.11 - MSM8956 / 76
> >>>        No complete display configurations upstream
> >>
> >> +Marijn, is your computer museum still running?
> > 
> > Should we open a Qualcomm Virtual Museum?
> 
> Maybe someone has a drawer full of QSD8250s!

Only APQ8060 here, but it's not even online after the reorg.

Anyway, I assume that we have something alive and kicking for:
- 1.1, 8226 (currently unusable, no IOMMU)
- 1.2, 8974 (currently unusable, no IOMMU)
- 1.6, 8916
- 1.8, 8939
- 1.9, 8994 (almost dead, I'd say)
- 1.10, 8992 (almost dead, I'd say)
- 1.11, 8956/76

It seems we can ignore (or drop) apq8084 (no activity since Dec 2019).

Already in DPU:
- 1.7, 8996
- 1.14, 8937
- 1.15, 8917
- 1.16, 8953

Which means:
- port 8916, copy for 8939 / 8956/76 and hope it works
- add LM-cursor support
- deprecate mdp5, possibly moving it to EXPERT
- add 8226 / 8974 once we have IOMMU
- drop mdp5

-- 
With best wishes
Dmitry
