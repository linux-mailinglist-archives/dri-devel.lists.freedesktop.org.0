Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F16E864C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD8510E366;
	Thu, 20 Apr 2023 00:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B50210E366
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:20:45 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id q21so1005319ljp.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681950043; x=1684542043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GDztKvY0B6D8Eg45IbE9Qyn0s/pfxIwb0wxGg2h1JrI=;
 b=uSeZRmpRtsRswdLaPTg/TcBS4q/1LMiDRIBgOkd+6ftw+FIDlF7KVV8rr4BFMyJoNA
 SNTAmfpJPbHNImknldIfYi55WN4rl8knQijPHG3osoOCtkUzRLuqGxtSr3xO5LfkQSK8
 +SzXt2YRf4JOSD/OOmVznPun9r+SN9NRh5Md3K9dfFOduYrXz4r5O8GC2YyirS1Dv02T
 tc2trvovz0HQwphdpgJHC/IsGWoQ6aazmhh0Zc7FgHT4JY5P7R9lqbrxwFbttdqU4FCQ
 r1nM18Tc9xwOVZy7gikc2lPRQsXhnucIkAcQMCDcEJ+IW/1aat7WgNEdJy0jyvbkdJLy
 3ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681950043; x=1684542043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GDztKvY0B6D8Eg45IbE9Qyn0s/pfxIwb0wxGg2h1JrI=;
 b=Do7UrhT7a3SvkJil6m2zPVlMEi5MueH0orzuWVjQg93ljN0i1Vs48DCHqYf4hO187G
 fsweTIP1A/DPsF1+qWPBvarmt4MHS4aSGfFL9f9T+zxifEH4JNU3tye/Iuk+snHGZJUH
 NpfbOGIKahs3/zQYaQIvzaxXlo1v33zhUJ25aVM3lNdEGAdBvCxfIEwopsBPu9f3qrzk
 YQsMZVNro1HhrpMKvN+Lu7fKalpb0O6k56vj/m/zthAhVkljE1WjTFzUS2p3Xp+KcpEp
 CDKCwFYnJdOB4DUszbO1+G2wONQu8EMIVsVTdeEmmqVG9vSNaoaS8EIVdhmgbWUTb9ny
 OvTg==
X-Gm-Message-State: AAQBX9f4XurN+PDnd93DtA243fP2vOjTa4ZzClkse14xBM7dHg/K6oo6
 8UGRB9IzFBViIXD7o28rYiU9NQ==
X-Google-Smtp-Source: AKy350bDgpeTqGFUgYl0dLeXcbirFavRLcl9RnEzpL+U8rmPeuDC3Vvg6DFKZBWkzqqKGgjeSJE7cA==
X-Received: by 2002:a2e:9bd3:0:b0:2a8:ad87:279d with SMTP id
 w19-20020a2e9bd3000000b002a8ad87279dmr2204324ljj.34.1681950043034; 
 Wed, 19 Apr 2023 17:20:43 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a2ea411000000b002934fe524d2sm8755ljn.83.2023.04.19.17.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:20:42 -0700 (PDT)
Message-ID: <2c2d4ce0-11e7-a0f7-0b24-d8f13b80923f@linaro.org>
Date: Thu, 20 Apr 2023 03:20:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/4] drm/msm: add hdmi cec support
Content-Language: en-GB
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
 <20230418-msm8998-hdmi-cec-v1-2-176479fb2fce@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230418-msm8998-hdmi-cec-v1-2-176479fb2fce@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2023 21:10, Arnaud Vrac wrote:
> Some Qualcomm SoCs that support HDMI also support CEC, including MSM8996
> and MSM8998. The hardware block can handle a single CEC logical address
> and broadcast messages.
> 
> Port the CEC driver from downstream msm-4.4 kernel. It has been tested
> on MSM8998 and passes the cec-compliance tool tests.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
>   drivers/gpu/drm/msm/Kconfig         |   8 ++
>   drivers/gpu/drm/msm/Makefile        |   1 +
>   drivers/gpu/drm/msm/hdmi/hdmi.c     |  15 ++
>   drivers/gpu/drm/msm/hdmi/hdmi.h     |  18 +++
>   drivers/gpu/drm/msm/hdmi/hdmi_cec.c | 280 ++++++++++++++++++++++++++++++++++++
>   5 files changed, 322 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 85f5ab1d552c4..2a02c74207935 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -165,3 +165,11 @@ config DRM_MSM_HDMI_HDCP
>   	default y
>   	help
>   	  Choose this option to enable HDCP state machine
> +
> +config DRM_MSM_HDMI_CEC
> +	bool "Enable HDMI CEC support in MSM DRM driver"
> +	depends on DRM_MSM && DRM_MSM_HDMI
> +	select CEC_CORE
> +	default y
> +	help
> +	  Choose this option to enable CEC support
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 7274c41228ed9..0237a2f219ac2 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -131,6 +131,7 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>   
>   msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
>   
> +msm-$(CONFIG_DRM_MSM_HDMI_CEC) += hdmi/hdmi_cec.o
>   msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
>   
>   msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 3132105a2a433..1dde3890e25c0 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -11,6 +11,8 @@
>   #include <drm/drm_bridge_connector.h>
>   #include <drm/drm_of.h>
>   
> +#include <media/cec.h>
> +
>   #include <sound/hdmi-codec.h>
>   #include "hdmi.h"
>   
> @@ -53,6 +55,9 @@ static irqreturn_t msm_hdmi_irq(int irq, void *dev_id)
>   	if (hdmi->hdcp_ctrl)
>   		msm_hdmi_hdcp_irq(hdmi->hdcp_ctrl);
>   
> +	/* Process CEC: */
> +	msm_hdmi_cec_irq(hdmi);
> +
>   	/* TODO audio.. */
>   
>   	return IRQ_HANDLED;
> @@ -66,6 +71,8 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
>   	 */
>   	if (hdmi->workq)
>   		destroy_workqueue(hdmi->workq);
> +
> +	msm_hdmi_cec_exit(hdmi);
>   	msm_hdmi_hdcp_destroy(hdmi);
>   
>   	if (hdmi->i2c)
> @@ -139,6 +146,8 @@ static int msm_hdmi_init(struct hdmi *hdmi)
>   		hdmi->hdcp_ctrl = NULL;
>   	}
>   
> +	msm_hdmi_cec_init(hdmi);
> +
>   	return 0;
>   
>   fail:
> @@ -198,6 +207,12 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>   
>   	drm_connector_attach_encoder(hdmi->connector, hdmi->encoder);
>   
> +	if (hdmi->cec_adap) {
> +		struct cec_connector_info conn_info;
> +		cec_fill_conn_info_from_drm(&conn_info, hdmi->connector);
> +		cec_s_conn_info(hdmi->cec_adap, &conn_info);
> +	}
> +
>   	ret = devm_request_irq(dev->dev, hdmi->irq,
>   			msm_hdmi_irq, IRQF_TRIGGER_HIGH,
>   			"hdmi_isr", hdmi);
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index e8dbee50637fa..c639bd87f4b8f 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -29,6 +29,7 @@ struct hdmi_audio {
>   };
>   
>   struct hdmi_hdcp_ctrl;
> +struct cec_adapter;
>   
>   struct hdmi {
>   	struct drm_device *dev;
> @@ -73,6 +74,7 @@ struct hdmi {
>   	struct workqueue_struct *workq;
>   
>   	struct hdmi_hdcp_ctrl *hdcp_ctrl;
> +	struct cec_adapter *cec_adap;
>   
>   	/*
>   	* spinlock to protect registers shared by different execution
> @@ -261,4 +263,20 @@ static inline void msm_hdmi_hdcp_off(struct hdmi_hdcp_ctrl *hdcp_ctrl) {}
>   static inline void msm_hdmi_hdcp_irq(struct hdmi_hdcp_ctrl *hdcp_ctrl) {}
>   #endif
>   
> +/*
> + * cec
> + */
> +#ifdef CONFIG_DRM_MSM_HDMI_CEC
> +int msm_hdmi_cec_init(struct hdmi *hdmi);
> +void msm_hdmi_cec_exit(struct hdmi *hdmi);
> +void msm_hdmi_cec_irq(struct hdmi *hdmi);
> +#else
> +static inline int msm_hdmi_cec_init(struct hdmi *hdmi)
> +{
> +	return -ENXIO;
> +}
> +static inline void msm_hdmi_cec_exit(struct hdmi *hdmi) {}
> +static inline void msm_hdmi_cec_irq(struct hdmi *hdmi) {}
> +#endif
> +
>   #endif /* __HDMI_CONNECTOR_H__ */
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_cec.c b/drivers/gpu/drm/msm/hdmi/hdmi_cec.c
> new file mode 100644
> index 0000000000000..51326e493e5da
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_cec.c
> @@ -0,0 +1,280 @@
> +#include <linux/iopoll.h>
> +#include <media/cec.h>
> +
> +#include "hdmi.h"
> +
> +#define HDMI_CEC_INT_MASK ( \
> +	HDMI_CEC_INT_TX_DONE_MASK | \
> +	HDMI_CEC_INT_TX_ERROR_MASK | \
> +	HDMI_CEC_INT_RX_DONE_MASK)
> +
> +struct hdmi_cec_ctrl {
> +	struct hdmi *hdmi;
> +	struct work_struct work;
> +	spinlock_t lock;
> +	u32 irq_status;
> +	u32 tx_status;
> +	u32 tx_retransmits;
> +};
> +
> +static int msm_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
> +{
> +	struct hdmi_cec_ctrl *cec_ctrl = adap->priv;
> +	struct hdmi *hdmi = cec_ctrl->hdmi;
> +
> +	if (enable) {
> +		/* timer frequency, 19.2Mhz * 0.05ms / 1000ms = 960 */
> +		hdmi_write(hdmi, REG_HDMI_CEC_REFTIMER,
> +			   HDMI_CEC_REFTIMER_REFTIMER(960) |
> +			   HDMI_CEC_REFTIMER_ENABLE);
> +
> +		/* read and write timings */
> +		hdmi_write(hdmi, REG_HDMI_CEC_RD_RANGE, 0x30AB9888);

lowercase hex please. We are trying to switch to it.

> +		hdmi_write(hdmi, REG_HDMI_CEC_WR_RANGE, 0x888AA888);
> +		hdmi_write(hdmi, REG_HDMI_CEC_RD_START_RANGE, 0x88888888);
> +		hdmi_write(hdmi, REG_HDMI_CEC_RD_TOTAL_RANGE, 0x99);
> +
> +		/* start bit low pulse duration, 3.7ms */
> +		hdmi_write(hdmi, REG_HDMI_CEC_RD_ERR_RESP_LO, 74);
> +
> +		/* signal free time, 7 * 2.4ms */
> +		hdmi_write(hdmi, REG_HDMI_CEC_TIME,
> +			   HDMI_CEC_TIME_SIGNAL_FREE_TIME(7 * 48) |
> +			   HDMI_CEC_TIME_ENABLE);
> +
> +		hdmi_write(hdmi, REG_HDMI_CEC_COMPL_CTL, 0xF);
> +		hdmi_write(hdmi, REG_HDMI_CEC_WR_CHECK_CONFIG, 0x4);
> +		hdmi_write(hdmi, REG_HDMI_CEC_RD_FILTER, BIT(0) | (0x7FF << 4));
> +
> +		hdmi_write(hdmi, REG_HDMI_CEC_INT, HDMI_CEC_INT_MASK);
> +		hdmi_write(hdmi, REG_HDMI_CEC_CTRL, HDMI_CEC_CTRL_ENABLE);
> +	} else {
> +		hdmi_write(hdmi, REG_HDMI_CEC_INT, 0);
> +		hdmi_write(hdmi, REG_HDMI_CEC_CTRL, 0);
> +		cancel_work_sync(&cec_ctrl->work);
> +	}
> +
> +	return 0;
> +}
> +
> +static int msm_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 logical_addr)
> +{
> +	struct hdmi_cec_ctrl *cec_ctrl = adap->priv;
> +	struct hdmi *hdmi = cec_ctrl->hdmi;
> +
> +	hdmi_write(hdmi, REG_HDMI_CEC_ADDR, logical_addr & 0xF);
> +
> +	return 0;
> +}
> +
> +static int msm_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
> +				      u32 signal_free_time, struct cec_msg *msg)
> +{
> +	struct hdmi_cec_ctrl *cec_ctrl = adap->priv;
> +	struct hdmi *hdmi = cec_ctrl->hdmi;
> +	u8 retransmits;
> +	u32 broadcast;
> +	u32 status;
> +	int i;
> +
> +	/* toggle cec in order to flush out bad hw state, if any */
> +	hdmi_write(hdmi, REG_HDMI_CEC_CTRL, 0);
> +	hdmi_write(hdmi, REG_HDMI_CEC_CTRL, HDMI_CEC_CTRL_ENABLE);
> +
> +	/* flush register writes */
> +	wmb();
> +
> +	retransmits = attempts ? (attempts - 1) : 0;
> +	hdmi_write(hdmi, REG_HDMI_CEC_RETRANSMIT,
> +		   HDMI_CEC_RETRANSMIT_ENABLE |
> +		   HDMI_CEC_RETRANSMIT_COUNT(retransmits));
> +
> +	broadcast = cec_msg_is_broadcast(msg) ? HDMI_CEC_WR_DATA_BROADCAST : 0;
> +	for (i = 0; i < msg->len; i++) {
> +		hdmi_write(hdmi, REG_HDMI_CEC_WR_DATA,
> +			   HDMI_CEC_WR_DATA_DATA(msg->msg[i]) | broadcast);
> +	}
> +
> +	/* check line status */
> +	if (read_poll_timeout(hdmi_read, status, !(status & HDMI_CEC_STATUS_BUSY),
> +			      5, 1000, false, hdmi, REG_HDMI_CEC_STATUS)) {
> +		pr_err("CEC line is busy. Retry failed\n");
> +		return -EBUSY;
> +	}
> +
> +	cec_ctrl->tx_retransmits = retransmits;
> +
> +	/* start transmission */
> +	hdmi_write(hdmi, REG_HDMI_CEC_CTRL,
> +		   HDMI_CEC_CTRL_ENABLE |
> +		   HDMI_CEC_CTRL_SEND_TRIGGER |
> +		   HDMI_CEC_CTRL_FRAME_SIZE(msg->len) |
> +		   HDMI_CEC_CTRL_LINE_OE);
> +
> +	return 0;
> +}
> +
> +static void msm_hdmi_cec_adap_free(struct cec_adapter *adap)
> +{
> +	struct hdmi_cec_ctrl *cec_ctrl = adap->priv;
> +
> +	cec_ctrl->hdmi->cec_adap = NULL;
> +	kfree(cec_ctrl);
> +}
> +
> +static const struct cec_adap_ops msm_hdmi_cec_adap_ops = {
> +	.adap_enable = msm_hdmi_cec_adap_enable,
> +	.adap_log_addr = msm_hdmi_cec_adap_log_addr,
> +	.adap_transmit = msm_hdmi_cec_adap_transmit,
> +	.adap_free = msm_hdmi_cec_adap_free,
> +};
> +
> +#define CEC_IRQ_FRAME_WR_DONE 0x01
> +#define CEC_IRQ_FRAME_RD_DONE 0x02

Please move these to top. Also you might consider replacing this mask 
with two boolean flags.

> +
> +static void msm_hdmi_cec_handle_rx_done(struct hdmi_cec_ctrl *cec_ctrl)
> +{
> +	struct hdmi *hdmi = cec_ctrl->hdmi;
> +	struct cec_msg msg = {};
> +	u32 data;
> +	int i;
> +
> +	data = hdmi_read(hdmi, REG_HDMI_CEC_RD_DATA);
> +	msg.len = (data & 0x1f00) >> 8;

We can also use FIELD_GET here. I'll add defines to the mesa merge request.

> +	if (msg.len < 1 || msg.len > CEC_MAX_MSG_SIZE)
> +		return;
> +
> +	msg.msg[0] = data & 0xff;
> +	for (i = 1; i < msg.len; i++)
> +		msg.msg[i] = hdmi_read(hdmi, REG_HDMI_CEC_RD_DATA) & 0xff;
> +
> +	cec_received_msg(hdmi->cec_adap, &msg);
> +}
> +
> +static void msm_hdmi_cec_handle_tx_done(struct hdmi_cec_ctrl *cec_ctrl)
> +{
> +	struct hdmi *hdmi = cec_ctrl->hdmi;
> +	u32 tx_status;
> +
> +	tx_status = (cec_ctrl->tx_status & HDMI_CEC_STATUS_TX_STATUS__MASK) >>
> +		HDMI_CEC_STATUS_TX_STATUS__SHIFT;

FIELD_GET(HDMI_CEC_STATUS_TX_STATUS__MASK, cec_ctrl->tx_status).

> +
> +	switch (tx_status) {
> +	case 0:

Please use valus from enum hdmi_cec_tx_status

> +		cec_transmit_done(hdmi->cec_adap,
> +				  CEC_TX_STATUS_OK, 0, 0, 0, 0);
> +		break;
> +	case 1:
> +		cec_transmit_done(hdmi->cec_adap,
> +				  CEC_TX_STATUS_NACK, 0, 1, 0, 0);
> +		break;
> +	case 2:
> +		cec_transmit_done(hdmi->cec_adap,
> +				  CEC_TX_STATUS_ARB_LOST, 1, 0, 0, 0);
> +		break;
> +	case 3:
> +		cec_transmit_done(hdmi->cec_adap,
> +				  CEC_TX_STATUS_MAX_RETRIES |
> +				  CEC_TX_STATUS_NACK,
> +				  0, cec_ctrl->tx_retransmits + 1, 0, 0);
> +		break;
> +	default:
> +		cec_transmit_done(hdmi->cec_adap,
> +				  CEC_TX_STATUS_ERROR, 0, 0, 0, 1);
> +		break;
> +	}
> +}
> +
> +static void msm_hdmi_cec_work(struct work_struct *work)
> +{
> +	struct hdmi_cec_ctrl *cec_ctrl =
> +		container_of(work, struct hdmi_cec_ctrl, work);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&cec_ctrl->lock, flags);
> +
> +	if (cec_ctrl->irq_status & CEC_IRQ_FRAME_WR_DONE)
> +		msm_hdmi_cec_handle_tx_done(cec_ctrl);
> +
> +	if (cec_ctrl->irq_status & CEC_IRQ_FRAME_RD_DONE)
> +		msm_hdmi_cec_handle_rx_done(cec_ctrl);
> +
> +	cec_ctrl->irq_status = 0;
> +	cec_ctrl->tx_status = 0;
> +
> +	spin_unlock_irqrestore(&cec_ctrl->lock, flags);
> +}
> +
> +void msm_hdmi_cec_irq(struct hdmi *hdmi)
> +{
> +	struct hdmi_cec_ctrl *cec_ctrl;
> +	unsigned long flags;
> +	u32 int_status;
> +
> +	if (!hdmi->cec_adap)
> +		return;
> +
> +	cec_ctrl = hdmi->cec_adap->priv;
> +
> +	int_status = hdmi_read(hdmi, REG_HDMI_CEC_INT);
> +	if (!(int_status & HDMI_CEC_INT_MASK))
> +		return;
> +
> +	spin_lock_irqsave(&cec_ctrl->lock, flags);
> +
> +	if (int_status & (HDMI_CEC_INT_TX_DONE | HDMI_CEC_INT_TX_ERROR)) {
> +		cec_ctrl->tx_status = hdmi_read(hdmi, REG_HDMI_CEC_STATUS);
> +		cec_ctrl->irq_status |= CEC_IRQ_FRAME_WR_DONE;
> +	}
> +
> +	if (int_status & HDMI_CEC_INT_RX_DONE)
> +		cec_ctrl->irq_status |= CEC_IRQ_FRAME_RD_DONE;
> +
> +	spin_unlock_irqrestore(&cec_ctrl->lock, flags);
> +
> +	hdmi_write(hdmi, REG_HDMI_CEC_INT, int_status);
> +	queue_work(hdmi->workq, &cec_ctrl->work);
> +}
> +
> +int msm_hdmi_cec_init(struct hdmi *hdmi)
> +{
> +	struct platform_device *pdev = hdmi->pdev;
> +	struct hdmi_cec_ctrl *cec_ctrl;
> +	struct cec_adapter *cec_adap;
> +	int ret;

hdmi_cec_enable from msm-4.4 tells that CEC is not supported if 
REG_HDMI_VERSION reads < 0x30000001. Could you please add this check?




> +
> +	cec_ctrl = kzalloc(sizeof (*cec_ctrl), GFP_KERNEL);
> +	if (!cec_ctrl)
> +		return -ENOMEM;
> +
> +	cec_ctrl->hdmi = hdmi;
> +	INIT_WORK(&cec_ctrl->work, msm_hdmi_cec_work);
> +
> +	cec_adap = cec_allocate_adapter(&msm_hdmi_cec_adap_ops,
> +					cec_ctrl, "msm",
> +					CEC_CAP_DEFAULTS |
> +					CEC_CAP_CONNECTOR_INFO, 1);
> +	ret = PTR_ERR_OR_ZERO(cec_adap);
> +	if (ret < 0) {
> +		kfree(cec_ctrl);
> +		return ret;
> +	}
> +
> +	/* Set the logical address to Unregistered */
> +	hdmi_write(hdmi, REG_HDMI_CEC_ADDR, 0xf);
> +
> +	ret = cec_register_adapter(cec_adap, &pdev->dev);
> +	if (ret < 0) {
> +		cec_delete_adapter(cec_adap);
> +		return ret;
> +	}
> +
> +	hdmi->cec_adap = cec_adap;
> +
> +	return 0;
> +}
> +
> +void msm_hdmi_cec_exit(struct hdmi *hdmi)
> +{
> +	cec_unregister_adapter(hdmi->cec_adap);
> +}
> 

-- 
With best wishes
Dmitry

