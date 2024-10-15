Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65FE99F6B9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 21:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFB110E11B;
	Tue, 15 Oct 2024 19:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2kTk8hi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF4B10E11B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 19:04:30 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FIj18G020410
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 19:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=H0rA9hYqTw4IoN8sT1E6A2pi
 7Weid7AxHTd6PQjwrM4=; b=g2kTk8hidkk6xD7dY4X+33ZxzVBA+qPJLhGzLQXD
 +rZ//JG1N4c80iUtUguv1DDn33ezrZbV1EvWPAM24ynIaPK0olhQXY4euP7GyyxY
 XOKkQzEfCzE1EC0qR0yvdrRqVMBHuc3/k7q0YqwEGRCqQK1eVUAMc601UWpoqBfm
 YMg+7q9D+TqqqL7NwvxX+l1Qfu3vjCzjfEIgj6GW6yCgiUNXPnVmUTyCpRLgisB+
 W1sZeHp6H0PzI0voFIvenKkCuZHv2geHyL34f9CIcYuhmLXMcP1eEv9aLgJsTeri
 3KRYWvCWj9w1OAH0PQhiZI6lpJ1fK1jqHAGSkS150s4byw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429nm3hq5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 19:04:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-20ca7d8670cso51753695ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 12:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729019054; x=1729623854;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0rA9hYqTw4IoN8sT1E6A2pi7Weid7AxHTd6PQjwrM4=;
 b=erybzhGGv80CxH+OGPLkIcK24Z06lvLwrGFzEaBrpQnTm/s574vXj2Dq1/OTR/v7F3
 3MQ40EJD4+TsxSqpOlZV1Cdpd+0jH9Pfk7oPZEKPA2UE5Q7FuKloiJR3WqpHE2fYEqLh
 yrMgAmAt4v/5IFSDq8TUoqwL5qVXBmBtIPnijYarlAPifzVcEifZheZ+zSA7blopR1nF
 c9+l8QdK9pAgQZ+0OnyF+wZtbuSX4n75zo0v/e+hcHhJrqoUU9AiPwMbbu4Cjrxdrio+
 Qjy8zKUEPHHMS3LnDs/pEkPbWxUzkZE+yLLnsvgTO091P8ocYsYcpvKUwNRvbfftTq5c
 yO3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRRQ0pP97i+le5985pWlH37lP6WPUwMCHcY7mcnxvEx6JK2fDBV5Wdm6GpvaNJgDjfxLBTqwp2FyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiAXuP0s4mkroGIgN0wFEWkZCIi7xN4gcvIbpPTSefM4BpQUf2
 8klPQ4zzvuFAV1X+6DL8vmaqBEi9ecq+W67xIYAm8+yEa44jaDpVE++hBJSI4LhOK8hfvVVj/z1
 4T2zoEtgQ8Qm4JLe7UiFVGUfWRiQJ5mlpDpVaZbyRkA+j7Hv2AeBRwg/9iwSEUM/2juo=
X-Received: by 2002:a17:902:f786:b0:20c:aae9:7bd7 with SMTP id
 d9443c01a7336-20cbb283458mr171677545ad.39.1729019053618; 
 Tue, 15 Oct 2024 12:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+6IzWY4vtET2GUIT13LBq7aGu4XNkMv36Ciihb4WAIQTlFIs1yw0QlCpCIHTAtkrv/O4iWw==
X-Received: by 2002:a17:902:f786:b0:20c:aae9:7bd7 with SMTP id
 d9443c01a7336-20cbb283458mr171677165ad.39.1729019053117; 
 Tue, 15 Oct 2024 12:04:13 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e392edacdfsm2231080a91.24.2024.10.15.12.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 12:04:11 -0700 (PDT)
Date: Tue, 15 Oct 2024 12:04:09 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: andersson@kernel.org, jacek.lawrynowicz@linux.intel.com,
 quic_carlv@quicinc.com, ogabbay@kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Add crashdump to Sahara
Message-ID: <Zw68qSk8n+Izrevg@hu-bjorande-lv.qualcomm.com>
References: <20240918155254.3186031-1-quic_jhugo@quicinc.com>
 <Zw2SjWn43zeFjBtR@hu-bjorande-lv.qualcomm.com>
 <6a2fe39b-eb7a-4b6d-9ce3-20685663cffd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a2fe39b-eb7a-4b6d-9ce3-20685663cffd@quicinc.com>
X-Proofpoint-GUID: EJPxlZsMIg8dQeL3W6-BlGyaA2QY3ltp
X-Proofpoint-ORIG-GUID: EJPxlZsMIg8dQeL3W6-BlGyaA2QY3ltp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150128
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

On Tue, Oct 15, 2024 at 12:34:29PM -0600, Jeffrey Hugo wrote:
> On 10/14/2024 3:52 PM, Bjorn Andersson wrote:
> > On Wed, Sep 18, 2024 at 09:52:54AM -0600, Jeffrey Hugo wrote:
[..]
> > >   struct sahara_context {
> > >   	struct sahara_packet		*tx[SAHARA_NUM_TX_BUF];
> > >   	struct sahara_packet		*rx;
> > > -	struct work_struct		work;
> > > +	struct work_struct		fw_work;
> > > +	struct work_struct		dump_work;
> > >   	struct mhi_device		*mhi_dev;
> > >   	const char			**image_table;
> > >   	u32				table_size;
> > >   	u32				active_image_id;
> > >   	const struct firmware		*firmware;
> > > +	u64				dump_table_address;
> > > +	u64				dump_table_length;
> > > +	size_t				rx_size;
> > > +	size_t				rx_size_requested;
> > > +	void				*mem_dump;
> > > +	size_t				mem_dump_sz;
> > > +	struct sahara_dump_table_entry	*dump_image;
> > > +	u64				dump_image_offset;
> > > +	void				*mem_dump_freespace;
> > > +	u64				dump_images_left;
> > 
> > That's a lot of images; and it's just a natural number. How about
> > "unsigned int" instead to convey that the size "doesn't matter"?
> 
> Hmm, this is derived from a 64-bit value that comes from the device.  If we
> downgrade this to uint (32-bit) we'd need to do some overflow checking.
> Having a matched type and not worrying about the conversion makes me feel
> better.
> 
> You still prefer uint?
> 

I'm fine with this motivation.

> > 
> > > +	bool				is_mem_dump_mode;
> > >   };
> > >   static const char *aic100_image_table[] = {
> > > @@ -153,6 +236,8 @@ static void sahara_send_reset(struct sahara_context *context)
> > >   {
> > >   	int ret;
> > > +	context->is_mem_dump_mode = false;
> > > +
> > >   	context->tx[0]->cmd = cpu_to_le32(SAHARA_RESET_CMD);
> > >   	context->tx[0]->length = cpu_to_le32(SAHARA_RESET_LENGTH);
> > > @@ -186,7 +271,8 @@ static void sahara_hello(struct sahara_context *context)
> > >   	}
> > >   	if (le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_PENDING &&
> > > -	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE) {
> > > +	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE &&
> > > +	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG) {
> > >   		dev_err(&context->mhi_dev->dev, "Unsupported hello packet - mode %d\n",
> > >   			le32_to_cpu(context->rx->hello.mode));
> > >   		return;
> > > @@ -320,9 +406,70 @@ static void sahara_end_of_image(struct sahara_context *context)
> > >   		dev_dbg(&context->mhi_dev->dev, "Unable to send done response %d\n", ret);
> > >   }
> > > +static void sahara_memory_debug64(struct sahara_context *context)
> > > +{
> > > +	int ret;
> > > +
> > > +	dev_dbg(&context->mhi_dev->dev,
> > > +		"MEMORY DEBUG64 cmd received. length:%d table_address:%#llx table_length:%#llx\n",
> > > +		le32_to_cpu(context->rx->length),
> > > +		le64_to_cpu(context->rx->memory_debug64.table_address),
> > > +		le64_to_cpu(context->rx->memory_debug64.table_length));
> > > +
> > > +	if (le32_to_cpu(context->rx->length) != SAHARA_MEM_DEBUG64_LENGTH) {
> > > +		dev_err(&context->mhi_dev->dev, "Malformed memory debug64 packet - length %d\n",
> > > +			le32_to_cpu(context->rx->length));
> > 
> > Any particular reason why you choose not to attempt a reset in these two
> > error cases?
> 
> Undefined behavior.  The spec doesn't address this condition - I guess the
> assumption is that the device provides valid values.
> 
> The spec places limits on reset -
> "The host sends a reset packet to reset the target. The target services a
> reset request only if it is in a state where reset requests are valid.
> 
> If the target receives an invalid reset request, the target sends an error
> in an end of image transfer packet"
> 
> From there the spec doesn't clarify how to proceed.
> 
> So, it seems possible that we send a reset here, the device rejects it, we
> get an error back, and cannot really proceed, which feels like a "back to
> square 1" situation.  Less complex to not send a reset and end up in the
> same place.
> 

No concerns with this.

> > 
> > > +		return;
> > > +	}
> > > +
> > > +	context->dump_table_address = le64_to_cpu(context->rx->memory_debug64.table_address);
> > > +	context->dump_table_length = le64_to_cpu(context->rx->memory_debug64.table_length);
> > > +
[..]
> > >   static void sahara_processing(struct work_struct *work)
> > >   {
> > > -	struct sahara_context *context = container_of(work, struct sahara_context, work);
> > > +	struct sahara_context *context = container_of(work, struct sahara_context, fw_work);
> > >   	int ret;
> > >   	switch (le32_to_cpu(context->rx->cmd)) {
> > > @@ -338,6 +485,12 @@ static void sahara_processing(struct work_struct *work)
> > >   	case SAHARA_DONE_RESP_CMD:
> > >   		/* Intentional do nothing as we don't need to exit an app */
> > >   		break;
> > > +	case SAHARA_RESET_RESP_CMD:
> > > +		/* Intentional do nothing as we don't need to exit an app */
> > 
> > For this patch I don't have any concern, but should we do something to
> > track that we should not handle any further requests?
> 
> The spec says that the device will (warm) reset after sending this.  It is
> actually a bit of a race condition as the AIC100 implementation will send
> this packet, and then force a watchdog bite to reset.  If that watchdog
> processing is very quick, we won't even see this.
> 

I see the same race on the MSM side...

> Another spec ambigiuity on what happens if the device doesn't reset after
> this command.  Tracking this feels like complexity for little gain.
> 

Fair enough.

> > 
> > > +		break;
> > > +	case SAHARA_MEM_DEBUG64_CMD:
> > > +		sahara_memory_debug64(context);
> > > +		break;
> > >   	default:
> > >   		dev_err(&context->mhi_dev->dev, "Unknown command %d\n",
> > >   			le32_to_cpu(context->rx->cmd));
> > > @@ -350,6 +503,223 @@ static void sahara_processing(struct work_struct *work)
> > >   		dev_err(&context->mhi_dev->dev, "Unable to requeue rx buf %d\n", ret);
> > >   }
> > > +static void sahara_parse_dump_table(struct sahara_context *context)
> > > +{
[..]
> > > +	image_out_table_entry = (struct sahara_dump_table_entry *)(context->mem_dump +
> > > +								sizeof(*dump_meta));
> > 
> > Isn't this cast unnecessary?
> 
> I thought there was a compiler warning, but I'm not seeing it.  Will fix.
> 

mem_dump is void *, so you should be fine an implicit cast.

> > 
> > > +	dev_table_entry = (struct sahara_debug_table_entry64 *)(context->rx);
> > > +	for (i = 0; i < table_nents; ++i, ++image_out_table_entry, ++dev_table_entry) {
> > > +		image_out_table_entry->type = le64_to_cpu(dev_table_entry->type);
> > > +		image_out_table_entry->address = le64_to_cpu(dev_table_entry->address);
> > > +		image_out_table_entry->length = le64_to_cpu(dev_table_entry->length);
> > > +		strscpy(image_out_table_entry->description, dev_table_entry->description,
> > > +			SAHARA_TABLE_ENTRY_STR_LEN);
> > > +		strscpy(image_out_table_entry->filename,
> > > +			dev_table_entry->filename,
> > > +			SAHARA_TABLE_ENTRY_STR_LEN);
> > > +	}
> > > +
> > > +	context->mem_dump_freespace = image_out_table_entry;
> > > +
> > > +	/* Done parsing the table, switch to image dump mode */
> > > +	context->dump_table_length = 0;
> > > +
> > > +	/* Request the first chunk of the first image */
> > > +	context->dump_image = (struct sahara_dump_table_entry *)(context->mem_dump +
> > > +								sizeof(*dump_meta));
> > 
> > I would have preferred to see this (and above) written such that it's
> > explicitly clear that you're filling out an array of entries and then
> > point this to the first entry in that array.
> 
> I'm not sure I understand what you would like to see here.  Can you perhaps
> give an example?
> 

Per your devcoredump definition at the top, image_out_table_entry is an
array of struct sahara_dump_table_entry, which you fill out by sliding a
pointer starting at mem_dump + sizeof(*dump_meta).

You then have context->dump_image to be a pointer to each element in
this array, except that it's not expressed as an array...

But it took me a minute to understand that this was what the code is
doing.

If you instead wrote it as:

  for (i = 0..table_nents) {
  	image_out_table[i].foo = bar;
	...;
  }

  context->dump_image = &image_out_table[0];

(Or perhaps even make dump_image an index into image_out_table)

It would have been obvious to me when I looked at the code that you're
setting up an array and then looping over each entry in the array.


So, I don't see anything wrong with the logic, but it would have been
easier for me if the code manifested this array, as an array...

Perhaps I'm missing some detail which complicates things, as far as I
can tell the logic presented is reasonable.

Regards,
Bjorn
