Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF2fJIjxlGnFJAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 23:54:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EC7151A37
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 23:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861CB10E2B0;
	Tue, 17 Feb 2026 22:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdS+q0Iv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kucjpq7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862D310E2B0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 22:53:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HIm7xe1942831
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 22:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KFJ8odxFzblVi42AM8SS+2bN
 JLxZ7+uHabMbW43T+6U=; b=kdS+q0Iv/r5vHoRc/iv+CD+Ha+JBLFojK3ICjy9t
 UXMuitij3ux61ywVDw6xFMXIsePa6cERUGHb8DTnI77gQ01q+ORd6klvSRdIupBS
 2yZikGNabjLDrV/ZiIpGzipQFC9ERYZAOXoJhZxt07tNqF9SG9brdSBWQOk6zHGi
 wuTC+DcCeeR3Mj4QYvfEBkLirQ0RQs3qf4cnIkTCrIF0welXtel5h0itiFJgfLsm
 vH+yHkaFe6AA0cPdmoX43A7slvirAJBvdKZ6oUREu7tWiptouu8VltS3kXPzlk5b
 UkPzKIlZNZ2GamvBHtSjX6w5P1rW7vfcJ2kRJ0Mj8b7idg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g28e4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 22:53:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb0595def4so256487685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 14:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771368834; x=1771973634;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KFJ8odxFzblVi42AM8SS+2bNJLxZ7+uHabMbW43T+6U=;
 b=kucjpq7D6qBKSb5o70a+aTbK/Zm/e76knHdm3f/WdvnFfEWK51v3xCv5ZC5CFzNvbM
 ZGCkMWbyiuAlTqFqwn/vnyiQLA94CP9ak7egu9+V66RT+ty2FJ25Cfqxe/7r2zNZC4RM
 ARLIq1l9qMS3pCdUGXD+lhI9pn12kBbbWR35iVtGH4+5j0N3WqD8imwoZSq0MuV9OQR9
 HU0R+WNUGtVY4QtDagMEGbil36qM2qr/pohKy/c41DFLhabES6uioo5e7FGJ3ywXrK8m
 4EcCw1etu4TH5YOPfpSBCsShrQ49/fqApXtE4UiMTzmgpETcWdT6IwB/RA1qSEsh7aA5
 JWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771368834; x=1771973634;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KFJ8odxFzblVi42AM8SS+2bNJLxZ7+uHabMbW43T+6U=;
 b=BsnnrhqUx6DKlXKhrx96Zjw0qRSAq3YSk4OxJu63TkkvT+cZtcxPpvbfn0C3jPzjpf
 laZodkwQ2F4qHxTOKNuNysVm0YAQhJvuylZmVAqPGiLRUY4fD6N9q8/mAjHc4qLIoh2Q
 6A5GAdwGg9Id8FcdXWmDwpYoIvZMoqVsktx9ChshFE6eZHRn0gZuCE4Hn7sot+wzFrTK
 lbIOXOM1qr724ar07rfSg09hrVGid142ZPaFSc68MaED8sWlbJy4GQT3O/HQ2VtWDqCI
 0AVS5tDn0M/zSB7N4xiCXam8rP0WM9ygTgK/C6FIAkWgYrS4lP/lfJLtAgyPS+NA7tVL
 lpKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZAwofDlp1AQ7rCoe4pNvFkOiM2SGta9GSUHzy8kykmZHTQ2kDps7BbBjePleDmrycT9lGrTp8pO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxkr16UVVvykGvwd1OJXDiTJWeR8J1ZtbVchrnwwg/vvAwRyaR1
 ByVYSfELnM5dF6b12xSXpJeRUDy//S8+RporYSBfe9vKvr2fPAmcGQYzKs0xq2bQ/UJ+uMTVnm2
 dgBLewNKFJIvcTNWc/JZm+ehgOz54lfFLoG1O6IpBT19XekX5pfou+Doms4glp03SKhS2k4U=
X-Gm-Gg: AZuq6aKGdvduDVUZoMdlZ3tuJv1vOP1QLp+fDYb+14psnpcR1lRUCL1Ww9BUS+g8lMF
 DM0+9uoSwPXtUgxD42DXxnht594Wo0Y2LgKPmzuDZuEj3QdGu8E4SXRPExeDX/+HlnpFZsAvYSE
 LpVQmDwaU/rAR1RAKgf0C/KpeTlKsUojanVeuf2PhMk+JnkNhJoM11skEGKiaDt+6jtrsBQ2cQF
 5Cxsk5on9vF8oWdSzHoYYsWWzOrJBz59cD4ATbvuRwQucx4a5lEqGZrQW8CqKrfAlg2fpe+96Tn
 TV3JYFy79QoPPKRXik3zhFhkMlMRqcJdAPwrQChu1PJGI2oNelYEC8JnOrteWqclYUcHiVdUPnH
 eToHAE6zotjO/thhBZ4hSv5srfFzdLR3fM1NIfduPodUw9Ekfoif6G9PWVMQlSD4rNLwTzJ9Bp6
 HHAhQsdS+5yfXYkUO84y9so/f9zz6Zym6bQxQ=
X-Received: by 2002:a05:620a:f02:b0:8ca:370a:3ac4 with SMTP id
 af79cd13be357-8cb74153061mr3854985a.12.1771368833571; 
 Tue, 17 Feb 2026 14:53:53 -0800 (PST)
X-Received: by 2002:a05:620a:f02:b0:8ca:370a:3ac4 with SMTP id
 af79cd13be357-8cb74153061mr3851585a.12.1771368832950; 
 Tue, 17 Feb 2026 14:53:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5a50cdsm4148569e87.58.2026.02.17.14.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 14:53:52 -0800 (PST)
Date: Wed, 18 Feb 2026 00:53:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <i74iyesupz2elaoefyn5s5r53op5aifftcmsgktk2pyghozvwx@usg4hp4wrtug>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
 <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
 <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
 <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com>
 <iqg6jpq4i3olwugnlnsczisbrbysxzik6otby3pgkv5uqsez3f@diwpjgf26mk3>
 <203f6f63-e81d-4db5-8ede-ff6695a847ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <203f6f63-e81d-4db5-8ede-ff6695a847ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE4OSBTYWx0ZWRfX1uk4mGvhVnOu
 3nkrADJk9yANYZapZQaS07MJWa9orfAWJyuGMqKs+fXZzGETKf3leXpwQMYZaKKNYbQn6qQ6Nbr
 3LDOmRa6cFfUasuvBbmiuHaHEjtHFhfhIvh06i90NRm51U2T54jE2S7y8cuKlWE/iOQa2evqt4U
 kQ/PPzIuil2JhSyM9RgYFOLp0TG46IjlEQUDE0uBlj+SefLB5Sj3U+P+NqZdAQctgYXb8CCw2gX
 x/UNYUN8HQGjtoZB2OhvKQYTI49X6BbhwCkMFSQai2fFYTmEhol1EJWQO6M/VJpuFjV6okczxQi
 AY6X8vsRWe5wUe8cjiS3cio9lP9ukyHKvWNytCvh3qt5WXUzOflDNchy0UPjusqd/5RrhsZ3tWo
 ZpXVXcy/UO9GSvS2nRZ9Yvtl/nMSFyUF44z5kuyaFUlArqNshiGv+5LxA3FP4Ed1p+dfR8m6RfS
 6O2tTHlBWAdIdrb0zqA==
X-Proofpoint-ORIG-GUID: GtM6aLSeFYLuluSFahdRJXDUSHjud10G
X-Proofpoint-GUID: GtM6aLSeFYLuluSFahdRJXDUSHjud10G
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=6994f182 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=9HWWG6BkxvpKG1uSktwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170189
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
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:freedreno@lists.freedesktop.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 23EC7151A37
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 01:59:48PM +0100, Konrad Dybcio wrote:
> On 1/13/26 5:29 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 13, 2026 at 04:31:15PM +0100, Konrad Dybcio wrote:
> >> On 1/10/26 11:45 AM, Dmitry Baryshkov wrote:
> >>> On Fri, Jan 09, 2026 at 11:50:46AM -0600, Bjorn Andersson wrote:
> >>>> On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
> >>>>> On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> >>>>>> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> >>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>>
> >>>>>>>> To make sure the correct settings for a given DRAM configuration get
> >>>>>>>> applied, attempt to retrieve that data from SMEM (which happens to be
> >>>>>>>> what the BSP kernel does, albeit with through convoluted means of the
> >>>>>>>> bootloader altering the DT with this data).
> >>>>>>>>
> >>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>>
> >>>>>>>> ---
> >>>>>>>> I'm not sure about this approach - perhaps a global variable storing
> >>>>>>>> the selected config, which would then be non-const would be better?
> >>>>>>>
> >>>>>>> I'd prefer if const data was const, split HBB to a separate API.
> >>>>>>>
> >>>>>>
> >>>>>> I agree, but I'd prefer to avoid a separate API for it.
> >>>>>>
> >>>>>> Instead I'd like to either return the struct by value (after updating
> >>>>>> the hbb), but we then loose the ability to return errors, or by changing
> >>>>>> the signature to:
> >>>>>>
> >>>>>> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> >>>>>>
> >>>>>> This costs us an additional 16 bytes in each client (as the pointer is
> >>>>>> replaced with the data), but I think it's a cleaner API.
> >>>>>
> >>>>> What about:
> >>>>>
> >>>>> const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)
> >>>>>
> >>>>> I really want to keep the data as const and, as important, use it as a
> >>>>> const pointer.
> >>>>>
> >>>>
> >>>> I guess the question is what are you actually trying to achive; my goal
> >>>> was to keep the base data constant, but I'm guessing that you also want
> >>>> to retain the "const" classifier in the client's context struct (e.g.
> >>>> the "mdss" member in struct dpu_kms)
> >>>>
> >>>> If we're returning the data by value, there's no way for you to mark
> >>>> it as "const" in the calling code's context object (as by definition you
> >>>> shouldn't be able to change the value after initializing the object).
> >>>
> >>> And I, of course, misssed one star:
> >>>
> >>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(u32 *hbb)
> >>>
> >>> This leaks the knowledge that HBB is slightly different kind of property
> >>> than the rest of UBWC data.
> >>>
> >>>>
> >>>> You also can't return the data by value and then track it by reference -
> >>>> as that value lives on the stack. This has the benefit of making the
> >>>> lifecycle of that object clear (it lives in each client) - but perhaps
> >>>> not a goal of ours... 
> >>>>
> >>>> How come the ubwc config is const but the hbb isn't?
> >>>>
> >>>>
> >>>> If we want both the per-target data to remain const and data in the
> >>>> client's context to be carrying the const qualifier, the one solution I
> >>>> can see is:
> >>>>
> >>>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> >>>> {
> >>>>         const struct qcom_ubwc_cfg_data *data;
> >>>>         static struct qcom_ubwc_cfg_data cfg;
> >>>>         int hbb;
> >>>>
> >>>>         ...
> >>>>
> >>>>         data = of_machine_get_match_data(qcom_ubwc_configs);
> >>>>         ...
> >>>>
> >>>>         hbb = qcom_smem_dram_get_hbb();
> >>>> 	...
> >>>>
> >>>>         cfg = *data;
> >>>>         cfg.highest_bank_bit = hbb;
> >>>>
> >>>>         return &cfg;
> >>>> }
> >>>>
> >>>> But we'd need to deal with the race in cfg assignment...
> >>>
> >>> static struct qcom_ubwc_cfg_data *cfg;
> >>> static DEFINE_MUTEX(cfg_mutex);
> >>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> >>> {
> >>>         const struct qcom_ubwc_cfg_data *data;
> >>>         int hbb;
> >>>
> >>> 	guard(mutex)(&cfg_mutex);
> >>>
> >>> 	if (cfg)
> >>> 		return cfg;
> >>>
> >>>         data = of_machine_get_match_data(qcom_ubwc_configs);
> >>> 	if (!data)
> >>> 		return ERR_PTR(-ENOMEM);
> >>>
> >>>         hbb = qcom_smem_dram_get_hbb();
> >>> 	if (hbb = -ENODATA)
> >>> 		hbb = 15; /* I think it was default */
> >>> 	else if (hbb < 0)
> >>> 		return ERR_PTR(hbb);
> >>>
> >>>         cfg = kmemdup(data, sizeof(*data), GFP_KERNEL);
> >>> 	if (!cfg)
> >>> 		return ERR_PTR(-ENOMEM);
> >>>
> >>>         cfg->highest_bank_bit = hbb;
> >>>
> >>> 	return cfg;
> >>> }
> >>>
> >>> This potentially leaks sizeof(*data) memory if the module gets removed.
> >>> Granted that all users also use qcom_ubwc_config_get_data() symbol, it
> >>> should be safe to kfree(cfg) on module removal.
> >>
> >> I really don't understand why you'd want a separate API for hbb, if
> >> hbb is already available from the larger struct *and* if a driver needs
> >> to know about the value of hbb, it really needs to know about all the
> >> other values as well
> > 
> > Please take another look, qcom_ubwc_config_get_data() is the only public
> > API, qcom_smem_dram_get_hbb() is an internal API.
> > 
> > My goal is to keep having UBWC db which keeps const data and which which
> > also returns a const pointer.
> 
> Right
> 
> So if I understand correctly, this is almost exactly what I originally had
> in mind in the under-"---" message (modulo having a static global ptr vs full
> struct instance) but I failed to express that I wanted to keep returning a
> const pointer to the consumers
> 
> So in the end it's
> 
> A) int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> 
> vs 
> 
> B) const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> 
> I think the latter is better since we won't have to store a separate copy
> of the config in each consumer driver (which the SSOT rework was largely
> sparked by), essentially removing the ability for any of these drivers to
> mess with the config internally and make it out-of-sync with others again

You have my vote for the latter option.

-- 
With best wishes
Dmitry
