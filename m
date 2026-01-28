Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP4cJFSNemk37wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 23:27:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0060AA98D5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 23:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCECD10E129;
	Wed, 28 Jan 2026 22:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="M+H4V6EM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com
 [209.85.210.225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C148810E129
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 22:27:27 +0000 (UTC)
Received: by mail-pf1-f225.google.com with SMTP id
 d2e1a72fcca58-82310b74496so170414b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 14:27:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769639247; x=1770244047;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IIAgO8QkRYmg4NNs702q5Q7Jg79m8gPvL1WevdqMxmo=;
 b=PB86Tea/ij5GGdz9uN7+MkSH4DEfAqF1vMWIl7BemnZi+hvu3TgJP3YgvnWGEu175u
 wAqrndQ9hGSatN+NG8K9AIUmN5s3UmqZyUrFZYs7hkgjtNvQzVgXJ1B/0MENpsn+R/jx
 lY4qrLsi3XH74D7101VMmFD7W7Z+jW6i4VP58g+D6/q443svOfYc6FF6O4bWy+PesSz8
 xqAhIa5F+rPvFKaOXkALxJzz4HOhV2P7aw8rrAosSkrJyMXS93yk8DOFhXdY6hIHnH/T
 wF365I3jjbYI8lT8fva402v5Yv7sBvdUHkcuSucRrlXnpenRs+LBtn4hbf6fd+5FgOcy
 sQEw==
X-Gm-Message-State: AOJu0YzRFggXZqXom/dA9vMAO1Hfgxq0U/+iQRaKfyeU4D6saBcEjRKR
 Gq9NJzbLLVnC65YcNDTQksmva8ZRb9gMKZtdIMEpU3rJ1e7j8sPoNNN9izN7NWzYvs7vy5Vuq8o
 6KVaFVYIfqKqCxo6NE6ZjfXSOkqDKMKQTwwQnwwt2H8HRzBdVktjHDhadOmWxMPalNjIxFTCxQ1
 ZVF+OWg7r4V6HXyR30592/PQzCbmGNzrssDUv+8dP8ZUme7BKuV9wFvdU8uFOrKBMJxK2/Wa4bs
 9Tkh29Z5lRWreYbwmYpfSyPErfM
X-Gm-Gg: AZuq6aK8lIr3msw9O7orfRbd7Yo1tprouinFYqH8Vy84egI5zvfDWRKfMoJo8VtZ3gr
 QxtrwX4EKvVur2V7lQeOxsuA8K18vRLp9+AAP5LCVXIQwe1gDRxCyq1DpDL6EobHZRmOH8j4fYy
 CRUi0gWCaDqhpKTA9UKjB1DIdPNQr9+4OE/0t3DF4vpLsJ0aSBl7+7NjI1UNCWlxqlfmM8PrWKv
 XNt5w5yqhhOWNYXv7RsbZxBEhfFsuGBAdQXcshPevLlGGMPls2kZdrRvh5t0pDKgDO65Ixx/XqK
 NyZkD/r5fAUKRj4dzRZTb8bF8sR7nGyCFcdOKi5ppZ9BM2SqfixCoJu3mRQVEQpP8NX+e4hyCc6
 QqNaq33aLs4cYjCBhEqAshqLZuKr42Bwq/KV6dpkrsQDXj0kp2gCNQhmeDSbbKP6JrKuK0zX4cD
 J4ge4lbQRghJTEEs4o4XpVM+n77R37hBpPxKgn7ZdFmz28M8U=
X-Received: by 2002:a17:90b:2fc6:b0:353:2e1:95f6 with SMTP id
 98e67ed59e1d1-353fed9b1cfmr5096858a91.32.1769639247174; 
 Wed, 28 Jan 2026 14:27:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-353f610e029sm926613a91.2.2026.01.28.14.27.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Jan 2026 14:27:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-663005f0997so804502eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 14:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1769639246; x=1770244046;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=IIAgO8QkRYmg4NNs702q5Q7Jg79m8gPvL1WevdqMxmo=;
 b=M+H4V6EM7ho6F0Sxgx97hlEU2L5c61QuYCL90Twpwb9DwH21GlJpOq+2arC3LO0Njc
 wkm6kxEgYbDBtjGAO4VHQlcUZJF5TiRDTHLZ7S9DRRqgl3Sd6kOBahjiAu5NPptZ6eqM
 eFQUPUq0XCq9bwFQCOpe4lGSUPDW1CtMdal48=
X-Received: by 2002:a05:6820:810:b0:657:64ce:b40f with SMTP id
 006d021491bc7-662f202a4f9mr3874928eaf.4.1769639245661; 
 Wed, 28 Jan 2026 14:27:25 -0800 (PST)
X-Received: by 2002:a05:6820:810:b0:657:64ce:b40f with SMTP id
 006d021491bc7-662f202a4f9mr3874921eaf.4.1769639245274; 
 Wed, 28 Jan 2026 14:27:25 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-662f996216asm2174258eaf.6.2026.01.28.14.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 14:27:24 -0800 (PST)
Message-ID: <eeb09ca3-bc8c-4747-a6f5-29f15335c149@broadcom.com>
Date: Wed, 28 Jan 2026 14:27:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: Add V3D device node
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-dev@igalia.com
References: <20260114120610.82531-1-mcanal@igalia.com>
 <224913c8-52a6-4b3f-a375-e1b4fcc0c142@igalia.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <224913c8-52a6-4b3f-a375-e1b4fcc0c142@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wahrenst@gmx.net,m:bcm-kernel-feedback-list@broadcom.com,m:devicetree@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:kernel-dev@igalia.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,gmx.net,broadcom.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[florian.fainelli@broadcom.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[broadcom.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0060AA98D5
X-Rspamd-Action: no action

On 1/28/26 02:39, Maíra Canal wrote:
> Hi Florian,
> 
> Just a quick ping on this patch. Did you get a chance to review it?

Your patch is based upon linux-next rather than the Broadcom SoC tree, 
the devicetree-arm64/fixes branch is not merged into 
devicetree-arm64/next at the moment, therefore 
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi does not exist in 
that branch.

Give me a few days to figure out how to best deal with that.
-- 
Florian
