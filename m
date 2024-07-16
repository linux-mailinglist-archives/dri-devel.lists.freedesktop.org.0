Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476F393349A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 01:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFD610E047;
	Tue, 16 Jul 2024 23:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="TMVyc/ql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B8710E188
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 23:37:14 +0000 (UTC)
X-Envelope-To: quic_jesszhan@quicinc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1721173032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7mf7OJxEsHyAunC8Cz4xNF222LK4yVJ9agT364lWSU=;
 b=TMVyc/qlFguB4JmZwqNE5+Gh0YuV5Rnk+iWipvno09SXTHNT+WXA9Z+Bd6ctZCTzKQIMrd
 0qtgS27R0hTFJfsofdCKd7sRBnlpeGrWpY1AL7+zOOsahNHDFJih73yc8tM60CR32sWvIZ
 7MHXZnA4O1e0dFcbhrSaXWJx2s2TA9QEn6ZGZo+dYLSFSLF11Goc0ysv8JrF/EwBDotrZc
 l9FkYOok6jEwGVrxjnrm4eLkLkPtj/FR9YVF12IzARcPm3Aj2RxpljCcA+/Tf58dvPeA/M
 7CCmYabsoh9xgL1rPapmTkr3XX5D1gpP5mI9sCU3+6TkBnS/Z/xojZR3id2WKg==
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: andersson@kernel.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
Message-ID: <75345386-3679-4314-88d7-8a40827b6562@postmarketos.org>
Date: Wed, 17 Jul 2024 01:37:08 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/8] drm: mipi: add mipi_dsi_generic_write_multi_type()
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Henrik Rydberg <rydberg@bitmath.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-4-c4a1f8da74f1@postmarketos.org>
 <606ddebb-c98c-47da-93d7-a387dbb6df22@quicinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
In-Reply-To: <606ddebb-c98c-47da-93d7-a387dbb6df22@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi Jessica,

On 12/07/2024 23:39, Jessica Zhang wrote:
> 
> 
> On 6/30/2024 11:36 AM, Caleb Connolly wrote:
>> Some panels like the Samsung AMB655X use long write commands for all
>> non-standard messages and do not work when trying to use the appropriate
>> command type.
>>
>> Support these panels by introducing a new helper to send commands of a
>> specific type, overriding the normal rules.
>>
>> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
>> ---
>>   drivers/gpu/drm/drm_mipi_dsi.c | 40 
>> ++++++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_mipi_dsi.h     | 16 ++++++++++++++++
>>   2 files changed, 56 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c 
>> b/drivers/gpu/drm/drm_mipi_dsi.c
>> index a471c46f5ca6..f2c7f3f23a6e 100644
>> --- a/drivers/gpu/drm/drm_mipi_dsi.c
>> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
>> @@ -819,8 +819,48 @@ void mipi_dsi_generic_write_multi(struct 
>> mipi_dsi_multi_context *ctx,
>>       }
>>   }
>>   EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
>> +/**
>> + * mipi_dsi_generic_write_raw_multi() - transmit data using a generic 
>> write packet of
>> + * a specific type
>> + * @ctx: Context for multiple DSI transactions
>> + * @type: data type of the packet
>> + * @payload: buffer containing the payload
>> + * @size: size of payload buffer
>> + *
>> + * This function will automatically choose the right data type 
>> depending on
>> + * the payload length.
> 
> Hi Caleb,
> 
> I'm a bit confused by the wording here. By "automatically", do you mean 
> the chosen by the macro calling this function?

Hmm, nope, looks like i either got this description totally wrong or 
copied it from somewhere and forgot to change it. I'll fix this in the 
next revision.

Kind regards,
> 
> Thanks,
> 
> Jessica Zhang
> 
>> + *
>> + * Return: The number of bytes transmitted on success or a negative 
>> error code
>> + * on failure.
>> + */
>> +ssize_t mipi_dsi_generic_write_raw_multi(struct 
>> mipi_dsi_multi_context *ctx,
>> +                      u8 type, const void *payload, size_t size)
>> +{
>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>> +    struct mipi_dsi_msg msg = {
>> +        .channel = dsi->channel,
>> +        .tx_buf = payload,
>> +        .tx_len = size,
>> +        .type = type,
>> +    };
>> +    ssize_t ret;
>> +
>> +    if (ctx->accum_err)
>> +        return 0;
>> +
>> +    ret = mipi_dsi_device_transfer(dsi, &msg);
>> +    if (ret < 0) {
>> +        ctx->accum_err = ret;
>> +        dev_err(&dsi->dev, "sending generic data %*ph failed: %zd\n",
>> +            (int)size, payload, ret);
>> +    }
>> +
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL(mipi_dsi_generic_write_raw_multi);
>> +
>>   /**
>>    * mipi_dsi_generic_read() - receive data using a generic read packet
>>    * @dsi: DSI peripheral device
>>    * @params: buffer containing the request parameters
>> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
>> index 71d121aeef24..fb23f4e3b94e 100644
>> --- a/include/drm/drm_mipi_dsi.h
>> +++ b/include/drm/drm_mipi_dsi.h
>> @@ -287,8 +287,10 @@ ssize_t mipi_dsi_generic_write(struct 
>> mipi_dsi_device *dsi, const void *payload,
>>   int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
>>                     const void *payload, size_t size);
>>   void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
>>                     const void *payload, size_t size);
>> +ssize_t mipi_dsi_generic_write_raw_multi(struct 
>> mipi_dsi_multi_context *ctx, u8 type,
>> +                    const void *payload, size_t size);
>>   ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const 
>> void *params,
>>                     size_t num_params, void *data, size_t size);
>>   #define mipi_dsi_msleep(ctx, delay)    \
>> @@ -432,8 +434,22 @@ void mipi_dsi_dcs_set_tear_on_multi(struct 
>> mipi_dsi_multi_context *ctx,
>>           static const u8 d[] = { cmd, seq };                     \
>>           mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
>>       } while (0)
>> +/**
>> + * mipi_dsi_dcs_write_long_multi - transmit a DCS long command with 
>> payload
>> + * @ctx: Context for multiple DSI transactions
>> + * @cmd: Commands
>> + * @seq: buffer containing data to be transmitted
>> + */
>> +#define mipi_dsi_dcs_write_long_multi(ctx, cmd, 
>> seq...)                    \
>> +    do {                                                               \
>> +        static const u8 d[] = { cmd, seq };                        \
>> +        mipi_dsi_generic_write_raw_multi(ctx,                      \
>> +                          MIPI_DSI_DCS_LONG_WRITE, \
>> +                          d, ARRAY_SIZE(d));       \
>> +    } while (0)
>> +
>>   /**
>>    * struct mipi_dsi_driver - DSI driver
>>    * @driver: device driver model driver
>>    * @probe: callback for device binding
>>
>> -- 
>> 2.45.0
>>
