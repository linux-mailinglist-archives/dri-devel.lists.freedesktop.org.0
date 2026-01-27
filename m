Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCGxB/R0eGnEpwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:19:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0869101F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B368A10E4DC;
	Tue, 27 Jan 2026 08:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U7dgNeZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B768C10E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 03:49:09 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2a871daa98fso338555ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769485749; x=1770090549; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yb1Nq1niVrBkwwiP9/q6su3kaXasPkEK3PLxjn0erUA=;
 b=U7dgNeZbUtXmVpHmwBlh5ImiB4Au6L8Phe8xvHuQj7z6L6bEi7Y43GR8HeMlmxtvwG
 15Z4jCjST8fuWBKTesMQP0UZR5kimT0DXbbUIqB9gYQLJQD/BaPkMMMz0yJCm92zbnJY
 MQviED56BuaUEwuHMuosDZp9yHcd7MqjbxfNVrLEyOA5JqQfhOf/uZYkfZ1s0bYRzQWl
 BME/OJRr0A81d0+32OSO3Moi879wHqcTHbc/up6tGAK4swUT5Fwj7PzpOQp+VbFAy1sk
 hE9Wv7fs71i9wcmU6/dale0Fdme/+0RfKZQrCEA16/NC2Jp20a+9Df18tL3XL5Jcrydv
 S6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769485749; x=1770090549;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yb1Nq1niVrBkwwiP9/q6su3kaXasPkEK3PLxjn0erUA=;
 b=jkQZnKXIktY3jWZ5BHACtP5ckSlaSlUHCxnds23wCIht/dt33QyoEdg9wfrYZhbDhA
 rhKly+qhUE1Cy8xBPgXQwIbqFBKpRfb4puDkCdh0Fu1yhDp0MggmEhiH2vmp9gQ7Q7k1
 7d93mXhI+xOEJWl0wbUb7FL+9fxedkMukP63hpgsdF3Psvn48dEONaCohph1iT3qeN5i
 YcmzGYgA4Doyfs5cjPTBmwmOdl+qaJXsuZ3zQy6FfECkFgLgl0Qi7CSLgUsNV47X0D/3
 tQ9H3RgwCbhMs2P01k0e0bT6bapSVakn/oXkZ5EyW8ym0O+jQqkXyRTwB4YUvumnnm9L
 XftQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWipoWr+qmoXXXL5T+o0ShcUMtoEMet9xk7oLN6R3G4/uq0b1RshOChVG3BgwW+kXXvt40t3y93EHA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9yZUjbozGZggkibCHl6m/nf/rmv3ip+j4hfz/z8VSmdcOV2y0
 Q2gfeKoEqG08MtjgXWlac2nMh9zT3rETcg7bzFo0AK0w396cIHUmepd+oA+PTrNX
X-Gm-Gg: AZuq6aIBnz1qNvXomzSacnEh+Ldl6oTYZghmQkuIrdjMqRT/f83DqjtA0i6uMkMckHy
 hjkC97hkvDRbCIxkTQKvmuvG6xRc3cG3BhN7YS+Q6cg/XqmKNG0h5h1vPDIki40HRfouFWOSDXX
 9X1UFjWVDkSkKPdlUxSMvpI4ohMNcnRDKFmSGfeSbxyccQ6Z/iS2+Z7uE3zItyp2GXSpos3YiKw
 l+GheCUMmnyDBTP/5do3EyVee+hnyVeysTwBZbJPiEpU1OjgsuFt2UgWFvRbW54OY1ozY0nblXu
 HN+DuCXhCtP/xUJkd0gTtj3ZCMRs3RPqNmLx0nO0T9r1KP6Ga9lBBTX1xSodyN/Yl45VzAzizAU
 AFU08fCTr3Vtej01Q3AZd22Ol7lEt0LgfyOPnF30RCmTRZh/hxrblj/E/9LzSPhrWFKV3fR0OZR
 19uoKVFamvtLIuue8GB6zKV8j3PtK34LB1QrjnAb5DnybUBDq41VzjhwHm8aykgSSq
X-Received: by 2002:a17:903:2446:b0:2a7:5a42:fb5a with SMTP id
 d9443c01a7336-2a870df8badmr4535355ad.55.1769485749126; 
 Mon, 26 Jan 2026 19:49:09 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a802f978c7sm102191145ad.65.2026.01.26.19.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 19:49:08 -0800 (PST)
Message-ID: <036b4874-a7d3-4523-bf1f-3256bbef64db@gmail.com>
Date: Tue, 27 Jan 2026 11:49:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: nuvoton: add MA35D1 DCU binding
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, schung@nuvoton.com, tzimmermann@suse.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com,
 linux-arm-kernel@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 yclu4@nuvoton.com, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 mripard@kernel.org, simona@ffwll.ch, krzk+dt@kernel.org
References: <20260126085727.2568958-1-a0987203069@gmail.com>
 <20260126085727.2568958-2-a0987203069@gmail.com>
 <176942345650.1493690.6680592088886642042.robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <176942345650.1493690.6680592088886642042.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 27 Jan 2026 08:18:47 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:linux-kernel@vger.kernel.org,m:schung@nuvoton.com,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:linux-arm-kernel@lists.infradead.org,m:maarten.lankhorst@linux.intel.com,m:yclu4@nuvoton.com,m:airlied@gmail.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:krzk+dt@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,nuvoton.com,suse.de,kernel.org,lists.infradead.org,linux.intel.com,gmail.com,lists.freedesktop.org,ffwll.ch];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,2.102.81.160:email]
X-Rspamd-Queue-Id: AB0869101F
X-Rspamd-Action: no action


On 1/26/2026 6:30 PM, Rob Herring (Arm) wrote:
> On Mon, 26 Jan 2026 16:57:25 +0800, Joey Lu wrote:
>> Add Device Tree binding documentation for the Display Control
>> Unit (DCU) found in Nuvoton MA35D1 SoCs.
>>
>> The DCU is a DPI-based display controller supporting RGB output
>> with optional external bridges or panels.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 74 +++++++++++++++++++
>>   1 file changed, 74 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.example.dtb: /example-0/display@40260000: failed to match any schema with compatible: ['nuvoton,ma35d1-drm']
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260126085727.2568958-2-a0987203069@gmail.com
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

Thanks, I'll fix the YAML binding issues in the next revision.

Joey

