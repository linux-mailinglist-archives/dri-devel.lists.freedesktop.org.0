Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5F3A0728B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 11:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C61E10ED37;
	Thu,  9 Jan 2025 10:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XKlxXs8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846FB10E45B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 10:15:24 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-385f07cd1a4so453540f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 02:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736417663; x=1737022463;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K/237DEZbmH5wVGbwoVnyMud2QLf/nwVGF7QU7PyuRI=;
 b=XKlxXs8OyI8pfH9p2JvNQhlD4XN5hVc0KLs2IEUf9fdsAljaJGMoUE0iEpmnPCNGw7
 Qk4lYuPk5q8cXYf853imm9f6oQaAV7aD2eh3bgFjuKiGOOB2mR/97EfDi6+0IORtvQT9
 Tm40Q8y2tIRGqKp1TcVHs2H/NajASaYqheJW5ZGtOr6jO1RGlQgrw3OE+9rC3M8QWP2X
 n03mSOlQjMCFI5lZllpiIs6EyHJIBp2nUOe4UHXF0mO9VLQuR53UpH//dHEHTt0W4Gwx
 r5UgK8rNdcECnESem42IxyRb3W3vePZKkhspLWmeGxzAdj2DDdviFVbUzHOs/lJHLklL
 iwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736417663; x=1737022463;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K/237DEZbmH5wVGbwoVnyMud2QLf/nwVGF7QU7PyuRI=;
 b=IyJtoBBY3nry4DaC5+hIY9e69ye9VzciYt8zv/aGSuPk/lrMfy+yoRCyxmYzTp1fS3
 26TpM8rexe2SIEd5BvA9wOF4rytqXlT17eI29TaHEhG8eKBupiqHzQub6pmmXFs8LptR
 olxx/MkO/Bboa29c6HoGxpGq8ujw/hru+l4nctaAoifPrymQhG0GAhfkAp1O8ld44Kja
 9PrY/+nKCz9kJM0CGAkx+BV4DxJjbF//tuZleZfHlrykfgebRihH0lJG3x7e0XYFdlVK
 3tPAqUNcmxywJeaafy3L5atv/rAYzJuj5MnqAv/hCOee5f36aolkt9yY2mD7+fjTdL1k
 0E6A==
X-Gm-Message-State: AOJu0YxSrGoL3t5hDKmoq+ud1x6YeNwenxsjL5qEkYR0v9+XbmNs8Qje
 fMLvIMs7cF4t0fKm75Lc9p4oWHSMaiLO2bMik3d45M+CJsSTqAtZvk0YKtT21cQ=
X-Gm-Gg: ASbGncupg3bmReqzgifCtrq5dPGCnvIip4p0ENCo1rH/C2BMS3OyrTzCMb7UioVE0Ct
 ssqhDWUtokKDDUL9OguZbUft/KzEhkS6M+aD18pyXyneCiLlK5y4dpgX8XrgeL39NM5a0hx7lec
 wgsCEe/NxEXM03AwW5JTEK1UwMuVy4FZeSuUSU7sNdTjXkR3lSU8TzfgZRXxEhrvWWv6RBSMOMy
 NGFBvPM7ye92CJshG0mKpmnGiLH2hiJM42xbqmgDCa/MDQ2cCP+x8jTL6/RvU1UR0Ayondjfl1C
 iI2+yNKROC28s+qNlfnhCSnNog==
X-Google-Smtp-Source: AGHT+IEa1wvdA0r/Kzit2T66VOFD1pdDd/5gF4arR5cyzXkaJB7nZQwlEb/rszXxagpeRJrAJKWCbw==
X-Received: by 2002:a5d:5f85:0:b0:386:3213:5b9b with SMTP id
 ffacd0b85a97d-38a8732c132mr6080751f8f.43.1736417662676; 
 Thu, 09 Jan 2025 02:14:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:125:358f:ea05:210e?
 ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8209sm1384847f8f.70.2025.01.09.02.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 02:14:22 -0800 (PST)
Message-ID: <5b891e04-be1e-490c-aebc-84c0ce2e3611@baylibre.com>
Date: Thu, 9 Jan 2025 11:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] arm64: defconfig: enable STARTEK KD070FHFID015
 panel
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
 <20231023-display-support-v5-5-3905f1e4b835@baylibre.com>
 <00af138e-4e00-49e7-945f-9c6e489208b9@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <00af138e-4e00-49e7-945f-9c6e489208b9@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, fixed for v6

On 09/01/2025 08:54, Krzysztof Kozlowski wrote:
> Squash the patches. It's one logical change to bring config optiosn for
> display on your boards. Not each change per one symbol.

-- 
Regards,
Alexandre
