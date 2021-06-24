Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9643B2660
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 06:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68F16E9DE;
	Thu, 24 Jun 2021 04:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9616E9DE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 04:32:42 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id m17so2286429plx.7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 21:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lTTd4C04SA2E3AghdMNSGn7s0cIff6cdMlZ1vAXtDSA=;
 b=gen7iuSa1fQaov27zr35RQ3fadV1bVakwExJvyoiz/2bAisC/EC2AoCmrVyvbgzPwD
 4nlY18J9+uD30MzVgmESRnwG7KFHNjSUm/oMxYcJ59RgRczKUQERiJGKHqOviBzoxTL6
 0DMxTW3MAk0v0ymifRwSsciaXB//wR52cMlxJYQytRE+5McqSQDKGO7tH4DZkxUOuSo0
 /cwV8keRsZwMejvLjCpil20D/D9pR2P9xM7WhBEGNGM+14jxF7KzzVBhbeHotw0I9eEk
 R6U0KXym1XeZAv1klhqYuOW+UDK8YKQP4tcXjo2hn0YGW7q4CIwqvgSLLeMY6Uo7g/9H
 h0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lTTd4C04SA2E3AghdMNSGn7s0cIff6cdMlZ1vAXtDSA=;
 b=qF3fOEzKY7veXNs2bVrrfEbvti0UcNlfsNVoxPGxOVa3QJUxAjEdNsIbwu6nq4y0Ir
 tbKvhyWyz7HaCkV49VSeVFroUCkBS4wpBeubzcYeAIHDoYwW0fpYWWX3mMplY4lL3Ta3
 p3B2+5hLIUGzR3jZljKegy32uubaDqj/rssa0ZErWEm3mOiRg/3Ip6vCcn40oZW0Wyd1
 NlKa/mctQGrHpLGLLpB7F+MunNCQj8s976XSIr2q3ichqXrcIzuTLQ3An3dmhhFgX0jr
 LNjmZ35TwBgvh5rCknzdOByRdoPOcoNgvwNojRnbx5AuGcVTIvZ91tyJ4C+eeP8WEYp4
 k5hA==
X-Gm-Message-State: AOAM5307GdqGxq1HkxIQUcDAEyJ5T/vyY5F2gobzYADtUZ2g9ETtWtUH
 Sb9fRsJwcMTv5DP7/F9ziC4eFQ==
X-Google-Smtp-Source: ABdhPJzz6vn2zWUKB2ryOpIaYUVQnrSaiXXW5UhtPCB+tqvxcPK98S7Q9smW66yPLcbeUXDhds9k9Q==
X-Received: by 2002:a17:90a:de84:: with SMTP id
 n4mr8712489pjv.62.1624509162441; 
 Wed, 23 Jun 2021 21:32:42 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id 76sm1231543pfu.131.2021.06.23.21.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 21:32:41 -0700 (PDT)
Date: Thu, 24 Jun 2021 10:02:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: opp: Convert to DT schema
Message-ID: <20210624043240.n6m3cdftz75lhm3t@vireshk-i7>
References: <20210623230722.3545986-1-robh@kernel.org>
 <20210623230722.3545986-3-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623230722.3545986-3-robh@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 Georgi Djakov <djakov@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for taking it up :)

On 23-06-21, 17:07, Rob Herring wrote:
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> +$id: http://devicetree.org/schemas/opp/opp-v2-base.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic OPP (Operating Performance Points) Common Binding
> +
> +maintainers:
> +  - Viresh Kumar <viresh.kumar@linaro.org>
> +
> +description: |
> +  Devices work at voltage-current-frequency combinations and some implementations
> +  have the liberty of choosing these. These combinations are called Operating
> +  Performance Points aka OPPs. This document defines bindings for these OPPs
> +  applicable across wide range of devices. For illustration purpose, this document
> +  uses CPU as a device.
> +
> +  This describes the OPPs belonging to a device.
> +
> +select: false
> +
> +properties:
> +  $nodename:
> +    pattern: '^opp-table(-[a-z0-9]+)?$'
> +
> +  opp-shared:
> +    description:
> +      Indicates that device nodes using this OPP Table Node's phandle switch
> +      their DVFS state together, i.e. they share clock/voltage/current lines.
> +      Missing property means devices have independent clock/voltage/current
> +      lines, but they share OPP tables.
> +    type: boolean
> +
> +patternProperties:
> +  '^opp-?[0-9]+$':
> +    type: object
> +    description:
> +      One or more OPP nodes describing voltage-current-frequency combinations.
> +      Their name isn't significant but their phandle can be used to reference an
> +      OPP. These are mandatory except for the case where the OPP table is
> +      present only to indicate dependency between devices using the opp-shared
> +      property.
> +
> +    properties:
> +      opp-hz:
> +        description:
> +          Frequency in Hz, expressed as a 64-bit big-endian integer. This is a
> +          required property for all device nodes, unless another "required"
> +          property to uniquely identify the OPP nodes exists. Devices like power
> +          domains must have another (implementation dependent) property.
> +
> +      opp-peak-kBps:
> +        description:
> +          Peak bandwidth in kilobytes per second, expressed as an array of
> +          32-bit big-endian integers. Each element of the array represents the
> +          peak bandwidth value of each interconnect path. The number of elements
> +          should match the number of interconnect paths.
> +        minItems: 1
> +        maxItems: 32  # Should be enough

Can we move this down, closer to opp-avg-kBps ?

> +
> +      opp-microvolt:
> +        description: |
> +          Voltage for the OPP
> +
> +          A single regulator's voltage is specified with an array of size one or three.
> +          Single entry is for target voltage and three entries are for <target min max>
> +          voltages.
> +
> +          Entries for multiple regulators shall be provided in the same field separated
> +          by angular brackets <>. The OPP binding doesn't provide any provisions to
> +          relate the values to their power supplies or the order in which the supplies
> +          need to be configured and that is left for the implementation specific
> +          binding.
> +
> +          Entries for all regulators shall be of the same size, i.e. either all use a
> +          single value or triplets.
> +        minItems: 1
> +        maxItems: 8

For consistency with rest of the doc, maybe add

# Should be enough regulators

> +        items:
> +          minItems: 1
> +          maxItems: 3
> +
> +      opp-microamp:
> +        description: |
> +          The maximum current drawn by the device in microamperes considering
> +          system specific parameters (such as transients, process, aging,
> +          maximum operating temperature range etc.) as necessary. This may be
> +          used to set the most efficient regulator operating mode.
> +
> +          Should only be set if opp-microvolt(-name)? is set for the OPP.

What is the significance of '?' here ?

> +
> +          Entries for multiple regulators shall be provided in the same field
> +          separated by angular brackets <>. If current values aren't required
> +          for a regulator, then it shall be filled with 0. If current values
> +          aren't required for any of the regulators, then this field is not
> +          required. The OPP binding doesn't provide any provisions to relate the
> +          values to their power supplies or the order in which the supplies need
> +          to be configured and that is left for the implementation specific
> +          binding.
> +        minItems: 1
> +        maxItems: 8   # Should be enough regulators
> +        items:
> +          minItems: 1
> +          maxItems: 3

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
