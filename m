Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A50EA18753
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 22:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9205210E2E1;
	Tue, 21 Jan 2025 21:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Ke0On/em";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436B810E2E1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 21:32:22 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250121213220euoutp01762d604468a6233ef5d470a590cb3b97~c0p-7ocBz1817118171euoutp01e
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 21:32:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250121213220euoutp01762d604468a6233ef5d470a590cb3b97~c0p-7ocBz1817118171euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737495140;
 bh=c3gAb8ea9ef4gHJ7alF6cTGKf4GwryqiRQVpzReem/Y=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Ke0On/em4eYl7htCPKWMSQ6GDEBgBbmN3oC5n9RGaD1WPqztfjbb/Qq8v57yJrHLY
 E/v9xck2+ulCpa4ScSP16fkHfUfPE9qgNiA7CYDV8f6Nby0P40LXvd0YrniWgxPKo7
 OZ3TVwX4OzzVUEsbyb9lIhuPmpu/OIDDM4gHw43Y=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250121213220eucas1p232450e39546e5155c29df727d606fc32~c0p-VvOh_1913919139eucas1p2a;
 Tue, 21 Jan 2025 21:32:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 55.82.20397.46210976; Tue, 21
 Jan 2025 21:32:20 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250121213219eucas1p206de4cbc36b9f3b6dba52aed30276f75~c0p_r08om1913919139eucas1p2Z;
 Tue, 21 Jan 2025 21:32:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250121213219eusmtrp1f395cf4156f33b9f9534340659c1bffe~c0p_qmduS1267912679eusmtrp1A;
 Tue, 21 Jan 2025 21:32:19 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-e4-679012649e61
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id EC.34.19654.36210976; Tue, 21
 Jan 2025 21:32:19 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250121213218eusmtip1bbd87e451dd52b93a2e86d773db67bf8~c0p9YEMSm2837128371eusmtip1U;
 Tue, 21 Jan 2025 21:32:18 +0000 (GMT)
Message-ID: <d56a32a5-ef74-45de-95ac-b38b137dda4f@samsung.com>
Date: Tue, 21 Jan 2025 22:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 04/18] firmware: thead: Add AON firmware protocol driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250121-small-ruby-seahorse-7475d0@krzk-bin>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGd+69vffSWL0tGk4sgawZJiwDBRmeDSMzk3izRDe3ZWbjD9bJ
 pTD5MC0ocxNhYOWjTATR0SlgwwTJAKvlc9COwigCAhOh6KDAxoywdojAmCgy24sb//3O8z5v
 zvOcHBqXmMjNdEx8IqeMl8fKSCFR1/G4zy9SkqfYVlYtQJ1WHYZqn2gp9ENLL4ZK2nsFyHbb
 gKE7CzMkqv6jn0IPWtIINFRxiULpHTUkmtLaSNTXd41CsxqbAA00XSTRXG47QHVzGSSqah+l
 0OXZWgKVNTQBpM66IkC/dIWhUVsngaYGNDhSazegleYGCj0b0hPou79MFDLYzwqQpeogyjCd
 I97yYmeGT1GsfWqKYNsy5ym25e9Sgm3UjlKsprEHsNcrs0h2ZKiZZItvHmDHciwYe6PsJJtR
 1YGxZ5a3sTPGQZL9xlAJ2NvpVuo9ySfCnZFcbMxRTrl116fC6Lb7RuqI+uXkFf1TQSrQSrOB
 Gw2ZINh966EgGwhpCVMBYK9xGecP8wAWnF0gnC4JMwfg15NeLzZOP51d1csBXMhl+AUHgFXz
 zVQ2oGkRswuOjCc7kWB8oLEzxGkXMWJ4s2jStbqJ8YZj976lnOzOvAurcwYFTt7I+ELr8qIr
 EM40C+D5c9dcA5zxgPcmSzAnk0wgHC8vceluTAi0Ft+neI83rHdcdBWAzKAQdi4NUXzoPXDC
 MU3y7A6nLYZV3RN2F2gInhPgeO0jnOevYKPGssohcKR3iXSWwZ+nq2naysu7oT7f7pIhsx4O
 O8R8hPUwv+4CzssimKmW8O4tsFCT+9+lvRV1WB6Qade8inZNSe2aMtr/7y0FRCXw4JJUcQpO
 tT2eO+avksepkuIV/ocS4q6D53+8+5lloQFUTM/6mwFGAzOANC7bKNr0UKOQiCLlXxznlAkR
 yqRYTmUGUpqQeYh0plMKCaOQJ3KHOe4Ip3wxxWi3zamY4SPKWFR/p4s7UTNcNzEvch9YXDmT
 J3vjgmV3rJufX64+yL4cGhX8tiPGcrDlV++XzoempvtaDu3M//jH0mE65onwyt2fP/ARZnYU
 egUvteUUm80xoX+SKQEoKDzNevTy2FXvjIj9Oa3CLb+/CVWN5Sn1/+yTuPm2i4eiHv2W1yXa
 aw8LSPfP+olWvm/8LAd/J/jY5IaTBZG6nsXtrXeXemx5YREL+Mj3hx1X5clYYH/RrVbdhGFl
 b0G0cp25acfAqHhf943CmUQT+bq0IstSuOdLO+W37vgOnxMtnjqxp//npjRpeKDekLKifhyh
 7FCJ+k9rw1958KF05rVAwyKt8YqSEapoecCruFIl/xfaGEQTUgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsVy+t/xu7rJQhPSDc59F7M4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWZw/v4Hd
 4mPPPVaLy7vmsFl87j3CaLHtcwubxdojd9ktFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CXcfjZPvaCNsWK/xv/sDYwzpLuYuTkkBAwkWj/85Gli5GLQ0hgKaPEtnPv
 WCESMhLXul+yQNjCEn+udbFBFL1mlLgy+ztQEQcHr4CdxJ0HFSAmi4CqxL4T1iDlvAKCEidn
 PgFrFRWQl7h/awY7iC0s4Cux5Np+JhBbREBT4vpfkClcHMwCe1glDm/+DDX/F6PEo0XnwDqY
 BcQlbj2ZD9bBJmAk8WD5fLDjOAWsJa7Pe8YOsphZQF1i/TwhiHJ5ie1v5zBPYBSaheSOWUgm
 zULomIWkYwEjyypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzA1LXt2M8tOxhXvvqod4iRiYPx
 EKMEB7OSCK/oh550Id6UxMqq1KL8+KLSnNTiQ4ymwKCYyCwlmpwPTJ55JfGGZgamhiZmlgam
 lmbGSuK8bFfOpwkJpCeWpGanphakFsH0MXFwSjUwubtPntantWLutdRigaUd1f98tm3L53VK
 /sD0/UP1TFH7RK1lE+Zvrp2jtokhmWFP9ulgO82lCupLt0480nZRmWdX5pINnytXv7n9pX0v
 Q9o/thcbboj09TDm7RGz9vPdaRHt/iOQsTXB+JQAf9H9a6EMKVrrOJ6GXWV7a5wVfXEzz2Kl
 y4/bDW2bqwOOLv7aXvD6YSvv9373/2fPlFh83vdCQz/3wDJnQ2MnhlqxO5GTs3KN3zr/VmXk
 dvBeKb9r/6oTjSucixLfZPgfDtPris1WY1z43+h4bSxLWviaDNe1M5Zffcy1wqf78pUl/Csu
 RTLWFSdtiU55cZ7hgXdH7w2LUOnrTs9rLgdVCnUosRRnJBpqMRcVJwIAfD46uOYDAAA=
X-CMS-MailID: 20250121213219eucas1p206de4cbc36b9f3b6dba52aed30276f75
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172124eucas1p233b3f6da39e7064db62b02a66bc1ac29
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172124eucas1p233b3f6da39e7064db62b02a66bc1ac29
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172124eucas1p233b3f6da39e7064db62b02a66bc1ac29@eucas1p2.samsung.com>
 <20250120172111.3492708-5-m.wilczynski@samsung.com>
 <20250121-small-ruby-seahorse-7475d0@krzk-bin>
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



On 1/21/25 10:56, Krzysztof Kozlowski wrote:
> On Mon, Jan 20, 2025 at 06:20:57PM +0100, Michal Wilczynski wrote:
>> +#include <linux/firmware/thead/thead,th1520-aon.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/mailbox_controller.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include <dt-bindings/firmware/thead,th1520-aon.h>
> 
> How/where do you use this header?

Indeed, it's used by the power-domain driver, so it's not needed here.

> 
>> +
>> +#define MAX_RX_TIMEOUT (msecs_to_jiffies(3000))
>> +#define MAX_TX_TIMEOUT 500
>> +
>> +struct th1520_aon_chan {
>> +	struct platform_device *pd;
>> +	struct mbox_chan *ch;
>> +	struct th1520_aon_rpc_ack_common ack_msg;
>> +	struct mbox_client cl;
>> +	struct completion done;
>> +
>> +	/* make sure only one RPC is perfomed at a time */
>> +	struct mutex transaction_lock;
>> +};
>> +
> 
> ...
> 
>> +static int th1520_aon_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct th1520_aon_chan *aon_chan;
>> +	struct mbox_client *cl;
>> +	int ret;
>> +	struct platform_device_info pdevinfo = {
>> +		.name = "th1520-pd",
>> +		.id = PLATFORM_DEVID_AUTO,
>> +		.parent = dev,
>> +	};
>> +
>> +	aon_chan = devm_kzalloc(dev, sizeof(*aon_chan), GFP_KERNEL);
>> +	if (!aon_chan)
>> +		return -ENOMEM;
>> +
>> +	cl = &aon_chan->cl;
>> +	cl->dev = dev;
>> +	cl->tx_block = true;
>> +	cl->tx_tout = MAX_TX_TIMEOUT;
>> +	cl->rx_callback = th1520_aon_rx_callback;
>> +
>> +	aon_chan->ch = mbox_request_channel_byname(cl, "aon");
>> +	if (IS_ERR(aon_chan->ch)) {
>> +		ret = PTR_ERR(aon_chan->ch);
> 
> Drop, pointless. The entire point of using dev_err_probe is to make it
> simple.
> 
>> +		return dev_err_probe(dev, ret, "Failed to request aon mbox chan\n");
>> +	}
>> +
>> +	mutex_init(&aon_chan->transaction_lock);
>> +	init_completion(&aon_chan->done);
>> +
>> +	platform_set_drvdata(pdev, aon_chan);
>> +
>> +	aon_chan->pd = platform_device_register_full(&pdevinfo);
>> +	ret = PTR_ERR_OR_ZERO(aon_chan->pd);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to register child device 'th1520-pd': %d\n", ret);
>> +		goto free_mbox_chan;
>> +	}
>> +
>> +	ret = devm_of_platform_populate(dev);
>> +	if (ret)
>> +		goto unregister_pd;
>> +
>> +	return 0;
>> +
>> +unregister_pd:
>> +	platform_device_unregister(aon_chan->pd);
>> +free_mbox_chan:
>> +	mbox_free_channel(aon_chan->ch);
>> +
>> +	return ret;
>> +}
>> +
>> +static void th1520_aon_remove(struct platform_device *pdev)
>> +{
>> +	struct th1520_aon_chan *aon_chan = platform_get_drvdata(pdev);
>> +
>> +	platform_device_unregister(aon_chan->pd);
>> +	mbox_free_channel(aon_chan->ch);
>> +}
>> +
>> +static const struct of_device_id th1520_aon_match[] = {
>> +	{ .compatible = "thead,th1520-aon" },
>> +	{ /* Sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, th1520_aon_match);
>> +
>> +static struct platform_driver th1520_aon_driver = {
>> +	.driver = {
>> +		.name = "th1520-aon",
>> +		.of_match_table = th1520_aon_match,
>> +	},
>> +	.probe = th1520_aon_probe,
>> +	.remove = th1520_aon_remove,
>> +};
>> +module_platform_driver(th1520_aon_driver);
>> +
>> +MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
>> +MODULE_DESCRIPTION("T-HEAD TH1520 Always-On firmware driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/linux/firmware/thead/thead,th1520-aon.h b/include/linux/firmware/thead/thead,th1520-aon.h
>> new file mode 100644
>> index 000000000000..3daa17c01d17
>> --- /dev/null
>> +++ b/include/linux/firmware/thead/thead,th1520-aon.h
>> @@ -0,0 +1,186 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2021 Alibaba Group Holding Limited.
>> + */
>> +
>> +#ifndef _THEAD_AON_H
>> +#define _THEAD_AON_H
>> +
>> +#include <linux/device.h>
>> +#include <linux/types.h>
>> +
>> +#define AON_RPC_MSG_MAGIC (0xef)
>> +#define TH1520_AON_RPC_VERSION 2
>> +#define TH1520_AON_RPC_MSG_NUM 7
>> +
>> +extern struct th1520_aon_chan *aon_chan;
> 
> Drop all externs.
> 
> 
> Best regards,
> Krzysztof
> 
> 
