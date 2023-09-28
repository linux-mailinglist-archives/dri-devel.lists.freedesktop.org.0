Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB7E7B185F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 12:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3127410E0CB;
	Thu, 28 Sep 2023 10:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB32D10E0CB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 10:39:32 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9a9cd066db5so1708075266b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 03:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695897571; x=1696502371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Q433EzM2FsWDYtaT/MDGFWy/oK3ZmVN3hU01nJWDeg=;
 b=hQvxdUIXephc4Ux6XSIpGyqWE4JNfLDTRLw4Q4m7pij42L8TnorRW29wgqUsB2i6+J
 ZR/7XHRwxstRZsrAvGWDhOrsuuP34jF9rJQIlsl38dLIlNik4/R1xPfJwW8Eic2ICmcD
 SSKIazPW1gCxC8bI1lGuYZp0dHKn1kE/dsKmDVbIdD6NfQljdw7KQhN3ksW1ajpJiINy
 V4JOv/jwprHuvkyO9oYSgipcT9BJ3y5EM4N+TTtyIdM6aABsXluTQurBErKJCkKb3eS3
 tXqNOyoNczgRqkML6oXD2iTU0XwxY0zj+lIztjmx2SHpCPsmI9tfvBuFzdgdVaINqoy+
 jFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695897571; x=1696502371;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Q433EzM2FsWDYtaT/MDGFWy/oK3ZmVN3hU01nJWDeg=;
 b=M6xRWpDS2b/B0cO91VVPb1Fq1FeAS2X4kOexMhJNpyjXAoF+Zk5lzsB47NFcsxUKuw
 RJhssEdyiz/FLeG87oPpOlCOts2ap00C+oSe2qQ5ojbjvmnHM9ZU4CmDGWdT8PlGNJvg
 sh+SqBjPtJTxmBb3WsFHLmGE2x8PYjEAihLA2a7U1xi8NJNdZNgUbh/+edR7HJxCv2HJ
 ZRrZ+PBejwm6Ix2BW4AQjNg6Z0ly0bEqWxT+CgSfRdzk7tammeSwJvHI+0UpXfPmjmtb
 epna8bPLitRO4tLZDJiprHgqIGeFgtIkRyuWY13qctOgTT+mOywsiMz3sxxjRjq6vmg6
 6k2w==
X-Gm-Message-State: AOJu0YzTvizm5DLurv49DSObSsxRXEm79cZeNQNDm3WI3qFFoxR/LeUj
 vSaxCyYLOUgh8YUmAxbPY4rrWA==
X-Google-Smtp-Source: AGHT+IHnXuZ4jBjdLna+nBuO8HcueOyfNEgrOJ54VYmol2qkoNroQhONqic5+X4aLkRZ5AXn437RPA==
X-Received: by 2002:a17:906:1ba1:b0:9ae:654d:5105 with SMTP id
 r1-20020a1709061ba100b009ae654d5105mr815004ejg.47.1695897570950; 
 Thu, 28 Sep 2023 03:39:30 -0700 (PDT)
Received: from ?IPV6:2a02:810b:740:40c::19e1? ([2a02:810b:740:40c::19e1])
 by smtp.gmail.com with ESMTPSA id
 qk8-20020a170906d9c800b009a1dbf55665sm10571918ejb.161.2023.09.28.03.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 03:39:30 -0700 (PDT)
Message-ID: <fcfaadcc-ae71-431a-9354-c9f811109cdd@linaro.org>
Date: Thu, 28 Sep 2023 13:39:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] drm: bridge: Cadence: convert mailbox functions to
 macro functions
To: Sandor Yu <Sandor.yu@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <cover.1694047629.git.Sandor.yu@nxp.com>
 <e13e7a274983d2a5f891161446ca573914eeb9f7.1694047629.git.Sandor.yu@nxp.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e13e7a274983d2a5f891161446ca573914eeb9f7.1694047629.git.Sandor.yu@nxp.com>
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org,
 linux-imx@nxp.com, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/09/2023 04:05, Sandor Yu wrote:
> MHDP8546 mailbox access functions will be share to other mhdp driver
> and Cadence HDP-TX HDMI/DP PHY drivers.
> Move those functions to head file include/drm/bridge/cdns-mhdp-mailbox.h
> and convert them to macro functions.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 195 +-------------
>   .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   1 -
>   include/drm/bridge/cdns-mhdp-mailbox.h        | 240 ++++++++++++++++++
>   3 files changed, 241 insertions(+), 195 deletions(-)
>   create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index f6822dfa3805..ddd3c633c7bf 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -36,6 +36,7 @@
>   #include <linux/slab.h>
>   #include <linux/wait.h>
>   
> +#include <drm/bridge/cdns-mhdp-mailbox.h>
>   #include <drm/display/drm_dp_helper.h>
>   #include <drm/display/drm_hdcp_helper.h>
>   #include <drm/drm_atomic.h>
> @@ -54,200 +55,6 @@
>   #include "cdns-mhdp8546-hdcp.h"
>   #include "cdns-mhdp8546-j721e.h"
>   
> -static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
> -{
> -	int ret, empty;
> -
> -	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
> -
> -	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_EMPTY,
> -				 empty, !empty, MAILBOX_RETRY_US,
> -				 MAILBOX_TIMEOUT_US);
> -	if (ret < 0)
> -		return ret;
> -
> -	return readl(mhdp->regs + CDNS_MAILBOX_RX_DATA) & 0xff;
> -}
> -
> -static int cdns_mhdp_mailbox_write(struct cdns_mhdp_device *mhdp, u8 val)
> -{
> -	int ret, full;
> -
> -	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
> -
> -	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_FULL,
> -				 full, !full, MAILBOX_RETRY_US,
> -				 MAILBOX_TIMEOUT_US);
> -	if (ret < 0)
> -		return ret;
> -
> -	writel(val, mhdp->regs + CDNS_MAILBOX_TX_DATA);
> -
> -	return 0;
> -}
> -
> -static int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_device *mhdp,
> -					 u8 module_id, u8 opcode,
> -					 u16 req_size)
> -{
> -	u32 mbox_size, i;
> -	u8 header[4];
> -	int ret;
> -
> -	/* read the header of the message */
> -	for (i = 0; i < sizeof(header); i++) {
> -		ret = cdns_mhdp_mailbox_read(mhdp);
> -		if (ret < 0)
> -			return ret;
> -
> -		header[i] = ret;
> -	}
> -
> -	mbox_size = get_unaligned_be16(header + 2);
> -
> -	if (opcode != header[0] || module_id != header[1] ||
> -	    req_size != mbox_size) {
> -		/*
> -		 * If the message in mailbox is not what we want, we need to
> -		 * clear the mailbox by reading its contents.
> -		 */
> -		for (i = 0; i < mbox_size; i++)
> -			if (cdns_mhdp_mailbox_read(mhdp) < 0)
> -				break;
> -
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_device *mhdp,
> -				       u8 *buff, u16 buff_size)
> -{
> -	u32 i;
> -	int ret;
> -
> -	for (i = 0; i < buff_size; i++) {
> -		ret = cdns_mhdp_mailbox_read(mhdp);
> -		if (ret < 0)
> -			return ret;
> -
> -		buff[i] = ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static int cdns_mhdp_mailbox_send(struct cdns_mhdp_device *mhdp, u8 module_id,
> -				  u8 opcode, u16 size, u8 *message)
> -{
> -	u8 header[4];
> -	int ret, i;
> -
> -	header[0] = opcode;
> -	header[1] = module_id;
> -	put_unaligned_be16(size, header + 2);
> -
> -	for (i = 0; i < sizeof(header); i++) {
> -		ret = cdns_mhdp_mailbox_write(mhdp, header[i]);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	for (i = 0; i < size; i++) {
> -		ret = cdns_mhdp_mailbox_write(mhdp, message[i]);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static
> -int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr, u32 *value)
> -{
> -	u8 msg[4], resp[8];
> -	int ret;
> -
> -	put_unaligned_be32(addr, msg);
> -
> -	mutex_lock(&mhdp->mbox_mutex);
> -
> -	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,
> -				     GENERAL_REGISTER_READ,
> -				     sizeof(msg), msg);
> -	if (ret)
> -		goto out;
> -
> -	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_GENERAL,
> -					    GENERAL_REGISTER_READ,
> -					    sizeof(resp));
> -	if (ret)
> -		goto out;
> -
> -	ret = cdns_mhdp_mailbox_recv_data(mhdp, resp, sizeof(resp));
> -	if (ret)
> -		goto out;
> -
> -	/* Returned address value should be the same as requested */
> -	if (memcmp(msg, resp, sizeof(msg))) {
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -
> -	*value = get_unaligned_be32(resp + 4);
> -
> -out:
> -	mutex_unlock(&mhdp->mbox_mutex);
> -	if (ret) {
> -		dev_err(mhdp->dev, "Failed to read register\n");
> -		*value = 0;
> -	}
> -
> -	return ret;
> -}
> -
> -static
> -int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u16 addr, u32 val)
> -{
> -	u8 msg[6];
> -	int ret;
> -
> -	put_unaligned_be16(addr, msg);
> -	put_unaligned_be32(val, msg + 2);
> -
> -	mutex_lock(&mhdp->mbox_mutex);
> -
> -	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> -				     DPTX_WRITE_REGISTER, sizeof(msg), msg);
> -
> -	mutex_unlock(&mhdp->mbox_mutex);
> -
> -	return ret;
> -}
> -
> -static
> -int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16 addr,
> -			    u8 start_bit, u8 bits_no, u32 val)
> -{
> -	u8 field[8];
> -	int ret;
> -
> -	put_unaligned_be16(addr, field);
> -	field[2] = start_bit;
> -	field[3] = bits_no;
> -	put_unaligned_be32(val, field + 4);
> -
> -	mutex_lock(&mhdp->mbox_mutex);
> -
> -	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> -				     DPTX_WRITE_FIELD, sizeof(field), field);
> -
> -	mutex_unlock(&mhdp->mbox_mutex);
> -
> -	return ret;
> -}
> -
>   static
>   int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
>   			u32 addr, u8 *data, u16 len)
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> index bedddd510d17..10c878bf0e63 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> @@ -212,7 +212,6 @@ struct phy;
>   #define MB_MODULE_ID_HDCP_TX			0x07
>   #define MB_MODULE_ID_HDCP_RX			0x08
>   #define MB_MODULE_ID_HDCP_GENERAL		0x09
> -#define MB_MODULE_ID_GENERAL			0x0a
>   
>   /* firmware and opcodes */
>   #define FW_NAME					"cadence/mhdp8546.bin"
> diff --git a/include/drm/bridge/cdns-mhdp-mailbox.h b/include/drm/bridge/cdns-mhdp-mailbox.h
> new file mode 100644
> index 000000000000..9f551bf956a1
> --- /dev/null
> +++ b/include/drm/bridge/cdns-mhdp-mailbox.h
> @@ -0,0 +1,240 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Cadence MHDP Firmware Access API function by Malibox.
> + *
> + * Copyright (C) 2022 NXP Semiconductor, Inc.
> + *
> + */
> +#ifndef CDNS_MHDP_MAILBOX_H
> +#define CDNS_MHDP_MAILBOX_H
> +
> +#include <asm/unaligned.h>
> +#include <linux/iopoll.h>
> +
> +/* mailbox regs offset */
> +#define CDNS_MAILBOX_FULL		0x00008
> +#define CDNS_MAILBOX_EMPTY		0x0000c
> +#define CDNS_MAILBOX_TX_DATA		0x00010
> +#define CDNS_MAILBOX_RX_DATA		0x00014
> +
> +#define MAILBOX_RETRY_US		1000
> +#define MAILBOX_TIMEOUT_US		2000000
> +
> +/* Module ID Code */
> +#define MB_MODULE_ID_GENERAL		0x0A
> +#define MB_MODULE_ID_DP_TX		0x01
> +
> +/* General Commands */
> +#define GENERAL_REGISTER_WRITE		0x05
> +#define GENERAL_REGISTER_READ		0x07
> +
> +/* DP TX Command */
> +#define DPTX_WRITE_FIELD		0x08
> +
> +/* MHDP Firmware access functions by Mailbox */
> +#define cdns_mhdp_mailbox_read(_mhdp) \
> +({ \
> +	int ret, empty, val; \
> +\
> +	WARN_ON(!mutex_is_locked(&(_mhdp)->mbox_mutex)); \
> +\
> +	do {  \
> +		ret = readx_poll_timeout(readl, (_mhdp)->regs + CDNS_MAILBOX_EMPTY,  \
> +					 empty, !empty, MAILBOX_RETRY_US,  \
> +					 MAILBOX_TIMEOUT_US);  \
> +		if (ret < 0)  \
> +			break;  \
> +\
> +		val = readl((_mhdp)->regs + CDNS_MAILBOX_RX_DATA) & 0xff; \
> +	} while (0);  \
> +\
> +	(ret < 0) ? ret : val;  \
> +})

I'd strongly suggest against such complex functions. Could you please at 
least use static inline functions?

Moreover, is this really a part of the drm bridge interface? Should this 
be converted to the proper mailbox device / driver? Otherwise it feels 
like sharing some internal piece of register space, unless I miss something.

> +
> +#define cdns_mhdp_mailbox_write(_mhdp, _val) \
> +({ \
> +	int ret, full;  \
> +\
> +	WARN_ON(!mutex_is_locked(&(_mhdp)->mbox_mutex)); \
> +\
> +	do {  \
> +		ret = readx_poll_timeout(readl, (_mhdp)->regs + CDNS_MAILBOX_FULL,  \
> +					 full, !full, MAILBOX_RETRY_US,  \
> +					 MAILBOX_TIMEOUT_US);  \
> +		if (ret < 0)  \
> +			break;  \
> +\
> +		writel((_val), (_mhdp)->regs + CDNS_MAILBOX_TX_DATA); \
> +	} while (0);  \
> +\
> +	ret; \
> +})
> +
> +#define  cdns_mhdp_mailbox_recv_header(_mhdp, _module_id, _opcode, _req_size) \
> +({  \
> +	u32 mbox_size, i;  \
> +	u8 header[4];  \
> +	int ret;  \
> +\
> +	do {  \
> +		/* read the header of the message */ \
> +		for (i = 0; i < sizeof(header); i++) {  \
> +			ret = cdns_mhdp_mailbox_read(_mhdp);  \
> +			if (ret < 0)  \
> +				break;  \
> +\
> +			header[i] = ret;  \
> +		}  \
> +\
> +		mbox_size = get_unaligned_be16(header + 2);  \
> +\
> +		if ((_opcode) != header[0] || (_module_id) != header[1] ||  \
> +		    (_req_size) != mbox_size) {  \
> +			/* If the message in mailbox is not what we want, we need to
> +			 * clear the mailbox by reading its contents. */  \
> +			for (i = 0; i < mbox_size; i++)   \
> +				if (cdns_mhdp_mailbox_read(_mhdp) < 0)  \
> +					break;  \
> +\
> +			ret = -EINVAL;  \
> +		}  \
> +\
> +		ret = 0; \
> +\
> +	} while (0);  \
> +\
> +	ret;  \
> +})
> +
> +#define cdns_mhdp_mailbox_recv_data(_mhdp, _buff, _buff_size)  \
> +({  \
> +	u32 i;  \
> +	int ret;  \
> +\
> +	do {  \
> +		for (i = 0; i < (_buff_size); i++) {  \
> +			ret = cdns_mhdp_mailbox_read(_mhdp);  \
> +			if (ret < 0)  \
> +				break;  \
> +\
> +			((u8 *)_buff)[i] = ret;  \
> +		}  \
> +\
> +		ret = 0;  \
> +\
> +	} while (0);  \
> +\
> +	ret; \
> +})
> +
> +#define cdns_mhdp_mailbox_send(_mhdp, _module_id, _opcode, _size, _message)  \
> +({  \
> +	u8 header[4];  \
> +	int ret, i;  \
> +\
> +	header[0] = _opcode;  \
> +	header[1] = _module_id;  \
> +	put_unaligned_be16(_size, header + 2);  \
> +\
> +	do {  \
> +		for (i = 0; i < sizeof(header); i++) {  \
> +			ret = cdns_mhdp_mailbox_write(_mhdp, header[i]);  \
> +			if (ret < 0)  \
> +				break;  \
> +		}  \
> +\
> +		for (i = 0; i < _size; i++) {  \
> +			ret = cdns_mhdp_mailbox_write(_mhdp, ((u8 *)_message)[i]);  \
> +			if (ret < 0)  \
> +				break;;  \
> +		}  \
> +		ret = 0;  \
> +	} while (0);  \
> +\
> +	ret;  \
> +})
> +
> +#define cdns_mhdp_reg_read(_mhdp, _addr, _value)  \
> +({  \
> +	u8 msg[4], resp[8];  \
> +	int ret;  \
> +\
> +	put_unaligned_be32(_addr, msg);  \
> +\
> +	mutex_lock(&(_mhdp)->mbox_mutex);  \
> +\
> +	do {  \
> +		ret = cdns_mhdp_mailbox_send(_mhdp, MB_MODULE_ID_GENERAL,  \
> +					     GENERAL_REGISTER_READ,  \
> +					     sizeof(msg), msg);  \
> +		if (ret < 0)  \
> +			break;  \
> +\
> +		ret = cdns_mhdp_mailbox_recv_header(_mhdp, MB_MODULE_ID_GENERAL,  \
> +						    GENERAL_REGISTER_READ,  \
> +						    sizeof(resp));  \
> +		if (ret < 0)  \
> +			break;  \
> +\
> +		ret = cdns_mhdp_mailbox_recv_data(_mhdp, resp, sizeof(resp));  \
> +		if (ret < 0)  \
> +			break;  \
> +\
> +		/* Returned address value should be the same as requested */  \
> +		if (memcmp(msg, resp, sizeof(msg))) {  \
> +			ret = -EINVAL;  \
> +			break;  \
> +		}  \
> +\
> +		*((u32 *)_value) = get_unaligned_be32(resp + 4);  \
> +			ret = 0;  \
> +	} while (0);  \
> +\
> +	mutex_unlock(&(_mhdp)->mbox_mutex);  \
> +	if (ret < 0) {  \
> +		dev_err((_mhdp)->dev, "Failed to read register\n");  \
> +		*((u32 *)_value) = 0;  \
> +	}  \
> +\
> +	ret;  \
> +})
> +
> +#define cdns_mhdp_reg_write(_mhdp, _addr, _val)  \
> +({  \
> +	u8 msg[8];  \
> +	int ret;  \
> +\
> +	put_unaligned_be32(_addr, msg);  \
> +	put_unaligned_be32(_val, msg + 4);  \
> +\
> +	mutex_lock(&(_mhdp)->mbox_mutex);  \
> +\
> +	ret = cdns_mhdp_mailbox_send(_mhdp, MB_MODULE_ID_GENERAL,  \
> +				      GENERAL_REGISTER_WRITE, sizeof(msg), msg);  \
> +\
> +	mutex_unlock(&(_mhdp)->mbox_mutex);  \
> +\
> +	ret;  \
> +})
> +
> +#define cdns_mhdp_reg_write_bit(_mhdp, _addr, _start_bit, _bits_no, _val) \
> +({  \
> +	u8 field[8];  \
> +	int ret;  \
> +\
> +	put_unaligned_be16(_addr, field);  \
> +	field[2] = _start_bit;  \
> +	field[3] = _bits_no;  \
> +	put_unaligned_be32(_val, field + 4);  \
> +\
> +	mutex_lock(&(_mhdp)->mbox_mutex);  \
> +\
> +	ret = cdns_mhdp_mailbox_send((_mhdp), MB_MODULE_ID_DP_TX, \
> +				     DPTX_WRITE_FIELD, sizeof(field), field);  \
> +\
> +	mutex_unlock(&(_mhdp)->mbox_mutex);  \
> +\
> +	ret; \
> +})
> +
> +#endif

-- 
With best wishes
Dmitry

