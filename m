Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E949596169
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 19:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127B011344F;
	Tue, 16 Aug 2022 17:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96D211375B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 17:47:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GGY0vu024985;
 Tue, 16 Aug 2022 17:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/Wuc0B6y4vX6bDn7I6gIO/zcUN12rv4sZHwiSegwac4=;
 b=PiZPT3jG+GzLY4LSUhPzs7uXojnWmfe6EQ5g1IcJeKmkdVShVYOOhdPWx9ugEBKPAxYC
 50hq2FGFQ0uoRfJ/Z+yZsddr92tOFht/MFJsZLSZE4s92qOTHzQoK6UKwr+BBJ6oh8RI
 bLYZhDAKPFsV7qCxIUVXYMB4WLtNzwvUVCDUcatpqLq2D9wsGLCXGVj1XT/yuFHYY28r
 wkDfTeWm0qsgE+VD4/q4/o4DvcTZFCZdqvJLpKr8XkG/XDF+fa3RZ108flrTJJRg0JDl
 ZmtfwHUEYebWxPM8yujWx1HYFKBTQueWYK07d7P0+BEV+eoQBgdB2gqpaMKWFlSKhTWT Qg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j0ev4r9ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 17:47:06 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27GHl5pf028694
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 17:47:05 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 16 Aug 2022 10:47:04 -0700
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 16 Aug
 2022 10:47:03 -0700
Message-ID: <e9786447-edd4-90e0-25a9-b35e96adbfc2@quicinc.com>
Date: Tue, 16 Aug 2022 11:47:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH 02/14] drm/qaic: Add uapi and core driver file
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <airlied@linux.ie>, 
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
References: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
 <1660588956-24027-3-git-send-email-quic_jhugo@quicinc.com>
 <10ad6023-703d-65cf-6b00-2caa658c49e9@linaro.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <10ad6023-703d-65cf-6b00-2caa658c49e9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: uJQvdK3hAEWX0PwIUNU6pEb8JebSdL7v
X-Proofpoint-ORIG-GUID: uJQvdK3hAEWX0PwIUNU6pEb8JebSdL7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208160066
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/16/2022 5:06 AM, Krzysztof Kozlowski wrote:
> On 15/08/2022 21:42, Jeffrey Hugo wrote:
>> Add the QAIC driver uapi file and core driver file that binds to the PCIe
>> device.  The core driver file also creates the drm device and manages all
>> the interconnections between the different parts of the driver.
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> 
>>
>> Change-Id: I28854e8a5dacda217439be2f65a4ab67d4dccd1e
> 
> This has to go...
> 

Yep, made this mistake in the entire series.  I have a note to do better 
next time.  It won't be necessary to continue pointing this out for the 
rest of the series.

Since this is RFC and not expected to be merged anyways, I'm hoping it's 
not necessary to respin just to enable further reviews.

> 
>> +static int qaic_pci_probe(struct pci_dev *pdev,
>> +			  const struct pci_device_id *id)
>> +{
>> +	int ret;
>> +	int i;
>> +	int mhi_irq;
>> +	struct qaic_device *qdev;
>> +
>> +	qdev = kzalloc(sizeof(*qdev), GFP_KERNEL);
>> +	if (!qdev) {
> 
> return -ENOMEM;

So, no centralized exit per the coding style?  Ok.

> 
>> +		ret = -ENOMEM;
>> +		goto qdev_fail;
>> +	}
>> +
>> +	if (id->device == PCI_DEV_AIC100) {
>> +		qdev->num_dbc = 16;
>> +		qdev->dbc = kcalloc(qdev->num_dbc, sizeof(*qdev->dbc),
>> +				    GFP_KERNEL);
> 
> Why not devm?

We were having issues with devm and the PCI stuff.  Looking at this 
again, I think we can apply that here.

> 
>> +		if (!qdev->dbc) {
>> +			ret = -ENOMEM;
>> +			goto device_id_fail;
>> +		}
>> +	} else {
>> +		pci_dbg(pdev, "%s: No matching device found for device id %d\n",
>> +			__func__, id->device);
> 
> How this can happen?

Badly functioning hardware.  That hardware has been removed from 
circulation.  Given that this is an init path and not performance 
critical, having this handle the scenario in a sane way instead of 
having the driver blow up in a weird way much later on makes me feel better.

> 
>> +		ret = -EINVAL;
>> +		goto device_id_fail;
>> +	}
>> +
>> +	qdev->cntl_wq = alloc_workqueue("qaic_cntl", WQ_UNBOUND, 0);
>> +	if (!qdev->cntl_wq) {
>> +		ret = -ENOMEM;
>> +		goto wq_fail;
>> +	}
>> +	qdev->tele_wq = alloc_workqueue("qaic_tele", WQ_UNBOUND, 0);
>> +	if (!qdev->tele_wq) {
>> +		ret = -ENOMEM;
>> +		goto tele_wq_fail;
>> +	}
>> +	qdev->ssr_wq = alloc_workqueue("qaic_ssr", WQ_UNBOUND, 0);
>> +	if (!qdev->ssr_wq) {
>> +		ret = -ENOMEM;
>> +		goto ssr_wq_fail;
>> +	}
>> +	pci_set_drvdata(pdev, qdev);
>> +	qdev->pdev = pdev;
>> +	mutex_init(&qdev->cntl_mutex);
>> +	INIT_LIST_HEAD(&qdev->cntl_xfer_list);
>> +	init_srcu_struct(&qdev->dev_lock);
>> +	mutex_init(&qdev->tele_mutex);
>> +	INIT_LIST_HEAD(&qdev->tele_xfer_list);
>> +	INIT_LIST_HEAD(&qdev->bootlog);
>> +	mutex_init(&qdev->bootlog_mutex);
>> +	INIT_LIST_HEAD(&qdev->qaic_drm_devices);
>> +	mutex_init(&qdev->qaic_drm_devices_mutex);
>> +	for (i = 0; i < qdev->num_dbc; ++i) {
>> +		mutex_init(&qdev->dbc[i].handle_lock);
>> +		spin_lock_init(&qdev->dbc[i].xfer_lock);
>> +		idr_init(&qdev->dbc[i].buf_handles);
>> +		qdev->dbc[i].qdev = qdev;
>> +		qdev->dbc[i].id = i;
>> +		INIT_LIST_HEAD(&qdev->dbc[i].xfer_list);
>> +		init_srcu_struct(&qdev->dbc[i].ch_lock);
>> +		init_waitqueue_head(&qdev->dbc[i].dbc_release);
>> +		INIT_LIST_HEAD(&qdev->dbc[i].bo_lists);
>> +	}
>> +
>> +	qdev->bars = pci_select_bars(pdev, IORESOURCE_MEM);
>> +
>> +	/* make sure the device has the expected BARs */
>> +	if (qdev->bars != (BIT(0) | BIT(2) | BIT(4))) {
>> +		pci_dbg(pdev, "%s: expected BARs 0, 2, and 4 not found in device.  Found 0x%x\n",
>> +			__func__, qdev->bars);
>> +		ret = -EINVAL;
>> +		goto bar_fail;
>> +	}
>> +
>> +	ret = pci_enable_device(pdev);
>> +	if (ret)
>> +		goto enable_fail;
>> +
>> +	ret = pci_request_selected_regions(pdev, qdev->bars, "aic100");
>> +	if (ret)
>> +		goto request_regions_fail;
>> +
>> +	pci_set_master(pdev);
>> +
>> +	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
>> +	if (ret)
>> +		goto dma_mask_fail;
>> +	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(64));
>> +	if (ret)
>> +		goto dma_mask_fail;
>> +	ret = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
>> +	if (ret)
>> +		goto dma_mask_fail;
>> +
>> +	qdev->bar_0 = pci_ioremap_bar(pdev, 0);
>> +	if (!qdev->bar_0) {
>> +		ret = -ENOMEM;
>> +		goto ioremap_0_fail;
>> +	}
>> +
>> +	qdev->bar_2 = pci_ioremap_bar(pdev, 2);
>> +	if (!qdev->bar_2) {
>> +		ret = -ENOMEM;
>> +		goto ioremap_2_fail;
>> +	}
>> +
>> +	for (i = 0; i < qdev->num_dbc; ++i)
>> +		qdev->dbc[i].dbc_base = qdev->bar_2 + QAIC_DBC_OFF(i);
>> +
>> +	ret = pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
>> +	if (ret < 0)
>> +		goto alloc_irq_fail;
>> +
>> +	if (ret < 32) {
>> +		pci_err(pdev, "%s: Requested 32 MSIs.  Obtained %d MSIs which is less than the 32 required.\n",
>> +			__func__, ret);
>> +		ret = -ENODEV;
>> +		goto invalid_msi_config;
>> +	}
>> +
>> +	mhi_irq = pci_irq_vector(pdev, 0);
>> +	if (mhi_irq < 0) {
>> +		ret = mhi_irq;
>> +		goto get_mhi_irq_fail;
>> +	}
>> +
>> +	for (i = 0; i < qdev->num_dbc; ++i) {
>> +		ret = devm_request_threaded_irq(&pdev->dev,
>> +						pci_irq_vector(pdev, i + 1),
>> +						dbc_irq_handler,
>> +						dbc_irq_threaded_fn,
>> +						IRQF_SHARED,
>> +						"qaic_dbc",
>> +						&qdev->dbc[i]);
>> +		if (ret)
>> +			goto get_dbc_irq_failed;
>> +
>> +		if (poll_datapath) {
>> +			qdev->dbc[i].irq = pci_irq_vector(pdev, i + 1);
>> +			disable_irq_nosync(qdev->dbc[i].irq);
>> +			INIT_WORK(&qdev->dbc[i].poll_work, irq_polling_work);
>> +		}
>> +	}
>> +
>> +	qdev->mhi_cntl = qaic_mhi_register_controller(pdev, qdev->bar_0, mhi_irq);
>> +	if (IS_ERR(qdev->mhi_cntl)) {
>> +		ret = PTR_ERR(qdev->mhi_cntl);
>> +		goto mhi_register_fail;
>> +	}
>> +
>> +	return 0;
>> +
>> +mhi_register_fail:
>> +get_dbc_irq_failed:
>> +	for (i = 0; i < qdev->num_dbc; ++i)
>> +		devm_free_irq(&pdev->dev, pci_irq_vector(pdev, i + 1),
>> +			      &qdev->dbc[i]);
>> +get_mhi_irq_fail:
>> +invalid_msi_config:
>> +	pci_free_irq_vectors(pdev);
>> +alloc_irq_fail:
>> +	iounmap(qdev->bar_2);
>> +ioremap_2_fail:
>> +	iounmap(qdev->bar_0);
>> +ioremap_0_fail:
>> +dma_mask_fail:
>> +	pci_clear_master(pdev);
>> +	pci_release_selected_regions(pdev, qdev->bars);
>> +request_regions_fail:
>> +	pci_disable_device(pdev);
>> +enable_fail:
>> +	pci_set_drvdata(pdev, NULL);
>> +bar_fail:
>> +	for (i = 0; i < qdev->num_dbc; ++i) {
>> +		cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
>> +		idr_destroy(&qdev->dbc[i].buf_handles);
>> +	}
>> +	cleanup_srcu_struct(&qdev->dev_lock);
>> +	destroy_workqueue(qdev->ssr_wq);
>> +ssr_wq_fail:
>> +	destroy_workqueue(qdev->tele_wq);
>> +tele_wq_fail:
>> +	destroy_workqueue(qdev->cntl_wq);
>> +wq_fail:
>> +	kfree(qdev->dbc);
>> +device_id_fail:
>> +	kfree(qdev);
>> +qdev_fail:
>> +	return ret;
>> +}
>> +
>> +static void qaic_pci_remove(struct pci_dev *pdev)
>> +{
>> +	struct qaic_device *qdev = pci_get_drvdata(pdev);
>> +	int i;
>> +
>> +	if (!qdev)
>> +		return;
>> +
>> +	qaic_dev_reset_clean_local_state(qdev, false);
>> +	qaic_mhi_free_controller(qdev->mhi_cntl, link_up);
>> +	for (i = 0; i < qdev->num_dbc; ++i) {
>> +		devm_free_irq(&pdev->dev, pci_irq_vector(pdev, i + 1),
>> +			      &qdev->dbc[i]);
>> +		cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
>> +		idr_destroy(&qdev->dbc[i].buf_handles);
>> +	}
>> +	destroy_workqueue(qdev->cntl_wq);
>> +	destroy_workqueue(qdev->tele_wq);
>> +	destroy_workqueue(qdev->ssr_wq);
>> +	pci_free_irq_vectors(pdev);
>> +	iounmap(qdev->bar_0);
>> +	pci_clear_master(pdev);
>> +	pci_release_selected_regions(pdev, qdev->bars);
>> +	pci_disable_device(pdev);
>> +	pci_set_drvdata(pdev, NULL);
>> +	kfree(qdev->dbc);
>> +	kfree(qdev);
>> +}
>> +
>> +static void qaic_pci_shutdown(struct pci_dev *pdev)
>> +{
>> +	link_up = true;
>> +	qaic_pci_remove(pdev);
>> +}
>> +
>> +static pci_ers_result_t qaic_pci_error_detected(struct pci_dev *pdev,
>> +						pci_channel_state_t error)
>> +{
>> +	return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>> +static void qaic_pci_reset_prepare(struct pci_dev *pdev)
>> +{
>> +	struct qaic_device *qdev = pci_get_drvdata(pdev);
>> +
>> +	qaic_notify_reset(qdev);
>> +	qaic_mhi_start_reset(qdev->mhi_cntl);
>> +	qaic_dev_reset_clean_local_state(qdev, false);
>> +}
>> +
>> +static void qaic_pci_reset_done(struct pci_dev *pdev)
>> +{
>> +	struct qaic_device *qdev = pci_get_drvdata(pdev);
>> +
>> +	qdev->in_reset = false;
>> +	qaic_mhi_reset_done(qdev->mhi_cntl);
>> +}
>> +
>> +static const struct mhi_device_id qaic_mhi_match_table[] = {
>> +	{ .chan = "QAIC_CONTROL", },
>> +	{},
>> +};
>> +
>> +static struct mhi_driver qaic_mhi_driver = {
>> +	.id_table = qaic_mhi_match_table,
>> +	.remove = qaic_mhi_remove,
>> +	.probe = qaic_mhi_probe,
>> +	.ul_xfer_cb = qaic_mhi_ul_xfer_cb,
>> +	.dl_xfer_cb = qaic_mhi_dl_xfer_cb,
>> +	.driver = {
>> +		.name = "qaic_mhi",
>> +		.owner = THIS_MODULE,
> 
> Please run coccinelle/coccicheck and fix the warnings. Usually core sets
> THIS_MODULE.

Ah, thats right.  Legacy compatibility that should not be here.

> 
>> +	},
>> +};
>> +
>> +static const struct pci_device_id ids[] = {
> 
> qaic_ids

Fair.

> 
>> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC100), },
>> +	{ 0, }
> 
> Just {}

Fair.

> 
>> +};
>> +MODULE_DEVICE_TABLE(pci, ids);
>> +
>> +static const struct pci_error_handlers qaic_pci_err_handler = {
>> +	.error_detected = qaic_pci_error_detected,
>> +	.reset_prepare = qaic_pci_reset_prepare,
>> +	.reset_done = qaic_pci_reset_done,
>> +};
>> +
>> +static struct pci_driver qaic_pci_driver = {
>> +	.name = QAIC_NAME,
>> +	.id_table = ids,
>> +	.probe = qaic_pci_probe,
>> +	.remove = qaic_pci_remove,
>> +	.shutdown = qaic_pci_shutdown,
>> +	.err_handler = &qaic_pci_err_handler,
>> +};
>> +
>> +static int __init qaic_init(void)
>> +{
>> +	int ret;
>> +
>> +	if (datapath_polling) {
>> +		poll_datapath = true;
>> +		pr_info("qaic: driver initializing in datapath polling mode\n");
> 
> No pr() in normal path of init/exit.

This is not the normal path.  datapath_polling is a module parameter. 
This is something the user can enable, and so it would be good to have 
the user informed that the option took effect.

> 
>> +	}
>> +
>> +	qaic_logging_register();
>> +
>> +	ret = mhi_driver_register(&qaic_mhi_driver);
>> +	if (ret) {
>> +		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
>> +		goto free_class;
>> +	}
>> +
>> +	ret = pci_register_driver(&qaic_pci_driver);
>> +
> 
> No need for such blank lines.

Agreed.

> 
>> +	if (ret) {
>> +		pr_debug("qaic: pci_register_driver failed %d\n", ret);
>> +		goto free_mhi;
>> +	}
>> +
>> +	qaic_telemetry_register();
>> +	qaic_ras_register();
>> +	qaic_ssr_register();
>> +	goto out;
> 
> return 0.

Ok.

> 
>> +
>> +free_mhi:
>> +	mhi_driver_unregister(&qaic_mhi_driver);
>> +free_class:
>> +out:
>> +	if (ret)
>> +		qaic_logging_unregister();
>> +
>> +	return ret;
>> +}
>> +
>> +static void __exit qaic_exit(void)
>> +{
>> +	pr_debug("qaic: exit\n");
> 
> No pr() in normal path of init/exit.

Sure.

> 
>> +	link_up = true;
> 
> This is confusing...

Will add a comment.  This ties into MHI, and how it can tear down in two 
different ways, usually based on the link state.

In this case, we are doing a clean tear down where the link is still up, 
and so we should have MHI do the extra tear down that leaves the device 
in a good state, in the event the driver gets added again.

> 
>> +	pci_unregister_driver(&qaic_pci_driver);
>> +	mhi_driver_unregister(&qaic_mhi_driver);
>> +	qaic_telemetry_unregister();
>> +	qaic_ras_unregister();
>> +	qaic_ssr_unregister();
> 
> Order of cleanup is usually reverse from init.

Fair.

> 
>> +	qaic_logging_unregister();
>> +}
>> +
>> +module_init(qaic_init);
>> +module_exit(qaic_exit);
> 
> Best regards,
> Krzysztof

