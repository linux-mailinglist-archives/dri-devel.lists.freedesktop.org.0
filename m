Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31D49B0D76
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 20:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7082110EB75;
	Fri, 25 Oct 2024 18:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lOaZ1KHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89FC10EB75
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 18:35:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB20U8000928;
 Fri, 25 Oct 2024 18:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/lKiWUZlsLheqJgcCsG1ldUm
 87CXLayfT3hVm2YA7EY=; b=lOaZ1KHNrvF1sknwgiBXDCy20ic4YN6f9doJY6eu
 cGNop0c+PePsJKid9XAc6EMtwavVbA5lDZ6sCIFfC8cMrHM9tuDvXGnRl0VXSvoV
 8HzIxeVGDUGGLXGas/BSW1l2+/Ov4U5tI+6VKBd+RxIlEXisEuMa89oXcZKKrDAA
 C6yQsUClEEmCTkTvhppVA1EajjFGgRhZ7cfOaRb1UKlhGnIUuF+ePuNuE6sks9fn
 elsAZySv4hWiAK7nd1Ic6LEC0O9fWsgyg64ZtgqZfQ1gqVnIgypRZ1IOKPIfrrCz
 QzJdz13hP7yAwWEVOg33Fah+7hMIHylYSSVxTtAkoMuW7A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga3s1bds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2024 18:35:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PIZ3Nq026734
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2024 18:35:03 GMT
Received: from [10.216.38.148] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 11:34:56 -0700
Content-Type: multipart/alternative;
 boundary="------------9AUj0HnLqocO72njyORnqRti"
Message-ID: <317ebfd2-a6ff-4f47-878f-a34851587884@quicinc.com>
Date: Sat, 26 Oct 2024 00:04:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Andi Shyti <andi.shyti@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
 <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
 <quic_vtanuku@quicinc.com>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-6-quic_jseerapu@quicinc.com>
 <d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: IUNIRY2TbpAhZZKX0xMzxALXAC7fBU0s
X-Proofpoint-GUID: IUNIRY2TbpAhZZKX0xMzxALXAC7fBU0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250142
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

--------------9AUj0HnLqocO72njyORnqRti
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 10/16/2024 8:36 PM, Andi Shyti wrote:
> Hi Jyothi,
>
> ...
>
>> @@ -523,26 +576,49 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	enum dma_transfer_direction dma_dirn;
>>   	struct dma_async_tx_descriptor *desc;
>>   	int ret;
>> +	struct gpi_multi_xfer *gi2c_gpi_xfer;
>> +	dma_cookie_t cookie;
>>   
>>   	peripheral = config->peripheral_config;
>> -
>> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
>> -	if (!dma_buf)
>> +	gi2c_gpi_xfer = &peripheral->multi_xfer;
>> +	gi2c_gpi_xfer->msg_idx_cnt = cur_msg_idx;
>> +	dma_buf = gi2c_gpi_xfer->dma_buf[gi2c_gpi_xfer->buf_idx];
>> +	addr = gi2c_gpi_xfer->dma_addr[gi2c_gpi_xfer->buf_idx];
>> +
>> +	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[gi2c_gpi_xfer->msg_idx_cnt], 1);
>> +	if (!dma_buf) {
>> +		gi2c->err = -ENOMEM;
>>   		return -ENOMEM;
>> +	}
>>   
>>   	if (op == I2C_WRITE)
>>   		map_dirn = DMA_TO_DEVICE;
>>   	else
>>   		map_dirn = DMA_FROM_DEVICE;
>>   
>> -	addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, map_dirn);
>> +	addr = dma_map_single(gi2c->se.dev->parent,
>> +			      dma_buf, msgs[gi2c_gpi_xfer->msg_idx_cnt].len,
> You could save msgs[gi2c_gpi_xfer->msg_idx_cnt] in a separate
> variable to avoid this extra indexing.

Thanks Andi, moved gi2c_gpi_xfer->msg_idx_cnt to separate local variable.

>
>> +			      map_dirn);
>>   	if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
>> -		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>> +		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[gi2c_gpi_xfer->msg_idx_cnt],
>> +					 false);
>> +		gi2c->err = -ENOMEM;
>>   		return -ENOMEM;
>>   	}
>>   
>> +	if (gi2c->is_tx_multi_xfer) {
>> +		if (((gi2c_gpi_xfer->msg_idx_cnt + 1) % NUM_MSGS_PER_IRQ))
>> +			peripheral->flags |= QCOM_GPI_BLOCK_EVENT_IRQ;
>> +		else
>> +			peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
>> +
>> +		/* BEI bit to be cleared for last TRE */
>> +		if (gi2c_gpi_xfer->msg_idx_cnt == gi2c->num_msgs - 1)
>> +			peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
>> +	}
>> +
>>   	/* set the length as message for rx txn */
>> -	peripheral->rx_len = msg->len;
>> +	peripheral->rx_len = msgs[gi2c_gpi_xfer->msg_idx_cnt].len;
>>   	peripheral->op = op;
>>   
>>   	ret = dmaengine_slave_config(dma_chan, config);
>> @@ -560,25 +636,56 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	else
>>   		dma_dirn = DMA_DEV_TO_MEM;
>>   
>> -	desc = dmaengine_prep_slave_single(dma_chan, addr, msg->len, dma_dirn, flags);
>> +	desc = dmaengine_prep_slave_single(dma_chan, addr,
>> +					   msgs[gi2c_gpi_xfer->msg_idx_cnt].len,
>> +					   dma_dirn, flags);
>>   	if (!desc) {
>>   		dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
>> -		ret = -EIO;
>> +		gi2c->err = -EIO;
>>   		goto err_config;
>>   	}
>>   
>>   	desc->callback_result = i2c_gpi_cb_result;
>>   	desc->callback_param = gi2c;
>>   
>> -	dmaengine_submit(desc);
>> -	*buf = dma_buf;
>> -	*dma_addr_p = addr;
>> +	if (!((msgs[cur_msg_idx].flags & I2C_M_RD) && op == I2C_WRITE)) {
>> +		gi2c_gpi_xfer->msg_idx_cnt++;
>> +		gi2c_gpi_xfer->buf_idx = (cur_msg_idx + 1) % QCOM_GPI_MAX_NUM_MSGS;
>> +	}
>> +	cookie = dmaengine_submit(desc);
>> +	if (dma_submit_error(cookie)) {
>> +		dev_err(gi2c->se.dev,
>> +			"%s: dmaengine_submit failed (%d)\n", __func__, cookie);
>> +		return -EINVAL;
> goto err_config?
yes, updated it.
>
>> +	}
>>   
>> +	if (gi2c->is_tx_multi_xfer) {
>> +		dma_async_issue_pending(gi2c->tx_c);
>> +		if ((cur_msg_idx == (gi2c->num_msgs - 1)) ||
>> +		    (gi2c_gpi_xfer->msg_idx_cnt >=
>> +		     QCOM_GPI_MAX_NUM_MSGS + gi2c_gpi_xfer->freed_msg_cnt)) {
>> +			ret = gpi_multi_desc_process(gi2c->se.dev, gi2c_gpi_xfer,
>> +						     gi2c->num_msgs, XFER_TIMEOUT,
>> +						     &gi2c->done);
>> +			if (ret) {
>> +				dev_dbg(gi2c->se.dev,
>> +					"I2C multi write msg transfer timeout: %d\n",
>> +					ret);
> if you are returning an error, then print an error.
sure, updated it to error in V2 patch.
>
>> +				gi2c->err = -ETIMEDOUT;
> gi2c->err = ret?
  In this case, ret is-ETIMEDOUT, so updated in V2 as gi2c->err = ret.
>
>> +				goto err_config;
>> +			}
>> +		}
>> +	} else {
>> +		/* Non multi descriptor message transfer */
>> +		*buf = dma_buf;
>> +		*dma_addr_p = addr;
>> +	}
>>   	return 0;
>>   
>>   err_config:
>> -	dma_unmap_single(gi2c->se.dev->parent, addr, msg->len, map_dirn);
>> -	i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>> +	dma_unmap_single(gi2c->se.dev->parent, addr,
>> +			 msgs[cur_msg_idx].len, map_dirn);
>> +	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[cur_msg_idx], false);
>>   	return ret;
> I would have one more label here:
>
>     out:
> 	gi2c->err = ret;
>
> 	return ret;
>
> in order to avoid always assigning twice
Thanks, added new label as out and handled it.
>
>>   }
>>   
>> @@ -590,6 +697,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   	unsigned long time_left;
>>   	dma_addr_t tx_addr, rx_addr;
>>   	void *tx_buf = NULL, *rx_buf = NULL;
>> +	struct gpi_multi_xfer *tx_multi_xfer;
>>   	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>>   
>>   	config.peripheral_config = &peripheral;
>> @@ -603,6 +711,39 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   	peripheral.set_config = 1;
>>   	peripheral.multi_msg = false;
>>   
>> +	gi2c->gpi_config = &peripheral;
>> +	gi2c->num_msgs = num;
>> +	gi2c->is_tx_multi_xfer = false;
>> +	gi2c->tx_irq_cnt = 0;
>> +
>> +	tx_multi_xfer = &peripheral.multi_xfer;
>> +	tx_multi_xfer->msg_idx_cnt = 0;
>> +	tx_multi_xfer->buf_idx = 0;
>> +	tx_multi_xfer->unmap_msg_cnt = 0;
>> +	tx_multi_xfer->freed_msg_cnt = 0;
>> +	tx_multi_xfer->irq_msg_cnt = 0;
>> +	tx_multi_xfer->irq_cnt = 0;
> you can initialize tx_multi_xfer to "{ };" to avoid all these
> " = 0"
Sure, memsettx_multi_xfer to 0 in V2 patch.
>
>> +
>> +	/*
>> +	 * If number of write messages are four and higher then
>> +	 * configure hardware for multi descriptor transfers with BEI.
>> +	 */
>> +	if (num >= MIN_NUM_OF_MSGS_MULTI_DESC) {
>> +		gi2c->is_tx_multi_xfer = true;
>> +		for (i = 0; i < num; i++) {
>> +			if (msgs[i].flags & I2C_M_RD) {
>> +				/*
>> +				 * Multi descriptor transfer with BEI
>> +				 * support is enabled for write transfers.
>> +				 * Add BEI optimization support for read
>> +				 * transfers later.
>> +				 */
>> +				gi2c->is_tx_multi_xfer = false;
>> +				break;
>> +			}
>> +		}
>> +	}
>> +
>>   	for (i = 0; i < num; i++) {
>>   		gi2c->cur = &msgs[i];
>>   		gi2c->err = 0;
>> @@ -613,14 +754,16 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   			peripheral.stretch = 1;
>>   
>>   		peripheral.addr = msgs[i].addr;
>> +		if (i > 0 && (!(msgs[i].flags & I2C_M_RD)))
>> +			peripheral.multi_msg = false;
>>   
>> -		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>> +		ret =  geni_i2c_gpi(gi2c, msgs, i, &config,
> what is the point of passing 'i' if you always refer to msgs[i]
> in geni_i2c_gpi()?

Handled with new variable in "geni_i2c_gpi "and so no need to pass 
current i2c msg index, removed it in V2 patch.

>
>>   				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
>>   		if (ret)
>>   			goto err;
>>   
>>   		if (msgs[i].flags & I2C_M_RD) {
>> -			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>> +			ret =  geni_i2c_gpi(gi2c, msgs, i, &config,
>>   					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
>>   			if (ret)
>>   				goto err;
>> @@ -628,18 +771,28 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   			dma_async_issue_pending(gi2c->rx_c);
>>   		}
>>   
>> -		dma_async_issue_pending(gi2c->tx_c);
>> -
>> -		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> -		if (!time_left)
>> -			gi2c->err = -ETIMEDOUT;
>> +		if (!gi2c->is_tx_multi_xfer) {
>> +			dma_async_issue_pending(gi2c->tx_c);
>> +			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> +			if (!time_left) {
>> +				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
>> +				gi2c->err = -ETIMEDOUT;
>> +			}
>> +		}
>>   
>>   		if (gi2c->err) {
>>   			ret = gi2c->err;
>>   			goto err;
>>   		}
>>   
>> -		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
>> +		if (!gi2c->is_tx_multi_xfer) {
>> +			geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
>> +		} else {
>> +			if (gi2c->tx_irq_cnt != tx_multi_xfer->irq_cnt) {
>     else if (...) {
>     	...
>     }

Sure, else if used here in V2 patch.


>
> Andi


Regards,

JyothiKumar

--------------9AUj0HnLqocO72njyORnqRti
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/16/2024 8:36 PM, Andi Shyti
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg">
      <pre class="moz-quote-pre" wrap="">Hi Jyothi,

...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -523,26 +576,49 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	enum dma_transfer_direction dma_dirn;
 	struct dma_async_tx_descriptor *desc;
 	int ret;
+	struct gpi_multi_xfer *gi2c_gpi_xfer;
+	dma_cookie_t cookie;
 
 	peripheral = config-&gt;peripheral_config;
-
-	dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
-	if (!dma_buf)
+	gi2c_gpi_xfer = &amp;peripheral-&gt;multi_xfer;
+	gi2c_gpi_xfer-&gt;msg_idx_cnt = cur_msg_idx;
+	dma_buf = gi2c_gpi_xfer-&gt;dma_buf[gi2c_gpi_xfer-&gt;buf_idx];
+	addr = gi2c_gpi_xfer-&gt;dma_addr[gi2c_gpi_xfer-&gt;buf_idx];
+
+	dma_buf = i2c_get_dma_safe_msg_buf(&amp;msgs[gi2c_gpi_xfer-&gt;msg_idx_cnt], 1);
+	if (!dma_buf) {
+		gi2c-&gt;err = -ENOMEM;
 		return -ENOMEM;
+	}
 
 	if (op == I2C_WRITE)
 		map_dirn = DMA_TO_DEVICE;
 	else
 		map_dirn = DMA_FROM_DEVICE;
 
-	addr = dma_map_single(gi2c-&gt;se.dev-&gt;parent, dma_buf, msg-&gt;len, map_dirn);
+	addr = dma_map_single(gi2c-&gt;se.dev-&gt;parent,
+			      dma_buf, msgs[gi2c_gpi_xfer-&gt;msg_idx_cnt].len,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You could save msgs[gi2c_gpi_xfer-&gt;msg_idx_cnt] in a separate
variable to avoid this extra indexing.</pre>
    </blockquote>
    <p>Thanks Andi, moved gi2c_gpi_xfer-&gt;msg_idx_cnt to separate
      local variable.<br>
    </p>
    <blockquote type="cite"
cite="mid:d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+			      map_dirn);
 	if (dma_mapping_error(gi2c-&gt;se.dev-&gt;parent, addr)) {
-		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
+		i2c_put_dma_safe_msg_buf(dma_buf, &amp;msgs[gi2c_gpi_xfer-&gt;msg_idx_cnt],
+					 false);
+		gi2c-&gt;err = -ENOMEM;
 		return -ENOMEM;
 	}
 
+	if (gi2c-&gt;is_tx_multi_xfer) {
+		if (((gi2c_gpi_xfer-&gt;msg_idx_cnt + 1) % NUM_MSGS_PER_IRQ))
+			peripheral-&gt;flags |= QCOM_GPI_BLOCK_EVENT_IRQ;
+		else
+			peripheral-&gt;flags &amp;= ~QCOM_GPI_BLOCK_EVENT_IRQ;
+
+		/* BEI bit to be cleared for last TRE */
+		if (gi2c_gpi_xfer-&gt;msg_idx_cnt == gi2c-&gt;num_msgs - 1)
+			peripheral-&gt;flags &amp;= ~QCOM_GPI_BLOCK_EVENT_IRQ;
+	}
+
 	/* set the length as message for rx txn */
-	peripheral-&gt;rx_len = msg-&gt;len;
+	peripheral-&gt;rx_len = msgs[gi2c_gpi_xfer-&gt;msg_idx_cnt].len;
 	peripheral-&gt;op = op;
 
 	ret = dmaengine_slave_config(dma_chan, config);
@@ -560,25 +636,56 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	else
 		dma_dirn = DMA_DEV_TO_MEM;
 
-	desc = dmaengine_prep_slave_single(dma_chan, addr, msg-&gt;len, dma_dirn, flags);
+	desc = dmaengine_prep_slave_single(dma_chan, addr,
+					   msgs[gi2c_gpi_xfer-&gt;msg_idx_cnt].len,
+					   dma_dirn, flags);
 	if (!desc) {
 		dev_err(gi2c-&gt;se.dev, "prep_slave_sg failed\n");
-		ret = -EIO;
+		gi2c-&gt;err = -EIO;
 		goto err_config;
 	}
 
 	desc-&gt;callback_result = i2c_gpi_cb_result;
 	desc-&gt;callback_param = gi2c;
 
-	dmaengine_submit(desc);
-	*buf = dma_buf;
-	*dma_addr_p = addr;
+	if (!((msgs[cur_msg_idx].flags &amp; I2C_M_RD) &amp;&amp; op == I2C_WRITE)) {
+		gi2c_gpi_xfer-&gt;msg_idx_cnt++;
+		gi2c_gpi_xfer-&gt;buf_idx = (cur_msg_idx + 1) % QCOM_GPI_MAX_NUM_MSGS;
+	}
+	cookie = dmaengine_submit(desc);
+	if (dma_submit_error(cookie)) {
+		dev_err(gi2c-&gt;se.dev,
+			"%s: dmaengine_submit failed (%d)\n", __func__, cookie);
+		return -EINVAL;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
goto err_config?</pre>
    </blockquote>
    yes, updated it. <br>
    <blockquote type="cite"
cite="mid:d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	}
 
+	if (gi2c-&gt;is_tx_multi_xfer) {
+		dma_async_issue_pending(gi2c-&gt;tx_c);
+		if ((cur_msg_idx == (gi2c-&gt;num_msgs - 1)) ||
+		    (gi2c_gpi_xfer-&gt;msg_idx_cnt &gt;=
+		     QCOM_GPI_MAX_NUM_MSGS + gi2c_gpi_xfer-&gt;freed_msg_cnt)) {
+			ret = gpi_multi_desc_process(gi2c-&gt;se.dev, gi2c_gpi_xfer,
+						     gi2c-&gt;num_msgs, XFER_TIMEOUT,
+						     &amp;gi2c-&gt;done);
+			if (ret) {
+				dev_dbg(gi2c-&gt;se.dev,
+					"I2C multi write msg transfer timeout: %d\n",
+					ret);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
if you are returning an error, then print an error.</pre>
    </blockquote>
    sure, updated it to error in V2 patch. <br>
    <blockquote type="cite"
cite="mid:d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+				gi2c-&gt;err = -ETIMEDOUT;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
gi2c-&gt;err = ret?</pre>
    </blockquote>
     In this case, ret is<span style="white-space: pre-wrap"> -ETIMEDOUT, so updated in V2 as </span><span
    style="white-space: pre-wrap">gi2c-&gt;err = ret.</span>
    <blockquote type="cite"
cite="mid:d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+				goto err_config;
+			}
+		}
+	} else {
+		/* Non multi descriptor message transfer */
+		*buf = dma_buf;
+		*dma_addr_p = addr;
+	}
 	return 0;
 
 err_config:
-	dma_unmap_single(gi2c-&gt;se.dev-&gt;parent, addr, msg-&gt;len, map_dirn);
-	i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
+	dma_unmap_single(gi2c-&gt;se.dev-&gt;parent, addr,
+			 msgs[cur_msg_idx].len, map_dirn);
+	i2c_put_dma_safe_msg_buf(dma_buf, &amp;msgs[cur_msg_idx], false);
 	return ret;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I would have one more label here:

   out:
	gi2c-&gt;err = ret;

	return ret;

in order to avoid always assigning twice</pre>
    </blockquote>
    Thanks, added new label as out and handled it.<br>
    <blockquote type="cite"
cite="mid:d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> }
 
@@ -590,6 +697,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	unsigned long time_left;
 	dma_addr_t tx_addr, rx_addr;
 	void *tx_buf = NULL, *rx_buf = NULL;
+	struct gpi_multi_xfer *tx_multi_xfer;
 	const struct geni_i2c_clk_fld *itr = gi2c-&gt;clk_fld;
 
 	config.peripheral_config = &amp;peripheral;
@@ -603,6 +711,39 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	peripheral.set_config = 1;
 	peripheral.multi_msg = false;
 
+	gi2c-&gt;gpi_config = &amp;peripheral;
+	gi2c-&gt;num_msgs = num;
+	gi2c-&gt;is_tx_multi_xfer = false;
+	gi2c-&gt;tx_irq_cnt = 0;
+
+	tx_multi_xfer = &amp;peripheral.multi_xfer;
+	tx_multi_xfer-&gt;msg_idx_cnt = 0;
+	tx_multi_xfer-&gt;buf_idx = 0;
+	tx_multi_xfer-&gt;unmap_msg_cnt = 0;
+	tx_multi_xfer-&gt;freed_msg_cnt = 0;
+	tx_multi_xfer-&gt;irq_msg_cnt = 0;
+	tx_multi_xfer-&gt;irq_cnt = 0;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
you can initialize tx_multi_xfer to "{ };" to avoid all these
" = 0"</pre>
    </blockquote>
    Sure, memset<span style="white-space: pre-wrap"> tx_multi_xfer to</span>
    0 in V2 patch.<br>
    <blockquote type="cite"
cite="mid:d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+	/*
+	 * If number of write messages are four and higher then
+	 * configure hardware for multi descriptor transfers with BEI.
+	 */
+	if (num &gt;= MIN_NUM_OF_MSGS_MULTI_DESC) {
+		gi2c-&gt;is_tx_multi_xfer = true;
+		for (i = 0; i &lt; num; i++) {
+			if (msgs[i].flags &amp; I2C_M_RD) {
+				/*
+				 * Multi descriptor transfer with BEI
+				 * support is enabled for write transfers.
+				 * Add BEI optimization support for read
+				 * transfers later.
+				 */
+				gi2c-&gt;is_tx_multi_xfer = false;
+				break;
+			}
+		}
+	}
+
 	for (i = 0; i &lt; num; i++) {
 		gi2c-&gt;cur = &amp;msgs[i];
 		gi2c-&gt;err = 0;
@@ -613,14 +754,16 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 			peripheral.stretch = 1;
 
 		peripheral.addr = msgs[i].addr;
+		if (i &gt; 0 &amp;&amp; (!(msgs[i].flags &amp; I2C_M_RD)))
+			peripheral.multi_msg = false;
 
-		ret =  geni_i2c_gpi(gi2c, &amp;msgs[i], &amp;config,
+		ret =  geni_i2c_gpi(gi2c, msgs, i, &amp;config,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
what is the point of passing 'i' if you always refer to msgs[i]
in geni_i2c_gpi()?</pre>
    </blockquote>
    <p>Handled with new variable in <span style="white-space: pre-wrap">"geni_i2c_gpi "and so n</span>o
      need to pass current i2c msg index, removed it in V2 patch.<br>
    </p>
    <blockquote type="cite"
cite="mid:d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 				    &amp;tx_addr, &amp;tx_buf, I2C_WRITE, gi2c-&gt;tx_c);
 		if (ret)
 			goto err;
 
 		if (msgs[i].flags &amp; I2C_M_RD) {
-			ret =  geni_i2c_gpi(gi2c, &amp;msgs[i], &amp;config,
+			ret =  geni_i2c_gpi(gi2c, msgs, i, &amp;config,
 					    &amp;rx_addr, &amp;rx_buf, I2C_READ, gi2c-&gt;rx_c);
 			if (ret)
 				goto err;
@@ -628,18 +771,28 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 			dma_async_issue_pending(gi2c-&gt;rx_c);
 		}
 
-		dma_async_issue_pending(gi2c-&gt;tx_c);
-
-		time_left = wait_for_completion_timeout(&amp;gi2c-&gt;done, XFER_TIMEOUT);
-		if (!time_left)
-			gi2c-&gt;err = -ETIMEDOUT;
+		if (!gi2c-&gt;is_tx_multi_xfer) {
+			dma_async_issue_pending(gi2c-&gt;tx_c);
+			time_left = wait_for_completion_timeout(&amp;gi2c-&gt;done, XFER_TIMEOUT);
+			if (!time_left) {
+				dev_err(gi2c-&gt;se.dev, "%s:I2C timeout\n", __func__);
+				gi2c-&gt;err = -ETIMEDOUT;
+			}
+		}
 
 		if (gi2c-&gt;err) {
 			ret = gi2c-&gt;err;
 			goto err;
 		}
 
-		geni_i2c_gpi_unmap(gi2c, &amp;msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
+		if (!gi2c-&gt;is_tx_multi_xfer) {
+			geni_i2c_gpi_unmap(gi2c, &amp;msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
+		} else {
+			if (gi2c-&gt;tx_irq_cnt != tx_multi_xfer-&gt;irq_cnt) {
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
   else if (...) {
   	...
   }</pre>
    </blockquote>
    <p>Sure, else if used here in V2 patch.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg">
      <pre class="moz-quote-pre" wrap="">

Andi</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>JyothiKumar<br>
    </p>
    <blockquote type="cite"
cite="mid:d2kffhvai5syxolobrk4g27w3f35p7v5azdy4tyvryfqnd4ohz@jxfgsubojysg">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9AUj0HnLqocO72njyORnqRti--
