Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ILcDBijemlS8wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:00:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888D1AA10F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBAF10E223;
	Thu, 29 Jan 2026 00:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="hTeo5Omw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com
 [209.85.215.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F4E10E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:00:19 +0000 (UTC)
Received: by mail-pg1-f226.google.com with SMTP id
 41be03b00d2f7-bc17d39ccd2so134490a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 16:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769644819; x=1770249619;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CM+wwJXObGbyyxl1sES3pJglJ/lxO2VMKG5c9djxeeM=;
 b=ftVgio+ghsKP43AyPlEuq+E0PI43s7eBGmO3fyFXSru6CZK/xfPRmH86/6aJB429yH
 O2SydlKffjN9RzZL8A6ZpIVk/PPHlZmb3grmFNsbXTRfrBdDLAttOu20OkHwKauQCztP
 y5ply7j5lUv4vZ4Pb4bPuHJ3tHELrZGB9GesiiG1d89nZC+JVf/Qf6ctLCFfVdDsrrPt
 0YTl/Tr0v2yCusgfdjuimfhY9GN/8AB/WWl9mfyq74pQBjMm03m4Hv0K2oTYLupaFBQv
 eMUOdHPhH3y1wHA95xbVlAEDqVLpA/WRoVlbSN7wtWg1NclTj2aSAxo0TG+yW9dn9BqA
 8TAw==
X-Gm-Message-State: AOJu0Yxa6hfC/7NSbBDb/lLNKTihUftU6RL4p8YMeFgeeKP++F35Uewe
 zMxA2DNQLoP2HtM+qbRzhqu0f4kV+mauK4+bS5PEVevQFP0Uy7SsKzvgIycUyznZfX6jH15yFdS
 YMbr18EWn07lt9UqhTdseBhrymzGN/UigAZRyUXcCeonnywhbny20MH2gztoJDwUtUv9oUqM++d
 7sP8Ss9pVddy/NgJD1LjXL98PNQDq4XSx7wNzsNSIFL6Yqd1itQIexcaAxaTnvA2AB2guDsdIEc
 sx3PFTNgD6ksjtozCDWTe1E12cm
X-Gm-Gg: AZuq6aJqRwRxwzcV/V5TQ0rzlGEZHNG+ykmUgmIIF3tJQchwiLqPJR/ElIEK1PEKX4E
 +Der4e2oHb7am0ppYF0Je90QL8+ZjkEkfs3tpMEQ+9bTKc3XV2BHvviA/lyf1++ybGzSYssq2bO
 yUes5ZChdQrBmmUGauiuRT4g7CJO2ezvTZ77jXEsJKAzVaemkIlOkPc8Z6GJhcSqjl325YG5oIR
 VK4UFGfzzSTtZLgrT/UyVHXnXayNqUm30n1Q0M5htuA35suYxomPRrlyl3gx7B3Z2Zii9SCvqB0
 7p6c9aEb0d0N4i6Gk8ICNsbNLc2UxtxmKnZlL5pz/xsf7RchrNop7qrusJ7FexcPPI7rQfH111C
 ogbf6nuUd4W1GkYxSwgvi40vENS9T4riDOiivT5Q7qM93r0O8WLcxCW3dnZLqX0QIqow26ajLtc
 OoVe0IND1P29IqLw+v5bgxELlEYvNlTus7aEBFhm4MeEOO7Ds=
X-Received: by 2002:a17:90b:374e:b0:343:684c:f8ad with SMTP id
 98e67ed59e1d1-353feccf56dmr4810581a91.4.1769644818762; 
 Wed, 28 Jan 2026 16:00:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-353f6299478sm992975a91.6.2026.01.28.16.00.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Jan 2026 16:00:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2b724ff60e6so543692eec.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 16:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1769644816; x=1770249616;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=CM+wwJXObGbyyxl1sES3pJglJ/lxO2VMKG5c9djxeeM=;
 b=hTeo5Omw3m9aP8CXW3ksFQDNbd9NkDwzg1yQ7p+ahV8z6t79eBnk07ol/rhu23ofl0
 BPAet/euiG7CxDADMgAo4JGtONq2t6bNk+qlAYWccctrkSuvaBAfPPHoMQcpWTfG0MqC
 jYtT9EcsVlDPn0YNK4Cj7V3c9AEhaHyYGPa4w=
X-Received: by 2002:a05:7301:fa8b:b0:2b6:c617:f79d with SMTP id
 5a478bee46e88-2b78d8a51admr4078338eec.13.1769644815821; 
 Wed, 28 Jan 2026 16:00:15 -0800 (PST)
X-Received: by 2002:a05:7301:fa8b:b0:2b6:c617:f79d with SMTP id
 5a478bee46e88-2b78d8a51admr4078297eec.13.1769644814660; 
 Wed, 28 Jan 2026 16:00:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b7a17083dasm5897428eec.14.2026.01.28.16.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 16:00:14 -0800 (PST)
Message-ID: <31760619-f86a-4737-8191-198aecbc82de@broadcom.com>
Date: Wed, 28 Jan 2026 16:00:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: Add V3D device node
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-dev@igalia.com
References: <20260114120610.82531-1-mcanal@igalia.com>
 <224913c8-52a6-4b3f-a375-e1b4fcc0c142@igalia.com>
 <eeb09ca3-bc8c-4747-a6f5-29f15335c149@broadcom.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <eeb09ca3-bc8c-4747-a6f5-29f15335c149@broadcom.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wahrenst@gmx.net,m:bcm-kernel-feedback-list@broadcom.com,m:devicetree@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:kernel-dev@igalia.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[florian.fainelli@broadcom.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,gmx.net,broadcom.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[broadcom.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:mid,broadcom.com:dkim]
X-Rspamd-Queue-Id: 888D1AA10F
X-Rspamd-Action: no action

On 1/28/26 14:27, Florian Fainelli wrote:
> On 1/28/26 02:39, Maíra Canal wrote:
>> Hi Florian,
>>
>> Just a quick ping on this patch. Did you get a chance to review it?
> 
> Your patch is based upon linux-next rather than the Broadcom SoC tree, 
> the devicetree-arm64/fixes branch is not merged into devicetree-arm64/ 
> next at the moment, therefore arch/arm64/boot/dts/broadcom/bcm2712- 
> rpi-5-b-base.dtsi does not exist in that branch.
> 
> Give me a few days to figure out how to best deal with that.

Rebased devicetree-arm64/next against v6.19-rc5 and took your patch, thanks!
-- 
Florian
