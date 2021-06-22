Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F5F3AFBAD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 06:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B5C6E199;
	Tue, 22 Jun 2021 04:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680EC6E192
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 04:17:43 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id k5so11331084pjj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 21:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JZM6Q8vJXHp7Mr1v3JiA0bDju7mUR1U5h794eAQV5aw=;
 b=UIPqOBjy1eyoYO72vBZ6igOUbFKMBwnRVkLoQ6pVvLam5Nl79QNxK6nzpixJPNGvNY
 3uw1tqkaLkGzEfG/t3E2jN9Sa5BBQSbtly4Yp9c90RDfOFPpgx2kTr3dhSO4BROEN9Pj
 LV4XWmOdkkekB27C+bQ/HfSY+nHSB5mvAoaV+kU29/bvJnYv4QqC/ybjNKJrIuuC3uqG
 /tMawnBWXdOZ0deoNLqEJx6i7Xxfkr5/S0zolacngmc684FZzBIIa5qLx52IIF9gmjuA
 tENo/tzcDNMpMyh7xRFR4BZy2mVTYjXAXU4hHg2uRAHL3vHG0LLxaTZ7uzMgirlVfN/D
 l/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JZM6Q8vJXHp7Mr1v3JiA0bDju7mUR1U5h794eAQV5aw=;
 b=i2xO3sd8iQ7EhbLzSi6Ld9GhQdttU3tzdq3wnDYWoENLgrHVBe87Y3OHm8M2NJc6kP
 gad3GIxFW3pWKn7JRS0cUn4pQrOeYbU4jN6dAfi4APL7+FFWdCP2knNrXNenfjokGp/R
 eSIdLgp5ClNVqMIPEeqovW+4AqpxD9v5p36M7NtpIBWqTjB2GF9i4IXuwKYqCLS7TbX7
 G/OTjdXJYgeiIqbTOvfugfnY1KJN5Yx283jZpjVgs03RS2PyA8TJ+453JYdXHY19dZap
 RAKGmAQ3KYksOfs/DQsXsnMG1SwkjArkO0jwaL6eQOYgfOSZXF9EAOTKPO1u//wBhdqK
 OEJg==
X-Gm-Message-State: AOAM531AgJHHec8hhxvhLEwmRMrRWDnIIidXmBBf9UUsri+6PSRWE5h6
 hoetndL75xOQc23yElMPDbI1Cg==
X-Google-Smtp-Source: ABdhPJx84ffi7OI821n8zjaouu0FzA1+OoHfQ1z9QSqm0sGmqVyWEP/1AWzlHUSwFLQayzu+7vys2A==
X-Received: by 2002:a17:90a:4d86:: with SMTP id
 m6mr1645984pjh.44.1624335463047; 
 Mon, 21 Jun 2021 21:17:43 -0700 (PDT)
Received: from ?IPv6:240b:10:c9a0:ca00:5192:32ad:e5be:23cd?
 ([240b:10:c9a0:ca00:5192:32ad:e5be:23cd])
 by smtp.gmail.com with ESMTPSA id u1sm18863425pgh.80.2021.06.21.21.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 21:17:42 -0700 (PDT)
Subject: Re: [PATH 3/4] dt-bindings: display: Add virtual DRM
To: Rob Herring <robh@kernel.org>
References: <20210621064403.26663-1-etom@igel.co.jp>
 <20210621064403.26663-4-etom@igel.co.jp>
 <1624297202.341994.1161630.nullmailer@robh.at.kernel.org>
From: Esaki Tomohito <etom@igel.co.jp>
Message-ID: <d722105a-44f6-1b9c-d91c-d140b926f7c5@igel.co.jp>
Date: Tue, 22 Jun 2021 13:17:38 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624297202.341994.1161630.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Rob

Thank you for the error report and advice.
I will recheck DT binding.

Best regards
Tomohito Esaki

On 2021/06/22 2:40, Rob Herring wrote:
> On Mon, 21 Jun 2021 15:44:02 +0900, Tomohito Esaki wrote:
>> Add device tree bindings documentation for virtual DRM.
>>
>> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
>> ---
>>  .../devicetree/bindings/display/vdrm.yaml     | 67 +++++++++++++++++++
>>  1 file changed, 67 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/vdrm.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/display/vdrm.yaml:39:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
> 
> dtschema/dtc warnings/errors:
> make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/vdrm.example.dts'
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-extract-example", line 45, in <module>
>     binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
>     return constructor.get_single_data()
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 120, in get_single_data
>     node = self.composer.get_single_node()
>   File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
>   File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
>   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 731, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
> ruamel.yaml.scanner.ScannerError: while scanning a plain scalar
>   in "<unicode string>", line 38, column 15
> found a tab character that violates indentation
>   in "<unicode string>", line 39, column 1
> make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/display/vdrm.example.dts] Error 1
> make[1]: *** Waiting for unfinished jobs....
> ./Documentation/devicetree/bindings/display/vdrm.yaml:  while scanning a plain scalar
>   in "<unicode string>", line 38, column 15
> found a tab character that violates indentation
>   in "<unicode string>", line 39, column 1
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/vdrm.yaml: ignoring, error parsing file
> warning: no schema found in file: ./Documentation/devicetree/bindings/display/vdrm.yaml
> make: *** [Makefile:1416: dt_binding_check] Error 2
> \ndoc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1494913
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
