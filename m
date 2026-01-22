Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHamFtO8cWkmLwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 06:59:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B28C621BE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 06:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FD410E149;
	Thu, 22 Jan 2026 05:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAyxnsct";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1MuebP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F7510E149
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 05:59:41 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LNVvxr645893
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 05:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jYq+uyK/jDolhx3ukdLPNMLoMLU6DcG/o/t/J1EddSo=; b=HAyxnsctrSR3guez
 7Uzm2fVbo7VVqjluenZN5y6e7L3xU1ptxEHwC+xni3yQ1LJtBkCJyqPbfNS6lx88
 SrGsHtC7PCGNsS1kcweHwJxCgs9kYJh0CIZkuuq0yHtbAGptOmDsuMgsAA3R0ufh
 tMaCuGNhvfqbJz/U6Q3mNyULS6/j1SigK+HfNEJP8dJB3G5Q4yjJisp9BSCSlBVI
 wGOoge4yPFleUfDQO9E+NukiNZUzr0yg0z8zKceKIDdJKOHkITvuuRK0wp8Hlc/7
 lB2PcwJ6QFfxzGTYzz2/hnDC0cf1+cp3ychxQMccz8z555antFaBDkt5cdQ37JHA
 2EFEvw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu8j9rwg1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 05:59:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a79164b686so7643185ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 21:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769061580; x=1769666380;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jYq+uyK/jDolhx3ukdLPNMLoMLU6DcG/o/t/J1EddSo=;
 b=I1MuebP+R49jIEtFer3HQz0eN052bqeQec/vWZ/IKtevFU6K6SGYAF+1VwOELkoKEd
 zACLW0c/2w+EYggu92Si9lKGzcY8SBFMQXDX23C4ITAUqtvTebrLzPlZpGOwtDlFrLrF
 DWtov5XLc3Bm5T7z5QfJuTpaDCGYoPX4ApxLtF40ShZXkz+3acQABfpxwHT2W/3RDKDK
 xbpg1oqHZhUzSLRtMP8iu4+ZFFNR0nQEQ8wRQZKG+spWENlgXWCq0CEl6yYfgmgvqOwt
 BhF7l7MMW+JhQmyQROh4JRmLrL5uIATieFcccpZo9TaFKcSx9L5hNwQ3MUEh1jq9H0Q4
 cz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769061580; x=1769666380;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jYq+uyK/jDolhx3ukdLPNMLoMLU6DcG/o/t/J1EddSo=;
 b=l7ekUjjun12Wkkmvz6qV2yDe7Aazkj4G17Qp+EXOnyGKHcGk9faWxJGF75WLOu331d
 CDLveX2atabjkvUQlT2efbNd6NcUFsWNcJW6eq7rZ4L3CJroTy3FdlIHuDapCTaHEKQn
 o4AdJ8KQsyHhtuCAmkC5rQEjv5v++Gg74u6SOjSfbf6kfiMgrAlRkyDOOVIcUxshOPU6
 5quY9kX1nZWrYPG5+eLV9Yx5h5Yk65MO5p08QvfmSA3QAXA0MwOy9A3MLYl9FVb0T/a0
 oSgIW+1i2tVRPu3ipaXgwyLJOHF9In9x2a0MyfC0nS4qR5JhMGPhYI2YxRoqxr9HzZyU
 w97g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7GagcVwEqTONaWE7Vec20ix0e+Vw+LPdnVw861DuVciqEJjvHd2GV5T/WhPGfScId+nI/rwE8bi4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH811PBxwvhHVhY4dorairB7d1xZDBx95crvh9GAhHdW+glY5+
 bnJzZAyXa7DU09u8/Qf5TM1MciZirpGLoEJFNe0SysBTxNEsECVdgPFDDW56Tpul1teRf1lSq0b
 SHT6IuZZcRPb4HHEOQzJaYbEErQCSWCpB/MakwviyT477P9eYg7nm/ZQEXvcvWVe3qAzcQT8=
X-Gm-Gg: AZuq6aLwboW2vVBXF1xHK2L3DmmYlp3gRyXYn3tRtUaAySrkhmiRUPbM4JAVIVAkecy
 wchawsHY+oxYN3rvzTyC0RKHEA0LqzSg/H+Q84OKLzLTuLq2jj1UYOwXH+p2sDc856VfJrDLimf
 HP2q5urRrh/TAkviLJPoYKZPSh9ku75QSoDtC2iCZ4awDX6hqaH6u5NNkvXtNNc99bmxQd3bQYO
 RyD90VrIiqsyikPeeK+XGc02jZkUBGjoDtkGhb6ZFFD6ralBpdJoTxgwNVyUE6hDRwc5Q2H0Bp1
 bN+KEfZCXPyTJz+PPkjutJ7wQ6iHFnn8/qWGXS9ctReDK/UoIkTv0DmgKSM6KVhTlstFnsRfRJM
 Xpv8qldwhO7ukA0iOv1t76zq5w0lRPKGDhSMpcC9h2+iV
X-Received: by 2002:a17:903:3806:b0:2a0:81c1:6194 with SMTP id
 d9443c01a7336-2a76b16950dmr72029695ad.47.1769061579682; 
 Wed, 21 Jan 2026 21:59:39 -0800 (PST)
X-Received: by 2002:a17:903:3806:b0:2a0:81c1:6194 with SMTP id
 d9443c01a7336-2a76b16950dmr72029445ad.47.1769061579089; 
 Wed, 21 Jan 2026 21:59:39 -0800 (PST)
Received: from [192.168.0.171] ([49.205.253.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7193fbfa8sm171765285ad.76.2026.01.21.21.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 21:59:38 -0800 (PST)
Message-ID: <0841b98d-32b3-4e7d-940b-9be204fad7af@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 11:29:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add support for QC08C format in iris driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
 <s2qjimx4tq2jdnir7b5dljf4onsbcmvb5prxcvc22q76l5cgnz@wrgcqdrl26sb>
 <50137983757d754609d8164dbdfc429b32e3d6b5.camel@ndufresne.ca>
 <qkkjsjvhwovbh7stjc53htkt3wucd34nzcvnkilnbxv4ukbozj@e4ierwjhs7wp>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <qkkjsjvhwovbh7stjc53htkt3wucd34nzcvnkilnbxv4ukbozj@e4ierwjhs7wp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3FJ_TL6lWTXu1Z_Jxo0K-K4wCU1AIJHO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAzNyBTYWx0ZWRfX6i3GQXfVO8Fs
 Y1eTlFkFa44au00xXm8Wto0bU7NeZAuADqWGZyCylCDjKuR0FCoOzUw6WHI9MvVRhvivT/6h7Vz
 5uyDKhXrJsNBu+XaM+GI5p0rMAUWpxD4+aRIJDcCcSCHt1KzyYR6NvjfDWFBfTJ8c3dBevSD/We
 eKRSEh/IXUSrwlGIDmOE0em15xof/+EKpFytcRHmWj7fxsYC0wn60vrfr+nsgksn7zeOM1XxIqt
 7xeqSN01n88oASnwC2OTR0oo78SIj8S7+iMdLKgmHysFlzrDAqFjUgT/Y8HdjLIP7CAsjhVoGKB
 FoCT/xrl51+ONhI1oQMKriHB3HZ7UPg5VwwnANr+nRg83j4kOr2rY3n+jPEA98Evj7D7CoH4XGw
 qPQGSpx7G6f27jO6mK004c4fisAK16da/OEl3WAAVPXBrA51lZ5uGNEzxTNY1K5ib4s5Mv+DkIj
 vqf7dW3MRcy+RG0se2Q==
X-Authority-Analysis: v=2.4 cv=U4CfzOru c=1 sm=1 tr=0 ts=6971bccc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=SS8V8czUUEjaKKq3JI+KvQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8
 a=-l4P_tr_EDuyF4aq3zoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 3FJ_TL6lWTXu1Z_Jxo0K-K4wCU1AIJHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220037
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:nicolas@ndufresne.ca,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:jesszhan0024@gmail.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:freedreno@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,ndufresne.ca,poorly.run,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gitlab.freedesktop.org:url,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9B28C621BE
X-Rspamd-Action: no action


On 1/16/2026 1:16 AM, Dmitry Baryshkov wrote:
> I should have added GPU maintainers and ML beforehand. Fixing it now.
> 
> On Thu, Jan 15, 2026 at 09:02:07AM -0500, Nicolas Dufresne wrote:
>> Le jeudi 15 janvier 2026 à 10:08 +0200, Dmitry Baryshkov a écrit :
>>> On Wed, Oct 08, 2025 at 03:22:24PM +0530, Dikshita Agarwal wrote:
>>>> Add support for the QC08C color format in both the encoder and decoder
>>>> paths of the iris driver. The changes include:
>>>>
>>>> - Adding QC08C format handling in the driver for both encoding and
>>>> decoding.
>>>> - Updating format enumeration to properly return supported formats.
>>>> - Ensuring the correct HFI format is set for firmware communication.
>>>> -Making all related changes required for seamless integration of QC08C
>>>> support.
>>>>
>>>> The changes have been validated using v4l2-ctl, compliance, and GStreamer
>>>> (GST) tests.
>>>> Both GST and v4l2-ctl tests were performed using the NV12 format, as
>>>> these clients do not support the QCOM-specific QC08C format, and all
>>>> tests passed successfully.
>>>>
>>>> During v4l2-ctl testing, a regression was observed when using the NV12
>>>> color format after adding QC08C support. A fix for this regression has
>>>> also been posted [1].
>>>>
>>>> [1]:
>>>> https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u
>>>>   
>>>>
>>>> Changes in v2:
>>>> - Added separate patch to add support for HFI_PROP_OPB_ENABLE (Bryan)
>>>> - Updated commit text to indicate QC08C is NV12 with UBWC compression
>>>> (Bryan, Dmitry)
>>>> - Renamed IRIS_FMT_UBWC to IRIS_FMT_QC08C (Dmitry)
>>>> - Link to v1:
>>>> https://lore.kernel.org/r/20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com
>>>>
>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>> ---
>>>> Dikshita Agarwal (3):
>>>>        media: iris: Add support for HFI_PROP_OPB_ENABLE to control split mode
>>>>        media: iris: Add support for QC08C format for decoder
>>>>        media: iris: Add support for QC08C format for encoder
>>>>
>>>
>>> Looking at the series again... What is the definition of V4L formats?
>>> Are they expected to be self-compatible? Transferable between machines?
>>> In DRM world we made a mistake, making use of a single non-parametrized
>>> UBWC modifier, and then later we had to introduce OOB values to
>>> represent different params of UBWC compressed images.
>>>
>>> So, I wanted to ask, is single "UBWC-compressed NV12" enough for V4L2 or
>>> should we have different format values (at least for different swizzle
>>> and macrotile modes)?
>>
>> Our expectation is that the decoder will produce the same format regardless the
>> resolution. And that format should be shareable, so that same format coming from
>> two drivers means the same thing without out of band data, except that
>> resolution and strides are needed oob anyway and can obviously be used as an
>> acceptable workaround the issue you describe. It should also have a single
>> translation to DRM fourcc + modifier, and hopefully the other way around is
>> possible too, otherwise its a bit broken and unusable.
> 
> Well... As I wrote, we made a certain decision several years go: there
> is only one DRM modifier. At that point the decision was made by
> open-source people which had a very limited information about hardware
> internals. We can probably try deprecating it and shifting towards
> multiple entries. On the other side, most of the blocks would only be
> able to support only one of very few possible configurations.
> 
>>
>> So bottom line, since V4L2 does not have modifiers, you have to treat one V4L2
>> format as a pair of DRM fourcc + modifier. Decoders typically only support a
>> subset, or hardware engineers can generally pick a handful of performant
>> configurations that works for all cases (its all 2D with similarly sized
>> macroblocks).
> 
> This is not quite applicable: even if we try to fix all other settings,
> the format differs from platform to platform because of the memory
> organisation (highest_bank_bit in drivers/soc/qcom/ubwc_config.c).
> 
> There is a description of swizzling in Mesa ([1])
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/freedreno/fdl/fd6_tiled_memcpy.cc
> 
>> Since these formats are only usable when consumed by GPU or
>> display controllers, its important that all party uses the same convention for
>> the limited information available.

Would there be a need for any client, other than GPU/display, to peek 
into the data OR to validate it, it need to decompress it. For that as 
well, it would need all the associated info to decompress it.

Again in same SOC, camera can produce compressed YUV with different 
parameter while VPU different, it would again need the associated info 
alongwith single "UBWC-compressed NV12" to decompress it.

> 
> Yes, we added UBWC config database in order to have a single source of
> information for the kernel.
> 
> So... On the practical side there can be:
>   - UBWC 1.0, 2.0, 3.0, 4.0, etc.
> 
>   - swizzle 1-2-3, 2-3 and 3, partially depends on UBWC version.
> 
>   - HBB or 13, 14, 15, 16
> 
>   - bank spreading (true or false)
> 
>  From the practical point of view, drivers/soc/qcom/ubwc.c defines the
> following formats (currently, I'd like to cross-check some of them):
> 
> - linear
> - 1.0_123_14
> - 1.0_123_14_spread
> - 1.0_123_15
> - 2.0_23_14
> - 2.0_23_14_spread
> - 2.0_23_15
> - 3.0_23_13_spread
> - 3.0_23_14_spread
> - 3.0_23_15
> - 3.0_23_16
> - 4.0_23_15_spread
> - 4.0_23_16_spread
> - 4.0_3_13_spread
> - 5.0_23_15_spread
> - 5.0_23_16_spread
> - 6.0_23_16_spread
> 
> Would it be benefitable to define separate DRM modifiers (and NV12
> compressed variant for V4L2) for each of them?
> 

Regards,
Vikash
