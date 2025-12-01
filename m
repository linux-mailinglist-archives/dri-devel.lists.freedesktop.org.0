Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01347C97BF4
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 14:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA7E10E417;
	Mon,  1 Dec 2025 13:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="VMuTgqUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com
 [162.62.57.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F96810E420
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 13:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1764597454;
 bh=VBy+8qDfsL7EqwCP54AMVys1BPzcaJ9q5zou21zg8BQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=VMuTgqUrGH1+zW+hQp1CkGnZH4FafsR25kBwX+zn7ynxGz8Oz2BlDAMWBw3YVeiBe
 MPny4EDaoUuxXcZmTvBTrQukMnQ1u8qvbhvNKnvgtInU7CB/ozOZr6dZXs5hyA67gm
 HN1pJcOYRMzaovnLtoHs+sodDILkOTH6BIAgdwvE=
Received: from [198.18.0.1] ([171.223.167.52])
 by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
 id E5E9842A; Mon, 01 Dec 2025 21:57:30 +0800
X-QQ-mid: xmsmtpt1764597450t8pul6w7l
Message-ID: <tencent_155071AA73556B4DD22BEC8599C05AC8A406@qq.com>
X-QQ-XMAILINFO: MJf32pulH481bGVQsT4W28f7hBaG1205FFOakRe2x0cPywrVUuCUitLbVFiybY
 mgml9qCwTgeok+SsS5MKngkJ05ffalXR+4JD25H7B0CWB9QHn8dC3X5EVbd8oZwJ/LOHQ9zXMmgE
 txbR/DD87fk6OyikjKpIP6mzfoOhda9EfwUXF959qg9avAlSodjAVo7QvIantcPqJKCg63y2NWdh
 GBSxYC79IwLyLXXCqzAupMtfGOP3LJlbSbuOHpVblpjcsDqUYWANhJEq3K/9qZEClx4+EfFD6fyG
 cNOjz2+ftfiJQtufonZchwBtTib85LauDWVX1RpA1bMvHrxkPyXuoUlisU4bQU6sL4MLqSBdFsWE
 xZ8742ln4WyMQUyuyp59rWiAdix7PLoI88Qy9tM3Cd399UrGxk7mq7AwrPOK3514axuiYZPTMMAy
 lYbJG8otTTRHNrjOyF8gn9eFTeLipNr5Nh4OlHxhq5+H0y/yIlxyA0jzudArw6hYyCUG8+v9nzXu
 EmRQNrowLUBEX76bZf1T5l2HnVsIPK+IQ8J369XgFeZ4OtJoKCwUaj6NJlKklDWFx2afKX2rH5S/
 URXnTg9HXe8/uinvKs9bHi38qXg3hUvnpySyYPmQaRq6NgbAPyIY/IDul3AIX5mdiy7Q33eixzlO
 bvODrFrblH0rJmFgFFZD3tU8A4xP7Q78eygfW/CEcg583C6tqY3aVV+SSmXCQgYrY7Rew1pGrQts
 mfPPr1XUOVX6+Lj/n/EvMfD8/A644JtudlZv9zn0UpmKPbwgzXL2YgceV6mw38UloLYPJR9FUlaE
 WecT5pZ5q2lSiuB9pTA7xiNyI3Z/k+RqKXrJPpOQgDueyNQwE5MK1NqFbU8kPmrL4T1NkJC32xtw
 +iSX8I8fIw0oVsW6Sxgpp/mJa2vHORHbPuNzibljU9N4GDUNoi8573ddOrKexNrBjoKJl7S2DX3k
 0oAI+AAnP+HWFpp5Cm6GY7Tl7psEUpK7uZiyVxqBgUgjgkM7ZAH95IIJtlAVrT/x3cwSIFaRWmxi
 LEAehR74CmehhOHo7TfjjXMyJ6C93rNrt0cuHyGGWg36cEyVNgy+Jb53OC8oFc4i4NUWCOVso+Tk
 Kj54o9qJDbvXmqb4u6wfGYkAmP8Q==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-OQ-MSGID: <8c838e04-5e4a-4eca-a8e1-388a4e0b416b@foxmail.com>
Date: Mon, 1 Dec 2025 21:57:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add HannStar HSD156JUW2
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: thierry.reding@gmail.com, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mripard@kernel.org, airlied@gmail.com, neil.armstrong@linaro.org,
 devicetree@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 jessica.zhang@oss.qualcomm.com, tzimmermann@suse.de, simona@ffwll.ch,
 sam@ravnborg.org, krzk+dt@kernel.org, renjunw0@foxmail.com
References: <tencent_FD75580BB3BF35F44985E237E7DE56BE2407@qq.com>
 <176451574938.1028542.3454025128487626115.robh@kernel.org>
Content-Language: en-US
From: Renjun Wang <renjunw0@foxmail.com>
In-Reply-To: <176451574938.1028542.3454025128487626115.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 11/30/25 23:15, Rob Herring (Arm) wrote:
> On Sun, 30 Nov 2025 22:35:27 +0800, Renjun Wang wrote:
>> Add the HannStar HSD156JUW2 15.6" FHD (1920x1080) TFT LCD panel to
>> the panel-simple compatible list.
>>
>> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
>> ---
>>   .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>>   1 file changed, 2 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/tencent_FD75580BB3BF35F44985E237E7DE56BE2407@qq.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

Hi Rob,

     I ran 'make dt_binding_check' on my local computer, there are no 
errors and warnings

about panel-simple.yaml, thermal-sensor.yaml and thermal-zones.yaml. My 
checking process output shown blow:

(env0) renjun@debian:~/linux$ make dt_binding_check 
DT_SCHEMA_FILES=panel-simple.yaml
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   CHKDT   ./Documentation/devicetree/bindings
   LINT    ./Documentation/devicetree/bindings
   DTEX 
Documentation/devicetree/bindings/display/panel/panel-simple.example.dts
   DTC [C] 
Documentation/devicetree/bindings/display/panel/panel-simple.example.dtb
(env0) renjun@debian:~/linux$ make dt_binding_check 
DT_SCHEMA_FILES=thermal-sensor.yaml
   CHKDT   ./Documentation/devicetree/bindings
   LINT    ./Documentation/devicetree/bindings
   DTC [C] 
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb
(env0) renjun@debian:~/linux$ make dt_binding_check 
DT_SCHEMA_FILES=thermal-zones.yaml
   CHKDT   ./Documentation/devicetree/bindings
   LINT    ./Documentation/devicetree/bindings
   DTC [C] 
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb
(env0) renjun@debian:~/linux$ pip3 list|grep dtschema
dtschema           2025.8
(env0) renjun@debian:~/linux$ yamllint -v
yamllint 1.29.0

Best Regards,

Renjun Wang


