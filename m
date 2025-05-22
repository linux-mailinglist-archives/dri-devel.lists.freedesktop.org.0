Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77755AC03D1
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 07:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA9E9A8AC;
	Thu, 22 May 2025 05:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nksMvm3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675789A893
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:09:43 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIi97R000862
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mL2nMm/lUNsnBwj7RejZQGXhQ5fiEATigbnCNhzTYvI=; b=nksMvm3O+iEwUqSp
 X0rkTPz3mcnIVVZlm19BkX0QdpJA84vi6oXyGVabhhwBwxxDfTdHxi9Ha9/ZXv8K
 /SR23mM9fSth8TCnsGMK+19XttHIu2Zs3qm+1AgKu/rxeOpFxR8usjl5CT6UflLG
 gPWREWicmoL1w4DAE1eftqVGTlS5poGf1c//Wa1Q2QLR6VoHlwyb/yyC4vgPlo23
 QqbA72QQ7ck4eK4/JeWrNd8W/m+6I5oc/MvuR3qiRaD0PkPzsfnkvaZB9WTkaA9y
 FDOT1kNc9JvnHB92FqRN1fa0ip0i6Wbyyt/ayFdIoJkIQVoCiMCFdMgXBffI+4vT
 RYzn3w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6w1fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:09:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-30e6980471cso6129362a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 22:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747890581; x=1748495381;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mL2nMm/lUNsnBwj7RejZQGXhQ5fiEATigbnCNhzTYvI=;
 b=M/IFdoBqDN9yhHDbvJmJPBZacnoTKR5YLVdkgR59PsyFPL7JwK1y+n8Fhupe1BBkP/
 TfbTx5WyWf3uFZm9Mso3oNDMHAzVkfP7UtD8VycgxeQOI+nT9o+T3nd+iIbGXHB839m5
 HPgkqiszhsN0GFrtbatbiGdRX6vFezWVNHJ1U/Ralqm+qXfG6X/6K7BpBMniimElm4O3
 UG2FUyjxZrSWF/x6wmTJbnoUyK4GvzzHqMECAKfL0HjTzxShoPfKYThWJGEvhAt2H8wC
 xC7oyJNJLztw2Ejl144N/QT19HHckUs5qhRsoRWiY5dSzZkkz9oRHypaZPkdJrHFkuur
 qr/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnqovaq11o29Nhabqcg7kUs3kXyLDbybMX9Cg9/Uw0g1xrU4vi7l8oLhrDNiiGZSksgsoc7m8Kznk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzApj+wyLRrPjblxnwTKr3OnxlHe4UvcePG/yZ4xsQ5yrUe85cm
 snA1icqXcGhzhJ5arWA6b3K1kWA65Y1Ct5T+rNvfiNZ8O/HfQTRk/EtpBRYfe3GHQY2jvsBO93v
 kHo1GicOR65VjXoGobGhINC+IxTzKjpZ3yQMf8tE6vlB+hvsJrDjCJ7VflHCRbNdRSJfkZlI=
X-Gm-Gg: ASbGnct0yt/HXblqQ2wkj8J4y0GlrhY0ICXz7u8ml6BUuOKjjezGGzeL5rlf45gnUEu
 MQMvlTyVkc09FYMKfDRyBzEsvluvySrH1j/F/SDeWuDQNKUorlnbBdh4aTzI4gzDlQ8aXho9WwI
 Ms7PZKu4sYa56Pl5wf51+XFFGwlhjtglXSC9uida5M2VnraJYvQOdi5/kMSeXZxTUIrD5gpUraO
 aw1OBJVtyJZHw3jmq0D0pv7Kdv/q9dvj2W8P4pzQiYusQpULAhc4rC5mLQSX/KWpKbJrkVCb/J1
 i7J7kOFko43mitnUDcSV6vMHtfH7LrurkCPY4yE=
X-Received: by 2002:a17:90b:3d50:b0:310:8db0:1663 with SMTP id
 98e67ed59e1d1-3108db01678mr8386460a91.17.1747890581046; 
 Wed, 21 May 2025 22:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR4vGALxJNkiMpd5v9TwbWnbybVsuJ8/gUIoFTGuevTfvyKNKQ+h5H5GJWUa6LSnsO8mG89g==
X-Received: by 2002:a17:90b:3d50:b0:310:8db0:1663 with SMTP id
 98e67ed59e1d1-3108db01678mr8386425a91.17.1747890580586; 
 Wed, 21 May 2025 22:09:40 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30f36513bb7sm4630878a91.46.2025.05.21.22.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 22:09:40 -0700 (PDT)
Message-ID: <c970fdd9-4dab-4e02-865f-7f8e6a830088@oss.qualcomm.com>
Date: Thu, 22 May 2025 10:39:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
 <3b9dc9d5-be31-420a-ae90-335377ad6d08@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <3b9dc9d5-be31-420a-ae90-335377ad6d08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ApD0ajpNaVaC7x1IsShWMDpkT8-emXmH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0OCBTYWx0ZWRfX2FLGN+WkRHs5
 fPdxpxlKNapJHvPkffLzbgr787tW72JabwZFARjCVgC6a414LaPfFqrzZYR6iAWxzWgzsNiMtKz
 jckk0HPyr792w1fxI8IlIk61AZ+ZA7qHU++u2EFdXIEmy2Q0Al4i0D502fD8FU0phCFliGmPA2Q
 IpUDDv9O+tJsp1WjeXlVUiRymStMcGxJbm3cH4GFP0M0op2Gk2e0AujeXSb2t6qQD65H2F2+sjF
 5wvx/TWghd6u9QVx+jv12WkJQS/jHYAp3HLpJkPMVCIwFpl5sE19RK0YikxkCtT2aO9WPyoST2M
 rj8p4Tu6QeJeg3aqqpO9zkB6EFT0w2vheSV+HwfptU0P5Aoz1Zh6Nlk/G4lnfbiqh+j9xaBx9FO
 FW9Ctg8iruXomnD28leaGjWsKrG9+TwPDCH6cXQHpTizP+MvZj063rLjA6AzEEFiX3v0NOD1
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682eb196 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MzRfKa0KFu4D08wbYRYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ApD0ajpNaVaC7x1IsShWMDpkT8-emXmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220048
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



On 5/19/2025 5:05 PM, Srinivas Kandagatla wrote:
> On 5/13/25 05:28, Ekansh Gupta wrote:
>> Remote heap allocations are not organized in a maintainable manner,
>> leading to potential issues with memory management. As the remote
>> heap allocations are maintained in fl mmaps list, the allocations
>> will go away if the audio daemon process is killed but there are
>> chances that audio PD might still be using the memory. Move all
>> remote heap allocations to a dedicated list where the entries are
>> cleaned only for user requests and subsystem shutdown.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 93 ++++++++++++++++++++++++++++++++----------
>>  1 file changed, 72 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index ca3721365ddc..d4e38b5e5e6c 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -273,10 +273,12 @@ struct fastrpc_channel_ctx {
>>  	struct kref refcount;
>>  	/* Flag if dsp attributes are cached */
>>  	bool valid_attributes;
>> +	/* Flag if audio PD init mem was allocated */
>> +	bool audio_init_mem;
>>  	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>>  	struct fastrpc_device *secure_fdevice;
>>  	struct fastrpc_device *fdevice;
>> -	struct fastrpc_buf *remote_heap;
>> +	struct list_head rhmaps;
> Other than Audiopd, do you see any other remote heaps getting added to
> this list?

With current implementation it is possible but that is not correct, I
will include a patch to restrict remote heap map and unmap requests to
audio daemon only.

>
>>  	struct list_head invoke_interrupted_mmaps;
>>  	bool secure;
>>  	bool unsigned_support;
>> @@ -1237,12 +1239,47 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
>>  	return false;
>>  }
>>  
>> +static void fastrpc_cleanup_rhmaps(struct fastrpc_channel_ctx *cctx)
>> +{
>> +	struct fastrpc_buf *buf, *b;
>> +	struct list_head temp_list;
>> +	int err;
>> +	unsigned long flags;
>> +
>> +	INIT_LIST_HEAD(&temp_list);
>> +
>> +	spin_lock_irqsave(&cctx->lock, flags);
>> +	list_splice_init(&cctx->rhmaps, &temp_list);
>> +	spin_unlock_irqrestore(&cctx->lock, flags);
> Can you explain why do we need to do this?

To avoid any locking issue. While clean-up, I'm replacing the rhmaps
list with an empty one under a lock and cleaning up the list without
any more locking.

>
>> +
>> +	list_for_each_entry_safe(buf, b, &temp_list, node) {> +		if (cctx->vmcount) {
>> +			u64 src_perms = 0;
>> +			struct qcom_scm_vmperm dst_perms;
>> +			u32 i;
>> +
>> +			for (i = 0; i < cctx->vmcount; i++)
>> +				src_perms |= BIT(cctx->vmperms[i].vmid);
>> +
>> +			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> +			dst_perms.perm = QCOM_SCM_PERM_RWX;
>> +			err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
>> +						  &src_perms, &dst_perms, 1);
>> +			if (err)
>> +				continue;
> Memory leak here.

I don't see any better way to handle the failure here as the clean-up
is called when the channel is going down and there won't be any
way to free this memory if qcom_scm call fails?

Do you see any better way to address this? Or should I add a comment
highlighting this limitation?

>
>> +		}
>> +		fastrpc_buf_free(buf);
>> +	}
>> +}
>> +
> --srini

