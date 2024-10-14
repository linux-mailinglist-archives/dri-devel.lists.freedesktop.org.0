Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9238299DA0B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 01:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9913D10E4E0;
	Mon, 14 Oct 2024 23:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUcIJ/GK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A118C10E012
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 21:52:18 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EBvZpM017256
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 21:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yo7Rzbyr282Clq2IzZW8hr16
 Khf68QPfl1RusiIUr8Q=; b=EUcIJ/GK/Kk7AW0j4441EHS9HVJanHuR7fYJz89Q
 7YWhqiTNlTKrhbiFRXXE3v85zPrtLLp7AJZCKnrV8H1uBYoQ/GH1cKkOXk2UzgxC
 NLX/hwuMfB8RaWsJs6QjWpDQolThyjkG4qqbnrujXUQScWp59cvOB+0PrXeUX5nH
 sXZdCqurD1dasFK/QPTARuhfe4jg/F6/4SlPYQMrK2D9Wy80c6UogrPAkw5Up4Ip
 TIXida2Nj7+dhsrYzYPxJZ4TVi+NjRxFmiALhc4QYIu8A4VZajGptiogFbmW6Zwr
 9TfPgnEglEhv9wLEeIqUZUe4XAGkZiw+1uhY4kN+Eu1Q8A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hb35mxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 21:52:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-20c9673e8cdso31943465ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 14:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728942737; x=1729547537;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yo7Rzbyr282Clq2IzZW8hr16Khf68QPfl1RusiIUr8Q=;
 b=dsBmTweDdSuRrCOMmJlNkdRmca/aQkEDif/OwSNUq3Oe8cODYI475qaJmtc5EuCIQc
 lz9US09CvRNSsJwRkgrVAjdNOdb0IHtLFuq5eTbwE1EAO8LVVlOtEXG/Mb8tl+L9GEL2
 0mzjnTKDnpNw77WYEUfibaxV7mHF9Iez43W9gbdKJeM6fMOuqYAuhckV1DvQD4LdvmGr
 u5jQayIDbYjC7AyAlWpZw/p5gjYLX8SxM2HQT4SVX1lZUL6PC+xNXMY/4yRtLlow32xg
 E/PkW06HDztU8vkgzE3IbElkW/pqheU/j7nE/PKIMynHdZjISeckRtsM5epll7N8KiC8
 KnYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYj6hpo9pO5sn7zrffLz91+eF2sOoTQ5BEXgRLjCQSyJMK7W6vVsoa97KXoexGhxNIX1Iv3QMZWlA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdtyJwvxl8z9v9zseoteYENOOlD5HIqrJP/Gl0GGgzjWNalsbs
 4GzTSGrYA4AgKqyQE86w28LjOiMzby5c5yORcBpiWN+/sPuurEjwd/+G+onD+mBWCWpaOayiNGl
 8WiStMy3sKDxsojoV+IHfgC4aec4dt7Y9Apz5G6a926AeLdru/AW1NPl6uibeAYER1BM=
X-Received: by 2002:a17:902:d551:b0:20c:6bff:fcc2 with SMTP id
 d9443c01a7336-20ca16e9a37mr196003265ad.56.1728942736671; 
 Mon, 14 Oct 2024 14:52:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyL6oKgzN5XZRkeSqXi/nQYmObDzgNBhD1CDUF3s6XPcf1oKgiQQE1rT0+bBemF/P6IMhCug==
X-Received: by 2002:a17:902:d551:b0:20c:6bff:fcc2 with SMTP id
 d9443c01a7336-20ca16e9a37mr196002955ad.56.1728942736159; 
 Mon, 14 Oct 2024 14:52:16 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c8c0e751fsm70733975ad.139.2024.10.14.14.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 14:52:15 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:52:13 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: andersson@kernel.org, jacek.lawrynowicz@linux.intel.com,
 quic_carlv@quicinc.com, ogabbay@kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Add crashdump to Sahara
Message-ID: <Zw2SjWn43zeFjBtR@hu-bjorande-lv.qualcomm.com>
References: <20240918155254.3186031-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918155254.3186031-1-quic_jhugo@quicinc.com>
X-Proofpoint-ORIG-GUID: 7bb3fgOQPcvJ6Ty-dbulzyC54iLKcoGH
X-Proofpoint-GUID: 7bb3fgOQPcvJ6Ty-dbulzyC54iLKcoGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140155
X-Mailman-Approved-At: Mon, 14 Oct 2024 23:17:05 +0000
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

On Wed, Sep 18, 2024 at 09:52:54AM -0600, Jeffrey Hugo wrote:
> The Sahara protocol has a crashdump functionality. In the hello
> exchange, the device can advertise it has a memory dump available for
> the host to collect. Instead of the device making requests of the host,
> the host requests data from the device which can be later analyzed.
> 
> Implement this functionality and utilize the devcoredump framework for
> handing the dump over to userspace.
> 
> Similar to how firmware loading in Sahara involves multiple files,
> crashdump can consist of multiple files for different parts of the dump.
> Structure these into a single buffer that userspace can parse and
> extract the original files from.
> 

Looks good. No technical concerns but a few stylistic comments below.

> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/sahara.c | 394 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 387 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index bf94bbab6be5..ed792b615ea2 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -2,6 +2,7 @@
>  
>  /* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
>  
> +#include <linux/devcoredump.h>
>  #include <linux/firmware.h>
>  #include <linux/limits.h>
>  #include <linux/mhi.h>
> @@ -9,6 +10,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/overflow.h>
>  #include <linux/types.h>
> +#include <linux/vmalloc.h>
>  #include <linux/workqueue.h>
>  
>  #include "sahara.h"
> @@ -36,12 +38,14 @@
>  
>  #define SAHARA_PACKET_MAX_SIZE		0xffffU /* MHI_MAX_MTU */
>  #define SAHARA_TRANSFER_MAX_SIZE	0x80000
> +#define SAHARA_READ_MAX_SIZE		0xfff0U /* Avoid unaligned requests */
>  #define SAHARA_NUM_TX_BUF		DIV_ROUND_UP(SAHARA_TRANSFER_MAX_SIZE,\
>  							SAHARA_PACKET_MAX_SIZE)
>  #define SAHARA_IMAGE_ID_NONE		U32_MAX
>  
>  #define SAHARA_VERSION			2
>  #define SAHARA_SUCCESS			0
> +#define SAHARA_TABLE_ENTRY_STR_LEN	20
>  
>  #define SAHARA_MODE_IMAGE_TX_PENDING	0x0
>  #define SAHARA_MODE_IMAGE_TX_COMPLETE	0x1
> @@ -53,6 +57,8 @@
>  #define SAHARA_END_OF_IMAGE_LENGTH	0x10
>  #define SAHARA_DONE_LENGTH		0x8
>  #define SAHARA_RESET_LENGTH		0x8
> +#define SAHARA_MEM_DEBUG64_LENGTH	0x18
> +#define SAHARA_MEM_READ64_LENGTH	0x18
>  
>  struct sahara_packet {
>  	__le32 cmd;
> @@ -80,18 +86,95 @@ struct sahara_packet {
>  			__le32 image;
>  			__le32 status;
>  		} end_of_image;
> +		struct {
> +			__le64 table_address;
> +			__le64 table_length;
> +		} memory_debug64;
> +		struct {
> +			__le64 memory_address;
> +			__le64 memory_length;
> +		} memory_read64;
>  	};
>  };
>  
> +struct sahara_debug_table_entry64 {
> +	__le64	type;
> +	__le64	address;
> +	__le64	length;
> +	char	description[SAHARA_TABLE_ENTRY_STR_LEN];
> +	char	filename[SAHARA_TABLE_ENTRY_STR_LEN];
> +};
> +
> +struct sahara_dump_table_entry {
> +	u64	type;
> +	u64	address;
> +	u64	length;
> +	char	description[SAHARA_TABLE_ENTRY_STR_LEN];
> +	char	filename[SAHARA_TABLE_ENTRY_STR_LEN];
> +};
> +
> +#define SAHARA_DUMP_V1_MAGIC 0x1234567890abcdef
> +#define SAHARA_DUMP_V1_VER   1
> +struct sahara_memory_dump_meta_v1 {
> +	u64	magic;
> +	u64	version;
> +	u64	dump_size;
> +	u64	table_size;
> +};
> +
> +/*
> + * Layout of crashdump

Please clarify that this is the structure of the dump you expose to the
user, not what comes out of the device.

> + *              +------------------------------------------+
> + *              |         Crashdump Meta structure         |
> + *              | type: struct sahara_memory_dump_meta_v1  |
> + *              +------------------------------------------+
> + *              |             Crashdump Table              |
> + *              | type: array of struct                    |
> + *              |       sahara_dump_table_entry            |
> + *              |                                          |
> + *              |                                          |
> + *              +------------------------------------------+
> + *              |                Crashdump                 |
> + *              |                                          |
> + *              |                                          |
> + *              |                                          |
> + *              |                                          |
> + *              |                                          |
> + *              +------------------------------------------+
> + *
> + * First is the metadata header. Userspace can use the magic number to verify
> + * the content type, and then check the version for the rest of the format.
> + * New versions should keep the magic number location/value, and version
> + * location, but increment the version value.
> + *
> + * For v1, the metadata lists the size of the entire dump (header + table +
> + * dump) and the size of the table. Then the dump image table, which describes
> + * the contents of the dump. Finally all the images are listed in order, with
> + * no deadspace in between. Userspace can use the sizes listed in the image
> + * table to reconstruct the individual images.
> + */
> +
>  struct sahara_context {
>  	struct sahara_packet		*tx[SAHARA_NUM_TX_BUF];
>  	struct sahara_packet		*rx;
> -	struct work_struct		work;
> +	struct work_struct		fw_work;
> +	struct work_struct		dump_work;
>  	struct mhi_device		*mhi_dev;
>  	const char			**image_table;
>  	u32				table_size;
>  	u32				active_image_id;
>  	const struct firmware		*firmware;
> +	u64				dump_table_address;
> +	u64				dump_table_length;
> +	size_t				rx_size;
> +	size_t				rx_size_requested;
> +	void				*mem_dump;
> +	size_t				mem_dump_sz;
> +	struct sahara_dump_table_entry	*dump_image;
> +	u64				dump_image_offset;
> +	void				*mem_dump_freespace;
> +	u64				dump_images_left;

That's a lot of images; and it's just a natural number. How about
"unsigned int" instead to convey that the size "doesn't matter"?

> +	bool				is_mem_dump_mode;
>  };
>  
>  static const char *aic100_image_table[] = {
> @@ -153,6 +236,8 @@ static void sahara_send_reset(struct sahara_context *context)
>  {
>  	int ret;
>  
> +	context->is_mem_dump_mode = false;
> +
>  	context->tx[0]->cmd = cpu_to_le32(SAHARA_RESET_CMD);
>  	context->tx[0]->length = cpu_to_le32(SAHARA_RESET_LENGTH);
>  
> @@ -186,7 +271,8 @@ static void sahara_hello(struct sahara_context *context)
>  	}
>  
>  	if (le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_PENDING &&
> -	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE) {
> +	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE &&
> +	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG) {
>  		dev_err(&context->mhi_dev->dev, "Unsupported hello packet - mode %d\n",
>  			le32_to_cpu(context->rx->hello.mode));
>  		return;
> @@ -320,9 +406,70 @@ static void sahara_end_of_image(struct sahara_context *context)
>  		dev_dbg(&context->mhi_dev->dev, "Unable to send done response %d\n", ret);
>  }
>  
> +static void sahara_memory_debug64(struct sahara_context *context)
> +{
> +	int ret;
> +
> +	dev_dbg(&context->mhi_dev->dev,
> +		"MEMORY DEBUG64 cmd received. length:%d table_address:%#llx table_length:%#llx\n",
> +		le32_to_cpu(context->rx->length),
> +		le64_to_cpu(context->rx->memory_debug64.table_address),
> +		le64_to_cpu(context->rx->memory_debug64.table_length));
> +
> +	if (le32_to_cpu(context->rx->length) != SAHARA_MEM_DEBUG64_LENGTH) {
> +		dev_err(&context->mhi_dev->dev, "Malformed memory debug64 packet - length %d\n",
> +			le32_to_cpu(context->rx->length));

Any particular reason why you choose not to attempt a reset in these two
error cases?

> +		return;
> +	}
> +
> +	context->dump_table_address = le64_to_cpu(context->rx->memory_debug64.table_address);
> +	context->dump_table_length = le64_to_cpu(context->rx->memory_debug64.table_length);
> +
> +	if (context->dump_table_length % sizeof(struct sahara_debug_table_entry64) != 0 ||
> +	    !context->dump_table_length) {
> +		dev_err(&context->mhi_dev->dev, "Malformed memory debug64 packet - table length %lld\n",
> +			context->dump_table_length);
> +		return;
> +	}
> +
> +	/*
> +	 * From this point, the protocol flips. We make memory_read requests to
> +	 * the device, and the device responds with the raw data. If the device
> +	 * has an error, it will send an End of Image command. First we need to
> +	 * request the memory dump table so that we know where all the pieces
> +	 * of the dump are that we can consume.
> +	 */
> +
> +	context->is_mem_dump_mode = true;
> +
> +	/*
> +	 * Assume that the table is smaller than our MTU so that we can read it
> +	 * in one shot. The spec does not put an upper limit on the table, but
> +	 * no known device will exceed this.
> +	 */
> +	if (context->dump_table_length > SAHARA_PACKET_MAX_SIZE) {
> +		dev_err(&context->mhi_dev->dev, "Memory dump table length %lld exceeds supported size. Discarding dump\n",
> +			context->dump_table_length);
> +		sahara_send_reset(context);
> +		return;
> +	}
> +
> +	context->tx[0]->cmd = cpu_to_le32(SAHARA_MEM_READ64_CMD);
> +	context->tx[0]->length = cpu_to_le32(SAHARA_MEM_READ64_LENGTH);
> +	context->tx[0]->memory_read64.memory_address = context->rx->memory_debug64.table_address;
> +	context->tx[0]->memory_read64.memory_length = context->rx->memory_debug64.table_length;

I think it would be easier to follow if you passed dump_table_address
and dump_table_length in here, rather than their __le64 source version.

> +
> +	context->rx_size_requested = context->dump_table_length;
> +
> +	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
> +			    SAHARA_MEM_READ64_LENGTH, MHI_EOT);
> +	if (ret)
> +		dev_err(&context->mhi_dev->dev, "Unable to send read for dump table %d\n", ret);
> +}
> +
>  static void sahara_processing(struct work_struct *work)
>  {
> -	struct sahara_context *context = container_of(work, struct sahara_context, work);
> +	struct sahara_context *context = container_of(work, struct sahara_context, fw_work);
>  	int ret;
>  
>  	switch (le32_to_cpu(context->rx->cmd)) {
> @@ -338,6 +485,12 @@ static void sahara_processing(struct work_struct *work)
>  	case SAHARA_DONE_RESP_CMD:
>  		/* Intentional do nothing as we don't need to exit an app */
>  		break;
> +	case SAHARA_RESET_RESP_CMD:
> +		/* Intentional do nothing as we don't need to exit an app */

For this patch I don't have any concern, but should we do something to
track that we should not handle any further requests?

> +		break;
> +	case SAHARA_MEM_DEBUG64_CMD:
> +		sahara_memory_debug64(context);
> +		break;
>  	default:
>  		dev_err(&context->mhi_dev->dev, "Unknown command %d\n",
>  			le32_to_cpu(context->rx->cmd));
> @@ -350,6 +503,223 @@ static void sahara_processing(struct work_struct *work)
>  		dev_err(&context->mhi_dev->dev, "Unable to requeue rx buf %d\n", ret);
>  }
>  
> +static void sahara_parse_dump_table(struct sahara_context *context)
> +{
> +	struct sahara_dump_table_entry *image_out_table_entry;
> +	struct sahara_debug_table_entry64 *dev_table_entry;
> +	struct sahara_memory_dump_meta_v1 *dump_meta;
> +	u64 table_nents;
> +	u64 dump_length;
> +	int ret;
> +	u64 i;
> +
> +	table_nents = context->dump_table_length / sizeof(*dev_table_entry);
> +	context->dump_images_left = table_nents;
> +	dump_length = 0;
> +
> +	for (i = 0; i < table_nents; ++i) {
> +		dev_table_entry = (struct sahara_debug_table_entry64 *)(context->rx) + i;
> +		/* Do not trust the device, ensure the strings are terminated */
> +		dev_table_entry->description[SAHARA_TABLE_ENTRY_STR_LEN - 1] = 0;
> +		dev_table_entry->filename[SAHARA_TABLE_ENTRY_STR_LEN - 1] = 0;
> +
> +		dump_length = size_add(dump_length, le64_to_cpu(dev_table_entry->length));
> +		if (dump_length == SIZE_MAX) {
> +			/* Discard the dump */
> +			sahara_send_reset(context);
> +			return;
> +		}
> +
> +		dev_dbg(&context->mhi_dev->dev,
> +			"Memory dump table entry %lld type: %lld address: %#llx length: %#llx description: \"%s\" filename \"%s\"\n",
> +			i,
> +			le64_to_cpu(dev_table_entry->type),
> +			le64_to_cpu(dev_table_entry->address),
> +			le64_to_cpu(dev_table_entry->length),
> +			dev_table_entry->description,
> +			dev_table_entry->filename);
> +	}
> +
> +	dump_length = size_add(dump_length, sizeof(*dump_meta));
> +	if (dump_length == SIZE_MAX) {
> +		/* Discard the dump */
> +		sahara_send_reset(context);
> +		return;
> +	}
> +	dump_length = size_add(dump_length, size_mul(sizeof(*image_out_table_entry), table_nents));
> +	if (dump_length == SIZE_MAX) {
> +		/* Discard the dump */
> +		sahara_send_reset(context);
> +		return;
> +	}
> +
> +	context->mem_dump_sz = dump_length;
> +	context->mem_dump = vzalloc(dump_length);
> +	if (!context->mem_dump) {
> +		/* Discard the dump */
> +		sahara_send_reset(context);
> +		return;
> +	}
> +
> +	/* Populate the dump metadata and table for userspace */
> +	dump_meta = context->mem_dump;
> +	dump_meta->magic = SAHARA_DUMP_V1_MAGIC;
> +	dump_meta->version = SAHARA_DUMP_V1_VER;
> +	dump_meta->dump_size = dump_length;
> +	dump_meta->table_size = context->dump_table_length;
> +
> +	image_out_table_entry = (struct sahara_dump_table_entry *)(context->mem_dump +
> +								sizeof(*dump_meta));

Isn't this cast unnecessary?

> +	dev_table_entry = (struct sahara_debug_table_entry64 *)(context->rx);
> +	for (i = 0; i < table_nents; ++i, ++image_out_table_entry, ++dev_table_entry) {
> +		image_out_table_entry->type = le64_to_cpu(dev_table_entry->type);
> +		image_out_table_entry->address = le64_to_cpu(dev_table_entry->address);
> +		image_out_table_entry->length = le64_to_cpu(dev_table_entry->length);
> +		strscpy(image_out_table_entry->description, dev_table_entry->description,
> +			SAHARA_TABLE_ENTRY_STR_LEN);
> +		strscpy(image_out_table_entry->filename,
> +			dev_table_entry->filename,
> +			SAHARA_TABLE_ENTRY_STR_LEN);
> +	}
> +
> +	context->mem_dump_freespace = image_out_table_entry;
> +
> +	/* Done parsing the table, switch to image dump mode */
> +	context->dump_table_length = 0;
> +
> +	/* Request the first chunk of the first image */
> +	context->dump_image = (struct sahara_dump_table_entry *)(context->mem_dump +
> +								sizeof(*dump_meta));

I would have preferred to see this (and above) written such that it's
explicitly clear that you're filling out an array of entries and then
point this to the first entry in that array.

> +	dump_length = context->dump_image->length > SAHARA_READ_MAX_SIZE ?
> +				SAHARA_READ_MAX_SIZE : context->dump_image->length;
> +	/* Avoid requesting EOI sized data so that we can identify errors */
> +	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
> +		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
> +
> +	context->dump_image_offset = dump_length;
> +
> +	context->tx[0]->cmd = cpu_to_le32(SAHARA_MEM_READ64_CMD);
> +	context->tx[0]->length = cpu_to_le32(SAHARA_MEM_READ64_LENGTH);
> +	context->tx[0]->memory_read64.memory_address = cpu_to_le64(context->dump_image->address);
> +	context->tx[0]->memory_read64.memory_length = cpu_to_le64(dump_length);
> +
> +	context->rx_size_requested = dump_length;
> +
> +	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
> +			    SAHARA_MEM_READ64_LENGTH, MHI_EOT);
> +	if (ret)
> +		dev_err(&context->mhi_dev->dev, "Unable to send read for dump content %d\n", ret);
> +}
> +
> +static void sahara_parse_dump_image(struct sahara_context *context)
> +{
> +	u64 dump_length;
> +	int ret;
> +
> +	memcpy(context->mem_dump_freespace, context->rx, context->rx_size);
> +	context->mem_dump_freespace += context->rx_size;
> +
> +	if (context->dump_image_offset >= context->dump_image->length) {
> +		/* Need to move to next image */
> +		context->dump_image++;
> +		context->dump_images_left--;
> +		context->dump_image_offset = 0;
> +
> +		if (!context->dump_images_left) {
> +			/* Dump done */
> +			dev_coredumpv(context->mhi_dev->mhi_cntrl->cntrl_dev,
> +				      context->mem_dump,
> +				      context->mem_dump_sz,
> +				      GFP_KERNEL);
> +			context->mem_dump = NULL;
> +			sahara_send_reset(context);
> +			return;
> +		}
> +	}
> +
> +	/* Get next image chunk */
> +	dump_length = context->dump_image->length - context->dump_image_offset;
> +	dump_length = dump_length > SAHARA_READ_MAX_SIZE ? SAHARA_READ_MAX_SIZE : dump_length;

This would be cleaner to write as:

	if (dump_length > SAHARA_READ_MAX_SIZE)
		dump_length = SAHARA_READ_MAX_SIZE;

Or make the line above min(..., SAHARA_READ_MAX_SIZE);

> +	/* Avoid requesting EOI sized data so that we can identify errors */
> +	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
> +		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
> +
> +	context->tx[0]->cmd = cpu_to_le32(SAHARA_MEM_READ64_CMD);
> +	context->tx[0]->length = cpu_to_le32(SAHARA_MEM_READ64_LENGTH);
> +	context->tx[0]->memory_read64.memory_address =
> +		cpu_to_le64(context->dump_image->address + context->dump_image_offset);
> +	context->tx[0]->memory_read64.memory_length = cpu_to_le64(dump_length);
> +
> +	context->dump_image_offset += dump_length;
> +	context->rx_size_requested = dump_length;
> +
> +	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
> +			    SAHARA_MEM_READ64_LENGTH, MHI_EOT);
> +	if (ret) {
> +		dev_err(&context->mhi_dev->dev,
> +			"Unable to send read for dump content %d\n", ret);
> +		return;

Unnecessary return statement...

Regards,
Bjorn

> +	}
> +}
> +
> +static void sahara_dump_processing(struct work_struct *work)
> +{
> +	struct sahara_context *context = container_of(work, struct sahara_context, dump_work);
> +	int ret;
> +
> +	/*
> +	 * We should get the expected raw data, but if the device has an error
> +	 * it is supposed to send EOI with an error code.
> +	 */
> +	if (context->rx_size != context->rx_size_requested &&
> +	    context->rx_size != SAHARA_END_OF_IMAGE_LENGTH) {
> +		dev_err(&context->mhi_dev->dev,
> +			"Unexpected response to read_data. Expected size: %#zx got: %#zx\n",
> +			context->rx_size_requested,
> +			context->rx_size);
> +		goto error;
> +	}
> +
> +	if (context->rx_size == SAHARA_END_OF_IMAGE_LENGTH &&
> +	    le32_to_cpu(context->rx->cmd) == SAHARA_END_OF_IMAGE_CMD) {
> +		dev_err(&context->mhi_dev->dev,
> +			"Unexpected EOI response to read_data. Status: %d\n",
> +			le32_to_cpu(context->rx->end_of_image.status));
> +		goto error;
> +	}
> +
> +	if (context->rx_size == SAHARA_END_OF_IMAGE_LENGTH &&
> +	    le32_to_cpu(context->rx->cmd) != SAHARA_END_OF_IMAGE_CMD) {
> +		dev_err(&context->mhi_dev->dev,
> +			"Invalid EOI response to read_data. CMD: %d\n",
> +			le32_to_cpu(context->rx->cmd));
> +		goto error;
> +	}
> +
> +	/*
> +	 * Need to know if we received the dump table, or part of a dump image.
> +	 * Since we get raw data, we cannot tell from the data itself. Instead,
> +	 * we use the stored dump_table_length, which we zero after we read and
> +	 * process the entire table.
> +	 */
> +	if (context->dump_table_length)
> +		sahara_parse_dump_table(context);
> +	else
> +		sahara_parse_dump_image(context);
> +
> +	ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE, context->rx,
> +			    SAHARA_PACKET_MAX_SIZE, MHI_EOT);
> +	if (ret)
> +		dev_err(&context->mhi_dev->dev, "Unable to requeue rx buf %d\n", ret);
> +
> +	return;
> +
> +error:
> +	vfree(context->mem_dump);
> +	context->mem_dump = NULL;
> +	sahara_send_reset(context);
> +}
> +
>  static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
>  {
>  	struct sahara_context *context;
> @@ -382,7 +752,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>  	}
>  
>  	context->mhi_dev = mhi_dev;
> -	INIT_WORK(&context->work, sahara_processing);
> +	INIT_WORK(&context->fw_work, sahara_processing);
> +	INIT_WORK(&context->dump_work, sahara_dump_processing);
>  	context->image_table = aic100_image_table;
>  	context->table_size = ARRAY_SIZE(aic100_image_table);
>  	context->active_image_id = SAHARA_IMAGE_ID_NONE;
> @@ -405,7 +776,10 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
>  {
>  	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
>  
> -	cancel_work_sync(&context->work);
> +	cancel_work_sync(&context->fw_work);
> +	cancel_work_sync(&context->dump_work);
> +	if (context->mem_dump)
> +		vfree(context->mem_dump);
>  	sahara_release_image(context);
>  	mhi_unprepare_from_transfer(mhi_dev);
>  }
> @@ -418,8 +792,14 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>  {
>  	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
>  
> -	if (!mhi_result->transaction_status)
> -		schedule_work(&context->work);
> +	if (!mhi_result->transaction_status) {
> +		context->rx_size = mhi_result->bytes_xferd;
> +		if (context->is_mem_dump_mode)
> +			schedule_work(&context->dump_work);
> +		else
> +			schedule_work(&context->fw_work);
> +	}
> +
>  }
>  
>  static const struct mhi_device_id sahara_mhi_match_table[] = {
> -- 
> 2.34.1
> 
