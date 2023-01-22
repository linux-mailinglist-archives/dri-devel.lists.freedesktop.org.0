Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17D5677116
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 18:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1144710E195;
	Sun, 22 Jan 2023 17:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 93130 seconds by postgrey-1.36 at gabe;
 Sun, 22 Jan 2023 17:28:32 UTC
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E245D10E195
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 17:28:32 +0000 (UTC)
Message-ID: <bb31312f-ab63-e4e7-7bb0-d34e1ef345b9@ansari.sh>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
 t=1674408510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVnhlHIDXW8jM0hViaqzzoOuRaBb3rDy5+wV/MVwuS4=;
 b=dwkapQ5Hg/qahMqBQJTWwe99k/8s4VKcUOPtPA+dRpp8wV+riCewU05EGVJ3GM+77fs8fm
 ZzGdLMyxempHcH8WttqXgRruWKnH15FBPMFqIT6FosRNvjw/2UYvpHhAuAnEMUYQUP9bEE
 fPYJoMoPzvJxgCS2EFhV69FnsbEkRy4=
Date: Sun, 22 Jan 2023 17:28:29 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple-framebuffer: Document
 physical width and height properties
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-3-rayyan@ansari.sh>
 <167440123887.2283488.2841716718270566192.robh@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Rayyan Ansari <rayyan@ansari.sh>
In-Reply-To: <167440123887.2283488.2841716718270566192.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 asahi@lists.linux.dev, janne@jannau.net, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/01/2023 15:31, Rob Herring wrote:
> 
> On Sat, 21 Jan 2023 15:35:44 +0000, Rayyan Ansari wrote:
>> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
>> ---
>>   .../devicetree/bindings/display/simple-framebuffer.yaml   | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/simple-framebuffer.yaml: properties:width-mm: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/simple-framebuffer.yaml: properties:height-mm: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230121153544.467126-3-rayyan@ansari.sh
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
> 

I will remove the $ref property in v2, but I will also wait if there is 
any other feedback to address.

-- 
Rayyan Ansari
https://ansari.sh

