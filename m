Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEFFD1924D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 14:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535FF10E4DB;
	Tue, 13 Jan 2026 13:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="mZ6EEVYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAD310E4DB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:46:30 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dr9Wl230xz9tbf;
 Tue, 13 Jan 2026 14:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768311987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ruF/DsgLWD0LRXxihhCM3ESkEbVG3zR2tbPJGjW51E=;
 b=mZ6EEVYiZBBXdssndtpObyqnE1uihRU40kAdZos5gzlOWVPeu5Lq4cNGqaZgKTJ6p99jxz
 7DyKSFZxk5a3Jq/KRvd8AVUW0KtjzwRQHkIJpto/M+PWwKWXYwXP1xgiQu1obNaxunmqF0
 e1J4M0N+0znpD2GSehQI4mFwXtneGvZjD004PeWZ1k5eqWOO1dlGTk0PDc4nYKqRDR+DBp
 6QSKDeT+nDTR+Z4h7ugsUvH2iy1P1AZKRN/pE3k8KnqSqfcinYJ0XhuTpFNkYu8JOmAwtJ
 vnNKTNQHvYIk2qx02zy3RhtTSkpj9rjnS9EZfbLf6mKCS7mAlwnj/f7lwY8Axw==
Message-ID: <16413d54-ee02-4939-af51-d7f9ab0404f7@mailbox.org>
Date: Tue, 13 Jan 2026 14:46:21 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVGsfCTzSSjh474Ohimad2W5h1Z=vNhS6zU=Lb9f5Zbxw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVGsfCTzSSjh474Ohimad2W5h1Z=vNhS6zU=Lb9f5Zbxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 588823f942cb957b9f4
X-MBO-RS-META: nhcdrwhot3odx4wmekmq13qmg4s4teu5
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

On 1/13/26 10:13 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml
>> @@ -0,0 +1,32 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> scripts/checkpatch.pl:
> 
>      WARNING: DT binding documents should be licensed (GPL-2.0-only OR
> BSD-2-Clause)
>      #68: FILE: Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml:1:
Sigh, fixed in V2, thanks .

I'll send V2 in a few days to get some feedback on 2/2 first.
