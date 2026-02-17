Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNloI+gulGnQAQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:03:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F9914A2A1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955AF10E0FD;
	Tue, 17 Feb 2026 09:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CtfYHGR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4068910E0FD
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771319008;
 bh=9GbJRlEzOKhvUfPYVZkq7x2pTPJxlFsurchmoJs+GK4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CtfYHGR2qb6+VbmtAWTPsiAJVFmA0YWByKmTGWIgnyD7Gr1gBMN2y/7VQg2FJHKYj
 SSEPSuC2goNPL+OBycqn7GTaBjGkWc6e9RRUo6zIiy5EXHHCZWf9z2zvuZuC8OipRa
 9v8sgckzmoMj0cSVLVheSHYY+qj1qhxVTkd37GJirm06XMd5TRPaJy9OzHWF3gWP32
 GcvC7wYo72tXDlePRa4lJZWYeUspU+ZGT9rV7kloqL1h59Bb5gXI1axSuLKG0GKV04
 IwM8VMAiR/Ynm9rtP8lWKYok+PVG6V6jhEGGhzu5G9BQncbySjGW5b0i+H16X4pncK
 wp7T3YvEscqVQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E9D3717E0C21;
 Tue, 17 Feb 2026 10:03:27 +0100 (CET)
Message-ID: <04a3d18b-80cc-4d1d-8657-cb35c4b5b797@collabora.com>
Date: Tue, 17 Feb 2026 10:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <cover.1771258407.git.l.scorcia@gmail.com>
 <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
 <20260217-stereotyped-dazzling-loon-f06e18@quoll>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260217-stereotyped-dazzling-loon-f06e18@quoll>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chunfeng.yun@mediatek.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:jitao.shi@mediatek.com,m:fparent@baylibre.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:lscorcia@gmail.com,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,pengutronix.de,gmail.com,ffwll.ch,linux.intel.com,suse.de,mediatek.com,linaro.org,baylibre.com,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E2F9914A2A1
X-Rspamd-Action: no action

Il 17/02/26 08:58, Krzysztof Kozlowski ha scritto:
> On Mon, Feb 16, 2026 at 04:22:14PM +0000, Luca Leonardo Scorcia wrote:
>> Remove the dedicated "mediatek,mt8167-dsi" compatible from the device list and
>> describe it as compatible with mt2701 instead. It is safe to do so because:
> 
> You are not doing what you wrote. The dedicated mediatek,mt8167-dsi is
> still there.
 >
> And if you want to describe mediatek,mt8167-dsi with OTHER
> compatible (mt2701), it is a NAK. It is wrong and not allowed by writing
> bindings doc.

Sorry, that was my apparently very-bad advice - and I recognize that, as a
maintainer, I should have given different advices.

Still, check below the (bad, and not enough) reasons why I said that....

> 
> You just added fallback, didn't you?
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
> 
>>
>> - Bootloader doesn't rely on this single compatible; and
> 
> Does not matter. You still CANNOT remove a compatible. If bootloader
> starts to rely on this single compatible, you add it back? No.
> 

The issue here is that "mediatek,mt8167-dsi" was never used anywhere, and that
alone makes zero sense as it is - by hardware - identical to mt2701.

That, leaving alone the fact that nothing anywhere can make use of a node with
just `compatible = "mediatek,mt8167-dsi"`.

If it is not acceptable to remove something that was never used and should've never
been there "alone" without fallbacks, it's ok. I'm sure that avoiding to delete the
one line is not a big deal there.
Also remember that we are talking about an old SoC that will never see a bootchain
overhaul, nor will it see new bootloaders.

Though, just a small note - please please please: when we see new contributors,
especially when they're community ones, can we try and encourage them to do the
right things, and follow the right processes, without being harsh in any way?

And P.S.: Yeah I know you haven't been as harsh as you can (rightfully) be, so
thanks for that.

Luca, I'm sorry again, at this point - it would be great if you could please send
a v3 without the removal of that line. Just add the fallback and that's it :-)

>> - There was never any upstreamed devicetree using this single compatible; and
>> - The MT8167 DSI Controller is fully compatible with the one found in MT2701.
>>
>> Fixes: 8867c4b39361 ("dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC")
>>
> 
> There is never a blank line between tags.

Yeah, agreed.

Cheers,
Angelo

> 
>> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>> ---
>>   .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml   | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> Best regards,
> Krzysztof
> 

