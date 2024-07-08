Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408FB92A73F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 18:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAC810E3A3;
	Mon,  8 Jul 2024 16:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="rXOCARO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311BD10E3A3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 16:24:51 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5776C887D1;
 Mon,  8 Jul 2024 18:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720455889;
 bh=zUULNVojGptCWtPVxs+eXicSamISZThFxxUZa0HSZpA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rXOCARO2PtRFuUu8pxRp+fcq5/BOkRU+FlQqVGeMPDOIc/zZjfqDhHoTh/P7FBx8P
 yekFiWsXcp/5H1LnmZUcoP1qIU57ow/1LKYu1n4D2s2le7VMpeuaKeV8vlOAlIDs/u
 Z7QchiKwi9Ozq8kUaKLEVCCcyLaRYnq/cWW/q4kpCkGq0DfugNwPXndMesYV4bL5H2
 0bSwM5cwCV7rt7PqNkS6czG1S4YoH/PvrmWfHD6V0ghJdkq7P4kNWX+jp+vsDc4ynB
 IDtxy6elZBhTahjXinTuNdL8Aqshllme4UDXS6Cnsr7fqFpU9VkVoIS/eWzHoM3/73
 AJrhaXdKl7pTw==
Message-ID: <1921604a-c4c5-440c-9d9b-90169a556062@denx.de>
Date: Mon, 8 Jul 2024 17:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: bridge: ti,sn65dsi83: add
 burst-mode-disabled
To: stefano.radaelli21@gmail.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "Noah J . Rosa" <noahj.rosa@gmail.com>
References: <20240708151857.40538-1-stefano.radaelli21@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240708151857.40538-1-stefano.radaelli21@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 7/8/24 5:18 PM, stefano.radaelli21@gmail.com wrote:
> From: Stefano Radaelli <stefano.radaelli21@gmail.com>
> 
> It allows to disable Burst video mode

Why would you want to disable burst mode ? This is the energy efficient 
and recommended mode, why disable it ? Details please ?
