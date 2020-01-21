Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA47144D78
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390966FAF6;
	Wed, 22 Jan 2020 08:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C989C6ED29
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 15:11:21 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t14so3443084wmi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 07:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:subject:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kV29KCb1tTjsoAawp5eJRY4AocgYk483wI8KhDn3Mn0=;
 b=RUX/r9XczXOUQ8uWuvKZBE0mKNBA3OSB7liIzJ9cde+h/JBPVxnlsyHI+9HaqUxGzn
 6yeNjvGkLD2sZLLRct9PvTBZTkHCpMeBPq0ABBHZK5jmDShaa8+7PMnME8xcH9Je/OnY
 GW4kOJYOuoGiYn3jMem/accrJTGgFIKAe4P2m8Je5AjyPOl+gsHDC5IjObvHxbx4Ao4e
 3K5b1jgZHS1jqW2kYjOd56PFBDBdarIM8I/VjrX1FpoLplXu4bIuFbnPaCt+rBmlVm/T
 EwB3t9OyeVSsyosVjzVZ8vCcl8UDJiALvyHjNfh0kzvPEm0l/T0oMwqys25Z9x7uxcBa
 mKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:subject:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kV29KCb1tTjsoAawp5eJRY4AocgYk483wI8KhDn3Mn0=;
 b=NDvf8lnUaPk+lhH3SlBCU0Cp1wMA/FTb3rViQjit2NzxbOpnf9M9z3fRdyEEra+sBH
 ywgv59jfn/rHAFeD0k1s3rhlrK1lVkUKXqtRoAchpKC/YXhdGUeHO/eRyI9paKn4pvvN
 loBGbfyCbvHX1JIWMC44s7YwUKXPvkjK+oPYgco1QtPzewCbtFsNTW5UKZpWQ2iuZroS
 p3hV67RzBHW3Ej7tqHKqtUaXYUoceoIKmjyaYI9r3e+Xzot57YeFtoN7esHJOeWqhgN1
 3xrpVRP+VbmzLZHDgpoBcryn13/23I6/l/3IVzHWtLuRuC5/kii2lKuUbokE/sY4OZL+
 +sPg==
X-Gm-Message-State: APjAAAWG4RshmuBN+aUQdUWKcSAaDH+vKnMMlkajOHBAwOaVY7BPesob
 E9kCvRCesLpf439x3mOrGgA=
X-Google-Smtp-Source: APXvYqzVxW20eNVZ9aiYI5P39LBGVZIhsGs+GUktDebjr7JOrRBt1iJHlF1C395ejIGm9PyahohwIg==
X-Received: by 2002:a1c:5f06:: with SMTP id t6mr4912501wmb.32.1579619480435;
 Tue, 21 Jan 2020 07:11:20 -0800 (PST)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id v83sm4639782wmg.16.2020.01.21.07.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 07:11:19 -0800 (PST)
To: dafna.hirschfeld@collabora.com
References: <6371f95f-8bf8-47c9-021e-b23006f25405@collabora.com>
Subject: Re: [PATCH v2] dt-bindings: convert rockchip-drm.txt to
 rockchip-drm.yaml
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <573dc6d1-5857-f3ba-a392-67351db727b5@gmail.com>
Date: Tue, 21 Jan 2020 16:11:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <6371f95f-8bf8-47c9-021e-b23006f25405@collabora.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dafna,


> 
> 
> On 21.01.20 15:03, Rob Herring wrote:
>> On Tue, Jan 21, 2020 at 6:35 AM Dafna Hirschfeld
>> <dafna.hirschfeld@collabora.com> wrote:
>>>
>>> convert the binding file rockchip-drm.txt to yaml format.
>>> This was tested and verified with:
>>> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>> 
>> Also, make sure just 'make dt_binding_check' passes as that checks the
>> example against all schemas.
> 
> But this also checks the other schemas in general, and when running it, 
> it fails because of bugs in other schemas.


> For example with arm=ARM I get:

Use:

# enable Rockchip arm in menuconfig
make ARCH=arm menuconfig

make ARCH=arm dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

and not:
arm=ARM


> 
>    DTC     Documentation/devicetree/bindings/clock/qcom,gcc.example.dt.yaml
> Error: 
> Documentation/devicetree/bindings/clock/qcom,gcc.example.dts:111.28-29 
> syntax error
> FATAL ERROR: Unable to parse input tree
> 
> Dafna
> 
>> 
>>> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
