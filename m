Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D14715EB8
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 14:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0257710E149;
	Tue, 30 May 2023 12:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBDD10E037;
 Tue, 30 May 2023 12:15:28 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AA6186606E94;
 Tue, 30 May 2023 13:15:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685448925;
 bh=4wNEnxY6LQ6QUhnOBO99wgPeevp5yEWOIVnYVgFq2ok=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K9Xc5p9TKYcf8khiFK1yY4EMlDkotGT1R4P4TK35EuA84Fs9v/gwwCy3V9jQpBwUb
 tazT0TXpsYhyI+TofjuTvsn7XaigKSBo3YYNoBoeBuGDn/zWOhY+wV9CCFuYchm8DW
 M5tWdBaEnadB6CXH8kqUxo4PmbdNFtvGTtiMFy1MpZ5yU1pkgD3ak0SN8RV0AGx5qE
 De742jKhCiI+Hf4+nj1TNNkSM2bjp6JEzA1maq2nP4wJi0H5TRXkcy3kR6wQr8dSmD
 eaZsGJGQwG78nf5hxCnXw3fUbpekqi8mh++i44zXGbtJhYMphjUNtRpqXSrmF8r4jq
 o3wF1rqlcjfGA==
Message-ID: <739a8bd9-9ff0-5072-fdae-b64efdf86842@collabora.com>
Date: Tue, 30 May 2023 14:15:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: RFC: DSI host capabilities (was: [PATCH RFC 03/10] drm/panel: Add
 LGD panel driver for Sony Xperia XZ3)
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
 <617c8f8a-1fc7-c6a0-eaa5-ce75ff2adc1b@linaro.org>
 <CAA8EJppG=MAVpK1J_8bNnkJ23y9NtgY7a2GVResXJvhEKyNsrw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAA8EJppG=MAVpK1J_8bNnkJ23y9NtgY7a2GVResXJvhEKyNsrw@mail.gmail.com>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 30/05/23 13:44, Dmitry Baryshkov ha scritto:
> On Tue, 30 May 2023 at 10:24, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Hi Marijn, Dmitry, Caleb, Jessica,
>>
>> On 29/05/2023 23:11, Marijn Suijten wrote:
>>> On 2023-05-22 04:16:20, Dmitry Baryshkov wrote:
>>> <snip>
>>>>> +   if (ctx->dsi->dsc) {
>>>>
>>>> dsi->dsc is always set, thus this condition can be dropped.
>>>
>>> I want to leave room for possibly running the panel without DSC (at a
>>> lower resolution/refresh rate, or at higher power consumption if there
>>> is enough BW) by not assigning the pointer, if we get access to panel
>>> documentation: probably one of the magic commands sent in this driver
>>> controls it but we don't know which.
>>
>> I'd like to investigate if DSC should perhaps only be enabled if we
>> run non certain platforms/socs ?
>>
>> I mean, we don't know if the controller supports DSC and those particular
>> DSC parameters so we should probably start adding something like :
>>
>> static drm_dsc_config dsc_params_qcom = {}
>>
>> static const struct of_device_id panel_of_dsc_params[] = {
>>          { .compatible = "qcom,sm8150", , .data = &dsc_params_qcom },
>>          { .compatible = "qcom,sm8250", , .data = &dsc_params_qcom },
>>          { .compatible = "qcom,sm8350", , .data = &dsc_params_qcom },
>>          { .compatible = "qcom,sm8450", , .data = &dsc_params_qcom },
>> };
> 
> I think this would damage the reusability of the drivers. The panel
> driver does not actually care if the SoC is SM8350, sunxi-something or
> RCar.
> Instead it cares about host capabilities.
> 
> I think instead we should extend mipi_dsi_host:
> 
> #define MIPI_DSI_HOST_MODE_VIDEO BIT(0)
> #define MIPI_DSI_HOST_MODE_CMD  BIT(1)
> #define MIPI_DSI_HOST_VIDEO_SUPPORTS_COMMANDS BIT(2)
> // FIXME: do we need to provide additional caps here ?
> 
> #define MIPI_DSI_DSC_1_1 BIT(0)
> #define MIPI_DSI_DSC_1_2 BIT(1)
> #define MIPI_DSI_DSC_NATIVE_422 BIT(2)
> #define MIPI_DSI_DSC_NATIVE_420 BIT(3)
> #define MIPI_DSI_DSC_FRAC_BPP BIT(4)
> // etc.
> 
> struct mipi_dsi_host {
>   // new fields only
>    unsigned long mode_flags;
>    unsigned long dsc_flags;
> };
> 
> Then the panel driver can adapt itself to the host capabilities and
> (possibly) select one of the internally supported DSC profiles.
> 

I completely agree about extending mipi_dsi_host, other SoCs could reuse that and
support for DSC panels would become a lot cleaner.

For example, on MediaTek DRM there's some support for DSC, more or less the same
for SPRD DRM and some DSI bridge drivers... having a clean infrastructure would
definitely help.

I'm sad I cannot offer testing in that case because despite being sure that there
are MTK smartphones around with DSI panels using DSC, I have none... and all of the
Chromebooks are not using DSC anyway (but using DisplayPort compression, which is
obviously an entirely different beast).

>>
>> ...
>> static int sony_akatsuki_lgd_probe(struct mipi_dsi_device *dsi)
>> ...
>>          const struct of_device_id *match;
>>
>> ...
>>          match = of_match_node(panel_of_dsc_params, of_root);
>>          if (match && match->data) {
>>                  dsi->dsc = devm_kzalloc(&dsi->dev, sizeof(*dsc), GFP_KERNEL);
>>                  memcpy(dsi->dsc, match->data, sizeof(*dsc));
>>          } else {
>>                  dev_warn(&dsi->dev, "DSI controller is not marked as supporting DSC\n");
>>          }
>> ...
>> }
>>
>> and probably bail out if it's a DSC only panel.
>>

Usually DDICs support both DSC and non-DSC modes, depending on the initial
programming (read: init commands)... but the usual issue is that many DDICs
are not publicly documented for reasons, so yes, bailing out if DSC is not
supported would be the only option, and would be fine at this point.

Cheers,
Angelo

>> We could alternatively match on the DSI controller's dsi->host->dev instead of the SoC root compatible.
>>
>> Neil
> 

