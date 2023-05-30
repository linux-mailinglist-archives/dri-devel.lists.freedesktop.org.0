Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9A27156A1
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8625610E352;
	Tue, 30 May 2023 07:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731D910E352
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:24:28 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f6cbdf16d2so26607255e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 00:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685431466; x=1688023466;
 h=content-transfer-encoding:in-reply-to:subject:organization
 :references:cc:to:content-language:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3I07vAEecFzrsjsVE9f8408EJbUoemH3VbQP/pvyq0o=;
 b=Z4iMUc8I4mYDKowOA3j9094HmVweQiDz9dbUui86MbD/5GfslWwlTRQxJxTRu2j4bb
 s5DAGSzIai/XfJrBrEJfFWBXKtHt/MQu3yJPGOFDWesqc8/opbVwMqlVcNfsTsGfHvOd
 7nwJpNR3YqsF7eRcLBt5F7cJlA/pvhNfBdtoULbxV+oMRm2D3kHO5Z587Afxx4nP7Hku
 gaJDTUKrYCpCDcsjvhWLqP4qQsND+t/4ljUREljBMvKnrPdv/RSpfTce1WvgfXMzip6b
 NHsXkR5YtCA5bZ6Ph2PoBFjG+m0j4WzyNTvDa4V4iC80158/KFksx53cMa4086asAhuG
 vdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685431466; x=1688023466;
 h=content-transfer-encoding:in-reply-to:subject:organization
 :references:cc:to:content-language:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3I07vAEecFzrsjsVE9f8408EJbUoemH3VbQP/pvyq0o=;
 b=BNdYDcHK8DqSvqEBf7p9TqbxqvsbV1bBKNOjJ8AUf8sXJ/Kb5FGZS1sdpYgfn5aqnZ
 rkqO8L2vZDR2vSsKiMY4UZQUGyg6iPmy7ko0+bKNxR/+FDMFJa9rlOHV/1obebFXsfrV
 TLyqUXsIcaeggbWSfh63iWJlGxBLGzmZJns10/rvQiC56JIXsjUg+63A9+P60BIUDZ7H
 6og3XshbtEEoLgfLXkRPvDbLRZe+osdVgWP4w3xiY+nLZvQMwxcGF6ckh1cbYYqTVpvG
 /1N9d3KspbtXNuL7sCf8/S+M1RSuyUDAoQkgfcC3ZZcn8qCrZeGwboctn21+8sbuBtO0
 iEpw==
X-Gm-Message-State: AC+VfDxv4fF8H3ku+CQWefIyDz1X/hxLY5uJUCX1yPBigJhjzc/waC2I
 P2dpUwEgI25K8vBvJxkxEykN9Q==
X-Google-Smtp-Source: ACHHUZ58qsQBRk2dHD/eWA5ULkS1FSwEEPsv+OGKs4QRSpWa05Iabdz4F0KQemDxDPmDQI1jbpsLlQ==
X-Received: by 2002:a05:6000:371:b0:307:9d2a:fd35 with SMTP id
 f17-20020a056000037100b003079d2afd35mr823799wrf.53.1685431466027; 
 Tue, 30 May 2023 00:24:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4294:2221:d2df:9e87?
 ([2a01:e0a:982:cbb0:4294:2221:d2df:9e87])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a5d4103000000b003047d5b8817sm2219893wrp.80.2023.05.30.00.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 00:24:25 -0700 (PDT)
Message-ID: <617c8f8a-1fc7-c6a0-eaa5-ce75ff2adc1b@linaro.org>
Date: Tue, 30 May 2023 09:24:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Caleb Connolly <caleb@connolly.tech>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
Organization: Linaro Developer Services
Subject: Re: [PATCH RFC 03/10] drm/panel: Add LGD panel driver for Sony Xperia
 XZ3
In-Reply-To: <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marijn, Dmitry, Caleb, Jessica,

On 29/05/2023 23:11, Marijn Suijten wrote:
> On 2023-05-22 04:16:20, Dmitry Baryshkov wrote:
> <snip>
>>> +	if (ctx->dsi->dsc) {
>>
>> dsi->dsc is always set, thus this condition can be dropped.
> 
> I want to leave room for possibly running the panel without DSC (at a
> lower resolution/refresh rate, or at higher power consumption if there
> is enough BW) by not assigning the pointer, if we get access to panel
> documentation: probably one of the magic commands sent in this driver
> controls it but we don't know which.

I'd like to investigate if DSC should perhaps only be enabled if we
run non certain platforms/socs ?

I mean, we don't know if the controller supports DSC and those particular
DSC parameters so we should probably start adding something like :

static drm_dsc_config dsc_params_qcom = {}

static const struct of_device_id panel_of_dsc_params[] = {
	{ .compatible = "qcom,sm8150", , .data = &dsc_params_qcom },
	{ .compatible = "qcom,sm8250", , .data = &dsc_params_qcom },
	{ .compatible = "qcom,sm8350", , .data = &dsc_params_qcom },
	{ .compatible = "qcom,sm8450", , .data = &dsc_params_qcom },
};

...
static int sony_akatsuki_lgd_probe(struct mipi_dsi_device *dsi)
...
	const struct of_device_id *match;

...
	match = of_match_node(panel_of_dsc_params, of_root);
	if (match && match->data) {
		dsi->dsc = devm_kzalloc(&dsi->dev, sizeof(*dsc), GFP_KERNEL);
		memcpy(dsi->dsc, match->data, sizeof(*dsc));
	} else {
		dev_warn(&dsi->dev, "DSI controller is not marked as supporting DSC\n");
	}
...
}

and probably bail out if it's a DSC only panel.

We could alternatively match on the DSI controller's dsi->host->dev instead of the SoC root compatible.

Neil

> 
>>> +		drm_dsc_pps_payload_pack(&pps, ctx->dsi->dsc);
>>> +
>>> +		ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
>>> +		if (ret < 0) {
>>> +			dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
>>> +			goto fail;
>>> +		}
>>> +		ret = mipi_dsi_compression_mode(ctx->dsi, true);
>>> +		if (ret < 0) {
>>> +			dev_err(dev, "failed to enable compression mode: %d\n", ret);
>>> +			goto fail;
>>> +		}
>>> +
>>> +		msleep(28);
>>> +	}
>>> +
>>> +	ctx->prepared = true;
>>> +	return 0;
>>> +
>>> +fail:
>>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>> +	regulator_disable(ctx->vddio);
>>> +	return ret;
>>> +}
> <snip>
>>> +	/* This panel only supports DSC; unconditionally enable it */
> 
> On that note I should perhaps reword this.
> 
>>> +	dsi->dsc = dsc = devm_kzalloc(&dsi->dev, sizeof(*dsc), GFP_KERNEL);
>>
>> I think double assignments are frowned upon.
> 
> Ack.
> 
>>
>>> +	if (!dsc)
>>> +		return -ENOMEM;
>>> +
>>> +	dsc->dsc_version_major = 1;
>>> +	dsc->dsc_version_minor = 1;
>>> +
>>> +	dsc->slice_height = 32;
>>> +	dsc->slice_count = 2;
>>> +	// TODO: Get hdisplay from the mode
>>
>> Would you like to fix the TODO?
> 
> I can't unless either migrating to drm_bridge (is that doable?) or
> expand drm_panel.  That's a larger task, but I don't think this driver
> is the right place to track that desire.  Should I drop the comment
> entirely or reword it?
> 
>>> +	WARN_ON(1440 % dsc->slice_count);
>>> +	dsc->slice_width = 1440 / dsc->slice_count;
> 
> <snip>
> 
> - Marijn

