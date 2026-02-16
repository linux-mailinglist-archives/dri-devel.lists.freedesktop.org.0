Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPsjCTbhkmknzgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 10:19:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67219141EA7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 10:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674B410E08A;
	Mon, 16 Feb 2026 09:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2Jbtz7f";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCeOlJKj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431DE10E202
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 09:19:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61FNFdNd2352267
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 09:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 298888CzSuRcDROwfpg8wrkYvJ5FY1wrQe7Pkk8ZsJA=; b=W2Jbtz7f1liI/dff
 9s3kW2twB3VTK2IQzUwqWJWHYBnSt5mEdYv1F2IFbPXcO24GbuhL9WJiquSr65w3
 P9sYefymFtKe/ruGbw8WZTkf1dakgtlTRH/fvpctTmz0zxtPtriT/JDvcbNi6MAP
 PC3M2m7SOjGmurHjeMzC8c0hNLP4TyuNRbdBG4HPDYrRIeP+1DuQEumQwxpjg5dQ
 gD/njKbsA6/fAgLAerTxUueckJZbEKDDocfZS3Bz8NNf9osn48nlkTbD1dijJDfk
 zwX8z2YFyBLRMQlKnVP13/WklV2xaUZu3ZxhsH+/blXoxhpz4QMi40A7KkecFHm1
 haVW9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf4390-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 09:19:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2ab4de9580dso155630865ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 01:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771233583; x=1771838383;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=298888CzSuRcDROwfpg8wrkYvJ5FY1wrQe7Pkk8ZsJA=;
 b=SCeOlJKjIEbcbdlq0jyMOTfWto8N0zm0/+/BgraZJFZFAgROzsHxcSb/H2O91o0JgR
 AZ+RBwNxUpk793dRMwFtS9ZUQJsQd9T/JfnPYeRE4LjB6YyA/68hIebDj1f+Pp9T94Kk
 3N/kljQrpCCGj/ML0tiDw3boZJA1tPy5TRIa3DyiuL/sBUhQTy7CiFRgJkNsg2ES6Stp
 uE1MiQ3BtOOsdSinF/sq68IUwMi0jOfkc6Ej6ddmZ/+WM5SIiV16oZsSpdAWsvkhgT8N
 G3adlH/qTHLC2kn77n9YTmoGHQ2B1k12m9AAd9h2pZtrn0OJlPQJclBTgalWxoRdkPf1
 P9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771233583; x=1771838383;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=298888CzSuRcDROwfpg8wrkYvJ5FY1wrQe7Pkk8ZsJA=;
 b=bsFJZMO5cWWtn2W2CMn2SJzZfE3Ok7YslYfQs3vW3E/dQrUp0GZpII+Q707TJyqB3+
 n54cj9pHxij7lyqf20OBJMystxqLhEA5gDUcs+DJYg77pruKfLOS7R6zSN3EhqvRNdlk
 nzOJUX3RzrdLNbT6CcUMkEsjMl22WsQhym0WrT8tQCbQSWMFD1b3EPLRIJvkX/8N2Nho
 6RCzuXCN1qFO/I/fqt4xcNJKdiOZbpdK7Q8LaoPA4joEcpkAdwAsyTY8TD2pMEX3Pm84
 i9BDRPxDpTHUl7/oVeUccWdudi1E5MF54vLuanU+s38xkuctjaPwKgrKrHEzppBhTDwc
 Pjqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUevy1pYjH1SexC58RWwW7StoWxm8HqdHTSR7fMiLnpDQG5jA0RgycFjqWNkYJ3UAqDLP3oP5WqVDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvjyhU052zP03kFUW2OHHppnhyrB/i05rfg8LbPAt0UuhFolD7
 VeDQQBZfi7lFypwq1OX3Qrh7egfm7pd61lkk9H5Eb8FnNX+MSrHd59WTeOUK1BwaH+5ZrGeE6Qs
 +JU9AVf02MfGyTrnFMZmErAOpBDwQGbaBU6V8t/GO6TKZW1BKkRJQi85PUK0kyIN2LdabPWk=
X-Gm-Gg: AZuq6aLvzyn5333+zUvKHMuGrHZah35ss11lks1xnyiQzW92riABVyZa5ZP22DKfrpK
 PlZFal2ganjirnbsCC/pl8pMNii4+Se01DNDkEWC8DtXu9GhodDfInMvsR5fEOJsQitaB5HKn9n
 +hwDH98CGrUiZ7hHutHa1QeZkux84Z3k8bj2xHb2HBagmIRGO33ANO2ae0Jigzk9NklJ2DRf471
 MVih1bOcAsGthJVcHbHvzz19e1OceN37haJpcsD2Q2e8PgeQSOmh9mBXaN+SDkfO8mn1bG+NVim
 Opud0eH8xY71Fbu3xtU6XP0dalVYriwlqAm6pjFEP8jCqVmSzhN1yIwgQria49ccmRH5QeG8/+Q
 +BAt7N9AW7puMTWrzqzUUxomHXhpyU9XNaLsBaIfr/HpeaFI4Qw==
X-Received: by 2002:a17:902:cf10:b0:2a7:b447:3389 with SMTP id
 d9443c01a7336-2ad17433847mr76919705ad.2.1771233582986; 
 Mon, 16 Feb 2026 01:19:42 -0800 (PST)
X-Received: by 2002:a17:902:cf10:b0:2a7:b447:3389 with SMTP id
 d9443c01a7336-2ad17433847mr76919445ad.2.1771233582469; 
 Mon, 16 Feb 2026 01:19:42 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a9d624esm60409685ad.49.2026.02.16.01.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 01:19:41 -0800 (PST)
Message-ID: <9e0effb8-5e20-4f37-a745-9afe55375238@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 14:49:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] misc: fastrpc: Move fdlist to invoke context
 structure
To: Bjorn Andersson <andersson@kernel.org>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-2-ekansh.gupta@oss.qualcomm.com>
 <uzhuta6ukkf5k3za6kzf24zsf6nwvneyrlaezte6z42ggok56w@nd4cdiqizld2>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <uzhuta6ukkf5k3za6kzf24zsf6nwvneyrlaezte6z42ggok56w@nd4cdiqizld2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Q2pgSmQGY17WdSnzLewbAsxoiQ-2ljgo
X-Proofpoint-ORIG-GUID: Q2pgSmQGY17WdSnzLewbAsxoiQ-2ljgo
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=6992e130 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=9sCCoSkNH54s9k6pYwAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NyBTYWx0ZWRfX4VuGmnao6Fcl
 nw5ZIUKOCZywB3J7jighqhGB2pcWovvpqQe0z5q84JXq047OHCui1UOIdRRotok9+8Nod31jPWX
 j5USc4c4/BAnKDGVmrfNfMgdNmQ06sIsHRSwVPorCUvWNW17o8mlsQLXwNb0KjRgBGCF9VfVY/U
 9c+btGOs93k8oqDtPd3MfAMjae140P/WJ1Kn9C1UrIOWsUo29zCdGF7xTlzRXU3gRQYW/fTZ9eJ
 DzopLzgwGSqsWut93NsDU8QV0IBsR10+e52t4PacoM54Z5RJQh15EFx6a8PNyYfJOjdwBgK73F7
 E/WXMtexH8V+X5++7ybisfKQq6OLfzyS75dPsZPGROEQloAXkW9sOZsebC6HvKJ2zvO9/yt3hTF
 1VzF+knXYpXd+cy8at9KopL77axJ1Ynn1+o2G+rdM2/JoLwla83NzopSHqIN/joRZd2UsYG3UvV
 TBbWV4EQrmYN7dEFzBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160077
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 67219141EA7
X-Rspamd-Action: no action



On 2/16/2026 9:26 AM, Bjorn Andersson wrote:
> On Sun, Feb 15, 2026 at 11:51:32PM +0530, Ekansh Gupta wrote:
>> The fdlist is currently part of the meta buffer,
> Do you mean "already part of"?
yes.
>
>> computed during
>> put_args.
> The only "computation" I can see wrt fdlist in fastrpc_put_args() is
> where we calculate it to be at pages + inbufs + outbufs + handles.
>
> So, why do you say that the content of the meta buffer is calculated
> there? Did you mean fastrpc_get_args()?
The fdlist is updated by DSP. By "computation", I meant getting the location of fdlist
in metadata buffer.

fastrpc_get_args allocates metadata buffer, fdlist is at some offset in this buffer. This
list is updated by the DSP and rechecked during fastrpc_put_args for any entries.
>
> PS. Use full function names and suffix them with (), to be clear in your
> description.
Ack.
>
>> This leads to code duplication when preparing and reading
>> critical meta buffer contents used by the FastRPC driver.
> "used by the whole entire FastRPC driver" is rather broad... 
>
> As far as I can tell, the thing this patch is doing is caching the
> "fdlist" address, to avoid having to derive "pages" (and thereby
> indirectly "list"), "outbufs", "handles", and then sum these up.
>
>> Move fdlist to the invoke context structure to improve maintainability
>> and reduce redundancy. This centralizes its handling and simplifies
>> meta buffer preparation and reading logic.
> I think the patch looks good, but your commit message is too high-level
> sales pitch.
>
> Describe the specific problem that you're solving (i.e. you're
> recalculating the offset which was known at the time of
> fastrpc_get_args()) and leave it at that.
I see the problem with the commit text. Let me come with a better description.
>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 16 +++++-----------
>>  1 file changed, 5 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 4f5a79c50f58..ce397c687161 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -233,6 +233,7 @@ struct fastrpc_invoke_ctx {
>>  	int pid;
>>  	int client_id;
>>  	u32 sc;
>> +	u64 *fdlist;
>>  	u32 *crc;
>>  	u64 ctxid;
>>  	u64 msg_sz;
>> @@ -1018,6 +1019,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>  	rpra = ctx->buf->virt;
>>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>> +	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>>  	args = (uintptr_t)ctx->buf->virt + metalen;
>>  	rlen = pkt_size - metalen;
>>  	ctx->rpra = rpra;
>> @@ -1120,18 +1122,10 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>>  	union fastrpc_remote_arg *rpra = ctx->rpra;
>>  	struct fastrpc_user *fl = ctx->fl;
>>  	struct fastrpc_map *mmap = NULL;
>> -	struct fastrpc_invoke_buf *list;
>> -	struct fastrpc_phy_page *pages;
>> -	u64 *fdlist;
>> -	int i, inbufs, outbufs, handles;
>> +	int i, inbufs;
>>  	int ret = 0;
>>  
>>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
>> -	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
>> -	handles = REMOTE_SCALARS_INHANDLES(ctx->sc) + REMOTE_SCALARS_OUTHANDLES(ctx->sc);
>> -	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>> -	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>> -	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
>>  
>>  	for (i = inbufs; i < ctx->nbufs; ++i) {
>>  		if (!ctx->maps[i]) {
>> @@ -1153,9 +1147,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>>  cleanup_fdlist:
>>  	/* Clean up fdlist which is updated by DSP */
>>  	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
>> -		if (!fdlist[i])
>> +		if (!ctx->fdlist[i])
> It wouldn't hurt to keep the local fdlist variable, keeps the code less
> noisy - and you don't need to change these two places.
Ack.
>
>>  			break;
>> -		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
>> +		if (!fastrpc_map_lookup(fl, (int)ctx->fdlist[i], &mmap))
> Why are the fds stored as u64 in the metadata? Are the actual fd numbers
> somehow consumed by the DSP side?
DSP uses it for book-keeping mostly for maintaining DSP side mapping based on fd.

Thanks for spending time on reviewing this change. I'll fix your concerns in the next spin.

//Ekansh
>
> Regards,
> Bjorn
>
>>  			fastrpc_map_put(mmap);
>>  	}
>>  
>> -- 
>> 2.34.1
>>
>>

