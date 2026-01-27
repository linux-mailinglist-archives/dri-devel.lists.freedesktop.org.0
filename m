Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FnGNxvKeGmNtQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:22:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F51958DE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46A689149;
	Tue, 27 Jan 2026 14:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1LqhODG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxUlE48i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACBE10E57E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 14:22:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60R886a2623368
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 14:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T/zZBr4RQMGR6+8mwWzOZeCwVTQSBGms3epNbHc/lK4=; b=U1LqhODGZjRjomPG
 kj2Tn0IW2gH/YO2UfKr1oCd1wYuDd8oHGJPP66qCoKBW2rZAtmI6N3CyX4zEoqZ0
 xgsTESoghkgenLSBdK4vD/HQNat9JV6ESB+xedzP6a/TJf3HO6woc8nf/+QE4RP7
 VMcd3joH2Ony78XdvoNGaBcBkKWvAADACa3KDYdpEXzl1KaQtjtis1Al4jgWy7w7
 kSUMU4Wy4epR6XpRbAtD1gjaV8VqUOBa5RyRTogDNIckxCcs7HoThn9io+YubLtQ
 KR9g8m1fLu1t0rxLE+GXFROHHhTXhryhe71uvxkaGeo1Jw6nHsCvgP6pSl5v0MBG
 28zFhQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjeh4k5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 14:22:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c710279d57so7924185a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 06:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769523734; x=1770128534;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T/zZBr4RQMGR6+8mwWzOZeCwVTQSBGms3epNbHc/lK4=;
 b=kxUlE48iGlU8oWjD9TzEgdaEez5nb4TiDGYIJRv48KX9QLNUebUC4xWnw1WxGgzrtV
 iKasrL+j39wICQBvsa9e5kCIWR2sPOZlTbnLn+dKcjK9loxMV258vopqozW0NmaRFYgV
 ZsVqBjC3Sr15f7mWjh+YlsTA9VZZ0l+ViqZNdE8d4W/WO+Sw+npf39hCdcJgBXrb4Tln
 DqhuuFnzFfJdAW5uEYZeVEHg8wNhQunBAdsjjG3fs1yjaNGod7CZQeaz8rW1vtynEtcU
 wi0TfUBtPic+QEAXenR/Lgk3zeeiB7x9jhKCvWjdmFwcm6GVTre7l2/KzkUqJySNz4vV
 TmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769523734; x=1770128534;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T/zZBr4RQMGR6+8mwWzOZeCwVTQSBGms3epNbHc/lK4=;
 b=YkQVRC/vm3XuC8IWXCLDC/50H2JIzO9YPwouYN1wAdHmWnrLMplYeetDLYH1EQYV5b
 v5EYqBlFQdwdknsUSgDdXW75QiOeJG6x7NNFbDmtgrcoBVVsiH5FxsjmEk61YeZRP5Ie
 DZC8ADuvVxL+Rw6gVvItzUN6Bq6x5cQN/rjwcwaktV/yYHwjD4zH8gra+NsgtyvuCoQo
 6LuFR45t7xfCw98dE+GbfgKYK2UgMyLlA2E5SxXk8btspbHz4Ol+BCBfoSr5jnPI0RI6
 4PZEYav90klUVekaVJNCss/bXav6nQA1mwnqm2y9MIX1Kq/ljb0mgHFZwN1SD4of/pQa
 gALw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN5e2jwB7tPH9EziHcrlAwTb1h0acodDw7CFZbJKK5cCEFON8WLJADorJgF6j7m8irIV/N/DS4lrI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk6CZbg/mfyEe2yVieNcxKG/SE6khYK9ejPLR1J0CeVmA0N8sX
 OpGpjsdVQ8U/7EbGCfV87nHWo+3wUbkdyXiw98uaYW1bNKh77MPT38x3caWWAEZEkLcVfeZIr4R
 wAB2UIGceYN/q4bFS7BHJGdUjG0vVJCsUmKzSeNp0TJ28myjsaTRvLCPs8jo/0SpI8hbPuKA=
X-Gm-Gg: AZuq6aKJjh4Z4CBE3Xt/++j0n88W9anaudyAn14tw5fpxQfgjDVGm6wZjb7SQQ26bjS
 nkRz7ILE61y98p5i/Z3s2SBPHn3aMJTlV6lqq/SXHIiMfXzsP0qF7CKipzm9yQ2k7aOilvWUSE+
 1cV+lLsauZaK91nfCTfZLrsR9SugwqejoI0aoO0ownomPdmtPXJI7klhg2X0xDi7Ky5DnGqFu7K
 el0kjriPF6gpPAofhiqcIbeXFibE6zi2RJS4YK55ppvw9qmGnvc3gKj6+1MGYjurGNnEBoHYvUy
 L9QDC+v1Pcd6GK01arR2V9nY0KBB6f3vxljn0pkDENPrFuwU1NAHBFJRkBltisN+/fJ+9JObYRR
 ilBjYezyvM1Qej8hMbrMoeE5PH4ZKDnUzfENSl4/mNAqG/5+D6LKVQBtQ6XFqElLFB/0=
X-Received: by 2002:a05:620a:178a:b0:8b2:1f8d:f11d with SMTP id
 af79cd13be357-8c70b9046b6mr186421285a.2.1769523733719; 
 Tue, 27 Jan 2026 06:22:13 -0800 (PST)
X-Received: by 2002:a05:620a:178a:b0:8b2:1f8d:f11d with SMTP id
 af79cd13be357-8c70b9046b6mr186414885a.2.1769523733146; 
 Tue, 27 Jan 2026 06:22:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b416ca5sm815011666b.25.2026.01.27.06.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 06:22:12 -0800 (PST)
Message-ID: <c243a067-c33e-4ada-831e-ec611208b191@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 15:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] soc: qcom: smem: Expose DDR data from SMEM
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-1-6b64df58a017@oss.qualcomm.com>
 <20260109133612.ommcoivkbhbisp6o@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109133612.ommcoivkbhbisp6o@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDExNyBTYWx0ZWRfXzUc5jy2XYsSl
 dxhxqCm5nrAnQ1cOFtKAMl1RjOod14crzIrPDlE6sQXszdQz9M+5itZRfY6tc8zJH/K1hXfRGLB
 n9dkbxUj/kV1raq7X94UgJHAYQgE2B2RTGkm2hYnLBXNlKomxQeQt5CjDpZk6IyfNccdJZXbYJQ
 32owQmD+Zp6biq5Ilc9MOwAiOqpw/iz3s5HA83AK8al1wdCaUKujY/LSZ6DUT0hMWhOM8QUrn8T
 0jN2KvigvOXJWEOfaZccTYNV/H/Xcxx1eZv+3EwrOTULlyje6175HIhIf1trXjE0YvRyNZg2uyg
 EKRflruB5xHb0cr2kDSgalHsu+GVqkylzOZloJt5EpVVN832C1mXjvgcuNzGy5ecMkbEKqWGNQm
 zoWcfSWd9NP2wiRiZBArtVA7ldsZ+pwImlr1HgxiQvvNgbT+vTHTLon0wEkZkm6G37nE9cP0Wbj
 Jv2sQX02fhinYKvz2SQ==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=6978ca16 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rBdmBs-3Ac6Y_iI8bpQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: tew8_mPjeKBLCGHvuRlEnyalvNB1UunL
X-Proofpoint-GUID: tew8_mPjeKBLCGHvuRlEnyalvNB1UunL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270117
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:konradybcio@kernel.org,m:andersson@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:freedreno@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 94F51958DE
X-Rspamd-Action: no action

On 1/9/26 2:36 PM, Mukesh Ojha wrote:
> On Thu, Jan 08, 2026 at 03:21:50PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Most modern Qualcomm platforms (>= SM8150) expose information about the
>> DDR memory present on the system via SMEM.

[...]

>> @@ -1236,17 +1241,24 @@ static int qcom_smem_probe(struct platform_device *pdev)
>>  
>>  	__smem = smem;
>>  
>> +	smem->debugfs_dir = smem_dram_parse(smem->dev);
> 
> Is it possible, even after calling qcom_smem_is_available() before calling 
> qcom_smem_dram_get_hbb() we are getting __dram as NULL.
> 
> is it good to move __smem assignment to the end with barrier so all the
> changes before the assignment are seen when somebody checking qcom_smem_is_available()
> with a pair smp store/release pair.

I think just moving the __smem assignment down will be enough, no?

What scenario do you have in mind that would require SMP barriers?

[...]

>> +struct smem_dram {
>> +	unsigned long frequencies[MAX_DDR_FREQ_NUM_V5];
>> +	u32 num_frequencies;
> 
> freq and num_freq_entries ? since you have used freq at various places..

The names in structs come from internal shmem definitions that I didn't
want to stray away from

Making the kernel-side struct fields named the same feels like added
confusion to me

[...]

>> +	if (size == sizeof(struct ddr_details_v5)
>> +		 + 4 * sizeof(struct ddr_region_v5)
>> +		 + sizeof(struct ddr_xbl2quantum_smem_data)
>> +		 + sizeof(struct shub_freq_plan_entry))
>> +		return INFO_V5;
> 
> Why this does not have separate name ?

Because it's the same DDR info structure as "normal v5", with trailing
extras that we don't really care about

[...]

>> +struct dentry *smem_dram_parse(struct device *dev)
>> +{
>> +	struct dentry *debugfs_dir;
>> +	enum ddr_info_version ver;
>> +	struct smem_dram *dram;
>> +	size_t actual_size;
>> +	void *data = NULL;
>> +
>> +	/* No need to check qcom_smem_is_available(), this func is called by the SMEM driver */
> 
> This comment seems redundant..

With this one specifically, I don't agree it's obvious..

Konrad
