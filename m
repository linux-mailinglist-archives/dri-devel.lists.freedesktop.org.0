Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83537595967
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 13:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6001D112937;
	Tue, 16 Aug 2022 11:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6FA18A56C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 11:06:39 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id x25so10164237ljm.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 04:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=FicsK1OI63sy7tVNZN0oLZB/9fptngT+y2PX9mqlX+U=;
 b=rwlhv46lRNNZZ0Xq0OxNB2pe46YbuOHy4YonF0W1diYYrM+zhWVBezWQdP0/wvNziD
 7OnXpTYbMosY1kfjlJXvd+QFnbjBCwSj/tPE2YxqvLUTeRIdxixfojmLifoZlfOKpk4i
 9jvZIbT86fYS20HRbxzepJMZzgCF5mzshNPeGqLdFiy9rYP15E7oRMWdNr3LTiwtmQsA
 cQMa07ONCBEK3u88xeUCFkvXOuAdiuGUFWJl+dRTRE9nF0N7aYtcvmOpR119RSmaLHc6
 6C7Wwp3ibQqjS2LPfs5eEGx7umKmZGI4JAwAJtUCIiimIWV46AzhDurzOWBTUES7jDdA
 2DiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=FicsK1OI63sy7tVNZN0oLZB/9fptngT+y2PX9mqlX+U=;
 b=WbmQfd23xnHrdTFoPgMfotswFDr+RtfCg6XaUMSxyQs3uYb/6SVeuleM+Xct5V5XXy
 jOrui8gOrzK+CAvK3KUjGSenzS7Jc0nDrN4FO2uOsfIOzMKAxSI4ptcT85TqxOo7NhQQ
 WpnO30YO/yBvn6GlIoTyGRx2G01Z6WrRPA5J3Ld2/928JG9IRrJKhkDe+LeyoUNKsUMF
 8gkqFjchs3XjJcKyxGQvq7kA68+gU2DocmcpYeTDx+0NPfXvGjJTAAcdj8sg3FtwozaC
 wZ06P8Eqc361tNRdq4hwKy4HhgaIMJaFql9F9LQxb+Tjq6BeZTzARVBtQJFhQmdNbQqR
 5FrQ==
X-Gm-Message-State: ACgBeo0z3L7dfPum+DwAb+xBqWelecwEGPBDqAd+sWE6fCQcIOLnDara
 7vn0Tp48dhDqUKB1F3rMnAql1g==
X-Google-Smtp-Source: AA6agR4rq+P8LcXELLXm36rwAaj/24QM3O2kDdjseUa9Ie8eVYsiETuiKNR18xc3KTwcTOEpctEy1A==
X-Received: by 2002:a2e:b88c:0:b0:25f:eae4:74ff with SMTP id
 r12-20020a2eb88c000000b0025feae474ffmr6686016ljp.48.1660647997904; 
 Tue, 16 Aug 2022 04:06:37 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4?
 (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05651c031700b0026008acb55asm1761862ljp.113.2022.08.16.04.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 04:06:37 -0700 (PDT)
Message-ID: <10ad6023-703d-65cf-6b00-2caa658c49e9@linaro.org>
Date: Tue, 16 Aug 2022 14:06:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH 02/14] drm/qaic: Add uapi and core driver file
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, airlied@linux.ie, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
References: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
 <1660588956-24027-3-git-send-email-quic_jhugo@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1660588956-24027-3-git-send-email-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 15/08/2022 21:42, Jeffrey Hugo wrote:
> Add the QAIC driver uapi file and core driver file that binds to the PCIe
> device.  The core driver file also creates the drm device and manages all
> the interconnections between the different parts of the driver.

Thank you for your patch. There is something to discuss/improve.


> 
> Change-Id: I28854e8a5dacda217439be2f65a4ab67d4dccd1e

This has to go...

(...)


> +static int qaic_pci_probe(struct pci_dev *pdev,
> +			  const struct pci_device_id *id)
> +{
> +	int ret;
> +	int i;
> +	int mhi_irq;
> +	struct qaic_device *qdev;
> +
> +	qdev = kzalloc(sizeof(*qdev), GFP_KERNEL);
> +	if (!qdev) {

return -ENOMEM;

> +		ret = -ENOMEM;
> +		goto qdev_fail;
> +	}
> +
> +	if (id->device == PCI_DEV_AIC100) {
> +		qdev->num_dbc = 16;
> +		qdev->dbc = kcalloc(qdev->num_dbc, sizeof(*qdev->dbc),
> +				    GFP_KERNEL);

Why not devm?

> +		if (!qdev->dbc) {
> +			ret = -ENOMEM;
> +			goto device_id_fail;
> +		}
> +	} else {
> +		pci_dbg(pdev, "%s: No matching device found for device id %d\n",
> +			__func__, id->device);

How this can happen?

> +		ret = -EINVAL;
> +		goto device_id_fail;
> +	}
> +
> +	qdev->cntl_wq = alloc_workqueue("qaic_cntl", WQ_UNBOUND, 0);
> +	if (!qdev->cntl_wq) {
> +		ret = -ENOMEM;
> +		goto wq_fail;
> +	}
> +	qdev->tele_wq = alloc_workqueue("qaic_tele", WQ_UNBOUND, 0);
> +	if (!qdev->tele_wq) {
> +		ret = -ENOMEM;
> +		goto tele_wq_fail;
> +	}
> +	qdev->ssr_wq = alloc_workqueue("qaic_ssr", WQ_UNBOUND, 0);
> +	if (!qdev->ssr_wq) {
> +		ret = -ENOMEM;
> +		goto ssr_wq_fail;
> +	}
> +	pci_set_drvdata(pdev, qdev);
> +	qdev->pdev = pdev;
> +	mutex_init(&qdev->cntl_mutex);
> +	INIT_LIST_HEAD(&qdev->cntl_xfer_list);
> +	init_srcu_struct(&qdev->dev_lock);
> +	mutex_init(&qdev->tele_mutex);
> +	INIT_LIST_HEAD(&qdev->tele_xfer_list);
> +	INIT_LIST_HEAD(&qdev->bootlog);
> +	mutex_init(&qdev->bootlog_mutex);
> +	INIT_LIST_HEAD(&qdev->qaic_drm_devices);
> +	mutex_init(&qdev->qaic_drm_devices_mutex);
> +	for (i = 0; i < qdev->num_dbc; ++i) {
> +		mutex_init(&qdev->dbc[i].handle_lock);
> +		spin_lock_init(&qdev->dbc[i].xfer_lock);
> +		idr_init(&qdev->dbc[i].buf_handles);
> +		qdev->dbc[i].qdev = qdev;
> +		qdev->dbc[i].id = i;
> +		INIT_LIST_HEAD(&qdev->dbc[i].xfer_list);
> +		init_srcu_struct(&qdev->dbc[i].ch_lock);
> +		init_waitqueue_head(&qdev->dbc[i].dbc_release);
> +		INIT_LIST_HEAD(&qdev->dbc[i].bo_lists);
> +	}
> +
> +	qdev->bars = pci_select_bars(pdev, IORESOURCE_MEM);
> +
> +	/* make sure the device has the expected BARs */
> +	if (qdev->bars != (BIT(0) | BIT(2) | BIT(4))) {
> +		pci_dbg(pdev, "%s: expected BARs 0, 2, and 4 not found in device.  Found 0x%x\n",
> +			__func__, qdev->bars);
> +		ret = -EINVAL;
> +		goto bar_fail;
> +	}
> +
> +	ret = pci_enable_device(pdev);
> +	if (ret)
> +		goto enable_fail;
> +
> +	ret = pci_request_selected_regions(pdev, qdev->bars, "aic100");
> +	if (ret)
> +		goto request_regions_fail;
> +
> +	pci_set_master(pdev);
> +
> +	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
> +	if (ret)
> +		goto dma_mask_fail;
> +	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(64));
> +	if (ret)
> +		goto dma_mask_fail;
> +	ret = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> +	if (ret)
> +		goto dma_mask_fail;
> +
> +	qdev->bar_0 = pci_ioremap_bar(pdev, 0);
> +	if (!qdev->bar_0) {
> +		ret = -ENOMEM;
> +		goto ioremap_0_fail;
> +	}
> +
> +	qdev->bar_2 = pci_ioremap_bar(pdev, 2);
> +	if (!qdev->bar_2) {
> +		ret = -ENOMEM;
> +		goto ioremap_2_fail;
> +	}
> +
> +	for (i = 0; i < qdev->num_dbc; ++i)
> +		qdev->dbc[i].dbc_base = qdev->bar_2 + QAIC_DBC_OFF(i);
> +
> +	ret = pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
> +	if (ret < 0)
> +		goto alloc_irq_fail;
> +
> +	if (ret < 32) {
> +		pci_err(pdev, "%s: Requested 32 MSIs.  Obtained %d MSIs which is less than the 32 required.\n",
> +			__func__, ret);
> +		ret = -ENODEV;
> +		goto invalid_msi_config;
> +	}
> +
> +	mhi_irq = pci_irq_vector(pdev, 0);
> +	if (mhi_irq < 0) {
> +		ret = mhi_irq;
> +		goto get_mhi_irq_fail;
> +	}
> +
> +	for (i = 0; i < qdev->num_dbc; ++i) {
> +		ret = devm_request_threaded_irq(&pdev->dev,
> +						pci_irq_vector(pdev, i + 1),
> +						dbc_irq_handler,
> +						dbc_irq_threaded_fn,
> +						IRQF_SHARED,
> +						"qaic_dbc",
> +						&qdev->dbc[i]);
> +		if (ret)
> +			goto get_dbc_irq_failed;
> +
> +		if (poll_datapath) {
> +			qdev->dbc[i].irq = pci_irq_vector(pdev, i + 1);
> +			disable_irq_nosync(qdev->dbc[i].irq);
> +			INIT_WORK(&qdev->dbc[i].poll_work, irq_polling_work);
> +		}
> +	}
> +
> +	qdev->mhi_cntl = qaic_mhi_register_controller(pdev, qdev->bar_0, mhi_irq);
> +	if (IS_ERR(qdev->mhi_cntl)) {
> +		ret = PTR_ERR(qdev->mhi_cntl);
> +		goto mhi_register_fail;
> +	}
> +
> +	return 0;
> +
> +mhi_register_fail:
> +get_dbc_irq_failed:
> +	for (i = 0; i < qdev->num_dbc; ++i)
> +		devm_free_irq(&pdev->dev, pci_irq_vector(pdev, i + 1),
> +			      &qdev->dbc[i]);
> +get_mhi_irq_fail:
> +invalid_msi_config:
> +	pci_free_irq_vectors(pdev);
> +alloc_irq_fail:
> +	iounmap(qdev->bar_2);
> +ioremap_2_fail:
> +	iounmap(qdev->bar_0);
> +ioremap_0_fail:
> +dma_mask_fail:
> +	pci_clear_master(pdev);
> +	pci_release_selected_regions(pdev, qdev->bars);
> +request_regions_fail:
> +	pci_disable_device(pdev);
> +enable_fail:
> +	pci_set_drvdata(pdev, NULL);
> +bar_fail:
> +	for (i = 0; i < qdev->num_dbc; ++i) {
> +		cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
> +		idr_destroy(&qdev->dbc[i].buf_handles);
> +	}
> +	cleanup_srcu_struct(&qdev->dev_lock);
> +	destroy_workqueue(qdev->ssr_wq);
> +ssr_wq_fail:
> +	destroy_workqueue(qdev->tele_wq);
> +tele_wq_fail:
> +	destroy_workqueue(qdev->cntl_wq);
> +wq_fail:
> +	kfree(qdev->dbc);
> +device_id_fail:
> +	kfree(qdev);
> +qdev_fail:
> +	return ret;
> +}
> +
> +static void qaic_pci_remove(struct pci_dev *pdev)
> +{
> +	struct qaic_device *qdev = pci_get_drvdata(pdev);
> +	int i;
> +
> +	if (!qdev)
> +		return;
> +
> +	qaic_dev_reset_clean_local_state(qdev, false);
> +	qaic_mhi_free_controller(qdev->mhi_cntl, link_up);
> +	for (i = 0; i < qdev->num_dbc; ++i) {
> +		devm_free_irq(&pdev->dev, pci_irq_vector(pdev, i + 1),
> +			      &qdev->dbc[i]);
> +		cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
> +		idr_destroy(&qdev->dbc[i].buf_handles);
> +	}
> +	destroy_workqueue(qdev->cntl_wq);
> +	destroy_workqueue(qdev->tele_wq);
> +	destroy_workqueue(qdev->ssr_wq);
> +	pci_free_irq_vectors(pdev);
> +	iounmap(qdev->bar_0);
> +	pci_clear_master(pdev);
> +	pci_release_selected_regions(pdev, qdev->bars);
> +	pci_disable_device(pdev);
> +	pci_set_drvdata(pdev, NULL);
> +	kfree(qdev->dbc);
> +	kfree(qdev);
> +}
> +
> +static void qaic_pci_shutdown(struct pci_dev *pdev)
> +{
> +	link_up = true;
> +	qaic_pci_remove(pdev);
> +}
> +
> +static pci_ers_result_t qaic_pci_error_detected(struct pci_dev *pdev,
> +						pci_channel_state_t error)
> +{
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static void qaic_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct qaic_device *qdev = pci_get_drvdata(pdev);
> +
> +	qaic_notify_reset(qdev);
> +	qaic_mhi_start_reset(qdev->mhi_cntl);
> +	qaic_dev_reset_clean_local_state(qdev, false);
> +}
> +
> +static void qaic_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct qaic_device *qdev = pci_get_drvdata(pdev);
> +
> +	qdev->in_reset = false;
> +	qaic_mhi_reset_done(qdev->mhi_cntl);
> +}
> +
> +static const struct mhi_device_id qaic_mhi_match_table[] = {
> +	{ .chan = "QAIC_CONTROL", },
> +	{},
> +};
> +
> +static struct mhi_driver qaic_mhi_driver = {
> +	.id_table = qaic_mhi_match_table,
> +	.remove = qaic_mhi_remove,
> +	.probe = qaic_mhi_probe,
> +	.ul_xfer_cb = qaic_mhi_ul_xfer_cb,
> +	.dl_xfer_cb = qaic_mhi_dl_xfer_cb,
> +	.driver = {
> +		.name = "qaic_mhi",
> +		.owner = THIS_MODULE,

Please run coccinelle/coccicheck and fix the warnings. Usually core sets
THIS_MODULE.

> +	},
> +};
> +
> +static const struct pci_device_id ids[] = {

qaic_ids

> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC100), },
> +	{ 0, }

Just {}

> +};
> +MODULE_DEVICE_TABLE(pci, ids);
> +
> +static const struct pci_error_handlers qaic_pci_err_handler = {
> +	.error_detected = qaic_pci_error_detected,
> +	.reset_prepare = qaic_pci_reset_prepare,
> +	.reset_done = qaic_pci_reset_done,
> +};
> +
> +static struct pci_driver qaic_pci_driver = {
> +	.name = QAIC_NAME,
> +	.id_table = ids,
> +	.probe = qaic_pci_probe,
> +	.remove = qaic_pci_remove,
> +	.shutdown = qaic_pci_shutdown,
> +	.err_handler = &qaic_pci_err_handler,
> +};
> +
> +static int __init qaic_init(void)
> +{
> +	int ret;
> +
> +	if (datapath_polling) {
> +		poll_datapath = true;
> +		pr_info("qaic: driver initializing in datapath polling mode\n");

No pr() in normal path of init/exit.

> +	}
> +
> +	qaic_logging_register();
> +
> +	ret = mhi_driver_register(&qaic_mhi_driver);
> +	if (ret) {
> +		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
> +		goto free_class;
> +	}
> +
> +	ret = pci_register_driver(&qaic_pci_driver);
> +

No need for such blank lines.

> +	if (ret) {
> +		pr_debug("qaic: pci_register_driver failed %d\n", ret);
> +		goto free_mhi;
> +	}
> +
> +	qaic_telemetry_register();
> +	qaic_ras_register();
> +	qaic_ssr_register();
> +	goto out;

return 0.

> +
> +free_mhi:
> +	mhi_driver_unregister(&qaic_mhi_driver);
> +free_class:
> +out:
> +	if (ret)
> +		qaic_logging_unregister();
> +
> +	return ret;
> +}
> +
> +static void __exit qaic_exit(void)
> +{
> +	pr_debug("qaic: exit\n");

No pr() in normal path of init/exit.

> +	link_up = true;

This is confusing...

> +	pci_unregister_driver(&qaic_pci_driver);
> +	mhi_driver_unregister(&qaic_mhi_driver);
> +	qaic_telemetry_unregister();
> +	qaic_ras_unregister();
> +	qaic_ssr_unregister();

Order of cleanup is usually reverse from init.

> +	qaic_logging_unregister();
> +}
> +
> +module_init(qaic_init);
> +module_exit(qaic_exit);

Best regards,
Krzysztof
