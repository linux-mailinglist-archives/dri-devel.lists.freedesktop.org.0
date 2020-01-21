Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A338144D88
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2A66FAE5;
	Wed, 22 Jan 2020 08:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C292B6ED31
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 15:26:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id C679F28C03C
Subject: Re: [PATCH v2] dt-bindings: convert rockchip-drm.txt to
 rockchip-drm.yaml
To: Johan Jonker <jbx6244@gmail.com>
References: <6371f95f-8bf8-47c9-021e-b23006f25405@collabora.com>
 <573dc6d1-5857-f3ba-a392-67351db727b5@gmail.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <7c79efd2-f5b0-6736-19b0-4d116714f887@collabora.com>
Date: Tue, 21 Jan 2020 16:26:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <573dc6d1-5857-f3ba-a392-67351db727b5@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 dafna3@gmail.com, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, helen.koike@collabora.com,
 robh+dt@kernel.org, kernel@collabora.com, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21.01.20 16:11, Johan Jonker wrote:
> Hi Dafna,
> 
> 
>>
>>
>> On 21.01.20 15:03, Rob Herring wrote:
>>> On Tue, Jan 21, 2020 at 6:35 AM Dafna Hirschfeld
>>> <dafna.hirschfeld@collabora.com> wrote:
>>>>
>>>> convert the binding file rockchip-drm.txt to yaml format.
>>>> This was tested and verified with:
>>>> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>>>
>>> Also, make sure just 'make dt_binding_check' passes as that checks the
>>> example against all schemas.
>>
>> But this also checks the other schemas in general, and when running it,
>> it fails because of bugs in other schemas.
> 
> 
>> For example with arm=ARM I get:
> 
> Use:
> 
> # enable Rockchip arm in menuconfig
> make ARCH=arm menuconfig
> 
> make ARCH=arm dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 
> and not:
> arm=ARM
> 
yes, sorry, this is what I did. When running with the DT_SCHEMA_FILES 
set then it passes both on ARM and ARM64
but when this variable is not set I get the above error.

Dafna

> 
>>
>>     DTC     Documentation/devicetree/bindings/clock/qcom,gcc.example.dt.yaml
>> Error:
>> Documentation/devicetree/bindings/clock/qcom,gcc.example.dts:111.28-29
>> syntax error
>> FATAL ERROR: Unable to parse input tree
>>
>> Dafna
>>
>>>
>>>> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>>>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
