Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A676DB8AB3C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 19:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E216B10EA7B;
	Fri, 19 Sep 2025 17:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="gDww7CMe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="q0UMN9yE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FC310EA71
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 17:08:32 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cSzVR3Vm0z9tLf;
 Fri, 19 Sep 2025 19:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758301711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J2ZWKu3JwxJ6IWx9tofvZbH5SZUcjYN6EjvalhWvPPU=;
 b=gDww7CMe78vL3JIg3cFzVYrI6w2Rn5M8L+d0zAFj57s705bgUrLOvbhfw08LhXpg6LQwBJ
 zH9kGo4SOpBPRozyHAMFo5yyRfuiN9eG/MqtAcjYdtjpdop3LIilrGZpjTVB3nnE8eig4N
 SjQpyMqjQ/WuuCmJt2VPvEIOlCbtz0pa0bHYnF4Tf1VKC2az8nI3TeaTYJ/vPY8sBWLydK
 D2doCSWZRN12O+nMVVtJqdnfc1nEHiY+dNFzuKg4Va3lY7QdmSrHKxS2dUfCWbXQ6v8pVP
 wVseYQuTD6z5X5SUuee5TSUwsdmB+PZG5Lx53FKq3jYKWGWGC997fKAGyVTz+Q==
Message-ID: <14e5da7c-c6ce-4bb6-884b-08629f5a5788@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758301709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J2ZWKu3JwxJ6IWx9tofvZbH5SZUcjYN6EjvalhWvPPU=;
 b=q0UMN9yEoztCvz9iAInz9hozypzMnaRG17lIYNqM9b+jgVHLSpBwaBYO6uxVJEJUpkgBbA
 gjry1kL1vF6QBYcS4LZn03wREZpnO69XW7fUNs8/0bxvatL4zFEpQdXRM9fyECpfjq4PVo
 c5NuNIQsfWM7uW/PzS/QC7XtMZhb1cJW4FgArU+hEQRUlNnSkVx89Cc/c9K9r+pHr7M/ti
 WBley3GOD9L2XbLoi/mXNvrwxiguDZPxO9t9D6RZhnHINQcWPDgpzCQDnidWo6GB9fUso8
 QgtRXWvTVdrRTUJlzgaF/lOvs83l+UlkkcHCvBihFbN/TbMKKq9LHCKhmhfAiA==
Date: Fri, 19 Sep 2025 19:08:25 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
 <4ffcf4fc-17a9-4669-af07-f81ddb46aee9@ideasonboard.com>
 <d76ff19c-7b0f-4aa9-8ae2-d08c82d70410@mailbox.org>
 <aebc10ec-73ed-4843-95c5-9ba5a2759ccb@ideasonboard.com>
 <b4c0e78a-eecb-4a18-9199-18ea91c8df31@mailbox.org>
 <2da374d1-7557-4f7e-9160-86945b73731a@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2da374d1-7557-4f7e-9160-86945b73731a@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 73b788f17a3683731cf
X-MBO-RS-META: 6b3g8y3chq1jeobr3c86xc3tixy8p1cp
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

On 9/19/25 7:03 PM, Tomi Valkeinen wrote:

Hello Tomi,

>>> Ok. My point was just that the dsi-controller.yaml doesn't allow
>>> "bridge" node (you can just rename the panel to bridge to test). I
>>> thought someone (I just can't remember who was it =) will send a patch
>>> for it, but I think that hasn't happened.
>> Do you want me to drop the bridge part from the commit message (I assume
>> yes) ?
>>
>> Any other change I should do before sending a V3 ?
> 
> As we found out, this has been fixed in linux-next. For this, and the
> rest in this series:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Understood, thank you.

-- 
Best regards,
Marek Vasut
